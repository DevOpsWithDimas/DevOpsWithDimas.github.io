---
lang: gitlab
catalog_key: gitlab-ci
title: "Settings up Gitlab CI (on-premise)"
categories:
- git
- gitlab
- gitlab-ci
refs: 
- https://docs.gitlab.com/runner/
youtube: 
image_path: /resources/posts/gitlab-ci/03c-setup-gitlab-ci
gist: dimMaryanto93/d92bd18da1c73c230d7762361f738524
downloads: []
---

Hai semuanya, di materi kali ini kita akan membahas tentang Setup environment for Continues Integration (CI) menggunakan Gitlab CI di on-premise. Ok karena artikel ini akan lumayan panjang jadi kita akan bagi2 menjadi beberapa bagian yaitu 

1. Requirement and prequisite
2. Arsitektur
3. Setup & Konfigurasi software
    - Install gitlab
    - Install & setting docker engine
    - Install gitlab runner
    - Register gitlab-runner to gitlab
4. Tryout Gitlab CI script

Ok langsung ja kita ke pembahasan pertama yaitu

<!--more-->

## Requirement and prequisite

Untuk menggunakan Gitlab CI ada beberapa hal yang perlu kita siapkan diantaranya minimal 2 virtual machine dengan specifikasi seperti berikut:

1. VM Gitlab

    ```yaml
    vcs_repository:
      os: Linux Distro
          distro: Ubuntu Server
          vesion: '>= 20.04'
      hardware:
          cpu: 4 CPU
          memory: 8GB
          storage: 250GB
              partitions:
                  - name: /
                    size: 75 GB
                  - name: /var
                    size: '>= 150GB'
              type: LVM
      networks:
          - name: private ip
            ip4: 192.168.88.101/24
            gateway: 192.168.88.1
            dns: 
              - 8.8.8.8
              - 8.8.4.4
      firewall-cmd:
          - name: SSH
            port: 22/tcp
            policy: allow
          - name: Gitlab Repository
            port: 80/tcp, 443/tcp   
            policy: allow
      packages:
          - gitlab-ce
          - OpenSSH-Server   
    ```

2. VM gitlab-runner + docker

    ```yaml
    workers:
      os: Linux Distro
          distro: CentOS
          vesion: '>= 7.9'
      hardware:
          ## sesuaikan specifikasi hardwarenya dengan kebutuhan build
          ## karena ada beberapa bahasa pemograman membutuhkan lebih dari 4GB RAM dan jumlah cpu
          cpu: 2 CPU
          memory: 4GB
          storage: 70GB
              partitions:
                  - name: /
                    size: 20 GB
                  - name: /var
                    size: '>= 50GB'
              type: LVM
      networks:
          - name: private ip
            ip4: 192.168.88.102/24
            gateway: 192.168.88.1
            dns: 
              - 8.8.8.8
              - 8.8.4.4
      packages:
          - OpenSSH-Server
          - docker-ce
          - gitlab-runner
    ```

Untuk membuat virtual-machine temen-temen boleh menggunakan hypervisor provider apapun misalnya; Oracle VirtualBox, VMware player, qemu dan lain-lain. Kalo saya sendiri menggunakan proxmox yang saya install di PC dengan spesifikasi seperti berikut:

```yaml
proxmox:
  os: Proxmox 7.8
  hardware:
    cpu: Intel core i9-9900 (8core 16thread)
    memory: 64GB
    storage:
      SSD:
        size: 1TB
        partitions:
        - name: lvm
          size: 200 GB
          format: proxmox os
        - name: lvm-thin
          size: 600 GB
          format: LVM Thin
  networks:
    - name: Microtik RouterBoard RBD52G
      ip4: 192.168.88.1
```

Seperti berikut:

![proxmox]({{ page.image_path | prepend: site.baseurl }}/proxmox.png)

## Arsitektur

Okay sebelum kita install software-software tersebut kita lihat dulu secara architectur yang digunakan agar kita bisa memahami flownya, yaitu seperti berikut:

This diagram shows how runners are registered and how jobs are requested and handled:

{% mermaid %}
sequenceDiagram
  participant GitLab
  participant GitLabRunner
  participant Executor

  opt registration
    GitLabRunner ->>+ GitLab: POST /api/v4/runners with registration_token
    GitLab -->>- GitLabRunner: Registered with runner_token
  end

  loop job requesting and handling
    GitLabRunner ->>+ GitLab: POST /api/v4/jobs/request with runner_token
    GitLab -->>+ GitLabRunner: job payload with job_token
    GitLabRunner ->>+ Executor: Job payload
    Executor ->>+ GitLab: clone sources with job_token
    Executor ->>+ GitLab: download artifacts with job_token
    Executor -->>- GitLabRunner: return job output and status
    GitLabRunner -->>- GitLab: updating job output and status with job_token
  end
{% endmermaid %}

**GitLab Runner**: The application that you install that executes GitLab CI jobs on a target computing platform.

- **runner**: The agent that runs the code on the host platform and displays in the UI. If a runner is registered with the same token, the runner could represent a collection of runners and runner managers.
- **runner manager**: A type of runner that can create multiple runners for autoscaling. Specific to the type of executor used.
- **runner worker**: The process created by the runner on the host computing platform to run jobs.

GitLab Runner implements a number of executors that can be used to run your builds in different scenarios.

1. **SSH**, is using Connect using ssh protocol to execute jobs
2. **Shell**, is a simple executor that you use to execute builds locally on the machine where GitLab Runner is installed. 
3. Hypervisor (VirtualBox, Paralles), is using VirtualMachine manager to execute the job
4. **Docker**, GitLab Runner uses the Docker executor to run jobs on Docker images.
5. **Kubernetes**, Use the Kubernetes executor to use Kubernetes clusters for your builds. The executor calls the Kubernetes cluster API and creates a pod for each GitLab CI job.

Tahap selanjutnya temen-temen bisa pilih salah-satu, klo saya sendiri lebih sering menggunakan Docker executor sebagai main gitlab runner executornya so jadi kita bisa langsung install.
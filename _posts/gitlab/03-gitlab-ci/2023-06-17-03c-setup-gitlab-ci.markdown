---
lang: gitlab
catalog_key: gitlab-ci
title: "Settings up Gitlab CI (on-premise)"
date: 2023-06-17T21:12:16+07:00
categories:
- git
- gitlab
- gitlab-ci
refs: 
- https://docs.gitlab.com/runner/
youtube: 
image_path: /resources/posts/gitlab-ci/03c-setup-gitlab-ci
gist: dimMaryanto93/fd40c02b1cc0d4eccb7c03103397591b
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

## Setup & Konfigurasi software

Untuk gitlab intances, kita bisa menggunakan Gitlab SaaS (online) atau on-premise (local). Untuk installasi gitlab on-premise kita bisa menggunakan yang sebelumnya jadi kita bisa skip atau bisa lanjutkan ke proses install gitlab-runner.

Untuk installing gitlab runner kita bisa menggunakan Linux Repository distribution yaitu dengan menggunakan perintah berikut:

{% highlight bash %}
sudo yum install -y vim git tmux curl wget net-tools
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | sudo bash && \
sudo yum -y install gitlab-runner
{% endhighlight %}

Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository. Install the `yum-utils` package (which provides the `yum-config-manager` utility) and set up the repository.

{% highlight bash %}
sudo yum install -y yum-utils && \
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
{% endhighlight %}

Install Docker Engine

{% highlight bash %}
sudo yum install -y \
 docker-ce \
 docker-ce-cli \
 containerd.io \
 docker-compose-plugin
 
sudo systemctl enable --now docker
{% endhighlight %}

Setelah itu pastikan configurasi selinux di update menjadi permissive dengan mengedit file `/etc/selinux/config` untuk property `SELINUX=enforce` menjadi `SELINUX=permissive` dan kemudian restart.

Jangan lupa tambahkan rule pada firewall seperti berikut:

{% highlight bash %}
firewall-cmd --zone=public --add-masquerade --permanent 
firewall-cmd --zone=public --add-port=2375/tcp --permanent
firewall-cmd --reload
{% endhighlight %}

Setelah di install docker dan gitlab-runner package, kita Register gitlab-runner ke Gitlab Repository ada pun yang harus di perhatikan adalah

1. Registered as Global
2. Registered by group
3. Registered by project

Pilih yang mana? ini tergantung dari kebutuhan ada yang ingin semua project pake gitlab runner brati kita register sebagai Global (Menu `Admin -> Runners`), ada yang per project (Menu `Your project -> Settings -> CI/CD -> Runners`) jadi kita pilih by project. Karena disini saya mau general kita pilih yang Global. yang kita perlukan adalah `URL` dan `Registration token` seperti berikut:

![gitlat-runner-registery]({{ page.image_path | prepend: site.baseurl }}/gitlab-runner-register.png)

Sekarang kita register, gitlab runner agent ke gitlab dengan menggunakan perintah berikut:

{% highlight bash %}
export GITLAB_URL='<your-gitlab-ip-or-domain>'
export GITLAB_RUNNER_TOKEN='<your-gitlab-runner-token>'
export GITLAB_RUNNER_EXTRA_HOST='private.nexus-registry.docker.local:<ip-nexus-oss-server>'
export GITLAB_RUNNER_DOCKER_VOLUMES=( "/certs/client" "/cache" )

sudo gitlab-runner register \
-r=${GITLAB_RUNNER_TOKEN} \
--name=gitlab-runner-docker-executor \
--non-interactive \
--url=${GITLAB_URL} \
--clone-url=${GITLAB_URL} \
--executor="docker" \
--docker-tlsverify=false \
--docker-image="alpine:latest" \
--docker-disable-entrypoint-overwrite=false \
--docker-oom-kill-disable=false \
--docker-extra-hosts=${GITLAB_RUNNER_EXTRA_HOST} \
--docker-volumes=${GITLAB_RUNNER_DOCKER_VOLUMES[@]} \
--env="DOCKER_TLS_CERTDIR=" \
--docker-privileged=true \
--tag-list="docker"
{% endhighlight %}

Jika sudah maka gitlab-runner akan terdaftar seperti berikut:

![gitlat-runner-list]({{ page.image_path | prepend: site.baseurl }}/gitlab-runner-list.png)

## Tryout Gitlab CI script

Setelah kita install package gitlab, gitlab-runner, executor (docker) dan register gitlab runner agent ke gitlab instance tahap selanjutnya kita coba test menggunakan simple configuration. Berikut adalah step-by-step nya

1. Buat repository, contohnya name `test-gitlab-ci` kemudian visiblilty kita buat `public` serta untuk project configuration check pada `initilization repo with README` click `Create project`

2. Kemudian coba buat file baru dengan nama `.gitlab-ci.yml` seperti berikut:
  {% gist page.gist "03c-test-gitlab-ci.yml" %}

3. Dan coba commit, serta push ke branch `main`. Jika sudah temen-temen bisa lihat di menu Pipeline seperti berikut:
  ![pipeline]({{ page.image_path | prepend: site.baseurl }}/pipeline.png)

4. Terdapat 1 pipeline yang sedang berjalan, kita coba lihat detailnya dengan click button `running` maka seperti berikut:
  ![pipeline-detail]({{ page.image_path | prepend: site.baseurl }}/pipeline-detail.png)

5. Dalam detail pipeline tersebut terlihat sedang ada 1 job yang sedang berjalan, kita coba lihat detail dengan click button `job1` maka seperti berikut:
  ![job-detail]({{ page.image_path | prepend: site.baseurl }}/job-detail.png)

6. Nah terlihat pada job, menjalankan script yang kita tulis pada file `.gitlab-ci.yml` menghasilkan output:
  
  ```bash
  $ echo 'Hi my name is Dimas Maryanto'
  Hi my name is Dimas Maryanto

  Cleaning up project directory and file based variables
  00:01
  Job succeeded
  ```

Nah ini artinya, kita sudah bisa menggunakan Continues Integration dengan menggunakan Gitlab CI.
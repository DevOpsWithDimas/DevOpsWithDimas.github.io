---
lang: gitlab
catalog_key: gitlab-ci
title: "Settings up Gitlab CI environment"
categories:
- git
- gitlab
- gitlab-ci
refs: 
- https://docs.docker.com/
youtube: 
image_path: /resources/posts/gitlab-ci/03c-setup-gitlab-ci
gist: dimMaryanto93/d92bd18da1c73c230d7762361f738524
downloads: []
---

Hai semuanya, di materi kali ini kita akan membahas tentang Setup environment for Continues Integration (CI) menggunakan Gitlab CI. Ok karena artikel ini akan lumayan panjang jadi kita akan bagi2 menjadi beberapa bagian yaitu 

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
        cpu: 2 CPU
        memory: 4GB
        storage: 250GB
            partitions:
                - name: /
                  size: 75 GB
                - name: /var
                  size: '>= 150GB'
            type: LVM
    networks:
        - name: private ip
          ip4: 192.168.88.10/24
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
        storage: 50GB
            partitions:
                - name: /
                  size: 20 GB
                - name: /var
                  size: '>= 50GB'
            type: LVM
    networks:
        - name: private ip
          ip4: 192.168.88.8/24
          gateway: 192.168.88.1
          dns: 
            - 8.8.8.8
            - 8.8.4.4
    packages:
        - OpenSSH-Server
        - docker-ce
        - gitlab-runner
    ```

---
title: "Docker"
visible: true
header:
  teaser: assets/images/cources/docker.png
tags:
  - DevOps
  - Docker
  - Container
udemy: 
  url: https://www.udemy.com/course/docker-pemula-sampai-mahir/
  price: Rp560.000,-
  discount: Rp99.000,-
  couponCode: BUKBER.2023.10
  release: true
  referralCode: 8D13D85D4D34027B76BE
  expired: 15/04/2023
toc: true
sidebar:
  - title: "Role"
    image: assets/images/cources/docker.png
    image_alt: "logo"
    text: "DevOps Engineer, Developer & Programmer"
  - title: "Responsibilities"
    text: "Temen-teman akan belajar Containerization dengan Docker untuk Pemula sampai Mahir."
catalogs:
  - name: Pengenalan Docker
    key: introduction
    description: 'Eps. 1 - Pengenalan Container dengan Docker'
    deprecated: false
    messages: ''
  - name: Docker Registry
    key: docker-registry
    description: 'Eps. 2 - Docker Registry'
    deprecated: false
    messages: ''
  - name: Docker Container CLI
    key: docker-container
    description: 'Eps. 3 - Docker Container'
    deprecated: false
    messages: ''
  - name: Docker Networks
    key: docker-network
    description: 'Eps. 4 - Docker Network'
    deprecated: false
    messages: ''
  - name: Docker Volumes
    key: docker-volume
    description: 'Eps.5 - Docker Volumes'
    deprecated: false
    messages: ''
  - name: Dockerfile
    key: dockerfile
    description: 'Eps.6 - Dockerfile'
    deprecated: false
    messages: ''
  - name: 'Study Kasus: Build docker image'
    key: study-cases-dockerfile
    description: 'Eps.7 - Study kasus: building your own docker images'
    deprecated: false
    messages: ''
  - name: Docker Compose
    key: docker-compose
    description: 'Eps.8 - Docker Compose'
    deprecated: false
    messages: ''
  - name: 'Study Kasus: Docker Compose'
    key: study-cases-compose-files
    description: 'Eps.9 - Study kasus: run multiple container using docker-compose'
    deprecated: false
    messages: ''
  - name: Docker Context
    key: docker-context
    desciption: 'Eps.10 - Docker Context'
    deprecated: false
    messages: ''
  - name: 'Study Kasus: Docker for CI'
    key: study-cases-docker-ci
    description: 'Eps.11 - Study kasus: Docker for Continues Integration'
    deprecated: false
    messages: ''
  - name: Docker Machine
    key: docker-machine
    description: 'Eps.12 - Docker Machine'
    deprecated: true
    messages: ''
  - name: 'Study Kasus: Ansible for Docker'
    key: study-cases-ansible
    description: 'Eps.13 - Study kasus: Create multiple Docker Host'
    deprecated: false
    messages: ''
  - name: Docker Swarm
    key: docker-swarm
    description: 'Eps.14 - Docker Swarm'
    deprecated: false
    messages: ''
  - name: 'Study Kasus: Docker Swarm'
    key: study-cases-docker-swarm
    description: 'Eps.15 - Study kasus: Orchestration with docker swarm'
    deprecated: false
    messages: ''
  - name: Docker on Cloud using GCP
    key: docker-cloud
    description: 'Eps.16 - Docker on Cloud using Google Cloud Platform'
    deprecated: false
    messages: ''
---

Hai semuanya, Selamat datang di kelas ini kita akan membahas teknology container yang sedang popular saat ini yaitu Docker. 

Dengan menggunakan teknology container kita bisa melakukan banyak hal mulai dari development, Automate testing, Automate deployment dan lain-lain. Adapun materi/silabus yang akan kita bahas di kelas ini kita akan bagi menjadi 3 section yaitu fundamental, intermediate dan Advanced. Diantaranya:

<!--more-->

## Fundamental

Dilevel fundamental, temen-teman akan belajar hal yang paling basic yaitu:

1. Docker Overview
2. Docker Architecture
3. Why Docker so popular?
4. Installing Docker
    1. Install on Windows 10
    2. Install on Linux
    3. Install on Mac ARM/Intel Based
5. Getting Started with Docker
    1. Pull Image from registry
    2. Test Run docker container
6. Docker CLI
    1. Docker `images` command
    2. Docker `container` command
    3. Docker `logs` / `ps` command
    4. Docker `inspect` command
    5. Docker `rm` command
    6. Docker `exec` command
    8. Docker `cp` command
    7. Docker `save` & `load` command
7. Docker Network
    1. Legacy Container Links
    2. Use Default bridge Network
    3. Create user-defined from bridge Network
    4. Host Networks
    5. None Network
8. Docker Volume
    1. Using volume
    2. Using bind-mount
    3. Using share data among containers
    4. Using share data among machine `vieux/docker-volume-sshfs`

## Intermediate

Setelah temen-temen memahami functional dari docker seperti menjalankan container, menggunakan perintah docker cli. Tahap selanjutnya dalah mempelajari lebih lanjut untuk level menengah yaitu :

1. Dockerfile
  - Build your own image
  - Publish your image to [hub.docker.com](https://hub.docker.com/)
  - publish your image to private registry (nexus oss)
2. Study Cases: Build images for specific programming language
  - Build for Java Web Application
  - Build for Springboot Application
  - Build for Angular
  - Build for ReactJS
  - Build for PHP Native
  - Build for PHP framework like Laravel, CakePHP dll
3. Docker Compose CLI
    1. Overview
    2. Getting started dengan Docker Compose
    3. Communication between containers
    4. Environtment Variables
    5. Networking
    6. Volumes
    7. Build image
4. Docker Daemon CLI
5. Docker Dashboard

## Advanced

Lalu dilanjutkan ke level Advanced yaitu kita akan mempelajari docker orchestration, dimana kita akan menjalan docker lebih dari 1 host seperti berikut:

1. Docker Machine
    1. Create simple machine
    2. Create multiple machine
    3. Configure insecure registry
    4. Example use-cases for docker-machine
    5. Alternative docker-machine
2. Docker Swarm
    1. Swarm Node
    2. Swarm Stack
    7. Docker Service Logging Commnad
    8. Docker Service Inspact Command
    9. Docker Service Update Command
    6. Docker Service Rollback 
    5. Limiting Resources
    4. Scaling Container
3. Kubernetes in Docker (Kind)

Selain itu juga masih banyak lagi yang akan kita bahas di cource ini, Ok mungkin sekian dulu yang bisa saya sampaikan terkait silabus belajar Docker untuk Pemula sampai Mahir. Sampai jumpa di cource nanti!
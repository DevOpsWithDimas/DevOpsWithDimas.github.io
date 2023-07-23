---
lang: docker
catalog_key: docker-registry
title: "What is Docker Registry?"
date: 2021-04-24T17:45:53+07:00
last_modified_at: 2023-07-23T19:12:00+07:00
categories:
- DevOps
- Docker
- Registry
refs: 
- https://docs.docker.com/registry/
- https://octopus.com/blog/top-8-container-registries
youtube: 
image_path: /resources/posts/docker/03a-what-is-registry
gist: dimMaryanto93/d92bd18da1c73c230d7762361f738524
downloads: []
qna_list:
  - question: |
        Gunakan Insecure Registry jika?
    answer: |
        - Container image yang disimpan berada pada jaringan local (on-premis)
        - Container image yang disimpan hanya bisa diases oleh orang tertentu aja
        - Infra hanya bisa diakses secara Offline
  - question: |
        Gunakan Private Registry jika?
    answer: |
        - Container image yang disimpan bisa diakses dari mana saja tetapi dengan limited akses (specified user)
        - Tidak memiliki Infra (server/vm) pada jaringan
  - question: |
        Gunakan Public Registry jika?
    answer: |
        - Container image yang disimpan bisa diakses dari mana saja dan oleh siapapun.
        - Tidak memiliki Infra (server/vm) pada jaringan
---

Hai semuanya, di section sebelumnya kita udah belajar memanage docker object dengan `docker` cli (Commandline interface). Sekarang kita akan membahas khusus Docker Registry. Seperti yang temen-temen ketahui sebelumnya, Docker Registry digunakan untuk menyimpan dan men-distribusikan container image. 

Sebelum kita menggunakan Container Registry khususnya Docker Registry kita lihat dulu yuk secara konsep dan definisi seperti berikut:

<!--more-->

1. What is Container Registry?
2. Types of Container Registry?
    - Public registry
    - Private registry
    - Insecure registry
    - How Do I Choose the Right Container Registry?
3. How to working with container registry?
4. What is Container repository and undesrstanding image naming?
5. Top 8 Container registry you should know

Okay tanpa berlama-lama yuk langsung aja kita bahas mulai dari materi yang pertama:

## What is Container Registry?

> The Registry is a stateless, highly scalable server side application that stores and lets you distribute Docker images. 

A registry is a storage and content delivery system, holding named Docker images, available in different tagged versions. 

Example: the image `project-name/app-name`, with tags `2.0` and `2.1`.

You should use the Registry if you want to:

- Tightly control where your images are being stored
- Fully own your images distribution pipeline
- Share or Collaboration with other developers to build your own image distribution

## Types of Container Registry?

Ada beberapa methode dalam penggunaan atau meng-akses Container Registry diantaranya:

- **Public Registry**: Container image yang bisa diakses oleh siapapun tanpa harus menggunakan credential untuk dapat pull/download container image tersebut dan biasanya sudah tersedia baik cloud maupun on-premise.
- **Private Registry**: Container image yang hanya bisa di akses oleh user yang memiliki credential untuk dapat pull/download container image tersebut dan biasanya tersedia baik cloud maupun on-premise.
- **Insecure Registry**: Container image yang biasanya hanya bisa diakses pada lokasi tertentu (on-premise) serta bisa bersifat Private atau Public registry tergantung pada infra dan networking penggunanya.

Perbedaan mendasar pada Public, Private dan Insecure registry adalah pada protocol yang digunakan. Biasanya untuk Public dan Private registry menggunakan protocol `https` (secure) sedangkan untuk Insecure registry menggunakan protocol `http` (non-secure) untuk berkomunikasi dengan docker server.

Kemudian kapan kita harus memilih Private, Public atau Insecure registry? jawabanya `"it's depend !!!"` berikut ada beberapa schenario:

{% include accordion list="qna_list" %}

## How to working with container registry?

Setelah kita memilih Container registry mau pake apa, selanjutnya bagimana cara menggunakannya? basicly kita bisa menggunakan Container Registry dengan beberapa cara yaitu:

- **Rest API**: The Docker Registry HTTP API is the protocol to facilitate distribution of images to the docker engine. It interacts with instances of the docker registry, which is a service to manage information about docker images and enable their distribution.
- **Docker**: The Docker client, that when your using `pull` or `push` command to interaction with Docker Registry server via Rest API to upload/download over TCP socket.
- **Automation Tools seperti CI/CD**: The tool of docker client, that automate process of pull, build, push container to Docker registry without interference of people/developers.

Sebagian besar orang-orang atau developer serta DevOps menggunakan container registry dengan Docker dan Automation tools ci/cd seperti Gitlab CI, Github Action, Jenkins dan lain-lain.

Serta cara bekerja menggunakan Container Registry mirip seperti Version Control pada [git](https://git-scm.com), atau [svn](https://subversion.apache.org) kita bisa commit, pull serta push container image dari atau ke container registry.

## What is Container repository and undesrstanding image naming?

Setelah kita tau cara kerja Container Registry ada satuhal lagi yang perlu kita perhatikan yaitu Apa itu Container repository dan bagaimana penamaan image yang baik.

Dalam sebuah Container Registry kita dapat mendefinisikan banyak repository, sebuah repository atau container image kita bisa mendefinisikan banyak version atau tag. Seperti struktur berikut:

```yaml
Container Registry:
    - RepositoryA:
        name: registry-domain-a
        tags: 
            - latest
            - 1.0
            - 1.1
    - RepositoryB:
        name: registry-domain-a/app-a
        tags:
            - latest
            - 1.alpine-3
            - 1.debian-buleyes
            - 1.2.alpine-3
    - RepositoryN:
        name: registry-domain-n
        tags:
            - latest
```

Image names as used in typical docker commands reflect their origin:

- `docker pull ubuntu` instructs docker to pull an image named `ubuntu` from the official Docker Hub. This is simply a shortcut for the longer docker pull `docker.io/library/ubuntu` command
- `docker pull myregistrydomain:port/registry-domain-a/app-a:1.alpine-3` instructs docker to contact the registry located at `myregistrydomain:port` to find the image `registry-domain-a/app-a` with version `1.alpine-3`

## Top 8 Container registries you should know

Container registries often get confused for their repository counterparts, even though they serve different purposes. Berikut adalah 8 container registries yang kita bisa gunakan

1. **Docker Hub**: [Docker Hub](https://hub.docker.com/) is default and standard registry for image management.
2. **Amazon ECR**: [Amazon Elastic Container Registry (ECR)](https://aws.amazon.com/ecr/) is public or private container registry useful if you're already using AWS to deploy application. This registry can be use for ECS, EKS, AWS Lambda services.
3. **Google Container Registry (GCR)**: [Artifact Registry](https://cloud.google.com/artifact-registry) sama seperti AWS ECR tetapi dibuat oleh google.
4. **GitHub Container Registry**: Given GitHub's reach and that it's already available for all users, [GitHub's Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) (part of a bigger feature called GitHub Packages) is one of the most approachable options.
5. **Gitlab Container Registry**: Gitlab Container Registry introduces easy sharing across organizations, fine-grained permissions, and free, anonymous access for public container images is one of the most approachable options.
5. **RedHat Quay**: Unlike other options, [Red Hat Quay](https://www.redhat.com/en/technologies/cloud-computing/quay) offers private container registries only. This makes it a suitable option for enterprise-level customers in particular.
6. **JFrog Container Registry**: Built upon another JFrog product, Artifactory, [JFrog Container Registry](https://jfrog.com/container-registry/) supports Docker images and Helm Charts. JFrog Container Registry also offers the option to store any package type, thanks to its generic repositories. JFrog has both cloud and self-hosted options (or a hybrid if you wish), and promises great scalability.
7. **Sonatype Nexus Repository OSS**: The world's only repository manager with FREE support for popular formats. Nexus Repository OSS has both cloud and self-hosted options (or a hybrid if you wish), and promises great scalability.
---
lang: docker
catalog_key: introduction
title: "Docker overview"
date: 2021-04-11T11:51:06+07:00
last_modified_at: 2023-07-23T15:13:00+07:00
categories:
- DevOps
- Docker
- Basic
refs: 
- https://docs.docker.com/get-started/overview/
youtube: 
comments: true
image_path: /resources/posts/docker/01a-docker-overview
gist: dimMaryanto93/d92bd18da1c73c230d7762361f738524
downloads: []
tagline: ""
header:
  overlay_image: "/resources/posts/docker/01a-docker-overview/logo.png"
  overlay_filter: 0.7
  caption: "Tutorial & Dokumentasi: Programming, DevOps, GitOps, Database, & Servers"
feature-docker-build:
  - image_path: /resources/posts/docker/01a-docker-overview/docker-build.png
    alt: "build"
    title: "Craft your own container image"
    excerpt: |
        - Get a head start on your coding by leveraging Docker images to efficiently develop your own unique applications on Windows and Mac.  Create your multi-container application using Docker Compose.
        - Integrate with your favorite tools throughout your development pipeline – Docker works with all development tools you use including VS Code, CircleCI and GitHub.
        - Package applications as portable container images to run in any environment consistently from on-premises Kubernetes to AWS ECS, Azure ACI, Google GKE and more.
feature-docker-share:
  - image_path: /resources/posts/docker/01a-docker-overview/docker-share.png
    alt: "share"
    title: "Sharing your container image"
    excerpt: |
        - Leverage Docker Trusted Content, including Docker Official Images and images from Docker Verified Publishers from the Docker Hub repository.
        - Innovate by collaborating with team members and other developers and by easily publishing images to Docker Hub.
        - Personalize developer access to images with roles based access control and get insights into activity history with Docker Registry.
feature-docker-run:
  - image_path: /resources/posts/docker/01a-docker-overview/docker-run.png
    alt: "run"
    title: "Running"
    excerpt: |
        - Deliver multiple applications hassle free and have them run the same way on all your environments including design, testing, staging and production – desktop or cloud-native.
        - Deploy your applications in separate containers independently and in different languages. Reduce the risk of conflict between languages, libraries or frameworks.
        - Speed development with the simplicity of Docker Compose CLI and with one command, launch your applications locally and on the cloud with AWS ECS and Azure ACI.
---

Hai semuanya, sebelumnya kita udah berkenalan dengan teknologi yang namanya Container virtualization, kali ini kita akan membahas salah satu tools yang biasanya digunakan untuk implementasi dari Container yaitu Docker. 

Tetapi sebelum kita menggunakan Docker ada baiknya kita lihat dulu pembahasan berikut:

1. Apa itu Docker?
2. Manfaat menggunakan Docker
3. Docker Architecture

Okay karena pembahasan kali ini akan lumayan panjang, kita breakdown satu-per-satu:

<!--more-->

## What is Docker

> Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. 
By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.

**Docker makes development efficient and predictable**: Docker takes away repetitive, mundane configuration tasks and is used throughout the development lifecycle for fast, easy and portable application development. 
Docker’s comprehensive end to end platform includes UIs, CLIs, APIs and security that are engineered to work together across the entire application delivery lifecycle.

{% include feature_row id="feature-docker-build" type="left" %}

{% include feature_row id="feature-docker-share" type="right" %}

{% include feature_row id="feature-docker-run" type="left" %}


## Manfaat menggunakan Docker?

Sebagai seorang Research and Development (RnD) dan sekaligus Software Engineer, tidak jarang berurusan dengan product brended sekelas IBM, Oracle dan lainnya. Misalnya karena kerjaan kita adalah mendevelop aplikasi. Aplikasi tersebut harus run di product IBM misalnya JBoss EAP kemudian Untuk database menggunakan product Microsoft MS-SQL Server.

Permasalahannya? sebenarnya product tersebut punya Environment / Spesifikasi masing-masing sebagai contohnya Microsoft SQL Server hanya bisa di running di env Microsoft Windows Server, Microsoft Azure, dan Linux Server sedangkan tidak semua Developer memiliki env tersebut. 

Solusinya ada beberapa cara mulai dari install ulang OS, Virtualization, dan Containerization. 

1. Cara yang paling sederhana adalah install ulang OS, cuman secara workflow gak terlalu enak karena harus adaptasi lagi dengan OS tersebut dan juga software-softwarenya.
2. Jadi dulu biasanya saya menggunakan Virtualbox untuk menginstall OS tertentu tpi secara development jadi kurang nyaman karena ada beberapa masalah dengan Driver Compatibility, limit resouces dan lain-lain.
3. Containerization, salah satunya yang saya sering gunakanan beberapa tahun ini yaitu dengan menggunakan Docker Platform.

Docker’s container-based platform allows for highly portable workloads. Docker containers can run on a developer’s local laptop, on physical or virtual machines in a data center, on cloud providers, or in a mixture of environments. Docker can be run with deffrent schenario such as:

1. Your developers write code locally and share their work with their colleagues using Docker containers.
2. They use Docker to push their applications into a test environment and execute automated and manual tests.
3. When developers find bugs, they can fix them in the development environment and redeploy them to the test environment for testing and validation.
4. When testing is complete, getting the fix to the customer is as simple as pushing the updated image to the production environment.


## Docker Architecture

Docker menggunakan _client-server architecture_. The Docker client talks to the Docker daemon, which does the heavy lifting of building, running, and distributing your Docker containers. The Docker client and daemon can run on the same system, or you can connect a Docker client to a remote Docker daemon. The Docker client and daemon communicate using a REST API, over UNIX sockets or a network interface.

![docker-architecture](https://docs.docker.com/engine/images/architecture.svg)

Pada architecture tersebut jika disimpulkan terdiri dari beberapa component yaitu

- Docker Interface
- Docker Object

### Docker interfaces

Ketika docker di install pada host, kita di sediakan beberapa interfaces:

1. Docker Daemon (`dockerd`), yaitu Docker API dan untuk memanage Docker Objects seperti images, containers, networks, volumes.
2. Docker Client (`docker` dan `docker-compose`), yaitu Program Interface yang berkomunikasi dengan Docker Daemon  
3. Docker Registries, yaitu untuk menyimpan docker image (`push`) secara public dan private, selain itu juga kita mengambil image yang telah tersedia (`pull`).

### Docker Objects

Ketika kita menggunakan docker, kita akan menggunakan beberapa object diantaranya:

1. Docker Images, An image is a read-only template with instructions for creating a Docker container.
2. Docker Containers, A container is a runnable instance of an image.
3. Docker Volumes, A volume is object storage relateable with containers
4. Docker Networks, A network is object interaction between containers


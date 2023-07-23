---
lang: docker
catalog_key: introduction
title: "What is Container?"
date: 2021-04-11T08:52:06+07:00
last_modified_at: 2023-07-23T13:13:00+07:00
categories:
- DevOps
- Docker
- Basic
refs: 
- https://www.docker.com/resources/what-container/
- https://www.techtarget.com/searchitoperations/definition/container-containerization-or-container-based-virtualization
youtube: 
comments: true
image_path: /resources/posts/docker/01b-container
gist: dimMaryanto93/d92bd18da1c73c230d7762361f738524
downloads: []
feature-vm:
  - image_path: /resources/posts/docker/01b-container/vm.png
    alt: "vm"
    title: "Virtual Machine"
    excerpt: "are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each VM includes a full copy of an operating system, the application, necessary binaries and libraries - taking up tens of GBs. VMs can also be slow to boot."
feature-container:
  - image_path: /resources/posts/docker/01b-container/container.png
    alt: "container"
    title: "Container"
    excerpt: "are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), can handle more applications and require fewer VMs and Operating systems."
---

Hai semuanya, di materi pertama kali ini kita akan berkenalan dulu dengan teknology yang namanya **Container dalam virtualisasi (server)**. Virtualisasi container sendiri berfokus kepada isolasi, lighwith package dan dapat di deploy pada semua platform. Penasaran apa itu Container? yuk kita bahas...

1. What is Container?
2. Apa bedanya dengan Virtual Machine (vm)?
3. Benefits of containers?
4. Disadvantages of containers?
5. Common container users
6. Container tool and platform providers?

Nah karena pembahasannya akan lumayan panjang, jadi kita breakdown yuk satu-per-satu:

<!--more-->

## What is Container?

> Containers are a type of software that can virtually package and isolate applications for deployment. Containers can share access to an operating system (OS) kernel without the traditional need for virtual machines (VMs).

Container technology menggunakan `roots` partitioning yang diperkenalkan mulai tahun 1960-an serta menggunakan `chroot` dalam memproses isolation yang di develop untuk system Unix pada tahun 1970an. Saat ini Container terdiri dari 2 jenis yaitu 

- Container application seperti containerd, docker 
- System container seperti Linux container (LXC)

Kedua teknologi tersebut dapat merubah style IT infrastruktur dalam meng-abstraction application code yang bisanya harus menspecify code sumber dengan target artinya code yang ditulis harus match dengan specifikasi target environment, saat ini kita cukup bisa menggunakan single code based dan dapat dijalankan dimanapun atau istilahnya WORA (Write One Run Anyware).


## Apa bedanya dengan Virtual Machine (vm)?

Secara teknologi virtualisasi antara Container dan Virtual Machine (VM) memang serupa tetapi ada beberapa perbedaan diantaranya seperti berikut jika kita lihat dari architecture keduanya:

{% include feature_row id="feature-vm" type="left" %}

{% include feature_row id="feature-container" type="right" %}

Kesimpulan:

- Perbedaan yang terlihat antara VM dan Container **di-sisi storage**, pada VM biasanya size storage akan lebih besar karena setiap vm akan memiliki full OS (Operation System) yang biasanya minimial memiliki ukuran lebih besar dari `20Gb` sedangkan untuk container biasanya kisaran `100Mb` s/d `200Mb`.
- Perbedaan dalam **mendeploy aplikasi** kedalam VM ataupun Container, pada VM ada beberapa step yang perlu dilakukan yaitu Install OS, Configurasi Network, Install Aplikasi sedangkan untuk Container kita define component aplikasi dalam bentuk script (`dockerfile`) kemudian di-build dan push ke registry.
- Perbedaan dalam **kecepatan menjalankan aplikasi** pada VM dan Container, Karena VM membawa dependency seperti full copy OS serta aplikasi biasanya startup time akan lebih lama dibandingkan container (instan startup bisa dalam hitungan detik).

## Benefits of containers?

Because containers share the same OS kernel as the host, containers can be more efficient than VMs, which require separate OS instances.

Container memiliki keunggunalan portability lebih baik karena:

- They can move among any systems that share the host OS type, without requiring code changes.
- This encapsulation of the application operating code in the container means that there are no guest OS environment variables or library dependencies to manage.
- Proponents of containerization point to gains in efficiency for memory, CPU and storage as key benefits of this approach compared with traditional virtualization.  Because containers do not have the overhead required by VMs, such as separate OS instances
- An average physical host could support dozens of VMs or hundreds of containers —however, in actual operations, the host, container and VM sizes are highly variable and subject to the demands of a specific application or applications.
- A major factor in the interest in containers is they are consistent throughout the application lifecycle. This fosters an agile environment and facilitates new approaches, such as continuous integration (CI) and continuous delivery (CD). They also spin up faster than VMs, which is important for distributed applications.

## Disadvantages of containers?

Setelah kita lihat kelebihan apakah teknologi container ini tidak ada kekurangan? tentu saja tidak, ingatlah setiap system pasti punya nilai `+` dan `-` so yuk kita lihat apa sih kekurangan dari system container ini:

- A potential drawback of containerization is lack of isolation from the host OS. Because containers share a host OS, **security threats have easier access to the entire system** when compared with hypervisor-based virtualization.
- the lack of **OS flexibility**. In typical deployments, each container must use the same OS as the base OS, whereas hypervisor instances have more flexibility. For example, a container created on a Linux-based host could not run an instance of the Windows Server OS or applications designed to run on Windows Server.
- **Monitoring visibility** can be another issue. With up to hundreds or more containers running on a server, it may be difficult to see what is happening in each container.

Nah dari kekurangan ini apakah kita harus khawatir untuk menggunakan container? klo menurut saya gak perlu cemas, gundah gulana bahkan berpikir negatif dulu tentang container. Teknologi container memang masih terbilang baru dibandingkan dengan Virtual Machine, tetapi ingat teknologi container ini berkembang dengan sangat pesat banyak perkembangan mulai dari perbaikan security, peningkatan performa dan lain-lain so kita sebagai pengguna gak perlu khawatir lagi soal itu lambat-atau-cepat kelemahan tersebut pasti akan di perbaiki oleh pengembang system container ini.

## Common container uses

Containers are frequently paired with microservices and the cloud but offer benefits to monolithic applications and on-premises data centers as well. 

Containers are well-adapted to work with microservices, as each service that makes up the application is packaged in an independently scalable container. 
For example, a microservices application can be composed of containerized services that generate alerts, log data, handle user identification and provide many other services. Each service operates on the same OS while staying individually isolated. Each service can scale up and down to respond to demand.

Traditional monolithic application architectures are designed so all the code in a program is written in a single executable file. Monolithic applications don't readily scale in the way that distributed applications do, but they can be containerized. For example, Docker Modernize Traditional Applications (MTA) helps users to transition monolithic applications to Docker containers as is, with adaptations for better scaling, or via a full rebuild and rearchitecting.

## Container tool and platform providers?

Kita sudah mengetahui basic secara Konsep Container, Benefit dan Disadvantage dari Container serta Penggunaan Container sekarang kita lihat dari sisi tool dan platform dari teknologi container ini. 

Untuk tools or platform yang membundle software container sebetulnya ada banyak mulai dari yang free, subcribtion dan paid seperti 

- [Docker Engine](https://docs.docker.com/engine/)/[Desktop](https://www.docker.com/products/docker-desktop/)
- [Containerd](https://containerd.io)
- [CRI-O](https://cri-o.io)
- [Mirantis](https://www.mirantis.com/software/mirantis-container-cloud/)
- [Podman](https://podman.io)
---
lang: gitlab
catalog_key: gitlab-ci
title: "What is Continues Integration/Continues Delivery (CI/CD)?"
categories:
- git
- gitlab
- gitlab-ci
refs: 
- https://www.ibm.com/topics/continuous-integration
youtube: 
image_path: /resources/posts/gitlab-ci/03a-what-gitlab-ci
gist: dimMaryanto93/d92bd18da1c73c230d7762361f738524
downloads: []
---

Hai semuanya, di materi kali ini kita akan membahas seputar **Continues Integration and Continues Delivery** alias **CI/CD** dalam suatu SDLC atau singkatan dari **Software Development Lifecycle**. Saat ini banyak perusahaan/instansi menggunakan proses CI/CD untuk membantu proses Release Management dalam suatu project/product agar bisa lebih cepet dan autopilot sehinga developer dapat fokus untuk mendevelop bisnis proses. 

Sebelum kita membahas lebih jauh, ada beberapa hal yang kita perlu pahami terlebih dahulu tentang CI/CD diantaranya:

1. What is Continues Integration & Continues Delivery/Deployment (CI/CD)?
2. CI/CD vs DevOps
3. Continues integration vs Continues develiery vs Continues deployment?
4. Benefit of implemented CI/CD in SDLC
5. Pros & Cons implemented CI/CD in Project Management such as agile, scrum, etc?

Okay tanpa berlama lama yuk kita bahas satu-per-satu

<!--more-->

## What is Continues Integration & Continues Delivery/Deployment (CI/CD)?

## How does CI/CD relate to DevOps?

## Continues integration vs Continues develiery vs Continues deployment?

Kita telah mengenal Continues integration dan Continues Delivery/Deployment alias CI/CD, tetapi apa sih sebetulnya perbedaan diantaranya? yuk kita bahas satu-per-satu mulai dari Continues Integration.

**Continuous Integration**, Consider an application that has its code stored in a Git repository in GitLab. Developers push code changes every day, multiple times a day. For every push to the repository, you can create a set of scripts to build and test your application automatically. These scripts help decrease the chances that you introduce errors in your application.

Each change submitted to an application, even to development branches, is built and tested automatically and continuously. These tests ensure the changes pass all tests, guidelines, and code compliance standards you established for your application.

**Continuous Delivery**, is a step beyond Continuous Integration. Not only is your application built and tested each time a code change is pushed to the codebase, the application is also deployed continuously. However, with continuous delivery, you trigger the deployments manually.

Continuous Delivery checks the code automatically, but it requires human intervention to manually and strategically trigger the deployment of the changes.

**Continuous Deployment**, is another step beyond Continuous Integration, similar to Continuous Delivery. The difference is that instead of deploying your application manually, you set it to be deployed automatically. Human intervention is not required.

For more details, here is the diagram ci/cd workflow

![ci-ci-workflow]({{ page.image_path | prepend: site.baseurl }}/ci-cd-workflow.png)

## Benefit of implemented CI/CD in SDLC

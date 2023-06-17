---
lang: gitlab
catalog_key: gitlab-ci
title: "What is Continues Integration/Continues Delivery (CI/CD)?"
date: 2023-06-17T16:52:30+07:00
categories:
- git
- gitlab
- gitlab-ci
refs: 
- https://www.ibm.com/topics/continuous-integration
- https://www.synopsys.com/glossary/what-is-cicd.html
youtube: 
image_path: /resources/posts/gitlab-ci/03a-what-cicd
gist: dimMaryanto93/d92bd18da1c73c230d7762361f738524
downloads: []
---

Hai semuanya, di materi kali ini kita akan membahas seputar **Continues Integration and Continues Delivery** alias **CI/CD** dalam suatu SDLC atau singkatan dari **Software Development Lifecycle**. 

Pada suatu project/product berbasis software development ini memiliki beberapa tahapan mulai dari coding, testing, dan deployment. Hal ini menjadi tantangan tersendiri jika melibatkan beberapa team/divisi/perusahaan dalam suatu development project/product tersebut.

![ci-ci]({{ page.image_path | prepend: site.baseurl }}/cicd.svg)

Saat ini banyak perusahaan/instansi menggunakan proses CI/CD untuk menghilankan kerumitan (simplify) dalam proses release suatu project/product agar bisa lebih cepet dan autopilot (automation deployment). 

Sebelum kita membahas lebih jauh, ada beberapa hal yang kita perlu pahami terlebih dahulu tentang CI/CD diantaranya:

1. What is Continues Integration & Continues Delivery/Deployment (CI/CD)?
2. What is the difference between CI and CD?
3. How does CI/CD relate to DevOps?
4. Benefit of implemented CI/CD in SDLC
5. What are the benefits of CI/CD?

Okay tanpa berlama lama yuk kita bahas satu-per-satu

<!--more-->

## What is Continues Integration & Continues Delivery/Deployment (CI/CD)?

> CI and CD stand for continuous integration and continuous delivery/continuous deployment. CI/CD is a method to frequently deliver apps to customers by introducing automation into the stages of app development.

Main concepts attributed to CI/CD are 

1. Continuous integration, 
2. Continuous delivery, and 
3. Continuous deployment. 

CI/CD is a solution to the problems integrating new code can cause for development and operations teams. 
Specifically, CI/CD introduces ongoing automation and continuous monitoring throughout the lifecycle of apps, from integration and testing phases to delivery and deployment. 
Taken together, these connected practices are often referred to as a "CI/CD pipeline" and are supported by development and operations teams working together in an agile way.

Why is CI/CD important?

CI/CD allows organizations to ship software quickly and efficiently. CI/CD facilitates an effective process for getting products to market faster than ever before, continuously delivering code into production, and ensuring an ongoing flow of new features and bug fixes via the most efficient delivery method. 

## What is the difference between CI and CD?

Kita telah mengenal Continues integration dan Continues Delivery/Deployment alias CI/CD, tetapi apa sih sebetulnya perbedaan diantaranya? yuk kita bahas satu-per-satu mulai dari Continues Integration.

**Continuous Integration**, Consider an application that has its code stored in a Git repository. Developers push code changes every day, multiple times a day. For every push to the repository, you can create a set of scripts to build and test your application automatically. These scripts help decrease the chances that you introduce errors in your application.

Each change submitted to an application, even to development branches, is built and tested automatically and continuously. These tests ensure the changes pass all tests, guidelines, and code compliance standards you established for your application.

**Continuous Delivery**, is a step beyond Continuous Integration. Not only is your application built and tested each time a code change is pushed to the codebase, the application is also deployed continuously. However, with continuous delivery, you trigger the deployments manually.

Continuous Delivery checks the code automatically, but it requires human intervention to manually and strategically trigger the deployment of the changes.

**Continuous Deployment**, is another step beyond Continuous Integration, similar to Continuous Delivery. The difference is that instead of deploying your application manually, you set it to be deployed automatically. Human intervention is not required.

For more details, here is the diagram ci/cd workflow

![ci-ci-workflow]({{ page.image_path | prepend: site.baseurl }}/ci-cd-workflow.png)

## How does CI/CD relate to DevOps?

DevOps is a set of practices and tools designed to increase an organization’s ability to deliver applications and services faster than traditional software development processes. 
The increased speed of DevOps helps an organization serve its customers more successfully and be more competitive in the market. In a DevOps environment, successful organizations “bake security in” to all phases of the development life cycle, a practice called DevSecOps.

The key practice of DevSecOps is integrating security into all DevOps workflows. By conducting security activities early and consistently throughout the software development life cycle (SDLC), organizations can ensure that they catch vulnerabilities as early as possible, and are better able to make informed decisions about risk and mitigation. 
In more traditional security practices, security is not addressed until the production stage, which is no longer compatible with the faster and more agile DevOps approach. 
Today, security tools must fit seamlessly into the developer workflow and the CI/CD pipeline in order to keep pace with DevOps and not slow development velocity. 

The CI/CD pipeline is part of the broader DevOps/DevSecOps framework. In order to successfully implement and run a CI/CD pipeline, organizations need tools to prevent points of friction that slow down integration and delivery. 
Teams require an integrated toolchain of technologies to facilitate collaborative and unimpeded development efforts.


## What are the benefits of CI/CD?

- Automated testing enables continuous delivery, which ensures software quality and security and increases the profitability of code in production.
- CI/CD pipelines enable a much shorter time to market for new product features, creating happier customers and lowering strain on development.
- The great increase in overall speed of delivery enabled by CI/CD pipelines improves an organization’s competitive edge.
- Automation frees team members to focus on what they do best, yielding the best end products.
- Organizations with a successful CI/CD pipeline can attract great talent. By moving away from traditional waterfall methods, engineers and developers are no longer bogged down with repetitive activities that are often highly dependent on the completion of other tasks. 

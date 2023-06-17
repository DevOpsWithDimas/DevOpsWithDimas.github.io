---
lang: gitlab
catalog_key: gitlab-ci
title: "Introduction of Gitlab DevSecOps Platform"
date: 2023-06-17T20:36:43+07:00
categories:
- git
- gitlab
- gitlab-ci
refs: 
- https://docs.gitlab.com/ee/ci/introduction/index.html
youtube: 
image_path: /resources/posts/gitlab-ci/03b-intro-gitlab-ci
gist: dimMaryanto93/fd40c02b1cc0d4eccb7c03103397591b
downloads: []
gitlab_devsecops_platform:
  - image_path: resources/posts/gitlab-ci/03b-intro-gitlab-ci/gitlab-devsecops-platform.png
    alt: "gitlab-devsecops-platform"
    title: "Gitlab Features"
    excerpt: "Fundamentally changing the way Development, Security, and Ops teams collaborate and build software - GitLab provides all of the essential DevSecOps tools in one DevSecOps platform. <br><br>From idea to production, GitLab helps teams improve cycle time from weeks to minutes, reduce development costs, speed time to market, and deliver more secure and compliant applications."
gitlab_features:
  - image_path: resources/posts/gitlab-ci/03b-intro-gitlab-ci/gitlab-plan.png
    alt: "gitlab-plan"
    title: "Planning"
    excerpt: "Regardless of your process, GitLab provides powerful planning tools to keep everyone synchronized."
  - image_path: resources/posts/gitlab-ci/03b-intro-gitlab-ci/gitlab-create.png
    alt: "gitlab-create"
    title: "Create"
    excerpt: "Create, view, and manage code and project data through powerful branching tools."
  - image_path: resources/posts/gitlab-ci/03b-intro-gitlab-ci/gitlab-verify.png
    alt: "gitlab-verify"
    title: "Verify"
    excerpt: "Keep strict quality standards for production code with automatic testing and reporting."
  - image_path: resources/posts/gitlab-ci/03b-intro-gitlab-ci/gitlab-package.png
    alt: "gitlab-package"
    title: "Package"
    excerpt: "Create a consistent and dependable software supply chain with built-in package management."
  - image_path: resources/posts/gitlab-ci/03b-intro-gitlab-ci/gitlab-secure.png
    alt: "gitlab-secure"
    title: "Secure"
    excerpt: "Security capabilities, integrated into your development lifecycle."
  - image_path: resources/posts/gitlab-ci/03b-intro-gitlab-ci/gitlab-release.png
    alt: "gitlab-release"
    title: "Deploy"
    excerpt: "GitLab's integrated CD solution allows you to ship code with zero-touch, be it on one or one thousand servers."
  - image_path: resources/posts/gitlab-ci/03b-intro-gitlab-ci/gitlab-monitor.png
    alt: "gitlab-monitor"
    title: "Monitor"
    excerpt: "Help reduce the severity and frequency of incidents."
  - image_path: resources/posts/gitlab-ci/03b-intro-gitlab-ci/gitlab-govern.png
    alt: "gitlab-govern"
    title: "Govern"
    excerpt: "Manage security vulnerabilities, policies, and compliance across your organization."
---

Hai semuanya, di materi kali ini kita akan membahas salah satu tools implementasi dari Continues Integration (CI) yaitu menggunakan Gitlab DevSecOps Platform. 

Okay karena pembahasan kali ini akan lumayan panjang jadi kita bagi-bagi menjadi beberapa section diantaranya:

1. Gitlab DevSecOps Platform
1. Gitlab CI/CD workflow
2. What can Gitlab CI/CD do?

<!--more-->

## Gitlab DevOps Platform

{% include feature_row id="gitlab_devsecops_platform" type="right" %}

{% include feature_row id="gitlab_features" %}

## Gitlab CI/CD workflow

Gitlab CI menawarkan 3 konsep yaitu **Continues Integration**, **Continues Delivery** dan **Continues Deployment**. Out-of-the-box management systems can decrease hours spent on maintaining toolchains by 10% or more, so you can test, build, and publish your software with no third-party application or integration needed because Gitlab CI is the part of Gitlab.

GitLab CI/CD fits in a common development workflow.

You can start by discussing a code implementation in an issue and working locally on your proposed changes. 
Then you can push your commits to a feature branch in a remote repository that’s hosted in GitLab. 
The push triggers the CI/CD pipeline for your project. Then, GitLab CI/CD:

Runs automated scripts (sequentially or in parallel) to:
- Build and test your application.
- Preview the changes in a Review App, the same as you would see on your localhost.

After the implementation works as expected:
- Get your code reviewed and approved.
- Merge the feature branch into the default branch.
- GitLab CI/CD deploys your changes automatically to a production environment.
- If something goes wrong, you can roll back your changes.

![basic-gitlab-ci-workflow]({{ page.image_path | prepend: site.baseurl }}/basic-gitlab-ci.png)

This workflow shows the major steps in the GitLab process. You don’t need any external tools to deliver your software and you can visualize all the steps in the GitLab UI.

## What can Gitlab CI/CD do?

If you look deeper into the workflow, you can see the features available in GitLab at each stage of the DevOps lifecycle.

![advanced-gitlab-ci-workflow]({{ page.image_path | prepend: site.baseurl }}/advanced-gitlab-ci.png)

Stages continues integration:

- **Code quality**, To measure/analyze your source code’s quality and complexity.
- **Unit tests**, To test your source code's with automated
- **Dependency scanning**, To measure/analyze your dependencies is verify and not contains vulnerability

Stages continues delivery/deployment:

- **Build & Package**, To compile then wrap your source code's into package, it's can be executeable from anywere
- **Shipping**, After build script succeed, we can store that artifact to registry such as Container registry, NPM registry, Maven repository and etc.
- **Deploy**, After artifact stored on registry/repository, we can used that object to run the application
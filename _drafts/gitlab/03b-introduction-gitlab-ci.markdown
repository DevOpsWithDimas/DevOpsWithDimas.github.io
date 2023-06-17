---
lang: gitlab
catalog_key: gitlab-ci
title: "Introduction of Gitlab CI"
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
---

Hai semuanya, di materi kali ini kita akan membahas salah satu tools implementasi dari Continues Integration (CI) yaitu menggunakan Gitlab CI. 

Gitlab CI menawarkan 3 konsep yaitu **Continues Integration**, **Continues Delivery** dan **Continues Deployment**. Out-of-the-box management systems can decrease hours spent on maintaining toolchains by 10% or more, so you can test, build, and publish your software with no third-party application or integration needed because Gitlab CI is the part of Gitlab.

Okay karena pembahasan kali ini akan lumayan panjang jadi kita bagi-bagi menjadi beberapa section diantaranya:

1. Gitlab CI/CD workflow
2. What can Gitlab CI/CD do?

<!--more-->

## Gitlab CI/CD workflow

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


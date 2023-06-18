---
lang: gitlab
catalog_key: gitlab-ci
title: "Getting started: Create and run your first Gitlab CI/CD pipeline"
categories:
- git
- gitlab
- gitlab-ci
refs: 
- https://docs.gitlab.com/ee/ci/quick_start/
youtube: 
image_path: /resources/posts/gitlab-ci/03d-getting-started
gist: dimMaryanto93/fd40c02b1cc0d4eccb7c03103397591b
downloads: []
---

Hai semuanya, sekarang kita akan mencoba menggunakan Gitlab CI/CD pipeline. Tetapi ada beberapa prerequisites yang harus dipenuhi diantaranya:

Before you start, make sure you have:

- A project in GitLab that you would like to use CI/CD for.
- The Maintainer or Owner role for the project.

To create and run your first pipeline:

- Ensure you have runners available to run your jobs. To view available runners: Go to `Settings > CI/CD` and expand `Runners`.
- If you’re using [gitLab.com](gitLab.com), you can skip this step. [gitLab.com](gitLab.com) provides shared runners for you. If you don’t have a runner
    1. [Install GitLab Runner](https://docs.gitlab.com/runner/install/) on your local machine.
    2. [Register the runner](https://docs.gitlab.com/runner/register/) for your project. Choose the shell executor.
- Create a `.gitlab-ci.yml` file at the root of your repository. This file is where you define the CI/CD jobs.

When you commit the file to your repository, the runner runs your jobs. The job results are displayed in a pipeline.

Okay karena pembahasan kali ini akan lumayan panjang, jadi kita akan bagi-bagi menjadi beberapa bagian diantaranya seperti berikut:

1. Create a `.gitlab-ci.yml` file
2. Running the Gitlab CI pipelines
3. How Gitlab CI/CD pipeline works?
4. Tips for writing the `.gitlab-ci.yml`
5. Tips for design Gitlab CI/CD pipeline

<!--more-->

## Create a `.gitlab-ci.yml` file


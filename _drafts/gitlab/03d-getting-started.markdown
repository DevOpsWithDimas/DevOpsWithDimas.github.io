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

File `.gitlab-ci.yml` basiclly it's a [YAML](https://en.wikipedia.org/wiki/YAML) format that you can specify to instruction of Gitlab CI/CD. in this file, you can define:

- The structure and order of jobs that the runner should execute.
- The decisions the runner should make when specific conditions are encountered.

To create a `.gitlab-ci.yml` file you can used:

- Manually, by using text-editor such as vscode, vim, nodepad, etc
- Build-in text-editor by gitlab

    {% gist page.gist "03d-basic-gitlab-ci.yml" %}

    This example shows four jobs: `build-job`, `test-job1`, `test-job2`, and `deploy-prod`. The comments listed in the `echo` commands are displayed in the UI when you view the jobs. The values for the [predefined variables](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html) `$GITLAB_USER_LOGIN` and `$CI_COMMIT_BRANCH` are populated when the jobs run.

- Then submit, commit & push

Now take a look at your pipeline and the jobs within.

1. Go to **CI/CD > Pipelines**. A pipeline with three stages should be displayed:

    ![gitlab-pipeline]({{ page.image_path | prepend: site.baseurl }}/01-pipeline.png)

2. View a visual representation of your pipeline by selecting the pipeline ID:

    ![gitlab-pipeline-detail]({{ page.image_path | prepend: site.baseurl }}/01a-pipeline-detail.png)

3. View details of a job by selecting the job name.

    - This is `build-job`
        ![job-build]({{ page.image_path | prepend: site.baseurl }}/01b-job-build.png)

    - This is `build-test2`
        ![job-build]({{ page.image_path | prepend: site.baseurl }}/01c-job-test2.png)

    - This is `build-deploy-prod`
        ![job-build]({{ page.image_path | prepend: site.baseurl }}/01d-job-deploy-prod.png)

You have successfully created your first CI/CD pipeline in GitLab. Congratulations!

Now you can get started customizing your `.gitlab-ci.yml` and defining more advanced jobs.
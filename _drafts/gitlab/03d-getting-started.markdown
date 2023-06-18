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

## Running the Gitlab CI pipelines

By default, when you push or changed the file of `.gitlab-ci.yml` it's trigger pipeline to run, but we have an other way to run it. Here is 4 deffrent method to the run pipeline:

- Workflow (`rules`, `only`)
- Manually run pipeline
- Schedule to run pipeline
- Trigger using (`webhook`, `rest-api`)

### Updating file `.gitlab-ci.yml`

Okay kita bahas satu-per-satu, mulai dari update file `.gitlab-ci.yml` yang sebelumnya seperti berikut:

{% gist page.gist "03d-basic-gitlab-ci-edited.yml" %}

Ketika di push maka secara otomatis akan jalan pipeline baru seperti berikut:

![gitlab-pipeline-edited]({{ page.image_path | prepend: site.baseurl }}/02a-gitlab-ci-edited.png)

The output will print look like this:

```bash
Hello, my name is Dimas Maryanto ! \n i'm trying to learn CI/CD feature with Gitlab CI
```

### Using workflow

Sekarang kita coba untuk workflow method, dengan mengupdate file `.gitlab-ci.yml` menggunakan property `only` atau `rules` seperti berikut:

{% gist page.gist "03d-basic-gitlab-ci-workflow.yml" %}

Ketika di push maka secara otomatis akan jalan pipeline baru dan berikut adalah pipeline detailnya:

![gitlab-pipeline-detail-workflow]({{ page.image_path | prepend: site.baseurl }}/02b-workflow-pipeline-detail.png)

Nah terlihat disana terdapat 3 job yaitu `build-job`, `test-job2` dan `deploy-prod`. Terus untuk job `test-job1` kemana?

Job `test-job1` hanya akan muncul jika kita membuat `branch`, `tags` atau `commit message` dengan prefix `-release` seperti berikut:

Kita coba buat tag `2023.06.18.12.51-release` pada branch `main seperti berikut:

![create-tags]({{ page.image_path | prepend: site.baseurl }}/02c-workflow-create-tag.png)

Sekarang jika kita lihat pada pipeline detail yang terbaru maka jobnya jalan seperti berikut:

![workflow-tags]({{ page.image_path | prepend: site.baseurl }}/02c-workflow-create-tag-pipeline.png){: width="400" }

Dengan dengan membuat tag tersebut, kita menjalankan kembali job sebelumnya beserta `test-job1` tetapi tanpa job `deploy-prod`

Sedangkan untuk menjalankan yang job `build-prod` kita bisa membuat Merge request dari branch dengan prefix `hotfix/` ke branch default yang which is `main`.

- Buat branch baru misalnya dengan nama `hotfix/issue01` dari branch main
- Buat perubahan dan commit serta push
- Buat merge request ke main maka hasilnya seperti berikut:

![workflow-merge-request]({{ page.image_path | prepend: site.baseurl }}/02d-workflow-mr.png){: width="400" }

### Manually run pipeline

Selain menggunakan script based, dan workflow Gitlab CI kita juga bisa menjalankan pipeline secara manual dengan click `Run pipeline` pada menu `Pipelines` seperti berikut:

![manual-run-pipeline]({{ page.image_path | prepend: site.baseurl }}/03a-manual-run-pipeline.png)

![form-run-pipeline]({{ page.image_path | prepend: site.baseurl }}/03b-form-run-pipeline.png)

Kemudian muncul form seperti berikut, jika tidak ada option yang kita define pada script `.gitlab-ci.yml` just click the button, hasilnya seperti berikut:

![form-run-pipeline]({{ page.image_path | prepend: site.baseurl }}/03c-manual-run-pipeline.png)

### Schedule to run pipeline

Lanjutan dari run pipeline secara manual tersebut, kita juga bisa meng-schedule pipeline dengan menggunakan cron pattern caranya 

- Akses ke menu **Pipelines -> Schedule** seperti berikut:

    ![schedule-pipeline]({{ page.image_path | prepend: site.baseurl }}/03c-manual-run-pipeline.png)

- Misalnya kita mau menjalankan pipeline tersebut setiap 5 menit, jadi pilih Interfal pattern `Custom` input seperti berikut `*/5 * * * *`

- Kemudian save, seperti berikut:

![schedule-list]({{ page.image_path | prepend: site.baseurl }}/04a-schedule-pipeline.png)

Dan perhatikan ke menu Pipeline 5 menit mendatang hasilnya seperti berikut:

![run-from-schedule]({{ page.image_path | prepend: site.baseurl }}/04b-schedule-run.png)

### Trigger using (`webhook`, `rest-api`)

Yang terkahir kita juga bisa me-trigger dari Webhook atau Rest-API menggunakan tools seperti `curl` atau bahkan Postman. Untuk membuat Gitlab CI yang bisa di triger kita membuat dulu TOKEN di menu **Settings -> CI/CD -> expand Triger pipeline** seperti berikut:

![create-token-trigger]({{ page.image_path | prepend: site.baseurl }}/05a-trigger-token.png)

Kemudian input nama/description contohnya `trigger-curl` dan kemudian click button `Add triger` maka akan muncul tokennya, coba simpan token tersebut.

Setelah itu kita bisa triger pipeline dengan perintah curl berikut:

{% highlight bash %}
curl -X POST \
     --fail \
     -F token=TOKEN \
     -F ref=REF_NAME \
     PROTOCOL://SERVER_GITLAB/api/v4/projects/PROJECT_ID/trigger/pipeline
{% endhighlight %}

Sekarang coba jalankan perintah berikut di terminal

```bash
➡ curl -X POST \
     --fail \
     -F token=glptt-da5dbea331d2c78071752e4528ba52c34a9a9567 \
     -F ref=main \
     https://gitlab.dimas-maryanto.com/api/v4/projects/364/trigger/pipeline

"id":1029,"iid":12,"project_id":364,"sha":"93b7c2cfda83cda7b42bea5619c2756f7e57022e","ref":"main","status":"created","source":"trigger","created_at":"2023-06-18T07:00:35.016Z","updated_at":"2023-06-18T07:00:35.016Z","web_url":"https://gitlab.dimas-maryanto.com/examples/gitlab-ci-cd/test-gitlab-ci/-/pipelines/1029","before_sha":"0000000000000000000000000000000000000000","tag":false,"yaml_errors":null,"user":{"id":2,"username":"dimasm93","name":"Dimas Maryanto","state":"active","avatar_url":"https://gitlab.dimas-maryanto.com/uploads/-/system/user/avatar/2/avatar.png","web_url":"https://gitlab.dimas-maryanto.com/dimasm93"},"started_at":null,"finished_at":null,"committed_at":null,"duration":null,"queued_duration":null,"coverage":null,"detailed_status":{"icon":"status_created","text":"created","label":"created","group":"created","tooltip":"created","has_details":true,"details_path":"/examples/gitlab-ci-cd/test-gitlab-ci/-/pipelines/1029","illustration":null,"favicon":"/assets/ci_favicons/favicon_status_created-4b975aa976d24e5a3ea7cd9a5713e6ce2cd9afd08b910415e96675de35f64955.png"}}%
```

Sekarang kita lihat hasilnya:

![trigger-curl]({{ page.image_path | prepend: site.baseurl }}/05b-triger-pipeline.png)
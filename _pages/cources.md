---
title: 'Grow your **Future Skill ...**'
layout: collection
permalink: /pages/cources/
entries_layout: grid
classes: wide
author_profile: true
tagline: "Hundreds of videos! Thousands of tutorial blog posts! Feeling lost yet? <br><br>**Watch. Learn. Do. Learn.**<br><br>Watching video tutorials is just the beginning. Get hands-on assignments with course videos that allow you to actually apply and implement what is being taught in the course material."
header:
  overlay_image: "assets/images/cources.png"
  overlay_filter: 0.5
  caption: "More info: youtube.dimas-maryanto.com"
  actions:
    - label: "Start learning"
      url: "https://www.udemy.com/user/dimas-maryanto-2"
pagination:
  enabled: true
  collection: cources
  title: ':title'
  per_page: 8
---

{% if paginator %}
  {% assign posts = paginator.posts %}
{% else %}
  {% assign posts = site.cources %}
{% endif %}
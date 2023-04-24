---
title: Roadmaps
layout: collection
permalink: /pages/roadmaps/
entries_layout: grid
classes: wide
author_profile: true
tagline: "Hundreds of videos! Thousands of tutorial blog posts! Feeling lost yet? <br><br>**Watch. Learn. Do. Learn.**<br><br>Watching video tutorials is just the beginning. Get hands-on assignments with course videos that allow you to actually apply and implement what is being taught in the course material."
header:
  overlay_image: "assets/images/roadmap.webp"
  overlay_filter: 0.5
  caption: "More info: youtube.dimas-maryanto.com"
pagination:
  enabled: true
  collection: roadmaps
  title: ':title'
  per_page: 8
  sort_field: 'publish'
  sort_reverse: true
---

{% if paginator %}
  {% assign posts = paginator.roadmaps %}
{% else %}
  {% assign posts = site.roadmaps %}
{% endif %}
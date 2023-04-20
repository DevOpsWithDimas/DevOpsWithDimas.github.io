---
layout: null
permalink: /api/posts
pagination:
  permalink: ''
  enabled: true
  extension: .json
  indexpage: 'feed-:num'
---

{
  "pages": [{% for post in paginator.posts %}
    {% if forloop.first != true %},{% endif %}
    {
      "title": "{{ post.title }}",
      "link": "{{ post.url }}"
    }{% endfor %}
  ]
}
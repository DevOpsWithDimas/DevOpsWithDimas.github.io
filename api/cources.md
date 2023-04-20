---
layout: null
permalink: /api/cources
pagination:
  permalink: ''
  enabled: true
  collection: cources
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
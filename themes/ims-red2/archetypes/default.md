---
title: "{{ replace .TranslationBaseName "-" " " | title }}"
date: {{ .Date }}
draft: true
menu:
  main:
    pre: "<i class='fa fa-info fa-fw'></i>"
    identifier: {{ .TranslationBaseName }}
    weight: 10
---
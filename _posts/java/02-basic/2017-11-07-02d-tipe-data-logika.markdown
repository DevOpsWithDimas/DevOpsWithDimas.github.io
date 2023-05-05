---
lang: java
catalog_key: basic
title: "Tipe data logika (true of false)"
date: 2017-11-07T22:05:46+07:00
categories:
- language
- java
- basic
refs: 
- https://docs.oracle.com/javase/7/docs/api/java/lang/Boolean.html
youtube: 
comments: true
gist: dimMaryanto93/96aad3c6bed60d010757c7d1acba930a
image_path: /resources/posts/java-se/01-silabus
---

Tipe data logika ini pada dasarnya adalah yang mengembalikan nilai boolean. Boolean hanya bernilai `true` or `false`. 

<!--more-->

contohnya basicnya 

{% highlight java linenos %}
public class TipeDataLogika {
    public static void main(String[] x){
        Boolean isValid = true;
        System.out.println(
            "Nilai dari variable isValid adalah " + 
            isValid ? "Benar" : "Salah"
        );
    }
}
{% endhighlight %}

Selain itu kita juga bisa menggunakan operator `==` sebagai perbadingan seperti berikut contohnya: 

{% highlight java linenos %}
public class PerbandinganDenganOperator {
    publis static void main(String[] args){
        Integer bilanganBulat = 10;
        Boolean isZero = (bilanganBulat == 10);
        System.out.println(
            "Variable bilangan apakah sama dengan 10 : "+ 
            isZero ? "Ya benar" : "Anda salah"
        );
    }
}
{% endhighlight %}
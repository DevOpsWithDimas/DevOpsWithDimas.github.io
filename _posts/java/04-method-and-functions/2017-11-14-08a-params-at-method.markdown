---
lang: java
catalog_key: method-and-functions
title: "Menerima data dari paramenter ke dalam Function"
date: 2017-11-14T20:42:11+07:00
categories:
- language
- java
- function
refs: []
youtube: 
comments: true
gist: dimMaryanto93/96aad3c6bed60d010757c7d1acba930a
image_path: 
---

Di materi sebelumnya kita udah belajar membuat function atau method, Jadi di function atau method pada dasarnya bisa mengeluarkan data `return` atau menerima data `parameterize`, Untuk menerima data ada istilah yang namanya `parameter` atau katalainnya `arguments` seperti berikut contohnya:

<!--more-->

{% highlight java linenos %}
public class FunctionWithArgs {

    public static void sayHalo(String nama){
        System.out.println("Halo nama saya " + nama);
    }

    public static void main(String[] args){
        sayHalo("Dimas Maryanto");
    }
}
{% endhighlight %}

Untuk yang disebut parameter adalah `String nama` dalam method `sayHalo` kemudian dipanggil di method `main(String[])` dengan mengisi nilai untuk variable `nama` tersebut dengan nilai `Dimas Maryanto`.

Selain itu, kita bisa menggunakan multiple parameters atau arguments dengan cara memisahkan dengan tanda koma `,` contohnya seperti berikut:

{% highlight java linenos %}
public class MultipleParamsInOneMethod {

    public static void sayHalo(String namaDepan, String namaBelakang, Integer umur){
        StringBuilder sb = new StringBuilder();
        sb.append(namaDepan).append(" ").append(namaBelakang);
        String namaLengkap = sb.toString();
        System.out.println(
            "Halo nama lengkap saya adalah " + namaLengkap + " dan umur saya berusia " + umur + " tahun "
        );
    }

    public static void main(String[] args){
        sayHalo("Dimas", "Maryanto", 25);
    }
}
{% endhighlight %}
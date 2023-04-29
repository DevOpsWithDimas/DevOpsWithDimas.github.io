---
lang: java
catalog_key: introduction
title: "Java Platform, Architecture & Versions"
categories:
- language
- java
refs: 
- https://docs.oracle.com/javaee/6/firstcup/doc/gkhoy.html
youtube: 
comments: true
gist: dimMaryanto93/96aad3c6bed60d010757c7d1acba930a
image_path: /resources/posts/java/01c-java-architecture
downloads: []
---


description...

1. Java Platforms / Editions?
2. Java Architecture
    1. JVM, Java Virtual Machine
    2. JRE, Java Runtime Environtment
    3. JDK, Java Development Kit
3. Versions of Java

Ok langsung aja kita bahas materi yang pertama:

<!--more-->

## Java Platforms / Editions?

There are four platforms of the Java programming language:

1. Java Platform, Standard Edition (Java SE)
2. Java Platform, Enterprise Edition (Java EE)
3. Java Platform, Micro Edition (Java ME)
4. JavaFX

All Java platforms consist of a Java Virtual Machine (VM) and an application programming interface (API). The Java Virtual Machine is a program, for a particular hardware and software platform, that runs Java technology applications. An API is a collection of software components that you can use to create other software components or applications. Each Java platform provides a virtual machine and an API, and this allows applications written for that platform to run on any compatible system with all the advantages of the Java programming language: platform-independence, power, stability, ease-of-development, and security.

## Java Architecture

![JDK vs JRE]({{ page.image_path | prepend: site.baseurl }}/java-arc.png)

### Level Tools & Tools APIs
1. `javac` untuk melakukan compilasi
2. `java` untuk menjalankan hasil compilasi atau bytecode
3. `javadoc` untuk membuat Dokumentasi di dalam koding Java
4. `jar`, `war`, `ejb` dan `ear` hasil akhir project Java, defaultnya `jar` untuk aplikasi desktop dan `war` untuk aplikasi web atau Java EE.

### Level Development

1. `Java Web`, web development di Java biasanya menggunakan teknologi `Servlet` & `JSP`
2. `Applet`, Aplikasi desktop yang bisa berjalan di Browser
3. `JavaFX`, Aplikasi desktop yang modern sebelumya sebagai pengganti `Java Swing`
4. `Java Swing`, Aplikasi desktop yang berfokus pada component

### Level Base Libraries

1. `JDBC`, API yang digunakan untuk mengakses Database Relational seperti MySQL, Oracle, PostgreSQL dan lain-lain.
2. `RMI`, Remote Method Invocation untuk mengakses resourse server (Client-Server Application)
3. `Networking`, Java API untuk Jaringan.
4. `Date & Time`, Java API untuk mengakses waktu dan date di system (Operation System)
5. `Internationalization`, digunakan untuk membuat aplikasi multi bahasa contohnya ingin membuat aplikasi yang menggunakan bahasa indonesia, bahasa arab dll.
6. `Math`, Java API untuk melakukan perhitungan matematika, fisika dll
7. `Collections`, Java API untuk menyimpan nilai yang multi value (Array)
8. dll masih banyak lagi ya... gak bisa disebutin satu-satu karena kebanyakan wkwkw

Nah semua teknologi diatas mulai dari level tools & tools API, development, dan base libraries itu berjalan di atas Java Virtual Machine atau yang bisa disebut JVM. OK nah mungkin dari temen-temen agak pusing kok banyak banget ya... ya teknologi Java itu memang luas banget blum lagi klo integrasi sama teknologi lain atau frameworknya Java seperti `Spring Framework`, `Play Framework`, `ZKoss`, `Vaadin` dll.
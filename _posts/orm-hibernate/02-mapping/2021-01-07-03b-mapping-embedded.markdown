---
lang: orm-hibernate
catalog_key: orm-mapping
title: "Embbeded Mapping"
date: 2021-01-07T12:57:19+07:00
categories:
- Framework
- java
- orm
- hibernate
- mapping
refs: 
- http://docs.jboss.org/hibernate/orm/5.2/userguide/html_single/Hibernate_User_Guide.html
youtube: dzEVXB5noo8
comments: true
gist: dimMaryanto93/e8d2abb5361e811860d6a462270f119b
image_path: /resources/posts/orm-hibernate/03b-embbeded-mapping
downloads: []
---

Hai, di materi kali ini saya akan membahas embedded mapping, Embedded mapping ini biasanya digunakan untuk mapping sebuah entity dengan model yang terpisah kedalam sebuah single database table. contohnya seperti berikut:

<!--more-->

Implementasi Embedded Model: 

{% gist page.gist "AlamatEmbeddable.java" %}

Implementasi Entity: 

{% gist page.gist "MahasiswaEmbedded.java" %}

Implementasi DAO:

{% gist page.gist "MahasiswaEmbeddedDao.java" %}

Implementasi Unit Test:

{% gist page.gist "TestMahasiswaEmbedded.java" %}

Jika di running, maka hasilnya seperti berikut:

```bash
INFO: HHH10001501: Connection obtained from JdbcConnectionAccess [org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator$ConnectionProviderJdbcConnectionAccess@553da911] for (non-JTA) DDL execution was not in auto-commit mode; the Connection 'local transaction' will be committed and the Connection will be set into auto-commit mode.
Hibernate: 
    
    create table embedded.mahasiswa_embedded (
       id int8 not null,
        kecamatan varchar(100),
        kelurahan varchar(100),
        kode_pos int4,
        kota varchar(50),
        provinsi varchar(50),
        rt int4,
        rw int4,
        nama varchar(50) not null,
        nim varchar(8) not null,
        tahun_masuk int4 not null,
        tanggal_lahir date not null,
        primary key (id)
    )
Hibernate: 
    
    alter table if exists embedded.mahasiswa_embedded 
       drop constraint if exists UK_51hpfp15l52864g1il3uebyyl
Jan 06, 2021 7:59:02 PM org.hibernate.engine.jdbc.spi.SqlExceptionHelper$StandardWarningHandler logWarning
WARN: SQL Warning Code: 0, SQLState: 00000
Jan 06, 2021 7:59:02 PM org.hibernate.engine.jdbc.spi.SqlExceptionHelper$StandardWarningHandler logWarning
WARN: constraint "uk_51hpfp15l52864g1il3uebyyl" of relation "mahasiswa_embedded" does not exist, skipping
Hibernate: 
    
    alter table if exists embedded.mahasiswa_embedded 
       add constraint UK_51hpfp15l52864g1il3uebyyl unique (nim)
Jan 06, 2021 7:59:02 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    select
        nextval ('hibernate_sequence')
Hibernate: 
    insert 
    into
        embedded.mahasiswa_embedded
        (kecamatan, kelurahan, kode_pos, kota, provinsi, rt, rw, nama, nim, tahun_masuk, tanggal_lahir, id) 
    values
        (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
[main] INFO com.maryanto.dimas.bootcamp.test.embedded.TestMahasiswaEmbedded - destroy hibernate session!
```

Sekarang kita coba check di tabelnya hasilnya seperti berikut:

![mahasiswa-embedded]({{ page.image_path | prepend: site.baseurl }}/mahasiswa_embedded.png)

## With Override Attribute

{% gist page.gist "AlamatEmbeddable.java" %}

Dengan penambahan property `alamatRumah` dan `alamatOrangTua` seperti berikut  Implementasi Entitynya: 

{% gist page.gist "MahasiswaEmbeddedOverrideAttributes.java" %}

Implementasi DAO:

{% gist page.gist "MahasiswaEmbeddedOverrideAttributesDao.java" %}

Implementasi Unit Test:

{% gist page.gist "TestMahasiswaEmbeddedOverrideAttribute.java" %}

Jika di running unit testingnya, maka hasilnya seperti berikut:

```bash
INFO: HHH10001501: Connection obtained from JdbcConnectionAccess [org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator$ConnectionProviderJdbcConnectionAccess@73041b7d] for (non-JTA) DDL execution was not in auto-commit mode; the Connection 'local transaction' will be committed and the Connection will be set into auto-commit mode.
Hibernate: 
    
    create table embedded.mahasiswa_override_att (
       id int8 not null,
        ortu_kecamatan varchar(100),
        ortu_kelurahan varchar(100),
        ortu_kode_pos int4,
        ortu_kota varchar(50),
        ortu_jalan varchar(100),
        ortu_provinsi varchar(50),
        ortu_rt int4,
        ortu_rw int4,
        rumah_kecamatan varchar(100) not null,
        rumah_kelurahan varchar(100) not null,
        rumah_kode_pos int4 not null,
        rumah_kota varchar(50) not null,
        rumah_jalan varchar(100),
        rumah_provinsi varchar(50) not null,
        rumah_rt int4 not null,
        rumah_rw int4 not null,
        nama varchar(50) not null,
        nim varchar(8) not null,
        tahun_masuk int4 not null,
        tanggal_lahir date not null,
        primary key (id)
    )
Hibernate: 
    
    alter table if exists embedded.mahasiswa_override_att 
       drop constraint if exists UK_mjjn3dfrmwoi4uo07atagrw4w
Jan 06, 2021 8:37:18 PM org.hibernate.engine.jdbc.spi.SqlExceptionHelper$StandardWarningHandler logWarning
WARN: SQL Warning Code: 0, SQLState: 00000
Jan 06, 2021 8:37:18 PM org.hibernate.engine.jdbc.spi.SqlExceptionHelper$StandardWarningHandler logWarning
WARN: constraint "uk_mjjn3dfrmwoi4uo07atagrw4w" of relation "mahasiswa_override_att" does not exist, skipping
Hibernate: 
    
    alter table if exists embedded.mahasiswa_override_att 
       add constraint UK_mjjn3dfrmwoi4uo07atagrw4w unique (nim)
Jan 06, 2021 8:37:18 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    select
        nextval ('hibernate_sequence')
Hibernate: 
    insert 
    into
        embedded.mahasiswa_override_att
        (ortu_kecamatan, ortu_kelurahan, ortu_kode_pos, ortu_kota, ortu_jalan, ortu_provinsi, ortu_rt, ortu_rw, rumah_kecamatan, rumah_kelurahan, rumah_kode_pos, rumah_kota, rumah_jalan, rumah_provinsi, rumah_rt, rumah_rw, nama, nim, tahun_masuk, tanggal_lahir, id) 
    values
        (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
[main] INFO com.maryanto.dimas.bootcamp.test.embedded.TestMahasiswaEmbeddedOverrideAttribute - destroy hibernate session!
```

Sekarang kita check di table, berikut hasilnya:

![embbeded-mapping-override-att]({{ page.image_path | prepend: site.baseurl }}/embedded-override-attributes.png)
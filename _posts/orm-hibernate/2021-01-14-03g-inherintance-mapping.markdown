---
lang: orm-hibernate
catalog_key: orm-mapping
title: "Inherintance Mapping"
date: 2021-01-14T15:04:24+07:00
categories:
- Java
- ORM
- Hibernate
- PostgreSQL
refs: 
- https://docs.jboss.org/hibernate/orm/5.4/userguide/html_single/Hibernate_User_Guide.html#entity-inheritance
youtube: k9_Jk-9hK_w
comments: true
gist: dimMaryanto93/e8d2abb5361e811860d6a462270f119b
image_path: /resources/posts/orm-hibernate/03g-inherintance-mapping
downloads: []
---

Hai, di materi kali ini kita akan membahas tentang Inheritance Mapping menggunakan ORM Hibernate Framework. Nah sekedar informasi pada Database Relation tidak support object orientied paradigma seperti Pewarisan, Override, Overload dan lain-lain. Tetapi dengan menggunakan Object Relation Mapping kita bisa menggunakan feature

1. MappedSupperclass
2. Single Table
3. Joined Table
4. Table Per Class

Yuk langsung aja kita bahas satu-per-satu

<!--more-->

## MappedSuperclass mapping

Untuk mencoba mapping ini, kita membutuhkan 2 tabel yang memiliki column yang hampir sama contohnya `mobil` sama `motor` berikut adalah perancangan databasenya:

![erd]({{ page.image_path | prepend: site.baseurl }}/erd-mappedsuperclass.png)

Implementasi Entity superclass:

{% gist page.gist "KendaraanMappedSuperclass.java" %}

Implementasi Entity child `mobil`:

{% gist page.gist "MobilMappedSuperclass.java" %}

Implementasi Entity child `motor`:

{% gist page.gist "MotorMappedSuperClass.java" %}

Implementasi DAO untuk `mobil`:

{% gist page.gist "MobilMappedSuperClassDao.java" %}

Implementasi DAO untuk `motor`:

{% gist page.gist "MotorMappedSuperClassDao.java" %}

Kemudian kita buat unit testingnya seperti berikut:

{% gist page.gist "TestMappedSuperClass.java" %}

Jika di running maka hasilnya seperti berikut:

```bash
INFO: HHH10001501: Connection obtained from JdbcConnectionAccess [org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator$ConnectionProviderJdbcConnectionAccess@1e1e837d] for (non-JTA) DDL execution was not in auto-commit mode; the Connection 'local transaction' will be committed and the Connection will be set into auto-commit mode.
Hibernate: 
    
    create table inherintance.mobil_mappedsuperclass (
       id varchar(64) not null,
        cc int4,
        jumlah_cylinder int4,
        jumlah_roda int4,
        nama varchar(50),
        nama_pabrikan varchar(50) not null,
        is_all_wheel_drive boolean not null,
        jumlah_kursi int4,
        primary key (id)
    )
Hibernate: 
    
    create table inherintance.motor_mappedsuperclass (
       id varchar(64) not null,
        cc int4,
        jumlah_cylinder int4,
        jumlah_roda int4,
        nama varchar(50),
        nama_pabrikan varchar(50) not null,
        jenis_rantai varchar(255),
        primary key (id)
    )
Jan 16, 2021 12:00:08 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    insert 
    into
        inherintance.mobil_mappedsuperclass
        (cc, jumlah_cylinder, jumlah_roda, nama, nama_pabrikan, is_all_wheel_drive, jumlah_kursi, id) 
    values
        (?, ?, ?, ?, ?, ?, ?, ?)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestMappedSuperClass - mobil: MobilMappedSuperclass(super=KendaraanMappedSuperclass(nama=Honda BRIO, jumlahRoda=4, jumlahCylinder=4, cc=1000, namaPabrikan=PT. Honda Motor Company), id=c5a7398c-a79c-4abd-9c55-deb3ec1e2bad, jumlahKursi=4, allWheelDrive=false)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestMappedSuperClass - destroy hibernate session!
```

## SingleTable mapping

Untuk mencobanya disini masih menggunakan contoh kasus yang sama yaitu kendaran yang terdiri dari `mobil` dan `motor`. berikut adalah perancangan tabelnya:

![erd]({{ page.image_path | prepend: site.baseurl }}/erd-singletable.png)

contoh implementasinya seperti berikut

Implementasi Entity kendaraan:

{% gist page.gist "KendaraanSingleTableEntity.java" %}

Implementasi Entity Mobil:

{% gist page.gist "MobilSingleTableEntity.java" %}

Implementasi Entity Motor:

{% gist page.gist "MotorSingleTableEntity.java" %}

Setelah itu kita buat DAO, karena kita menggunakan single table jadi kita cukup membuat 1 class DAO saja contohnya seperti berikut:

{% gist page.gist "KendaraanSingleTableDao.java" %}

Kemudian kita buat unit testing untuk menyimpan data mobil dan motor, implementasinya seperti berikut:

{% gist page.gist "TestKendaraanSingleTable.java" %}

Jika di running maka hasilnya seperti berikut:

```bash
INFO: HHH10001501: Connection obtained from JdbcConnectionAccess [org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator$ConnectionProviderJdbcConnectionAccess@30f28b5] for (non-JTA) DDL execution was not in auto-commit mode; the Connection 'local transaction' will be committed and the Connection will be set into auto-commit mode.
Hibernate: 
    
    create table inherintance.kendaraan_singletable (
       DTYPE varchar(31) not null,
        id varchar(255) not null,
        cc int4,
        jumlah_cylinder int4,
        jumlah_roda int4,
        nama varchar(50),
        nama_pabrikan varchar(50) not null,
        is_all_wheel_drive boolean,
        jumlah_kursi int4,
        jenis_rantai varchar(255),
        primary key (id)
    )
Jan 16, 2021 12:53:13 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTable - connected!
Hibernate: 
    insert 
    into
        inherintance.kendaraan_singletable
        (cc, jumlah_cylinder, jumlah_roda, nama, nama_pabrikan, is_all_wheel_drive, jumlah_kursi, DTYPE, id) 
    values
        (?, ?, ?, ?, ?, ?, ?, 'MobilSingleTableEntity', ?)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTable - mobil: MobilSingleTableEntity(super=KendaraanSingleTableEntity(id=a010edcd-e33c-4e4e-b33e-75df8e3f1f31, nama=Honda BRIO, jumlahRoda=4, jumlahCylinder=4, cc=1000, namaPabrikan=PT. Honda Motor Company), jumlahKursi=4, allWheelDrive=false)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTable - destroy hibernate session!
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTable - init hibernate session
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTable - connected!
Hibernate: 
    insert 
    into
        inherintance.kendaraan_singletable
        (cc, jumlah_cylinder, jumlah_roda, nama, nama_pabrikan, jenis_rantai, DTYPE, id) 
    values
        (?, ?, ?, ?, ?, ?, 'MotorSingleTableEntity', ?)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTable - mobil: MotorSingleTableEntity(super=KendaraanSingleTableEntity(id=9e3515af-1138-4738-9a0c-d1bfa18f4360, nama=BMW S1000RR, jumlahRoda=2, jumlahCylinder=4, cc=1000, namaPabrikan=PT. BMW Motorrad), jenisRantai=Rantai)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTable - destroy hibernate session!
```

Jika kita check ke table, hasilnya seperti berikut:

![select-table]({{ page.image_path | prepend: site.baseurl }}/select-tables-singletable.png)

## SingleTable with Discriminator

Saya mau mengebahas tentang annotation `@Discriminator`, dengan annotation tersebut kita bisa menubah property/column `dtype` yang hibernate buat. contohnya disini saya mau ganti menjadi `jenis_kendaraan` dengan pilihan class `MobilSingleTable = Mobil` dan `MotorSingleTable = Motor`. 

berikut Implementasi Entity Kendaraan:

{% gist page.gist "KendaraanSingleTableDiscriminatorEntity.java" %}

Impementasi Entity Mobil:

{% gist page.gist "MobilSingleTableDiscriminatorEntity.java" %}

Implementasi Entity Motor:

{% gist page.gist "MotorSingleTableDiscriminatorEntity.java" %}

Implementasi DAO Kendaraan:

{% gist page.gist "KendaraanSingleTableDiscriminatorDao.java" %}

Implementasi Unit Testing Kendaraan:

{% gist page.gist "KendaraanSingleTableDiscriminatorDao.java" %}

Jika unit testing di running maka hasilnya seperti berikut:

```bash
INFO: HHH10001501: Connection obtained from JdbcConnectionAccess [org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator$ConnectionProviderJdbcConnectionAccess@595f9916] for (non-JTA) DDL execution was not in auto-commit mode; the Connection 'local transaction' will be committed and the Connection will be set into auto-commit mode.
Hibernate: 
    
    create table inherintance.kendaraan_singletable_discriminator (
       jenis_kendaraan varchar(31) not null,
        id varchar(255) not null,
        cc int4,
        jumlah_cylinder int4,
        jumlah_roda int4,
        nama varchar(50),
        nama_pabrikan varchar(50) not null,
        is_all_wheel_drive boolean,
        jumlah_kursi int4,
        jenis_rantai varchar(255),
        primary key (id)
    )
Jan 16, 2021 3:59:53 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTableDiscriminator - connected!
Hibernate: 
    insert 
    into
        inherintance.kendaraan_singletable_discriminator
        (cc, jumlah_cylinder, jumlah_roda, nama, nama_pabrikan, is_all_wheel_drive, jumlah_kursi, jenis_kendaraan, id) 
    values
        (?, ?, ?, ?, ?, ?, ?, 'Mobil', ?)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTableDiscriminator - mobil: MobilSingleTableDiscriminatorEntity(super=KendaraanSingleTableDiscriminatorEntity(id=c5896473-7455-4e0d-8863-d386366e43d1, nama=Honda BRIO, jumlahRoda=4, jumlahCylinder=4, cc=1000, namaPabrikan=PT. Honda Motor Company), jumlahKursi=4, allWheelDrive=false)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSingleTableDiscriminator - destroy hibernate session!
```

Nah coba kita check tabelnya, maka hasilnya sebagai berikut:

![select-tables]({{page.image_path | prepend: site.baseurl }}/select-tables-singletable-discriminator.png)

## JoinTable Mapping

saya mau ngebahas Inherintance Mapping dengan metode Join Table, masih dalam contoh yang sama yaitu `kendaraan` yaitu `mobil` dan `motor` namun kali ini berikut adalah perancangan tabelnya:

![erd]({{ page.image_path | prepend: site.baseurl }}/erd-jointable.png)

and berikut adalah adalah Implementasi Entity Kendaraan:

{% gist page.gist "KendaraanJoinTableEntity.java" %}

Implementasi Entity Mobil:

{% gist page.gist "MobilJoinTableEntity.java" %}

Implementasi Entity Motor: 

{% gist page.gist "MotorJoinTableEntity.java" %}

Implementasi DAO Kendaraan:

{% gist page.gist "KendaraanJoinTableDao.java" %}

dan yang terakhir berikut adalah Implementasi Unit Testingnya:

{% gist page.gist "TestKendaraanJoinTable.java" %}

Jika di jalankan unit testing untuk method `testSaveMotor` maka hasilnya seperti berikut:

```bash
INFO: HHH10001501: Connection obtained from JdbcConnectionAccess [org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator$ConnectionProviderJdbcConnectionAccess@35563e4c] for (non-JTA) DDL execution was not in auto-commit mode; the Connection 'local transaction' will be committed and the Connection will be set into auto-commit mode.
Hibernate: 
    
    create table inherintance.kendaraan_jointable (
       id varchar(255) not null,
        cc int4,
        jumlah_cylinder int4,
        jumlah_roda int4,
        nama varchar(50),
        nama_pabrikan varchar(50) not null,
        primary key (id)
    )
Hibernate: 
    
    create table inherintance.mobil_jointable (
       is_all_wheel_drive boolean,
        jumlah_kursi int4,
        kendaraan_id varchar(255) not null,
        primary key (kendaraan_id)
    )
Hibernate: 
    
    create table inherintance.motor_jointable (
       jenis_rantai varchar(255),
        kendaraan_id varchar(255) not null,
        primary key (kendaraan_id)
    )
Hibernate: 
    
    alter table if exists inherintance.mobil_jointable 
       add constraint fk_kendaraan_mobil_id 
       foreign key (kendaraan_id) 
       references inherintance.kendaraan_jointable
Hibernate: 
    
    alter table if exists inherintance.motor_jointable 
       add constraint fk_kendaraan_motor_id 
       foreign key (kendaraan_id) 
       references inherintance.kendaraan_jointable
Jan 16, 2021 6:38:34 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    insert 
    into
        inherintance.kendaraan_jointable
        (cc, jumlah_cylinder, jumlah_roda, nama, nama_pabrikan, id) 
    values
        (?, ?, ?, ?, ?, ?)
Hibernate: 
    insert 
    into
        inherintance.motor_jointable
        (jenis_rantai, kendaraan_id) 
    values
        (?, ?)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanJoinTable - mobil: MotorJoinTableEntity(super=KendaraanJoinTableEntity(id=ba765eb1-14fc-43fd-aede-620158775065, nama=BMW S1000RR, jumlahRoda=2, jumlahCylinder=4, cc=1000, namaPabrikan=PT. BMW Motorrad), jenisRantai=Rantai)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanJoinTable - destroy hibernate session!
```

Kemudian coba jalankan unit testing untuk method `testSaveMobil` maka hasilnya seperti berikut:

```bash
Jan 16, 2021 6:39:56 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    insert 
    into
        inherintance.kendaraan_jointable
        (cc, jumlah_cylinder, jumlah_roda, nama, nama_pabrikan, id) 
    values
        (?, ?, ?, ?, ?, ?)
Hibernate: 
    insert 
    into
        inherintance.mobil_jointable
        (is_all_wheel_drive, jumlah_kursi, kendaraan_id) 
    values
        (?, ?, ?)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanJoinTable - mobil: MobilJoinTableEntity(super=KendaraanJoinTableEntity(id=3463b2ea-cf49-49f1-b1a1-682d46f95573, nama=Honda BRIO, jumlahRoda=4, jumlahCylinder=4, cc=1000, namaPabrikan=PT. Honda Motor Company), jumlahKursi=4, allWheelDrive=false)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanJoinTable - destroy hibernate session!
```

Setelah 2 data terinsert coba test untuk `findById` ganti dengan id yang udah tersedia di table, maka outputnya seperti berikut:

```bash
Jan 16, 2021 6:41:26 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    select
        kendaraanj0_.id as id1_4_0_,
        kendaraanj0_.cc as cc2_4_0_,
        kendaraanj0_.jumlah_cylinder as jumlah_c3_4_0_,
        kendaraanj0_.jumlah_roda as jumlah_r4_4_0_,
        kendaraanj0_.nama as nama5_4_0_,
        kendaraanj0_.nama_pabrikan as nama_pab6_4_0_,
        kendaraanj0_1_.is_all_wheel_drive as is_all_w1_7_0_,
        kendaraanj0_1_.jumlah_kursi as jumlah_k2_7_0_,
        kendaraanj0_2_.jenis_rantai as jenis_ra1_9_0_,
        case 
            when kendaraanj0_1_.kendaraan_id is not null then 1 
            when kendaraanj0_2_.kendaraan_id is not null then 2 
            when kendaraanj0_.id is not null then 0 
        end as clazz_0_ 
    from
        inherintance.kendaraan_jointable kendaraanj0_ 
    left outer join
        inherintance.mobil_jointable kendaraanj0_1_ 
            on kendaraanj0_.id=kendaraanj0_1_.kendaraan_id 
    left outer join
        inherintance.motor_jointable kendaraanj0_2_ 
            on kendaraanj0_.id=kendaraanj0_2_.kendaraan_id 
    where
        kendaraanj0_.id=?
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanJoinTable - mobil: MobilJoinTableEntity(super=KendaraanJoinTableEntity(id=3463b2ea-cf49-49f1-b1a1-682d46f95573, nama=Honda BRIO, jumlahRoda=4, jumlahCylinder=4, cc=1000, namaPabrikan=PT. Honda Motor Company), jumlahKursi=4, allWheelDrive=false)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanJoinTable - destroy hibernate session!
```

Sekarang coba test untuk method `findByMobilId`, maka hasilnya seperti berikut:


```bash
Jan 16, 2021 6:42:40 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    select
        mobiljoint0_.kendaraan_id as id1_4_0_,
        mobiljoint0_1_.cc as cc2_4_0_,
        mobiljoint0_1_.jumlah_cylinder as jumlah_c3_4_0_,
        mobiljoint0_1_.jumlah_roda as jumlah_r4_4_0_,
        mobiljoint0_1_.nama as nama5_4_0_,
        mobiljoint0_1_.nama_pabrikan as nama_pab6_4_0_,
        mobiljoint0_.is_all_wheel_drive as is_all_w1_7_0_,
        mobiljoint0_.jumlah_kursi as jumlah_k2_7_0_ 
    from
        inherintance.mobil_jointable mobiljoint0_ 
    inner join
        inherintance.kendaraan_jointable mobiljoint0_1_ 
            on mobiljoint0_.kendaraan_id=mobiljoint0_1_.id 
    where
        mobiljoint0_.kendaraan_id=?
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanJoinTable - mobil: MobilJoinTableEntity(super=KendaraanJoinTableEntity(id=3463b2ea-cf49-49f1-b1a1-682d46f95573, nama=Honda BRIO, jumlahRoda=4, jumlahCylinder=4, cc=1000, namaPabrikan=PT. Honda Motor Company), jumlahKursi=4, allWheelDrive=false)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanJoinTable - destroy hibernate session!
```

Nah gimana ada perbedaan? yes jadi klo kita search pake model super / induknya maka dia akan join ke semua tabel tetapi jika menggunakan spesifik model dia akan join ke tabel tertentu saja.

Berikut adalah hasil data yang di simpan dengan menggunakan join_table

![select-tables]({{ page.image_path | prepend: site.baseurl }}/select-tables-jointable.png)

Dengan menggunakan metode `@Inheritance(strategy = InheritanceType.JOINED)` ini akan mepengaruhi performa aplikasi jadi _beaware_ dalam pengguanaanya

## TablePerClass mapping

kali ini kita akan membahas tentang Inherintance metode `TABLE_PER_CLASS` dengan perancangan tabel seperti berikut:

![erd]({{ page.image_path | prepend: site.baseurl }}/erd-tableperclass.png)

Dan berikut adalah implementasi Entity Kendaraan:

{% gist page.gist "KendaraanSeparateTableEntity.java" %}

Implementasi Entity Mobil:

{% gist page.gist "MobilSeparateTableEntity.java" %}

Implementasi Entity Motor:

{% gist page.gist "MotorSeparateTableEntity.java" %}

Implementasi DAO:

{% gist page.gist "KendaraanSeparateTableDao.java" %}

Implementasi Unit Testing:

{% gist page.gist "TestKendaraanSeparateTable.java" %}

Jika di running, method `testSaveMotor` maka hasilnya seperti berikut:

```bash
INFO: HHH10001501: Connection obtained from JdbcConnectionAccess [org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator$ConnectionProviderJdbcConnectionAccess@70091872] for (non-JTA) DDL execution was not in auto-commit mode; the Connection 'local transaction' will be committed and the Connection will be set into auto-commit mode.
Hibernate: 
    
    create table inherintance.kendaraan_tableperclass (
       id varchar(255) not null,
        cc int4,
        jumlah_cylinder int4,
        jumlah_roda int4,
        nama varchar(50),
        nama_pabrikan varchar(50) not null,
        primary key (id)
    )
Hibernate: 
    
    create table inherintance.mobil_tableperclass (
       id varchar(255) not null,
        cc int4,
        jumlah_cylinder int4,
        jumlah_roda int4,
        nama varchar(50),
        nama_pabrikan varchar(50) not null,
        is_all_wheel_drive boolean,
        jumlah_kursi int4,
        primary key (id)
    )
Hibernate: 
    
    create table inherintance.motor_tableperclass (
       id varchar(255) not null,
        cc int4,
        jumlah_cylinder int4,
        jumlah_roda int4,
        nama varchar(50),
        nama_pabrikan varchar(50) not null,
        jenis_rantai varchar(255),
        primary key (id)
    )
Jan 16, 2021 8:29:59 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    insert 
    into
        inherintance.motor_tableperclass
        (cc, jumlah_cylinder, jumlah_roda, nama, nama_pabrikan, jenis_rantai, id) 
    values
        (?, ?, ?, ?, ?, ?, ?)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSeparateTable - mobil: MotorSeparateTableEntity(super=KendaraanSeparateTableEntity(id=600cd3a6-859b-4f63-9c66-dc4331e29c96, nama=BMW S1000RR, jumlahRoda=2, jumlahCylinder=4, cc=1000, namaPabrikan=PT. BMW Motorrad), jenisRantai=Rantai)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSeparateTable - destroy hibernate session!
```

Setelah itu coba running unit testing untuk method `testSaveMobil` maka hasilnya akan seperti berikut:

```bash
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    insert 
    into
        inherintance.mobil_tableperclass
        (cc, jumlah_cylinder, jumlah_roda, nama, nama_pabrikan, is_all_wheel_drive, jumlah_kursi, id) 
    values
        (?, ?, ?, ?, ?, ?, ?, ?)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSeparateTable - mobil: MobilSeparateTableEntity(super=KendaraanSeparateTableEntity(id=d98e1588-05a1-4c6f-950b-9204174c9009, nama=Honda BRIO, jumlahRoda=4, jumlahCylinder=4, cc=1000, namaPabrikan=PT. Honda Motor Company), jumlahKursi=4, allWheelDrive=false)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSeparateTable - destroy hibernate session!
```

Setelah data mobil dan motor tersimpan, sekarang coba jalankan method `testFindById` maka hasilnya seperti berikut:

```bash
Jan 16, 2021 8:32:07 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    select
        kendaraans0_.id as id1_7_0_,
        kendaraans0_.cc as cc2_7_0_,
        kendaraans0_.jumlah_cylinder as jumlah_c3_7_0_,
        kendaraans0_.jumlah_roda as jumlah_r4_7_0_,
        kendaraans0_.nama as nama5_7_0_,
        kendaraans0_.nama_pabrikan as nama_pab6_7_0_,
        kendaraans0_.is_all_wheel_drive as is_all_w1_10_0_,
        kendaraans0_.jumlah_kursi as jumlah_k2_10_0_,
        kendaraans0_.jenis_rantai as jenis_ra1_13_0_,
        kendaraans0_.clazz_ as clazz_0_ 
    from
        ( select
            id,
            cc,
            jumlah_cylinder,
            jumlah_roda,
            nama,
            nama_pabrikan,
            null::boolean as is_all_wheel_drive,
            null::int4 as jumlah_kursi,
            null::varchar as jenis_rantai,
            0 as clazz_ 
        from
            inherintance.kendaraan_tableperclass 
        union
        all select
            id,
            cc,
            jumlah_cylinder,
            jumlah_roda,
            nama,
            nama_pabrikan,
            is_all_wheel_drive,
            jumlah_kursi,
            null::varchar as jenis_rantai,
            1 as clazz_ 
        from
            inherintance.mobil_tableperclass 
        union
        all select
            id,
            cc,
            jumlah_cylinder,
            jumlah_roda,
            nama,
            nama_pabrikan,
            null::boolean as is_all_wheel_drive,
            null::int4 as jumlah_kursi,
            jenis_rantai,
            2 as clazz_ 
        from
            inherintance.motor_tableperclass 
    ) kendaraans0_ 
where
    kendaraans0_.id=?
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSeparateTable - mobil: MobilSeparateTableEntity(super=KendaraanSeparateTableEntity(id=d98e1588-05a1-4c6f-950b-9204174c9009, nama=Honda BRIO, jumlahRoda=4, jumlahCylinder=4, cc=1000, namaPabrikan=PT. Honda Motor Company), jumlahKursi=4, allWheelDrive=false)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSeparateTable - destroy hibernate session!
```

Dan yang terakhir jalankan unit testing method `testFindByMobilId` maka hasilnya seperti berikut:

```bash
Jan 16, 2021 8:33:15 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Hibernate: 
    select
        mobilsepar0_.id as id1_7_0_,
        mobilsepar0_.cc as cc2_7_0_,
        mobilsepar0_.jumlah_cylinder as jumlah_c3_7_0_,
        mobilsepar0_.jumlah_roda as jumlah_r4_7_0_,
        mobilsepar0_.nama as nama5_7_0_,
        mobilsepar0_.nama_pabrikan as nama_pab6_7_0_,
        mobilsepar0_.is_all_wheel_drive as is_all_w1_10_0_,
        mobilsepar0_.jumlah_kursi as jumlah_k2_10_0_ 
    from
        inherintance.mobil_tableperclass mobilsepar0_ 
    where
        mobilsepar0_.id=?
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSeparateTable - mobil: MobilSeparateTableEntity(super=KendaraanSeparateTableEntity(id=d98e1588-05a1-4c6f-950b-9204174c9009, nama=Honda BRIO, jumlahRoda=4, jumlahCylinder=4, cc=1000, namaPabrikan=PT. Honda Motor Company), jumlahKursi=4, allWheelDrive=false)
[main] INFO com.maryanto.dimas.bootcamp.test.mapping.inherintance.TestKendaraanSeparateTable - destroy hibernate session!
```

Dan berikut adalah data pada tabelnya:

![select-tables]({{ page.image_path | prepend: site.baseurl }}/select-tables-tableperclass.png)

Untuk menggunakan `@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)` pastikan database management system yang digunakan support dengan `UNION`, `UNION ALL` contohnya seperti `PostgreSQL`, `MySQL`, `Oracle`, `DB2`, `H2`.
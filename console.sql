show databases;
drop table customer;
use belajar_golang_database;
show tables;

create table customer
(
    email      varchar(100),
    balance    integer   default 0,
    rating     double    default 0.0,
    created_at timestamp default current_timestamp,
    birth_date date,
    married    boolean   default false
) engine = InnoDb;
desc customer;

alter table customer
    add column id   varchar(100) not null first,
    add column name varchar(100) not null after id,
    add primary key (id);

select *
from customer;

insert into customer(id, name, email, balance, rating, birth_date, married)
values ('ilham', 'Ilham', 'ilham@gmail.com', 1000000, 90.0, '2004-10-09', false),
       ('nadhif', 'Nadhif', 'nadhif@gmail.com', 5000000, 85.5, '2002-03-23', true),
       ('zuhail', 'Zuhail', 'zuhail@gmail.com', 300000, 93.4, '2006-04-25', false);

update customer
set email      =null,
    birth_date = null
where id = 'nadhif';

create table user (
    username varchar(100) not null ,
    password varchar(100) not null ,
    primary key (username)
) engine = InnoDb;

select * from user;

insert into user(username, password) VALUES ('admin', 'admin');

create table comments (
    id int not null auto_increment,
    email varchar(100) not null ,
    comment text,
    primary key (id)

) engine = InnoDb;

desc comments;

select * from comments;
select count(*) from comments;

UPDATE comments SET email = 'ahaha', comment = 'ahahaha' WHERE id = 1;

DELETE FROM comments where id = '37';
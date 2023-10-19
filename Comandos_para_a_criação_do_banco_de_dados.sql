create database crud;
use crud;
create table tarefa(
     id int primary key AUTO_INCREMENT,
     nome varchar(50),
     hora time,
     datas date,
     descri varchar(100)
);

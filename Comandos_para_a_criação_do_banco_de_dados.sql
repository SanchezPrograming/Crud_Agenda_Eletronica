create database crud;
use crud;
create table tarefa(
     id int primary key AUTO_INCREMENT,
     nome varchar(50),
     hora time,
     datas date,
     descri varchar(100)
);
select	* from tarefa;
insert into tarefa(nome, hora, datas, descri) values ('TesteDois', '18:17:00', '2023-10-14', 'testandodois');
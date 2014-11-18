create table PARENT ( id number,name varchar2(10),
constraint pk_column PRIMARY KEY (id));

create table CHILD ( id number, name varchar2(10), parent number,
constraint pk_column2 PRIMARY KEY (id),
constraint PARENT_FK FOREIGN KEY (parent) references PARENT(id) );

drop table CHILD;

drop table PARENT;

begin tran;
insert into CHILD (id, name ,parent) values (1,'Ron',1);



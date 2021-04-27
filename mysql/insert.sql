create database if not exists fullcycle;
use fullcycle;

create table if not exists modulos (
    id int(11) auto_increment,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

insert into modulos(name) values('Docker'), ('Comunicação'), ('RabbitMQ'), ('Apache Kafka');
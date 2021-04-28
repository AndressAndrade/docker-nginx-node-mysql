create database if not exists fullcycle;
use fullcycle;

create table if not exists modulos (
    id int(11) auto_increment,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

set character_set_client = utf8;
set character_set_connection = utf8;
set character_set_results = utf8;
set collation_connection = utf8_general_ci;

insert into modulos (name) values ('Docker'), ('Comunicação'), ('RabbitMQ'), ('Apache Kafka');
const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const config = {
    host: "mysql",
    user: "root",
    password: "root",
    database: "fullcycle"
};

const connection = mysql.createConnection(config);
// const insertSQL = `INSERT INTO modulos(name) values('Docker'), ('Comunicação'), ('RabbitMQ'), ('Apache Kafka')`;
// connection.query(insertSQL);
// connection.end();

const app = express();
const port = 3000;

app.use(cors());

app.get('/', (req, res) => {
    const query = `SELECT * FROM modulos`;
    connection.query(query, function (error, results) {
        // When done with the connection, release it.
        connection.resume();
     
        // Handle error after the release.
        if (error) {
            return res.status(500).json({
                message: 'Erro ao obter lista',
                status: false,
                erro: error.message
            });
        };
     
        let texto = '<h1>Full Cycle</h1><ul>';
        results.forEach(element => {
            texto += `<li>${element.name}</li>`;
        });
        texto += '</ul>';
        res.charset = 'utf-8';
        return res.status(200).send(texto);
        
      });
});

app.listen(port, () => {
    console.log("Rodando na porta: ", port);
});
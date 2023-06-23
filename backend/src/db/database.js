//desde este archivo nos conectamos al gestor de bases de datos MYSQL
//debemos instalar el paquete promise-mysql para poder hacer la conexion (npm i promise-mysql)
import mysql from "promise-mysql";
//importamos el cofig que contiene nuestros datos para la conexion
import config from "./../config.js";

//creamos la conexion con los datos traidos desde config
const connection = mysql.createConnection({
  host: config.host,
  database: config.database,
  user: config.user,
  password: config.password,
});

//creamos una funcion que agrupa los valores de la conexion para importarla al resto de modulos
const getConnection = () => {
  return connection;
};

export default getConnection;

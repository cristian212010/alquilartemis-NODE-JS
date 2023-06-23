//con npm init -y para instalar las dependencias de node
//con npm i express para instalar express y crear nuestro web server
//npm i - D nodemon nos instala el nodemon en devdependecies (el -D nos indica que es en las devdependencies)
//nodemon nos sirve para reiniciar el servidor al notar cambios
//dependencies es el grupo de dependencias para produccion y devdependencies son las que solo van a estar en la fase de desarrollo

//importamos la constante global que contiene el framework con el puerto(como es un export default no se indican llaves)
import app from "./app.js";

//creamos nuestro main que es el que va a ejecutar toda la aplicacion
const main = () => {
  //con Listen le indicamos que escuche
  app.listen(app.get("port"));
};

main();

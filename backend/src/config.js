//config habilita la lectura de los datos registrados en .env
//importamos el paquete config
import {config} from "dotenv";

//hacemos el llamado del paquete config que importamos para que funcione la lectura
config();

//debemos llamar los datos que estan en el archivo .env ya que la carpeta .env no se publicara
//el metodo .env nos oculta la informacion para que nadie pueda tener acceso a ella
export default {
    host: process.env.HOST,
    database: process.env.DATABASE,
    user: process.env.USER,
    password: process.env.PASSWORD
}
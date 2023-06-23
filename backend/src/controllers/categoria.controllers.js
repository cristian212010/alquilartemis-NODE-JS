//importamos la conexion
import getConnection from "./../db/database.js";

//creamos una funcion asyncrona para que espere que alla conexion para ejecutarse
const getCategorias = async (req, res) => {
  try {
    const connection = await getConnection(); //garantiza la conexion
    //.query es un metodo de la dependencia promise-mysql
    const result = await connection.query(//consulta los datos
      "SELECT id_categoria, nombre_categoria, descripcion_categoria FROM categorias"
    );
    console.log(result);
    res.json(result);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

//exportamos el metodo para ejecutarlo desde app.js
export const methodsHTTP = {
  getCategorias,
};

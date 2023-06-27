import getConnection from "../db/database.js";

const getConstructoras = async (req, res) => {
  try {
    const connection = await getConnection();
    const result = await connection.query(
      "SELECT id_constructora, nombre_constructora, nit_constructora, nombre_representante, email_contacto, telefono_contacto FROM constructoras"
    );
    console.log(result);
    res.json(result);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

const addConstructoras = async(req, res) =>{
  try {
    const {nombre_constructora,nit_constructora,nombre_representante,email_contacto,telefono_contacto} = req.body;
    const constructora = {nombre_constructora, nit_constructora,nombre_representante,email_contacto,telefono_contacto};
    const connection = await getConnection();
    const result = await connection.query("INSERT INTO constructoras SET ?", constructora);
    res.json(result);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const methodsHTTP = {
  getConstructoras,
  addConstructoras
};

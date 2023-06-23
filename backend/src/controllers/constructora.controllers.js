import getConnection from "../db/database.js";

const getConstructoras = async (req, res) => {
  try {
    const connection = await getConnection();
    const result = await connection.query(
      "SELECT id_constructora, nombre_constructora, nombre_representante, email_contacto, telefono_contacto FROM constructoras"
    );
    console.log(result);
    res.json(result);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const methodsHTTP = {
  getConstructoras,
};

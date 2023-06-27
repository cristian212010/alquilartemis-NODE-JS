import getConnection from "../db/database.js";

const getEmpleados = async (req, res) => {
  try {
    const connection = await getConnection();
    const result = await connection.query(
      "SELECT id_empleado, nombre_empleado, email_empleado, celular_empleado, password_empleado FROM empleados"
    );
    console.log(result);
    res.json(result);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

const addEmpleados = async(req, res) =>{
  try {
    const {nombre_empleado,email_empleado,celular_empleado,password_empleado} = req.body;
    const empleado = {nombre_empleado, email_empleado,celular_empleado,password_empleado};
    const connection = await getConnection();
    const result = await connection.query("INSERT INTO empleados SET ?", empleado);
    res.json(result);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const methodsHTTP = {
  getEmpleados,
  addEmpleados
};

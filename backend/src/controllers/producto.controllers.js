import getConnection from "../db/database.js";

const getProductos = async (req, res) => {
  try {
    const connection = await getConnection();
    const result = await connection.query(
      "SELECT id_producto, nombre_producto, precio_x_dia, stock_producto, categorias.nombre_categoria FROM productos INNER JOIN categorias ON productos.categoria_producto = categorias.id_categoria;"
    );
    console.log(result);
    res.json(result);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const methodsHTTP = {
  getProductos,
};

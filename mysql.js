const fs = require('fs');
const mysql = require('mysql');
const express = require('express');

const app = express();

const config = JSON.parse(fs.readFileSync('./config.json', 'utf8'));
const connection = mysql.createConnection({
    host: config.host,
    user: config.user,
    password: config.password,
    database: config.database
});

connection.connect((err) => {
    if (err) {
        console.error('Error: ', err.message);
        return;
    }
    console.log('Conexión establecida con ID: ' + connection.threadId);
});

app.set('view engine', 'ejs');

app.use(express.static('views'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

const session = require('express-session');


app.use(session({
    secret: 'your-secret-key',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }
}));

app.get("/", (req, res) => {
    res.render("login");
});

app.post("/login", (req, res) => {
    const { id, password } = req.body;

    const find_user = "SELECT * FROM empleado WHERE DNI = ?";
    connection.query(find_user, [id], (err, rows) => {
        if (err) {
            console.error('Error en la consulta SQL: ', err.message);
            return res.status(500).json({ message: "Error en el servidor", type: "error" });
        }

        if (rows.length === 0) {
            console.log("No existe cuenta");
            return res.status(400).json({ message: "Aún no tienes una cuenta. Regístrate primero.", type: "error" });
        }

        const verificar_contrasenia = "SELECT contrasenia FROM empleado WHERE DNI = ?";
        connection.query(verificar_contrasenia, [id], (err, results) => {
            if (err) {
                console.error('Error en la consulta SQL: ', err.message);
                return res.status(500).json({ message: "Error en el servidor", type: "error" });
            }

            if (results.length === 0 || results[0].contrasenia !== password) {
                console.log("Contraseña incorrecta");
                return res.status(400).json({ message: "Contraseña incorrecta", type: "error" });
            }

            console.log("Cuenta verificada");

            const view_page = "SELECT puesto FROM empleado WHERE DNI = ?";
            connection.query(view_page, [id], (err, puesto_) => {
                if (err) {
                    console.error('Error en la consulta SQL: ', err.message);
                    return res.status(500).json({ message: "Error en el servidor", type: "error" });
                }

                if (puesto_.length === 0) {
                    console.log("Puesto no encontrado");
                    return res.status(500).json({ message: "Error en el servidor", type: "error" });
                }

                const puesto = puesto_[0].puesto;

                req.session.userId = id;

                if (puesto === 'Cajero') {
                    return res.status(200).json({ message: "Login exitoso", type: "success", redirect: "/empleados" });
                } else if (puesto === 'Mozo') {
                    return res.status(200).json({ message: "Login exitoso", type: "success", redirect: "/pedidos0_mozo" });
                } else {
                    console.log("Puesto desconocido");
                    return res.status(500).json({ message: "Error en el servidor", type: "error" });
                }
            });
        });
    });
});

app.get("/register", (req, res) => {
    res.render("register");
});

app.post("/register", (req, res) => {
    const infoRegister = req.body;

    console.log(infoRegister);

    const { nombre, apellido, telefono, dni, puesto, horario, contrasenia, confirmar_contrasenia } = infoRegister;

    if (contrasenia !== confirmar_contrasenia) {
        console.log("Las contraseñas no coinciden");
        return res.status(400).send({ message: "Las contraseñas no coinciden", type: "error" });
    }

    const find = "SELECT * FROM empleado WHERE dni = ?";
    connection.query(find, [dni], (err, rows) => {
        if (err) {
            console.error('Error: ', err.message);
            return res.status(500).send({ message: "Error en el servidor", type: "error" });
        }
        if (rows.length > 0) {
            console.log("Ya tiene cuenta");
            return res.status(400).send({ message: "El usuario ya tiene una cuenta", type: "error" });
        } else {
            let salario;

            switch (puesto) {
                case 'Cajero':
                    salario = 75;
                    break;
                case 'Mozo':
                    salario = 60;
                    break;
                case 'Cocinero':
                    salario = 100;
                    break;
                case 'Mantenimiento':
                    salario = 65;
                    break;
                default:
                    salario = 0;
                    break;
            }

            let ID_Caja = null;

            const insertEmployee = () => {
                let ID_Horario = null;
                const Query_ID_Horario = "SELECT ID FROM Horarios WHERE turno = ?";
                connection.query(Query_ID_Horario, [horario], (err, result) => {
                    if (err) {
                        console.error('Error: ', err.message);
                        return res.status(500).send({ message: "Error en el servidor", type: "error" });
                    }
                    if (result.length === 0) {
                        console.log("No existe este horario");
                        return res.status(400).send({ message: "No existe este horario", type: "error" });
                    }
                    ID_Horario = result[0].ID;

                    const registrar = "INSERT INTO empleado (DNI, nombre, apellido, puesto, contrasenia, salario, ID_Caja, ID_Horarios) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    const values = [dni, nombre, apellido, puesto, contrasenia, salario, ID_Caja, ID_Horario];
                    connection.query(registrar, values, (err) => {
                        if (err) {
                            console.error('Error: ', err.message);
                            return res.status(500).send({ message: "Error al registrar el usuario", type: "error" });
                        }
                        const add_phone = "INSERT INTO telefonos_empleado (telefono_empleado, DNI_Empleado) VALUES (?,?)";
                        connection.query(add_phone, [telefono, dni], (err) => {
                            if (err) {
                                console.error('Error: ', err.message);
                                return res.status(500).send({ message: "Error al registrar el teléfono", type: "error" });
                            }
                            if (puesto === 'Cajero') {
                                return res.status(200).send({ message: "Usuario registrado con éxito", type: "success", redirect: "/empleados" });
                            } else if (puesto === 'Mozo') {
                                return res.status(200).send({ message: "Usuario registrado con éxito", type: "success", redirect: "/pedidos0_mozo" });
                            };
                        });
                    });
                });
            };

            if (puesto === 'Cajero') {
                const Query_ID_Caja = "SELECT c.ID FROM Caja c LEFT JOIN Empleado e ON c.ID = e.ID_Caja GROUP BY c.ID ORDER BY COUNT(e.ID_Caja) ASC LIMIT 1;";
                connection.query(Query_ID_Caja, (err, result) => {
                    if (err) {
                        console.error('Error: ', err.message);
                        return res.status(500).send({ message: "Error en el servidor", type: "error" });
                    }
                    if (result.length === 0) {
                        console.log("No existe una caja");
                        return res.status(400).send({ message: "No existe una caja", type: "error" });
                    }
                    ID_Caja = result[0].ID;
                    insertEmployee();
                });
            } else {
                insertEmployee();
            }
        }
    });
});

app.get("/empleados", (req, res) => {
    const query = "SELECT e.DNI, e.nombre, e.apellido, e.puesto, e.salario, e.ID_Caja, h.turno FROM Empleado e INNER JOIN Horarios h ON e.ID_Horarios = h.ID";
    connection.query(query, (err, results) => {
        if (err) {
            console.error('Error: ', err.message);
            res.status(500).send("Error en el servidor");
            return;
        }
        res.render("empleados", { empleados: results });
    });
});

// Ruta para eliminar empleado
app.delete("/empleado/:dni", (req, res) => {
    const { dni } = req.params;

    const deletePhoneQuery = "DELETE FROM telefonos_empleado WHERE DNI_Empleado = ?";
    connection.query(deletePhoneQuery, [dni], (err, result) => {
        if (err) {
            console.error('Error en la consulta SQL al eliminar el teléfono: ', err.message);
            return res.status(500).send("Error en el servidor al eliminar el teléfono");
        }

        const deleteEmployeeQuery = "DELETE FROM empleado WHERE DNI = ?";
        connection.query(deleteEmployeeQuery, [dni], (err, result) => {
            if (err) {
                console.error('Error en la consulta SQL al eliminar el empleado: ', err.message);
                return res.status(500).send("Error en el servidor al eliminar el empleado");
            }
            if (result.affectedRows === 0) {
                return res.status(404).send("Empleado no encontrado");
            }
            res.status(200).send("Empleado eliminado correctamente");
        });
    });
});


app.get("/pedidos0_mozo", (req, res) => {
    if (!req.session.userId) {
        return res.status(401).json({ message: "No autorizado", type: "error" });
    }

    const query = "SELECT p.hora, p.fecha, p.ID_Mesa FROM Pedido p WHERE p.DNI_Empleado = ?";
    connection.query(query, [req.session.userId], (err, results) => {
        if (err) {
            console.error('Error: ', err.message);
            res.status(500).send("Error en el servidor");
            return;
        }
        res.render("pedidos0_mozo", { pedidos: results });
    });
});

app.get("/logout", (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            console.error('Error al cerrar sesión: ', err);
            return res.status(500).send("Error en el servidor");
        }
        res.redirect("/");
    });
});

app.get("/pedidos1", (req, res) => {
        res.render("pedidos1");
});

// Iniciar el servidor en el puerto 3000
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

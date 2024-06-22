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

app.get("/", (req, res) => {
    res.render("login");
});

app.post("/login", (req, res) => {
    const infoLogin = req.body;
    console.log(infoLogin);

    const { id, password } = infoLogin;

    const find_user = "SELECT * FROM empleado WHERE DNI = ?";
    connection.query(find_user, [id], (err, rows) => {
        if (err) {
            console.error('Error: ', err.message);
            res.status(500).send("Error");
            return;
        }
        if (rows.length === 0) {
            console.log("No existe cuenta");
            res.status(400).send("Aún no tienes una cuenta, Regístrate");
        } else {
            const verificar_contrasenia = "SELECT contrasenia FROM empleado WHERE DNI = ?";
            connection.query(verificar_contrasenia, [id], (err, results) => {
                if (err) {
                    console.error('Error: ', err.message);
                    res.status(500).send("Error");
                    return;
                } else {
                    if (results[0].contrasenia === password) {
                        console.log("Cuenta verificada");
                        res.redirect("/empleados");
                    } else {
                        console.log("Contraseña incorrecta");
                        res.status(400).send("Contraseña incorrecta");
                    }
                }
            });
        }
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
        res.status(400).send("Las contraseñas no coinciden");
        return;
    }

    const find = "SELECT * FROM empleado WHERE dni = ?";
    connection.query(find, [dni], (err, rows) => {
        if (err) {
            console.error('Error: ', err.message);
            res.status(500).send("Error en el servidor");
            return;
        }
        if (rows.length > 0) {
            console.log("Ya tiene cuenta");
            res.status(400).send("El usuario ya tiene una cuenta");
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
                        res.status(500).send("Error en el servidor");
                        return;
                    }
                    if (result.length === 0) {
                        console.log("No existe este horario");
                        res.status(400).send("No existe este horario");
                        return;
                    }
                    ID_Horario = result[0].ID;

                    const registrar = "INSERT INTO empleado (DNI, nombre, apellido, puesto, contrasenia, salario, ID_Caja, ID_Horarios) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    const values = [dni, nombre, apellido, puesto, contrasenia, salario, ID_Caja, ID_Horario];
                    connection.query(registrar, values, (err) => {
                        if (err) {
                            console.error('Error: ', err.message);
                            res.status(500).send("Error al registrar el usuario");
                            return;
                        }
                        const add_phone = "INSERT INTO telefonos_empleado (telefono_empleado, DNI_Empleado) VALUES (?,?)";
                        connection.query(add_phone, [telefono, dni], (err) => {
                            if (err) {
                                console.error('Error: ', err.message);
                                res.status(500).send("Error al registrar el teléfono");
                                return;
                            }
                            res.redirect("/empleados");
                        });
                    });
                });
            };

            if (puesto === 'Cajero') {
                const Query_ID_Caja = "SELECT c.ID FROM Caja c LEFT JOIN Empleado e ON c.ID = e.ID_Caja GROUP BY c.ID ORDER BY COUNT(e.ID_Caja) ASC LIMIT 1;";
                connection.query(Query_ID_Caja, (err, result) => {
                    if (err) {
                        console.error('Error: ', err.message);
                        res.status(500).send("Error en el servidor");
                        return;
                    }
                    if (result.length === 0) {
                        console.log("No existe una caja");
                        res.status(400).send("No existe una caja");
                        return;
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

// Iniciar el servidor en el puerto 3000
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

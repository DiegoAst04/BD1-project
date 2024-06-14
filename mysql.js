const mysql = require('mysql');
const express = require('express');

const app = express();

const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'KamVale',
    password: 'Proyectos2024',
    database: 'Restaurante'
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

// Ruta para el login
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

// Validar datos de registro
app.post("/register", (req, res) => {
    const infoRegister = req.body;

    console.log(infoRegister);

    const { nombre, apellido, telefono, adresses, dni, puesto, correo, contrasenia, confirmar_contrasenia } = infoRegister;

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
                case 'p1':
                    salario = 75;
                    break;
                case 'p2':
                    salario = 60;
                    break;
                case 'p3':
                    salario = 100;
                    break;
                case 'p4':
                    salario = 65;
                    break;
                default:
                    salario = 0;
                    break;
            }

            const ID_Sucursal_ = adresses;
            let ID_Caja = null;

            if (puesto === 'Cajero') {
                const Query_ID_Caja = "SELECT ID from Caja WHERE ID_Sucursal = ?";
                connection.query(Query_ID_Caja, [ID_Sucursal_], (err, result) => {
                    if (err) {
                        console.error('Error: ', err.message);
                        res.status(500).send("Error en el servidor");
                        return;
                    }

                    if (result.length === 0) {
                        console.log("No existe una caja para esta sucursal");
                        res.status(400).send("No existe una caja para esta sucursal");
                        return;
                    }

                    ID_Caja = result[0].ID;

                    const ID_Horarios = null;
                    const registrar = "INSERT INTO empleado (DNI, nombre, apellido, puesto, contrasenia, salario, ID_Sucursal, ID_Caja, ID_Horarios) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    const values = [dni, nombre, apellido, puesto, contrasenia, salario, ID_Sucursal_, ID_Caja, ID_Horarios];

                    connection.query(registrar, values, (err) => {
                        if (err) {
                            console.error('Error: ', err.message);
                            res.status(500).send("Error al registrar el usuario");
                            return;
                        }
                        console.log('Registrado correctamente');
                        res.send("Registrado correctamente");
                    });
                });
            } else {
                const ID_Horarios = null;
                const registrar = "INSERT INTO empleado (DNI, nombre, apellido, puesto, contrasenia, salario, ID_Sucursal, ID_Caja, ID_Horarios) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                const values = [dni, nombre, apellido, puesto, contrasenia, salario, ID_Sucursal_, ID_Caja, ID_Horarios];

                connection.query(registrar, values, (err) => {
                    if (err) {
                        console.error('Error: ', err.message);
                        res.status(500).send("Error al registrar el usuario");
                        return;
                    }
                    console.log('Registrado correctamente');
                    res.send("Registrado correctamente");
                });
            }
        }
    });
});

app.get("/empleados", (req, res) => {
    const query = "SELECT * FROM empleado";
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
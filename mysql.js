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
            if (puesto === 'p1') salario = 75;
            if (puesto === 'p2') salario = 60;
            if (puesto === 'p3') salario = 100;
            if (puesto === 'p4') salario = 65;

            const registrar = "INSERT INTO empleado (DNI, nombre, apellido, puesto, teléfonos, salario, contrasenia) VALUES (?, ?, ?, ?, ?, ?, ?)";
            const values = [dni, nombre, apellido, puesto, telefono, salario, contrasenia];

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
    });
});

// Iniciar el servidor en el puerto 3000
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
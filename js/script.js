//------------------------------ Reloj del login ------------------------------
function obtenerHora() {
  const $hora = document.querySelector("#hora"),
    $fecha = document.querySelector("#fecha");
  let diasSemana = ["domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sabado"],
    meses = ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "setiembre", "octubre", "noviembre", "diciembre"];
  if ($hora) {
    var date = new Date(),
    day = date.getDate(),
    diaSemana = date.getDay(),
    hour = date.getHours(),
    minutes = date.getMinutes() < 10 ? '0'+date.getMinutes() : date.getMinutes(),
    secs = date.getSeconds() < 10 ? '0'+date.getSeconds() : date.getSeconds(),
    mes = date.getMonth(),
    year = date.getFullYear();
    
    let HoraString = `${hour}:${minutes}:${secs}`;
    let FechaString = `${diasSemana[diaSemana]}, ${day} de ${meses[mes]} de ${year}`;
    
    $hora.innerHTML = HoraString;
    $fecha.innerHTML = FechaString;
  }
}
obtenerHora();
setInterval(() => {
  obtenerHora();
}, 1000);
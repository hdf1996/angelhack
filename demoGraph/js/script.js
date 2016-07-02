$(function() {
    var setDormir = {
        // Titulo que representa este set de datos
        label: 'Horas de Sueño', 
        /* dataJson[0].name */
        data: [5, 4, 5, 6, 8, 7, 3],
        /* dataJson[0].data */
        fill: false,
        backgroundColor: "rgba(255,99,132,0.2)",
        borderColor: "rgba(255,99,132,1)",
        borderWidth: 1
    };


    var setFisico = {
        // Titulo que representa este set de datos
        label: 'Horas de Actividad Fisica',
        /* dataJson[1].name */
        data: [2, 3, 2, 1, 1, 4, 2],
        /* dataJson[1].data */
        fill: false,
        backgroundColor: "rgba(255,99,132,0.2)",
        borderColor: "rgba(108, 77, 93,1)",
        borderWidth: 1,
    };

    var ctx = $("#myChart");
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            // Etiquetas en el eje X en este caso los dias
            labels: ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"],
            // AL dataset le paso un objeto con
            datasets: [setDormir, setFisico]
        },
        options: {
            // En true toma el ancho y alto de la caja padre
            responsive: true,
            // Titulo del Chart
            title: {
                display: true,
                text: "Demo LogÜ"
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });




});
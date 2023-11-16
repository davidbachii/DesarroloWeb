
$(document).ready(function () {
    const platoRadios = $('input[name="plato"]');
    const opcionesSelect = $('#Opciones');
    const seleccionesSelect = $('#Selecciones');
    const mesaSelect = $('#mesa');
    const extrasRadios = $('input[name="extras"]');
    const totalCuentaInput = $('#total_cuenta');
    const pagarTotalBtn = $('#Pagar_Total');
    const platos = {
        primer_plato: ["Ensalada", "Sopa", "Ceviche", "Macarrones", "Lentejas", "Pure", "Judias Pintas", "Arroz con pollo", "Croquetas de jamón", "Tortilla española"],
        segundo_plato: ["Lasaña", "Pescado a la plancha", "Pollo asado", "Cabrito", "Patatas Deluxe", "Entrecot a la parrilla", "Paella", "Costillas a la barbacoa", "Sushi", "Hamburguesa"],
        postre: ["Tarta de chocolate", "Helado", "Frutas", "Flan", "Brownie", "Mousse de limón", "Tiramisú", "Gelatina", "Crema catalana", "Pastel de zanahoria"]
    };
    let platosPorMesa = {
        1: [],
        2: [],
        3: [],
        4: [],
        5: []
    };

    // Función para mostrar los platos según la selección de la mesa
    function mostrarPlatosPorMesa() {
        const mesaSeleccionada = mesaSelect.val();

        // Guardar los platos previamente seleccionados para la mesa actual
        platosPorMesa[mesaSeleccionada] = platosPorMesa[mesaSeleccionada] || [];

        // Limpiar platos seleccionados al cambiar la mesa
        seleccionesSelect.html('');
        mostrarPlatos(platosPorMesa[mesaSeleccionada]);
    }

    // Asociar eventos a los radios de plato
    platoRadios.change(function () {
        mostrarPlatosPorMesa();
    });


    // Función para mostrar los platos según la selección
    function mostrarPlatos(platosMostrados) {
        opcionesSelect.html(''); // Limpiar las opciones

        const platosDisponibles = obtenerPlatosDisponibles(mesaSelect.val());

        $.each(platosDisponibles, function (index, plato) {
            const option = $('<option>').text(plato);
            opcionesSelect.append(option);

            // Agregar evento de doble clic a cada opción generada
            option.dblclick(function () {
                const seleccion = $('<option>').text(plato);
                seleccionesSelect.append(seleccion);

                // Almacenar el plato seleccionado para la mesa actual
                platosPorMesa[mesaSelect.val()].push(plato);
            });
        });

        // Mostrar los platos previamente seleccionados en la nueva mesa
        $.each(platosPorMesa[mesaSelect.val()], function (index, plato) {
            const seleccion = $('<option>').text(plato);
            seleccionesSelect.append(seleccion);
        });
    }

    // Asociar evento a la selección de mesa
    mesaSelect.change(mostrarPlatosPorMesa);


    // Función para obtener los platos disponibles según la categoría y mesa
    function obtenerPlatosDisponibles(mesa) {


        const platoSeleccionado = obtenerPlatoSeleccionado();

        // Filtrar platos disponibles según la categoría seleccionada y platos ya seleccionados
        return $.grep(platos[platoSeleccionado], function (plato) {
            return $.inArray(plato, platosPorMesa[mesa]) === -1;
        });
    }

    // Función para obtener la categoría de plato seleccionada
    function obtenerPlatoSeleccionado() {
        let platoSeleccionado = '';
        platoRadios.each(function () {
            if ($(this).prop('checked')) {
                platoSeleccionado = $(this).val();
            }
        });
        return platoSeleccionado;
    }
    // Función para calcular el total
    function calcularTotal() {
        let total = 0;

        // Sumar el precio de cada plato seleccionado
        $.each(platosPorMesa[mesaSelect.val()], function (index, plato) {
            total += obtenerPrecioPlato(plato);
        });

        // Sumar el precio de los extras (café o copa)
        extrasRadios.each(function () {
            if ($(this).prop('checked')) {
                total += obtenerPrecioExtra($(this).val());
            }
        });

        // Mostrar el total en el campo correspondiente
        totalCuentaInput.val(total.toFixed(2));
    }

    // Función para obtener el precio de un plato
    function obtenerPrecioPlato(plato) {
        // Puedes asignar precios a los platos según tu lógica
        // Aquí utilizo un precio fijo de 10 euros por plato
        const preciosPlatos = {
            "Ensalada": 10,
            "Sopa": 8,
            "Ceviche": 12,
            "Macarrones": 9,
            "Lentejas": 7,
            "Pure": 8,
            "Judias Pintas": 9,
            "Arroz con pollo": 11,
            "Croquetas de jamón": 10,
            "Tortilla española": 9,
            "Lasaña": 12,
            "Pescado a la plancha": 14,
            "Pollo asado": 11,
            "Cabrito": 15,
            "Patatas Deluxe": 9,
            "Entrecot a la parrilla": 16,
            "Paella": 13,
            "Costillas a la barbacoa": 14,
            "Sushi": 18,
            "Hamburguesa": 10,
            "Tarta de chocolate": 8,
            "Helado": 6,
            "Frutas": 5,
            "Flan": 7,
            "Brownie": 7,
            "Mousse de limón": 6,
            "Tiramisú": 9,
            "Gelatina": 5,
            "Crema catalana": 7,
            "Pastel de zanahoria": 8
        };

        return preciosPlatos[plato];
    }

    // Función para obtener el precio de un extra
    function obtenerPrecioExtra(extra) {
        // Puedes asignar precios a los extras según tu lógica
        // Aquí utilizo un precio fijo de 2 euros por extra
        const preciosExtras = {
            "cafe": 2,
            "copa": 2.5,
        };

        return preciosExtras[extra] || 0;
    }

    // Asociar eventos a los extras para recalcular el total
    extrasRadios.change(calcularTotal);

    // Asociar eventos al botón "Pagado" para eliminar los productos y mostrar una alerta
    pagarTotalBtn.click(function () {
        const mesaSeleccionada = mesaSelect.val();
        const platosSeleccionados = platosPorMesa[mesaSeleccionada];

        if (platosSeleccionados.length > 0) {
            // Puedes realizar aquí cualquier acción adicional antes de eliminar los productos

            // Limpiar platos seleccionados para la mesa actual
            platosPorMesa[mesaSeleccionada] = [];
            seleccionesSelect.html('');

            // Mostrar alerta
            alert('¡Pago realizado con éxito!');

            // También podrías realizar alguna acción adicional después de realizar el pago
        } else {
            alert('No hay productos seleccionados para pagar.');
        }
    });

    // Inicializar los platos al cargar la página
    mostrarPlatos([]);

});

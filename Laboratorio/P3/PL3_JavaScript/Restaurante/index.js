$(document).ready(function () {
    const platoCheckboxes = $('input[name="plato"]');
    const opcionesSelect = $('#Opciones');
    const seleccionesSelect = $('#Selecciones');
    const mesaSelect = $('#mesa');
    const extrasCheckboxes = $('input[name="extras"]');
    const totalCuentaInput = $('#total_cuenta');
    const pagarTotalBtn = $('#Pagar_Total');
    const platos = {
        primer_plato: ["Ensalada", "Sopa", "Ceviche", "Macarrones", "Lentejas", "Pure", "Judias Pintas", "Arroz con pollo", "Croquetas de jamón", "Tortilla española"],
        segundo_plato: ["Lasaña", "Pescado a la plancha", "Pollo asado", "Cabrito", "Patatas Deluxe", "Entrecot a la parrilla", "Paella", "Costillas a la barbacoa", "Sushi", "Hamburguesa"],
        postre: ["Tarta de chocolate", "Helado", "Frutas", "Flan", "Brownie", "Mousse de limón", "Tiramisú", "Gelatina", "Crema catalana", "Pastel de zanahoria"]
    };
    let platosPorMesa = {
        1: { platos: [], extras: [] },
        2: { platos: [], extras: [] },
        3: { platos: [], extras: [] },
        4: { platos: [], extras: [] },
        5: { platos: [], extras: [] }
    };
    let totalPorMesa = {
        1: 0,
        2: 0,
        3: 0,
        4: 0,
        5: 0
    }

    // Función para mostrar los platos según la selección de la mesa
    function mostrarPlatosPorMesa() {
        const mesaSeleccionada = mesaSelect.val();

        // Limpiar platos y extras seleccionados al cambiar la mesa
        seleccionesSelect.html('');

        // Mostrar los platos y extras correspondientes a la mesa actual
        mostrarPlatos(platosPorMesa[mesaSeleccionada].platos);
        mostrarExtras(platosPorMesa[mesaSeleccionada].extras);
    }

    // Asociar eventos a los checkboxes de plato
    platoCheckboxes.change(function () {
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
                platosPorMesa[mesaSelect.val()].platos.push(plato);

                calcularTotal();
            });
        });

        // Mostrar los platos previamente seleccionados en la nueva mesa
        $.each(platosPorMesa[mesaSelect.val()].platos, function (index, plato) {
            const seleccion = $('<option>').text(plato);
            seleccionesSelect.append(seleccion);
        });
    }

    // Función para mostrar los extras según la selección
    function mostrarExtras(extrasMostrados) {
        extrasCheckboxes.prop('checked', false); // Desmarcar todos los checkboxes

        $.each(extrasMostrados, function (index, extra) {
            extrasCheckboxes.filter(`[value="${extra}"]`).prop('checked', true);
        });
    }

    // Asociar evento a la selección de mesa
    mesaSelect.change(mostrarPlatosPorMesa);

    // Función para obtener los platos disponibles según la categoría y mesa
    function obtenerPlatosDisponibles(mesa) {
        const platoSeleccionado = obtenerPlatoSeleccionado();
        return platos[platoSeleccionado] || [];
    }

    // Función para obtener la categoría de plato seleccionada
    function obtenerPlatoSeleccionado() {
        let platoSeleccionado = '';
        platoCheckboxes.each(function () {
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
        $.each(platosPorMesa[mesaSelect.val()].platos, function (index, plato) {
            total += obtenerPrecioPlato(plato);
        });

        // Sumar el precio de los extras (café o copa)
        $.each(platosPorMesa[mesaSelect.val()].extras, function (index, extra) {
            total += obtenerPrecioExtra(extra);
        });

        // Mostrar el total en el campo correspondiente
        totalCuentaInput.val(total.toFixed(2));
    }

    // Función para obtener el precio de un plato
    function obtenerPrecioPlato(plato) {
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
        const preciosExtras = {
            "cafe": 2,
            "copa": 2.5,
        };

        return preciosExtras[extra] || 0;
    }

    // Asociar eventos a los checkboxes de extras para recalcular el total
    extrasCheckboxes.change(function () {
        const extrasSeleccionados = obtenerExtrasSeleccionados();
        platosPorMesa[mesaSelect.val()].extras = extrasSeleccionados;
        calcularTotal();
    });

    // Función para obtener los extras seleccionados
    function obtenerExtrasSeleccionados() {
        const extrasSeleccionados = [];
        extrasCheckboxes.each(function () {
            if ($(this).prop('checked')) {
                extrasSeleccionados.push($(this).val());
            }
        });
        return extrasSeleccionados;
    }

    // Asociar eventos al botón "Pagado" para eliminar los productos y mostrar una alerta
    pagarTotalBtn.click(function () {
        const mesaSeleccionada = mesaSelect.val();
        const platosSeleccionados = platosPorMesa[mesaSeleccionada].platos;

        if (platosSeleccionados.length > 0) {
            // Puedes realizar aquí cualquier acción adicional antes de eliminar los productos

            // Limpiar platos y extras seleccionados para la mesa actual
            platosPorMesa[mesaSeleccionada].platos = [];
            platosPorMesa[mesaSeleccionada].extras = [];
            seleccionesSelect.html('');
            totalCuentaInput.val(0);
            extrasCheckboxes.prop('checked', false);

            // Mostrar alerta
            alert('¡Pago realizado con éxito!');

            // También podrías realizar alguna acción adicional después de realizar el pago
        } else {
            alert('No hay productos seleccionados para pagar.');
        }
    });

    // Limpiar la selección de platos y extras al cambiar la mesa
    mesaSelect.change(function () {
        mostrarPlatosPorMesa();
        calcularTotal();
    });
});

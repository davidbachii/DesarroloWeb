
// Asociar precios a los platos
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

$(document).ready(function() {
    const platoRadios = $('input[name="plato"]');
    const opcionesSelect = $('#Opciones');
    const seleccionesSelect = $('#Selecciones');
    const mesaSelect = $('#mesa');
    const primerPlatoCheckbox = $('#P_plato');
    const segundoPlatoCheckbox = $('#S_plato');
    const postreCheckbox = $('#Postre');
    const cafeCheckbox = $('#Cafe_x');
    const copaCheckbox = $('#Copa_x');
    const totalInput = $('#total_cuenta');
    const platos = {
        primer_plato: ["Ensalada", "Sopa", "Ceviche", "Macarrones", "Lentejas", "Pure", "Judias Pintas", "Arroz con pollo", "Croquetas de jamón", "Tortilla española"],
        segundo_plato: ["Lasaña", "Pescado a la plancha", "Pollo asado", "Cabrito", "Patatas Deluxe", "Entrecot a la parrilla", "Paella", "Costillas a la barbacoa", "Sushi", "Hamburguesa"],
        postre: ["Tarta de chocolate", "Helado", "Frutas", "Flan", "Brownie", "Mousse de limón", "Tiramisú", "Gelatina", "Crema catalana", "Pastel de zanahoria"]
    };

 

    function mostrarPlatos(event) {
        const platoSeleccionado = $(event.target).val();
        const platosMostrados = platos[platoSeleccionado];

        opcionesSelect.empty();

        $.each(platosMostrados, function(index, plato) {
            opcionesSelect.append($('<option>', {text: plato}));
        });
    }

    opcionesSelect.on('change', function() {
        opcionesSelect.find('option:selected').each(function() {
            const plato = $(this).text();
            seleccionesSelect.append($('<option>', {text: plato}));
            platosPedidos.push(plato);
        });

        actualizarTotal();
    });

    function actualizarTotal() {
        let total = 0;

        seleccionesSelect.find('option').each(function() {
            const plato = $(this).text();
            total += preciosPlatos[plato] || 0;
        });

        if (cafeCheckbox.is(':checked')) {
            total += 2;
        }

        if (copaCheckbox.is(':checked')) {
            total += 3;
        }

        totalInput.val(total);
    }

    platoRadios.on('change', mostrarPlatos);

    mesaSelect.on('change', function() {
        platosPedidos = [];
        opcionesSelect.empty();
        seleccionesSelect.empty();
        totalInput.val('');
        cafeCheckbox.prop('checked', false);
        copaCheckbox.prop('checked', false);
        primerPlatoCheckbox.prop('checked', false);
        segundoPlatoCheckbox.prop('checked', false);
        postreCheckbox.prop('checked', false);
    });

    opcionesSelect.on('dblclick', function() {
        opcionesSelect.find('option:selected').each(function() {
            const plato = $(this).text();
            platosPedidos.push(plato);
        });

        actualizarTotal();
    });

    seleccionesSelect.on('dblclick', function() {
        seleccionesSelect.find('option:selected').each(function() {
            const index = $(this).index();
            platosPedidos.splice(index, 1);
        });

        actualizarTotal();
    });

    $('#Pagar_Total').on('click', function() {
        mesaSelect.val('1');
        mesaSelect.trigger('change');
    });
});

const platoRadios = document.querySelectorAll('input[name="plato"]');
const opcionesSelect = document.getElementById('Opciones');
const seleccionesSelect = document.getElementById('Selecciones');
const platos = {
    primer_plato: ["Ensalada", "Sopa", "Ceviche", "Macarrones", "Lentejas", "Pure", "Judias Pintas", "Arroz con pollo", "Croquetas de jamón", "Tortilla española"],
    segundo_plato: ["Lasaña", "Pescado a la plancha", "Pollo asado", "Cabrito", "Patatas Deluxe", "Entrecot a la parrilla", "Paella", "Costillas a la barbacoa", "Sushi", "Hamburguesa"],
    postre: ["Tarta de chocolate", "Helado", "Frutas", "Flan", "Brownie", "Mousse de limón", "Tiramisú", "Gelatina", "Crema catalana", "Pastel de zanahoria"]
};

// Función para mostrar los platos según la selección
function mostrarPlatos(event) {
    const platoSeleccionado = event.target.value;
    const platosMostrados = platos[platoSeleccionado];

    opcionesSelect.innerHTML = ''; // Limpiar las opciones

    platosMostrados.forEach(plato => {
        const option = document.createElement('option');
        option.text = plato;
        opcionesSelect.add(option);
    });

    // Limpiar el campo "Selecciones" al cambiar la selección en el primer input
    seleccionesSelect.innerHTML = '';
}

// Función para reflejar la selección del primer select en el segundo select
opcionesSelect.addEventListener('change', function() {
    seleccionesSelect.innerHTML = '';

    Array.from(opcionesSelect.selectedOptions).forEach(selectedOption => {
        const option = document.createElement('option');
        option.text = selectedOption.text;
        seleccionesSelect.add(option);
    });
});

// Asociar eventos a los radios de plato
platoRadios.forEach(radio => {
    radio.addEventListener('change', mostrarPlatos);
});

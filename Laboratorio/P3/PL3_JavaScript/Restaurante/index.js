// Obtener los elementos relevantes del DOM
const opcionesInput = document.getElementById('Opciones');
const platoRadios = document.querySelectorAll('input[name="plato"]');

// Datos de ejemplo de platos
const platos = {
    primer_plato: ["Ensalada", "Sopa", "Ceviche"],
    segundo_plato: ["Lasaña", "Pescado a la plancha", "Pollo asado"],
    postre: ["Tarta de chocolate", "Helado", "Frutas"]
};

// Función para mostrar las opciones de platos según la selección
function mostrarPlatos(event) {
    const platoSeleccionado = event.target.value;
    const platosMostrados = platos[platoSeleccionado];

    // Mostrar los platos en el campo "Opciones"
    opcionesInput.value = platosMostrados.join('\n');

   
}

// Asociar eventos a los radios de plato
platoRadios.forEach(radio => {
    radio.addEventListener('change', mostrarPlatos);
});

document.addEventListener("DOMContentLoaded", () => {
    let request = indexedDB.open("cochesDB", 1);
    let db;
  
    request.onerror = (event) => {
        console.error("Error al abrir la base de datos:", event.target.errorCode);
    };
  
    request.onsuccess = (event) => {
        db = event.target.result;
        console.log("Base de datos abierta con éxito");
    };
  
    request.onupgradeneeded = (event) => {
        db = event.target.result;
  
        let cochesStore = db.createObjectStore("coches", { keyPath: "id", autoIncrement: true });
  
        cochesStore.createIndex("marca", "marca", { unique: false });
        cochesStore.createIndex("modelo", "modelo", { unique: false });
        cochesStore.createIndex("anio", "anio", { unique: false });
  
        console.log("Base de datos creada y actualizada");
    };
  
    window.agregarCoche = () => {
        let marca = document.getElementById("marca").value;
        let modelo = document.getElementById("modelo").value;
        let anio = document.getElementById("anio").value;
  
        if (!marca || !modelo || !anio) {
            alert("Por favor, complete todos los campos.");
            return;
        }

        let transaction = db.transaction(["coches"], "readwrite");
        let cochesStore = transaction.objectStore("coches");
  
        let nuevoCoche = { marca, modelo, anio };
  
        let request = cochesStore.add(nuevoCoche);
  
        request.onsuccess = () => {
            console.log("Coche agregado con éxito");
            limpiarFormulario();
        };
  
        request.onerror = (event) => {
            console.error("Error al agregar el coche:", event.target.errorCode);
        };
    };
  
    window.mostrarCoches = () => {
        let listaCoches = document.getElementById("lista-coches");
        listaCoches.innerHTML = "";
  
        let transaction = db.transaction(["coches"], "readonly");
        let cochesStore = transaction.objectStore("coches");
  
        let cursorRequest = cochesStore.openCursor();
  
        cursorRequest.onsuccess = (event) => {
            let cursor = event.target.result;
  
            if (cursor) {
                let coche = cursor.value;
                let listItem = document.createElement("li");
                listItem.textContent = `${coche.marca} ${coche.modelo} (${coche.anio})`;
                listaCoches.appendChild(listItem);
  
                cursor.continue();
            }
        };
  
        cursorRequest.onerror = (event) => {
            console.error("Error al leer la base de datos:", event.target.errorCode);
        };
    };

    function limpiarFormulario() {
        document.getElementById("marca").value = "";
        document.getElementById("modelo").value = "";
        document.getElementById("anio").value = "";
    }
});

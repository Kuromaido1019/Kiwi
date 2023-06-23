// Obtener todos los elementos de la lista
const listItems = document.querySelectorAll('.list-item');

// Agregar evento de clic a cada elemento de la lista
listItems.forEach(item => {
  item.addEventListener('click', () => {
    // Quitar la clase "selected" de todos los elementos de la lista
    listItems.forEach(item => item.classList.remove('selected'));

    // Agregar la clase "selected" al elemento clicado
    item.classList.add('selected');
  });
});
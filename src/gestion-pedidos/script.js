// URL de la API del backend (ajustar según corresponda)
const apiUrl = 'http://localhost:8080/api/pedidos';

// Función para agregar un pedido
document.getElementById('pedidoForm').addEventListener('submit', function(event) {
    event.preventDefault();

    // Obtener los valores de los campos
    const clienteId = Number(document.getElementById('cliente').value);  // Asegúrate de que sea un número
    const fecha = document.getElementById('fecha').value;
    const estado = document.getElementById('estado').value;

    // Verificar que los campos no estén vacíos
    if (!clienteId || !fecha || !estado) {
        console.error('Faltan datos en el formulario');
        return;
    }

    // Crear un objeto para el nuevo pedido
    const nuevoPedido = {
        cliente: { id: clienteId },  // Asegúrate de que clienteId sea un número
        fecha: fecha,
        estado: estado
    };

    // Verifica que los datos sean correctos
    console.log('Nuevo pedido:', JSON.stringify(nuevoPedido));

    // Enviar el pedido al backend con POST
    fetch(apiUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(nuevoPedido)
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        }
        throw new Error('Error al agregar el pedido');
    })
    .then(data => {
        console.log('Pedido agregado:', data);
        // Limpiar el formulario
        document.getElementById('pedidoForm').reset();
        // Actualizar la lista de pedidos
        obtenerPedidos();
    })
    .catch(error => {
        console.error('Error al agregar el pedido:', error);
    });
});

// Función para obtener la lista de pedidos
function obtenerPedidos() {
    fetch(apiUrl)
        .then(response => response.json())
        .then(pedidos => {
            const listaPedidos = document.getElementById('pedidoList');
            listaPedidos.innerHTML = ''; // Limpiar la lista antes de agregar los nuevos pedidos
            pedidos.forEach(pedido => {
                const li = document.createElement('li');
                li.textContent = `Cliente ID: ${pedido.cliente.id} | Fecha: ${pedido.fecha} | Estado: ${pedido.estado}`;
                listaPedidos.appendChild(li);
            });
        })
        .catch(error => {
            console.error('Error al obtener los pedidos:', error);
        });
}

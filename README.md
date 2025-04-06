# Proyecto de Gestión de Pedidos

Este proyecto es una aplicación de gestión de pedidos para una empresa, implementada utilizando **Java** y el framework **Spring Boot**. La aplicación permite la creación y gestión de pedidos, vinculados a clientes en una base de datos.

## Estructura del Proyecto

El proyecto está organizado en las siguientes carpetas:

- `src/`: Contiene el código fuente del proyecto.
  - `controller/`: Controladores que gestionan las peticiones HTTP y responden a ellas.
  - `model/`: Modelos que representan las entidades de la base de datos (por ejemplo, `Cliente`, `Pedido`).
  - `repository/`: Repositorios que permiten la interacción con la base de datos.
  - `service/`: Lógica de negocio que maneja la creación y gestión de pedidos.
  - `gestion_pedidos/`: Carpeta donde esta el HTML, CSS y JS

## Requisitos Previos

Antes de ejecutar el proyecto, asegúrate de tener instalados los siguientes componentes:

1. **Java 11 o superior**: La aplicación está construida con Spring Boot y requiere Java para ejecutarse.
2. **Maven**: El proyecto usa Maven como herramienta de construcción para gestionar dependencias y compilar el código.
3. **Base de Datos**: La aplicación usa una base de datos, por lo que debes tener una base de datos configurada, preferentemente **MySQL** o **H2** para pruebas locales.

## Configuración del Proyecto

1. **Clonar el Repositorio**

   Primero, clona el repositorio en tu máquina local:

   ```bash
   git clone https://github.com/usuario/tu-repositorio.git
   cd tu-repositorio
2.
Configuración de la Base de Datos

Si estás usando MySQL:

Crea una base de datos llamada gestion_pedidos.

Configura la conexión a la base de datos en el archivo application.properties que se encuentra en src/main/resources/:

Endpoints de la API
La aplicación ofrece los siguientes endpoints para interactuar con los pedidos y clientes:

GET /api/pedidos: Lista todos los pedidos.

POST /api/pedidos: Crea un nuevo pedido.

GET /api/pedidos/{id}: Obtiene un pedido por su ID.

DELETE /api/pedidos/{id}: Elimina un pedido por su ID.

GET /api/clientes: Lista todos los clientes.

POST /api/clientes: Crea un nuevo cliente.
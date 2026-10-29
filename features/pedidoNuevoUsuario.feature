Feature: Pedido Nuevo Usuario

@pedidoNuevoUsuario
Scenario: pedido por un nuevo usuario en 3 dias
    Given que estamos en la pagina de Login
    When hago clic en Crear una cuenta
    And lleno el formulario con datos validos
    And hago clic en Crear cuenta
    And ingreso los datos del nuevo usuario en el login
    Then deberiamos avanzar a la pagina de Catalogo

    When hacemos clic en Ver ficha
    And agrego dos unidades del producto al carrito
    And hago clic en Carrito
    And hago clic en Continuar con el pedido
    And lleno la informacion para que la fecha de entrega sea en 3 dias
    And hago clic en Confirmar pedido
    Then la fecha de entrega deberia ser "12/10/2026"

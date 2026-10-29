Feature: Pedido

@pedido
Scenario: pedido por 9 dias
    Given que estamos en la pagina de Catalogo
    When hacemos clic en Ver ficha
    And agrego dos unidades del producto al carrito
    And hago clic en Carrito
    And hago clic en Continuar con el pedido
    And lleno la informacion para que la fecha de entrega sea en 9 dias
    And hago clic en Confirmar pedido
    Then la fecha de entrega deberia ser "20/10/2026"

Feature: Login

@login
Scenario: ingresar con credenciales validas
    Given que estamos en la pagina de Login
    When ingresamos "cnueva" y "Tienda123!" y hacemos clic en el boton de ingresar
    Then deberiamos avanzar a la pagina de Catalogo
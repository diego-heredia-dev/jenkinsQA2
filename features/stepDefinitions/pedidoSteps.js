const { Given, When, Then } = require('@wdio/cucumber-framework')
const LoginPage = require('../../pageObjects/loginPage.js')
const CatalogoPage = require('../../pageObjects/catalogoPage.js')
const VerFichaPage = require('../../pageObjects/verFichaPage.js')
const CarritoPage = require('../../pageObjects/carritoPage.js')

const assert = require('assert')

Given('que estamos en la pagina de Catalogo', async () => {
    await browser.url('https://tienda-qa.pages.dev/ingresar')
    await LoginPage.login('cnueva', 'Tienda123!')

    await browser.takeScreenshot()
})

When('hacemos clic en Ver ficha', async () => {
    await CatalogoPage.verFichaBtn.click()
})

When('agrego dos unidades del producto al carrito', async () => {
    await VerFichaPage.sumarUnidadBtn.click()
    await browser.takeScreenshot()
    await VerFichaPage.agregarAlCarritoBtn.click()
})

When('hago clic en Carrito', async () => {
    await VerFichaPage.carritoBtn.click()
    await browser.takeScreenshot()
})

When('hago clic en Continuar con el pedido', async () => {
    await browser.pause(2000)
    await CarritoPage.continuarConElPedidoBtn.click()

})

When('lleno la informacion para que la fecha de entrega sea en 9 dias', async () => {
    await CarritoPage.zonaEnvioSelect.selectByVisibleText('Villa Aurora')
    await CarritoPage.direccionEnvioInput.setValue('Calle imaginaria')
    await CarritoPage.abrirCalendarioBtn.click()
    await CarritoPage.dia20Btn.click()
    await CarritoPage.mananaRadio.click()

    await browser.takeScreenshot()
})

When('hago clic en Confirmar pedido', async () => {
    await CarritoPage.confirmarPedidoBtn.click()
})

Then('la fecha de entrega deberia ser {string}', async (fechaEntrega) => {
    assert.strictEqual(await CarritoPage.fechaEntrega.getText(), fechaEntrega)
    await browser.takeScreenshot()
})
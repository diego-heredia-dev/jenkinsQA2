const { Given, When, Then } = require('@wdio/cucumber-framework')
const LoginPage = require('../../pageObjects/loginPage.js')
const CatalogoPage = require('../../pageObjects/catalogoPage.js')
const VerFichaPage = require('../../pageObjects/verFichaPage.js')
const CarritoPage = require('../../pageObjects/carritoPage.js')
const CrearCuentaPage = require('../../pageObjects/crearCuentaPage.js')

const assert = require('assert')

When('hago clic en Crear una cuenta', async () => {
    await LoginPage.crearCuentaBtn.click()
    await browser.takeScreenshot()
})

When('lleno el formulario con datos validos', async () => {
    await CrearCuentaPage.llenarFormulario()
    await browser.takeScreenshot()
})

When('hago clic en Crear cuenta', async () => {
    await CrearCuentaPage.crearCuentaBtn.click()
})

When('ingreso los datos del nuevo usuario en el login', async () => {
    await LoginPage.login('diego', 'D#a1234567')
})


When('lleno la informacion para que la fecha de entrega sea en 3 dias', async () => {
    await CarritoPage.zonaEnvioSelect.selectByVisibleText('Villa Aurora')
    await CarritoPage.direccionEnvioInput.setValue('Calle imaginaria')
    await CarritoPage.abrirCalendarioBtn.click()
    await CarritoPage.dia12Btn.click()
    await CarritoPage.mananaRadio.click()

    await browser.takeScreenshot()
})



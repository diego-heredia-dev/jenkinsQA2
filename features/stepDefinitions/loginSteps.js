const { Given, When, Then } = require('@wdio/cucumber-framework')
const LoginPage = require('../../pageObjects/loginPage.js')
const assert = require('assert')

Given('que estamos en la pagina de Login', async () => {
    await browser.url('https://tienda-qa.pages.dev/ingresar')
    assert.strictEqual(await browser.getUrl(), 'https://tienda-qa.pages.dev/ingresar')

    await browser.takeScreenshot()
})

When('ingresamos {string} y {string} y hacemos clic en el boton de ingresar', async (username, password) => {
    await LoginPage.login(username, password)
})

Then('deberiamos avanzar a la pagina de Catalogo', async () => {
    assert.strictEqual(await browser.getUrl(), 'https://tienda-qa.pages.dev/catalogo')
    await browser.takeScreenshot()
})
class LoginPage {
    get usernameInput() { return $('#signinUserInput'); }
    get passwordInput() { return $('#signinPassInput'); }
    get ingresarBtn() { return $('#signinSubmitButton'); }
    get crearCuentaBtn() { return $('#signinSignupLink'); }

    async login(username, password) {
        await this.usernameInput.setValue(username)
        await this.passwordInput.setValue(password)
        
        await browser.takeScreenshot()

        await this.ingresarBtn.click()
    }
}

module.exports = new LoginPage()
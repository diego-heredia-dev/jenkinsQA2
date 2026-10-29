class CrearCuentaPage {
    get nombreCompletoInput() { return $('input[name="full_name"]'); }
    get correoInput() { return $('input[name="user_mail"]'); }
    get aliasInput() { return $('input[name="user_alias"]'); }
    get contrasenaInput() { return $('input[name="pass_word"]'); }
    get repetirContrasenaInput() { return $('input[name="pass_word_repeat"]'); }
    get tipoClienteSelect() { return $('select[name="customer_tier"]'); }
    get aceptarCondicionesCheckbox() { return $('input[name="accept_rules"]'); }
    get crearCuentaBtn() { return $('button[name="create_account"]'); }

    async llenarFormulario() {
        await this.nombreCompletoInput.setValue('Diego')
        await this.correoInput.setValue('diego@correo.test')
        await this.aliasInput.setValue('diego')
        await this.contrasenaInput.setValue('D#a1234567')
        await this.repetirContrasenaInput.setValue('D#a1234567')
        await this.tipoClienteSelect.selectByVisibleText('Cliente')
        await this.aceptarCondicionesCheckbox.click()
    }
}

module.exports = new CrearCuentaPage()
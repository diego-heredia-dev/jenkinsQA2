class CarritoPage {
    get continuarConElPedidoBtn() { return $('#cartCheckoutButton'); }

    get zonaEnvioSelect() { return $('select[name="shipping_zone"]'); }
    get direccionEnvioInput() { return $('input[name="shipping_address"]'); }
    get abrirCalendarioBtn() { return $('#deliveryCalendarButton'); }
    get dia20Btn() { return $('button[data-day="2026-10-20"]'); }
    get mananaRadio() { return $('input[name="delivery_slot"][value="morning"]'); }
    get confirmarPedidoBtn() { return $('#checkoutConfirmButton'); }

    get fechaEntrega() { return $('td[data-field="deliver-on"]'); }

    get dia13Btn() { return $('button[data-day="2026-10-13"]'); }

    get dia12Btn() { return $('button[data-day="2026-10-12"]'); }

    async llenarFormulario() {
        await this.zonaEnvioSelect.selectByVisibleText('Villa Aurora')
        await this.direccionEnvioInput.setValue('Calle imaginaria')
        await this.abrirCalendarioBtn.click()
        await this.dia17Btn.click()
        await this.mananaRadio.click()
    }
}

module.exports = new CarritoPage()
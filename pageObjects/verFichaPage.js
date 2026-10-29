class VerFichaPage {
    get sumarUnidadBtn() { return $('button[aria-label="Sumar una unidad"]'); }
    get agregarAlCarritoBtn() { return $('button.item-sheet__add-btn'); }

    get carritoBtn() { return $('#headerCartLink'); }
}

module.exports = new VerFichaPage()
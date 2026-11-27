function calcDiscount(price, percent) {
    return price * (percent / 100);
}

function formatMoney(value) {
    return `${value.toFixed(2)} грн`;
}

function priceWithDiscount(price, percent) {
    return formatMoney(price - calcDiscount(price, percent));
}

module.exports = { calcDiscount, formatMoney, priceWithDiscount };

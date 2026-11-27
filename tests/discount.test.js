const { calcDiscount, priceWithDiscount } = require('../src/discount');

test('Unit: розрахунок знижки', () => {
    expect(calcDiscount(200, 10)).toBe(20);
    expect(calcDiscount(50, 50)).toBe(25);
});

test('Integration: ціна зі знижкою у форматі грн', () => {
    expect(priceWithDiscount(200, 10)).toBe('180.00 грн');
    expect(priceWithDiscount(99.9, 0)).toBe('99.90 грн');
});

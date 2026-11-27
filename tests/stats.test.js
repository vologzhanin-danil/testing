const average = require('../src/stats');

test('Unit: середнє арифметичне', () => {
    expect(average([2, 4, 6])).toBe(4);
    expect(average([10])).toBe(10);
});

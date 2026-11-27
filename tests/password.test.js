const isPasswordStrong = require('../src/password');

test('Unit: перевірка надійності пароля', () => {
    expect(isPasswordStrong('qwerty123')).toBe(true);
    expect(isPasswordStrong('qwertyuiop')).toBe(false);
});

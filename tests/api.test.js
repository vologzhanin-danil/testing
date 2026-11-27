const axios = require('axios');
const fetchTodos = require('../src/api');

jest.mock('axios');

test('Integration: отримання завдань з API (mock axios)', async () => {
    axios.get.mockResolvedValue({
        data: [
            { userId: 1, id: 1, title: 'Вивчити Jest', completed: true },
            { userId: 1, id: 2, title: 'Написати тести', completed: false }
        ]
    });
    const todos = await fetchTodos();
    expect(axios.get).toHaveBeenCalledTimes(1);
    expect(todos).toHaveLength(2);
    expect(todos[1].completed).toBe(false);
});

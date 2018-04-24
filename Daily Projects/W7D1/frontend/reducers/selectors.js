

const allTodos = (state) => {
  return Object.keys(state.todos).map((el) => state.todos[el]);
};

export default allTodos;

<<<<<<< HEAD


const allTodos = (state) => {
  return Object.keys(state.todos).map((el) => state.todos[el]);
};

export default allTodos;
=======
export const allTodos = ({ todos }) => Object.keys(todos).map(id => todos[id]);

export const stepsByTodoId = ({ steps }, todo_id) => {
  const stepsByTodoId = [];
  Object.keys(steps).forEach(stepId => {
    const step = steps[stepId];
    if (steps[stepId].todo_id === todo_id) stepsByTodoId.push(step)
  })
  return stepsByTodoId;
};
>>>>>>> w7d2/master

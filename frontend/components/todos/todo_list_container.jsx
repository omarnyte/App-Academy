import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import {connect} from 'react-redux';
import {receiveTodos, receiveTodo} from '../../actions/todo_actions';



const mapStateToProps = (state) => ({
  todos: allTodos(state)
});

const mapDispatchToProps = (dispatch) => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);

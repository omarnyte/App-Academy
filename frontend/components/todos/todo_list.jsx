import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';
import {receiveTodos, receiveTodo} from '../../actions/todo_actions';
// import uniqueId from '../util/unique-id';



class TodoList extends React.Component {
  render() {
    let {todos} = this.props;
    console.log(todos);
    let todoslist = todos.map((el, idx) =>
      // <li key={idx}>{el.title}</li>
      <TodoListItem key={idx} todo={el}/>
    );
    return (
      <div>
        <ul>{todoslist}</ul>
        <TodoForm receiveTodo={this.props.receiveTodo}/>
      </div>
    );
  }
}

export default TodoList;

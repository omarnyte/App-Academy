import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import {receiveTodos, receiveTodo} from './actions/todo_actions';
import App from './components/app';
import Root from './components/root';
import allTodos from './reducers/selectors';
//test

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.allTodos = allTodos;

  const root = document.getElementById("content");
  ReactDOM.render(<Root store={store}/> , root);
});

import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

import { fetchTodos } from './actions/todo_actions';
import { removeTodo } from './actions/todo_actions';

// for testing
window.fetchTodos = fetchTodos;

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  debugger
  const root = document.getElementById('content');
  console.log(root);
  ReactDOM.render(<Root store={store} />, root);
  // for testing
  window.store = store;
});

import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

import applyMiddleware from 'redux';


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // // Phase 1
  // store.dispatch = addLoggingToDispatch(store);
  // // Test
  // window.dispatch = store.dispatch;

  // Phase 2
  store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// Phase 1
// const addLoggingToDispatch = store => {
//   const storeDispatch = store.dispatch;
//
//   return (action) => {
//     console.log('Old State:', store.getState());
//     console.log('Action:', action);
//
//     storeDispatch(action);
//
//     console.log('New State:', store.getState());
//   };
// };

// Phase 2
const addLoggingToDispatch = store => next => action => {
  console.log('Old State:', store.getState());
  console.log('Action:', action);

  next(action);

  console.log('New State:', store.getState());
};


const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch })
};

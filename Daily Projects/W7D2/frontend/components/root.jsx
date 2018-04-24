import React from 'react';
import { Provider } from 'react-redux';
<<<<<<< HEAD
import App from './app';

const Root = ({store}) => (
  <Provider store={ store }>
=======
import App from './app.jsx';

const Root = ({ store }) => (
  <Provider store={store}>
>>>>>>> w7d2/master
    <App />
  </Provider>
);

export default Root;

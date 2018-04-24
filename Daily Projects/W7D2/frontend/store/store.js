import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
<<<<<<< HEAD

const configureStore = () => createStore(rootReducer);

=======
import { applyMiddleware } from 'redux';
import { thunk } from '../middleware/thunk';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(thunk));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};
>>>>>>> w7d2/master
export default configureStore;

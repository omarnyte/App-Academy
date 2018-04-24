import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import RootReducer from '../reducers/root_reducer';
// The store holds the global state of an application, so we need
// to create it before we can test our reducer. Remember that Redux
// provides a createStore method that receives a reducer, optional
// preloadedState, and an optional enhancer. We'll begin by writing
// a configureStore function that passes our rootReducer to
// createStore.


const configureStore = () => {
  return createStore(RootReducer, applyMiddleware(thunk));
};

export default configureStore;

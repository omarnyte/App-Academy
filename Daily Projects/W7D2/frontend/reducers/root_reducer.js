import { combineReducers } from 'redux';
<<<<<<< HEAD
import todosReducer from './todos_reducer';

const rootReducer = combineReducers({
  todos: todosReducer
=======

import todosReducer from './todos_reducer';
import stepsReducer from './steps_reducer';

const rootReducer = combineReducers({
  todos: todosReducer,
  steps: stepsReducer
>>>>>>> w7d2/master
});

export default rootReducer;

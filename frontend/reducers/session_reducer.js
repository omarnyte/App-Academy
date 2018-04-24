import { RECEIVE_CURRENT_USER } from '../actions/session_action';

export default (state = { currentUser: null }, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      return { currentUser: action.user };
    default: 
      return state;
  }
};
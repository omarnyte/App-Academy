import * as APIUtil from '../util/api_util';
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";

const receiveUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user
})

export const login = (user) => dispatch => (
  APIUtil.login(user).then( user => dispatch(receiveUser(user)) )
);

export const logout = (user) => dispatch => (
  APIUtil.logout().then( resp => dispatch(receiveUser(resp)) )
);

export const signup = (user) => dispatch => (
  APIUtil.signup(user).then( user => dispatch(receiveUser(user)) )
);
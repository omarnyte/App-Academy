import _ from 'lodash';
import { combineReducers } from 'redux';

import { errorsReducer } from './errors_reducer';
import { pokedisplayReducer } from './pokedisplay_reducer';
import { loadingReducer } from './loading_reducer';


// export const filterOnlyItems = (pokemon) => {
//   return _.omitBy(pokemon, function(value, key) {
//      return !(key.startsWith("items"));
//  });
// };

export const uiReducer = combineReducers({
  errors: errorsReducer,
  pokedisplay: pokedisplayReducer,
  loading: loadingReducer
});

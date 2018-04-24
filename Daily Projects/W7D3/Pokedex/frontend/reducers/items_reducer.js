import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import { receiveAllPokemon, receiveOnePokemon } from '../actions/pokemon_actions';
import _ from 'lodash';

const defaultState = {};

export const filterOnlyItems = (pokemon) => {
  let justItems = _.omitBy(pokemon, function(value, key) {
     return !(key.startsWith("items"));
   });
   let newStateShape = {};
  justItems.items.forEach(function(el) {
    newStateShape[el.id] = el;
  });
  return newStateShape;
};

export const itemsReducer = (state = defaultState, action) => {
  switch (action.type){
    case RECEIVE_ONE_POKEMON:
      let newState = _.merge({}, state, filterOnlyItems(action.pokemon));
      return newState;
    default:
      return state;
  }
};

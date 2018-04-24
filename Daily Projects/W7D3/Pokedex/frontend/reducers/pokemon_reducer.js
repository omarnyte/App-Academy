import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import { receiveAllPokemon, receiveOnePokemon } from '../actions/pokemon_actions';
import _ from 'lodash';

const defaultState = {};

export const filterOutItems = (pokemon) => {
  return _.omitBy(pokemon, function(value, key) {
     return key.startsWith("items");
 });
};



export const pokemonReducer = (state = defaultState, action) => {
  console.log(action.pokemon);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      let newState = _.merge({}, state, action.pokemon);
      return newState;
    case RECEIVE_ONE_POKEMON:
      let pokemon = action.pokemon.pokemon
      newState = _.merge({}, state, {[pokemon.id]: pokemon});
      return newState;
    default:
      return state;
  }
};

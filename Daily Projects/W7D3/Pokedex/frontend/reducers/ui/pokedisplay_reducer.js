import _ from 'lodash';
import { RECEIVE_ONE_POKEMON } from '../../actions/pokemon_actions';


export const filterOnlyId = (pokemon) => {
  let justId = _.omitBy(pokemon, function(value, key) {
     return !(key.startsWith("id"));
   });
  return justId.id;
};


const defaultState = -1;

export const pokedisplayReducer = (state = defaultState, action) => {
  switch(action.type){
    case RECEIVE_ONE_POKEMON:
      let newState = filterOnlyId(action.pokemon.pokemon);
      return newState;
    default:
      return state;
  }

};

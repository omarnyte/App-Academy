import _ from 'lodash';

export const pushPokemonToArray = (state) => {
  return _.values(state.entities.pokemon);
};

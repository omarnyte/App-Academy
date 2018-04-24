import React from 'react';
import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index';

import { pushPokemonToArray } from '../../reducers/selectors';
import { requestAllPokemon } from '../../actions/pokemon_actions';



const mapStateToProps = (state) => ({
  pokemon: pushPokemonToArray(state)
});

const mapDispatchToProps = (dispatch) => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);

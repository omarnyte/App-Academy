import React from 'react';
import ReactDOM from 'react-dom';
import { PokemonIndexItem } from './pokemon_index_item';

class PokemonIndex extends React.Component {
  componentWillMount() {
    this.props.requestAllPokemon();
  }

  render() {

    const allPokemon = this.props.pokemon.map(poke => {
      return <PokemonIndexItem key={poke.id} poke={poke} />;
    });

    return (
      <ul>
        { allPokemon }
      </ul>
    );
  }
}

export default PokemonIndex;

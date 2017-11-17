import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import { configureStore } from './store/store';
import { HashRouter, Route } from 'react-router-dom';

import { fetchOnePokemon } from './util/api_util';
window.fetchOnePokemon = fetchOnePokemon;

import { filterOutItems } from './reducers/pokemon_reducer';
window.filterOutItems = filterOutItems;

import { receiveAllPokemon, requestAllPokemon, requestOnePokemon } from './actions/pokemon_actions';
window.receiveAllPokemon = receiveAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.requestOnePokemon = requestOnePokemon; 
//
// window.pokemonReducer = pokemonReducer;
//
// import { pushPokemonToArray } from './reducers/selectors';
// window.pushPokemonToArray = pushPokemonToArray;

// import { rootReducer } from '../reducers/'



document.addEventListener("DOMContentLoaded", () => {
  let store = configureStore();
  window.store = store;
  window.dispatch = store.dispatch;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});

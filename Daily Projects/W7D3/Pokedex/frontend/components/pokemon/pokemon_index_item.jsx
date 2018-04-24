import React from 'react';
import ReactDOM from 'react-dom';
import { Link } from 'react-router-dom';

export const PokemonIndexItem = (props) => {
  return (
    <Link to={`pokemon/${props.poke.id}`}>
      <li>
        {props.poke.name}
        <img src={props.poke.image_url} height="100" width="100"/>
      </li>
  </Link>
  );
};

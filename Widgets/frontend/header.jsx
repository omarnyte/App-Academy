import React from "react";
import ReactDOM from "react-dom";

const Header = ({title, onclick}) => {
  return(
    <button className="tab-header" onClick={onclick}>{title}</button>
  );
};

export default Header;

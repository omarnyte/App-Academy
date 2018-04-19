import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";
import Tab from "./tabs";


class Widget extends React.Component {
  constructor () {
    super();

  }

  render () {
    return (
      <div>
        <Clock />
        <Tab data = {[
                        {
                          "title": "one",
                          "content": "I am the first"
                        },
                        {
                          "title": "two",
                          "content": "two"
                        },
                        {
                          "title": "three",
                          "content": "i am 3"
                        }
                      ]}/>
                      
      </div>
    );
  }

}

export default Widget;

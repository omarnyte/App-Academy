import React from "react";
import ReactDOM from "react-dom";
import Header from "./header";

class Tab extends React.Component {
  constructor ({data}) {
    super();
    this.state = { data, selectedTitle: 0 };
  }

  setSelected(index, e) {
    e.target.classList.add("selected-tab");
    this.setState({ selectedTitle: index });
  }

  render () {
    let { selectedTitle, data } = this.state;
    return (
      <div className="tabs-main-container">
        <div>
          <div className="tab-header-container tab">
            {
              data.map( (el, idx) => ( <Header key={el.title} onclick={ (e) => (this.setSelected(idx, e) )} title={el.title}  />))
            }
          </div>
          <div className="tab-content tab">
            <p>{data[selectedTitle].content}</p>
          </div>
        </div>
      </div>
    );
  }
}

export default Tab;

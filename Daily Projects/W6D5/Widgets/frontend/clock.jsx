import React from "react";

class Clock extends React.Component {
  constructor() {
    super();
    this.state = { date: new Date };
  }

  componentDidMount() {
    this.interval = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  tick() {
    this.setState({ date: new Date });
  }

  render(){
    return (
      <div>
        <h1>Clock</h1>
        <div className="clock-container">
          <div className="clock-row">
            <span>Time: </span>
            <span>{this.state.date.toTimeString()}</span>
          </div>
          <br />
          <div className="clock-row">
            <span>Date: </span>
            <span>{this.state.date.toDateString()}</span>
          </div>
        </div>
      </div>
    );
  }
}

export default Clock;

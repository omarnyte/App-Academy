import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
    this.state = { value: ''};
    this.handleChange = this.handleChange.bind(this);
    this.receiveTodo = this.receiveTodo.bind(this);
  }

  handleChange(e) {
    let value = e.currentTarget.value;
    this.setState({value});
  }

  receiveTodo(e) {
    e.preventDefault();
    const newLi = {id: uniqueId(), title: this.state.value};
    this.props.receiveTodo(newLi);
    this.setState({value: ''});
  }

  render() {
    return (
      <form>
        <input type="text" onChange={this.handleChange} value={this.state.value}></input>
        <button type="submit" onClick={this.receiveTodo}>Submit</button>
      </form>
    );
  }
}

function uniqueId() {
  return new Date().getTime();
}

export default TodoForm;

<<<<<<< HEAD
=======
import { uniqueId } from '../../util/id_generator'
>>>>>>> w7d2/master
import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
<<<<<<< HEAD
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
=======
    this.state = {
      title: "",
      body: "",
      done: false
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(property) {
    return e => this.setState({[property]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    }); // reset form
>>>>>>> w7d2/master
  }

  render() {
    return (
<<<<<<< HEAD
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
=======
      <form className="todo-form" onSubmit={this.handleSubmit}>
        <label>Title:
          <input
            className="input"
            ref="title"
            value={this.state.title}
            placeholder="buy milk"
            onChange={this.update('title')}
            required/>
        </label>
        <label>Body:
          <textarea
            className="input"
            ref="body"
            cols='20'
            value={this.state.body}
            rows='5'
            placeholder="2% or whatever is on sale!"
            onChange={this.update('body')}
            required></textarea>
        </label>
        <button className="create-button">Create Todo!</button>
      </form>
    );
  }
};
>>>>>>> w7d2/master

export default TodoForm;

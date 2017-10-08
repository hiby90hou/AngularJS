import React, { Component } from 'react';
// import logo from '../../logo.svg';
import './App.css';
import TodoHeader from '../TodoHeader/'
import TodoMain from '../TodoMain/'
import TodoFooter from '../TodoFooter/'


class App extends Component {

  constructor(props){
    super(props)
    //初始化state
    this.state = {
      todos:[
      {isDone:false,title:'eat'},
      {isDone:false,title:'drink'}
      ],
      {isAllDone:false}
    }
  }

  addTodo = (todo) => {
    const todos = this.state.todos

    //add
    todos.unshift(todo)
    //update
    this.setState({todos})
  }

  deleteTodo = (index) => {
    const todos = this.state.todos
    todos.splice(index, 1)
    this.setState({todos})
  }

  //删除所有选中的todo
  deleteDoneTodos = () => {
    //得到所有未完成的TODO组成的数组
    const todos = this.state.todos.filter(todo => !todo.isDone)
    this.setState({todos})
  }

  //更新指定todo的isDone值
  updateTodoChecked = () =>{
    this.setState({todos:this.state.todos})
  }

  

  render() {

    //定义main标签的props
    const mainProps = {
      todos: this.state.todos,
      updateTodoChecked:this.updateTodoChecked,
      deleteTodo:this.deleteTodo
    }

    //定义footer标签的props
      const footerProps = {
        totalCount: this.state.todos.length,
        doneCount:this.state.todos.filter(todo => todo.isDone).length,
        deleteDoneTodos:this.deleteDoneTodos
      }

    return (
      <div className="todo-container">
        <div className="todo-wrap">
          <TodoHeader addTodo={this.addTodo}/>
          <TodoMain {...mainProps}/>
          <TodoFooter {...footerProps}/>
        </div>
      </div>
    );
  }
}

export default App;

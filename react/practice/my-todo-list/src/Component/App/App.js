import React, { Component } from 'react';
// import logo from '../../logo.svg';
import PubSub from 'pubsub-js'
import './App.css';
import TodoHeader from '../TodoHeader/'
import TodoMain from '../TodoMain/'
import TodoFooter from '../TodoFooter/'
import UserGist from '../UserGist/'

class App extends Component {

  constructor(props){
    super(props)
    //初始化state
    this.state = {
      todos:[
      {isDone:false,title:'eat'},
      {isDone:false,title:'drink'}
      ],
      isAllDone:false,
      userName: 'XXX',
      lastGistUrl: '###'
    }
  }

  //内置的方法 不需要箭头函数
  componentDidMount(){
    //订阅消息（删除TODO）
    PubSub.subscribe('delete', (index) => {
      this.deleteTodo(index)
    })
    //Ajax URL
    var url = 'https://api.github.com/users/octocat/gists';
    //fetch Ajax
    fetch(url).then(
      (response) =>{
        response.json().then((result) => {
        
        var lastGist = result[0];
        console.log(lastGist.owner.login);
        this.setState({
          userName:lastGist.owner.login,
          lastGistUrl: lastGist.html_url
        });
      })
    },
    (error) => {
      console.log(error);
    }
    );

  }

  addTodo = (todo) => {
    const todos = this.state.todos

    //add
    todos.unshift(todo)
    //update
    this.setState({
      todos,
      isAllDone:false
    })
  }

  deleteTodo = (index) => {
    const todos = this.state.todos;
    const isAllDone = this.state.todos.filter(todo => !todo.isDone);
    todos.splice(index, 1)
    this.setState({
      todos,
      isAllDone:isAllDone.length===0&&todos.length>0
    })
  }

  //删除所有选中的todo
  deleteDoneTodos = () => {
    //得到所有未完成的TODO组成的数组
    const todos = this.state.todos.filter(todo => !todo.isDone) 
    this.setState({
      todos,
      isAllDone:false
    })
  }

  //更新指定todo的isDone值
  updateTodoChecked = () =>{
    const todos = this.state.todos;
    const isAllDone = this.state.todos.filter(todo => !todo.isDone); 
    this.setState({
      todos:this.state.todos,
      isAllDone:isAllDone.length===0&&todos.length>0
    })
  }
  //设置所有todos的选中状态
  changeAllChecked = (isAllDone) =>{
    //更新todos中所有TODO的状态
    const todos = this.state.todos;
    todos.forEach(todo =>{todo.isDone = isAllDone;})
    this.setState({
      isAllDone,
      todos
    })
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
        deleteDoneTodos:this.deleteDoneTodos,
        isAllDone:this.state.isAllDone,
        changeAllChecked: this.changeAllChecked

      }

    //定义Ajax的props
    const userGistProps = {
      userName: this.state.userName,
      lastGistUrl: this.state.lastGistUrl
    }

    return (
      <div className="todo-container">
        <div className="todo-wrap">
          <TodoHeader addTodo={this.addTodo}/>
          <TodoMain {...mainProps}/>
          <TodoFooter {...footerProps}/>
          <UserGist {...userGistProps}/>
        </div>
      </div>
    );
  }
}

export default App;

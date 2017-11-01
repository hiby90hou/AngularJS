import React, { Component } from 'react';
import { View, Text, AppRegistry, Image, ScrollView} from 'react-native';
import TodoHeader from '../TodoHeader/'
import TodoMain from '../TodoMain/'
import TodoFooter from '../TodoFooter/'

class App extends Component {

  constructor(props){
    super(props)
    //初始化state
    this.state = {
      todos:[
      {isDone:false,title:'cake',expire:null},
      {isDone:false,title:'coke',expire:null}
      ],
      isAllDone:false,
      userName: 'XXX',
      lastGistUrl: '###'
    }
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
  deleteExpireItem = () => {
    // let currentTime = new Date()
    // console.log(currentTime);
    function checkExpire(todo){
      let dateNum = Math.floor ( (todo.expire-new Date()) / ( 24 * 3600 * 1000 ))+1
      if(todo.expire==null || dateNum>=0){
        // console.log('no expire');
        return todo;
      }
      
    }
    //得到所有未完成的TODO组成的数组
    const todos = this.state.todos.filter(todo => (checkExpire(todo))) 
    console.log(todos);
    this.setState({
      todos,
      isAllDone:false
    })
  }

  // //更新指定todo的isDone值
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

    // //定义main标签的props
    const mainProps = {
      todos: this.state.todos,
      updateTodoChecked:this.updateTodoChecked,
      deleteTodo:this.deleteTodo
    }

    // //定义footer标签的props
      const footerProps = {
        totalCount: this.state.todos.length,
        doneCount:this.state.todos.filter(todo => todo.isDone).length,
        deleteExpireItem:this.deleteExpireItem,
        isAllDone:this.state.isAllDone,
        changeAllChecked: this.changeAllChecked

      }

    return (
      <ScrollView style={{flex: 1}}>
      <View style={{flex: 1,alignItems: 'center'}}>
        <Text>My shopping list</Text>
        <Image source={require('../../resources/logo.png')} style={{width: 193, height: 110}} style={{flex: 1, alignItems: 'center'}}/>
        <TodoHeader addTodo={this.addTodo}/>
      </View>
      
      <TodoMain {...mainProps}/>
      <TodoFooter {...footerProps}/>
      </ScrollView>
    );
  }
}

export default App;

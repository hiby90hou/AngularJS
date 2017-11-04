import React, { Component } from 'react';
import { View, Text, AppRegistry, Image, ScrollView,StyleSheet} from 'react-native';
import TodoHeader from '../TodoHeader/'
import TodoMain from '../TodoMain/'
import TodoFooter from '../TodoFooter/'
import ReadFile from '../readFile/'

var ToolbarAndroid = require('ToolbarAndroid');

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

  initState = (newState) =>{
    const todos = newState.todos
    const isAllDone = newState.isAllDone
    const userName = newState.userName
    const lastGistUrl = newState.lastGistUrl

    this.setState({
      todos,
      isAllDone,
      userName,
      lastGistUrl
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
      let dateNum
      if(todo.expire!=null){
      dateNum = Math.floor ( (new Date(todo.expire)-new Date()) / ( 24 * 3600 * 1000 ))+1
      }
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

  onActionSelected=(position) => {
    if (position === 0) { // index of 'Settings'
      // showSettings();
    }
  }


  

  render() {

    // 定义style
    const styles = StyleSheet.create({
      toolbar: {
        backgroundColor: '#e9eaed',
        height: 56
      }
    })

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
    //定义readfile标签的props
      const readfileProps = {
        state: this.state,
        initState:this.initState
      }

    return (
      <ScrollView style={{flex: 1}}>

      <ToolbarAndroid
      logo={require('../../resources/logo.png')}
      title="My Shopping List"
      style={styles.toolbar}
      actions={[{title: 'Filter'}]}
      onActionSelected={this.onActionSelected}></ToolbarAndroid>

      <View style={{flex: 1,alignItems: 'center'}}>
        <Text>Please enter your item name and press ✓</Text>

        <TodoHeader addTodo={this.addTodo}/>
      </View>
      
      <TodoMain {...mainProps}/>
      <TodoFooter {...footerProps}/>
      <Image source={require('../../resources/logo.png')} style={{width: 193, height: 110}} style={{flex: 1, alignItems: 'center'}}/>
      <ReadFile {...readfileProps}/>
      </ScrollView>
    );
  }
}

export default App;

/**
 * 头部组件
 */
import React, {Component} from 'react'

import { View, Text, TextInput, AppRegistry, Image } from 'react-native';
// import './header.css'

class TodoHeader extends Component {
  constructor(props){
    super(props);
    this.state = {times:0, text: ''}
  }
  timePlus(){
    let times = this.state.times
    times++
    console.log(times);
    this.setState({
      times:times
    })
  }

  handleChange = (text) => { return this.setState({text})}

  handleKeyUp = (text) =>{ 
    if(this.state.text==""){
      return
    }
    
    console.log(this.state.text);
    //根据输入的数据, 生成一个todo对象
    const todo = {
      title: this.state.text,
      isDone: false
    }
    //调用方法, 添加todo到todos
    this.props.addTodo(todo)

    //格式化state.text
    this.setState({
      text:''
    })

    //清空input
    this.textInput.clear()
  }
  // //处理enter键的keyup事件
  // handleKeyUp = (e) => {
  //   //判断回车键
  //   if(e.keyCode===13) {
  //     //判断,限制一下
  //     let title = e.target.value.trim()
  //     if(title==='') {
  //       return
  //     }
  //     //根据输入的数据, 生成一个todo对象
  //     const todo = {
  //       title: title,
  //       isDone: false
  //     }
  //     //调用方法, 添加todo到todos
  //     this.props.addTodo(todo)
  //     //清理输入
  //     e.target.value = ''
  //   }
  // }

  render() {
    return (
      <View className="todo-header" style={{width:300, backgroundColor:"#ccc"}}>
        <Text/>
        <TextInput type="text" placeholder="Task name + Enter" onChangeText={this.handleChange.bind(this)} onEndEditing={this.handleKeyUp.bind(this)} ref={input => { this.textInput = input }}/>
        <Text>
          {this.state.text.split(' ').map((word) => word && '🍕').join(' ')}
        </Text>
       {/* <Text onPress={this.timePlus.bind(this)}>
          click me
        </Text>
        <Text>
          You click me {this.state.times} times
        </Text>*/}
      </View>
    )
  }
}

export default TodoHeader

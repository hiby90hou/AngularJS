/**
 * 头部组件
 */
import React, {Component} from 'react'
import './header.css'

class TodoHeader extends Component {

  //处理enter键的keyup事件
  handleKeyUp = (e) => {
    //判断回车键
    if(e.keyCode===13) {
      //判断,限制一下
      let title = e.target.value.trim()
      if(title==='') {
        return
      }
      //根据输入的数据, 生成一个todo对象
      const todo = {
        title: title,
        isDone: false
      }
      //调用方法, 添加todo到todos
      this.props.addTodo(todo)
      //清理输入
      e.target.value = ''
    }
  }

  render() {
    return (
      <div className="todo-header">
        <input type="text" placeholder="Task name + Enter" onKeyUp={this.handleKeyUp}/>
      </div>
    )
  }
}

export default TodoHeader

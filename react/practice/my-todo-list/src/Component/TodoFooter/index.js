/**
 * 底部组件
 */
import React, {Component} from 'react'
import './footer.css'

class TodoFooter extends Component {


  //删除完成的todos
  deleteDoneTodos = () => {
    this.props.deleteDoneTodos()
  }

  //处理改变
  handleChange = () => {
    const {changeAllChecked, isAllDone} = this.props

    changeAllChecked(!isAllDone)
  }

  render() {

    const {doneCount, totalCount, isAllDone} = this.props
    const display = doneCount>0 ? 'block' : 'none'
    return (
      <div className="todo-footer">
        <label>
          <input type="checkbox" checked={isAllDone} onChange={this.handleChange}/>
        </label>
        <span>
          <span>已完成{doneCount}</span> / 全部{totalCount}
        </span>
        <button className="btn btn-danger" onClick={this.deleteDoneTodos} style={{display:'block'}}>清除已完成任务</button>
      </div>
    )
  }
}

export default TodoFooter

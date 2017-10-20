import React, {Component} from 'react'
import { View, Text,Button, TextInput } from 'react-native';

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
    // const display = doneCount>0 ? 'block' : 'none'
    return (
      <View className="todo-footer">
        <View>
          <TextInput type="checkbox" checked={isAllDone} onChange={this.handleChange}/>
        </View>
        <View>
          <Text>Complete {doneCount} / Total {totalCount}</Text>
        </View>
        <Button title="清除已完成任务" className="btn btn-danger" onPress={this.deleteDoneTodos}/>
      </View>
    )
  }
}

export default TodoFooter

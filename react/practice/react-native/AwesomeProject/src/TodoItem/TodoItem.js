import React from 'react';
// import PubSub from 'pubsub-js'
import {Text, View, CheckBox, Button, StyleSheet} from 'react-native';

class TodoItem extends React.Component {
	//checkbox状态改变的监听回调函数
	handleChange = ()=>{
		const {updateTodoChecked,todo}= this.props
		todo.isDone = !todo.isDone
		updateTodoChecked()
	}

	//点击删除相应
	deleteTodo = () => {
		const {deleteTodo,todo,index} = this.props
		// if(window.confirm(`确定删除${todo.title}吗`)){
			deleteTodo(index)
		// }
	}


	// handleEnter = () =>{
	// 	this.refs.li.style.background = "#ccc"
	// 	this.refs.button.style.display = 'block'
	// }

	// handleLeave = () =>{
	// 	this.refs.li.style.background = "#fff"
	// 	this.refs.button.style.display = 'none'
	// }




	render() {
		const {title,isDone} = this.props.todo
		
		const styles = StyleSheet.create({
		  container: {
		    flex: 1, 
		    flexDirection: 'row',
		    backgroundColor: "#F5F5F5",
		    paddingTop: 30,
		  },
		  content: {
		    flex: 1,
		    flexDirection: 'row'
		  }
		})
		return (
				<View ref="li" style={styles.container}>
					<View style={styles.content}>
						<CheckBox type="checkbox" value={isDone} onChange ={this.handleChange}/>
						<Text>{title}</Text>
					</View>
					<Button  style={styles.content} title="delete" onPress={this.deleteTodo} ref='button'/>
				</View>
		)
	};
}

export default TodoItem;

		
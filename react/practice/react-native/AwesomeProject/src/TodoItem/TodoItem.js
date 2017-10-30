import React from 'react';
// import PubSub from 'pubsub-js'
import {Text, View, CheckBox, Button, StyleSheet} from 'react-native';

class TodoItem extends React.Component {
	//checkbox状态改变的监听回调函数
	handleChange = ()=>{
		const {updateTodoChecked,todo}= this.props
		todo.isDone = !todo.isDone
		if(todo.isDone){
			console.log('输入时间');
			todo.expire = "2017/11/1"
		}
		updateTodoChecked()
	}

	//点击删除相应
	deleteTodo = () => {
		const {deleteTodo,todo,index} = this.props
			deleteTodo(index)
	}


	render() {
		const {title,isDone,expire} = this.props.todo
		
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
		  },
		  expire_date:{
		  	flex: 1,
		  	color:"#ccc"
		  }
		})
		return (
				<View ref="li" style={styles.container}>
					<View style={styles.content}>
						<CheckBox type="checkbox" value={isDone} onChange ={this.handleChange}/>
						<Text>{title}</Text>
					</View>
					<Text style={styles.expire_date}>Expire date:{expire}</Text>
					<Button  style={styles.content} title="delete" onPress={this.deleteTodo} ref='button'/>
				</View>
		)
	};
}

export default TodoItem;

		
import React from 'react';
// import PubSub from 'pubsub-js'
import {Text, View, CheckBox, Button, StyleSheet,DatePickerAndroid} from 'react-native';

class TodoItem extends React.Component {
	//checkbox状态改变的监听回调函数
	handleChange = (async()=>{
		const {updateTodoChecked,todo}= this.props
		todo.isDone = !todo.isDone
		if(todo.isDone){
			console.log('输入时间');
			// todo.expire = "2017/11/1"
			try {
			  const {action, year, month, day} = await DatePickerAndroid.open({
			    // Use `new Date()` for current date.
			    // May 25 2020. Month 0 is January.
			    date: new Date(),
			    mode:'spinner'		    
			  });
			  if (action == DatePickerAndroid.dismissedAction) {
			    // Selected year, month (0-11), day
			    todo.expire = ""
			    
			  }else{
			  	var date = new Date(year,month,day)
			  	// var getMonth = parseInt(date.getMonth())+1;
			  	// todo.expire = "Expire date: "+date.getFullYear()+"/"+(parseInt(date.getMonth())+1)+"/"+date.getDate()
			  	todo.expire = date
			}
			  
			  console.log(todo.expire);
			} catch ({code, message}) {
			  console.warn('Cannot open date picker', message);
			}
		}
		updateTodoChecked()
	})

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
		  },
		  expire_date_red:{
		  	flex: 1,
		  	color:"red"
		  }
		})
		return (
				<View ref="li" style={styles.container}>
					<View style={styles.content}>
						<CheckBox type="checkbox" value={isDone} onChange ={this.handleChange}/>
						<Text>{title}</Text>
					</View>
					<Text style={(expire !=null && expire-new Date()>3)?styles.expire_date:styles.expire_date_red}>
						{(expire !=null)?("Expire date: "+expire.getFullYear()+"/"+(parseInt(expire.getMonth())+1)+"/"+expire.getDate()):""}
					</Text>
					<Button style={styles.content} title="delete" onPress={this.deleteTodo} ref='button'/>
				</View>
		)
	};
}

export default TodoItem;

		
import React from 'react';
// import PubSub from 'pubsub-js'
import {Text, View, CheckBox, Button, StyleSheet,DatePickerAndroid} from 'react-native';

class TodoItem extends React.Component {
	//checkbox状态改变的监听回调函数
	handleChange = (async()=>{
		const {updateTodoChecked,todo}= this.props
		todo.isDone = !todo.isDone
		if(todo.isDone){
			// console.log('输入时间');
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
			    todo.expire = null
			    
			  }else{
			  	var date = new Date(year,month,day)
			  	// var getMonth = parseInt(date.getMonth())+1;
			  	// todo.expire = "Expire date: "+date.getFullYear()+"/"+(parseInt(date.getMonth())+1)+"/"+date.getDate()
			  	todo.expire = date
			}
			  
			  // console.log(todo.expire);
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

	colorChange = (color) => {
		const {todo} = this.props
		let expireDate=null
		if(todo.expire!=null){
			expireDate = new Date(todo.expire)
		}
		let num = Math.floor ( (expireDate-new Date()) / ( 24 * 3600 * 1000 ))+1
		// console.log(num);
		if(todo.expire!=null && num<3 && num>=0){
			return color = {
			veryfresh:false,
      		nearexpire:true,
      		isexpired:false
      	}
		}
		else if(todo.expire!=null && num<0){
			return color = {
				veryfresh:false,
				nearexpire:false,
				isexpired:true
			}
		}
		else{
			return color
		}
	}


	render() {
		const {title,isDone,expire} = this.props.todo
		let expireDate = new Date(expire)
		let color = {
			veryfresh:true,
      		nearexpire:false,
      		isexpired:false
      	}
      	color = this.colorChange(color)
      	// console.log(color);
		
		// console.log(this.state);

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
		  	flex: 1
		  },
		  gray_color:{
		  	color:"#ccc"
		  },
		  red_color:{
		  	color:"red"
		  },
		  dark_gray_color:{
		  	color:"#50555b",
		  	textDecorationLine:"line-through"
		  }
		})
		return (
				<View ref="li" style={styles.container}>
					<View style={styles.content}>
						<CheckBox type="checkbox" value={isDone} onChange ={this.handleChange}/>
						<Text>{title}</Text>
					</View>
					<Text style={[styles.expire_date, color.veryfresh && styles.gray_color, color.nearexpire && styles.red_color, color.isexpired && styles.dark_gray_color]}>
						{(expire !=null)?("Expire date:\n"+expireDate.getFullYear()+"/"+(parseInt(expireDate.getMonth())+1)+"/"+expireDate.getDate()):""}
					</Text>
					<Button style={styles.content} title="delete" onPress={this.deleteTodo} ref='button'/>
				</View>
		)
	};
}

export default TodoItem;

		
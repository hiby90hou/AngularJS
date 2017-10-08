import React from 'react';

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
		if(window.confirm(`确定删除${todo.title}吗`)){
			deleteTodo(index)
		}
	}

	handleEnter = () =>{
		this.refs.li.style.background = "#ccc"
		this.refs.button.style.display = 'block'
	}

	handleLeave = () =>{
		this.refs.li.style.background = "#fff"
		this.refs.button.style.display = 'none'
	}

	render() {
		const {title,isDone} = this.props.todo
		return (
				<li onMouseEnter = {this.handleEnter} onMouseLeave = {this.handleLeave} ref="li">
					<label>
						<input type="checkbox" checked={isDone} onChange ={this.handleChange}/>
						<span>{title}</span>
					</label>
					<button className="btn btn-danger" style={{display:'none'}} onClick={this.deleteTodo} ref='button'>delete</button>
				</li>
		)
	};
}

export default TodoItem;

		
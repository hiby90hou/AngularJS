import React from 'react';
import TodoItem from '../TodoItem/TodoItem'
import './TodoMain.css'

class TodoMain extends React.Component {
	render() {
		const todos = this.props.todos;
		return (
			<ul className="todo-main">
				{
					todos.map((todo,index)=>{
						return (
								<TodoItem key={index} todo={todo} index={index} {...this.props}/>
							)
					})
				}
			</ul>
		)
	};
}

export default TodoMain;

		
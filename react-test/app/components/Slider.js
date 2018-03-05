import React from 'react'


export default class Slider extends React.Component{
	constructor(props){
		super(props)
		this.handleChange = this.handleChange.bind(this)
		this.state = {
			value: props.startValue || 0
		}
	}

	handleChange(event){
		console.log("move")
		this.setState({
			value: event.target.value
		})
	}

	render(){
		return <div>
			<input 
				onChange={this.handleChange}
				value={this.state.value}
				min="0" 
				max="10" 
				type="range" />
			<input
				onChange={this.handleChange}
				value={this.state.value}
				type="text" />
		</div>
	}
}
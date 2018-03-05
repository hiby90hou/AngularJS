import React from 'react'

export default class LikeButton extends React.Component{
	constructor(props){
		super(props)

	}

	render(){
		return <div>
			<button
				onClick={this.props.handleClick}
			>Like</button>
			<span>{this.props.likeNum}</span>

		</div>
	}
}
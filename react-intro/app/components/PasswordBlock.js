import React from 'react'
import estimateStrength from '../../lib/checkpass'

// putting html to your js -jsx
export default class PasswordBlock extends React.Component{
	constructor(props) {
    super(props)
    this.changeText = this.changeText.bind(this);
    this.state = { 
      password: '' 
    }
  }

  changeText(event){
		this.setState({password: event.target.value})
  }



	render(){
		const checkpassword = this.state.password

		return <div>
			<input type="text" onChange={this.changeText} />
			<span>{estimateStrength(this.state.password).score} point</span>
		</div>
	}
}
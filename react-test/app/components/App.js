import React from 'react'
import PasswordInput from './PasswordInput'
import PasswordBlock from './PasswordBlock'
import Like from './Like'
import LikeButton from './LikeButton'
import Slider from './Slider'

export default class App extends React.Component {
  constructor(props) {
    super(props)
    this.handleClick = this.handleClick.bind(this)
    this.state = {
      likeNum: 10
    }
  }

  handleClick(event){

    this.setState({
      likeNum: (this.state.likeNum+1)
    })
  }

  render() {
    return <div>
      <h1>hello react</h1>
      <Slider startValue = '5'/>
      <Slider />
      <LikeButton handleClick = {this.handleClick} likeNum = {this.state.likeNum} />
      <PasswordInput />
      <PasswordBlock />
    </div>
  }

}

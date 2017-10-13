import React, { Component } from 'react';

class Search extends Component {
	handleClick = () => {
		const searchName = this.refs.searchName.value.trim()
		if(searchName===''){
			return
		}
		//将searchName传递给父组件App
		this.props.setSearchName(searchName)
	}
  render() {
    return (
	    <div>
	      <input type="text" placeholder="enter the name you search" ref='searchName'/>
	      <button onClick={this.handleClick}>Search</button>
	    </div>
    );
  }
}

export default Search;

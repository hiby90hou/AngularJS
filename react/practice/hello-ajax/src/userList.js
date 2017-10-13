import React, { Component } from 'react';
import axios from 'axios'

class userList extends Component {
	constructor(){
		super()
		this.state = {
			firstView:true,
			loading:false,
			users:null,
			error:null
		}
	}
	//当接收到新的props时 就会调用=> 发送ajax请求
	componentWillReceiveProps(nextProps){
		const searchName = nextProps.searchName
		//更新状态
		this.setState({firstView:false,loading:true})
		//发送请求
		axios.get('https://api.github.com/search/users?q='+searchName)
			.then((response) =>{
				console.log(response);
				this.setState({
					loading:false,
					users:response.data.items
				})
			})
			.catch((error) =>{
				console.log(error);
				this.setState({
					loading:false,
					error:error.toString()
				})
			})
	}
  render() {
  	//条件渲染
  	const {firstView,loading,users,error}=this.state
  	if(firstView){
  		return <h2>Enter name to search</h2>
  	} else if(loading){
  		return <h2>Loading...</h2>  		
  	} else{
  		return (
  			<div className="row">
  			{
  				users.map((user,index) =>{
  					return(
			  			<div className="card" key={index}>
				      <a href={user.html_url} target="_blank">
				        <img src={user.avatar_url} style={{width: 100+'px'}}/>
				      </a>
				      <p className="card-text">{user.login}</p>
				    </div>	
  					)
  				})
  			}
  			</div>
  			)
  	}

  }
}

export default userList;

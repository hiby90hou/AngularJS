import React from 'react';
import {NavLink} from 'react-router-dom'

class Repos extends React.Component {
	constructor(props){
		super(props)
		this.state={
			repos:[
		        {username: 'faceback', repoName: 'react'},
		        {username: 'faceback', repoName: 'react-router'},
		        {username: 'Angular', repoName: 'angular'},
		        {username: 'Angular', repoName: 'angular-cli'}
			]
		}
	}
	render() {
		return (
			<div>
			<h2>Repos组件内容2</h2>
			<ul>
			{
				this.state.repos.map(
					
					(repo,index) =>{
						
						const to = `/repos/${repo.username}/${repo.repoName}`;
						console.log(to);
						return(
							<li key={index}>
			                  <NavLink to={to}>{repo.repoName}</NavLink>
			                </li>
						)
                
					}
					)
			}
			</ul>
			<h2>Repos组件内容2</h2>
			</div>
		)
	}
}

export default Repos;
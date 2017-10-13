import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import UserList from './userList.js'
import Search from './search.js'

class App extends Component {
  constructor(){
    super()
    this.state = {
      searchName:''
    }
  }
  setSearchName = (searchName) =>{
    this.setState({searchName})
  }
  render() {
    return (
      <div id="app">
        <div className="container">
          <section className="jumbotron">
            <h3 className="jumbotron-heading">Search Github Users</h3>
            <Search setSearchName={this.setSearchName}/>
          </section>
            <UserList searchName = {this.state.searchName}/>
        </div>
</div>
    );
  }
}

export default App;

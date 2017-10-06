//渲染应用组件
import './index.css';
import React from 'react';//引入第三方模块
import ReactDOM from 'react-dom';
//引入App
import App from './components/App/App.js';//引入自定义模块

// import registerServiceWorker from './registerServiceWorker';

// ReactDOM.render(<App />, document.getElementById('root'));
// registerServiceWorker();
// ReactDOM.render(
//   <h1>Hello, world!</h1>,
//   document.getElementById('root')
// );
// // ReactDOM.render(
// //   <p>I am an exp</p>,
// //   document.getElementById('exp1')
// // );

// class RefsTest extends React.Component {
// constructor (props) {
// super(props);

// this.showMsg = this.showMsg.bind(this); // 强制给showMsg()绑定this(组件对象)
// this.handleBlur = this.handleBlur.bind(this);
// }

// showMsg() {
// // console.log(this); //this默认是null, 而不组件对象
// const input = this.refs.msg;
// alert(input.value);
// }

// handleBlur(event) {
// const input = event.target;
// alert(input.value);
// }

// render () {
// return (
//   <div>
//     <input type="text" ref="msg"/>
//     <button onClick={this.showMsg}>提示输入数据</button>
//     <input type="text" placeholder="失去焦点提示数据" onBlur={this.handleBlur}/>
//   </div>
// );
// }
// }

// ReactDOM.render(<RefsTest/>, document.getElementById('exp1'));
ReactDOM.render(<App/>, document.getElementById('root'));
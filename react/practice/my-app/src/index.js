//渲染应用组件
import React from 'react';//引入第三方模块
import ReactDOM from 'react-dom';
//引入App
import App from './components/App/App.js';//引入自定义模块

ReactDOM.render(<App />, document.getElementById('app'));
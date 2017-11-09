import React, {Component} from 'react'
import { View, Text, Button, TextInput, Alert, StyleSheet, Switch, TouchableOpacity, Image } from 'react-native';

class Login extends Component {
    constructor(props){
    super(props);
    this.state = {
      inputUserName: '',
      inputPassword: '',
      autoLogin: false
    }
  }

  

  loginCheck = ()=>{
    let correctUserName = 'hiby';
    let correctPassword = 'hiby';
    // const {updateUserName} = this.props
    if(correctUserName == this.state.inputUserName &&
      correctPassword == this.state.inputPassword){
        updateUserName(correctUserName)
    }else{
      Alert.alert(
        'Wrong Password',
        'Please try again',
        [       
          {text: 'OK', onPress: () =>{console.log('inputUserName:'+this.state.inputUserName);console.log('inputPassword:'+this.state.inputPassword);}},
        ],
        { cancelable: false }
      )
    }
  }

  closeWindow = ()=>{
    Alert.alert(
      'Skip Sign In',
      'Are you sure to skip sign in?',
      [       
        {text: 'Yes', onPress: () =>{this.defaultLogin()}},
        {text: 'No', onPress: () =>{}}
      ],
      { cancelable: true }
    )
  }

  defaultLogin = ()=>{
    const {updateUserName} = this.props
    console.log('defaultLogin');
    let correctUserName = 'default'
    updateUserName(correctUserName)
  }

  handleUserName = (inputUserName) =>{ 
    return this.setState({inputUserName})
  }
  handlePassword = (inputPassword) =>{ 
    return this.setState({inputPassword})
  }

  render() {
    // 定义style
    const styles = StyleSheet.create({
      mainContainer: {
        // flex:1,
        width:300,
        height:400,
        backgroundColor: '#fff',
        borderRadius:20,
      },
      titleText:{
        fontWeight: 'bold',
        fontSize: 15,
        textAlign:"center",
        padding: 10
      },
      smallContainer:{
        flex: 1,
        paddingLeft:10,
        paddingRight:10,
        height:"auto",
        // backgroundColor:'#ccc'
      },
      line:{
        marginTop:20,
        marginBottom:10,
        borderBottomWidth:1,
        borderColor:'#ccc'

      },
      gap:{
        marginTop:20,
        marginBottom:10,
      },
      loginCheck:{
        borderRadius:10
      },
      resetText:{
        marginTop:10,
        textAlign:"center",
      },
      rememberBox:{
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
      },
      button:{
        width:20,
        height:20,
        alignSelf: 'flex-end',
        marginRight:10,
        marginTop:10
      },
      nav:{
        flexDirection: 'row',
        justifyContent: 'space-between',
      }

    })
    // const {doneCount, totalCount, isAllDone} = this.props
    // const display = doneCount>0 ? 'block' : 'none'
    return (
      <View style = {styles.mainContainer}>
        <View style = {styles.nav}>
          <View style={styles.button}/>
          <Text style = {styles.titleText}>Sign In</Text>
          <TouchableOpacity onPress={this.closeWindow}>
            <Image
              style={styles.button}
              source={require('../../resources/close.png')}
            />
          </TouchableOpacity>
        </View>
        <View style = {styles.line}></View>
        <View style = {styles.smallContainer}>
          <TextInput underlineColorAndroid = "#b131d8" type="text" placeholder="Please input your user name" onChangeText={this.handleUserName.bind(this)} ref={input => { this.userInput = input }}/>
          <TextInput underlineColorAndroid = "#b131d8" type="text" placeholder="Please input your password" onChangeText={this.handlePassword.bind(this)} ref={input => { this.pwInput = input }}/>
          <View style = {styles.rememberBox}>
            <Text style={{color:"#ccc"}}>Auto Login</Text>
            <Switch/>
            
            
          </View>
          <View style = {styles.gap}></View>
          <Button color='#b131d8' onPress = {this.loginCheck} title="Sign In"/>
          <View style = {styles.gap}></View>
          
          <Text style={styles.resetText}>Reset your password</Text>
        </View>
      </View>
    )
  }
}

export default Login

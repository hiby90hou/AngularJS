import React, {Component} from 'react'
import { View, Text, Button, TextInput, Alert, StyleSheet, Switch } from 'react-native';

class Login extends Component {

  loginCheck = ()=>{
      Alert.alert(
      'Wrong Password',
      'Please try again',
      [       
        {text: 'OK', onPress: () =>{}},
      ],
      { cancelable: false }
    )
  }

  render() {
    // 定义style
    const styles = StyleSheet.create({
      mainContainer: {
        // flex:1,
        width:300,
        height:300,
        backgroundColor: '#fff',
        borderRadius:20
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
        marginTop:10
      },
      rememberBox:{
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
      }

    })
    const {doneCount, totalCount, isAllDone} = this.props
    // const display = doneCount>0 ? 'block' : 'none'
    return (
      <View style = {styles.mainContainer}>
        <Text style = {styles.titleText}>Sign In</Text>
        <View style = {styles.line}></View>
        <View style = {styles.smallContainer}>
          <TextInput underlineColorAndroid = "#b131d8" type="text" placeholder="Please input your user name" />
          <TextInput underlineColorAndroid = "#b131d8" type="text" placeholder="Please input your password" />
          <View style = {styles.rememberBox}>
            <Switch/>
            <Text style={{color:"#ccc"}}>Remember password</Text>
            
          </View>
          <View style = {styles.gap}></View>
          <Button color='#b131d8' onPress = {this.loginCheck} title="Sign In"/>
          
          <Text style={styles.resetText}>Reset your password</Text>
        </View>
      </View>
    )
  }
}

export default Login

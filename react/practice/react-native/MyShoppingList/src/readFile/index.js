import React, {Component} from 'react'
import { View, Text,Button, TextInput } from 'react-native';
import RNFS from 'react-native-fs';

class readFile extends Component {
componentWillMount() {
  const {state, initState} = this.props
  //read file
  // require the module
var RNFS = require('react-native-fs');
console.log(RNFS.ExternalDirectoryPath+'/MyShoppingList/');

// get a list of files and directories in the main bundle
RNFS.readDir(RNFS.ExternalDirectoryPath+'/MyShoppingList/') // On Android, use "RNFS.DocumentDirectoryPath" (MainBundlePath is not defined)
  .then((result) => {
    console.log('GOT RESULT', result);

    // stat the 1st file
    return Promise.all([RNFS.stat(result[0].path), result[0].path]);
  })
  .then((statResult) => {
    if (statResult[0].isFile()) {
      // if we have a file, read it
      return RNFS.readFile(statResult[1], 'utf8');
    }

    return 'no file';
  })
  .then((contents) => {
    // log the file contents
    let newState = JSON.parse(contents)
    console.log(newState)
    initState(newState)
  })
  .catch((err) => {
    console.log(err.message, err.code);
  });
}


  render() {


//delete file
// create a path you want to delete
// var path = RNFS.DocumentDirectoryPath + '/test2.txt';

// return RNFS.unlink(path)
//   .then(() => {
//     console.log('FILE DELETED');
//   })
//   // `unlink` will throw an error, if the item to unlink does not exist
//   .catch((err) => {
//     console.log(err.message);
//   });




     return (
      <View className="todo-footer">
        <Text>read File</Text>
       </View>
    )
  }

  componentWillUnmount(){
    const {state} = this.props

//write file
    // require the module
var RNFS = require('react-native-fs');

var saveStr = JSON.stringify(state)
console.log(saveStr);

// create a path you want to write to
var path = RNFS.ExternalDirectoryPath + '/MyShoppingList/shoppingListData.json';

//make dir for this file
RNFS.mkdir(RNFS.ExternalDirectoryPath +'/MyShoppingList/')

// write the file
RNFS.writeFile(path, saveStr, 'utf8')
  .then((success) => {
    console.log('FILE WRITTEN! Path:');
    console.log(path);
    // console.log(path);
  })
  .catch((err) => {
    console.log(err.message);
  });
  }
}

export default readFile

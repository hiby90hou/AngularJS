var endPoint = 'Prahran';
var startPoint = 'Hawthorn';

console.log('startPoint' + startPoint);
console.log('endPoint' + endPoint);

var trainMap = {
  AlameinLine: ['Flinders Street', 'Richmond', 'East Richmond', 'Burnley', 'Hawthorn', 'Glenferrie'],
  GlenWaverlyLine: ['Flagstaff', 'Melbourne Central', 'Parliament', 'Richmond', 'Kooyong', 'Tooronga'],
  SandringhamLine: ['Southern Cross', 'Richmond', 'South Yarra', 'Prahran', 'Windsor'],

}
var result = routeFinding(startPoint,endPoint,trainMap);


//make an array contain all of the station name
// var totalArr = [];

// for (index in trainMap) {
//   totalArr = totalArr.concat(trainMap[index]);
// }
// console.log(totalArr);

// startPoint = prompt("please input startPoint");
// endPoint = prompt("please input endPoint");

// while(startPoint==null|| endPoint==null ||totalArr.toString().indexOf(startPoint)<0 || totalArr.toString().indexOf(endPoint)<0 ){
//   alert("Input error! Please try again")
//   startPoint = prompt("please input startPoint");
//   endPoint = prompt("please input endPoint");

// }
function routeFinding(startPoint,endPoint,trainMap) {
  // find out the intersection
  intersectionArr = findIntersection(trainMap);

  //check if start point and end point in the same line
  var SameLineCheck = isInSameLineCheck(startPoint, endPoint, trainMap);

  //when start point and end point in the same line
  if (SameLineCheck.inSameLine) {

    var result = calcOneLine(startPoint, endPoint, SameLineCheck.startLineName, trainMap);
    console.log(result);

  } else
  //when start point and end point in the different line
  {
    console.log(intersectionArr[0])
    console.log(SameLineCheck.startLineName[0])
    var result1 = calcOneLine(startPoint, intersectionArr[0], SameLineCheck.startLineName[0], trainMap);
    var result2 = calcOneLine(intersectionArr[0], endPoint, SameLineCheck.endLineName[0], trainMap);
    console.log('result1:' + result1)
    console.log('result2:' + result2)
    result1.pop();
    var result = result1.concat(result2);
    console.log(result);
  }

  printResult(startPoint, endPoint, result);

  return result;
}



function filter(arr1, arr2) {
  //copare 2 array
  var result = [];
  if (arr1 == [] || arr2 == []) {
    return result;
  }

  var tempString = arr2.toString();
  for (var i = 0; i < arr1.length; i++) {
    if (tempString.indexOf(arr1[i].toString()) > -1) {
      for (var j = 0; j < arr2.length; j++) {
        if (arr1[i] == arr2[j]) {
          result.push(arr1[i]);
          break;
        }
      }
    }
  }
  return result;
}

function calcOneLine(startPoint, endPoint, startLineName, trainMap) {
  //find start point order and end point order in the array
  var startNum = trainMap[startLineName].indexOf(startPoint);

  var endNum = trainMap[startLineName].indexOf(endPoint);

  var currentLine = trainMap[startLineName];

  //if endNum<startNum reverse currentLine Array
  if (endNum < startNum) {
    currentLine.reverse();

    startNum = currentLine.length - startNum - 1;
    endNum = currentLine.length - endNum - 1;
    console.log("startNum=" + startNum);
    console.log("endNum=" + endNum);
  }

  currentLine = currentLine.slice(0, endNum + 1);
  currentLine = currentLine.slice(startNum);
  console.log('currentLine = ' + currentLine);

  return currentLine;
}

// find out the intersection

function findIntersection(trainMap) {

  var totalArr = [];
  for (index in trainMap) {
    totalArr = totalArr.concat(trainMap[index]);
  }

  var intersectionArr = [];

  //find out the repeat station
  var flag = 0;
  for (var i = 0; i < totalArr.length; i++) {
    for (var j = i + 1; j < totalArr.length; j++) {
      if (totalArr[i] == totalArr[j]) {
        flag++;
        //if flag is 1, we find out a new intersection
        if (flag == 1) {
          intersectionArr.push(totalArr[i]);
        }
        //delete this station
        totalArr.splice(j, 1);
      }
    }

    //set flag to 0
    flag = 0;
  }
  return intersectionArr;
}

function isInSameLineCheck(startPoint, endPoint, trainMap) {
  //check if start point and end point in the same line
  var startLineName = [];
  var endLineName = [];

  for (index in trainMap) {
    for (var i = 0; i < trainMap[index].length; i++) {
      if (startPoint == trainMap[index][i]) {
        startLineName.push(index);
        console.log(startLineName);
      }
      if (endPoint == trainMap[index][i]) {
        endLineName.push(index);
        console.log(endLineName);
      }
    }
  }
  var sameLineName = filter(startLineName, endLineName)[0];
  if (sameLineName) {
    return result = {
      inSameLine: true,
      startLineName: sameLineName,
      endLineName: sameLineName
    };
  } else {
    return result = {
      inSameLine: false,
      startLineName: startLineName,
      endLineName: endLineName
    };
  }
}

function printResult(startPoint, endPoint, result) {
  document.write("origin: " + startPoint + "</br>");
  document.write("destination: " + endPoint + "</br>");
  result.forEach(function(value, index) {
    if (index < result.length - 1) {
      document.write(result[index] + " ---> ");
    } else {
      document.write(result[index] + "</br>");
    }
  })

  document.write(result.length + " stops total")
}
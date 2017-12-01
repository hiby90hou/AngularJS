var startPoint = 'Prahran';
var endPoint = 'Hawthorn';

//make an array contain all of the station name
var totalArr = [];

console.log('startPoint'+startPoint);
console.log('endPoint'+endPoint);

var trainMap = {
  AlameinLine : [ 'Flinders Street', 'Richmond', 'East Richmond', 'Burnley', 'Hawthorn', 'Glenferrie'],
  GlenWaverlyLine : ['Flagstaff', 'Melbourne Central', 'Parliament', 'Richmond', 'Kooyong','Tooronga'],
  SandringhamLine : ['Southern Cross', 'Richmond', 'South Yarra', 'Prahran', 'Windsor'],

}

for(index in trainMap){
  totalArr=totalArr.concat(trainMap[index]);
}
console.log(totalArr);

startPoint = prompt("please input startPoint");
endPoint = prompt("please input endPoint");

while(totalArr.toString().indexOf(startPoint)<0 || totalArr.toString().indexOf(endPoint)<0 ){
  alert("Input error! Please try again")
  startPoint = prompt("please input startPoint");
  endPoint = prompt("please input endPoint");

}

// find out the intersection
var intersectionArr = [];

//find out the repeat station
var flag=0;
for(var i=0;i<totalArr.length;i++)
{
  for(var j=i+1;j<totalArr.length;j++)
  {
    if(totalArr[i]==totalArr[j])
      {
        flag++;
        //if flag is 1, we find out a new intersection
        if(flag==1){
          intersectionArr.push(totalArr[i]);}
          totalArr.splice(j,1);    //delete this station
      }
  }

  //set flag to 0
  flag=0;        
}

//in this case, we only have one intersection name richmond
console.log(intersectionArr);

//check if start point and end point in the same line
var startLineName = [];
var endLineName = [];

for(index in trainMap){
  for(var i=0; i<trainMap[index].length; i++){
    if(startPoint == trainMap[index][i]){
      startLineName.push(index);
      console.log(startLineName);
    }
    if(endPoint==trainMap[index][i]){
      endLineName.push(index);
      console.log(endLineName);
    }
  }
}

//when start point and end point in the same line
if(filter(startLineName,endLineName)[0]){

  startLineName = endLineName = filter(startLineName,endLineName)[0];
  console.log("startLineName:"+ startLineName);

  var result = calcOneLine (startPoint, endPoint, startLineName,trainMap);
  console.log(result);

}else
//when start point and end point in the different line
{
  console.log(intersectionArr[0])
  console.log(startLineName[0])
  var result1 = calcOneLine (startPoint, intersectionArr[0], startLineName[0],trainMap);
  var result2 = calcOneLine (intersectionArr[0],endPoint, endLineName[0],trainMap);
  console.log('result1:'+result1)
  console.log('result2:'+result2)
  result1.pop();
  var result = result1.concat(result2);
  console.log(result);
}


document.write("origin: "+ startPoint+"</br>");
document.write("destination: " + endPoint+"</br>");
result.forEach(function (value, index){
  if(index<result.length-1){
    document.write(result[index]+" ---> ");
  }else{
    document.write(result[index]+"</br>");
  }
})

document.write(result.length+" stops total")


function filter(arr1, arr2){
  //copare 2 array
  var result = [];
  if(arr1 == [] || arr2 == []){
    return result;
  }

  var tempString=arr2.toString();
  for(var i=0;i<arr1.length;i++)
  {
    if(tempString.indexOf(arr1[i].toString())>-1)
    {
       for(var j=0;j<arr2.length;j++)
       {
           if(arr1[i]==arr2[j]) 
           {
              result.push(arr1[i]);
              break;
           }
       }
    }      
  }
  return result;
}

function calcOneLine (startPoint, endPoint, startLineName,trainMap){
  //find start point order and end point order in the array
  console.log("trainMap[startLineName]:"+trainMap[startLineName])
  var startNum = trainMap[startLineName].indexOf(startPoint);
  console.log("startNum="+startNum);

  var endNum = trainMap[startLineName].indexOf(endPoint);
  console.log("endNum="+endNum);

  var currentLine = trainMap[startLineName];

  //if endNum<startNum reverse currentLine Array
  if(endNum<startNum){
    currentLine.reverse();

    startNum = currentLine.length-startNum-1;
    endNum = currentLine.length-endNum-1;
    console.log("startNum="+startNum);
    console.log("endNum="+endNum);
    }

  currentLine = currentLine.slice(0,endNum+1);
  currentLine = currentLine.slice(startNum);
  console.log('currentLine = '+currentLine);

  return currentLine;    
}
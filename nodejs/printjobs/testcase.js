'use strict'
const http = require("http");
const fs = require('fs');
const path = require("path");

//readFile(filename,[options],callback);
fs.readFile(__dirname + '/printjobs.csv', {flag: 'w+', encoding: 'utf8'}, function (err, data) {
    if(err) {
     console.error(err);
     return;
    }
    console.log(data);
});

// fs.appendFile(filename,data,[options],callback);

var testData = [];
for (var i = 60; i >= 0; i--) {

	var sumNum = Math.floor(Math.random()*2000);
	
	var colorNum = Math.floor(Math.random()*2000);
	
	while(colorNum > sumNum){
		colorNum = Math.floor(Math.random()*2000);
	}
	
	testData.push(sumNum,colorNum, Math.random()>0.495,"\r");
};
testData=testData.toString().replace(/,\r,/g, ',\r');



fs.appendFile(__dirname + '/printjobs.csv', testData , function () {
	console.log('data generate complete');
});
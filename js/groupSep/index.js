studentArr = ['Alex', 'James', 'Robbie', 'Anushka', 'Jennifer', 'Ross', 'Aysa', 'Joanna Phillips', 'Shane', 'Chang', 'Johanna Schreiner', 'Sheila', 'Emma', 'Karen', 'Sherry', 'Ethan', 'Mark', 'Sophie', 'Fouad', 'Mia', 'Vivien', 'Haofu', 'Wally'];


var toGroup = function(studentArr, memberNum) {
	//how many people should left after the normal grouping
	var leftPerson = studentArr.length % memberNum;
	// console.log(leftPerson);

	//put result in a new array
	var result = [];
	var currentGroup = [];
	var numberCount = 0;
	for (var i = 0; i < studentArr.length; i++) {

		//for normal case (full group)
		if (Math.ceil(i / memberNum) < Math.ceil(studentArr.length / memberNum) - leftPerson) {
			currentGroup.push(studentArr[i]);
			numberCount++;

			//when the group is full, store it to result, clean currentGroup and numberCount
			if (numberCount >= memberNum) {
				result.push(currentGroup);
				// console.log('currentGroup='+currentGroup)
				currentGroup = [];
				numberCount = 0;
			}

			// When the leftPerson number is greater than 1/3 of the group member number, 
			//put the leftPerson to a new group
		} else
		//for the group which can not be full and has very small people left
		{
			if (leftPerson >= (memberNum / 3)) {
				currentGroup.push(studentArr[i]);
				numberCount++;

				if (numberCount >= memberNum) {
					result.push(currentGroup);
					currentGroup = [];
					numberCount = 0;
				}

				if (i === (studentArr.length - 1)) {
					result.push(currentGroup);
				}
			} else {
				currentGroup.push(studentArr[i]);
				numberCount++;

				//when the group is full, store it to result, clean currentGroup and numberCount
				if (numberCount >= memberNum - 1) {
					result.push(currentGroup);
					currentGroup = [];
					numberCount = 0;

				}
				if (i === (studentArr.length - 1)) {
					result.push(currentGroup);
				}
			}
		}
	}
	return result;
}
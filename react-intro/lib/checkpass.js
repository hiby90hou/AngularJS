export default function estimateStrength(string){
		var record = {score:0};
		if(/[a-z]/.test(string)){
			record.score += 1
			record.hasLowerCase = true 
		}

		if(/[A-Z]/.test(string)){
			record.score += 1
			record.hasUpperCase = true
		}

		if(/[0-9]/.test(string)){
			record.score += 1
			record.hasNumber = true
		}

		if(string.length>8){
			record.score += 1
			record.isOver8Char = true
		}

		if(/[^a-zA-Z\d\s:]/.test(string)){
			record.score += 1
			record.hasSpecialChar = true
		}
		return record
	}
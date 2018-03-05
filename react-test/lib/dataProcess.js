export default 	function getData(){
	return fetch('http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=6b42ff06a43ab7ee565483a155c0fa1a')
	.then(res => {return res.json()})
	.catch(error => console.error('Error:', error));
}
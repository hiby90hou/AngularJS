var url = window.location.search;
var id = url.substring(url.lastIndexOf('id=') + 3);
console.log(id);

var $container = $('.container');

function options(search){
  return {url: 'http://www.omdbapi.com/?apikey=2f6435d9&i='+ search}
}

$.ajax(options(id)).done(function(response){

		var $newDivElem = $('<div>')
		var $newH2Elem = $('<h2>')
		var $newAElem = $('<a>')
		$newH2Elem.text(response["Title"])

		var $newImg = $('<img>')
		$newImg.attr("src", response["Poster"]);

		var $newP = $('<p>')
		$newP.html(response['Plot'])

		$newDivElem.append($newH2Elem)
		$newDivElem.append($newImg)
		$newDivElem.append($newP)
		$container.append($newDivElem)

		// $container.append("<p>"+movie["Title"]+"</p>")
	})
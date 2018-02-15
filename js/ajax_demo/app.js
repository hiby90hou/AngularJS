function options(search){
  return {url: 'http://www.omdbapi.com/?apikey=2f6435d9&s='+ search}
}

var $container = $('.container');

$(".searchButton").on('click',function(){
	console.log('click');
	$.ajax(options($('.searchText').val())).done(function(response){
		var movieArr = response["Search"];
		movieArr.forEach(function(movie){
			var $newDivElem = $('<div>')
			var $newH2Elem = $('<h2>')
			var $newAElem = $('<a>')
			$newH2Elem.text(movie["Title"])
			$newAElem.append($newH2Elem)

			$newAElem.attr("href","./filmPage.html?id="+movie['imdbID']);
			$newAElem.attr("target","_blank");
			$newDivElem.append($newAElem)
			$container.append($newDivElem)

			// $container.append("<p>"+movie["Title"]+"</p>")
		})
	})
})
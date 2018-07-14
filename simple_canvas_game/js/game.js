function resize_canvas(){
  canvas = document.getElementsByTagName("canvas");
  if (canvas.width  < window.innerWidth)
  {
    canvas.width  = window.innerWidth;
  }

  if (canvas.height < window.innerHeight)
  {
    canvas.height = window.innerHeight;
  }
}

// Create the canvas
var canvas = document.createElement("canvas");
var ctx = canvas.getContext("2d");
canvas.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
canvas.height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
document.getElementsByTagName('body')[0].appendChild(canvas);

// Background image
var bgReady = false;
var bgImage = new Image();
bgImage.onload = function () {
	bgReady = true;
};
bgImage.src = "images/background.png";

// Hero image
var heroReady = false;
var heroImage = new Image();
heroImage.onload = function () {
	heroReady = true;
};
heroImage.src = "images/hero.png";

// Monster image
var monsterReady = false;
var monsterImage = new Image();
monsterImage.onload = function () {
	monsterReady = true;
};
monsterImage.src = "images/monster.png";

// Game objects
var hero = {
	speed: 256 // movement in pixels per second
};
var monster = {};
var monstersCaught = 0;

// Handle keyboard controls
var keysDown = {};
// Get the position of a touch relative to the canvas
const getTouchPos = (canvasDom, touchEvent) => {
  var rect = canvasDom.getBoundingClientRect();
  return {
    x: touchEvent.touches[0].clientX - rect.left,
    y: touchEvent.touches[0].clientY - rect.top
  };
}

const getMousePos = (canvasDom, mouseEvent) => {
  var rect = canvasDom.getBoundingClientRect();
  return {
    x: mouseEvent.clientX - rect.left,
    y: mouseEvent.clientY - rect.top
  };
}

addEventListener('touchmove', function(e) {
   mousePos = getTouchPos(canvas, e);
   // console.log(mousePos);
   // console.log(hero);
   //Player touch up
   if(mousePos.y < hero.y){
   	keysDown[-1] = true;
   }else{
   	delete keysDown[-1];
   }
   if(mousePos.y > hero.y){
   	keysDown[-2] = true;
   }else{
   	delete keysDown[-2];
   }
   if(mousePos.x < hero.x){
   	keysDown[-3] = true;
   }else{
   	delete keysDown[-3];
   }
   if(mousePos.x > hero.x){
   	keysDown[-4] = true;
   }else{
   	delete keysDown[-4];
   }
}, false);

addEventListener('touchend', function(e) {

	keysDown = {};
}, false);

var drawing = false;
var mousePos = { x:0, y:0 };
var lastPos = mousePos;

addEventListener("mousedown", function (e) {
  drawing = true;
  lastPos = getMousePos(canvas, e);
}, false);
addEventListener('mousemove', function(e) {
   mousePos = getMousePos(canvas, e);
   // console.log(mousePos);
   // console.log(hero);
   //Player touch up
   if(drawing){
		if(mousePos.y < hero.y){
			keysDown[-1] = true;
		}else{
			delete keysDown[-1];
		}
		if(mousePos.y > hero.y){
			keysDown[-2] = true;
		}else{
			delete keysDown[-2];
		}
		if(mousePos.x < hero.x){
			keysDown[-3] = true;
		}else{
			delete keysDown[-3];
		}
		if(mousePos.x > hero.x){
			keysDown[-4] = true;
		}else{
			delete keysDown[-4];
		}
   }

}, false);

addEventListener('mouseup', function(e) {
	drawing = false;
	keysDown = {};
}, false);


addEventListener("keydown", function (e) {
	keysDown[e.keyCode] = true;
}, false);

addEventListener("keyup", function (e) {
	delete keysDown[e.keyCode];
}, false);

// Reset the game when the player catches a monster
var reset = function () {
	hero.x = canvas.width / 2;
	hero.y = canvas.height / 2;

	// Throw the monster somewhere on the screen randomly
	monster.x = 32 + (Math.random() * (canvas.width - 64));
	monster.y = 32 + (Math.random() * (canvas.height - 64));
};

// Update game objects
var update = function (modifier) {
	if (38 in keysDown) { // Player holding up
		hero.y -= hero.speed * modifier;
	}
	if (40 in keysDown) { // Player holding down
		hero.y += hero.speed * modifier;
	}
	if (37 in keysDown) { // Player holding left
		hero.x -= hero.speed * modifier;
	}
	if (39 in keysDown) { // Player holding right
		hero.x += hero.speed * modifier;
	}
	if (-1 in keysDown) { // Player holding up
		hero.y -= hero.speed * modifier;
	}
	if (-2 in keysDown) { // Player holding up
		hero.y += hero.speed * modifier;
	}
	if (-3 in keysDown) { // Player holding left
		hero.x -= hero.speed * modifier;
	}
	if (-4 in keysDown) { // Player holding right
		hero.x += hero.speed * modifier;
	}


	// Are they touching?
	if (
		hero.x <= (monster.x + 32)
		&& monster.x <= (hero.x + 32)
		&& hero.y <= (monster.y + 32)
		&& monster.y <= (hero.y + 32)
	) {
		++monstersCaught;
		reset();
	}
};

// Draw everything
var render = function () {
	if (bgReady) {
		ctx.drawImage(bgImage, 0, 0,canvas.width, canvas.height);
	}

	if (heroReady) {
		ctx.drawImage(heroImage, hero.x, hero.y);
	}

	if (monsterReady) {
		ctx.drawImage(monsterImage, monster.x, monster.y);
	}

	// Score
	ctx.fillStyle = "rgb(250, 0, 0)";
	// ctx.fillRect(0, 0, canvas.width, canvas.height);
	ctx.font = "24px Helvetica";
	ctx.textAlign = "left";
	ctx.textBaseline = "top";
	ctx.fillText("Goblins caught: " + monstersCaught, 32, 32);
};

// The main game loop
var main = function () {
	var now = Date.now();
	var delta = now - then;

	update(delta / 1000);
	render();

	then = now;

	// Request to do this again ASAP
	requestAnimationFrame(main);
};

// Cross-browser support for requestAnimationFrame
var w = window;
requestAnimationFrame = w.requestAnimationFrame || w.webkitRequestAnimationFrame || w.msRequestAnimationFrame || w.mozRequestAnimationFrame;

// Let's play this game!
var then = Date.now();
reset();
main();

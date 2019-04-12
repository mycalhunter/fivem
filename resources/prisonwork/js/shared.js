var ConfigObject = function() {
	var self = this;

	//Specs for marker size & color
	this.MarkerInfo = {
		MarkerType: 99,
		DrawDistance: 100.0,
		MarkerSize: {x:1,y:1,z:4},
		BlipSprite: 446, //map icon
		EnterExitDelay:0,
		EnterExitDelayMax:600,
		MarkerColor: {r : 255, g : 0, b : 0, a : 25}
	}

	//Specs for marker location
	this.Markers = [[1629.76, 2563.87, 45.56]]; // [0,1,2,3,4,5] --inside prison
	this.Locations = [[1629.76, 2563.87, 45.56]]; // [0,1,2,3,4,5]  --inside prison
	this.Markers2 = [[1753.49, 2503.66, 45.57]]; // [0,1,2,3,4,5] --inside prison
	this.Locations2 = [[1753.49, 2503.66, 45.57]]; // [0,1,2,3,4,5]  --inside prison
	this.Markers3 = [[1755.42, 2467.19, 55.14]]; // [0,1,2,3,4,5] --inside prison
	this.Locations3 = [[1755.42, 2467.19, 55.14]]; // [0,1,2,3,4,5]  --inside prison

	//Game set as off by default
	this.PlayingBlackJack = false;

	//Debug mode turned on by default
	this.debugMode = true;
}

//Save game location and status in Config var
var Config = new ConfigObject();
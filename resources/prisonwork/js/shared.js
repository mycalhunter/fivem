var ConfigObject = function() {
	var self = this;

	//Specs for marker size & color
	this.MarkerInfo = {
		MarkerType: 2,
		DrawDistance: 100.0,
		MarkerSize: {x:2,y:2,z:1},
		BlipSprite: 566, //map icon
		EnterExitDelay:0,
		EnterExitDelayMax:600,
		MarkerColor: {r : 255, g : 255, b : 255}
	}

	//Specs for marker location
	this.Markers = [[1697.71, 2684.01, 45.56]]; // [0,1,2] --inside prison
	this.Locations = [[1697.71, 2684.01, 45.56]]; // [0,1,2]  --inside prison

	//Game set as off by default
	this.PlayingBlackJack = false;

	//Debug mode turned on by default
	this.debugMode = true;
}

//Save game location and status in Config var
var Config = new ConfigObject();
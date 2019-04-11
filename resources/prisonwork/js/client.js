//Set length of Config.Markers = 1
for (var i = 0; i < Config.Markers.length; i++) {

	//save the Marker iteration = 1 as "Marker" var
	var Marker = Config.Markers[i];
    var blip = AddBlipForCoord(Marker[0], Marker[1], Marker[2]);
    SetBlipSprite(blip, Config.MarkerInfo.BlipSprite); //set sprite image to "B" icon on map
    SetBlipDisplay(blip, 4);
    SetBlipScale(blip, 1); //set as 90% of default size
    SetBlipColour(blip, 4); //set sprite color to charcoal
    SetBlipAsShortRange(blip, true); //set to true so it can only be seen on the minimap within proximity to the marker
    BeginTextCommandSetBlipName("STRING"); //set blip name type as STRING
    AddTextComponentString("Black Jack"); //set name of blip as "Black Jack"
    EndTextCommandSetBlipName(blip); //close blip specs
}


//if player hits escape while menu is open, the menu will close
RegisterNuiCallbackType("escape");
on("__cfx_nui:escape", (data, cb) => {
	console.log("didescape");
	ShowMenu(false);
})

//function that displays menu for game and enables PlayingBlackJack game when Marker is interacted with
function ShowMenu(enable) {
	if (enable) {
		SetNuiFocus(true, true);
	} else {
		SetNuiFocus(false, false);
	}

	window.SendNuiMessage(JSON.stringify({
		type: "enableui",
		enable: enable
	}))
	Config.PlayingBlackJack = enable;
}

//set specs for HelpText function
function HelpText(text) {
    SetTextComponentFormat("STRING");
    AddTextComponentString(text);
    DisplayHelpTextFromStringLabel(0, 0, 0, -1);
}

//show blackjack message in chat window
function SendBlackJackMessage(message) {
	emit('chat:addMessage', { multiline: true, args: [ 'BlackJack', message ] });
}


//Show message if player is close enough to marker, else only show marker if player is too far
setTick(() => {
    for (var i = 0; i < Config.Locations.length; i++) {
        var playerCoord = GetEntityCoords(GetPlayerPed(-1), true); // array [x,y,z] 0 1 2
        var Location = Config.Locations[i]; // Coord(x,y,z)/Type(Config.JobTypes)

		//if (!Config.PlayingBlackJack) {
			if (GetDistanceBetweenCoords(playerCoord[0], playerCoord[1], playerCoord[2], Location[0], Location[1], Location[2], false) < Config.MarkerInfo.DrawDistance) {
				DrawMarker(Config.MarkerInfo.MarkerType, Location[0], Location[1], Location[2], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerInfo.MarkerSize.x, Config.MarkerInfo.MarkerSize.y, Config.MarkerInfo.MarkerSize.z - 2.0, Config.MarkerInfo.MarkerColor.r, Config.MarkerInfo.MarkerColor.g, Config.MarkerInfo.MarkerColor.b, 100, false, true, 2, false, false, false, false);
			}
			if (GetDistanceBetweenCoords(playerCoord[0], playerCoord[1], playerCoord[2], Location[0], Location[1], Location[2], false) < Config.MarkerInfo.MarkerSize.x / 2) {
				HelpText("Press ~INPUT_DETONATE~ to make license plates");
				if (IsControlJustReleased(0, 58)) { // G
					ShowMenu(true);

					//set PlayingBlackJack = true;
				}
			}
		//}
    }
});
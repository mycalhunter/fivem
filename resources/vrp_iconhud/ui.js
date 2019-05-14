// Credits: Marmota#2533
$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data
        $(".container-fluid").css("display",data.show? "none":"block");
        $(".container").css("display",data.show? "none":"block");
        $("#armor").css("width",data.armor + "%");
        $("#health").css("width",data.health + "%");
        $("#speed").css("width",data.speed + "%");
        $("#fuelamount").css("width",data.fuelamount + "%");
        $("#gearamount").css("width",(data.gearamount * 20.0) + "%");
        $("#mph").text(data.mph);
        $("#gear").text(data.gear);
        $("#fuel").text(data.fuel);
        $("#time").text(data.time);
    });
});
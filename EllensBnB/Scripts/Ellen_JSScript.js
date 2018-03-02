//Javascript for Ellen's B&B website 

/*Return to Top button*/
window.onscroll = function() {scrollFunction()};
	function scrollFunction() {
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20)
			{         document.getElementById("topBtn").style.display = "block";     }
		else {         document.getElementById("topBtn").style.display = "none";     } }

		// When the user clicks on the button, scroll to the top of the document 
	function topFunction() {     document.body.scrollTop = 0; // For Chrome, Safari and Opera
	document.documentElement.scrollTop = 0; // For IE and Firefox 
}


/*Expanding paragraphs*/
function DisplayPara()
{
	var el = document.getElementById("para1");
	
	
	if(el.style.display=="none")
	{
		el.style.display="block";
	}
	else 
		{
		el.style.display="none";
	}
	
	}
 
 /*changing Image - Onmouseover or onmouseout*/
 function changeImage() {
    var image = document.getElementById("houseImg");
    if (image.src.match("home2"))
	{
        image.src = "caImages/lg/patio.jpg";
    } 
	else 
	{
        image.src = "caImages/lg/home2.jpg";
    }
}

/*Google map*/
function initMap() {
    var galway = {lat: 53.277232, lng: -9.048089};
    var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: galway
        });
    var marker = new google.maps.Marker({
    position: galway,
    map: map
        });
      }
/*Jquery Date alternative*/
var datefield=document.createElement("input")
    datefield.setAttribute("type", "date")
    if (datefield.type!="date"){ //if browser doesn't support input type="date", load files for jQuery UI Date Picker
        document.write('<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"><\/script>\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"><\/script>\n') 
    }

	  
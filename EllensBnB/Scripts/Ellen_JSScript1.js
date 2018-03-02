/*Javascript for slideshow and containers*/

var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}

/*new code by Darren*/

function showPanel(panelId) {
    var element = document.getElementById(panelId);
    eleme
}

//for (i = 0; i < acc.length; i++) {
//  acc[i].onclick = function() {
//    this.classList.toggle("active");
//    var panel = this.nextElementSibling;
//    if (panel.style.maxHeight){
//      panel.style.maxHeight = null;
//    } else {
//      panel.style.maxHeight = panel.scrollHeight + "px";
//    } 
//  }
//}


//for (i = 0; i < acc.length; i++) {
//	acc[i].onclick = function () {
//		this.classList.toggle("active");
//		var panel = this.nextElementSibling;
//		if (panel.style.maxHeight) {
//			panel.style.maxHeight === panel.scrollHeight + "px";
//		} else {
//			panel.style.maxHeight === null;
//		}
//	}
//}
/*
 function sendForm() {
    var a = document.forms["myForm"]["firstname"].value;
	var b = document.forms["myForm"]["lastname"].value;
	var c = document.forms["myForm"]["address"].value;
	var d = document.forms["myForm"]["email"].value;
	var e = document.forms["myForm"]["mobile"].value;
			
    if (a =="" | b == "" | c == "" | d == "" | e == "") 
	{
       return false;
    }
	{
	alert("Thank you, your message has been sent");
		return true;
 }
 }
*/
  

			
		
	

	

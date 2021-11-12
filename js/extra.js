
var parts = document.location.toString().split("/");
var subdomain = parts[parts.length - 2];
//alert(subdomain);
//alert(parts[2]);
if(subdomain == parts[2]) {
	//document.querySelector("html").classList.add("home");
} else if(parts[3] == "Examples") {
	//document.querySelector("html").classList.add("examples");
} else if(parts[3] == "How%20to%20Use") {
	//document.querySelector("html").classList.add("how-to-use");
}



/**
 * 
 */

function Ztime(document,indtime,uktime,ustime) {


	days =new Array('Sun','Mon','Tue','Wed','Thu','Fri','Sat');
    d = new Date();
    utc = d.getTime() + (d.getTimezoneOffset() * 60000);
    ind = new Date(utc + (3600000*indtime));
	uk= new Date(utc + (3600000*uktime));
	us	= new Date(utc + (3600000*ustime));
	
	var ihours = ind.getHours();
    var iminutes = ind.getMinutes();
    var iseconds = ind.getSeconds();
	var isuffix = "AM";
	var iday=(ind.getDay());
	if (ihours >= 12) {isuffix = "PM"; ihours = ihours - 12;  } if (ihours == 0) {ihours = 12; }
	if (iminutes < 10) { iminutes = "0" + iminutes; } if(iseconds < 10) {iseconds = "0" + iseconds; }
	document.getElementById('inttime').innerHTML="<b><span color='#fff' >"+days[iday]+" " +ihours + ":" + iminutes + ":" + iseconds + " " + isuffix + "</span></b>";


	var shours = uk.getHours();
    var sminutes = uk.getMinutes();
    var sseconds = uk.getSeconds();
	var ssuffix = "AM";
	var sday=(uk.getDay());
	if (shours >= 12) { ssuffix = "PM"; shours = shours - 12;  } if (shours == 0) {  shours = 12;  }
    if (sminutes < 10){ sminutes = "0" + sminutes; } if(sseconds < 10) { sseconds = "0" + sseconds; }
    document.getElementById('uktime').innerHTML="<b><span color='#fff' >"+days[sday]+" " +shours + ":" + sminutes + ":" + sseconds + " " + ssuffix + "</span></b>";


	var uhours = us.getHours();
    var uminutes = us.getMinutes();
    var useconds = us.getSeconds();
	var usuffix = "AM";
	var uday=(us.getDay());	
	if (uhours >= 12) { usuffix = "PM"; uhours = uhours - 12;  } if (uhours == 0) { uhours = 12; }
	if (uminutes < 10){ uminutes = "0" + uminutes; }if(useconds < 10) { useconds = "0" + useconds; }
	document.getElementById('ustime').innerHTML="<b><span color='#fff' >"+days[uday]+" " +uhours + ":" + uminutes + ":" + useconds + " " + usuffix + "</span></b>";
	 
}
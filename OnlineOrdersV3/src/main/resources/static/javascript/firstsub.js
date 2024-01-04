function showProperties (theObject){
	alert("I am in function");
   for (var i in theObject) {
      if (theObject[i] != null) {
          document.write(i + " : " + theObject[i] + "<br>");
           
      }
      else {
         document.write(i + "<br>");
      }
   }
   return;
}
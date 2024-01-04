
function showPopup(innerhtml,x,y,width,height){
	showDivPopup(innerhtml,x,y,width,height);
	/*try{
		popupbody.innerHTML=innerhtml;
    	popup.show(x,y,width,height,document.body);
	}catch(e){
	}*/
}

function hidePopup(){
	hideDivPopup1();
	/*try{
		popup.hide();
	}catch(e){
	}*/
}

function showDivPopup(innerhtml,x,y,width,height){
   	var divpopup=document.getElementById('divpopup');
   	divpopup.style.left=x+document.body.scrollLeft;
   	divpopup.style.top=y+document.body.scrollTop;
   	divpopup.style.width=width;
   	divpopup.style.height=height;
   	divpopup.innerHTML=innerhtml;
   	divpopup.style.visibility='visible';
}

function hideDivPopup(){
   /*if(!documentClick(lastdocumentClickStore)){
		var divpopup=document.getElementById('divpopup');
   		divpopup.style.visibility='hidden';
   		if(lastObjectTablePopup!=null)
   			lastObjectTablePopup.style.visibility='hidden';
   }*/
   try{
   if(window_event.button!=2){
		var divpopup=document.getElementById('divpopup');
   		divpopup.style.visibility='hidden';
   	}
   	}catch(e){}
}

function hideDivPopup1(){
	var divpopup=document.getElementById('divpopup');
   	divpopup.style.visibility='hidden';
}


function showDivPopupforTable(obj){
   	//var divpopup=document.getElementById('divpopupfortable');
   /*divpopup.style.left=x;
   	divpopup.style.top=y;
   	divpopup.style.width=width;
   	divpopup.style.height=height;
   	divpopup.appendChild(obj);*/
   	obj.style.visibility='visible';
   	lastObjectTablePopup = obj;
}

function hideDivPopupforTable(){
	var divpopup=document.getElementById('divpopupfortable');
   	divpopup.style.visibility='hidden';
   	lastObjectTablePopup.style.visibility='hidden';
}

function showDivPopupWithCloseButton(innerhtml,x,y,width,height){
   	var divpopup=document.getElementById('divpopupwithcloseb');
   	divpopup.style.left=x;
   	divpopup.style.top=y;
   	divpopup.style.width=width;
   	divpopup.style.height=height;
   	divpopup.style.zIndex=100;
   	divpopup.childNodes[0].rows[1].cells[0].innerHTML=innerhtml;
   	divpopup.style.visibility='visible';
}

function hideDivPopupWithCloseButton(){
   	var divpopup=document.getElementById('divpopupwithcloseb');
   	divpopup.style.visibility='hidden';
}

var datedivpopup = document.createElement('div');
datedivpopup.style.border='1px solid #000';
datedivpopup.style.position='absolute';
datedivpopup.style.background='#fff';
datedivpopup.style.visibility='hidden';

function showDateDivPopup(innerhtml,x,y,width,height){
	datedivpopup.style.left=x;
   	datedivpopup.style.top=y;
   	datedivpopup.style.width=width;
   	datedivpopup.style.height=height;
   	datedivpopup.innerHTML=innerhtml;
	var documentbody = document.body;
	documentbody.appendChild(datedivpopup);
   	datedivpopup.style.visibility='visible';
}

function hideDateDivPopup(){
	datedivpopup.style.visibility='hidden';
}

function funcPopupMessageAction(obj){
	var val=obj.value;
	//window.returnValue=val;
	//window.close()
	hideDivPopupWithCloseButton();
	var params ="Form Id="+document.forms[0].id+"&PopupAction=actionToPopup&Value="+val;
	sendAjaxRequest('PopupMessage',params,callbackFunction);
}

function closePopupForTable(obj){
	var divTag = obj.parentNode.parentNode.parentNode.parentNode.parentNode;
	divTag.style.visibility='hidden';
}

//To disable right click in browser window

var message="";

function clickIE(){
	if (document.all){
		(message);
		return false;
	}
}
 
function clickNS(e) {
	if(document.layers||(document.getElementById&&!document.all)){
		if (e.which==2||e.which==3) {
			(message);
			return false;
		}
	}
}

if (document.layers){
	document.captureEvents(Event.MOUSEDOWN);
	document.onmousedown=clickNS;
}
else{
	document.onmouseup=clickNS;
	document.oncontextmenu=clickIE;
}
 
document.oncontextmenu=new Function("return false");
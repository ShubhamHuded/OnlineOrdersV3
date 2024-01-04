
function funcFilterInit(old){
	if(old[0]==undefined){
		document.getElementById('filterselect1').options[0].selected=true;
		document.getElementById('filterselect2').options[0].selected=true;
		document.getElementById('filtertext1').value='';
		document.getElementById('filterselect3').options[0].selected=true;
		document.getElementById('filterselect4').options[0].selected=true;
		document.getElementById('filterselect5').options[0].selected=true;
		document.getElementById('filtertext2').value='';
		document.getElementById('filterselect6').options[0].selected=true;
		document.getElementById('filterselect7').options[0].selected=true;
		document.getElementById('filterselect8').options[0].selected=true;
		document.getElementById('filtertext3').value='';
		document.getElementById('filterselect9').options[0].selected=true;
		document.getElementById('filterselect10').options[0].selected=true;
		document.getElementById('filterselect11').options[0].selected=true;
		document.getElementById('filtertext4').value='';
		document.getElementById('filternone').checked=true;
		return;
	}
	document.getElementById('filterselect1').options[old[0]].selected=true;
	document.getElementById('filterselect2').options[old[1]].selected=true;
	document.getElementById('filtertext1').value=old[2];
	document.getElementById('filterselect3').options[old[3]].selected=true;
	document.getElementById('filterselect4').options[old[4]].selected=true;
	document.getElementById('filterselect5').options[old[5]].selected=true;
	document.getElementById('filtertext2').value=old[6];
	document.getElementById('filterselect6').options[old[7]].selected=true;
	document.getElementById('filterselect7').options[old[8]].selected=true;
	document.getElementById('filterselect8').options[old[9]].selected=true;
	document.getElementById('filtertext3').value=old[10];
	document.getElementById('filterselect9').options[old[11]].selected=true;
	document.getElementById('filterselect10').options[old[12]].selected=true;
	document.getElementById('filterselect11').options[old[13]].selected=true;
	document.getElementById('filtertext4').value=old[14];
		if(old[16]=='&&')
			document.getElementById('filterand').checked=true;
		else if(old[16]=='||')
			document.getElementById('filteror').checked=true;
		else
			document.getElementById('filternone').checked=true;
}
		
function funcFilterOk(){
	var returnvalue=new Array();
	returnvalue[0]=document.getElementById('filterselect1').selectedIndex;
	returnvalue[1]=document.getElementById('filterselect2').selectedIndex;
	returnvalue[2]=document.getElementById('filtertext1').value;
	returnvalue[3]=document.getElementById('filterselect3').selectedIndex;
	returnvalue[4]=document.getElementById('filterselect4').selectedIndex;
	returnvalue[5]=document.getElementById('filterselect5').selectedIndex;
	returnvalue[6]=document.getElementById('filtertext2').value;
	returnvalue[7]=document.getElementById('filterselect6').selectedIndex;
	returnvalue[8]=document.getElementById('filterselect7').selectedIndex;
	returnvalue[9]=document.getElementById('filterselect8').selectedIndex;
	returnvalue[10]=document.getElementById('filtertext3').value;
	returnvalue[11]=document.getElementById('filterselect9').selectedIndex;
	returnvalue[12]=document.getElementById('filterselect10').selectedIndex;
	returnvalue[13]=document.getElementById('filterselect11').selectedIndex;
	returnvalue[14]=document.getElementById('filtertext4').value;
	returnvalue[15]=0;
	returnvalue[16]=document.getElementById('filterand').checked==true?'&&':(document.getElementById('filteror').checked==true?'||':'None');
	//alert(returnvalue);
	//window.returnValue=returnvalue;
	//window.close();
	filterDivPopup.style.visibility='hidden';
	funcFilterProcess(returnvalue);
}

function funcFilterCancel(){
	var returnvalue=new Array();
	returnvalue[0]=-1;
	//window.returnValue=returnvalue;
	//window.close();
	filterDivPopup.style.visibility='hidden';
	funcFilterProcess(returnvalue);
}

function funcFilterCreatSelecteElement(id,option){
	var newElement;
    newElement=document.getElementById(id);
    if(newElement==null){
		var newElement = document.createElement('select');
		newElement.setAttribute('id',id);
		newElement.options.length=option.length;
	}
	var newOption;
	for(opt=0;opt<option.length;opt++)
		newElement.options[opt].text=option[opt];
	//document.body.appendChild(newElement);
	return newElement;
}

function funcFilterCreateInputElement(type,id){
	var newElement;
	newElement=document.getElementById(id);
	if(newElement==null){
		newElement= document.createElement('input');
		newElement.type=type;
		newElement.setAttribute('id',id);
	}
	//document.body.appendChild(newElement);
	return newElement;
}

function funcFilterCreateInputButtonElement(type,id,value,funcname){
	var newElement;
	newElement=document.getElementById(id);
	if(newElement==null){
		newElement = document.createElement('input');
		newElement.type=type;
		newElement.setAttribute('id',id);
		newElement.setAttribute('value',value);
		newElement.onclick=funcname;
	}
	//document.body.appendChild(newElement);
	return newElement;
}

function funcFilterCreateInputRadioElement(id){
	var newElement;
	newElement=document.getElementById(id);
	if(newElement==null){
		newElement = document.createElement('input');
		newElement.type='radio';
		newElement.setAttribute('id',id);
		newElement.setAttribute('name','same');
		//newElement.onclick = new Function('this.checked=true');
	}
	newElement.style.visibility='visible';
	//document.body.appendChild(newElement);
	return newElement;
}

var filterDivPopup;

function createFilterElements(option1){
	var option2 = new Array();
	option2[0]=' ';
	option2[1]='>';
	option2[2]='<';
	option2[3]='>=';
	option2[4]='<=';
	option2[5]='==';
	option2[6]='!=';
	var option3 = new Array();
	option3[0]=' ';
	option3[1]='&&';
	option3[2]='||';
	filterDivPopup = document.createElement('div');
	filterDivPopup.style.position='absolute';
	filterDivPopup.style.left=100;
	filterDivPopup.style.top=100;
	filterDivPopup.style.width=460;
	filterDivPopup.style.height=300;
	filterDivPopup.style.border='1px solid #000';
	filterDivPopup.style.background='#fff';
	filterDivPopup.style.visibility='hidden';
	filterDivPopup.appendChild(document.createElement('br'));
	//filterDivPopup.appendChild(document.createElement("&nbsp"));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect1',option1));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect2',option2));
	filterDivPopup.appendChild(funcFilterCreateInputElement('text','filtertext1'));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect3',option3));
	filterDivPopup.appendChild(document.createElement('br'));
	filterDivPopup.appendChild(document.createElement('br'));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect4',option1));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect5',option2));
	filterDivPopup.appendChild(funcFilterCreateInputElement('text','filtertext2'));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect6',option3));
	filterDivPopup.appendChild(document.createElement('br'));
	filterDivPopup.appendChild(document.createElement('br'));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect7',option1));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect8',option2));
	filterDivPopup.appendChild(funcFilterCreateInputElement('text','filtertext3'));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect9',option3));
	filterDivPopup.appendChild(document.createElement('br'));
	filterDivPopup.appendChild(document.createElement('br'));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect10',option1));
	filterDivPopup.appendChild(funcFilterCreatSelecteElement('filterselect11',option2));
	filterDivPopup.appendChild(funcFilterCreateInputElement('text','filtertext4'));
	filterDivPopup.appendChild(funcFilterCreateInputButtonElement('button','filterbutton1','Ok',funcFilterOk));
	filterDivPopup.appendChild(funcFilterCreateInputButtonElement('button','filterbutton2','Cancel',funcFilterCancel));
	filterDivPopup.appendChild(document.createElement('br'));
	filterDivPopup.appendChild(document.createElement('br'));
	filterDivPopup.appendChild(funcFilterCreateInputRadioElement('filternone'));
	filterDivPopup.appendChild(document.createTextNode('None'));
	filterDivPopup.appendChild(funcFilterCreateInputRadioElement('filterand'));
	filterDivPopup.appendChild(document.createTextNode('And'));
	filterDivPopup.appendChild(funcFilterCreateInputRadioElement('filteror'));
	filterDivPopup.appendChild(document.createTextNode('Or'));
}

function funcFilterProcess(prefs){
	document.getElementById('filterand').style.visibility='hidden';
	document.getElementById('filteror').style.visibility='hidden';
	document.getElementById('filternone').style.visibility='hidden';
	if(prefs!=undefined)
	if(parseInt(prefs[0])!=-1)	{
		var filtarray=filtarraycreation(tablenode.id);
		var filtarray1=filttemparraycreation(tablenode.id);
		var filttablelen=getfilttablelen(tablenode.id);
		/*if(getfiltstate(tablenode.id)=='no'){
		filtarray1=filttemparraycreation(tablenode.id);
		filtarray=new Array(tablenode.rows.length);
		filtarray1=new Array(tablenode.rows.length);
		for(i=1;i<tablenode.rows.length;i++)
	  		filtarray[i]=tablenode.rows[i];
			filttablelen=tablenode.rows.length;
		}*/
		var newy=parseInt(prefs[0]);
		if(newy>0)
			newy=newy-1;
		//templen=prefs[2].length;
		noe=-1;
	 	/*switch(parseInt(prefs[1])){
			case 1:
      			resultarray=commoncodeforfilter(prefs,'>',newy,filtarray,filtarray1,filttablelen,noe);
			break;
			case 2:
       			resultarray=commoncodeforfilter(prefs,'<',newy,filtarray,filtarray1,filttablelen,noe);
	   			break;
			case 3:
       			resultarray=commoncodeforfilter(prefs,'>=',newy,filtarray,filtarray1,filttablelen,noe);
			break;
			case 4:
       			resultarray=commoncodeforfilter(prefs,'<=',newy,filtarray,filtarray1,filttablelen,noe);
			break;
			case 5:
       			resultarray=commoncodeforfilter(prefs,'==',newy,filtarray,filtarray1,filttablelen,noe);
			break;
			case 6:
      			resultarray=commoncodeforfilter(prefs,'!=',newy,filtarray,filtarray1,filttablelen,noe);
			break;
		}*/
		resultarray=commoncodeforfilter(prefs,filtarray,filtarray1,filttablelen,noe);
		filtarray1=resultarray[0];
		noe=resultarray[1];
		if(noe!=-1){
			setfiltstate(tablenode.id,'yes');
			/*templen=tablenode.rows.length;
			//for(i=1;i<templen;i++)
			while(tablenode.childNodes[0].childNodes[1]!=undefined)
			for(k=1;tablenode.childNodes[0].childNodes[k]!=undefined;k++)
			tablenode.childNodes[0].removeChild(tablenode.childNodes[0].childNodes[k]);
			for(i=0;i<noe;i++)
    		tablenode.childNodes[0].appendChild(filtarray1[i]);*/
    		removeandaddchildnode(0,noe,filtarray1);
    		asdearray[0]='';
    		if(noe==0)
    			window.status='No match record';
    	}
    }
    else
    if(getfiltstate(tablenode.id)=='yes')
    	filtercancel();
}

function funcGetHTMLTableTitleForFilter(title){
	title=title+'';
	var start=title.indexOf('<');
	title=title.substr(0,start);
	return title;
}
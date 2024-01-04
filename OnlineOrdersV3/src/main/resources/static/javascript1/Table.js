var window_event,window_object;
function tableclick(obj){
	//var object=document.elementFromPoint(obj.clientX,obj.clientY);
	//var object=window.event.srcElement;
	if(obj!=undefined)
		var event=obj;
	else
		var event=window.event;
	
	var object=(event.target)?(event.target):(event.srcElement);
		
	window_object = object;
	window_event = event;	
	
	while(object.nodeName!='TD')
		object = object.parentNode;
	
	//var table=
	findtableindex(object);
	//tablenode=table[0];
	clickedobject=object;
	//if(clickedobject.childNodes[0].nodeName=='#text')
		tableColumnClicked();
	
	/*showPopupWindow();

}

function showPopupWindow(){
    //try{*/
	var event = window_event;
	var object = window_object;
	
	var ontable="yes";
	while(object.nodeName!='TD'){
	  object=object.parentNode;
	  ontable="no";
	}
	hidePopup();
	if(event.button==2)
		if(ontable=='yes'){
			maxLengthOfTablePopupValue=0;
    		var canceltag=filtercanceltagecreation(tablenode.id);
			evt=window.event;
			var temp1=createtableopentag();
			var temp=' ';
			var tempheight=0;
			if(!tablenode.disabled)
			if(tablenode.getAttribute(common.ISEDITABLE)+''==''+true)
			if(TC_ISEDITABLE(tablenode.rows[tablex].childNodes[tabley].getAttribute(common.XMLD_PROPERTIES))){
				tempheight=tempheight+60;
				temp1+=createtablerowforpopup(common.EDIT);
				temp1+=createtablerowforpopup(common.ADDROW);
				temp1+=createtablerowforpopup(common.INSERTROW);
				temp1+=createtablerowforpopup(common.DELETE);
				tempheight=tempheight+20;
			}
			else{
				temp1+=createtablerowforpopup(common.ADDROW);
				temp1+=createtablerowforpopup(common.INSERTROW);
				temp1+=createtablerowforpopup(common.DELETE);
				tempheight=tempheight+60;
			}
			if(tablenode.rows[2]!=undefined || getfiltstate(tablenode.id)=='yes'){
				if(!(tablenode.getAttribute(common.ISEDITABLE)+''==''+true)){
					//popupbody.innerHTML="<table>"+temp+"<tr><td onmouseover=\"parent.backcc(this)\" onmouseout=\"parent.backcc1(this)\" onclick=\"parent.exitpopup('"+common.ASCENDING+"')\">"+common.ASCENDING+"</td></tr><tr><td onmouseover=\"parent.backcc(this)\" onmouseout=\"parent.backcc1(this)\" onclick=\"parent.exitpopup('"+common.DECENDING+"')\">"+common.DECENDING+"</td></tr><tr><td onmouseover=\"parent.backcc(this)\" onmouseout=\"parent.backcc1(this)\" onclick=\"parent.exitpopup('"+common.FILTER+"')\">"+common.FILTER+"</td></tr>"+filtcanceltag+"</table>";
					//tempheight=tempheight+75;
					//if(tablenode.getAttribute(common.ISEDITABLE)!=true){
					//if(tablenode.getAttribute(common.ISLASTSORATBLE)+''==true+''){
						if(tablenode.rows[2]!=undefined){
							temp1+=createtablerowforpopup(common.ASCENDING);
							temp1+=createtablerowforpopup(common.DECENDING);
							tempheight=tempheight+40;
						}
					//}
					//if(tablenode.getAttribute(common.ISFILTERTABLE)+''==true+''){
						temp1+=createtablerowforpopup(common.FILTER);
						tempheight=tempheight+20;
					//}
					//}
					temp1+=canceltag[0];//filtcanceltag;
				}
			}
			var tableType = tablenode.getAttribute(common.HTMLT_TABLE_TYPE_LABEL);
			//if(tableType==common.HTMLT_TABLE_TYPE){
				if(TC_HASCUSTOMPOPUP(tablenode.rows[tablex].cells[tabley].getAttribute(common.XMLD_PROPERTIES))){
					var columnName=funcGetHTMLTableTitleForFilter(tablenode.rows[0].cells[tabley].innerHTML);
			    	if(customPopupMenus[tablenode.id][columnName]==undefined){
						/*var columnTitle = replacestring(tablenode.childNodes[0].childNodes[0].childNodes[tabley].innerHTML);
						var params = 'Form Id='+getFormIdForElementId(tablenode.id)+'&'+common.PARAM_TABLENAME+'='+tablenode.name+'&'+common.PARAM_ROWNO+'='+(tablex-1)+'&'+common.PARAM_COLUMNNO+'='+tabley;
						params+='&'+common.PARAM_TABLEACTION+'='+common.PARAM_GET_CUSTOM_POPUP_VLAUE+'&'+common.PARAM_ROW_NAME+'='+columnTitle;
						sendAjaxRequest(common.SERV_TABLEACTION,params,callbackFunctionCustomPopupValue);
						return;*/
					}else{
						var noOfItem = customPopupMenus[tablenode.id][columnName].length;
						tempheight=tempheight+(noOfItem*20);
						for(var m=0;m<noOfItem;m++)
							temp1+=createtablerowforpopup(customPopupMenus[tablenode.id][columnName][m]);
					}
				}
			//}
			/*else{
				if(TN_HASMENU(tablenode.rows[tablex].getAttribute(common.XMLD_TREE_NODE_PROPERTIES))){
			    	if(customPopupMenus[tablenode.id][tabley]==undefined){
						var columnTitle = replacestring(tablenode.childNodes[0].childNodes[0].childNodes[tabley].innerHTML);
						var params = 'Form Id='+getFormIdForElementId(tablenode.id)+'&'+common.PARAM_TABLENAME+'='+tablenode.name+'&'+common.PARAM_ROWNO+'='+(tablex-1)+'&'+common.PARAM_COLUMNNO+'='+tabley;
						params+='&'+common.PARAM_TABLEACTION+'='+common.PARAM_GET_CUSTOM_POPUP_VLAUE+'&'+common.PARAM_ROW_NAME+'='+columnTitle;
						sendAjaxRequest(common.SERV_TABLEACTION,params,callbackFunctionCustomPopupValue);
						return;
					}
					var noOfItem = customPopupMenus[tablenode.id][tabley].length;
					tempheight=tempheight+(noOfItem*20);
					for(m=0;m<noOfItem;m++)
						temp1+=createtablerowforpopup(customPopupMenus[tablenode.id][tabley][m]);
				}
			}*/
			
			if(tableType!=common.HTMLT_TABLE_TYPE)
				if(tablenode.rows.length>1){
					temp1+=createtablerowforpopup(common.EXPANDALL);
					temp1+=createtablerowforpopup(common.COLLAPSEALL);
					tempheight=tempheight+40;
				}
			
			temp1+=createtableclosetag();
			//popupbody.innerHTML=temp1;
			if(tempheight!=0)
			showPopup(temp1,event.clientX,event.clientY,(maxLengthOfTablePopupValue*9),tempheight+canceltag[1]+5);
			//popup.show(window.event.clientX,window.event.clientY,90,tempheight+canceltag[1]+5,document.body);
		}
	if(event.button==4){
	alert(tablenode.rows[tablex].childNodes[tabley].getAttribute(common.XMLD_PROPERTIES)+'   '+tablenode.rows[tablex].childNodes[tabley].getAttribute(common.TABLE_ROW)+'   '+tablenode.rows[tablex].childNodes[tabley].getAttribute(common.TABLE_COLUMN));
	}
	//}catch(e){}
}

function setdisabled(){
	for(i=0;document.forms[i]!=undefined;i++)
		for(j=0;document.forms[i].elements[j]!=undefined;j++){
			if(document.forms[i].elements[j].disabled==false){
				createorsetattribute(document.forms[i].elements[j],'forlink','yes');
				document.forms[i].elements[j].disabled=true;
			}
		}
}

function setundisabled(){
	for(i=0;document.forms[i]!=undefined;i++)
		for(j=0;document.forms[i].elements[j]!=undefined;j++){
			if(document.forms[i].elements[j].getAttribute('forlink')=='yes'){
				//var a=document.forms[i].elements[j].getAttributeNode('forlink');
				//document.forms[i].elements[j].removeAttributeNode(a);
				document.forms[i].elements[j].setAttribute('forlink','no');
				document.forms[i].elements[j].disabled=false;
			}
		}
}

function tableheaderclick(obj){
	//var object=document.elementFromPoint(obj.clientX,obj.clientY);
	//var object=window.event.srcElement;
	if(obj!=undefined)
		var event=obj;
	else
		var event=window.event;
		
	var object=(event.target)?(event.target):(event.srcElement);
	//var table=
	findtableindex(object);
	//tablenode=table[0];
	var canceltag=filtercanceltagecreation(tablenode.id);
	if(event.button==2)
	if(getfiltstate(tablenode.id)=='yes'){
		hidePopup();//popup.hide();
		var temp1=createtableopentag();
		temp1+=createtablerowforpopup(common.FILTER);
		temp1+=canceltag[0];//filtcanceltag;
		temp1+=createtableclosetag();
		//popupbody.innerHTML=temp1;
		//popupbody.innerHTML="<table><tr><td onmouseover=\"parent.backcc(this)\" onmouseout=\"parent.backcc1(this)\" onclick=\"parent.exitpopup('"+common.FILTER+"')\">"+common.FILTER+"</td></tr>"+filtcanceltag+"</table>";
		//popup.show(event.clientX,event.clientY,90,25+canceltag[1],document.body);
		showPopup(temp1,event.clientX,event.clientY,90,25+canceltag[1]);
	}
}

function doubleClickedOnTableRow(){
	if(tablenode.getAttribute(common.ISEDITABLE)+''==true+'')
		return;
	//alert('doubleclickontableRow');
	var params = 'Form Id='+getFormIdForElementId(tablenode.id)+'&'+common.PARAM_TABLENAME+'='+tablenode.getAttribute('name')+'&'+common.PARAM_ROWNO+'='+(tablex-1)+'&'+common.PARAM_COLUMNNO+'='+tabley;
	params+='&'+common.PARAM_TABLEACTION+'='+common.PARAM_DOUBLE_CLICK_ON_ROW;
	sendAjaxRequest(common.SERV_TABLEACTION,params,callbackFunction);
}

function doubleClickedOnTreeTableRow(){
	if(tablenode.getAttribute(common.ISEDITABLE)+''==true+'')
		return;
	var rownode=tablenode.rows[tablex];
	var treeNodeProperties=rownode.getAttribute(common.XMLD_TREE_NODE_PROPERTIES);
	if(!TN_ISLEAF(treeNodeProperties))
		return;
	var params = 'Form Id='+getFormIdForElementId(tablenode.id)+'&'+common.PARAM_TABLENAME+'='+tablenode.getAttribute('name')+'&'+common.PARAM_ROWNO+'='+(tablex-1)+'&'+common.PARAM_COLUMNNO+'='+tabley;
	params+='&'+common.PARAM_TABLEACTION+'='+common.PARAM_DOUBLE_CLICK_ON_ROW+'&'+common.TREE_NODE_KEY+'='+tablenode.getAttribute(common.TREE_NODE_KEY)+'&'+common.HTMLT_TABLE_TYPE_LABEL+'='+tablenode.getAttribute(common.HTMLT_TABLE_TYPE_LABEL);
	sendAjaxRequest(common.SERV_TREETABLEACTION,params,callbackFunction);
}

var filterarray=new Array();
var filtertemparray=new Array();
var filterstate=new Array();
var filtertablelen=new Array();

function filtarraycreation(id){
	if(filterarray[id]==undefined || getfiltstate(id)=='no'){
		alert('filtarraycreation');
		filterarray[id]=new Array(tablenode.rows.length);
		var filtStartingIndex=getStartingIndexOnTableType(1);
		for(i=filtStartingIndex;i<tablenode.rows.length;i++)
	 		filterarray[id][i]=tablenode.rows[i];
		setfilttablelen(id,tablenode.rows.length);
	}
	return filterarray[id];
}

function filttemparraycreation(id){
	if(filtertemparray[id]==undefined  || getfiltstate(id)=='no'){
		alert('filttemparraycreation');
		filtertemparray[id]=new Array(tablenode.rows.length);
	}
	return filtertemparray[id];
}


function setfiltstate(id,yesorno){
	filterstate[id]=yesorno;
	if(yesorno=='no'){
		if(filterarray[id]!=undefined){
			delete filterarray[id];
			alert('deleted');
    	}
    	if(old[id]!=undefined)
    		delete old[id];
    }
	
}

function getfiltstate(id){
	if(filterstate[id]==undefined)
		filterstate[id]='no';
	return filterstate[id];
}

function setfilttablelen(id,len){
	filtertablelen[id]=len;
}

function getfilttablelen(id){
	return filtertablelen[id];
}

function filtercanceltagecreation(id){
	//var common=new CommonResource();
	var filtcanceltag='',filtcanceltagheight=0;
	if(getfiltstate(id)=='yes'){
		//filtcanceltag='<tr><td onmouseover=\"parent.backcc(this)\" onmouseout=\"parent.backcc1(this)\" onclick=\"parent.exitpopup(\''+common.CANCELFILTER+'\')\">'+common.CANCELFILTER+'</td></tr>';
		filtcanceltag=createtablerowforpopup(common.CANCELFILTER);
		filtcanceltagheight=20;
	}
	else{
		filtcanceltag='';
		filtcanceltagheight=0;
	}
	var result=new Array();
	result[0]=filtcanceltag;
	result[1]=filtcanceltagheight;
	return result;
}

function filtercancel(){
    filtarray=filtarraycreation(tablenode.id);
	filttablelen=getfilttablelen(tablenode.id);
    /*var templen=tablenode.rows.length;
	for(i=1;i<templen;i++)
	for(k=1;tablenode.childNodes[0].childNodes[k]!=undefined;k++)
	    tablenode.childNodes[0].removeChild(tablenode.childNodes[0].childNodes[k]);
	for(i=1;i<filttablelen;i++)
        tablenode.childNodes[0].appendChild(filtarray[i]);*/
    var filtStartingIndex=getStartingIndexOnTableType(1);
    removeandaddchildnode(filtStartingIndex,filttablelen,filtarray);
	setfiltstate(tablenode.id,'no');
	asdearray[0]='';
}

var asdearray=new Array();	
var asdevaluearray=new Array();

function createtextnode(text){
	return document.createTextNode(text);
}
	  
function commoncodeforasde(toperator,toperator1,toperator2){
	//var common=new CommonResource();
	ifTreeTableCollapseAll();
	if(asdearray[0]==undefined || asdearray[0]!=(toperator+''+tabley+' '+tablenode.id)){
    	//for(i=1;i<tablenode.rows.length;i++)
	   		//asdearray[i]=tablenode.rows[i];
	   		
	   	var asdeStartingIndex=getStartingIndexOnTableType(1);
	   		
	   	if(asdearray[0]!=undefined && (asdearray[0].substr((asdearray[0].indexOf(' '))+1,asdearray[0].length))==tablenode.id && parseInt(asdearray[0].substr(1,(asdearray[0].indexOf(' '))))==tabley){
			//startTimer();
			alert('reverse');	
			var tableLength=tablenode.rows.length;
			for(var i=asdeStartingIndex;i<tablenode.rows.length;i++)
	   			asdearray[tableLength--]=tablenode.rows[i];
	   		removeandaddchildnode(1,asdearray.length,asdearray);
			/*for(var i=(tablenode.rows.length-1);i>(asdeStartingIndex-1);i--)
        		tablenode.childNodes[0].appendChild(asdearray[i]);*/
        	unSelectTableColumn();
		}
		else{
			window.status='sorting';
			if(TC_ISDATE(tablenode.rows[tablex].childNodes[tabley].getAttribute(common.XMLD_PROPERTIES))){
				for(i=asdeStartingIndex;i<tablenode.rows.length;i++){
					asdearray[i]=tablenode.rows[i];
	   				asdevaluearray[i]=datecreation(asdearray[i].childNodes[tabley].innerHTML);
				}
				window.status='sorting called for date';
				quickSort(tablenode.rows.length,'datecreation(',')',toperator1,toperator2);
  				//insertionSort('datecreation(',')',toperator);
  			}
    		else if(TC_ISNUMBER(tablenode.rows[tablex].childNodes[tabley].getAttribute(common.XMLD_PROPERTIES))){
    			for(i=asdeStartingIndex;i<tablenode.rows.length;i++){
    				asdearray[i]=tablenode.rows[i];
	   				asdevaluearray[i]=numbercreation(asdearray[i].childNodes[tabley].innerHTML);
				}
				window.status='sorting called for number';
				//var templen=findnumberlength(tablenode.rows[tablex].childNodes[tabley].innerText);
    			//if(templen==-1)
    				quickSort(tablenode.rows.length,'numbercreation(',')',toperator1,toperator2);
    			//else
    				//quickSort(tablenode.rows.length,'parseFloat((',').substring(0,'+templen+'))',toperator1,toperator2);
  				//insertionSort('numbercreation(',')',toperator);
    		}
    		else{
    			for(i=asdeStartingIndex;i<tablenode.rows.length;i++){
    				asdearray[i]=tablenode.rows[i];
    				asdevaluearray[i]=((asdearray[i].childNodes[tabley].innerHTML).toUpperCase());
	   			}
	   			window.status='sorting called for string';
	   			//tempsort();
	   			quickSort(tablenode.rows.length,'','',toperator1,toperator2);
  				//insertionSort('','',toperator);
  			}
  			//window.status='sorting finished';
    		removeandaddchildnode(asdeStartingIndex,tablenode.rows.length,asdearray);
    		//for(i=1;i<tablenode.rows.length;i++)
     	 	//  tablenode.childNodes[0].appendChild(asdearray[i]);
    	}
		asdearray[0]=toperator+''+tabley+' '+tablenode.id;
    }
    else
    	alert('already done');
}

function quickSort(array_size,param1,param2,toperator1,toperator2){
	q_sort1(getStartingIndexOnTableType(1), array_size - 1,param1,param2,toperator1,toperator2);
}


function q_sort1(left,right,param1,param2,toperator1,toperator2){
  var pivot, l_hold, r_hold;

  l_hold = left;
  r_hold = right;
  pivot = asdevaluearray[left];
  pivot1 = asdearray[left];
  while (left < right)
  {	
    while (eval('asdevaluearray[right]'+toperator1+'pivot') && (left < right))
      right--;
    if (left != right)
    { 
      asdearray[left] = asdearray[right];
      asdevaluearray[left] = asdevaluearray[right];
      left++;
    }
    while (eval('asdevaluearray[left]'+toperator2+'pivot') && (left < right))
      left++;
    if (left != right)
    {  
      asdearray[right] = asdearray[left];
      asdevaluearray[right] = asdevaluearray[left];
      right--;
    }
  }
  asdevaluearray[left] = pivot;
  asdearray[left]=pivot1;
  pivot = left;
  left = l_hold;
  right = r_hold;
  if (left < pivot)
    q_sort1(left, pivot-1,param1,param2,toperator1,toperator2);
  if (right > pivot)
    q_sort1(pivot+1, right,param1,param2,toperator1,toperator2);
}


function q_sort(left,right,param1,param2,toperator1,toperator2){
  var pivot, l_hold, r_hold;

  l_hold = left;
  r_hold = right;
  pivot = asdearray[left];
  while (left < right)
  {	
    while (eval(param1+'asdearray[right].childNodes[tabley].innerHTML'+param2+toperator1+param1+'pivot.childNodes[tabley].innerHTML'+param2) && (left < right))   //innerText has been changed as innerHTML
      right--;
    if (left != right)
    { 
      asdearray[left] = asdearray[right];
      left++;
    }
    while (eval(param1+'asdearray[left].childNodes[tabley].innerHTML'+param2+toperator2+param1+'pivot.childNodes[tabley].innerHTML'+param2) && (left < right))	  //innerText has been changed as innerHTML
      left++;
    if (left != right)
    {  
      asdearray[right] = asdearray[left];
      right--;
    }
  }
  asdearray[left] = pivot;
  pivot = left;
  left = l_hold;
  right = r_hold;
  if (left < pivot)
    q_sort(left, pivot-1,param1,param2,toperator1,toperator2);
  if (right > pivot)
    q_sort(pivot+1, right,param1,param2,toperator1,toperator2);
}

function insertionSort(param1,param2,toperator){
    var index;
    var array_size=tablenode.rows.length;
    
	for (i=2; i < array_size; i++)
  	{
    	index = asdearray[i];
    	j = i;
    	while ((j > 1) && eval(param1+'asdearray[j-1].childNodes[tabley].innerText'+param2+toperator+param1+'index.childNodes[tabley].innerText'+param2))
  		{
      		asdearray[j] = asdearray[j-1];
      		j = j - 1;
    	}
    	asdearray[j] = index;
  	}
}

function tempsort(){
	var temp,temp1;
	for(i=2;i<tablenode.rows.length;i++){
		window.status='  '+i;
		j=i;
		temp=asdearray[i];
		temp1=asdevaluearray[i];
		while(j>1 && asdevaluearray[j]>asdevaluearray[j-1]){
				asdearray[j]=asdearray[j-1];
				asdevaluearray[j]=asdevaluearray[j-1]
		j--;
		}
		asdearray[j]=temp;
		asdevaluearray[j]=temp1;
	}
}

function commoncodeforfilter1(prefs,toperator,newy,filtarray,filtarray1,filttablelen,noe){
	//var common=new CommonResource();
	noe=0;
	var templen=prefs[2].length;
	if((filtarray[1].childNodes[newy].childNodes[0].nodeName)=='INPUT')
		return commoncodeforfiltercheckbox(prefs,toperator,newy,templen,filtarray,filtarray1,filttablelen,noe);
	else{
		if(TC_ISDATE(filtarray[1].childNodes[newy].getAttribute(common.XMLD_PROPERTIES)) && parseInt(prefs[1])<5)
			return commoncodeforfilterdate(prefs,toperator,newy,templen,filtarray,filtarray1,filttablelen,noe)
   		else if(TC_ISNUMBER(filtarray[1].childNodes[newy].getAttribute(common.XMLD_PROPERTIES)))
    		return commoncodeforfilternumber(prefs,toperator,newy,templen,filtarray,filtarray1,filttablelen,noe);  	
    	else
    		return commoncodeforfilterstring(prefs,toperator,newy,templen,filtarray,filtarray1,filttablelen,noe); 
    }
}

function commoncodeforfilterdate(prefs,toperator,newy,templen,filtarray,filtarray1,filttablelen,noe){
	var tdata1=datecreation(prefs[2]);
	for(i=1;i<filttablelen;i++)
	    if(eval('datecreation((filtarray[i].childNodes[newy].innerText).substring(0,templen))'+toperator+'tdata1'))
        	filtarray1[noe++]=filtarray[i];
    var resultarray=new Array();
    resultarray[0]=filtarray1;
    resultarray[1]=noe;
    return resultarray;
}

function commoncodeforfilternumber(prefs,toperator,newy,templen,filtarray,filtarray1,filttablelen,noe){
	alert('number');
	var tdata1=parseFloat(prefs[2]);
	//var temp=findnumberlength(filtarray[1].childNodes[newy].innerText);
    //if(temp==-1){
        for(i=1;i<filttablelen;i++)
	  	if(eval('parseFloat(filtarray[i].childNodes[newy].innerText)'+toperator+'tdata1'))
         	filtarray1[noe++]=filtarray[i];
    /*}
    else{
	for(i=1;i<filttablelen;i++)
	  	if(eval('parseFloat(((filtarray[i].childNodes[newy].innerText).substring(0,temp)))'+toperator+'tdata1'))
         	filtarray1[noe++]=filtarray[i];
    }*/
    var resultarray=new Array();
    resultarray[0]=filtarray1;
    resultarray[1]=noe;
    return resultarray;
}

function commoncodeforfilterstring(prefs,toperator,newy,templen,filtarray,filtarray1,filttablelen,noe){
    var tdata1=prefs[2].toLowerCase();
	for(i=1;i<filttablelen;i++){
       if(eval('((filtarray[i].childNodes[newy].innerText).substring(0,templen)).toLowerCase()'+toperator+'tdata1'))
	     	filtarray1[noe++]=filtarray[i];
    }
    var resultarray=new Array();
    resultarray[0]=filtarray1;
    resultarray[1]=noe;
    return resultarray;
}

function commoncodeforfiltercheckbox(prefs,toperator,newy,templen,filtarray,filtarray1,filttablelen,noe){
    var tdata1=prefs[2].toLowerCase();
	 //if(eval('filtarray[i].childNodes[newy].childNodes[0].checked'+toperator+'tdata1'))
	 if(tdata1=='true'){
	 	for(i=1;i<filttablelen;i++)
     	if(eval('filtarray[i].childNodes[newy].childNodes[0].checked'+toperator+true))
         	filtarray1[noe++]=filtarray[i];
     }
     else{
     	for(i=1;i<filttablelen;i++)
     	if(eval('filtarray[i].childNodes[newy].childNodes[0].checked'+toperator+false))
         	filtarray1[noe++]=filtarray[i];
     }
    var resultarray=new Array();
    resultarray[0]=filtarray1;
    resultarray[1]=noe;
    return resultarray;
}

var old=new Array();

function commoncodeforfilter(prefs,filtarray,filtarray1,filttablelen,noe){
	alert('new filter');
	noe=0;
    var tnewy=new Array();
    var topor=new Array();
    var tdata=new Array();
    var tand=new Array();
    var tparam=new Array();
    var tlen=new Array();
    var tuni=new Array();
    old[tablenode.id]=prefs;
    tuni[0]='';
    tuni[1]='';	
    tuni[2]='';
    tuni[3]='';
    tuni[4]='';
    tuni[5]='';
    tuni[6]='';
    tuni[7]='';
    
    for(d=0;d<15;d+=4){//for(d=0;d<prefs.length;d+=4){
    	tlen[tlen.length]=prefs[d+2].length;
    	if(prefs[d]>0){
    		tnewy[tnewy.length]=parseInt(prefs[d])-1;
    		if(prefs[d+1]>0)
    			topor[topor.length]=getoperatorstr(parseInt(prefs[d+1])-1);
    		else
    			topor[topor.length]='';
    	tdata[tdata.length]=prefs[d+2];
    	var t=getsideparam(filtarray,(parseInt(prefs[d])-1),(tdata.length-1),(tlen.length-1),(tnewy.length-1),parseInt(prefs[d+1]));
    	tparam[tparam.length]=t[0];
    	if(prefs[d+2]=='')
    		tparam[tparam.length]='';
    	else
    		tparam[tparam.length]=t[1];
    	//tparam[tparam.length]=t[2];
    	//tparam[tparam.length]=t[3];
    	}
    	else{
    		tnewy[tnewy.length]='';
    		topor[topor.length]='';
    		tdata[tdata.length]='';
    		tparam[tparam.length]='';
    		tparam[tparam.length]='';
    		//tparam[tparam.length]='';
    		//tparam[tparam.length]='';
    		tlen[tlen.length]=prefs[d+2].length;
    	}
    	if(prefs[d+3]>0)
    		tand[tand.length]=getandororstr(parseInt(prefs[d+3])-1);
    	else
    		tand[tand.length]='';
    	
    }
    
    var ar=prefs[16];
    if(ar!='None'){
    	for(f=0;f<tand.length;f++){
    		var t=f*2;
    		if(tand[f]==ar){
    			tuni[t]='(';
    			tuni[t+1]='';
	    		tuni[t+2]='';
	    		tuni[t+3]=')';
    		}
    		if(tand[f-1]!=undefined){
    			if(tand[f-1]==ar){
    				tuni[t]='';
    			}
    		}
    	}
    }
    
    var empty='';
    for(e=0;e<tuni.length;e++)
    	empty+='  \''+tuni[e]+'\'';
    alert(empty);
    
	var filtStartingIndex=getStartingIndexOnTableType(1);
    for(i=filtStartingIndex;i<filttablelen;i++){
       //if(eval(tparam[0]+'filtarray[i].childNodes[tnewy[0]]'+tparam[1]+topor[0]+tparam[2]+'tdata[0]'+tparam[3]+tand[0]+tparam[4]+'filtarray[i].childNodes[tnewy[1]]'+tparam[5]+topor[1]+tparam[6]+'tdata[1]'+tparam[7]))     
       //if(eval(tparam[0]+topor[0]+tparam[1]+tand[0]+tparam[2]+topor[1]+tparam[3]+tand[1]+tparam[4]+topor[2]+tparam[5]+tand[2]+tparam[6]+topor[3]+tparam[7]))     
       if(eval(tuni[0]+tparam[0]+topor[0]+tparam[1]+tuni[1]+tand[0]+tuni[2]+tparam[2]+topor[1]+tparam[3]+tuni[3]+tand[1]+tuni[4]+tparam[4]+topor[2]+tparam[5]+tuni[5]+tand[2]+tuni[6]+tparam[6]+topor[3]+tparam[7]+tuni[7]))     
         	filtarray1[noe++]=filtarray[i];
    }
    
	var resultarray=new Array();
    resultarray[0]=filtarray1;
    resultarray[1]=noe;
    return resultarray;
}

function getoperatorstr(value){
	switch(value){
	case 0:
		return '>';
	break;
	case 1:
		return '<';
	break;
	case 2:
		return '>=';
	break;
	case 3:
		return '<=';
	break;
	case 4:
		return '==';
	break;
	case 5:
		return '!=';
	break;
	}
}

function getandororstr(value){
	switch(value){
	case 0:
		return '&&';
	break;
	case 1:
		return '||';
	break;
	}
}

function getsideparam(filtarray,value,value1,value2,value3,value4){
		var result=new Array();
		var filtStartingIndex=getStartingIndexOnTableType(1);
		if((filtarray[filtStartingIndex].childNodes[value].childNodes[0].nodeName)=='INPUT'){
			result[0]='filtarray[i].childNodes[tnewy['+value3+']].childNodes[0].checked';
			result[1]='booleanCreation(tdata['+value1+'])';
		}
		else{
    		if(TC_ISDATE(filtarray[filtStartingIndex].childNodes[value].getAttribute(common.XMLD_PROPERTIES)) && value4<5){
				result[0]='datecreation((filtarray[i].childNodes[tnewy['+value3+']].childNodes[filtarray[i].childNodes[tnewy['+value3+']].childNodes.length-1].nodeValue).substring(0,tlen['+value2+']))';
				result[1]='datecreation(tdata['+value1+'])';
			}	
   			else if(TC_ISNUMBER(filtarray[filtStartingIndex].childNodes[value].getAttribute(common.XMLD_PROPERTIES))){
    			result[0]='parseFloat(filtarray[i].childNodes[tnewy['+value3+']].childNodes[filtarray[i].childNodes[tnewy['+value3+']].childNodes.length-1].nodeValue)';
				result[1]='parseFloat(tdata['+value1+'])';
    		}
    		else{
    			result[0]='((filtarray[i].childNodes[tnewy['+value3+']].childNodes[filtarray[i].childNodes[tnewy['+value3+']].childNodes.length-1].nodeValue).substring(0,tlen['+value2+'])).toLowerCase()';
				result[1]='tdata['+value1+'].toLowerCase()';
    		} 
    	}	
    	return result;
}

function booleanCreation(value){
	if(value.toLowerCase()=='true')
		return true;
	else
		return false;
}

function createtableopentag(){
	return ('<table>');
}

function createtableclosetag(){
	return ('<\/table>');
}

var maxLengthOfTablePopupValue=0;

function createtablerowforpopup(attr){
	if(maxLengthOfTablePopupValue<attr.length)
		maxLengthOfTablePopupValue=attr.length;
	attributes=(commonpopupmouseoverout()+attr+"')").split(",");
	var temptag='<tr style="font-family: Arial, Helvetica, sans-serif;font-style : normal;font-weight : bold;font-size : 13px"><td ';
	for(i=0;i<attributes.length;i+=2){
		temptag+=(attributes[i]+'=\"'+attributes[i+1]+'\" ');
	}
	return (temptag+'>'+attr+'<\/td><\/tr>')
}

function commonpopupmouseoverout(){
	//return ("onmouseover,parent.backcc(this),onmouseout,parent.backcc1(this),onclick,parent.exitpopup('");
	return ("onmouseover,backcc(this),onmouseout,backcc1(this),onclick,exitpopup('");
}

var current,oldvalue,charcode,tablenode,tablex,tabley;
var ctrlkey;

function checkkey(obj){
	//obj=tablenode.rows[tablex].childNodes[tabley].childNodes[0];
	var evt=lastdocumentClickEvent;
	charcode=(evt.charCode)?(evt.charCode):( (evt.which) ? (evt.which) : evt.keyCode);
	if(charcode==common.EDIT_TOENTER || charcode==common.EDIT_TOESC || charcode==common.EDIT_TOTMOVE || charcode==common.EDIT_TOBMOVE)
		obj.blur();
	if(charcode==17)
		ctrlkey=false;
}

function displaykey(){
	var evt=lastdocumentClickEvent;
	charcode=(evt.charCode)?(evt.charCode):( (evt.which) ? (evt.which) : evt.keyCode);
	if(charcode==17)
		ctrlkey=true;
}

//var first=new (java.lang.String("hai"));
//alert('First  '+first);

//importPackage("java.io");
//eval("print('Hello world')");

//var combovaltobeass=null;

function edit(obj){
	//var common=new CommonResource();
	try{
	if(window_event.button==2)
		return;
	}catch(err){}
	//alert(tablenode.rows[tablex].cells[tabley].getAttribute(common.XMLD_PROPERTIES));
	obj=clickedobject;
	if(!tablenode.disabled)
	if(tablenode.getAttribute(common.ISEDITABLE)+''==true+'')
	if(TC_ISEDITABLE(tablenode.rows[tablex].cells[tabley].getAttribute(common.XMLD_PROPERTIES)))
	if(obj.childNodes[0]==undefined || obj.childNodes[0].nodeName=='#text'){
		if(TC_ISDATE(tablenode.rows[tablex].cells[tabley].getAttribute(common.XMLD_PROPERTIES)))
			createCalendarCommon();//crateCalendar((new Date()).getMonth(),(new Date()).getYear());
		else if(TC_HASDROPDOWNTABLE(tablenode.rows[tablex].cells[tabley].getAttribute(common.XMLD_PROPERTIES))){
			//alert('HASDROPDOWNTABLE');//else if(TC_HASCUSTOMDROPDOWN(tablenode.rows[tablex].childNodes[tabley].getAttribute(common.XMLD_PROPERTIES))){
			if(dropdowndata[tablenode.id][tabley]==undefined)
				gettablecomboortable('table');
			else
				filltabledatawithtable(dropdowndata[tablenode.id][tabley]);
		}
		else if(TC_HASDROPDOWNLIST(tablenode.rows[tablex].cells[tabley].getAttribute(common.XMLD_PROPERTIES))){
			//alert('HASDROPDOWNLIST');
			if(dropdowndata[tablenode.id][tabley]==undefined)
				gettablecomboortable('combo');
			else
				filltabledatawithcombo(dropdowndata[tablenode.id][tabley]);
		}
		else if(TC_HASCUSTOMBUTTON(tablenode.rows[tablex].cells[tabley].getAttribute(common.XMLD_PROPERTIES))){
			if(obj.childNodes[0]==undefined)
				oldvalue='';
			else
				oldvalue=obj.childNodes[0].nodeValue;
			current=obj;
			var colunNo=tablenode.getAttribute(common.TABLE_ATTR_SELECTEDCOLUMN);
			var columnName=funcGetHTMLTableTitleForFilter(tablenode.rows[0].cells[colunNo].innerHTML);
			//var innerHtml='<input type=text style=\"width:'+(tablenode.rows[tablex].cells[tabley].offsetWidth-22)+'px;height:'+(common.TR_HEIGHT-4)+'px\" onblur="tableColumnCustomButtonBlured(this,\''+tablenode.id+'\',\''+tablenode.getAttribute(common.TABLE_ATTR_SELECTEDROW)+'\',\''+colunNo+'\')" onclick="tableColumnCustomButtonClicked(this,\''+tablenode.id+'\',\''+tablenode.getAttribute('name')+'\',\''+tablenode.getAttribute(common.TABLE_ATTR_SELECTEDROW)+'\',\''+colunNo+'\',\''+columnName+'\')" onkeyup=\"checkkey(this)\" onkeydown=\"displaykey()\">';
			innerHtml='<input type=button align=right value=" > " onblur="tableColumnCustomButtonBlured(this,\''+tablenode.id+'\',\''+tablenode.getAttribute(common.TABLE_ATTR_SELECTEDROW)+'\',\''+colunNo+'\')" onclick="tableColumnCustomButtonClicked(this,\''+tablenode.id+'\',\''+tablenode.getAttribute('name')+'\',\''+tablenode.getAttribute(common.TABLE_ATTR_SELECTEDROW)+'\',\''+colunNo+'\',\''+columnName+'\')">';
			//var innerHtml='<select style=\"width:'+(tablenode.rows[tablex].cells[tabley].offsetWidth-2)+'px;height:'+(common.TR_HEIGHT-4)+'px\" onblur="tableColumnCustomButtonBlured(this,\''+tablenode.id+'\',\''+tablenode.getAttribute(common.TABLE_ATTR_SELECTEDROW)+'\',\''+colunNo+'\')" onclick="tableColumnCustomButtonClicked(this,\''+tablenode.id+'\',\''+tablenode.getAttribute('name')+'\',\''+tablenode.getAttribute(common.TABLE_ATTR_SELECTEDROW)+'\',\''+colunNo+'\',\''+columnName+'\')">';
			//innerHtml+='<option/>';
			//innerHtml+='</select>';
			obj.innerHTML=innerHtml;
			object=tablenode.rows[tablex].cells[tabley].childNodes[0];
			object.focus();
		}
			//}
		else{
			if(obj.childNodes[0]==undefined)
				oldvalue='';
			else
				oldvalue=obj.childNodes[0].nodeValue//obj.innerText;
			//window.status='Old value : '+oldvalue;
			current=obj;
			//obj.innerHTML='<input type=text name=tname onkeyup=\"checkkey()\">';
			//combovaltobeass=document.getElementById('tname');
			
			obj.innerHTML='<input type=text style=\"width:'+(tablenode.rows[tablex].childNodes[tabley].offsetWidth-2)+'px;height:'+(common.TR_HEIGHT-4)+'px\" onblur=\"edited(this)\" onkeyup=\"checkkey(this)\" onkeydown=\"displaykey()\">';
			
			/*var newElem=document.createElement(common.HTMLEL_INPUT);
			newElem.type="text";
			newElem.style.width=(tablenode.rows[tablex].childNodes[tabley].offsetWidth-2)+"px";
			newElem.style.height=common.TR_HEIGHT-4+"px";
			newElem.setAttribute("width",(tablenode.rows[tablex].childNodes[tabley].offsetWidth-2));
			newElem.setAttribute("height",(common.TR_HEIGHT-4));
			newElem.onblur=edited;
			newElem.onkeyup=checkkey;
			newElem.onkeydown=displaykey;
			obj.replaceChild(newElem,obj.childNodes[0]);*/
			
			//object=document.getElementById('tname');
			object=tablenode.rows[tablex].cells[tabley].childNodes[0];
			object.focus();
			object.value=(oldvalue==common.HTMLD_INSTEAD_NULL)?'':oldvalue;
			object.select();
		}
	}
}


function combovalue(obj){
	combovaltobeass.value=obj.options[obj.selectedIndex].text;
	edited(combovaltobeass);
	combovaltobeass=null;
}

function edited(obj){
	//obj=current.childNodes[0];
	//obj = (window.event.target)?(window.event.target):(window.event.srcElement);
	var tcprop = current.getAttribute(common.XMLD_PROPERTIES);
	var tcprop1 = tcprop.substr(0,tcprop.length-1);
	var tcprop2 = tcprop1+'1';
	createandsetattribute(current,common.XMLD_PROPERTIES,(tcprop2));
	if(charcode==common.EDIT_TOESC)
		current.replaceChild(document.createTextNode(oldvalue),current.childNodes[0]);
	else{
		if(obj.value==''){
			if(TC_ISNUMBER(current.getAttribute(common.XMLD_PROPERTIES)))
				current.replaceChild(document.createTextNode('0'),current.childNodes[0]);
			else
				current.replaceChild(document.createTextNode(common.HTMLD_INSTEAD_NULL),current.childNodes[0]);
		}
		else{
		    if(TC_ISNUMBER(current.getAttribute(common.XMLD_PROPERTIES))){
		        var value;
		        try{
		        	value = obj.value;//eval(obj.value).toFixed(common.fractionDigits);
					current.replaceChild(document.createTextNode(value),current.childNodes[0]);
				}catch(ex){
					alert('Ensure entered value is number');
				}
			}else
				current.replaceChild(document.createTextNode(obj.value),current.childNodes[0]);
		}
	}
	editnearcell();
	//window.status='';
}

function editnearcell(){
	
	if(charcode==common.EDIT_TOTMOVE){
		if(tablex>1)
		tablex--;
		clickedobject=tablenode.rows[tablex].childNodes[tabley];
		edit();
	}
	else if(charcode==common.EDIT_TOBMOVE){
		if(tablex<(tablenode.rows.length-1))
		tablex++;
		clickedobject=tablenode.rows[tablex].childNodes[tabley];
		edit();
	}
	charcode=0;
}

function findtableindex(obj){
	tablenode=obj.parentNode.parentNode.parentNode;
	tablerow=obj.parentNode;
	var rownode=obj.parentNode;
	var i=0,j=0;
	for(i=0;tablenode.rows[i]!=undefined;i++)
	if(rownode==tablenode.rows[i]){
   		for(j=0;tablenode.rows[i].cells[j]!=undefined;j++)
      		if(obj==tablenode.rows[i].cells[j])//childNodes[j]
         		break;
   		break;
	}
	tablex=i;
	tabley=j;
	tablenode.setAttribute(common.TABLE_ATTR_SELECTEDROW,tablex);
	tablenode.setAttribute(common.TABLE_ATTR_SELECTEDCOLUMN,tabley);
	var tableType = tablenode.getAttribute(common.HTMLT_TABLE_TYPE_LABEL);
	if(tableType==common.HTMLT_TREE_TABLE_TYPE || tableType==common.HTMLT_TREE_FREEZABLE_TABLE_TYPE){
		tablenode.setAttribute(common.TREE_NODE_KEY,rownode.getAttribute(common.TREE_NODE_KEY));
	}
	window.status='X : '+i+'      Y : '+j;
	//alert(i+'  '+j);
	/*var table=new Array();
	table[0]=tablenode;
	table[1]=i;
	table[2]=j;
	return table;*/
}

function findtableindex1(obj){
	var tablenode1=obj.parentNode.parentNode.parentNode;
	var rownode1=obj.parentNode;
	var i=0,j=0;
	for(i=0;tablenode1.rows[i]!=undefined;i++)
	if(rownode1==tablenode1.rows[i]){
   		for(j=0;tablenode1.rows[i].cells[j]!=undefined;j++)
      		if(obj==tablenode1.rows[i].cells[j])
         		break;
   		break;
	}
	var table=new Array();
	table[0]=tablenode1;
	table[1]=i;
	table[2]=j;
	return table;
}

function getLastClickedTableRowNumber(){
	var currentPageNumber=tablenode.getAttribute(common.TABLE_ATTR_CURRENT_PAGE_NUMBER);
	currentPageNumber=parseInt(currentPageNumber);
	currentPageNumber--;
	currentPageNumber=currentPageNumber*common.TABLE_ROW_PER_PAGE;
	return (currentPageNumber+tablex);
}

function selectrow(){
	var oldcolor=tablenode.rows[tablex].bgColor;
	tablenode.rows[tablex].bgColor=common.HTMLT_ROW_SELECT_COLOR;
	return oldcolor;
}

function unselectrow(oldcolor){
	tablenode.rows[tablex].bgColor=oldcolor;
}

function backcc(obj){
	obj.bgColor=common.HTMLT_TRCOLOR;
	obj.style.cursor=common.CURSOR_DEFAULT;
}

function backcc1(obj){
	obj.bgColor=common.HTMLD_WHITE;
}

function isNumber(inputVal) {
	oneDecimal = false;
	inputStr = inputVal.toString();
	for (var i = 0; i < inputStr.length; i++) {
		var oneChar = inputStr.charAt(i);
		if (i == 0 && oneChar == '-') {
			continue;
		}
		if (oneChar == '.' && !oneDecimal) {
			oneDecimal = true;
			continue;
		}
		if (oneChar < '0' || oneChar > '9') {
			return false;
		}
	}
	return true;
}
var lastClickedTableColumn;
var lastClickedTableColumnColor;
function tableColumnClicked(){
    var obj=tablenode.rows[tablex].cells[tabley];
	if(lastClickedTableColumn!=undefined)
		lastClickedTableColumn.bgColor=lastClickedTableColumnColor;
	lastClickedTableColumn=obj;
	lastClickedTableColumnColor=obj.bgColor;
	obj.bgColor=common.HTMLT_COLUMN_SELECT_COLOR;
}

function unSelectTableColumn(){
	if(lastClickedTableColumn!=undefined)
		lastClickedTableColumn.bgColor=lastClickedTableColumnColor;
}

function checkBoxValueCheangedWithInTable(){
	sendrequesttoeditcell(tablenode.rows[tablex].cells[tabley].childNodes[0].checked);
}

function tableColumnCustomButtonClicked(obj,tableId,tableName,rowNo,colNo,columnName){
	current.replaceChild(document.createTextNode(oldvalue),current.childNodes[0]);
	var params = 'Form Id='+getFormIdForElementId(tableId)+'&'+common.PARAM_TABLENAME+'='+tableName+'&'+common.PARAM_ROWNO+'='+(rowNo-1)+'&'+common.PARAM_COLUMNNO+'='+colNo;
	params+='&'+common.PARAM_TABLEACTION+'='+common.PARAM_TABLE_COLUMN_CUSTOM_BUTTON_CLICKED+'&'+common.PARAM_COLUMN_NAME+'='+columnName;
	sendAjaxRequest(common.SERV_TABLEACTION,params,callbackFunction);
}

function tableColumnCustomButtonBlured(obj,tableId,rowNo,colNo){
	current.replaceChild(document.createTextNode(oldvalue),current.childNodes[0]);
}

function covertTableValuesToArray(){
	var tableValue = new Array();
	for(ro=0;ro<tablenode.rows.length;ro++){
		tableValue[ro] = new Array();
		for(co=0;co<tablenode.rows[ro].cells.length;co++){
			if(tablenode.rows[ro].cells[co].childNodes[tablenode.rows[ro].cells[co].childNodes.length-1].nodeName=='INPUT'){
				if(tablenode.rows[ro].cells[co].childNodes[tablenode.rows[ro].cells[co].childNodes.length-1].type=='checkbox')
					tableValue[ro][co]=tablenode.rows[ro].cells[co].childNodes[tablenode.rows[ro].cells[co].childNodes.length-1].checked;
			}
			else
				tableValue[ro][co] = tablenode.rows[ro].cells[co].childNodes[tablenode.rows[ro].cells[co].childNodes.length-1].nodeValue;//innerHTML;
		}
	}
	return tableValue;
}

function clickedOnPreviousLinkForTable(tableName){
	var table=document.getElementById(tableName);
	var currentPageNumber=table.getAttribute(common.TABLE_ATTR_CURRENT_PAGE_NUMBER);
	if(currentPageNumber==''+1){
		alert('firstPage');
		return;
	}
	var params = 'Form Id='+getFormIdForElementId(tableName)+'&'+common.PARAM_TABLENAME+'='+table.getAttribute('name');
	params+='&'+common.PARAM_TABLEACTION+'='+common.PARAM_GET_TABLE_PAGE+'&'+common.TABLE_NEXT_OR_PREVIOUS_PAGE+'='+common.TABLE_PREVIOUS_PAGE;
	params+='&'+common.TABLE_ATTR_CURRENT_PAGE_NUMBER+'='+currentPageNumber+'&'+common.TABLE_ROW_PER_PAGE_LABEL+'='+common.TABLE_ROW_PER_PAGE;
	sendAjaxRequest(common.SERV_TABLEACTION,params,CBFclickedOnPreviousLinkForTable);
}

function clickedOnNextLinkForTable(tableName){
	var table=document.getElementById(tableName);
	var currentPageNumber=table.getAttribute(common.TABLE_ATTR_CURRENT_PAGE_NUMBER);
	var totalPages=table.getAttribute(common.TABLE_ATTR_TOTAL_PAGES);
	if(currentPageNumber==totalPages){
		alert('lastPage');
		return;
	}
	var params = 'Form Id='+getFormIdForElementId(tableName)+'&'+common.PARAM_TABLENAME+'='+table.getAttribute('name');
	params+='&'+common.PARAM_TABLEACTION+'='+common.PARAM_GET_TABLE_PAGE+'&'+common.TABLE_NEXT_OR_PREVIOUS_PAGE+'='+common.TABLE_NEXT_PAGE;
	params+='&'+common.TABLE_ATTR_CURRENT_PAGE_NUMBER+'='+currentPageNumber+'&'+common.TABLE_ROW_PER_PAGE_LABEL+'='+common.TABLE_ROW_PER_PAGE;
	sendAjaxRequest(common.SERV_TABLEACTION,params,CBFclickedOnNextLinkForTable);
}

function CBFclickedOnNextLinkForTable(){
	setundisabled();
    if (XMLHttpRequestObject.readyState == 4 &&  XMLHttpRequestObject.status == 200) {
    	var xmlDocument  = XMLHttpRequestObject.responseXML;
		responseXMLText=XMLHttpRequestObject.responseText;
		var formTag=xmlDocument.getElementsByTagName('Form');
		currentFormHashCode=formTag[0].getAttribute('Id');
    	var TableElement = formTag[0].getElementsByTagName(common.XMLD_TABLE);
		refillTable(TableElement[0]);
		var name = TableElement[0].getAttribute(common.XMLD_NAME);
		name=currentFormHashCode+'_'+name;
		var table=document.getElementById(name);
		var currentPageNumber=parseInt(table.getAttribute(common.TABLE_ATTR_CURRENT_PAGE_NUMBER));
		currentPageNumber++;
		table.setAttribute(common.TABLE_ATTR_CURRENT_PAGE_NUMBER,currentPageNumber);
		var bottomTable=document.getElementById(name+'_BottomTable');
		var bottomTableCell=bottomTable.rows[0].cells[0];
		var oldValue=bottomTableCell.innerHTML;
		var point=oldValue.indexOf('/');
		bottomTableCell.innerHTML=currentPageNumber+oldValue.substr(point,oldValue.length);
	}
    stopTimer();
    hidePopup();
}

function CBFclickedOnPreviousLinkForTable(){
	setundisabled();
    if (XMLHttpRequestObject.readyState == 4 &&  XMLHttpRequestObject.status == 200) {
    	var xmlDocument  = XMLHttpRequestObject.responseXML;
		responseXMLText=XMLHttpRequestObject.responseText;
		var formTag=xmlDocument.getElementsByTagName('Form');
		currentFormHashCode=formTag[0].getAttribute('Id');
    	var TableElement = formTag[0].getElementsByTagName(common.XMLD_TABLE);
		refillTable(TableElement[0]);
		var name = TableElement[0].getAttribute(common.XMLD_NAME);
		name=currentFormHashCode+'_'+name;
		var table=document.getElementById(name);
		var currentPageNumber=parseInt(table.getAttribute(common.TABLE_ATTR_CURRENT_PAGE_NUMBER));
		currentPageNumber--;
		table.setAttribute(common.TABLE_ATTR_CURRENT_PAGE_NUMBER,currentPageNumber);
		var bottomTable=document.getElementById(name+'_BottomTable');
		var bottomTableCell=bottomTable.rows[0].cells[0];
		var oldValue=bottomTableCell.innerHTML;
		var point=oldValue.indexOf('/');
		bottomTableCell.innerHTML=currentPageNumber+oldValue.substr(point,oldValue.length);
	}
    stopTimer();
    hidePopup();
}

function clickedOnExportToExcel(){
	if(tablenode+''==''+undefined){
		alert('select table');
		return;
	}
	var values = covertTableValuesToArray();
	//alert(values.toString());
	//window.open("exportToExcel.html","");
	try {
    	var fso, s;
    	fso = new ActiveXObject("Scripting.FileSystemObject");
    	s = fso.CreateFolder("C:\\Documents and Settings\\vinay\\Desktop\\test1.xls", true);
    	for(ro=0;ro<values.length;ro++){
    		for(c0=0;co<values[ro].length;co++){
    			s.writeline(values[ro][co]);
    			s.writeline("\t");
    		}
    		s.writeline("\n");
    	}	
    	//s.writeline("This is a test");
    	s.Close();
  	}
 	catch(err){
   		var strErr = 'Error:';
   		strErr += '\nNumber:' + err.number;
   		strErr += '\nDescription:' + err.description;
   		alert(strErr);
  }
}

function T_HASHORIZONTALLINES(obj,value){
	return check(value,0);
}

function T_HASVERTICALLINES(obj,value){
	return check(value,1);
}

function T_ISENABLED(obj,value){
	obj.disabled=!check(value,2);
}

function T_ISTABLEHEADERVISIBLE(obj,value){
	return check(value,3);
}

function T_ISLASTSORATBLE(obj,value){
	//return check(value,4);
	/*if(obj.getAttribute(common.ISLASTSORATBLE)==null){
		var newAttr=document.createAttribute(common.ISLASTSORATBLE);
    	newAttr.nodeValue=check(value,4);
    	obj.setAttributeNode(newAttr);
	}
	else
	  obj.setAttribute(common.ISLASTSORATBLE,check(value,4));*/
	createorsetattribute(obj,common.ISLASTSORATBLE,check(value,4));
}

function T_HASFIXEDROW(obj,value){

}

function T_ISFILTERTABLE(obj,value){
	//return check(value,6);
	/*if(obj.getAttribute(common.ISFILTERTABLE)==null){
		var newAttr=document.createAttribute(common.ISFILTERTABLE);
    	newAttr.nodeValue=check(value,6);
    	obj.setAttributeNode(newAttr);
	}
	else
	  obj.setAttribute(common.ISFILTERTABLE,check(value,6));*/
	createorsetattribute(obj,common.ISFILTERTABLE,check(value,6));
}

function T_ISVISBLE(obj,value){
	return check(value,7);
}

function T_ISEDITORREQD(obj,value){
	return check(value,8);
}

function T_HASDEFAULTROW(obj,value){
	return check(value,9);
}

function T_HASDISPLAYTABLE(obj,value){
	return check(value,10);
}

function T_ISEDITABLE(obj,value){
    //var common=new CommonResource();
	/*if(obj.getAttribute(common.ISEDITABLE)==null){
		var newAttr=document.createAttribute(common.ISEDITABLE);
    	newAttr.nodeValue=check(value,11);
    	obj.setAttributeNode(newAttr);
	}
	else
	  obj.setAttribute(common.ISEDITABLE,check(value,11));*/
	createorsetattribute(obj,common.ISEDITABLE,check(value,11));
}

function T_ISCHANGED(obj,value){
	return check(value,12);
}

function T_setproperties(name,property){
	var a=document.getElementById(name);
	if(a!=null){
		T_ISENABLED(a,property);
		T_ISEDITABLE(a,property);
		T_HASFIXEDROW(a,property);
		T_ISLASTSORATBLE(a,property);
		T_ISFILTERTABLE(a,property);
	}
}

function TC_HASBUTTON(value){
	return check(value,0);
}

function TC_HASCUSTOMBUTTON(value){
	return check(value,1);
}

function TC_HASCUSTOMDROPDOWN(value){
	return check(value,2);
}

function TC_HASCUSTOMPOPUP(value){
	return check(value,3);
}

function TC_HASDROPDOWNLIST(value){
	return check(value,4);
}

function TC_HASDROPDOWNTABLE(value){
	return check(value,5);
}

function TC_ISCHANGECOLOR(value){
	return check(value,6);
}

function TC_ISCHECKBOX(value){
	return check(value,7);
}

function TC_ISEDITABLE(value){
	return check(value,8);
}

function TC_ISINDICATOR(value){
	return check(value,9);
}

function TC_ISMULTILINE(value){
	return check(value,10);
}

function TC_ISPRECISION(value){
	return check(value,11);
}

function TC_ISPRINTABLE(value){
	return check(value,12);
}

function TC_ISREQUIRED(value){
	return check(value,13);
}

function TC_ISSIGNALLOWED(value){
	return check(value,14);
}

function TC_ISSTATIC(value){
	return check(value,15);
}

function TC_ISNUMBER(value){
	return check(value,16);
}

function TC_ISDATE(value){
	return check(value,17);
}

function TC_ISSTRING(value){
	return check(value,18);
}

function TC_CLIENTSIDECHANGED(value){
    return check(value,(value.length-1));
}

function T_DD_ISSTATICCOMBO(value){
	return check(value,16);
}

function T_COLUMN_ISEDITABLE(value){
	return check(value,0);
}

function T_COLUMN_HASBUTTON(value){
	return check(value,1);
}

function T_COLUMN_HASCUSTOMDROPDOWN(value){
	return check(value,2);
}

function T_COLUMN_HASDROPDOWNTABLE(value){
	return check(value,3);
}

function T_COLUMN_HASDROPDOWNLIST(value){
	return check(value,4);
}

function T_COLUMN_HASCUSTOMPOPUP(value){
	return check(value,5);
}

function T_COLUMN_ISCHECKBOX(value){
	return check(value,6);
}

function T_COLUMN_ISMULTILINE(value){
	return check(value,7);
}

function T_COLUMN_ISPRINTABLE(value){
	return check(value,8);
}

function T_COLUMN_ISINDICATOR(value){
	return check(value,9);
}

function T_COLUMN_ISREQUIRED(value){
	return check(value,10);
}

function T_COLUMN_HASCUSTOMBUTTON(value){
	return check(value,11);
}

function T_COLUMN_UPDATECOMBO(value){
	return check(value,12);
}

function T_COLUMN_ISCHANGECOLOR(value){
	return check(value,13);
}

function T_COLUMN_ISPRECISION(value){
	return check(value,14);
}

function T_COLUMN_ISSIGNALLOWED(value){
	return check(value,15);
}

function T_COLUMN_UPDATECOMBOTABLE(value){
	return check(value,16);
}

function T_COLUMN_MOUSEOVERALLOWED(value){
	return check(value,17);
}

function T_COLUMN_ISSTATIC(value){
	return check(value,18);
}

/*(function whilePageLoad_SetTableResizeable(){
	var TableList=document.forms[0].getElementsByTagName('table');
	var i;
	for(i=0;i<TableList.length;i++){
		alert(TableList[i].id);
	}
}*/

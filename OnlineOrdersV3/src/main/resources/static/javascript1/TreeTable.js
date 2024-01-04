
function refillTreeTable(tableElement) {

	//var common=new CommonResource();

	if(tableElement==null) return;
	var property = tableElement.getAttribute(common.XMLD_PROPERTIES);
	var treeProperty = tableElement.getAttribute(common.XMLD_TREE_PROPERTIES);
	//alert(treeProperty);
	var name = tableElement.getAttribute(common.XMLD_NAME);
	name=currentFormHashCode+'_'+name;
	var rootNode = tableElement.getElementsByTagName(common.XMLD_ROOT_NODE);
	var tableData = tableElement.getElementsByTagName(common.XMLD_TABLEDATA);
	if(debug)
		alert('table name ' +name +'  Total lines  ' + tableData[0].childNodes.length);
	
	//T_setproperties(name,property);
	TTREE_setproperties(name,treeProperty);
    	
    if(subTreeOfTreeTable[name]==undefined)
    	subTreeOfTreeTable[name]=new Array();
    else{
    	delete subTreeOfTreeTable[name];
    	subTreeOfTreeTable[name]=new Array();
    }
    
    if(whileOpenAndCloseTreeTable[name]==undefined)
    	whileOpenAndCloseTreeTable[name]=new Array();
    else{
    	delete whileOpenAndCloseTreeTable[name];
    	whileOpenAndCloseTreeTable[name]=new Array();
    }
    
	var subTreeTable = tableElement.getElementsByTagName(common.XMLD_SUB_TREE_TABLE);
	for(var nof=0;subTreeTable[nof]!=undefined;nof++)
		renderSubTreeTable(subTreeTable[nof],name);
	if(tableData[0] != undefined ){
		renderTreeTable(tableData[0],name,rootNode[0]);
		if(TTREE_ISEXPANDALL(treeProperty))
			treeExpandAll(name);
	}
	makeTableDragable(name,'loose');
}

function renderTreeTable(xmlDoc,name,rootNode)   {
	//var common=new CommonResource();
	
    var table = document.getElementById(name);
    if(table==undefined) return;
    createandsetattribute(table,common.HTMLT_TABLE_TYPE_LABEL,common.HTMLT_TREE_TABLE_TYPE);
    
    var columnTitles = xmlDoc.getElementsByTagName(common.XMLD_COLUMN_TITLES);
    var columnName = columnTitles[0].getElementsByTagName(common.XMLD_COLUMN_NAME);
    
    var rootNodeRows=rootNode.getElementsByTagName(common.XMLD_ROW);
    
    var elements = xmlDoc.getElementsByTagName(common.XMLD_ROW);
    if(elements[0]==null){
        for(dr=(table.rows.length-1);dr>0;dr--)
        	table.deleteRow(dr);
        var root_row = document.createElement(common.HTMLEL_TR);
        for(colName=0;colName<columnName.length;colName++){
      		var t_root = document.createElement(common.HTMLEL_TD);
      		//var emptyData = document.createTextNode(' ');
      		//t_root.appendChild(emptyData);
      		t_root.innerHTML='&nbsp;';
      		root_row.appendChild(t_root);
    	}
	  	root_row.style.background =common.HTMLT_TRCOLOR;
	  	if(rootNode.firstChild!=undefined && root_row.childNodes[0]!=undefined)
	  		root_row.childNodes[0].innerHTML=rootNode.firstChild.nodeValue;
	  	else if(root_row.childNodes[0]!=undefined)
	  		root_row.childNodes[0].innerHTML='&nbsp;';
        table.childNodes[0].appendChild(root_row);
        return;
    }
    //--setfiltstate(table.id,'no');//common.FILTER_NO,'no'
    //--asdearray[0]='';
    
    //--if(dropdowndata[table.id]==undefined)
    	//--dropdowndata[table.id]=new Array();
    
    initializeForTableWhenRefill(name);
    
	/*Clearing Old table values*/
	while(table.hasChildNodes())
    	table.removeChild(table.firstChild);
    	
	try {
		var tbody = document.createElement(common.HTMLEL_TBODY);
    	table.appendChild(tbody);
    	var h_row = document.createElement(common.HTMLEL_TR);
    	var root_row = document.createElement(common.HTMLEL_TR);
        // recreating Column headers
    	for (i=0;i<elements[0].childNodes.length;i++) {
      		if (elements[0].childNodes[i].nodeType != 1) 
        		continue;
      		var t_header = document.createElement(common.HTMLEL_TH);
      		var t_root = document.createElement(common.HTMLEL_TD);
      		addEventtoElement(t_header,"mousedown",tableheaderclick);
      		var headerData = document.createTextNode(columnName[i].firstChild.nodeValue);
      		t_header.appendChild(headerData);
      		if(tableColumnWidth[table.id][columnName[i].firstChild.nodeValue]!=undefined)
      			t_header.width=tableColumnWidth[table.id][columnName[i].firstChild.nodeValue];
      		else
      			t_header.width='100';
      		if(rootNodeRows[0]!=null){
    			if(rootNodeRows[0].childNodes[i].firstChild!=undefined){
    				t_root=generateColumnForTreeTable(table,rootNodeRows[0].childNodes[i],0,0);
    			}
    		}else
      			t_root.innerHTML='&nbsp;';
      		h_row.appendChild(t_header);
      		root_row.appendChild(t_root);
      		var customMenuItems=columnName[i].getAttribute("CustomMenuItems");
      		if(customMenuItems!=null){
      			//alert(columnName[i].firstChild.nodeValue+'    '+customMenuItems);
      			setColumnCustomPopupItemForTable(name,columnName[i].firstChild.nodeValue,customMenuItems);
      			setMarkAsCustomPoupItemThereInColumn(t_header);
      		}
    	}
	  	h_row.style.background =common.HTMLT_HCOLOR;
	  	root_row.style.background =common.HTMLT_TRCOLOR;
	  	root_row.childNodes[0].innerHTML=rootNode.firstChild.nodeValue;
    	tbody.appendChild(h_row);
    	tbody.appendChild(root_row);

     	// adding rows with XML Values	
		for (i=0;i<elements.length;i++) {
    		var treeNodeProperties = elements[i].getAttribute(common.XMLD_TREE_NODE_PROPERTIES);
    		var treeNodeKey=elements[i].getAttribute(common.TREE_NODE_KEY);
      		var t_row = document.createElement(common.HTMLEL_TR);
      		addEventtoElement(t_row,"dblclick",doubleClickedOnTreeTableRow);
      		for (j=0;j<elements[i].childNodes.length;j++) {
        		if (elements[i].childNodes[j].nodeType != 1) 
          			continue;
        		var td = document.createElement(common.HTMLEL_TD);
        		//td.attachEvent(common.HTMLEV_ONMOUSEDOWN,tableclick);
        		//td.attachEvent(common.HTMLEV_ONMOUSEUP,edit);//common.HTMLEV_ONDBLCLICK
        		
        		/*try{
        			td.addEventListener("mousedown",tableclick,false);
        			td.addEventListener("mouseup",edit,false);
        		}catch(e){        		
        			td.onmousedown=tableclick;
        			td.onmouseup=edit;
        		}*/
        		
        		addEventtoElement(td,"mousedown",tableclick);
        		addEventtoElement(td,"mouseup",edit);
        		
        		var tdData;
				if(elements[i].childNodes[j].firstChild == null){
		   			//tdData = document.createTextNode(common.HTMLD_INSTEAD_NULL);
					tdData = null;
				}
				else 
					tdData = document.createTextNode(elements[i].childNodes[j].firstChild.nodeValue);
        		if(TC_ISNUMBER(elements[i].childNodes[j].getAttribute(common.XMLD_PROPERTIES))){
        			td.align=common.HTMLV_RIGHT;
        			if(elements[i].childNodes[j].firstChild != null){
        			    try{
        			    	var value = eval(elements[i].childNodes[j].firstChild.nodeValue);
        			    	if(value.indexOf('.')!=-1)
        			    		tdData = document.createTextNode(value.toFixed(common.fractionDigits));
        			    	else
        			    		tdData = document.createTextNode(value);
        			    }catch(ex){}
        			}
        			if(tdData==null)
        				td.innerHTML='&nbsp;';
        			else
        				td.appendChild(tdData);
        		}
        		else if(TC_ISCHECKBOX(elements[i].childNodes[j].getAttribute(common.XMLD_PROPERTIES))){
        		 	var torf;
        		 	if(tdData!=null)
        		 		torf=tdData.nodeValue;
        		 	else
        		 		torf='';
        		   	tdData=createCheckbox();
        		   	tdData.disabled=true;
        		   	if(table.getAttribute(common.ISEDITABLE)+''==true+'')
        		   		if(TC_ISEDITABLE(elements[i].childNodes[j].getAttribute(common.XMLD_PROPERTIES)))
        		   			tdData.disabled=false;
        		   	//else
        		   		//tdData.disabled=true;
        		   	addEventtoElement(tdData,"click",checkBoxValueCheangedWithInTable);
        		   	td.appendChild(tdData);
        		   	td.align=common.HTMLV_CENTER;
        		   	if(torf=='true')
        		   		tdData.checked=true;
        		 }  
        		 else{
        		 	if(tdData==null)
        		 		td.innerHTML='&nbsp;';
        		 	else
        		 		td.appendChild(tdData);
        		 }
        		/*var newAttr=document.createAttribute(common.XMLD_PROPERTIES);
        		newAttr.nodeValue=elements[i].childNodes[j].getAttribute(common.XMLD_PROPERTIES);
        		td.setAttributeNode(newAttr);*/
        		var tcprop = elements[i].childNodes[j].getAttribute(common.XMLD_PROPERTIES);
        		createandsetattribute(td,common.XMLD_PROPERTIES,(tcprop+'0'));
        		createandsetattribute(td,common.TABLE_ROW,(i+1));
        		createandsetattribute(td,common.TABLE_COLUMN,j);
        		//td.appendChild(tdData);
        		t_row.appendChild(td);
				//t_row.style.background=common.HTMLT_TRCOLOR;
				t_row.bgColor=common.HTMLT_TRCOLOR;
				t_row.style.height=common.TR_HEIGHT;
      		}
      		createandsetattribute(t_row,common.XMLD_TREE_NODE_PROPERTIES,treeNodeProperties);
      		createandsetattribute(t_row,common.TREE_NODE_KEY,treeNodeKey);
      		var child = t_row.childNodes[0].childNodes[0];
      		var image = document.createElement('img');
      		if(TN_HASCHILDREN(treeNodeProperties)&&!TN_ISLEAF(treeNodeProperties)){
      			image.setAttribute('src','ftv2plastnode.gif');
      			addEventtoElement(image,"click",clickedOnNodeToOpen);
      		}else
      			image.setAttribute('src','ftv2blank.gif');
      		t_row.childNodes[0].replaceChild(image,t_row.childNodes[0].childNodes[0]);
      		t_row.childNodes[0].appendChild(child);
      		tbody.appendChild(t_row);
    	}
    	//table.insertRow(table.rows.length);
	} catch(error) {
	    alert(error + 'in RenderTreeTable'); 
	}
}

function generateColumnForTreeTable(table,columnElement,i,j){
	
	var td = document.createElement(common.HTMLEL_TD);

	if (columnElement.nodeType != 1) 
		return td;
		
	addEventtoElement(td,"mousedown",tableclick);
	addEventtoElement(td,"mouseup",edit);

	var tdData;
	if(columnElement.firstChild == null){
		tdData = null;
	}
	else 
		tdData = document.createTextNode(columnElement.firstChild.nodeValue);
	if(TC_ISNUMBER(columnElement.getAttribute(common.XMLD_PROPERTIES))){
		td.align=common.HTMLV_RIGHT;
		if(columnElement.firstChild != null){
			try{
				var value = eval(columnElement.firstChild.nodeValue);
				if(value.indexOf('.')!=-1)
					tdData = document.createTextNode(value.toFixed(common.fractionDigits));
				else
					tdData = document.createTextNode(value);
			}catch(ex){}
		}
		if(tdData==null)
			td.innerHTML='&nbsp;';
		else
			td.appendChild(tdData);
	}
	else if(TC_ISCHECKBOX(columnElement.getAttribute(common.XMLD_PROPERTIES))){
		var torf;
		if(tdData!=null)
			torf=tdData.nodeValue;
		else
			torf='';
		tdData=createCheckbox();
		tdData.disabled=true;
		if(table.getAttribute(common.ISEDITABLE)+''==true+'')
			if(TC_ISEDITABLE(columnElement.getAttribute(common.XMLD_PROPERTIES)))
				tdData.disabled=false;
		addEventtoElement(tdData,"click",checkBoxValueCheangedWithInTable);
		td.appendChild(tdData);
		td.align=common.HTMLV_CENTER;
		if(torf=='true')
			tdData.checked=true;
	}
	else{
		if(tdData==null)
			td.innerHTML='&nbsp;';
		else
			td.appendChild(tdData);
	}
	var tcprop = columnElement.getAttribute(common.XMLD_PROPERTIES);
	createandsetattribute(td,common.XMLD_PROPERTIES,(tcprop+'0'));
	createandsetattribute(td,common.TABLE_ROW,(i+1));
	createandsetattribute(td,common.TABLE_COLUMN,j);
	return td;
}

var whileOpenAndCloseTreeTable = new Array();

function clickedOnNodeToOpen(){
	var obj=(event.target)?(event.target):(event.srcElement);
	//alert(obj.src);
	setAndChangeToTreeNodeOpen(obj,tablex,tabley);
	/*removeEventtoElement(obj,"click",clickedOnNodeToOpen)
    addEventtoElement(obj,"click",clickedOnNodeToClose);
	obj.src='ftv2mlastnode.gif';
	var rowNo = tablerow.cells[tabley].getAttribute(common.TABLE_ROW);
	
	if(whileOpenAndCloseTreeTable[tablenode.id][rowNo]==undefined)
		whileOpenAndCloseTreeTable[tablenode.id][rowNo] = new Array();
	for(m=1;m<tablerow.cells.length;m++){
		whileOpenAndCloseTreeTable[tablenode.id][rowNo][m]=tablerow.cells[m].innerHTML;
		tablerow.cells[m].innerHTML='&nbsp;';
	}
	
	//rowNo++;
	//alert(rowNo);
	addRowsForSubTreeTable(rowNo,tablex);*/
}

function addRowsForSubTreeTable(rowNo,tablex){
	if(subTreeOfTreeTable[tablenode.id][rowNo]!=undefined){
		var subTreeRows = subTreeOfTreeTable[tablenode.id][rowNo];
		var nof;
		var childLength=0;
		for(nof=0;nof<subTreeRows.length;nof++){
		    if(tablenode.rows.length!=tablex+childLength+nof+1)
				tablenode.childNodes[0].insertBefore(subTreeRows[nof],tablenode.childNodes[0].childNodes[tablex+childLength+nof+1]);
			else
				tablenode.childNodes[0].appendChild(subTreeRows[nof]);
			var srcName=subTreeRows[nof].cells[0].childNodes[subTreeRows[nof].cells[0].childNodes.length-2].src;
			if(srcName.indexOf('ftv2mlastnode.gif')!=-1)
				childLength = childLength + addRowsForSubTreeTable(subTreeRows[nof].cells[0].getAttribute(common.TABLE_ROW),(tablex+childLength+nof+1));
		}
		return nof;
	}
	return 0;
}

function treeExpandAll(treeName){
	var tableObj = document.getElementById(treeName);
	if(tableObj.rows.length<2) return;
	var len;
	for(len=2;len<tableObj.rows.length;len++){
		tablenode = tableObj;
		tablerow = tableObj.childNodes[0].childNodes[len];
		var obj = tableObj.rows[len].cells[0].childNodes[tableObj.rows[len].cells[0].childNodes.length-2];
		if(obj.src.indexOf('ftv2plastnode.gif')==-1)
			continue;
		setAndChangeToTreeNodeOpen(obj,len,0);
	}
}

function setAndChangeToTreeNodeOpen(obj,tablex,tabley){
	removeEventtoElement(obj,"click",clickedOnNodeToOpen)
    addEventtoElement(obj,"click",clickedOnNodeToClose);
	obj.src='ftv2mlastnode.gif';
	var rowNo = tablerow.cells[tabley].getAttribute(common.TABLE_ROW);
	
	var treeNodeProperties = tablerow.getAttribute(common.XMLD_TREE_NODE_PROPERTIES);
	if(!TN_VALUEFOREXPAND(treeNodeProperties)){
		if(whileOpenAndCloseTreeTable[tablenode.id][rowNo]==undefined)
			whileOpenAndCloseTreeTable[tablenode.id][rowNo] = new Array();
		for(m=1;m<tablerow.cells.length;m++){
			whileOpenAndCloseTreeTable[tablenode.id][rowNo][m]=tablerow.cells[m].innerHTML;
			tablerow.cells[m].innerHTML='&nbsp;';
		}
	}
	addRowsForSubTreeTable(rowNo,tablex);
}

function clickedOnNodeToClose(){
	var obj=(event.target)?(event.target):(event.srcElement);
	//alert(obj.src);
	setAndChangeToTreeNodeClose(obj,tablex,tabley);
	/*removeEventtoElement(obj,"click",clickedOnNodeToClose)
    addEventtoElement(obj,"click",clickedOnNodeToOpen);
	obj.src='ftv2plastnode.gif';
	var rowNo = tablerow.cells[tabley].getAttribute(common.TABLE_ROW);
	
	for(m=1;m<whileOpenAndCloseTreeTable[tablenode.id][rowNo].length;m++)
		tablerow.cells[m].innerHTML=whileOpenAndCloseTreeTable[tablenode.id][rowNo][m];
	
	//rowNo++;
	//alert(rowNo);
	var rowNo1 = rowNo+'';
	var rowNoSplit = rowNo1.split(',');
	//for(m=tablex+1;m<tablenode.rows[m]!=undefined;m++){
	var m=tablex+1;
	while(tablenode.rows[m]!=undefined){
		var subRowNo=tablenode.rows[m].cells[0].getAttribute(common.TABLE_ROW);
		subRowNo=subRowNo+'';
		subRowNoSplit = subRowNo.split(',');
		var	sdkfjsdklfj= false;
		if(rowNoSplit.length<subRowNoSplit.length)
			sdkfjsdklfj = true;
		else
			break;
		tablenode.childNodes[0].removeChild(tablenode.rows[m]);
		//alert(rowNo+' < '+subRowNo+' = '+sdkfjsdklfj);
	}
	/*if(subTreeOfTreeTable[tablenode.id][rowNo]!=undefined){
		var rows = subTreeOfTreeTable[tablenode.id][rowNo];
		for(nof=0;nof<rows.length;nof++)
			tablenode.childNodes[0].removeChild(rows[nof]);
	}*/
}

function treeCollapseAll(treeName){
	var tableObj = document.getElementById(treeName);
	if(tableObj.rows.length<2) return;
	var len;
	for(len=2;len<tableObj.rows.length;len++){
		tablenode = tableObj;
		tablerow = tableObj.childNodes[0].childNodes[len];
		var obj = tableObj.rows[len].cells[0].childNodes[tableObj.rows[len].cells[0].childNodes.length-2];
		if(obj.src.indexOf('ftv2mlastnode.gif')==-1)
			continue;
		setAndChangeToTreeNodeClose(obj,len,0);
	}
}

function setAndChangeToTreeNodeClose(obj,tablex,tabley){
	removeEventtoElement(obj,"click",clickedOnNodeToClose)
    addEventtoElement(obj,"click",clickedOnNodeToOpen);
	obj.src='ftv2plastnode.gif';
	var rowNo = tablerow.cells[tabley].getAttribute(common.TABLE_ROW);
	
	var treeNodeProperties = tablerow.getAttribute(common.XMLD_TREE_NODE_PROPERTIES);
	if(!TN_VALUEFOREXPAND(treeNodeProperties)){
		for(m=1;m<whileOpenAndCloseTreeTable[tablenode.id][rowNo].length;m++)
			tablerow.cells[m].innerHTML=whileOpenAndCloseTreeTable[tablenode.id][rowNo][m];
	}
	var rowNo1 = rowNo+'';
	//var rowNoSplit = rowNo1.split(',');
	var m=tablex+1;
	while(tablenode.rows[m]!=undefined){
		var subRowNo=tablenode.rows[m].cells[0].getAttribute(common.TABLE_ROW);
		subRowNo=subRowNo+'';
		/*subRowNoSplit = subRowNo.split(',');
		var	sdkfjsdklfj= false;
		if(rowNoSplit.length<subRowNoSplit.length)
			sdkfjsdklfj = true;
		else
			break;*/
		if(subRowNo.indexOf(rowNo1)!=0)
			break;
		tablenode.childNodes[0].removeChild(tablenode.rows[m]);
	}
}

function treeCollapseAllWithSubNode(treeName){
	var tableObj = document.getElementById(treeName);
	if(tableObj.rows.length<2) return;
	var len;
	for(len=tableObj.rows.length-1;len>1;len--){
		tablenode = tableObj;
		tablerow = tableObj.childNodes[0].childNodes[len];
		var obj = tableObj.rows[len].cells[0].childNodes[tableObj.rows[len].cells[0].childNodes.length-2];
		if(obj.src.indexOf('ftv2mlastnode.gif')==-1)
			continue;
		setAndChangeToTreeNodeClose(obj,len,0);
	}
}

var subTreeOfTreeTable = new Array();
function renderSubTreeTable(xmlDoc,name)   {
    
    var position = xmlDoc.getAttribute('Position');
    //alert(position);
    
    var table = document.getElementById(name);
    if(table==undefined) return;
    ///alert(table.id);
    
    var subTreeRows = new Array();
    
    var tableData = xmlDoc.getElementsByTagName(common.XMLD_TABLEDATA);
    
    var elements = tableData[0].getElementsByTagName(common.XMLD_ROW);
    if(elements[0]==null)
    	return;
    
	try {
     	// adding rows with XML Values	
		for (i=0;i<elements.length;i++) {
    		var treeNodeProperties = elements[i].getAttribute(common.XMLD_TREE_NODE_PROPERTIES);
    		var treeNodeKey=elements[i].getAttribute(common.TREE_NODE_KEY);
      		var t_row = document.createElement(common.HTMLEL_TR);
      		addEventtoElement(t_row,"dblclick",doubleClickedOnTreeTableRow);
      		var rowId;
      		for (j=0;j<elements[i].childNodes.length;j++) {
        		if (elements[i].childNodes[j].nodeType != 1) 
          			continue;
        		var td = document.createElement(common.HTMLEL_TD);
        		
        		addEventtoElement(td,"mousedown",tableclick);
        		addEventtoElement(td,"mouseup",edit);
        		
        		var tdData;
				if(elements[i].childNodes[j].firstChild == null){
		   			//tdData = document.createTextNode(common.HTMLD_INSTEAD_NULL);
					tdData = null;
				}
				else 
					tdData = document.createTextNode(elements[i].childNodes[j].firstChild.nodeValue);
        		if(TC_ISNUMBER(elements[i].childNodes[j].getAttribute(common.XMLD_PROPERTIES))){
        			td.align=common.HTMLV_RIGHT;
        			if(elements[i].childNodes[j].firstChild != null){
        			    try{
        			    	var value = eval(elements[i].childNodes[j].firstChild.nodeValue);
        			    	if(value.indexOf('.')!=-1)
        			    		tdData = document.createTextNode(value.toFixed(common.fractionDigits));
        			    	else
        			    		tdData = document.createTextNode(value);
        			    }catch(ex){}
        			}
        			if(tdData==null)
        				td.innerHTML='&nbsp;';
        			else
        				td.appendChild(tdData);
        		}
        		else if(TC_ISCHECKBOX(elements[i].childNodes[j].getAttribute(common.XMLD_PROPERTIES))){
        		 	var torf;
        		 	if(tdData!=null)
        		 		torf=tdData.nodeValue;
        		 	else
        		 		torf='';
        		   	tdData=createCheckbox();
        		   	tdData.disabled=true;
        		   	if(table.getAttribute(common.ISEDITABLE)+''==true+'')
        		   		if(TC_ISEDITABLE(elements[i].childNodes[j].getAttribute(common.XMLD_PROPERTIES)))
        		   			tdData.disabled=false;
        		   	//else
        		   		//tdData.disabled=true;
        		   	addEventtoElement(tdData,"click",checkBoxValueCheangedWithInTable);
        		   	td.appendChild(tdData);
        		   	td.align=common.HTMLV_CENTER;
        		   	if(torf=='true')
        		   		tdData.checked=true;
        		 }  
        		 else{
        		 	if(tdData==null)
        		 		td.innerHTML='&nbsp;';
        		 	else
        		 		td.appendChild(tdData);
        		 }
        		var tcprop = elements[i].childNodes[j].getAttribute(common.XMLD_PROPERTIES);
        		createandsetattribute(td,common.XMLD_PROPERTIES,(tcprop+'0'));
        		rowId=(position+','+(subTreeRows.length+1));
        		createandsetattribute(td,common.TABLE_ROW,rowId);//''+position+(rows.length+1))
        		createandsetattribute(td,common.TABLE_COLUMN,j);
        		t_row.appendChild(td);
				t_row.bgColor=common.HTMLT_TRCOLOR;
				t_row.style.height=common.TR_HEIGHT;
      		}
      		createandsetattribute(t_row,common.XMLD_TREE_NODE_PROPERTIES,treeNodeProperties);
      		createandsetattribute(t_row,common.TREE_NODE_KEY,treeNodeKey);
      		var noOfSep = rowId.split(','); 
      		//alert(noOfSep.length);
      		//while(t_row.childNodes[0].hasChildNodes())
    		//	t_row.childNodes[0].removeChild(t_row.childNodes[0].firstChild);
      		for(m=0;m<noOfSep.length-1;m++){
      			var imageb = document.createElement('img');
      			imageb.setAttribute('src','ftv2blank.gif');
      			t_row.childNodes[0].appendChild(imageb);
      		}
      		var child = t_row.childNodes[0].childNodes[0];
      		var image = document.createElement('img');
      		if(TN_HASCHILDREN(treeNodeProperties)&&!TN_ISLEAF(treeNodeProperties)){
      			image.setAttribute('src','ftv2plastnode.gif');
      			addEventtoElement(image,"click",clickedOnNodeToOpen);
      		}else
      			image.setAttribute('src','ftv2blank.gif');
      		//t_row.childNodes[0].replaceChild(image,t_row.childNodes[0].childNodes[0]);
      		t_row.childNodes[0].appendChild(image);
      		t_row.childNodes[0].appendChild(child);
      		
      		subTreeRows[subTreeRows.length]=t_row;
      		
      		//tbody.appendChild(t_row);
    	}
	} catch(error) {
	    alert(error + 'in RenderSubTreeTable'); 
	}
	//alert(position);
	subTreeOfTreeTable[table.id][position]=subTreeRows;
	//alert(rows.length);
}

function TN_ISLEAF(value){
    return check(value,0);
}

function TN_GETALLOWSCHILDREN(value){
    return check(value,1);
}

function TN_ASKALLOWSCHILDREN(value){
    return check(value,2);
}

function TN_HASCHILDREN(value){
    return check(value,3);
}

function TN_HASMENU(value){
    return check(value,4);
}

function TN_HASIMAGE(value){
    return check(value,5);
}

function TN_VALUEFOREXPAND(value){
    return check(value,6);
}

function TN_INITIALIZEINNEWMETHOD(value){
    return check(value,7);
}

function TTREE_ISENABLED(value){
    return check(value,0);
}

function TTREE_ISCUSTOMIZED(value){
    return check(value,1);
}

function TTREE_NEEDSDYNAMICNODES(value){
    return check(value,2);
}

function TTREE_HASGRID(value){
    return check(value,3);
}

function TTREE_ISEXPANDALL(value){
    return check(value,4);
}

function TTREE_ISEDITABLE(value){
    return check(value,5);
}

function TTREE_INITIALIZEINNEWMETHOD(value){
    return check(value,6);
}

function TTREE_ISCHANGED_FOR_WEB(value){
    return check(value,7);
}

function TTREE_setproperties(name,property){
	var a=document.getElementById(name);
	if(a!=null){
		createorsetattribute(a,common.ISEDITABLE,TTREE_ISEDITABLE(property));
	}
}


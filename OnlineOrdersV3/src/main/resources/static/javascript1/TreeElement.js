
ICONPATH = ''

// Decide if the names are links or just the icons
USETEXTLINKS = 1  //replace 0 with 1 for hyperlinks

// Decide if the tree is to start all open or just showing the root folders
STARTALLOPEN = 0 //replace 0 with 1 to show the whole tree

HIGHLIGHT = 1

var treeElementDivTagObject=null;
function refillTreeElement(treeElement) {

	//var common=new CommonResource();

	if(treeElement==null) return;
	var treeProperty = treeElement.getAttribute(common.XMLD_TREE_PROPERTIES);
	//alert(treeProperty);
	var name = treeElement.getAttribute(common.XMLD_NAME);
	name=currentFormHashCode+'_'+name;
	var rootNode = treeElement.getElementsByTagName(common.XMLD_ROOT_NODE);
	//var childNode = treeElement.getElementsByTagName(common.XMLD_CHILD_NODE);
	treeElementDivTagId=name;
	lastClickedTreeElement = null;
	var divObject=document.getElementById(name);
	treeElementDivTagObject=divObject;
	if(divObject!=null){
		for(var i=divObject.childNodes.length-1;i>=0;i--)
			divObject.removeChild(divObject.childNodes[i]);
	}else
		return;
	var rootNodeName=rootNode[0].firstChild.nodeValue;
	foldersTree = gFld(rootNodeName, ""); 
	refillTreeElementChildNode(treeElement,foldersTree,'0','');
	initializeDocument();
}

function refillTreeElementChildNode(nodeObject,rootTreeNode,id,idKey){
	//var columnKey=0;
    var nextNode = nodeObject.getElementsByTagName(common.XMLD_CHILD_NODE+id);
	if(nextNode!=null && nextNode!=undefined){
		var nofchildnode;
		for(nofchildnode=0;nofchildnode<nextNode.length;nofchildnode++){
			//alert((idKey+'_'+columnKey)+'   '+nextNode[nofchildnode].firstChild.nodeValue);
			var treeNodeProperty=nextNode[nofchildnode].getAttribute(common.XMLD_TREE_NODE_PROPERTIES);
			var treeNodeKey=nextNode[nofchildnode].getAttribute(common.TREE_NODE_KEY);
			if(!TN_ISLEAF(treeNodeProperty)){
				//alert(nextNode[nofchildnode].firstChild.nodeValue);
				var folderName=nextNode[nofchildnode].firstChild.nodeValue;
				var tempRootTreeNode = insFld(rootTreeNode, gFld(folderName, "","",treeNodeKey,treeElementDivTagObject.getAttribute('name'),treeElementDivTagObject.id,treeNodeProperty));
				//alert(column_idKey+'   '+(idKey+'_'+columnKey));
				refillTreeElementChildNode(nextNode[nofchildnode],tempRootTreeNode,(id+'_'+nofchildnode),treeNodeKey);
			}else{
				//alert(nextNode[nofchildnode].firstChild.nodeValue);
				//alert(column_idKey+'   '+(idKey+'_'+columnKey));
				var leafName=nextNode[nofchildnode].firstChild.nodeValue;
				insDoc(rootTreeNode, gLnk("R", leafName, "",treeNodeKey,treeElementDivTagObject.getAttribute('name'),treeElementDivTagObject.id,treeNodeProperty));
			}
		//columnKey++;
		}
	}
}

function treeNodeSelected(obj,treeName,key){
    var params =common.REQ_FORMID+"="+document.forms[0].id+"&"+common.REQ_NAME+"="+treeName+"&"+common.PARAM_TREE_NODE_KEY+"="+key+"&"+common.PARAM_TREE_NODE_ACTION+"="+common.PARAM_TREE_NODE_SELECTED;
	sendAjaxRequest(common.SERV_TREENODEACTION,params,callbackFunction);
}

var lastClickedTreeNodeFormId='';
var lastClickedTreeNodeTreeName='';
var lastClickedTreeNodeKey='';
var lastClickedTreeNodeClientX=0;
var lastClickedTreeNodeClientY=0;

function treeFolderClicked_MouseUp(obj,treeName,description,key,eleId,treeNodeProp){
	var formId=getFormIdForElementId(eleId);
	var event=window.event;
	if(TN_HASMENU(treeNodeProp) && event.button==2){
		lastClickedTreeNodeFormId=formId;
		lastClickedTreeNodeTreeName=treeName;
		lastClickedTreeNodeKey=key;
		lastClickedTreeNodeClientX=event.clientX;
		lastClickedTreeNodeClientY=event.clientY;
    	var params =common.REQ_FORMID+"="+formId+"&"+common.REQ_NAME+"="+treeName+"&"+common.TREE_NODE_KEY+"="+key+"&"+common.PARAM_TREE_NODE_ACTION+"="+common.PARAM_TREE_NODE_SELECTED;
		sendAjaxRequest(common.SERV_TREENODEACTION,params,callbackFunction_DoActionForTreeNodeRightClick);
	}else{
    	var params =common.REQ_FORMID+"="+formId+"&"+common.REQ_NAME+"="+treeName+"&"+common.TREE_NODE_KEY+"="+key+"&"+common.PARAM_TREE_NODE_ACTION+"="+common.PARAM_TREE_NODE_SELECTED;
		sendAjaxRequest(common.SERV_TREENODEACTION,params,callbackFunction);
	}
}

function treeItemClicked_MouseUp(obj,treeName,description,key,eleId,treeNodeProp){
	var formId=getFormIdForElementId(eleId);
	var event=window.event;
	if(TN_HASMENU(treeNodeProp) && event.button==2){
		lastClickedTreeNodeFormId=formId;
		lastClickedTreeNodeTreeName=treeName;
		lastClickedTreeNodeKey=key;
		lastClickedTreeNodeClientX=event.clientX;
		lastClickedTreeNodeClientY=event.clientY;
    	var params =common.REQ_FORMID+"="+formId+"&"+common.REQ_NAME+"="+treeName+"&"+common.TREE_NODE_KEY+"="+key+"&"+common.PARAM_TREE_NODE_ACTION+"="+common.PARAM_TREE_NODE_SELECTED;
		sendAjaxRequest(common.SERV_TREENODEACTION,params,callbackFunction_DoActionForTreeNodeRightClick);
	}else{
    	var params =common.REQ_FORMID+"="+formId+"&"+common.REQ_NAME+"="+treeName+"&"+common.TREE_NODE_KEY+"="+key+"&"+common.PARAM_TREE_NODE_ACTION+"="+common.PARAM_TREE_NODE_SELECTED;
		sendAjaxRequest(common.SERV_TREENODEACTION,params,callbackFunction);
	}
}

function callbackFunction_DoActionForTreeNodeRightClick(){
	setundisabled();
     if (XMLHttpRequestObject.readyState == 4 &&  XMLHttpRequestObject.status == 200) {
           var xmlDocument  = XMLHttpRequestObject.responseXML;
		   processXMLData(xmlDocument);
		   var params =common.REQ_FORMID+"="+lastClickedTreeNodeFormId+"&"+common.REQ_NAME+"="+lastClickedTreeNodeTreeName+"&"+common.TREE_NODE_KEY+"="+lastClickedTreeNodeKey+"&"+common.PARAM_TREE_NODE_ACTION+"="+common.PARAM_GET_CUSTOM_POPUP_VLAUE;
		   sendAjaxRequest(common.SERV_TREENODEACTION,params,callbackFunction_ReturnCustomPopupTreeNodeValue);
      }
}

function callbackFunction_ReturnCustomPopupTreeNodeValue(){
	setundisabled();
    hidePopup();
     if (XMLHttpRequestObject.readyState == 4 &&  XMLHttpRequestObject.status == 200) {
           var xmlDocument  = XMLHttpRequestObject.responseXML;
           var type=xmlDocument.getElementsByTagName('Type');
           var inHtml='<table>';
           var childLength=type[0].childNodes.length;
           var valueMaxLength=0;
           for(var i=0;i<childLength;i++){
           	  var popupValue=type[0].childNodes[i].childNodes[0].nodeValue;
	  		  inHtml+='<tr style="font-family: Arial, Helvetica, sans-serif;font-style : normal;font-weight : bold;font-size : 12px">';
	  		  inHtml+='<td onclick="buttonPressed_TreeNodeCustomMenuClicked(\''+popupValue+'\')" onmouseover="backcc(this)" onmouseout="backcc1(this)">'+popupValue+'</td>';
	  		  inHtml+='</tr>';
	  		  if(valueMaxLength<popupValue.length)
	  		  	valueMaxLength=popupValue.length;
           }
	  	   inHtml+='</table>';
	  	   showDivPopup(inHtml,lastClickedTreeNodeClientX,lastClickedTreeNodeClientY,valueMaxLength*9,childLength*15);
      }
    stopTimer();
}

function buttonPressed_TreeNodeCustomMenuClicked(poupValue){
	hidePopup();
	treeNodeCustomMenuClicked_Additional(poupValue);
	var params =common.REQ_FORMID+"="+lastClickedTreeNodeFormId+"&"+common.REQ_NAME+"="+lastClickedTreeNodeTreeName+"&"+common.TREE_NODE_KEY+"="+lastClickedTreeNodeKey+"&"+common.PARAM_TREE_NODE_ACTION+"="+common.PARAM_CUSTOM_POPUP_INVOKED;
	params+='&Value='+poupValue;
	sendAjaxRequest(common.SERV_TREENODEACTION,params,callbackFunction);
}

function treeItemSelected_Additional(obj,treeName,description,eleId,treeNodeProp){return;}
function treeFolderSelected_Additional(obj,treeName,description,eleId,treeNodeProp){return;}
function treeNodeCustomMenuClicked_Additional(poupValue){return;}

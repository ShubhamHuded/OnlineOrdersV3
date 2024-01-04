/**
 * 
 */

/*
*  Display the Pending orders returned from the server.
*/
	function parseODetails(msg){ 
		if(msg == "Session Expired. Please login again.") {
			console.log("error while parseXml executing...");
			alert("session expired");
			window.location.reload();
		} else {
        console.log("parseXml executing...");
		console.log(msg.tables.open_orders);
		var openorders = msg.tables.open_orders;
		var html="";
		html+="<div class = \"table--container\">";
		html+="<table class = \"tabel--main\">";
		html+="<thead class = \"tabel--head\">";
        	html+="<th>Doc No</th>";
        	html+="<th>Order Date</th>";
        	html+="<th>Commodity</th>";
        	html+="<th>Order Type</th>";
        	html+="<th>Quantity</th>";
        	html+="<th>Price</th>";
        	html+="<th>Subuser</th>";
        	html+="<th>Amount</th>";
        html+="</thead>";
		html+="<tbody class = \"table--body\">";
	$.each(openorders, function(i, openordersdata){
			let value = Number(openordersdata.Total_Sales_Value);
			html+="<tr>";
            html+="<td data-label=\"Doc_Id\">" + openordersdata.Doc_Id +"</td>";
            html+="<td data-label=\"Date\">" + openordersdata.Date +"</td>";
            html+="<td data-label=\"Symbol\">" + openordersdata.Symbol +"</td>";
            html+="<td data-label=\"Symbol\">" + openordersdata.OrderType +"</td>";
            html+="<td data-label=\"Quantity\">" + openordersdata.Quantity +"</td>";
            html+="<td data-label=\"ops\">" + openordersdata.Price +"</td>";
            html+="<td data-label=\"Price\">" + openordersdata.User_Id +"</td>";
            html+="<td data-label=\"Total_Sales_Value\">" + value.toFixed(2) +"</td>";
         html+="</tr>";
		 console.log(typeof openordersdata.Total_Sales_Value);
		});
		html+="</tbody>"
		html+="</table>"; 
		html+="</div>";
		$("#orderDetailsDiv").html(html);		
		} 
	}
	
	
		function parsexml3(msg){
		if(msg == "Session Expired. Please login again."){
			alert(msg)
			window.location.reload();
		}
			else{
				var rejectOrders = msg.tables.reject_orders;
				var html="<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" id=\"frm\">";
		    	html+="<tr style=\"height:20px;background-color:#EFEFEF;font-size:13PX;color:#333;font-weight:bold\">";    	 
		    	html+="<td width=\"10%\" align=\"center\" >Doc No</td>";
		    	html+="<td width=\"10%\" align=\"center\" >OrderDate</td>";
		    	html+="<td width=\"10%\" align=\"center\" >Commodity</td>";
		    	html+="<td width=\"10%\" align=\"center\" >Quantity</td>";
		    	html+="<td width=\"15%\" align=\"center\" >Status</td>";
		    	html+="<td width=\"15%\" align=\"center\" >Subuser</td>";
		    	html+="<td width=\"30%\" align=\"center\" >Reason</td>";
		    	html+="</tr>";
		    	html+="<tr>";
		    	html+="<td colspan=\"7\">";
		    	html+="<div class=\"orderReportContainer\">";
		    	html+="<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" align=\"center\">";
		    	
		    	
		    	$.each(rejectOrders, function(i,rejectordersdata){
					var slno=0;
					var bgcolor="";
						slno++;
						
						if(slno %2 > 0){ 
							    bgcolor ="#fafafa"; 
						}
						else {
							 	bgcolor="#f3f3f3";
						}
						
						html+="<tr style=\"height:20px;background-color:"+bgcolor+";font-size:13PX;color:#333;font-weight:bold\">";
						html+="<td width=\"10%\" align=\"center\" >" + rejectordersdata.Order_Id +"</td>";
						html+="<td width=\"10%\" align=\"center\" >" + rejectordersdata.Date +"</td>";
						html+="<td width=\"10%\" align=\"center\" >" + rejectordersdata.Currency +"</td>";
						html+="<td width=\"10%\" align=\"center\" >" + rejectordersdata.Quantity +"</td>";
						html+="<td width=\"15%\" align=\"center\" >" + rejectordersdata.Status +"</td>";
						html+="<td width=\"15%\" align=\"center\" >" + rejectordersdata.User_Id +"</td>";
						html+="<td width=\"30%\" align=\"center\" >" + rejectordersdata.Reason +"</td>";				
				});
				html+="</table>";
		    	html+="</div>"; 
		    	html+="</tr></table>";
				$("#orderDetailsDiv").html(html);
			}
	}

	function parsexml1(msg){
		if(msg == "Session Expired. Please login again."){
				alert(msg)
				window.location.reload();
		}
		else{
			var rejectOrders = msg.dates;
			console.log(msg.dates);
			var now = rejectOrders.start;
			var after= rejectOrders.end;
			var html="<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" id=\"frmq\">";   	
	    	html+="<tr><td></td><tr><td></td></tr><tr><td></td></tr>";
	    	html+="<tr style=\"height:auto;background-color:#EFEFEF;font-size:13PX;color:#333;font-weight:bold;\">";
	        html+="<td width=\"30%\" align=\"center\" >Start Date(dd/mm/yyyy)</td>";
	    	html+="<td width=\"10%\" align=\"center\" colspan=\"\"><input id=\"startDate\" type=\"text\" name=\"startDate\" value=\""+now.trim()+"\" autocomplete=\"off\"></td>";
	    	html+="<td width=\"30%\" align=\"center\" >End Date(dd/mm/yyyy)</td>";
	    	html+="<td width=\"10%\" align=\"center\" colspan=\"\"><input type=\"text\" id=\"endDate\" name=\"endDate\" value=\""+after+"\" ></td>";	    		
	    	html+="<td width=\"20%\" align=\"center\" colspan=\"\"><input type=\"button\" id=\"button\" name=\"Refresh\" value=\"Refresh\" onclick=\"updateRejectedOrder()\" /></td>"
	    	html+="<tr><td/></tr><tr><td/></tr><tr><td/></tr></table>";
			$("#orderDetailsDiv").html(html);
			
		}
	}
				
	


	function parsexml2(msg) {
    if (msg == "Session Expired. Please login again.") {
        alert("session is expired pending order");
        window.location.reload();
    }
	else {
        console.log(msg.tables.pending_open_orders);
        var pendingorders = msg.tables.pending_open_orders;
        var html = "";
		html+="<div class = \"table--container\">";
		html+="<table class = \"tabel--main\">";
		html+="<thead class = \"tabel--head\">";
        	html+="<th>Order No</th>";
        	html+="<th>Order Date</th>";
        	html+="<th>Order Type</th>";
        	html+="<th>Commodity</th>";
        	html+="<th>Quantity</th>";
        	html+="<th>Price</th>";
        	html+="<th>Subuser</th>";
        	html+="<th colspan = \"2\">action</th>";
        html+="</thead>";
		html+="<tbody class = \"table--body\">";
	$.each(pendingorders, function(i, pendingordersdata){
			html+="<tr>";
            html+="<td data-label=\"Doc_Id\">" + pendingordersdata.Order_Id +"</td>";
            html+="<td data-label=\"Date\">" + pendingordersdata.Date +"</td>";
            html+="<td data-label=\"Symbol\">" + pendingordersdata.OrderType +"</td>";
            html+="<td data-label=\"Symbol\">" + pendingordersdata.Currency +"</td>";
            html+="<td data-label=\"Quantity\">" + pendingordersdata.Quantity +"</td>";
            html+="<td data-label=\"ops\">" + pendingordersdata.Price +"</td>";
            html+="<td data-label=\"Price\">" + pendingordersdata.User_Id +"</td>";
            let currency = pendingordersdata.Currency;
            let id = pendingordersdata.Order_Id;
            let ordertype = pendingordersdata.OrderType;
            html += "<td><input class = \"update--btn\" type=\"button\" id=\"button\"name=\"update\" value=\"Update\" onclick=\"return updateOrder('"
                + currency.trim()
                + "','"
                + id.trim()
                + "','"
                + ordertype.trim()
                + "')\" /></td>";
                html += "<td  ><input class = \"update--btn\" type=\"button\" id=\"button\" name=\"delete\" value=\"Delete\" onclick=\"return confirmDelete('"
                    + id
                    + "','"
                    + ordertype
                    + "')\" /></td>";
         html+="</tr>";
		});
		html+="</tbody>"
		html+="</table>"; 
		html+="</div>";
		$("#orderDetailsDiv").html(html);		
		} 
	}

	
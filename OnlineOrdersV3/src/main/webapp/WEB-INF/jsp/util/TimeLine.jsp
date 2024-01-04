	<%
	// Assuming "timeline" is a JSONArray in the request
	JSONArray timeline = (JSONArray) request.getAttribute("timeline");
	
	%>

	<%
	if (timeline != null && timeline.length() > 0) {
%>
	<div class="d-flex ml-4">
		<div class="time-line__container">
		<% out.println("<ul class=\"list-group list-group-flush\">"); 
				for (int i = 0; i < timeline.length(); i++) {
					JSONObject item = timeline.getJSONObject(i);
					out.println("<li>");
					out.println("<div class=\"dot-container\">");
					out.println("<div class=\"dot\"></div>");
					out.println("</div>");
					out.println("<div class=\"item\">");
					out.println(item.getString("action") + " "+" "+item.getString("timeStamp"));
					out.println("</div>");
					out.println("</li>");
				} %>
			<%	out.println("</ul>"); %>
		</div>
	</div>
	<% 
	}
	%>
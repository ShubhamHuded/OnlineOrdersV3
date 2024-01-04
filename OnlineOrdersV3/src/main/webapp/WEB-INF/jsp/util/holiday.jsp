<html>
<body>

<%@page import="maipl.db.*"%>
<%@page import="java.sql.*"%>
<%@page import="maipl.server.*"%>
<%@page import="maipl.util.*" %>
<%@ page errorPage="Error.jsp" %>  

<%! 
Connection con=null;
Statement stmt=null;
String sql=null;
ResultSet resultSet=null;
%>

<%
//To Check wheter today is Holidy from holiday master
//con = TestDb.getConnection();
con=AccessDb.getConnection("");
stmt=con.createStatement();
java.util.Date holiday = new java.util.Date();
int year=holiday.getYear()+1900;
int month = holiday.getMonth()+1;
String nowDate = holiday.getDate()+Resource.DATE_SEPARATOR+month+Resource.DATE_SEPARATOR+year;
Statement stmt = con.createStatement();
String sqlholiday="select *from dbo_mas_holiday where Holiday_Date='"+nowDate+"';";
Log.warn("sql query: " +sqlholiday);
System.out.println("sql query: " +sqlholiday);

ResultSet resultSetHoliday= stmt.executeQuery(sqlholiday);
while (resultSetHoliday.next()) { 
	String date  = resultSetHoliday.getString(Resource.HOLIDAY_DATE);
	Log.warn("Today is "+date+" Holiday");
	//console.log("Today is "+date+" Holiday");
	System.out.println("Today is "+date+" Holiday");
%>
<script>
	console.log("Today is General Holday!!! Market is Closed");
	alert("Today is General Holday!!! Market is Closed");
	window.opener.location.reload();
	window.close();
</script>
<%
return;
}
 %>
 
</body>
</html>
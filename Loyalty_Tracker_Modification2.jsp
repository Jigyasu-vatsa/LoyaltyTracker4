<%@page import="java.sql.*" %>

<%@page import="java.util.*" %>

<%@page import="java.text.*" %>

<%@page import="java.io.*" %>

<%@page import="java.lang.*" %>


<html>


<link rel="icon" 
      type="image/png" 
      href="http://10.34.23.52:8080/nget/Booking/booking.png">
<title>  Loyalty Modification File Upload Tracker  </title>
<body>
<a align="right" href="/nget/nget_main.jsp">NGeT Main Page</a>
<center>

<form name="sampleform" action="Loyalty_Tracker_Modification2.jsp" method="post">

<h2 style='border-bottom-style: solid;color: darkblue'> Bankwise Loyalty Modification Tracker File <hr></h2>

<table>

<tr>

<td width=150> <div align="left"><font size="5" color="darkblue">Select Bank </td>

<td width=60> <div align="left"><font size="5" color="#6600FF">


<select name="Bank">

<option value="3"> Banks </option>
<option value="101">SBI</option>
<option value="102">BOB</option>
<option value="103">HDFC</option>


</select>

</td>

<td> <input type="button" size="5" style="background-color:#DEE7FF" value="Submit" onclick="sampleform.submit()"></td>

</tr>

</table>

</form>

</center>




<%
	
    
	try{
		
		String Bnk = request.getParameter("Bank");
		if(Bnk!=null||!Bnk.equals(""))
{
	Connection conn=null;
    
	Statement stmt=null;
    
	ResultSet rs=null;
	//out.println(""+)
		
		String query = null;
				
		if (Bnk.equals("101"))
		{
            query ="select to_char(acnt_creation_date,'yyyy-mm'), count(distinct a.loyalty_number), count(distinct case when USER_ID is not null and account_status='1' then a.loyalty_number end), count(distinct case when account_status='1' then a.loyalty_number end),count(distinct case when account_status='2' then a.loyalty_number end), count(distinct case when account_status='4' then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)>0 then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>37 and trunc(sysdate-acnt_creation_date)<=60 then a.loyalty_number end) , count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>60 and trunc(sysdate-acnt_creation_date)<=90 then a.loyalty_number end) , count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>90 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)<=3 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)>3 and round(((YEAR_END_DATE-sysdate)/30),0)<=8 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)>8 then a.loyalty_number end) from transaction_db.et_loyalty_acnt_dtls a, transaction_db.ET_LOYALTY_ANNUAL_SUMMARY b where payment_responsibility in (101) and a.loyalty_number=b.loyalty_number group by rollup(to_char(acnt_creation_date,'yyyy-mm')) order by 1";
		}
		else if (Bnk.equals("102"))
		{		
            query ="select to_char(acnt_creation_date,'yyyy-mm'), count(distinct a.loyalty_number), count(distinct case when USER_ID is not null and account_status='1' then a.loyalty_number end), count(distinct case when account_status='1' then a.loyalty_number end),count(distinct case when account_status='2' then a.loyalty_number end), count(distinct case when account_status='4' then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)>0 then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>37 and trunc(sysdate-acnt_creation_date)<=60 then a.loyalty_number end) , count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>60 and trunc(sysdate-acnt_creation_date)<=90 then a.loyalty_number end) , count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>90 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)<=3 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)>3 and round(((YEAR_END_DATE-sysdate)/30),0)<=8 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)>8 then a.loyalty_number end) from transaction_db.et_loyalty_acnt_dtls a, transaction_db.ET_LOYALTY_ANNUAL_SUMMARY b where payment_responsibility in (102) and a.loyalty_number=b.loyalty_number group by rollup(to_char(acnt_creation_date,'yyyy-mm')) order by 1";
		}
		else if (Bnk.equals("103"))
		{		
            query ="select to_char(acnt_creation_date,'yyyy-mm'), count(distinct a.loyalty_number), count(distinct case when USER_ID is not null and account_status='1' then a.loyalty_number end), count(distinct case when account_status='1' then a.loyalty_number end),count(distinct case when account_status='2' then a.loyalty_number end), count(distinct case when account_status='4' then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)>0 then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>37 and trunc(sysdate-acnt_creation_date)<=60 then a.loyalty_number end) , count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>60 and trunc(sysdate-acnt_creation_date)<=90 then a.loyalty_number end) , count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>90 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)<=3 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)>3 and round(((YEAR_END_DATE-sysdate)/30),0)<=8 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)>8 then a.loyalty_number end) from transaction_db.et_loyalty_acnt_dtls a, transaction_db.ET_LOYALTY_ANNUAL_SUMMARY b where payment_responsibility in (103) and a.loyalty_number=b.loyalty_number group by rollup(to_char(acnt_creation_date,'yyyy-mm')) order by 1";
		}
		else if (Bnk.equals("3"))
		{		
            query ="select to_char(acnt_creation_date,'yyyy-mm'), count(distinct a.loyalty_number), count(distinct case when USER_ID is not null and account_status='1' then a.loyalty_number end), count(distinct case when account_status='1' then a.loyalty_number end),count(distinct case when account_status='2' then a.loyalty_number end), count(distinct case when account_status='4' then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)>0 then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 then a.loyalty_number end), count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>37 and trunc(sysdate-acnt_creation_date)<=60 then a.loyalty_number end) , count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>60 and trunc(sysdate-acnt_creation_date)<=90 then a.loyalty_number end) , count(distinct case when (LAST_MODIFIED_TIME-acnt_creation_date)<1 and trunc(sysdate-acnt_creation_date)>90 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)<=3 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)>3 and round(((YEAR_END_DATE-sysdate)/30),0)<=8 then a.loyalty_number end), count(distinct case when account_status in('1','2') and round(((YEAR_END_DATE-sysdate)/30),0)>8 then a.loyalty_number end) from transaction_db.et_loyalty_acnt_dtls a, transaction_db.ET_LOYALTY_ANNUAL_SUMMARY b where payment_responsibility in (101,102,103) and a.loyalty_number=b.loyalty_number group by rollup(to_char(acnt_creation_date,'yyyy-mm')) order by 1";
		}

	
	
    
		//out.println(""+)	
				try
				
				{
		
		

 
            System.setProperty("oracle.net.tns_admin","C:/oracle/ora92/network/ADMIN");

 
           Class.forName("oracle.jdbc.driver.OracleDriver");    
		   
		   //conn=DriverManager.getConnection("jdbc:oracle:thin:@10.78.14.42:1725/rptdb_srv.cris.org.in","ir_moniurl2","irmoni#456");

              //conn=DriverManager.getConnection("jdbc:oracle:thin:@ajay_nget","ir_moniurl","irmon#123");
			  //conn=DriverManager.getConnection("jdbc:oracle:thin:@EXACC","ir_moniurl2","irmoni#456");
			 conn=DriverManager.getConnection("jdbc:oracle:thin:@EXACC","ir_moniurl2","irmoni#456");
			  //conn=DriverManager.getConnection("jdbc:oracle:thin:@10.78.14.42","ir_moniurl2","irmoni#456");
			  //conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1725:rptdb_srv.cris.org.in","ir_moniurl2","irmoni#456");
			  //String url="jdbc:oracle:thin:ir_moniurl2/irmon#456@10.78.14.42:1725:EXA52
             //conn=DriverManager.getConnection("jdbc:oracle:thin:@NGETNEW5","ir_moniurl","irmon#123");
           
		   // conn=DriverManager.getConnection("jdbc:oracle:thin:@NGETNEW5","ir_moniurl","irmon#123");
          //out.println("connected");
		  stmt=conn.createStatement();

			
				long StartTime = System.currentTimeMillis();
				
		

         

		long EndTime = System.currentTimeMillis();
		

		rs=stmt.executeQuery(query);
                        
        
                
        String myString= NumberFormat.getInstance().format((EndTime-StartTime)) + " ms" ;
                
        java.util.Date fromDate1=new java.util.Date();

		int fdate=(fromDate1.getDate());

		int fmonth=(fromDate1.getMonth());

		int fyear=(fromDate1.getYear()+1900);

		int m1=fromDate1.getMonth()+1;

		String month1=null;

		if(m1==1)month1="Jan";if(m1==2)month1="Feb";if(m1==3)month1="Mar";if(m1==4)month1="Apr";

		if(m1==5)month1="May";if(m1==6)month1="Jun";if(m1==7)month1="Jul";if(m1==8)month1="Aug";

		if(m1==9)month1="Sep";if(m1==10)month1="Oct";if(m1==11)month1="Nov";if(m1==12)month1="Dec";

		String sysDate=fdate+"-"+month1+"-"+fyear;
                  
                Calendar calendar = new GregorianCalendar();
                String am_pm;
                int hour = calendar.get(Calendar.HOUR);
                int minute = calendar.get(Calendar.MINUTE);
                int second = calendar.get(Calendar.SECOND);
                if(calendar.get(Calendar.AM_PM) == 0)
                  am_pm = "AM";
                else
                  am_pm = "PM";

                String sysTime = hour + ":" + minute + ":" + second + ":" + am_pm + ":";
                             
                
                 FileWriter fstream = new FileWriter("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 10.0\\logs\\NGET.txt",true);
                BufferedWriter fw = new BufferedWriter(fstream);
                fw.write("\n");
                fw.write(sysDate);
                fw.write(":"+sysTime);
                fw.write("-> Minutewise Booking (All) -> Time Taken for Query Execution : ");
				fw.write(myString + "   (");
                fw.write("User IP : " + request.getRemoteAddr() + ")");
                //Close the output stream
                fw.close();
                        
                %>
				
		<center>
				<h2 style='border-bottom-style: solid;color: darkblue'> <%out.println(Bnk);%> Loyalty Modification File Upload Tracker <br> <%=sysDate%> <hr></h2> </center>

	
				<table width='100%' border="1" cellpadding="3" cellspacing="0" bordercolor="black"> <font size="3" face="Ariel">

					<tr height=40 bgcolor="grey">

						<td  align=center><b><%out.println("Creation Month");%></td>
						<td width=80 align=center><b><%out.println("Total Created");%></td>
						<td width=80 align=center><b><%out.println("User Linked");%></td>
						<td width=80 align=center><b><%out.println("AAAR");%> </td>
						<td width=80 align=center><b><%out.println("AANR");%></td>
						<td width=80 align=center><b><%out.println("NANR");%></td>
						<td width=80 align=center><b><%out.println("Mod. File Uploaded");%></td>
						<td width=60 align=center><b><%out.println("Mod. File Not Uploaded");%></td>
						<td width=70 align=center><b><%out.println("38-60 Days");%></td>
						<td width=80 align=center><b><%out.println("61-90 Days");%></td>
						<td width=60 align=center><b><%out.println("Above 90 Days");%></td>
						<td width=60 align=center><b><%out.println("3 Months To Expiry");%></td>
						<td width=60 align=center><b><%out.println("4-8 Months To Expiry");%></td>
						<td width=60 align=center><b><%out.println("Above 8 Months To Expiry");%></td>
						
					</tr>
	
		
		<%
		        
		String s="", total="Total";

		while(rs.next())
			
		{		
					s=rs.getString(1);

						if(s!=null)

					{ 	%>
					<tr >
					<td width=60 align=center><%=s%> </td>
					<td width=80 align=center><%=rs.getString(2)%> </td>
					<td width=80 align=center><%=rs.getString(3)%> </td>
					<td width=80 align=center><%=rs.getString(4)%> </td>
					<td width=80 align=center><%=rs.getString(5)%> </td>
					<td width=60 align=center><%=rs.getString(6)%> </td>
					<td width=60 align=center><%=rs.getString(7)%> </td>
					<td width=60 align=center><%=rs.getString(8)%> </td>
					<td width=70 align=center><%=rs.getString(9)%> </td>
					<td width=80 align=center><%=rs.getString(10)%> </td>
					<td width=80 align=center><%=rs.getString(11)%> </td>
					<td width=80 align=center><%=rs.getString(12)%> </td>
					<td width=80 align=center><%=rs.getString(13)%> </td>
					<td width=80 align=center><%=rs.getString(14)%> </td>
					
					
					</tr>	
					

					<%		}

					else

					{		%>

					
					
					<tr height=30  bgcolor="lightgrey"> 
					<td width=60 align=center ><b> <%=total%> </td>
					<td width=80 align=center ><b><i><%=rs.getString(2)%></i></td>
					<td width=80 align=center><b><i><%=rs.getString(3)%></i></td>
					<td width=80 align=center><b><i><%=rs.getString(4)%></i> </td>
					<td width=80 align=center><b><%=rs.getString(5)%> </td>
					<td width=60 align=center><b><i><%=rs.getString(6)%></i> </td>
					<td width=60 align=center><b><i><%=rs.getString(7)%></i> </td>
					<td width=60 align=center><b><i><%=rs.getString(8)%></i> </td>
					<td width=70 align=center><b><i><%=rs.getString(9)%></i> </td>
					<td width=80 align=center><b><i><%=rs.getString(10)%></i> </td>
					<td width=80 align=center><b><i><%=rs.getString(11)%></i> </td>
					<td width=80 align=center><b><i><%=rs.getString(12)%></i> </td>
					<td width=80 align=center><b><i><%=rs.getString(13)%></i> </td>
					<td width=80 align=center><b><i><%=rs.getString(14)%></i> </td>
					
					
					</tr>									
					<%}%>
	
				

				
			<%		}

%></table><%


		

    }

    catch(Exception e){
    out.println("Error: - "+e);
		e.printStackTrace();
    }

	finally {
		rs.close();
		stmt.close();
		conn.close();
	}
}
}catch(Exception et)
{
//out.println(""+et);
}
%>

</body>

</html>
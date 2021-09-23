<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<html>
    <head>
      <title>add book</title>
	  <link rel="icon" href="https://d1nhio0ox7pgb.cloudfront.net/_img/v_collection_png/64x64/shadow/books_blue_add.png">
      <style>

 
	
            body{
                font-family: "Arial", sans-serif;
                background-image:linear-gradient(to right bottom, rgba(79, 68, 129,0.5), rgba(48, 185, 100,0.5));
                color: rgb(0, 0, 0);
                font-size: 150%;
                text-align: center;
                width:100%;
                
            }
             table{
                background-image:linear-gradient(to right bottom, rgb(76, 223, 18), rgb(48, 185, 178));
                border-radius: 25px;
                border: 1px solid black;

            }
            .con {
                    width:100%;
                    height:100vh;
                    display:flex;
                    justify-content:center;
                    align-items:center;
                }
                .submit{
                    display:flex;
                    justify-content:center;
                    align-items:center; 
                   
                }
       </style> 
    </head>
    <body>
		 <div class="con">	
	<%

	
	string title = Request["title"];
	     	title = title.Trim();
             if (title == "" || title == null)
             {
             Response.Write ("There is an error in the title = "+title+"<br>");
             Response.End();
             }
		
			int author = 0;
			try
			{
			author = int.Parse (Request["author"]);
			}
			catch (Exception){}
             if (author < 1 || author > 4 || author == null)
             {
              Response.Write ("There is an error in the author = "+author+"<br>");
	          Response.End();
             }
			
			  int format =0;
			 try
			 {
			  format = int.Parse (Request["format"]);
			 }
			 catch (Exception){}
              if (format >3 || format < 1 || format == null )
              {
               Response.Write ("There is an error in the format = "+format+"<br>");
    	  	   Response.End();
              }		

			  int price = -1;
			  try{
				price = int.Parse (Request["price"]);
				}
			  catch (Exception){}
              if (price < 1 || price == null)
              {
               Response.Write ("There is an error in the price = "+price+"<br>");
    	  	   Response.End();
              }			  
			
	
	string pw = Request["password"];
			  if (pw != "123456" || price == null)
	
              {
              Response.Write ("There is an error in the password = "+pw+"<br>");
              Response.End();
              }
			
			int id = 0;
			
			MySqlConnection conn = 
            new MySqlConnection("server=127.0.0.1;user id=root;password=mysqlclass;database=bookshop;pooling=false");
                          
    conn.Open();
    MySqlCommand cmd = conn.CreateCommand();
    cmd.CommandText = "select max(id) from items";
	
	 MySqlDataReader reader = cmd.ExecuteReader();
		 while (reader.Read()) {
		 id=(int)reader["max(id)"];
		 id +=1;
		 
		 }
		
		 
		 
		 MySqlConnection conn2 = 
            new MySqlConnection("server=127.0.0.1;user id=root;password=mysqlclass;database=bookshop;pooling=false");
                          
    conn2.Open();
    MySqlCommand cmd2 = conn2.CreateCommand();
    cmd2.CommandText = "INSERT INTO items values ("+id+", '"+title+"' ,"+author+")";

	 MySqlDataReader reader2 = cmd2.ExecuteReader();
	 
	 
	 
	  MySqlConnection conn3 = 
            new MySqlConnection("server=127.0.0.1;user id=root;password=mysqlclass;database=bookshop;pooling=false");
                          
    conn3.Open();
    MySqlCommand cmd3 = conn3.CreateCommand();
    cmd3.CommandText = "select max(id) from prices";
    int id2 = 0;
	 MySqlDataReader reader3 = cmd3.ExecuteReader();
	  while (reader3.Read()) {
		 id2=(int)reader3["max(id)"];
		 id2 +=1;
		 
		 }
		 
		
		 
		 
		 MySqlConnection conn4 = 
            new MySqlConnection("server=127.0.0.1;user id=root;password=mysqlclass;database=bookshop;pooling=false");
                          
    conn4.Open();
    MySqlCommand cmd4 = conn4.CreateCommand();
    cmd4.CommandText = "select max(item) from prices where type = "+format;
    int item = 0;
	 MySqlDataReader reader4 = cmd4.ExecuteReader();
		 while (reader4.Read()) {
		 item=(int)reader4["max(item)"];
		 item +=1;
		 
		}
		
	
	
	
	
	
	MySqlConnection conn5 = 
            new MySqlConnection("server=127.0.0.1;user id=root;password=mysqlclass;database=bookshop;pooling=false");
                          
    conn5.Open();
    MySqlCommand cmd5 = conn5.CreateCommand();
     cmd5.CommandText = "INSERT INTO prices values ("+id2+", "+item+" ,"+format+","+price+")";

	 MySqlDataReader reader5 = cmd5.ExecuteReader();
	
	
	
	
		%>
		<h1>good job</h1>


	
	
	</div>
    </body>
  </html>
  
<%@Language="VBScript" CODEPAGE="65001" %>

<% 

  Response.CharSet="utf-8"

  Session.codepage="65001"

  Response.codepage="65001"

  Response.ContentType="text/html;charset=utf-8"

%>

<html>
<head>
    <title>Loading...</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
    <%
        sort1=Request.Form("sort")
        syear1=Request.Form("year2")
        sub1=Request.Form("sub")
        number1=Request.Form("number")
        sname1=Request.Form("sname")
        score1=Request.Form("score")
        place1=Request.Form("place")
    %>

   <%
        Dim sort1_write
        if sort1 = "1" then
            sort1_write = Replace(sort1, "1", "2021년 1학기")
        elseif sort1 = "2" then
            sort1_write = Replace(sort1, "2", "2021년 2학기")
        end if
    %>
    <%
        set db  = server.createobject("ADODB.Connection")
        db.open("DSN=sukjimanghera; UID=; PW=")


        sql = "insert into subject values('" & sort1_write & "', '" & syear1 & "', '" & sub1 & "', '" & number1 & "', '" & sname1 & "', '" & score1 & "', '" & place1 & "')"
        db.execute(sql)

        db.close
        response.redirect "result.html"
    %>
</body>
</html>
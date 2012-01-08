<%-- 
    Document   : menu
    Created on : 23-Jan-2011, 23:32:32
    Author     : ndh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>


<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <c:if test="${ not empty data}">

                <table border="0px" style="border-style:hidden" bgcolor="white">
                    
                    <c:forEach items="${data}" var="kategori">
                        <tr>

                            
                            <td><a href="<c:url value="/katalog/${kategori.nama}" />">Buku ${kategori.nama}</a></td>
                            
                           
                            
                             </tr>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${empty data}">
                <div>Data Kosong</div>
            </c:if>
    </body>
</html>

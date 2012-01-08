<%-- 
    Document   : list
    Created on : Sep 1, 2010, 4:04:43 PM
    Author     : omenkzz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hasil Pencarian</title>
    </head>
    <body>

        <fieldset style="border: darkorange solid 1px">
            <legend>Hasil Pencarian</legend>

            <c:if test="${ not empty bukuList}">

                <table border="0px" style="border-style: solid" bgcolor="white">
                    <tr bgcolor="pink">
                        
                        <th>Judul Buku</th>
                        <th>Pengarang</th>
                        <th>Action</th>

                    </tr>
                    <c:forEach items="${bukuList}" var="buku">
                        <tr>

                            
                            <td>${buku.judul}</td>
                            <td>${buku.pengarang.nama}</td>
                            <td>
                                <spring:url value="/search/${buku.id}" var="detail_url"/>
                                <form:form action="${detail_url}" method="GET">
                                    <input type="submit" value="Detail" />
                                </form:form>
                            </td>
                        </tr>

                    </c:forEach>
                </table>
                <c:if test="${searchCriteria.page > 0}">
                    <a href="search?searchString=${searchCriteria.searchString}&pageSize=${searchCriteria.pageSize}&page=${searchCriteria.page - 1}&dasarCari=<%= request.getParameter("dasarCari") %>">Previous Results</a>

                </c:if>
                <c:if test="${not empty bukuList && fn:length(bukuList) == searchCriteria.pageSize}">
                    <a href="search?searchString=${searchCriteria.searchString}&pageSize=${searchCriteria.pageSize}&page=${searchCriteria.page + 1}&dasarCari=<%= request.getParameter("dasarCari") %>">More Results</a>
                </c:if>
            </c:if>
             
            <c:if test="${empty bukuList}">
                <div>Buku Yang Anda Cari Tidak Ada</div>
            </c:if>
        </fieldset>
        Hasil Pencarian ${count} result(s)

    </body>
</html>

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
        <title>Daftar Kategori</title>
    </head>
    <body>
        <spring:url value="/kategori/form" var="new_url"/>
        <a href="${new_url}">New..</a>
        <fieldset style="border: black solid 1px">
            <legend>Daftar Kategori</legend>

            <c:if test="${ not empty data}">

                <table border="1px" style="border-style:hidden" bgcolor="white">
                    <tr bgcolor="pink">
                        <th>id</th>
                        <th>nama kategori</th>
                        <th>keterangan</th>
                       <th colspan="2">action</th>
                    </tr>
                    <c:forEach items="${data}" var="kategori">
                        <tr>

                            <td>${kategori.id}</td>
                            <td>${kategori.nama}</td>
                            <td>${kategori.keterangan}</td>
                           
                            
                            <td>
                                <spring:url value="/kategori/${kategori.id}" var="delete_url"/>
                                <form:form action="${delete_url}" method="POST">
                                    <input type="submit" value="Delete" onClick="return confirm('apakah anda yakin mau menghapus??')"/>
                                </form:form>
                            </td>
                            <td>
                                <spring:url value="/kategori/${kategori.id}" var="update_url"/>
                                <form:form action="${update_url}" method="GET">
                                    <input type="submit" value="Update"/>
                                </form:form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${empty data}">
                <div>Data Kosong</div>
            </c:if>
        </fieldset>
        <br/>
        <spring:url value="/kategori/form" var="new_url"/>
        <a href="${new_url}">New..</a>
    </body>
</html>

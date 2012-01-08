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
        <title>LAPORAN</title>
    </head>
    <body>

        <spring:url value="/kategori/form" var="new_url"/>
        
        <fieldset style="border: black solid 1px">
            <legend>Laporan Buku yang paling banyak dicari</legend>

            <c:if test="${ not empty data}">

                <table border="0px" style="border-style: solid" bgcolor="white">
                    <tr bgcolor="grey">

                       
                        <th>Judul</th>
                        <th>Pengarang</th>
                        <th>Jumlah Cari</th>

                    </tr>
                    <% int counter = 0; %>

                    <c:forEach items="${data}" var="jum">
                        <tr>
                            <td>${jum.judul}</td>
                            <td>${jum.pengarang.nama}</td>
                            <td>${jum.jumlahCari}</td>

                           

                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${empty data}">
                <div>Data Kosong</div>
            </c:if>
        </fieldset>
        <br/>
        <spring:url value="/laporan/banyakCari.pdf" var="new_url"/>
        <a href="${new_url}">Export PDF</a>
    </body>
</html>

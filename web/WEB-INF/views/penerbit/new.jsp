<%-- 
    Document   : new
    Created on : Sep 1, 2010, 5:00:38 PM
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


<spring:url value="/penerbit" var="submit_url"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Penerbit</title>
    </head>
    <body>
        <div>
            <spring:url value="/penerbit" var="form_url"/>
            <form:form action="${form_url}" method="POST" modelAttribute="penerbit">
                <table>
                    <tr>
                        <td>Nama : <br />(perusahaan)</td>
                        <td>
                            <form:input path="nama"/>
                            <br/>
                            <form:errors path="nama"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Alamat:</td>
                        <td>
                            <form:textarea path="alamat" />
                            <br/>
                            <form:errors path="alamat"/>
                        </td>
                    </tr>
                    <tr>
                        <td><input id="proceed" type="submit" value="Simpan"/></td>
                        <td><input id="reset" type="reset" value="Reset"/></td>
                    </tr>
                </table>
                <a href="${submit_url}">Back</a>
            </form:form>
        </div>
    </body>
</html>

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


<spring:url value="/kategori" var="submit_url"/>

<html>
    <head>


        <title>New Kategori</title>
        <style>
            .error {
                color: #ff0000;
                font-weight: bold;
            }
            .errorblock{
                 color: #000;
                background-color: #ffEEEE;
                border: 3px solid #ff0000;
                padding:8px;
                margin:16px;
            }
        </style>

    </head>
    <body>
        <div>
            <spring:url value="/kategori" var="form_url"/>
            <form:form action="${form_url}" method="POST" modelAttribute="kategori">
                <table>
                    <tr>
                        <td>Nama :</td>
                        <td>
                            <form:input path="nama"/>
                            
                            <form:errors path="nama" cssClass="errorblock"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Keterangan :</td>
                        <td>
                            <form:textarea path="keterangan" />
                            
                            <form:errors path="keterangan" cssClass="errorblock"/>
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

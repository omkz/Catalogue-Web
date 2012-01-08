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


<spring:url value="/pengarang" var="submit_url"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Pengarang</title>
        <style>
            .error {
                color: #ff0000;
                font-weight: bold;
            }
            .errorblock{
                
                color: #000;
                background-color: #ffEEEE;
                border: 2px solid #ff0000;
               
            }
        </style>

    </head>
    <body>
        <div>
            <spring:url value="/pengarang" var="form_url"/>
            <form:form action="${form_url}" method="POST" modelAttribute="pengarang">
                <table>
                    <tr>
                        <td>Nama :</td>
                        <td>
                            <form:input path="nama"/>
                            <br/>
                            <form:errors path="nama" cssClass="errorblock"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Alamat:</td>
                        <td>
                            <form:textarea path="alamat" />
                            <br/>
                            <form:errors path="alamat" cssClass="errorblock"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Email :</td>
                        <td>
                            <form:input path="email" />
                            <br/>
                            <form:errors path="email" cssClass="errorblock"/>
                        </td>
                    </tr>
                    <tr>
                        <tr>
                        <td>Biografi:</td>
                        <td>
                            <form:textarea path="biografi" />
                            <br/>
                            <form:errors path="biografi" cssClass="errorblock"/>
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

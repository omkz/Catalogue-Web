<%-- 
    Document   : home
    Created on : 11 Nov 10, 20:45:41
    Author     : ski
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
        <title>Halaman Cari</title>
        <script type="text/javascript">
            function cek(form){
                if(form.searchString.value==""){
                    alert("Masukan Kata Kunci");
                    return false;
                }
                else{
                    return true;
                }
            }
        </script>

    </head>
    <body>
        <h1>Silahkan Cari Buku</h1>
        <fieldset style="border: yellowgreen solid 1px">
            <legend>Kotak Searching</legend>

            <spring:url value="/search" var="search_url" />
            <form:form action="${search_url}"modelAttribute="searchCriteria"  method="GET">                
                <table border="0">
                    <tr>
                        <td>Masukan Kata Kunci:</td>
                        <td><form:input id="searchString" path="searchString" name="searchString"/></td>
                        <td> Maximum results:
                            <form:select id="pageSize" path="pageSize">



                                <form:option label="20" value="20"/>
                                <form:option label="30" value="30"/>
                            </form:select></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="radio" name="dasarCari" value="judul"/>judul
                            <input type="radio" name="dasarCari" checked value="pengarang"/>pengarang<br/></td>
                        <td><input type="submit" value="Cari Buku" onClick="return cek(this.form)"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>

            </form:form>

        </fieldset>


    </body>
</html>

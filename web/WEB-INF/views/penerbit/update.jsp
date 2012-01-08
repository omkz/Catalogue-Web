<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:url value="/penerbit" var="submit_url"/>
<spring:url value="/resources/scripts/jquery-1.4.2.min.js" var="jquery_url"/>
<spring:url value="/resources/scripts/jquery-ui-1.8.4.custom.min.js" var="jqueryui_url"/>
<spring:url value="/resources/styles/hot-sneaks/jquery-ui-1.8.4.custom.css" var="jqueryui_css"/>

<html>
<head>
    <title>Update Penerbit</title>

</head>
<body>

<spring:url value="/penerbit" var="penerbit_list_url"/>
<spring:url value="/penerbit/update/${penerbit.id}" var="penerbit_url"/>
<form:form action="${penerbit_url}" method="POST" modelAttribute="penerbit">
    <form:hidden path="id"/>
    <table>
        <tr>
            <td>Nama :</td>
            <td>
                <form:input path="nama"/>
                <br/>
                <form:errors path="nama"/>
            </td>
        </tr>
        <tr>
            <td>Alamat :</td>
            <td>
                <form:input path="alamat"/>
                <br/>
                <form:errors path="alamat"/>
            </td>
        </tr>

        <tr>
            <td><input id="proceed" type="submit" value="Simpan"/></td>
            <td><input id="reset" type="reset" value="Reset"/></td>
        </tr>
    </table>
    <br/>
    <a href="${penerbit_list_url}">Back</a>
</form:form>
</body>
</html>
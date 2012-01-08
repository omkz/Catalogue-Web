<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:url value="/lokasi" var="submit_url"/>
<spring:url value="/resources/scripts/jquery-1.4.2.min.js" var="jquery_url"/>
<spring:url value="/resources/scripts/jquery-ui-1.8.4.custom.min.js" var="jqueryui_url"/>
<spring:url value="/resources/styles/hot-sneaks/jquery-ui-1.8.4.custom.css" var="jqueryui_css"/>

<html>
<head>
    <title>Update Lokasi</title>

</head>
<body>

<spring:url value="/lokasi" var="lokasi_list_url"/>
<spring:url value="/lokasi/update/${lokasi.id}" var="lokasi_url"/>
<form:form action="${lokasi_url}" method="POST" modelAttribute="lokasi">
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
            <td>keterangan :</td>
            <td>
                <form:input path="keterangan"/>
                <br/>
                <form:errors path="keterangan"/>
            </td>
        </tr>

        <tr>
            <td><input id="proceed" type="submit" value="Simpan"/></td>
            <td><input id="reset" type="reset" value="Reset"/></td>
        </tr>
    </table>
    <br/>
    <a href="${lokasi_list_url}">Back</a>
</form:form>
</body>
</html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>Show Kategori</title>
    </head>
    <body>

        <div id="_title_div">
            <spring:url value="/kategori" var="kategori_list"/>
            <spring:url value="/kategori/${kategori.id}/form" var="kategori_update"/>

            <c:if test="${not empty kategori}">
                <table>
                    <tr>
                        <td>Nama :</td>
                        <td>
                            ${kategori.nama}
                        </td>
                    </tr>
                    <tr>
                        <td>Keterangan :</td>
                        <td>
                            ${kategori.keterangan}
                        </td>
                    </tr>

                </table>
                <a href="${kategori_update}">Update</a>&nbsp;
                <a href="${kategori_list}">Back</a>
            </c:if>

            <c:if test="${empty kategori}">
                <h1>kategori Tidak Ditemukan</h1>
                <a href="${kategori_list}">Back</a>
            </c:if>

        </div>

    </body>
</html>

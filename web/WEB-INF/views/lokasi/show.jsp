<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>Show Lokasi</title>
    </head>
    <body>

        <div id="_title_div">
            <spring:url value="/lokasi" var="lokasi_list"/>
            <spring:url value="/lokasi/${lokasi.id}/form" var="lokasi_update"/>

            <c:if test="${not empty lokasi}">
                <table>
                    <tr>
                        <td>Nama :</td>
                        <td>
                            ${lokasi.nama}
                        </td>
                    </tr>
                    <tr>
                        <td>Keterangan :</td>
                        <td>
                            ${lokasi.keterangan}
                        </td>
                    </tr>

                </table>
                <a href="${lokasi_update}">Update</a>&nbsp;
                <a href="${lokasi_list}">Back</a>
            </c:if>

            <c:if test="${empty lokasi}">
                <h1>lokasi Tidak Ditemukan</h1>
                <a href="${lokasi_list}">Back</a>
            </c:if>

        </div>

    </body>
</html>

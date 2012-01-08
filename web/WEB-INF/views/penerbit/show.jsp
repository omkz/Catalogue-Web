<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>Show Penerbit</title>
    </head>
    <body>

        <div id="_title_div">
            <spring:url value="/penerbit" var="penerbit_list"/>
            <spring:url value="/penerbit/${penerbit.id}/form" var="penerbit_update"/>

            <c:if test="${not empty penerbit}">
                <table>
                    <tr>
                        <td>Nama :</td>
                        <td>
                            ${penerbit.nama}
                        </td>
                    </tr>
                    <tr>
                        <td>Keterangan :</td>
                        <td>
                            ${penerbit.alamat}
                        </td>
                    </tr>

                </table>
                <a href="${penerbit_update}">Update</a>&nbsp;
                <a href="${penerbit_list}">Back</a>
            </c:if>

            <c:if test="${empty penerbit}">
                <h1>penerbit Tidak Ditemukan</h1>
                <a href="${penerbit_list}">Back</a>
            </c:if>

        </div>

    </body>
</html>

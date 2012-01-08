<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>Show pengarang</title>
    </head>
    <body>

        <div id="_title_div">
            <spring:url value="/pengarang" var="pengarang_list"/>
            <spring:url value="/pengarang/${pengarang.id}/form" var="pengarang_update"/>

            <c:if test="${not empty pengarang}">
                <table>
                    <tr>
                        <td>Nama :</td>
                        <td>
                            ${pengarang.nama}
                        </td>
                    </tr>
                      <tr>
                        <td>Alamat :</td>
                        <td>
                            ${pengarang.alamat}
                        </td>
                    </tr>
                    <tr>
                        <td>Email :</td>
                        <td>
                            ${pengarang.email}
                        </td>
                    </tr>
                     <tr>
                        <td>Biografi :</td>
                        <td>
                            ${pengarang.biografi}
                        </td>
                    </tr>

                </table>
                <a href="${pengarang_update}">Update</a>&nbsp;
                <a href="${pengarang_list}">Back</a>
            </c:if>

            <c:if test="${empty pengarang}">
                <h1>pengarang Tidak Ditemukan</h1>
                <a href="${pengarang_list}">Back</a>
            </c:if>

        </div>

    </body>
</html>

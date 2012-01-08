<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>Show Buku</title>
    </head>
    <body>

        <div id="_title_div">
            <spring:url value="/buku" var="buku_list"/>
            <spring:url value="/buku/${buku.id}/form" var="buku_update"/>

            <c:if test="${not empty buku}">
                <table>
                    <tr>
                        <td>Kode Buku :</td>
                        <td>
                            ${buku.kodeBuku}
                        </td>
                    </tr>
                     <tr>
                        <td>ISBN:</td>
                        <td>
                            ${buku.isbn}
                        </td>
                    </tr>
                     <tr>
                        <td>Judul :</td>
                        <td>
                            ${buku.judul}
                        </td>
                    </tr>
                    <tr>
                        <td>Kategori :</td>
                        <td>
                            ${buku.kategori.nama}
                        </td>
                    </tr>
                    <tr>
                        <td>tanggal terbit :</td>
                        <td>
                            ${buku.tanggalTerbit}
                        </td>
                    </tr>

                     <tr>
                        <td>Pengarang :</td>
                        <td>
                            ${buku.pengarang.nama}
                        </td>
                    </tr>
                     <tr>
                        <td>Penerbit :</td>
                        <td>
                            ${buku.penerbit.nama}
                        </td>
                    </tr>
                     <tr>
                        <td>Lokasi :</td>
                        <td>
                            ${buku.lokasi.nama}
                        </td>
                    </tr>


                </table>
                <a href="${buku_update}">Update</a>&nbsp;
                <a href="${buku_list}">Back</a>
            </c:if>

            <c:if test="${empty buku}">
                <h1>buku Tidak Ditemukan</h1>
                <a href="${buku_list}">Back</a>
            </c:if>

        </div>

    </body>
</html>

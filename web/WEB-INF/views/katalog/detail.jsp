<%--
    Document   : list
    Created on : Sep 1, 2010, 4:04:43 PM
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


<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Buku</title>
    </head>
    <body>

        <fieldset style="border: darkorange solid 1px">
            <legend>Detail Pencarian</legend>

            <c:if test="${ not empty buku}">

                <table border="0px" style="border-style: solid" bgcolor="white">
                    
                    
                    <tr>
                        <th>ISBN :</th>
                        <td>${buku.isbn}</td>
                    </tr>
                    <tr>
                        <th>Judul :</th>
                        <td>${buku.judul}</td>
                    </tr>
                       <tr>
                        <th>Kategori :</th>
                        <td>${buku.kategori.nama}</td>
                    </tr>
                       <tr>
                        <th>Pengarang :</th>
                        <td>${buku.pengarang.nama}</td>
                    </tr>
                       <tr>
                        <th>Tahun Terbit:</th>
                        <td><fmt:formatDate value="${buku.tanggalTerbit}" pattern="yyyy"/></td>

                    </tr>
                       <tr>
                        <th>Penerbit :</th>
                        <td>${buku.penerbit.nama}</td>
                    </tr>                    
                    <tr>
                        <th>Lokasi :</th>
                        <td>${buku.lokasi.nama}</td>
                    </tr>
                    <tr>
                        <th>Cover Buku :</th>
                        <spring:url value="${buku.cover}" var="cover" />
                        <td><img alt="tidak ada"  src="${cover}" height="150" width="100"/></td>
                    </tr>                     
                </table>
            </c:if>
            <c:if test="${empty buku}">
                <div>Buku Yang Anda Cari Tidak Ada</div>
            </c:if>
            <spring:url value="/" var="cari_url" />
            <a href="${cari_url}" >back</a>
        </fieldset>

    </body>
</html>

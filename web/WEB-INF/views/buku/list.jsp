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
        <title>Daftar Buku</title>
    </head>
    <body>
        <spring:url value="/buku/form" var="new_url"/>
        <a href="${new_url}">New..</a>
        <fieldset style="border: black solid 1px">
            <legend>Daftar Buku</legend>
            <c:if test="${not empty bukus}">

                <table border="1px" style="border-style: solid" bgcolor="white">
                    <tr bgcolor="pink">
                        
                        
                        <th>Kode Buku</th>
                        <th>ISBN</th>
                        <th>Judul</th>
                        <th>Tahun Terbit</th>
                        <th>Kategori</th>
                        <th>Pengarang</th>
                        <th>Penerbit</th>
                        <th>Lokasi</th>
                        <th>cover</th>
                        <th colspan="2" >Action</th>
                    </tr>

                    <c:forEach items="${bukus}" var="buku">
                        <tr>
                            
                            <td>${buku.kodeBuku}</td>
                            <td>${buku.isbn}</td>
                            <td>${buku.judul}</td>
                            <td><fmt:formatDate value="${buku.tanggalTerbit}" pattern="yyyy"/></td>
                            <td>${buku.kategori.nama}</td>
                            <td>${buku.pengarang.nama}</td>
                            <td>${buku.penerbit.nama}</td>
                            <td>${buku.lokasi.nama}</td>
                            <spring:url value="${buku.cover}" var="image"></spring:url>
                            <td><img src="${image}" alt="Tidak Ada" height="120" width="90"/></td>

                            <td>
                                <spring:url value="/buku/${buku.id}" var="update_url"/>
                                <form:form action="${update_url}" method="GET">
                                    <input type="submit" value="Update"/>
                                </form:form>
                            </td>

                            <td>
                                <spring:url value="/buku/${buku.id}" var="delete_url"/>
                                <form:form action="${delete_url}" method="POST">
                                    <input type="submit" value="Delete" onClick="return confirm('apakah anda yakin mau menghapus??')"/>

                                </form:form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                
                </c:if>


                <c:if test="${empty bukus}">
                    <div>Data Kosong</div>
                </c:if>
            </fieldset>
            <br/>
            <spring:url value="/buku/form" var="new_url"/>
            <a href="${new_url}">New..</a>
        </body>
    </html>

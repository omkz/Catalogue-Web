
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
    <head>
        <link rel="stylesheet" href="<c:url value="/resources/main.css" />" type="text/css" media="screen" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><tiles:insertAttribute name="title" ignore="true" /></title>
    </head>
    <body>
        <div id="banner"><br />Perpustakaan STMIK Akakom Yogyakarta</div>
        <div id="content"><tiles:insertAttribute name="body" />

            <div id="navigation">

                <ul id="mainnav">
                     <spring:url value="/" var="home_url"/>
                    <li><a href="${home_url}">Home</a></li>
                    
                    <spring:url value="/search/search" var="search_url"/>
                    <li><a href="${search_url}">Search</a></li>
                   
                    <security:authorize ifAllGranted="ROLE_ADMIN">
                        <spring:url value="/kategori" var="kategori_url"/>
                        <li><a href="${kategori_url}">Kategori</a></li>
                    </security:authorize>
                    <security:authorize ifAllGranted="ROLE_ADMIN">
                        <spring:url value="/lokasi" var="lokasi_url"/>
                        <li><a href="${lokasi_url}">Lokasi</a></li>
                    </security:authorize>
                    <security:authorize ifAllGranted="ROLE_ADMIN">
                        <spring:url value="/penerbit" var="penerbit_url"/>
                        <li><a href="${penerbit_url}">Penerbit</a></li>
                    </security:authorize>
                    <security:authorize ifAllGranted="ROLE_ADMIN">
                        <spring:url value="/pengarang" var="pengarang_url"/>
                        <li><a href="${pengarang_url}">Pengarang</a></li>
                    </security:authorize>
                    <security:authorize ifAllGranted="ROLE_ADMIN">
                        <spring:url value="/buku" var="buku_url"/>
                        <li><a href="${buku_url}">Buku</a></li>
                    </security:authorize>
                    <security:authorize ifAllGranted="ROLE_ADMIN">
                        <spring:url value="/search/jumlah" var="jumlah_url"/>
                        <li><a href="${jumlah_url}">Laporan Buku Yang Paling Banyak Dicari</a></li>
                    </security:authorize>
                    <security:authorize ifAllGranted="ROLE_ADMIN">
                        <spring:url value="/search/jumlahSepi" var="jumlah_url"/>
                        <li><a href="${jumlah_url}">Laporan Buku Yang Tidak Pernah Dicari</a></li>
                    </security:authorize>
                    <security:authorize ifAllGranted="ROLE_ADMIN">
                        <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
                    </security:authorize>


                    <security:authorize ifAllGranted="ROLE_ANONYMOUS">
                        <li><a href="<c:url value="/katalog" />">Katalog Buku </a></li>
                    </security:authorize>

                    <security:authorize ifAllGranted="ROLE_ANONYMOUS">
                        <li><a href="<c:url value="/login" />">Login</a></li>
                    </security:authorize>


                </ul>
            </div>

    </body>
</html>

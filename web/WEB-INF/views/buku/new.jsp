
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:url value="/resources/jquery/js/jquery-1.4.2.min.js" var="jquery_url"/>
<spring:url value="/resources/jquery/js/jquery-ui-1.8.6.custom.min.js" var="jqueryui_url"/>
<spring:url value="/resources/jquery/css/ui-darkness/jquery-ui-1.8.6.custom.css" var="jqueryui_css"/>
<spring:url value="/buku" var="submit_url"/>
<html>
    <head>
        <title>Create Buku</title>
        <script type="text/javascript" src="${jquery_url}"></script>
        <script type="text/javascript" src="${jqueryui_url}"></script>
        <link href="${jqueryui_css}" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            $(function(){
                var pickerOpts = {
                    changeMonth: true,
                    showOn: "button",
                    buttonText: "tgl",
                    changeYear: true,
                    numberOfMonths: 1,
                    yearRange: "-25:+25",
                    buttonImage: "/resources/images/cal.gif",
                    dateFormat: 'dd-MM-yy'
                };
                $("#date").datepicker(pickerOpts);
            });

            function Validate(){
                var image=document.getElementById("image").value;
                if(image!=""){
                    var chechimg=image.toLoweCase();

                    if(!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)){
                        alert("masukan gambar donk");

                        document.getElementById("image").focus();
                        return false;
                    }
                }
                return true;

            }
        </script>
        <style type="text/css">
            .error {
                color: #ff0000;
                font-weight: bold;
            }
            .errorblock{
                 color: #000;
                background-color: #ffEEEE;
                border: 3px solid #ff0000;
                padding:8px;
                margin:16px;
            }
        </style>

    </head>
    <body>
        <div>
            <spring:url value="/buku" var="form_url"/>
            <form:form action="${form_url}" method="POST" modelAttribute="buku" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>Kode Buku :</td>
                        <td>
                            <form:input path="kodeBuku"/>
                            
                            <form:errors path="kodeBuku" cssClass="errorblock"/>
                        </td>
                    </tr>
                    <tr>
                        <td>ISBN :</td>
                        <td>
                            <form:input path="isbn"/>
                            <br/>
                            <form:errors path="isbn"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Judul :</td>
                        <td>
                            <form:input path="judul"/>
                            
                            <form:errors path="judul" cssClass="errorblock"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Tanggal Terbit :</td>
                        <td>

                            <form:input path="tanggalTerbit" id="date"/>

                            <br/>
                            <form:errors path="tanggalTerbit"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Kategori :</td>
                        <td>
                            <form:select path="kategori" items="${kat}" itemLabel="nama" />

                            <br/>
                            <form:errors path="kategori"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Pengarang :</td>
                        <td>
                            <form:select path="pengarang" items="${pengarang}" itemLabel="nama" />

                            <br/>
                            <form:errors path="pengarang"/>
                        </td>
                    </tr>

                    <tr>
                        <td>Penerbit :</td>
                        <td>
                            <form:select path="penerbit" items="${penerbit}" itemLabel="nama"/>

                            <br/>
                            <form:errors path="penerbit"/>
                        </td>
                    </tr>
                    <tr>

                        <td>Lokasi :</td>
                        <td>
                            <form:select path="lokasi" items="${lokasi}" itemLabel="nama" />
                            <br/>
                            <form:errors path="lokasi"/>
                        </td>
                    </tr>
                    <tr>

                        <td>Cover :</td>
                        <td>

                            <form:input path="fileData" type="file"/>
                            <br/>
                            <form:errors path="cover"/>
                        </td>
                    </tr>

                    <tr>
                        <td><input id="proceed" type="submit" value="Simpan" onclick="return Validate()"/></td>
                        <td><input id="reset" type="reset" value="Reset"/></td>
                    </tr>
                </table>
                <a href="${submit_url}">Back</a>
            </form:form>
        </div>
    </body>
</html>


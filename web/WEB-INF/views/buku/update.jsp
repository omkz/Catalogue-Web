<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:url value="/dosen" var="submit_url"/>
<spring:url value="/resources/jquery/js/jquery-1.4.2.min.js" var="jquery_url"/>
<spring:url value="/resources/jquery/js/jquery-ui-1.8.6.custom.min.js" var="jqueryui_url"/>
<spring:url value="/resources/jquery/css/ui-darkness/jquery-ui-1.8.6.custom.css" var="jqueryui_css"/>
<html>
    <head>
        <title>Update Buku</title>
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
                    dateFormat: 'dd-MM-yy'
                };
                $("#date").datepicker(pickerOpts);
            });
        </script>

    </head>
    <body>

        <spring:url value="/buku" var="buku_list_url"/>
        <spring:url value="/buku/update/${buku.id}" var="buku_url"/>
        <form:form action="${buku_url}" method="POST" modelAttribute="buku" enctype="multipart/form-data"> 
            <form:hidden path="id"/>
            <table>
                <tr>
                    <td>Kode Buku:</td>
                    <td>
                        <form:input path="kodeBuku"/>
                        <br/>
                        <form:errors path="kodeBuku"/>
                    </td>
                </tr>
                <tr>
                    <td>ISBN:</td>
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
                        <br/>
                        <form:errors path="judul"/>
                    </td>
                </tr>
                <tr>
                    
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
                            <form:select path="penerbit" items="${penerbit}" itemLabel="nama" />

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
                    <td><input id="proceed" type="submit" value="Simpan"/></td>
                    <td><input id="reset" type="reset" value="Reset"/></td>
                </tr>
            </table>
            <br/>
            <a href="${buku_list_url}">Back</a>
        </form:form>
    </body>
</html>
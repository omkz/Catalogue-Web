<%-- 
    Document   : katalog
    Created on : 23-Jan-2011, 14:39:42
    Author     : ndh
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
        <title>Perpus   </title>
    </head>
    <body>

          <c:if test="${not empty personList}">
              <table border="0px" style="border-style: solid" bgcolor="white">
                  <c:forEach items="${personList.pageList}" var="buku">
                      <tr >   
                          <spring:url value="${buku.cover}" var="image"></spring:url>
                          <td rowspan="5"><img src="${image}" alt="Tidak Ada" height="150" width="120"/>
                          </td>
                      </tr>
                      <td>    Judul : ${buku.judul}</td>
                      <tr><td>Pengarang : ${buku.pengarang.nama}</td></tr>
                      <tr><td>Penerbit  : ${buku.penerbit.nama}</td></tr> 
                      <tr>
                          <td>
                              <spring:url value="/katalog/${buku.id}" var="detail_url"/>
                              <form:form action="${detail_url}" method="GET">
                                  <input type="submit" value="Detail" />
                              </form:form>
                          </td>

                      </tr>

                  </c:forEach>
              </table>     

          </c:if>

          <c:if test="${!personList.firstPage}">
              <a href="<c:url value="/katalog?page=previous" />"><b>&lt;&lt; Prev</b></a>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          </c:if>
          <c:if test="${!personList.lastPage}">
              <a href="<c:url value="/katalog?page=next" />"><b>Next &gt;&gt;</b></a>
          </c:if>
          <c:if test="${empty personList.pageList}">
              <div>Data Kosong</div>
          </c:if>


    </body>
</html>


<%-- 
    Document   : login
    Created on : 21 Jan 11, 15:32:17
    Author     : ndh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter" %>
<%@ page import="org.springframework.security.core.AuthenticationException" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty param.login_error}">
		<div class="error">
			Login Gagal silahkan coba lagi.<br /><br />
			Reason: <%= ((AuthenticationException) session.getAttribute(UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY)).getMessage() %>
		</div>
	</c:if>
        <form action="j_spring_security_check" method="post">
            <table>
                <tr><td><label for="j_username">Login</label>:</td>
                    <td<input type="text" id="j_username" name="j_username" size="20" maxlength="50"/></td>
                </tr>
                <td><label for="j_password">Password</label>:</td>
                <td<input type="password" id="j_password" name="j_password" size="20" maxlength="50"
                          /></td>
                <tr><td colspan="2>"

                        <input type="submit" value="Login"/></td></tr>
            </table>
        </form>
    </body>
</html>

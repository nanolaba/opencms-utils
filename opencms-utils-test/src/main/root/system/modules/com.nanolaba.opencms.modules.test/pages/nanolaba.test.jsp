<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<cms:include property="template" element="header"/>

<cms:contentload collector="singleFile" param="%(opencms.uri)" editable="auto">
	<cms:contentaccess var="content"/>

	test
</cms:contentload>

<cms:include property="template" element="footer"/>
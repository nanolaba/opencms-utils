<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="org.opencms.jsp.CmsJspBean" %>
<%@ page import="org.opencms.relations.CmsCategory" %>
<%@ page import="org.opencms.relations.CmsCategoryService" %>
<%@ page import="java.io.IOException" %>
<html>
<head>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.2.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.2/jquery-ui.min.js"></script>
	<script src="/opencms/system/modules/com.nanolaba.opencms.modules.test/elements/add_category.js"></script>
	<link href="/opencms/system/workplace/editors/acacia/css/Aristo/Aristo.css" rel="stylesheet"/>
	<style type="text/css">
		body {
			font-family: Arial, sans-serif;
			font-size: 12px;
			margin: 20px;
		}

		ul#icons li {
			margin: 2px;
			position: relative;
			padding: 4px 0;
			cursor: pointer;
			float: left;
			list-style: none;
		}

		ul#icons span.ui-icon {
			float: left;
			margin: 0 4px;
		}

		#eq span {
			height: 120px;
			float: left;
			margin: 15px;
		}
	</style>
</head>
<body>
<div class="ui-form">

<%
	String parentPath = request.getParameter("parent");

	if (request.getParameter("save") != null) {

		String name = request.getParameter("name");
		String descr = request.getParameter("descr");
//		out.print(name);
		boolean error = false;
		if (name == null || name.isEmpty()) {
			showError("Наименование категории должно быть заполнено", out);
			error = true;
		}

		if (!error) {

			CmsJspBean bean = new CmsJspBean();
			bean.init(pageContext, request, response);

			CmsCategory parent = parentPath == null | parentPath.trim().isEmpty() || parentPath.equals("/.categories/") ? null :
					CmsCategoryService.getInstance().getCategory(bean.getCmsObject(), bean.getCmsObject().readResource(parentPath));
			CmsCategoryService.getInstance().createCategory(bean.getCmsObject(), parent,
					translit(name), name, descr, null);

			showOk("Категория создана", out);

%>
<script>parent.location.reload();</script>
<%
		}

	}
%>
<div style="clear: both">
	<form action="" method="post">
		<input type="hidden" value="<%=parentPath%>" name="parent">

		<div>
			<div>Наименование</div>
			<div><input type="text" name="name" style="width: 100%;"/></div>
			<div>Описание</div>
			<div><input type="text" name="descr" style="width: 100%;"/></div>

		</div>

		<input type="submit" value="Добавить" name="save"/>

	</form>
</div>
<%!
	private void showError(String error, JspWriter out) throws IOException {
		out.print(
				"<div class=\"ui-state-error ui-corner-all\" style=\"padding: 0 .7em;\">\n" +
						"<p>\n" +
						"<span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .7em;\"></span>\n" +
						error +
						"</p>\n" +
						"</div>\n" +
						"<br/>");
	}

	private void showOk(String error, JspWriter out) throws IOException {
		out.print("<div class=\"ui-state-highlight ui-corner-all\" style=\"margin-top: 20px; padding: 0 .7em;\">\n" +
				"<p>\n" +
				"<span class=\"ui-icon ui-icon-info\" style=\"float: left; margin-right: .7em;\"></span>\n" +
				error +
				"</p>\n" +
				"</div>" +
				"<br/>");
	}

	private String translit(String text) {

		StringBuilder res = new StringBuilder();
		if (text != null) {
			for (char ch : text.toCharArray()) {
				res.append(translit(ch));
			}
		}
		return res.toString();
	}

	private String translit(char ch) {
		int i = (int) ch;
		if (i >= 'a' && i <= 'z' || i >= 'A' && i <= 'Z' || i >= '0' && i <= '9') {
			return String.valueOf(ch);
		}

		switch (ch) {
			case 'А':
				return "A";
			case 'Б':
				return "B";
			case 'В':
				return "V";
			case 'Г':
				return "G";
			case 'Д':
				return "D";
			case 'Е':
				return "E";
			case 'Ё':
				return "JO";
			case 'Ж':
				return "ZH";
			case 'З':
				return "Z";
			case 'И':
				return "I";
			case 'Й':
				return "JJ";
			case 'К':
				return "K";
			case 'Л':
				return "L";
			case 'М':
				return "M";
			case 'Н':
				return "N";
			case 'О':
				return "O";
			case 'П':
				return "P";
			case 'Р':
				return "R";
			case 'С':
				return "S";
			case 'Т':
				return "T";
			case 'У':
				return "U";
			case 'Ф':
				return "F";
			case 'Х':
				return "KH";
			case 'Ц':
				return "C";
			case 'Ч':
				return "CH";
			case 'Ш':
				return "SH";
			case 'Щ':
				return "SHH";
			case 'Ы':
				return "Y";
			case 'Э':
				return "EH";
			case 'Ю':
				return "JU";
			case 'Я':
				return "JA";
			case 'а':
				return "a";
			case 'б':
				return "b";
			case 'в':
				return "v";
			case 'г':
				return "g";
			case 'д':
				return "d";
			case 'е':
				return "e";
			case 'ё':
				return "yo";
			case 'ж':
				return "zh";
			case 'з':
				return "z";
			case 'и':
				return "i";
			case 'й':
				return "jj";
			case 'к':
				return "k";
			case 'л':
				return "l";
			case 'м':
				return "m";
			case 'н':
				return "n";
			case 'о':
				return "o";
			case 'п':
				return "p";
			case 'р':
				return "r";
			case 'с':
				return "s";
			case 'т':
				return "t";
			case 'у':
				return "u";
			case 'ф':
				return "f";
			case 'х':
				return "kh";
			case 'ц':
				return "c";
			case 'ч':
				return "ch";
			case 'ш':
				return "sh";
			case 'щ':
				return "shh";
			case 'ы':
				return "y";
			case 'э':
				return "eh";
			case 'ю':
				return "ju";
			case 'я':
				return "ja";
			default:
				return "_";
		}
	}
%>

</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mydiv {
	position: absolute;
	left:50%;
	top:50%;
	margin-left: -200px;
	margin-top: -50px;
}

.mouseOver {
	background: #708090;
	color: #FFFAFA;
}

.mouseOut {
	background: #FFFAFA;
	color: #000000;
}
</style>
<script type="text/javascript">
	function getResult() {
		var content = document.getElementById('keyword');
		//alert(content);
		if (content.value == "") {
			clearContent();
		}
		var xmlHttp = createXMLHTTP();
		//alert(xmlHttp);
		//var url = "search?keyword="+escape(content.value);
		var url = "search?keyword=" + content.value;
		url = encodeURI(url);
		url = encodeURI(url);
		xmlHttp.open('GET', url, true);
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var result = xmlHttp.responseText;
					var json = eval("(" + result + ")");
					//alert(json);
					setContent(json);

				}
			}
		};
		xmlHttp.send();
	}

	function setContent(content) {
		clearContent();
		setLocation();
		var size = content.length;
		for (var i = 0; i < size; i++) {
			var textNode = content[i];

			var tr = document.createElement("tr");
			var td = document.createElement("td");

			td.setAttribute("border", "0");
			td.setAttribute("bgcolor", "#FFFAFA");
			td.onclick = function() {
				document.getElementById("content_table_body").value = td.innerHTML;
			}
			td.mouseOver = function() {
				this.className = "mouseOver";
			};
			td.mouseOut = function() {
				this.className = "mouseOut";
			};
			td.onclick = function() {

			};
			var text = document.createTextNode(textNode);
			td.appendChild(text);
			tr.appendChild(td);
			document.getElementById("content_table_body").appendChild(tr);
		}
	}

	function createXMLHTTP() {
		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			if (!xmlHttp) {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}
		}
		return xmlHttp;
	}

	function clearContent() {	
		var tbody = document.getElementById("content_table_body");
		var size = tbody.childNodes.length;
		if (size > 0) {
			for (var i = size - 1; i >= 0; i--) {
				tbody.removeChild(tbody.childNodes[i]);
			}
		}
		document.getElementById("popDiv").style.border="none";
	}
	function setLocation() {
		var content = document.getElementById("keyword");
		var width = content.offsetWidth;
		var left = content["offsetLeft"];
		var top = content["offsetTop"];
		
		var popDiv = document.getElementById("popDiv");
		popDiv.style.border="black 1px solid";
		popDiv.style.left = left+"px";
		popDiv.style.top = top+"px";
		popDiv.style.width  = width+"px";
		document.getElementById("content_table").style.width=width+"px";
	}
</script>
</head>
<body>
	<div id="mydiv">
		<input id="keyword" type="text" size="50" onkeyup="getResult()"
			onblur="clearContent()" onfocus="getResult()" /> <input type="button"
			value="百度一下" />
		<div id="popDiv">
			<table id="content_table" border="0" bgcolor="#FFFAFA"
				cellsapcing="0" cellpadding="0">
				<tbody id="content_table_body">

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
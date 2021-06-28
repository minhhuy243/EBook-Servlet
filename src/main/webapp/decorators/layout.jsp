<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>
			<dec:title />
		</title>
		<jsp:include page="/decorators/components/link-header.jsp"></jsp:include>
		<dec:head />
	</head>

	<body>
		
		<div class="site-wrapper" id="top">
			<!-- HEADER -->
			<jsp:include page="/decorators/components/header.jsp"></jsp:include>
			<!-- END HEADER -->
	        
			<!-- PAGE CONTENT -->			
			<dec:body />
			<!-- END - PAGE CONTENT -->
		</div>
		
		<!-- SPONSOR -->
		<jsp:include page="/decorators/components/sponsor.jsp"></jsp:include>
		<!-- END SPONSOR -->
		
		<!-- FOOTER -->
		<jsp:include page="/decorators/components/footer.jsp" />
		<!-- END - FOOTER -->
		
		<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647;"><i class="ion-chevron-right"></i><i class="ion-chevron-right"></i></a>
	</body>
</html>
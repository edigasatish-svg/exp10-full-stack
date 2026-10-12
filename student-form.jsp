
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<body>
    <h2>Student Registration Form</h2>

    <form:form action="${pageContext.request.contextPath}/save"
               method="post" modelAttribute="student">

        Regno:
        <form:input path="regno" type="number" required="true"/>
        <br/><br/>

        Name:
        <form:input path="name" required="true"/>
        <br/><br/>

        CGPA:
        <form:input path="cgpa" type="number"
                    step="0.01" required="true"/>
        <br/><br/>

        <input type="submit" value="Save Student"/>
    </form:form>

    <a href="${pageContext.request.contextPath}/students">
        Back to Student List
    </a>
</body>
</html>

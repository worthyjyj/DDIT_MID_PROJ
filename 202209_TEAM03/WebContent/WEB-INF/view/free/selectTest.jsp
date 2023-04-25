<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>
 mArray = new Array("팝송","최신음악","가요");
 aArray = new Array("중세미술","근대미술","현대미술");
 
 function changeSelect(value) {
  if(value == 'music') {
   for(i=0; i<mArray.length; i++) {
    option = new Option(mArray[i]);
    document.all.medium.options[i+1] = option;
   }
  }
  if(value == 'art') {
   for(i=0; i<aArray.length; i++) {
    option = new Option(aArray[i]);
    document.all.medium.options[i+1] = option;
   }
  }
 }
</script>

<body>

<select name="big" onChange="changeSelect(value)">
 <option>대분류
 <option value="music">음악
 <option value="art">미술
</select>
<select name="medium">
 <option>중분류
</select>

</body>
</html>
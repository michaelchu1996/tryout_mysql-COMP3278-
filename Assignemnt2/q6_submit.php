<?php
$host = "sophia.cs.hku.hk"; // In CS department, the database is located in a machine called sophia.
$username="hfmchu"; // Your CSID.
$password="Asdfzxcv"; // Your MySQL password.
$database="hfmchu"; // In CS department, we create a database for you with name equal to your CSID.

$con = mysqli_connect($host,$username,$password);

mysqli_select_db($con,$database) or die( "Unable to select database".mysqli.error());

echo"<!DOCTYPE html>";
echo"<html>";
echo"<head>";
echo"<title>Q6</title>";
echo"</head>";
echo"<body>";

echo"<form action='q6.php' method='GET'>";
echo"<select name='groupID'>";
$query1="SELECT groupID, groupName FROM Vgroup;";
$result1 = mysqli_query($con,$query1) or die("FK".mysqli_error());
while($row1 = mysqli_fetch_array($result1, MYSQLI_ASSOC)){
    echo"<option value='".$row1['groupID']."'>";
    echo $row1['groupName'];
    echo"</option>";
}

echo"</select>";

echo"<input type='submit'>";
echo"</form>";

echo"</body>";
echo"</html>";

mysqli_close($con);



?>
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

echo "<p align='center'>The answer of Q6</p>";

if(isset($_GET['groupID'])){
    $query = "SELECT * FROM Member_in_group M, User U WHERE 
    M.userID = U.userID AND M.groupID = ".$_GET['groupID'].";";
}
else{
    echo"PLEASE RETURN TO q6_submit.php";
    header("location:https://i2.cs.hku.hk/~hfmchu/A2/q6_submit.php");
    exit();
}
$result = mysqli_query($con,$query) or die("no query".mysqli_error());
echo "<table border=1 width=600 align='center'>";
echo"<tr><th>userID</th><th>userName</th></tr>";
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    echo"<tr>";
    echo"<td><a href='q7.php?userID=".$row['userID']."'>".$row['userID']."</a></td>";
    echo"<td>".$row['username']."</td>";
    echo"</tr>";
}
echo"</table>";
echo"</body>";
echo"</html>";

mysqli_close($con);



?>
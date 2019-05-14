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
echo"<title>Q3</title>";
echo"</head>";
echo"<body>";

$query="SELECT merchantID, merchantName
FROM Merchant
WHERE merchantName LIKE '%store'
ORDER BY merchantID ASC;";
echo "<p align='center'>The answer of Q3</p>";

echo "<table border=1 width=600 align='center'>";
echo "<tr>";
echo "<th>merchantID</th>";
echo "<th> merchantName</th>";
echo "</tr>";
$result = mysqli_query($con,$query) or die("FK".mysqli_error());
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    echo"<tr>";
    echo"<td>".$row['merchantID']."</td>";
    echo"<td>".$row['merchantName']."</td>";
    echo"</tr>";
}
echo"</table>";
echo"</body>";
echo"</html>";

mysqli_close($con);



?>`
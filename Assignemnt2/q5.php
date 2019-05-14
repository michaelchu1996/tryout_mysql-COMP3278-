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
echo"<title>Q5</title>";
echo"</head>";
echo"<body>";

$query="SELECT t.transactionID, t.date, t.amount
FROM Transaction t, User u
WHERE u.username='tom' AND 
t.amount>10
AND t.make_userID=u.userID
ORDER BY date DESC, t.amount ASC;";
echo "<p align='center'>The answer of Q5</p>";

echo "<table border=1 width=600 align='center'>";
echo "<tr>";
echo "<th>transactionID</th>";
echo "<th>date</th>";
echo "<th>amount</th>";
echo "</tr>";
$result = mysqli_query($con,$query) or die("FK".mysqli_error());
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    echo"<tr>";
    echo"<td>".$row['transactionID']."</td>";
    echo"<td>".$row['date']."</td>";
    echo"<td>$".$row['amount']."</td>";
    echo"</tr>";
}
echo"</table>";
echo"</body>";
echo"</html>";

mysqli_close($con);



?>
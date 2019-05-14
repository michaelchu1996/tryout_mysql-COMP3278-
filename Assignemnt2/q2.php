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
echo"<title>Q2</title>";
echo"</head>";
echo"<body>";

$query="SELECT P.transactionID, T.date, T.amount,  U.username
FROM Transaction T, P2Ptransfer P, User U
WHERE T.date>='2018-05-01' AND P.transactionID=T.transactionID AND P.transferTo_userID=U.userID
ORDER BY P.transactionID DESC;";
echo "<p align='center'>The answer of Q2</p>";

echo "<table border=1 width=600 align='center'>";
echo "<tr>";
echo "<th>transcationID</th>";
echo "<th>date</th>";
echo "<th>amount</th>";
echo"<th>username</th>";
echo "</tr>";
$result = mysqli_query($con,$query) or die("FK".mysqli_error());
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    echo"<tr>";
    echo"<td>".$row['transactionID']."</td>";
    echo"<td>".$row['date']."</td>";
    echo"<td>$".$row['amount']."</td>";
    echo"<td>".$row['username']."</td>";
    echo"</tr>";
}
echo"</table>";
echo"</body>";
echo"</html>";

mysqli_close($con);



?>
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
echo"<title>Q7</title>";
echo"</head>";
echo"<body>";

echo "<p align='center'>The answer of Q7</p>";

if(isset($_GET['userID'])){
    $query = "SELECT DISTINCT T.transactionID, T.date, T.amount, P.transferTo_userID
    FROM Transaction T LEFT OUTER JOIN P2Ptransfer P ON P.transactionID = T.transactionID
     WHERE 
       T.make_userID = ".$_GET['userID'].";
    ";
}
else{
    header("location: https://i2.cs.hku.hk/~hfmchu/A2/q6.php");
    exit();
}
$result = mysqli_query($con,$query) or die("no query".mysqli_error());
echo "<table border=1 width=600 align='center'>";
echo"<tr><th>transactionID</th><th>date</th><th>amount</th><th>id or mername+loc</th></tr>";
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    echo"<tr>";
    echo"<td>".$row['transactionID']."</td>";
    echo"<td>".$row['date']."</td>";
    echo"<td>".$row['amount']."</td>";
    if($row['transferTo_userID'] == NULL){
        $query1="
        SELECT M.merchantName, S.location
        FROM Merchant M, Payment P LEFT OUTER JOIN Mobilespot S ON P.merchantID=S.merchantID
        WHERE ".$row['transactionID']." = P.transactionID AND
        (P.merchantID = M.merchantID AND P.spotID = S.spotID)";
        $result1 = mysqli_query($con,$query1) or die("no query".mysqli_error());
        while($row1 = mysqli_fetch_array($result1, MYSQLI_ASSOC)){
            echo"<td>".$row1['merchantName']." ".$row1['location']."</td>";
        }
    }
    else{
        echo"<td><a href='q7.php?userID=".$row['transferTo_userID']."'>".$row['transferTo_userID']."</a></td>";
    }
    echo"</tr>";
}
echo"</table>";
echo"</body>";
echo"</html>";

mysqli_close($con);



?>
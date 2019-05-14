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
echo"<title>Q9</title>";
echo"</head>";
echo"<body>";

echo "<p align='center'>The answer of Q9</p>";


if(isset($_GET['merchantID'])){
    echo"<p align='left'>MerchantID = ".$_GET['merchantID']."</p>";
    $query = "SELECT spotID, location FROM Mobilespot WHERE 
    merchantID = ".$_GET['merchantID']."
    ORDER BY spotID DESC;";
    $revenueq = "SELECT P.spotID, SUM(T.amount)
    FROM Payment P, Transaction T
    WHERE P.merchantID = ".$_GET['merchantID']." AND T.transactionID = P.transactionID
    GROUP BY P.spotID;
     ";
}
else{
    header("location: https://i2.cs.hku.hk/~hfmchu/A2/q8.php");
    exit();
}
$result = mysqli_query($con,$query) or die("no query".mysqli_error());
echo "<table border=1 width=600 align='center'>";
echo"<tr><th>spotID</th><th>revenue</th><th>location</th></tr>";
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    echo"<tr>";
    echo"<td>".$row['spotID']."</td>";
    $test=0;
    $result2=mysqli_query($con, $revenueq) or die("no query2".mysqli_error());
    while($row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC)){
        if($row['spotID']==$row2['spotID']){
            echo"<td>$".$row2['SUM(T.amount)']."</td>";
            $test=1;
        }
    }
    if($test==0){
        echo"<td>$0</td>";
    }
    echo"<td>".$row['location']."</td>";
    echo"</tr>";
}
echo"</table>";
echo "<table border=1 width=600 align='center'>";
echo"<br /><br /><br /><br />";
echo"<p> TABLE 2</p>";
$querytable2="
SELECT T.transactionID, P.spotID, T.date, T.amount
FROM Transaction T, Payment P
WHERE T.transactionID = P.transactionID
AND P.merchantID = ".$_GET['merchantID'].";
";
echo"<tr><th>transcationID</th><th>spotID</th><th>date</th><th>amount</th></tr>";
$result3 = mysqli_query($con, $querytable2) or die ("no query3".mysqli_error());
while($row3=mysqli_fetch_array($result3, MYSQLI_ASSOC)){
    echo"<tr>";
    echo"<td>".$row3['transactionID']."</td>";
    echo"<td>".$row3['spotID']."</td>";
    echo"<td>".$row3['date']."</td>";
    echo"<td>$".$row3['amount']."</td>";

}

echo"</table>";
echo"</body>";
echo"</html>";

mysqli_close($con);



?>
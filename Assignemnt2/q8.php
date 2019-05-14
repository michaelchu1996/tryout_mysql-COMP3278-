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
echo"<title>Q8</title>";
echo"</head>";
echo"<body>";

echo "<p align='center'>The answer of Q8</p>";

$countspot= "
SELECT M.merchantID, COUNT(M.spotID)
FROM Mobilespot M
GROUP BY M.merchantID;";


$namedisplay="
SELECT * FROM Merchant;";
$nameresult= mysqli_query($con,$namedisplay) or die("no query".mysqli_error());

$amountdisplay="
SELECT P.merchantID, SUM(T.amount)
FROM Payment P, Transaction T
WHERE T.transactionID = P.transactionID
GROUP BY P.merchantID;
";

echo "<table border=1 width=600 align='center'>";
echo"<tr><th>merchantID</th><th>merchantName</th><th>numberOfSpots</th><th>totalRevenues</th></tr>";
while($row = mysqli_fetch_array($nameresult, MYSQLI_ASSOC)){
    echo"<tr>";
    
    echo"<td><a href='q9.php?merchantID=".$row['merchantID']."'>".$row['merchantID']."</td>";
    echo"<td>".$row['merchantName']."</td>";
    $countresult = mysqli_query($con,$countspot) or die("no query".mysqli_error());
    while($row2=mysqli_fetch_array($countresult, MYSQLI_ASSOC)){
        if($row['merchantID']==$row2['merchantID']){
            echo"<td>".$row2['COUNT(M.spotID)']."</td>";
        }
    }
    $test=0;
    $amountresult=mysqli_query($con,$amountdisplay) or die("no query".mysqli_error());
    while($row3=mysqli_fetch_array($amountresult, MYSQLI_ASSOC)){
        if($row['merchantID']==$row3['merchantID']){
            if($row3['SUM(T.amount)']!=NULL){
            echo"<td>$".$row3['SUM(T.amount)']."</td>";
            $test=1;
        }
        }
    }
    if($test==0){
        echo"<td>$0</td>";
    }
    echo"</tr>";
}
echo"</table>";
echo"</body>";
echo"</html>";

mysqli_close($con);



?>
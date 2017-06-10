
<html>
 <head>
 <meta charset="UTF-8"> 
 </head>
 <body>

<?php

/*$mysqli = new mysqli("127.0.0.1", "admin", "dasgleiche", "sas");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
echo $mysqli->host_info . "\n";
exit;*/
require_once ('dbkonfiguration.php');

$db_link = mysqli_connect (
                     MYSQL_HOST, 
                     MYSQL_BENUTZER, 
                     MYSQL_KENNWORT, 
                     MYSQL_DATENBANK
                    );

$sql = "SELECT * FROM lehrer";
 
$db_erg = mysqli_query( $db_link, $sql );
if ( ! $db_erg )
{
  die('Ungültige Abfrage: ' . mysqli_error());
}
 
echo '<table border="1">';
while ($zeile = mysqli_fetch_array( $db_erg, MYSQL_ASSOC))
{
  echo "<tr>";
  echo "<td>". $zeile['Anr'] . "</td>";
  echo "<td>". $zeile['Nachname'] . "</td>";
  echo "<td>". $zeile['Vorname'] . "</td>";
  echo "<td>". $zeile['Fach'] . "</td>";
  echo "</tr>";
}
echo "</table>";
 
mysqli_free_result( $db_erg );
?>
</body>
</html>


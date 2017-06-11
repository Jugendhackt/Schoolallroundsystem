<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8"> 
 </head>
<body>
 <h1>Lehrerliste</h1>

<?php

/*$mysqli = new mysqli("127.0.0.1", "sas", "dasgleiche", "sas");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
echo $mysqli->host_info . "\n";
exit;*/
require_once ('dbkonfiguration.php');

/*$db_link = mysqli_connect (
                     MYSQL_HOST, 
                     MYSQL_BENUTZER, 
                     MYSQL_KENNWORT, 
                     MYSQL_DATENBANK
                    );*/
					$db_link = mysqli_connect (
                     '127.0.0.1', 
                     'sas', 
                     'dasgleiche', 
                     'sas'
                    );
if (!$db_link )
{
    // hier sollte dann später dem Programmierer eine
    // E-Mail mit dem Problem zukommen gelassen werden
    die('keine Verbindung möglich: ' . mysqli_error());
}

$sql = "SELECT f.Name AS Fachname, l1.Vorname AS Vorname_krank, l1.Name AS Name_krank, l2.Vorname AS Vorname_vertretung, l2.Name AS Name_vertretung, k.Klasse FROM vertretung v
		INNER JOIN fach f ON v.Fach_id = f.id
		INNER JOIN lehrer l1 ON l1.id = v.Lehrer_k
		INNER JOIN lehrer l2 ON l2.id = v.Lehrer_v
		INNER JOIN klasse k ON k.id = v.Klasse_id
		";
 
$db_erg = mysqli_query( $db_link, $sql );
if ( ! $db_erg )
{
  die('Ungültige Abfrage: ' . mysqli_error() . "!");
}
 
echo '<table border="1">';
while ($zeile = mysqli_fetch_array( $db_erg, MYSQL_ASSOC))
{
//var_dump($zeile);exit;	
	echo "<tr class='".$zeile['Klasse'] ."'>";
echo "<td>". $zeile['Vorname_krank'] . " " . $zeile['Name_krank'] . "</td>";
  //echo "<td>". $zeile[''] . "</td>";
  echo "<td>". $zeile['Fachname'] . "</td>";
 echo "<td>". $zeile['Vorname_vertretung'] . " " . $zeile['Name_vertretung'] . "</td>";
	 echo "<td>". $zeile['Klasse'] . "</td>";
 // echo "<td>". $zeile['Fach'] . "</td>";
  echo "</tr>";
}
echo "</table>";
 
mysqli_free_result( $db_erg );
?>
</body>
</html>



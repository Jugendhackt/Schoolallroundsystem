<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="../style.css">
		
    <title>Vertretungsplan im Schoolallroundsystem</title>	
	
<style>
body {font-family: Arial;}
table {
	border-collapse: collapse; 
	width: 100%;
	}
td, th {
	border: 1px solid grey; 
	text-align: center; 
	padding: 8px;
	}
tr:nth-child(even) {
    background-color: #dddddd;
}
.invisible {display: none;};
.visible {display: block};
</style>
<script>
function zeigeAuswahl() {
var klasse = document.getElementById("klassennum").value + document.getElementById("klassenname").value;

	if(klasse == "AlleAlle") {
		for(q = 0; q < document.getElementsByTagName("TR").length; q++) {
			document.getElementsByTagName("TR")[q].style.display = "table-row";
		}
	}
	else {
		for(k = 1; k < document.getElementsByTagName("TR").length; k++) {
			document.getElementsByTagName("TR")[k].style.display = "none";
		}
		for(i = 0; i < document.getElementsByClassName(klasse).length; i++) {
			document.getElementsByClassName(klasse)[i].style.display = "table-row";
		}
	}
}

</script>
</head>
<body onload="zeigeAuswahl();">
<h1>Vertretungsplan</h1>
Wähle deine Klasse: 
<select id="klassennum">
	<option>Alle</option>
	<option>5</option>
	<option>6</option>
	<option>7</option>
	<option>8</option>
	<option>9</option>
	<option>10</option>
	<option>11</option>
	<option>12</option>
</select>
<select id="klassenname">
	<option>Alle</option>
	<option>a</option>
	<option>b</option>
	<option>c</option>
	<option>d</option>
	<option>e</option>
</select>
<button onclick="zeigeAuswahl();">Suchen</button>
<!--Suche: <input type="text" id="ankersuche"></input><button onclick="ankersprung();">Suchen</button>-->

<?php

/*$mysqli = new mysqli("127.0.0.1", "sas", "dasgleiche", "sas");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
echo $mysqli->host_info . "\n";
exit;*/
//require_once ('dbkonfiguration.php');

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
if ( $db_link )

	
{
  //  echo 'Verbindung erfolgreich: ';
    //print_r( $db_link);
}
else
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
 
echo '<table>'; 
echo '<tr>';
		echo '<th>Kranker Lehrer</th>';
		echo '<th>Fach</th>';
		echo '<th>Vertretungslehrer</th>';
		echo '<th>Klasse</th>';
	echo '</tr>';


while ($zeile = mysqli_fetch_array( $db_erg, MYSQL_ASSOC))
{
//var_dump($zeile);exit;	
	echo "<tr class='".$zeile['Klasse'] ."'>";
echo "<td>" . $zeile['Vorname_krank'] . " " . $zeile['Name_krank'] . "</td>";
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
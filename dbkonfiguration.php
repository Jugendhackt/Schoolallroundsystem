<?php
// die Konstanten auslagern in eigene Datei
// die dann per require_once ('konfiguration.php'); 
// geladen wird.
 
// Damit alle Fehler angezeigt werden
error_reporting(E_ALL);
 
// Zum Aufbau der Verbindung zur Datenbank
// die Daten erhalten Sie von Ihrem Provider
define ( 'MYSQL_HOST',      '127.0.0.1' );
 
// bei XAMPP ist der MYSQL_Benutzer: root
define ( 'MYSQL_BENUTZER',  'sas' );
define ( 'MYSQL_KENNWORT',  'dasgleiche' );
// für unser Bsp. nennen wir die DB adressverwaltung
define ( 'MYSQL_DATENBANK', 'sas' );
?>
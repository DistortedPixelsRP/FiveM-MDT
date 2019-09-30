<?php
//MySQL Database
$servername = "localhost"; //URL to MySQL server. If running locally use localhost
$username = ""; //Username used to login to server
$password = ""; //Password used to login to server
$dbname = "essentialmode"; //Name of the database with the provided SQL files

//Steam API key
//Get a Steam API key from https://steamcommunity.com/dev/apikey and enter it here. Don't know why I added this, may get removed in next version.
$SteamAPI_KEY = "";

//FiveM Server
//Enter FiveM server rcon password. If you are running multiple servers they all must have the same rcon password.
$rconPW = "Jeff";

//Only displays server if the FiveM server is online. Requires rcon to be enabled.
$serverCheck = false;

//Role assignment
//Enabled/Disabled
$roleAssignmentEnabled = true;

//Website Url
$defaultURL = "//localhost/mdt2"; //Url to where the MDT pages can be found. MUST INCLUDE "//" BEFORE URL ex: //test.com/mdt

//Top bar title
$topTitle = "MDT";

//Enable Account Code.
//When enabled account creation requires a code given by an admin to work. Best for private communities.
//true = enable, false = disabled
$enableCode = false;





//DON'T TOUCH
$conn = mysqli_connect($servername, $username, $password, $dbname);
?>
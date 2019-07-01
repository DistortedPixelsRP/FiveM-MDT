<?php
//MySQL Database
$servername = "localhost"; //URL to MySQL server. If running locally use localhost
$username = "root"; //Username used to login to server
$password = "CustomCad12"; //Password used to login to server
$dbname = "mdt"; //Name of the database with the provided SQL files

$conn = mysqli_connect($servername, $username, $password, $dbname); //DON'T TOUCH

//Website Url
$defaultURL = "//localhost/mdt"; //Url to where the MDT pages can be found. MUST INCLUDE "//" BEFORE URL ex: //test.com/mdt

//Top bar title
$topTitle = "CAD";

//Enable Account Code.
//When enabled account creation requires a code given by an admin to work. Best for private communities.
//true = enable, false = disabled
$enableCode = false;

//dont touch
echo "<script>console.log('%cWARNING!', 'color: red; -webkit-text-stroke: 1.5px black; font-size:4em; font-weight: 600;');console.log('%cThe console is for developer and server owner use only! Using the console without premission will lead to repercussions!', 'color: black; font-size:2em; font-weight: 600;');</script>"
?>
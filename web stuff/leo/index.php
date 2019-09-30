<?php
include('../settings.php');
include "../include/top.php";

//session_start();
if (empty($_SESSION['user_loggedIn'])) {
    header("Location:$defaultURL");
    die("You must login first");
}
include('../settings.php');
?>
<html>
<body bgcolor="#fff">
<div style="display: none;"><?php include "../utilities/api.php"; ?></div>
<title>Law Enforcement</title>
<link rel="stylesheet" type="text/css" href="<?php echo $defaultURL;?>/modal.css">
<link rel="stylesheet" type="text/css" href="style.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="department"><b>Current Department:</b> <?php echo $_SESSION['departmentName'] . " - " . $_SESSION['divisonName'];?></div>

<div id="sidebar">
<button onclick="openScreen('#dashboard')">Dashboard</button>
<button style="margin-top: 75px;" onclick="openScreen('#nameSearch')">Name Search</button>
<button style="margin-top: 150px;" onclick="openScreen('#plateSearch')">Plate Search</button>
<button style="margin-top: 225px;" onclick="openScreen('#citation')">Citation</button>
<button style="margin-top: 300px;" onclick="openScreen('#warning')">Written Warning</button>
<button style="margin-top: 375px;" onclick="openScreen('#arrest')">Arrest Report</button>
<button style="margin-top: 450px;" onclick="penalOpen()">Penal Code</button>
</div>

<div id="statusbar">
    <button id="10-6">10-6</button>
    <button id="10-7">10-7</button>
    <button id="10-8">10-8</button>
    <button id="10-15">10-15</button>
    <button id="10-23">10-23</button>
    <button id="10-97">10-97</button>
    <button id="10-42">10-42</button>
</div>

<div id="dashboard" style="display: block !important;" class="screen">
    <h1 id="noCallAlert">No Call Assigned</h1>
    <div id="call">
        <h1 id="call_name"></h1>
        <br>
        <h2 id="call_info"></h2>
        <br>
        <div id="call_details"></div>
        <br>
        <h2>Shared Note pad</h2><div id='status'></div>
        <textarea id='call_notes'></textarea>
    </div>
</div>

<div id="nameSearch" class="screen">
    <?php include "../include/nameSearch.html"; ?>
</div>

<div id="plateSearch" class="screen">
    <?php include "../include/plateSearch.html"; ?>    
</div>

<!-- Citation -->
<div id="citation" class="screen">
    <h1>Citation</h1>
    <alert></alert>
    <!--Name Search-->
    <div id="citationInput">
        <div id="inputDiv">
            <label>First Name</label>
            <input type="text" id="first" placeholder="First">
        </div>
        <div id="inputDiv">
            <label>Last Name</label>
            <input type="text" id="last" placeholder="Last">
        </div>
        <br>
        <i id="searchSuccess" class="fa fa-lg" aria-hidden="true"></i>
        <button id="searchName">Search</button>
        <br>
    </div>
    <br>
    <br>

    
    <!--Plate Search-->
        <div id="citationInput">
        <!--Plate Search-->
        <div id="inputDiv">
            <label>Plate</label>
            <input type="text" id="plate" plateId="0" placeholder="Plate">
        </div>
        <br>
        <i id="searchPlateSuccess" class="fa fa-lg" aria-hidden="true"></i>
        <button id="searchPlate">Search</button>
        <br>
    </div>
    <br>
    <br>
    
    <!--Vehicle Description-->
    <div id="citationInput">
        <div id="inputDiv">
            <label>Vehicle Description</label>
            <input type="text" id="description" placeholder="Description" style="width: 275%;">
        </div>
        <br>
    </div>

    
    <!--List-->
    <div id="citationList">
        <table id="citationListTable">
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th colspan="2">Punishment</th>
            </tr>
        </table>
        <button style="margin-top: 5px;" onclick="citationOpen()">Add</button>
    </div>

    <div id="citationInput" style="margin-top: 20px;">
        <!--Location-->
        <div id="inputDiv">
            <label>Location</label>
            <input type="text" id="location" placeholder="Location" style="width: 275%;">
        </div>
        <br>
        <br>
    </div>
    <br>
    <br>

    <!--Fine-->
    <div id="citationInput">
        <div id="inputDiv">
            <label>Total Fine</label>
            <input type="number" id="fine" placeholder="Fine" value="0" min="0">
        </div>
        <br>
        <br>
    </div>
    <br>
    <br>
    
    <div id="citationInput" style="margin-bottom: 50px;">
    <button id="submit">Submit</button>
    </DIV>
</div>

<!-- Arrest -->
<div id="arrest" class="screen">
    <h1>Arrest Report</h1>
    <alert></alert>
    <!--Name Search-->
    <div id="arrestInput">
        <div id="inputDiv">
            <label>First Name</label>
            <input type="text" id="first" placeholder="First">
        </div>
        <div id="inputDiv">
            <label>Last Name</label>
            <input type="text" id="last" placeholder="Last">
        </div>
        <br>
        <i id="searchSuccess" class="fa fa-lg" aria-hidden="true"></i>
        <button id="searchName">Search</button>
        <br>
    </div>
    <br>
    <br>


    <!--Plate Search-->
    <div id="arrestInput">
        <!--Plate Search-->
        <div id="inputDiv">
            <label>Plate</label>
            <input type="text" id="plate" plateId="0" placeholder="Plate">
        </div>
        <br>
        <i id="searchPlateSuccess" class="fa fa-lg" aria-hidden="true"></i>
        <button id="searchPlate">Search</button>
        <br>
    </div>
    <br>
    <br>

    <!--Vehicle Description-->
    <div id="arrestInput">
        <div id="inputDiv">
            <label>Vehicle Description</label>
            <input type="text" id="description" placeholder="Description" style="width: 275%;">
        </div>
        <br>
    </div>


    <!--List-->
    <div id="arrestList">
        <table id="arrestListTable">
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th colspan="2">Punishment</th>
            </tr>
        </table>
        <button style="margin-top: 5px;" onclick="arrestOpen()">Add</button>
    </div>

    <div id="arrestInput" style="margin-top: 20px;">
        <!--Location-->
        <div id="inputDiv">
            <label>Location</label>
            <input type="text" id="location" placeholder="Location" style="width: 275%;">
        </div>
        <br>
        <br>
    </div>
    <br>
    <br>

    <!--Fine-->
    <div id="arrestInput">
        <div id="inputDiv">
            <label>Total Fine</label>
            <input type="number" id="fine" placeholder="Fine" value="0" min="0">
        </div>
        <br>
        <br>
    </div>
    <br>
    <br>
    
    <!--Jail Time-->
    <div id="arrestInput">
        <div id="inputDiv">
            <label>Jail Time</label>
            <input type="number" id="jail" placeholder="Time" value="0" min="0">
        </div>
        <br>
        <br>
    </div>
    <br>
    <br>

    <div id="arrestInput" style="margin-bottom: 50px;">
        <button id="submit">Submit</button>
    </DIV>
</div>

<!-- Warning -->
<div id="warning" class="screen">
    <h1>Warning</h1>
    <alert></alert>
    <!--Name Search-->
    <div id="warningInput">
        <div id="inputDiv">
            <label>First Name</label>
            <input type="text" id="first" placeholder="First">
        </div>
        <div id="inputDiv">
            <label>Last Name</label>
            <input type="text" id="last" placeholder="Last">
        </div>
        <br>
        <i id="searchSuccess" class="fa fa-lg" aria-hidden="true"></i>
        <button id="searchName">Search</button>
        <br>
    </div>
    <br>
    <br>


    <!--Plate Search-->
    <div id="warningInput">
        <!--Plate Search-->
        <div id="inputDiv">
            <label>Plate</label>
            <input type="text" id="plate" plateId="0" placeholder="Plate">
        </div>
        <br>
        <i id="searchPlateSuccess" class="fa fa-lg" aria-hidden="true"></i>
        <button id="searchPlate">Search</button>
        <br>
    </div>
    <br>
    <br>

    <!--Vehicle Description-->
    <div id="warningInput">
        <div id="inputDiv">
            <label>Vehicle Description</label>
            <input type="text" id="description" placeholder="Description" style="width: 275%;">
        </div>
        <br>
    </div>


    <!--List-->
    <div id="warningList">
        <table id="warningListTable">
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th colspan="2">Punishment</th>
            </tr>
        </table>
        <button style="margin-top: 5px;" onclick="warningOpen()">Add</button>
    </div>

    <div id="warningInput" style="margin-top: 20px;">
        <!--Location-->
        <div id="inputDiv">
            <label>Location</label>
            <input type="text" id="location" placeholder="Location" style="width: 275%;">
        </div>
        <br>
        <br>
    </div>
    <br>
    <br>

    <div id="warningInput" style="margin-bottom: 50px;">
        <button id="submit">Submit</button>
    </DIV>
</div>

<!-- Modals -->
<div id="penalModal" class="modal">
    <center>
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>

            
            <table id="penalTable" style="">
                <?php 
                    $query = "SELECT id, name FROM mdt_penal_category";

                $result = $conn->query($query);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr class='header expand' id='" . $row['id'] . "'><th colspan='3'>" . $row['name'] . "</th></tr>";
                }}
                    ?>
            </table>

            
        </div>
    </center>
</div>


<div id="citationModal" class="modal">
    <center>
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>

            
            <table id="citationTable" style="">
                <?php 
                    $query = "SELECT id, name FROM mdt_penal_category";

                $result = $conn->query($query);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr class='header expand' id='" . $row['id'] . "'><th colspan='3'>" . $row['name'] . "</th></tr>";
                }}
                    ?>
            </table>

            
        </div>
    </center>
</div>

<div id="warningModal" class="modal">
    <center>
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>

            
            <table id="warningTable" style="">
                <?php 
                    $query = "SELECT id, name FROM mdt_penal_category";

                $result = $conn->query($query);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr class='header expand' id='" . $row['id'] . "'><th colspan='3'>" . $row['name'] . "</th></tr>";
                }}
                    ?>
            </table>

            
        </div>
    </center>
</div>

<div id="arrestModal" class="modal">
    <center>
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>


            <table id="arrestTable" style="">
                <?php
                $query = "SELECT id, name FROM mdt_penal_category";

                $result = $conn->query($query);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr class='header expand' id='" . $row['id'] . "'><th colspan='3'>" . $row['name'] . "</th></tr>";
                    }
                }
                ?>
            </table>


        </div>
    </center>
</div>


<div id="nameModal" class="modal">
    <center>
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>


            <table id="civTable" style="">
            </table>


        </div>
    </center>
</div>

<!-- Scripts -->
<script src="../utilities/department/leo.js"></script>
<script src="../utilities/custom.js"></script>
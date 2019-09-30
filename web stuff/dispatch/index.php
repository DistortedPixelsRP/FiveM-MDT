<?php
include('../settings.php');
include "../include/top.php";

$_SESSION['departmentName'] = 'Dispatch';
$_SESSION['divisonName'] = '';

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
<title>Dispatch</title>
<link rel="stylesheet" type="text/css" href="<?php echo $defaultURL;?>/modal.css">
<link rel="stylesheet" type="text/css" href="style.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div id="sidebar">
<button onclick="openScreen('#dashboard')">Dashboard</button>
<button style="margin-top: 75px;" onclick="openScreen('#nameSearch')">Name Search</button>
<button style="margin-top: 150px;" onclick="openScreen('#plateSearch')">Plate Search</button>
<button style="margin-top: 225px;" onclick="penalOpen()">Penal Code</button>
<button id="signal" style="margin-top: 300px;" onclick="signal()">Signal 100</button>
</div>

<!-- Call Creation -->
<div id="call">
        <h1>Create Call</h1>
        <p><alert></alert></p>
        <div id="callInput">
        <div id="inputDiv">
        <label>Call Type</label>
        <select id="type">
            <option disabled hidden selected value='Choose Civilian'>Call Type</option>
            <?php 
            $query = "SELECT id, name FROM mdt_call_type";

            $result = $conn->query($query);

            if ($result->num_rows > 0) {
                // output data of each row
                while ($row = $result->fetch_assoc()) {
                    echo "<option>"  . $row['name'] . "</option>";
                }
            }
            ?>
        </select>
        </div>
        <br>
        <div id="inputDiv">
            <label>Location</label>
            <input type="text" id="location" placeholder="Location">
        </div>
        <br>
        <div id="inputDiv">
            <label>Postal Code</label>
            <input type="text" id="postal" placeholder="Postal">
        </div>
        <br>
        <div id="inputDiv">
            <label>Description</label>
            <textarea id='description' style='resize:vertical'></textarea>
        </div>
        <br>
        <div id="inputDiv">
            <button id="create">Create</button>
        </div>
</div>
</div>

<!-- Main dashboard -->
<div id="dashboard" style="display: block !important;" class="screen">
    <div id="openCall">
        <h3>Open Calls</h3>
        <table id="openCallTable">
            <tr>
                <th>Call #</th>
                <th>Type</th>
                <th colspan="2">Location</th>
            </tr>
        </table>
    </div>
    
    
    <div id="units">
        <h3>Units</h3>
        <table id="unitTable">
            <tr id='34'>
                <th colspan='2'>Unit #</th>
                <th>Type</th>
                <th>Status</th>
                <th>Call</th>
            </tr>
        </table>
    </div>
</div>

<!-- Name Search -->
<div id="nameSearch" class="screen">
    <?php include "../include/nameSearch.html"; ?>
</div>

<!-- Plate Search -->
<div id="plateSearch" class="screen">
    <?php include "../include/plateSearch.html"; ?>      
</div>

<!-- Modals -->
<div id="nameModal" class="modal">
    <center>
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>


            <table id="civTable" style="">
            </table>


        </div>
    </center>
</div>

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
                    }
                }
                ?>
            </table>


        </div>
    </center>
</div>

<div id="clearModal" class="modal">
    <center>
        <div class="modal-content">
            <h1>Are you sure you want to clear this call and mark all units 10-8?</h1>
            <button id="yes">Yes</button>
            <button onclick="closeModal()">Cancel</button>
        </div>
    </center>
</div>

<div id="logoutModal" class="modal">
    <center>
        <div class="modal-content">
            <h1>Are you sure you want to logout </h1><br><h1 style='text-decoration: underline;' id="name"></h1>
            <button id="yes">Yes</button>
            <button onclick="closeModal()">Cancel</button>
        </div>
    </center>
</div>

<div id="editModal" class="modal">
        <div class="modal-content">
            <div id="callInput">
                <div id="inputDiv">
                    <label>Call Type</label>
                    <select id="type">
                        <option disabled hidden selected value='Call Type'>Call Type</option>
                        <?php
                        $query = "SELECT id, name FROM mdt_call_type";

                        $result = $conn->query($query);

                        if ($result->num_rows > 0) {
                            // output data of each row
                            while ($row = $result->fetch_assoc()) {
                                echo "<option value='" . $row['name'] . "'>" . $row['name'] . "</option>";
                            }
                        }
                        ?>
                    </select>
                </div>
                <br>
                <div id="inputDiv">
                    <label>Location</label>
                    <input type="text" id="location" placeholder="Location">
                </div>
                <br>
                <div id="inputDiv">
                    <label>Description</label>
                    <textarea id='description' style='resize:vertical'></textarea>
                </div>
                <br>
                <div id="inputDiv">
                    <button id="edit">Edit</button>
                    <button onclick="closeModal()">Cancel</button>
                </div>
            </div>
        </div>
</div>

<!-- Scripts -->
<script src="../utilities/department/dispatch.js"></script>
<script src="../utilities/custom.js"></script>
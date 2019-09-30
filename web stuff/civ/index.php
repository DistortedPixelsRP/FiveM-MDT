<?php
include('../settings.php');
include "../include/topCiv.php";

if (empty($_SESSION['user_loggedIn'])) {
    header("Location:$defaultURL");
    die("You must login first");
}
?>
<html>
<body bgcolor="#fff">
<link rel="stylesheet" type="text/css" href="stylenew.css">
<title>Civilian</title>

<div id="sidebar">
<button onclick="openScreen('#info')">Information</button>
<button style="margin-top: 75px;" onclick="openScreen('#lic')">Licenses</button>
<button style="margin-top: 150px;" onclick="openScreen('#medical')">Medical Information</button>
<button style="margin-top: 225px;" onclick="openScreen('#warrant')">Warrants</button>
<button style="margin-top: 300px;" onclick="openScreen('#logs')">Logs</button>
<button style="margin-top: 375px;" onclick="openScreen('#veh')">Vehicles</button>
<button style="margin-top: 450px;" onclick="penalOpen()">Penal Code</button>
</div>

<div id="civSelect">
    <select  onchange="getCiv();">
        <option disabled selected value='none'>Civilian List</option>
        <?php 
        $query = "SELECT id, first, last FROM mdt_characters WHERE ownerID='" . $_SESSION['user_id'] . "'";

        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            // output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<option value='" . $row['id'] . "'>"  . $row['first'] . " " . $row['last'] . "</option>";
            }
        }
        ?>
    </select>
    <button onclick="newCharacterOpen();">+</button>
    <button style="margin-left: 60px; width: auto; display: none;" id="deleteCiv" onclick="deleteCiv();">Delete</button>
</div>

<div id="info" class="screen">
    <h1>Information</h1>
    <div id="inputDiv">
        <label>First Name</label>
        <input type="text" id="first" placeholder="First">
    </div>
    
    <div id="inputDiv">
        <label>Last Name</label>
        <input type="text" id="last" placeholder="Last">
    </div>
    
    <div id="inputDiv">
        <label>Date of Birth</label>
        <input type="date" id="dob" name="dob">
    </div>
   
    
    <div id="inputDiv">
        <label>Gender</label>
        <select id="gender" name="gender">
            <option disabled selected>Gender</option>
            <option>Male</option>
            <option>Female</option>
        </select>
    </div>
    
    <div id="inputDiv">
        <label>Address</label>
        <input type="text" id="address" placeholder="Address">
    </div>
    
    <button class="save mediumButton" onclick="editCiv()">Save</button>
</div>

<div id="veh" class="screen">
    <h1>Vehicles</h1>
    
    <button class="mediumButton" style="margin-bottom: 25px;" onclick="addVehOpen()">Add</button>
    
    <table id="vehTable">
        <tr id="0">
            <th>Name</th>
            <th>Plate</th>
            <th>Details</th>
            <th>Registration</th>
            <th>Insurance</th>
        </tr>
    </table>
</div>

<div id="lic" class="screen">
    <h1>Licenses</h1>
    <table id="licTable">
        <tr>
            <th>Selected</th>
            <th>Name</th>
            <th>Type</th>
            <th>Status</th>
        </tr>
        <?php 
            $query = "SELECT id, name, type, status FROM mdt_licenses";

            $result = $conn->query($query);

            if ($result->num_rows > 0) {
                // output data of each row
                while ($row = $result->fetch_assoc()) {
                    echo "<tr id='" . $row['id'] . "'>";
                    echo "<td><input id='owned' type='checkbox'></td>";
                    echo "<td id='name'>" . $row['name'] . "</td>";
                    echo "<td><select id='type'>";
                    foreach (json_decode($row['type']) as $type) {
                        echo "<option>" . $type .  "</option>";
                    }
                    echo "</select></td>";
                    echo "<td><select id='status'>";
                    foreach (json_decode($row['status']) as $status) {
                        echo "<option>" . $status .  "</option>";
                    }
                    echo "</select></td>";
                    echo "</tr>";
                }
            }
        ?>
    </table>
    
    <button class="save mediumButton" onclick="editCiv()">Save</button>
</div>

<div id="medical" class="screen">
    <h1>Medical Information</h1>
    <button class="mediumButton" style="margin-bottom: 25px;" onclick="addMedOpen()">Add</button>
    
    <table id="medTable">
        <tr id="0">
            <th>Name</th>
            <th>Information</th>
        </tr>
    </table>
    
    <button class="save mediumButton" onclick="editCiv()">Save</button>
</div>

<div id="warrant" class="screen">
    <h1>Warrants</h1>
    <button class="mediumButton" style="margin-bottom: 25px;" onclick="addWarrantOpen()">Add</button>
    
    <table id="warrantTable">
        <tr id="0">
            <th>Issued Date</th>
            <th>Type</th>
            <th>Reason</th>
        </tr>
    </table>
    
    <button class="save mediumButton" onclick="editCiv()">Save</button>
</div>

<div id="logs" class="screen">
    <h1>Logs</h1>
    <select id="type" onchange="logChange();">
        <optgroup label="Police">
            <option value="tickets">Citations</option>
            <option value="warnings">Warnings</option>
            <option value="arrests">Arrests</option>
        </optgroup>
        
        <optgroup label="Medical">
            <option></option>
        </optgroup>
    </select>
    
    <br>
    
    <table id="logsTable">
    </table>
    
    <button class="save mediumButton" onclick="editCiv()">Save</button>
</div>

<div id="vehModal" class="modal">
        <div class="modal-content">
            <center><h1>Register New Vehicle</h1></center> 
            
            <div id="inputDiv">
                <label>Vehicle Model</label>
                <input type="text" id="model" placeholder="Model">
            </div>
            
            <div id="inputDiv">
                <label>Vehicle Plate</label>
                <input type="text" id="plate" placeholder="Plate">
            </div>
            
            <div id="inputDiv">
                <label>Registration Status</label>
                <select id="reg">
                    <option>Valid</option>
                    <option>Expired</option>
                </select>
            </div>
            
            <div id="inputDiv">
                <label>Insurance Status</label>
                <select id="insurance">
                    <option>Valid</option>
                    <option>Expired</option>
                    <option>None</option>
                </select>
            </div>
            
            <div id="inputDiv">
                <label>Details (Color, etc...)</label>
                <textarea id="desc" style="max-height: 500px; max-width: 750px;"></textarea>
            </div>
            
            <button class="mediumButton create" onclick="addVeh()">Add</button>
        </div>
</div>

<div id="editvehModal" class="modal">
        <div class="modal-content">
            <center><h1>Edit Vehicle</h1></center> 
            
            <div id="inputDiv">
                <label>Vehicle Model</label>
                <input type="text" id="model" placeholder="Model">
            </div>
            
            <div id="inputDiv">
                <label>Vehicle Plate</label>
                <input type="text" id="plate" placeholder="Plate">
            </div>
            
            <div id="inputDiv">
                <label>Registration Status</label>
                <select id="reg">
                    <option>Valid</option>
                    <option>Expired</option>
                </select>
            </div>
            
            <div id="inputDiv">
                <label>Insurance Status</label>
                <select id="insurance">
                    <option>Valid</option>
                    <option>Expired</option>
                    <option>None</option>
                </select>
            </div>
            
            <div id="inputDiv">
                <label>Details (Color, etc...)</label>
                <textarea id="desc" style="max-height: 500px; max-width: 750px;"></textarea>
            </div>
            
            <div id="inputDiv">
                <label>Vehicle Flags</label>
                <input type="text" id="flags" placeholder="Flags">
            </div>
            
            <button class="mediumButton create" id='edit' onclick="">Edit</button>
        </div>
</div>

<div id="warrantModal" class="modal">
        <div class="modal-content">
            <center><h1>New Warrant For Arrest</h1></center> 
            
            <div id="inputDiv">
                <label>Type</label>
                <select id="type">
                    <option>Misdemeanor</option>
                    <option>Felony</option>
                </select>
            </div>
            
            <div id="inputDiv">
                <label>Reason</label>
                <textarea id="reason" style="max-height: 500px; max-width: 750px;"></textarea>
            </div>
            
            <button class="mediumButton create" onclick="addWarrant()">Add</button>
        </div>
</div>

<div id="medModal" class="modal">
        <div class="modal-content">
            <center><h1>New Medical Condition</h1></center> 
            
            <div id="inputDiv">
                <label>Condition Name</label>
                <input type="text" id="name" placeholder="Name">
            </div>
            
            <div id="inputDiv">
                <label>More Information</label>
                <textarea id="info" style="max-height: 500px; max-width: 750px;"></textarea>
            </div>
            
            <button class="mediumButton create" onclick="addMed()">Add</button>
        </div>
</div>

<div id="newModal" class="modal">
        <div class="modal-content">
            <center><h1>New Character</h1></center> 
            <div id="inputDiv">
                <label>First Name</label>
                <input type="text" id="first" placeholder="First">
            </div>

            <div id="inputDiv">
                <label>Last Name</label>
                <input type="text" id="last" placeholder="Last">
            </div>

            <div id="inputDiv">
                <label>Date of Birth</label>
                <input type="date" id="dob" name="dob">
            </div>


            <div id="inputDiv">
                <label>Gender</label>
                <select id="gender" name="gender">
                    <option disabled selected value="">Gender</option>
                    <option>Male</option>
                    <option>Female</option>
                </select>
            </div>
            
            <div id="inputDiv" style="margin-bottom: 100px;">
                <label>Address</label>
                <input type="text" id="address" placeholder="Address">
            </div>
            
            <button class="mediumButton create" onclick="createCiv()">Create</button>
        </div>
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



<!--
<script src="civ.js"></script>
-->
<script>
    if ($("#civSelect option:selected").val() === "none") {
        $(".screen").addClass("disabled");
    } else {
        $(".screen").removeClass("disabled");
    }
    
    function deleteCiv() {
        if (confirm("Are you sure you want to delete " + $("#civSelect option:selected").text() + "?")) {
            $.post("<?php echo $defaultURL; ?>/utilities/api.php",
            {
              function: 'deleteCiv',
              id: $("#civSelect option:selected").val()
            },
            function(){
                location.reload();
            });
        }
    }
    
    function logChange() {
        var type = $("#logs #type").val();
        
        $.post("<?php echo $defaultURL; ?>/utilities/api.php",
        {
          function: 'nameReport',
          name: $("#civSelect option:selected").val(),
          type: type
        },
        function(response){
            $("#logsTable").html(response);
        });
        
    }
    
function nameReportDetailed(id) {
    var type = $("#logs #type").val();
     if ($('#' + id).nextUntil('#logsTable tr.header').length === 0) {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'nameReportDetailed',
      type: type,
      id: id
    },
    function(response){
        $(response).insertAfter("#logsTable #"+id);
    });
    }
    $('#logsTable tr').not('#logsTable tr.header').remove();
}
    
function nameReport() {
    var name = $("#nameSearch input#first").attr('nameid');
    var type = $("#nameSearch #nameReportSelect option:selected" ).val();
    console.log(type);
    //var plate = $("#plateSearch input#plate").val();
    console.log(plate);
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'nameReport',
      name: name,
      type: type
    },
    function(response){
        console.log(response);
        $("#nameSearch #searchResults #nameReportTable").html(response);
    });
}
    
    function addMed() {
        var id = Number($("#medTable tr:last").attr('id')) + 1;
        var name = $("#medModal #name").val();
        var info = $("#medModal #info").val();
        $("#medTable").append("<tr id='" + id + "'><td id='name'>" + name + "</td><td id='info'>" + info + " <img class='remove' src='../img/clear.jpg' onclick='removeMed(" + id + ")'></td></tr>");
        closeModal();
    }
    
    function removeMed(id) {
        $("#medTable tr#" + id).remove();
    }
    
    function addWarrant() {
        var id = Number($("#warrantTable tr:last").attr('id')) + 1;
        var date = new Date();
        date = date.getMonth() + "/" + date.getDate() + "/" + date.getFullYear();
        var type = $("#warrantModal #type").val();
        var reason = $("#warrantModal #reason").val();
        $("#warrantTable").append("<tr id='" + id + "'><td id='date'>" + date + "</td><td id='type'>" + type + "</td><td id='reason'>" + reason + " <img class='remove' src='../img/clear.jpg' onclick='removeWarrant(" + id + ")'></td></tr>");
        closeModal();
    }
    
    function removeWarrant(id) {
        $("#warrantTable tr#" + id).remove();
    }
    
    function getVeh() {
        $.post("<?php echo $defaultURL; ?>/utilities/api.php",
        {
            function: 'getVeh',
            civID: $("#civSelect option:selected").val()

        },
        function(vehicles){
            vehicles = JSON.parse(vehicles);
            
            $("#vehTable").html("<tr id='0'><th>Name</th><th>Plate</th><th>Details</th><th>Registration</th><th>Insurance</th></tr>");
            for (i in vehicles) {
                var id = Number($("#vehTable tr:last").attr('id')) + 1;
                $("#vehTable").append("<tr id='" + vehicles[i].id + "'><td id='model'>" + vehicles[i].model + "</td><td id='plate'>" + vehicles[i].plate + "</td><td id='description'>" + vehicles[i].description + "<td id='reg'>" + vehicles[i].reg + "</td><td id='insurance'>" + vehicles[i].insurance + " <img class='remove' src='../img/clear.jpg' onclick='removeVeh(" + vehicles[i].id + ")'><img class='remove' src='../img/edit.png' onclick='editVehOpen(" + vehicles[i].id + ")'></td></tr>");
            }
            
        });
    }
    
    function addVeh() {
        var isValid = true;
        $("#vehModal input").each(function() {
           var element = $(this);
           if (element.val() == "" || element.val() == "Gender") {
               isValid = false;
           }
        });
        
        
        if (isValid) {
            var id = Number($("#vehTable tr:last").attr('id')) + 1;
            var model = $("#vehModal #model").val();
            var plate = $("#vehModal #plate").val();
            var description = $("#vehModal #desc").val();
            var reg = $("#vehModal #reg").val();
            var insurance = $("#vehModal #insurance").val();
            
            $.post("<?php echo $defaultURL; ?>/utilities/api.php",
            {
                function: 'addVeh',
                model: model,
                plate: plate,
                description: description,
                reg: reg,
                insurance: insurance,
                flags: 'None',
                civID: $("#civSelect option:selected").val()
            },
            function(){
                getVeh();
            });
            
            closeModal();
        } else {
            alert("Please fill out all fields.");
        }
    }
    
    function removeVeh(id) {
        if (confirm('Are you sure you want to un-register this vehicle?')) {
            $.post("<?php echo $defaultURL; ?>/utilities/api.php",
            {
                function: 'removeVeh',
                id: id

            },
            function(){
                getVeh();
            });
        }
    }
    
    function editVeh(id) {
        var isValid = true;
        $("#editvehModal input").each(function() {
           var element = $(this);
           if (element.val() == "" || element.val() == "Gender") {
               isValid = false;
           }
           
           
        });
        
        if (isValid) {
            var model = $("#editvehModal #model").val();
            var plate = $("#editvehModal #plate").val();
            var description = $("#editvehModal #desc").val();
            var reg = $("#editvehModal #reg").val();
            var insurance = $("#editvehModal #insurance").val();
            var flags = $("#editvehModal #flags").val();
            
            $.post("<?php echo $defaultURL; ?>/utilities/api.php",
            {
                function: 'editVeh',
                model: model,
                plate: plate,
                description: description,
                reg: reg,
                insurance: insurance,
                flags: flags,
                id: id
            },
            function(){
                getVeh();
            });
            
            closeModal();
        } else {
            alert("Please fill out all fields.");
        }
    }
    
    function editCiv() {
        var lic = [];
        $("#licTable tr:not(:first)").each(function() {
            var id = $(this).attr('id');
            if ($("#licTable tr#" + id + " #owned").prop('checked')) {
                var name = $("#licTable tr#" + id + " #name").text();
                var type = $("#licTable tr#" + id + " #type").val();
                var status = $("#licTable tr#" + id + " #status").val();
                var tempLic = {id:id,name:name,type:type,status:status};
                lic.push(tempLic);
            }
        });
        
        var med = [];
        
        $("#medTable tr:not(:first)").each(function() {
            var id = $(this).attr('id');
                var name = $("#medTable tr#" + id + " #name").text();
                var info = $("#medTable tr#" + id + " #info").text();
                var tempMed = {name:name,info:info};
                med.push(tempMed);
        });
        
        var warrant = [];
        
        $("#warrantTable tr:not(:first)").each(function() {
            var id = $(this).attr('id');
                var date = $("#warrantTable tr#" + id + " #date").text();
                var type = $("#warrantTable tr#" + id + " #type").text();
                var reason = $("#warrantTable tr#" + id + " #reason").text();
                var tempWarrant = {date:date,type:type,reason:reason};
                warrant.push(tempWarrant);
        });
        
        var vehicles = [];
        
        $("#vehTable tr:not(:first)").each(function() {
            var id = $(this).attr('id');
                var model = $("#vehTable tr#" + id + " #model").text();
                var plate = $("#vehTable tr#" + id + " #plate").text();
                var description = $("#vehTable tr#" + id + " #description").text();
                var reg = $("#vehTable tr#" + id + " #reg").text();
                var insurance = $("#vehTable tr#" + id + " #insurance").text();
                var vehID = $("#vehTable tr#" + id).attr("vehID");
                var tempVeh = {model:model,plate:plate,description:description,reg:reg,insurance:insurance,vehID:vehID};
                vehicles.push(tempVeh);
        });
        
        $.post("<?php echo $defaultURL; ?>/utilities/api.php",
        {
            function: 'editCiv',
            id: $("#civSelect option:selected").val(),
            first: $("#info #first").val(),
            last: $("#info #last").val(),
            dob: $("#info #dob").val(),
            gender: $("#info #gender").val(),
            address: $("#info #address").val(),
            lic: lic,
            med: med,
            warrant: warrant,
            vehicles: vehicles
        },
        function(response){
            var id = $("#civSelect option:selected").val();
            $("#civSelect select").html("<option disabled selected value='none'>Civilian List</option>" + response).val(id);
        });
    }
    
    function getCiv() {
        var id = $("#civSelect option:selected").val();
        getVeh();
        $("#deleteCiv").show();
        $.post("<?php echo $defaultURL; ?>/utilities/api.php",
        {
            function: 'getCiv',
            civID: id
        },
        function(response){
            var id = $("#civSelect option:selected").val();
            response = JSON.parse(response);
            $(".screen").removeClass("disabled");
            $("#info #first").val(response.first);
            $("#info #last").val(response.last);
            $("#info #dob").val(response.dob);
            $("#info #gender").val(response.gender);
            $("#info #address").val(response.address);
            $("#civSelect select").html("<option disabled selected value='none'>Civilian List</option>" + response.select).val(id);
            
            var lic = JSON.parse(response.lic);
            var med = JSON.parse(response.med);
            var warrant = JSON.parse(response.warrant);
            
            $("#licTable #owned").prop('checked', false);
            for (i in lic) {
                $("#licTable tr#" + lic[i].id + " #owned").prop('checked', true);
                $("#licTable tr#" + lic[i].id + " #type").val(lic[i].type);
                $("#licTable tr#" + lic[i].id + " #status").val(lic[i].status);
            }
            
            $("#medTable").html("<tr id='0'><th>Name</th><th>Information</th></tr>");
            for (i in med) {
                var id = Number($("#medTable tr:last").attr('id')) + 1;
                $("#medTable").append("<tr id='" + id + "'><td id='name'>" + med[i].name + "</td><td id='info'>" + med[i].info + "<img class='remove' src='../img/clear.jpg' onclick='removeMed(" + id + ")'></td></tr>");
            }
            
            $("#warrantTable").html("<tr id='0'><th>Issued Date</th><th>Type</th><th>Reason</th></tr>");
            for (i in warrant) {
                var id = Number($("#warrantTable tr:last").attr('id')) + 1;
                $("#warrantTable").append("<tr id='" + id + "'><td id='date'>" + warrant[i].date + "</td><td id='type'>" + warrant[i].type + "</td><td id='reason'>" + warrant[i].reason + " <img class='remove' src='../img/clear.jpg' onclick='removeWarrant(" + id + ")'></td></tr>");
            }
            
            logChange();
        });
    }
    
    function createCiv() {
        var isValid = true;
        $("#newModal input").each(function() {
           var element = $(this);
           if (element.val() == "" || element.val() == "Gender") {
               isValid = false;
           }
        });
        
        $("#newModal option:selected").each(function() {
           var element = $(this);
           if (element.val() == "" || element.val() == null) {
               isValid = false;
               console.log(element.text());
           }
        });
        
        if (isValid) {
            $.post("<?php echo $defaultURL; ?>/utilities/api.php",
            {
                function: 'createCiv',
                first: $("#newModal #first").val(),
                last: $("#newModal #last").val(),
                dob: $("#newModal #dob").val(),
                gender: $("#newModal #gender").val(),
                address: $("#newModal #address").val()

            },
            function(response){
                $("#civSelect select").html(response);
            });
            closeModal();
        } else {
            alert("Please fill out all fields.");
        }
    }
</script>
<script>
$('#penalModal .header').click(function(){
     if ($(this).nextUntil('#penalModal tr.header').length === 0) {
     var id = $(this)[0].id;
     
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getPenal',
      id: id
    },
    function(response){
        $(response).insertAfter("#penalModal #"+id);
    });
    }
    $('#penalModal tr').not('#penalModal tr.header').remove();
});
</script>
<script>
    var newModalClone = $("#newModal").clone();
    function newCharacterOpen() {
        $("#newModal").replaceWith(newModalClone.clone());
        $("#newModal").show();
    }  
    
    var medModalClone = $("#medModal").clone();
    function addMedOpen() {
        $("#medModal").replaceWith(medModalClone.clone());
        $("#medModal").show();
    }

    var warrantModalClone = $("#warrantModal").clone();
    function addWarrantOpen() {
        $("#warrantModal").replaceWith(warrantModalClone.clone());
        $("#warrantModal").show();
    }
    
    var vehModalClone = $("#vehModal").clone();
    function addVehOpen() {
        $("#vehModal").replaceWith(vehModalClone.clone());
        $("#vehModal").show();
    }
    
    var editvehModalClone = $("#editvehModal").clone();
    function editVehOpen(id) {
        $("#editvehModal").replaceWith(editvehModalClone.clone());
        
        $.post("<?php echo $defaultURL; ?>/utilities/api.php",
        {
            function: 'getEditVeh',
            id: id
        },
        function(response){
            response = JSON.parse(response);
            console.log(response);
            
            $("#editvehModal #model").val(response.model);
            $("#editvehModal #plate").val(response.plate);
            $("#editvehModal #desc").val(response.description);
            $("#editvehModal #reg").val(response.reg);
            $("#editvehModal #insurance").val(response.insurance);
            $("#editvehModal #flags").val(response.flags);
            $("#editvehModal #edit").attr("onclick", "editVeh('" + id + "');");
        });
        
        $("#editvehModal").show();
    }
    
    function penalOpen() {
        document.getElementById('penalModal').style.display = 'block';
    }

    function closeModal() {
    $(".modal").hide();
    }

    window.onclick = function(event) {
    if ($(event.target).hasClass("modal")) {
    $(".modal").hide();
    }};
</script>

<script>
    function openScreen(open) {
        $(".screen").hide();
        $(open).show();
    }
    openScreen("#info");
</script>
<script>
    getSignal();
    function getSignal() {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getSignal'
    },
    function(response){
        if (response === '1') {
            $('#sidebar #signal').attr('class','active');
        } else {
            $('#sidebar #signal').attr('class','');
        }
    });
    setTimeout(getSignal, 2000);
    }
</script>
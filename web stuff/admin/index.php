<?php
include('../settings.php');
include "../include/topCiv.php";

if (empty($_SESSION['user_loggedIn'])) {
    header("Location:$defaultURL");
    die("You must login first");
}

if ($_SESSION['user_admin'] == 0) {
    header("Location:https://www.youtube.com/watch?v=dQw4w9WgXcQ");
    exit();
}
?>
<html>
<body bgcolor="#fff">
<title>Admin Panel</title>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="<?php echo $defaultURL;?>/modal.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">

<div id="sidebar">
    <button onclick="openScreen('#server')">Server Controls</button>
    <button style="margin-top: 75px;" onclick="openScreen('#user')">User Controls</button>
</div>

<div id="server" class="screen">
    <div class="serverStatus">
        <img id="loading" src="<?php echo $defaultURL; ?>/img/loading.gif">
    </div>
</div>

<div id="viewServer" class="screen">
    <h1 id="serverHeader">Server - </h1>
    <button id="refresh" class="smallButton" style="position:relative;" onclick="">Refresh</button>
    <table id="playerTable"></table>
    <div id="options">
        <h2 style="margin-left: 25px;" id="uptime">Uptime: 00h 10m</h2>
        <h2 style="margin-left: 25px;" id="players">Players: 22/32</h2>
    </div>
    <div id="options2">
        <h2>Announce to Server</h2>
        <textarea id="announcement"></textarea>
        <button class="smallButton" style="margin-left:0;" id="aSend" onclick="announcementSend()">Send</button>
    </div>
    <div id="options3">
        <h2>Restart Server</h2>
        <button class="smallButton" style="margin-left:0;" onclick="restartConfirm()">Restart</button>
    </div>
</div>

<div id="user" class="screen">
    <h1 style="margin-left: 25px;">MDT User Controls</h1>
    <table id="userTable"></table>
    <div id="Code">
    <h2 style="margin-left: 25px;">Generate and Remove Login Code</h2>
    <button onclick="genLogin()" class="mediumButton">Generate</button>
    <button onclick="removeLogin()" class="mediumButton">Remove All</button>
    <br>
    <textarea id="loginCode" disabled></textarea>
    </div>
</div>

<div id="roles" class="screen">
    <h1 style="margin-left: 25px;" id="name">Benny Faelz - Roles</h1>
    <h2 id="departments" style="margin-bottom:5px;margin-left: 25px;">Departments</h2>
    <div id="inputDiv">
        <label>Leo</label>
        <br>
        <input type="checkbox" id="LEO" onchange="setUserDepartment('leo', $(this).prop('checked'));"/>
    </div>
    <div id="inputDiv">
        <label>Dispatch</label>
        <br>
        <input type="checkbox" id="DISPATCH" onchange="setUserDepartment('dispatch', $(this).prop('checked'));"/>
    </div>
    <div id="inputDiv">
        <label>Civilian</label>
        <br>
        <input type="checkbox" id="CIV" onchange="setUserDepartment('civ', $(this).prop('checked'));"/>
    </div>
    
    <br>
    <div id='tables'>
        <div id='table'>
            <h2>User's Current Roles</h2>
            <table id='userRoles'></table>
        </div>
        <div id='table'>
            <h2>Available Roles</h2>
            <table id='listRoles'></table>
        </div>
    </div>
</div>
    
<div id="editInfo" class="screen">
    <h1 style="margin-left: 25px;" id="nameTop">nope</h1>
    
    <div>
        <div id="inputDiv">
            <label>Name</label>
            <input type="text" id="name"/>
        </div>

        <div id="inputDiv">
            <label>Email</label>
            <input type="text" id="email"/>
        </div>
    </div>
    <br>
    <div style="margin-top: 100px;">
    <div id="inputDiv">
            <label>Admin</label>
            <br>
            <input type="checkbox" id="admin"/>
        </div>
    </div>
    <br>
    <div style="margin-top: 75px;">
        <div id="inputDiv">
            <label>Password Reset</label>
            <br>
            <button class="smallButton" style="margin:0; margin-top: 7px;" onclick='generatePasswordReset()'>Generate</button>
            <textarea id='resetCode' disabled></textarea>
        </div>
    </div>
    <br>
    <div style="margin-top: 150px;">
        <button class="mediumButton" onclick='submitEditInfo()'>Submit</button>
    </div>
</div>

<div id="banModal" class="modal">
    <center>
        <div class="modal-content">
            <h1>Please enter a ban reason</h1>
            <textarea id="banReason"></textarea>
            <br>
            <button id="yes">Ban</button>
            <button onclick="closeModal()">Cancel</button>
        </div>
    </center>
</div>

<div id="kickModal" class="modal">
    <center>
        <div class="modal-content">
            <h1>Please enter a kick reason</h1>
            <textarea id="kickReason"></textarea>
            <br>
            <button id="yes">Kick</button>
            <button onclick="closeModal()">Cancel</button>
        </div>
    </center>
</div>

<div id="restartModal" class="modal">
    <center>
        <div class="modal-content">
            <h1>Are you sure you want to restart server </h1>
            <button id="yes">Restart</button>
            <button onclick="closeModal()">Cancel</button>
        </div>
    </center>
</div>

<div id="suspendModal" class="modal">
    <center>
        <div class="modal-content">
            <h1>Are you sure you want to suspend this user?</h1>
            <button id="yes">Yes</button>
            <button onclick="closeModal()">Cancel</button>
        </div>
    </center>
</div>

<script>
    function openScreen(open) {
        $(".screen").hide();
        $(open).show();
    }
    openScreen('#server');
</script>
<script>
loadServers();
function loadServers() {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getServersAdmin'
    },
    function(response){
        $("#server .serverStatus").html(response);
    });
}

function selectServer(id) {
openScreen('#viewServer');
$("#viewServer #serverHeader").html("Server " + id + " Control Pannel");
$("#viewServer #refresh").attr('onclick',"selectServer(" + id + ")");
$("#viewServer #aSend").attr('onclick',"announcementSend(" + id + ")");
$("#restartModal h1").text("Are you sure you want to restart server " + id + "?");
$("#restartModal #yes").attr('onclick',"rcon(" + id + ",'restart_server'); closeModal();");
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getServerPlayerTable',
      id: id
    },
    function(response){
        $("#playerTable").html(response);
    });

$.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getServerInfo',
      id: id
    },
    function(response){
        response = JSON.parse(response);
        $("#uptime").text("Uptime: " + response[0]);
        $("#players").text("Players: " + response[1]);
    });
}

function ban(server,id) {
    var reason = $("#banReason").val();
    rcon(server, "ban " + id + " " + reason);
}

function kick(server,id) {
    var reason = $("#kickReason").val();
    rcon(server, "kick " + id + " " + reason);
}

function rcon(server, command) {
    closeModal();
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'rcon',
      server: server,
      command: command
    },
    function(response){
        selectServer(server);
        console.log(response);
    });
}

function announcementSend(server) {
    var announcement = $("#announcement").val();
    rcon(server, "announce " + announcement)
    $("#announcement").val("");
}
</script>
<script>
function genLogin() {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'genLogin'
    },
    function(response){
        $("#loginCode").val(response);
    });
}

function removeLogin() {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'removeLogin'
    },
    function(response){
        $("#loginCode").val(response);
    });
}

loadUserTable();
function loadUserTable() {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getUsersTable'
    },
    function(response){
        $("#userTable").html(response);
    });
    }
    
function userSuspend(id, suspend) {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'userSuspend',
      id: id,
      suspend: suspend
    },
    function(response){
        closeModal();
        loadUserTable();
    });
}
</script>
<script>
function banConfirm(server, id) {
    document.getElementById('banModal').style.display = 'block';
    $("#banModal button#yes").attr('onclick',"ban(" + server + "," + id + ")");
}

function kickConfirm(server, id) {
    document.getElementById('kickModal').style.display = 'block';
    $("#kickModal button#yes").attr('onclick',"kick(" + server + "," + id + ")");
}

function restartConfirm(server, id) {
    document.getElementById('restartModal').style.display = 'block';
    $("#kickModal button#yes").attr('onclick',"kick(" + server + "," + id + ")");
}

function userSuspendConfirm(id) {
    document.getElementById('suspendModal').style.display = 'block';
    $("#suspendModal button#yes").attr('onclick',"userSuspend(" + id + ",1)");
}

function openRoles(id) {
    openScreen('#roles');
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getUserDepartments',
      user_id: id
    },
    function(response){
        response = JSON.parse(response);
        $('#roles #departments').attr('user_id', id);
        $('#roles #LEO').prop('checked', response[0]);
        if (response[0]) {
            $("#roles #tables").show();
        } else {
            $("#roles #tables").hide();
        }
        $('#roles #CIV').prop('checked', response[1]);
        $('#roles #DISPATCH').prop('checked', response[2]);
        $('#roles #name').html(response[3] + " - Roles");
    });
    
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getRolesTable',
      user_id: id
    },
    function(response){
        $("#listRoles").html(response);
        sortTable("listRoles");
    });
    
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getUserRolesTable',
      user_id: id
    },
    function(response){
        $("#userRoles").html(response);
        sortTable("userRoles");
    });
}

function setUserDepartment(department, enabled) {
    var id = $('#roles #departments').attr('user_id');
    //var enabled = $(this).prop('checked');
    
    if (department === "leo" && enabled) {
        $("#roles #tables").show();
    } else if (department === "leo" && !enabled) {
        $("#roles #tables").hide();
    }
    
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'setUserDepartment',
      user_id: id,
      department: department,
      enabled: enabled
    },
    function(response){
        console.log(response);
    });
}

function addUserRole(user_id, department, division) {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'addUserRole',
      user_id: user_id,
      department: department,
      division: division
    },
    function(response){
        openRoles(user_id);
    });
}

function removeUserRole(user_id, department, division) {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'removeUserRole',
      user_id: user_id,
      department: department,
      division: division
    },
    function(response){
        openRoles(user_id);
    });
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
function editInfo(user_id) {
    $('#editInfo #nameTop').attr('user_id', user_id);
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'getEditInfo',
      user_id: user_id
    },
    function(response){
        response = JSON.parse(response);
        $('#editInfo #nameTop').text(response[0] + " - Edit Info");
        $('#editInfo #name').val(response[0]);
        $('#editInfo #email').val(response[1]);
        $('#editInfo #resetCode').val("");
        $('#editInfo #resetCode').attr('token', "");
        if (response[2] >= 1) {
            $('#editInfo #admin').prop('checked', true);
        }

        
        openScreen("#editInfo");
    });
}

function submitEditInfo() {
    var user_id = $('#editInfo #nameTop').attr('user_id');
    
    var admin;
    
    if ($('#editInfo #admin').prop('checked')) {
        admin = 1;
    } else {
        admin = 0;
    }
    
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'submitEditInfo',
      user_id: user_id,
      name: $('#editInfo #name').val(),
      email: $('#editInfo #email').val(),
      admin: admin,
      token: $('#editInfo #resetCode').attr('token')
    },
    function(response) {
        loadUserTable()
        openScreen("#user");
    });
}

function generatePasswordReset() {
    var token = randomString(32, '#aA');
    $('#editInfo #resetCode').attr('token', token);
    $('#editInfo #resetCode').val("<?php echo $defaultURL; ?>/reset.php?token=" + token);
}
</script>
<script>
function sortTable(id) {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById(id);
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];
      //check if the two rows should switch place:
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        //if so, mark as a switch and break the loop:
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}

function randomString(length, chars) {
    var mask = '';
    if (chars.indexOf('a') > -1) mask += 'abcdefghijklmnopqrstuvwxyz';
    if (chars.indexOf('A') > -1) mask += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (chars.indexOf('#') > -1) mask += '0123456789';
    if (chars.indexOf('!') > -1) mask += '~`!@#$%^&*()_+-={}[]:";\'<>?,./|\\';
    var result = '';
    for (var i = length; i > 0; --i) result += mask[Math.round(Math.random() * (mask.length - 1))];
    return result;
}
</script>
</body>
</html>
<?php include('settings.php');
session_start();
if (empty($_SESSION['user_loggedIn']))
{
	header("Location:$defaultURL");
    die("You must login first");
}

$user_id = $_SESSION['user_id'];
unset($_SESSION['user_identifier']);
mysqli_query($conn, "DELETE FROM mdt_active_users WHERE user_id='$user_id'");

$query = "SELECT steam FROM mdt_users WHERE user_id='$user_id'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        mysqli_query($conn, "DELETE FROM mdt_players WHERE steam='" . $row['steam'] . "'");
    }
}
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
            <script src="<?php echo $defaultURL;?>/utilities/console.js"></script>
    </head>
    <body>
    <center><h1>Please select a Department</h1></center>
    <div id="departmentIcons">
        <a id="leo" href="javascript:showDepartments();"><img src="img/frIcon.png" alt="LEO"></a>
        <a id="dispatch" href="dispatch"><img src="img/dispatchIcon.png" alt="Dispatch"></a>
        <a id="civ" href="civ"><img src="img/civIcon.png" alt="Civilian"></a>
    </div>
    <div id="leodepartmentIcons">
        <?php 
        $query = "SELECT id, name, icon, abbreviation FROM mdt_departments";
        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            // output data of each row
            while ($row = $result->fetch_assoc()) {
                $showDepartment = false;
                $icon = $row['icon'];
                $id = $row['id'];
                $abbreviation = strtoupper($row['abbreviation']);
                $roleArray = json_decode($_SESSION['user_role'], true);
                
                
                foreach ($roleArray as $role) {
                    foreach (array_keys($role['departments']) as $department) {
                        if (strtoupper($department) == $abbreviation) {
                            $showDepartment = true;
                        }
                    }
                }
                
                if ($showDepartment or !$roleAssignmentEnabled) {
                    echo "<a id='$abbreviation' href='javascript:showDivisons($id);'><img src='img/$icon.png'></a>";
                }
            }
        }
            ?>
    </div>
    <div id='leoDivison'>
            <?php
    $query = "SELECT id, departmentID, name, icon, abbreviation FROM mdt_divisions";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        // output data of each row
        while ($row = $result->fetch_assoc()) {
            $showDivision = false;
            $icon = $row['icon'];
            $departmentID = $row['departmentID'];
            $divisonID = $row['id'];
            $name = $row['name'];
            $abbreviation = strtoupper($row['abbreviation']);
            $roleArray = json_decode($_SESSION['user_role'], true);
                
                
            foreach ($roleArray as $role) {
                foreach (array_keys($role['departments']) as $department) {
                    if (strtoupper($department) == getDepartment($departmentID, $conn)) {
                        foreach ($role['departments'][$department] as $divison) {
                            if (strtoupper($divison) == $abbreviation) {
                                $showDivision = true;
                            }
                        }
                    }
                }
            }

            if ($showDivision or !$roleAssignmentEnabled) {
                echo "<a href='javascript:setDepartment($departmentID, $divisonID);'><div style='display:none; padding: 25px;' id='leoDivisonIcons' class='$departmentID'><img id='leoDivisonIcons' src='img/$icon.png'><div class='name'>$name</div></div></a>";
            }
            
        }
    }
    
    function getDepartment($id, $conn) {
        $query = "SELECT abbreviation FROM mdt_departments WHERE id=$id";
        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            // output data of each row
            while ($row = $result->fetch_assoc()) {
                return $row['abbreviation'];
            }
        }
    }
    ?>
    </div>
    <div id='reset'>
        <button onclick="location.reload();">Reset</button>
    </div>
    
    <script>
function showDepartments() {
  $('#departmentIcons').fadeOut('slow'); 
  //$('#leodepartmentIcons img').fadeIn('.2');
  $('#leodepartmentIcons img').each(function(i) {
  $(this).delay(i*350).fadeIn('slow')
  });
  $('#reset').fadeIn('slow');
};

function showDivisons(id) {
  $('#leodepartmentIcons img').fadeOut('slow');
  $('.' + id).each(function(i) {
  $(this).delay(i*350).fadeIn('slow')
  });
};

function setDepartment(department, divison) {
    $.post("<?php echo $defaultURL; ?>/utilities/api.php",
    {
      function: 'setDepartment',
      departmentID: department,
      divisonID: divison
    },
    function(response){
        console.log(response);
        location.assign(response);
    });
        }
        </script>
    <script>
        var i, dep, dep2, dp, div = "";
        var role = <?php $role = str_replace(array("\r","\n"),"",$_SESSION['user_role']); echo $role;?>;
        
        if (<?php if ($roleAssignmentEnabled) {echo 'true';} else {echo 'false';} ?>) {
            for (i in role) {
                $('#' + role[i].name).fadeIn('slow');
            }
        } else {
            $('#departmentIcons a').fadeIn('slow');
        }
            /*
            if (role[i].name === "leo") {
                departmentNames = Object.getOwnPropertyNames(role[i].departments);
                for (dep2 in departmentNames) {
                    $('#' + departmentNames[dep2].toUpperCase()).show();
                    console.log(departmentNames[dep2].toUpperCase());
                }
                
                for (x in role[i].departments) {
                    console.log(x);
                }
            }
        }
        */
    </script>
    </body>
</html>

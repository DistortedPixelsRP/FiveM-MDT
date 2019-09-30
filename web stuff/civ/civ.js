
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



    function openScreen(open) {
        $(".screen").hide();
        $(open).show();
    }
    openScreen("#info");


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

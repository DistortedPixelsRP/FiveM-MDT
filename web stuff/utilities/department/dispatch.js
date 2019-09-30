function getUnits() { 
    $.post("../utilities/api.php",
    {
      function: 'getUnits'
    },
    function(response){
        response = JSON.parse(response);
        
        var units = [];
        var calls = "";
        
        $("#openCallTable tr:not(:first)").each(function(e) {
            calls = calls + "<option value='" + $(this).find("td:first").html() + "'>#" + $(this).find("td:first").html() + " - " + $(this).find("td:eq(1)").html() + "</option>";
        })
        
        $("#unitTable tr:not(:first)").each(function(e) {
            if (!response.hasOwnProperty($(this).attr('id'))) {
                $(this).remove();
            }
            units.push($(this).attr('id'));
        })
        
        for (i in response) {
            var unit = response[i];
            if (units.includes(i)) {continue;}
            $("#unitTable").append(`
                <tr id='` + i + `'>
                <td style='width:20px;'><img class='typeIcons ` + unit.type + `' src='../img/` + unit.type + `.png'></td>
                <td>` + unit.identifier + `<br>` + unit.name + `</td>
                <td>` + unit.department + ` - ` + unit.divison + `</td>
                <td>
                    <select class="status" onchange="changeStatus(` + i + `, this.value)">
                        <option>10-6</option>
                        <option>10-7</option>
                        <option>10-8</option>
                        <option>10-15</option>
                        <option>10-23</option>
                        <option>10-97</option>
                        <option>10-42</option>
                    </selcect>
                </td>
                            <td>
                    <select class="call" onchange='changeCall(` + i + `, this.value)'>
                        <option value='0'>None</option>
                        ` + calls + `
                    </select>
                    <img class='logout' src='../img/clear.jpg' onclick="logoutUserConfirm('` + i + `','` + unit.identifier + ` ` + unit.name + `')">
                    </td>
                </tr>
            `);
            $('#unitTable tr#' + i + ' .status').val(unit.status);
        }
    }); 
}

function changeStatus(id, status) {
    $.post("../utilities/api.php",
    {
      function: 'changeStatus',
      id: id,
      status: status
    },
    function(response){
        getUnits();
    });
}

function changeCall(id, call) {
    $.post("../utilities/api.php",
    {
      function: 'changeCall',
      id: id,
      call: call
    },
    function(response){
        getUnits();
    });
}

function clearCallConfirm(id) {
    $("#clearModal button#yes").attr('onclick','clearCall(' + id + ')');
    clearOpen();
}

function logoutUserConfirm(id,name) {
    $("#logoutModal button#yes").attr('onclick','logoutUser(' + id + ')');
    $("#logoutModal #name").text(name);
    logoutOpen();
}

function logoutUser(id) {
    $.post("../utilities/api.php",
    {
      function: 'logoutUser',
      id: id
    },
    function(response){
        closeModal();
        getUnits();
    });
}


    getCallDispatch();
function getCallDispatch() { 
    $.post("../utilities/api.php",
    {
      function: 'getCallDispatch'
    },
    function(response){
        $("#openCall #openCallTable").html(response);
        getUnits();
    });
setTimeout(getCallDispatch, 5000);   
}

function clearCallConfirm(id) {
    $("#clearModal button#yes").attr('onclick','clearCall(' + id + ')');
    clearOpen();
}

function clearCall(id) { 
    $.post("../utilities/api.php",
    {
      function: 'clearCall',
      id: id
    },
    function(response){
        closeModal();
        getCallDispatch();
    });
}

function editCall(id) {
    
    $.post("../utilities/api.php",
    {
      function: 'editCallGet',
      id: id
    },
    function(response){
        response = JSON.parse(response);
        $("#editModal #location").val(response[0]);
        $("#editModal #description").val(response[1]);
        $("#editModal #type").val(response[2]);
        $("#editModal #edit").val(id);
    });
    
    editOpen();
}

$("#editModal #edit").click(function(){
    $.post("../utilities/api.php",
    {
      function: 'editCall',
      type: $("#editModal #type").val(),
      location: $("#editModal #location").val(),
      description: $("#editModal #description").val(),
      id:  $("#editModal #edit").val()
    },
    function(response){
        getCallDispatch();
    });
    
    
    closeModal();
});


    $("#call #create").click(function(){
  var type = $( "#call #type option:selected" ).text();
  var location = $("#call input#location").val();
  var postal = $("#call input#postal").val();
  var description = $("#call textarea#description").val();
  
    $.post("../utilities/api.php",
    {
      function: 'createCall',
      type: type,
      location: location,
      postal: postal,
      description: description
    },
    function(response){
        $("#call alert").html(response);
        if (response === "") {
            $("#call #type").val("Call Type");
            $("#call #location").val("");
            $("#call #postal").val("");
            $("#call #description").val("");
            getCallDispatch();
        }
    });
});


    var plateSearchId;
$("#plateSearch #search").click(function(){
  $(this).attr('class', 'selected');
  var plate = $("input#plate").val();
  
    $.post("../utilities/api.php",
    {
      function: 'searchPlate',
      plate: plate
    },
    function(response){
        response = JSON.parse(response);
        
        if (response[0] === "No Results") {
              $("#plateSearch alert").show();
              $("#plateSearch #searchResults").hide();
        } else {
              if (response[0] === "multiple") {
              $("#civTable").html("<tr><th>Plate</th><th>Description</th><th>Civ</th></tr>" + response[1]);
              nameOpen();
          } else {
              $("#plateSearch alert").hide();
              //$("#nameInput").hide();
              $("#plateSearch #searchResults").show();
              $("#plateSearch #searchResults #plate").html("Plate: " + response[1]);
              $("#plateSearch #searchResults #model").html("Model: " + response[2]);
              $("#plateSearch #searchResults #owner").html("Owner: " + response[3]);
              $("#plateSearch #searchResults #description").html("Description: " + response[4]);
              $("#plateSearch #searchResults #reg").html("Registration: " + response[5]);
              $("#plateSearch #searchResults #insurance").html("Insurance: " + response[6]);
              $("#plateSearch #searchResults #flags").html("Flags: " + response[7]);
              $("#plateSearch input#plate").attr('plateid',response[8]);
              plateReport();
              }
        }
    });
    
});

function plateReport() {
    var plate = $("#plateSearch #plate").attr('plateid');
    var type = $("#plateSearch #plateReportSelect option:selected" ).val();
    $.post("../utilities/api.php",
    {
      function: 'plateReport',
      plate: plate,
      type: type
    },
    function(response){
        $("#plateSearch #searchResults #plateReportTable").html(response);
    });
}

function plateReportDetailed(id) {
    var type = $("#plateSearch #plateReportSelect option:selected" ).val();
     if ($('#' + id).nextUntil('#plateReportTable tr.header').length === 0) {
    $.post("../utilities/api.php",
    {
      function: 'plateReportDetailed',
      type: type,
      id: id
    },
    function(response){
        $(response).insertAfter("#plateReportTable #"+id);
    });
    }
    $('#plateReportTable tr').not('#plateReportTable tr.header').remove();
}




function searchPlateMultiple(id) {
    $.post("../utilities/api.php",
    {
      function: 'searchPlateMultiple',
      id: id
    },
    function(response){
        response = JSON.parse(response);
              $("#plateSearch alert").hide();
              $("#plateSearch #searchResults").show();
              $("#plateSearch #searchResults #plate").html("Plate: " + response[1]);
              $("#plateSearch #searchResults #model").html("Model: " + response[2]);
              $("#plateSearch #searchResults #owner").html("Owner: " + response[3]);
                    $("#plateSearch #searchResults #description").html("Description: " + response[4]);
                    $("#plateSearch #searchResults #reg").html("Registration: " + response[5]);
                    $("#plateSearch #searchResults #insurance").html("Insurance: " + response[6]);
                    document.getElementById('nameModal').style.display = 'none';
                    $("#plateSearch #searchResults #flags").html("Flags: " + response[7]);
                    $("#plateSearch input#plate").attr('plateid', response[8]);
                    plateReport();
                });
    }


    var nameSearchClone = $("#nameSearch #searchResults").clone();
    $("#nameSearch #search").click(function () {
        $("#nameSearch #searchResults").replaceWith(nameSearchClone.clone());
        $(this).attr('class', 'selected');
        var first = $("input#first").val();
        var last = $("input#last").val();

        $.post("../utilities/api.php",
                {
                    function: 'searchName',
                    first: first,
                    last: last
                },
                function (response) {
                    response = JSON.parse(response);

                    if (response[0] === "No Results") {
                        $("#nameSearch alert").show();
                        $("#nameSearch #searchResults").hide();
                    } else {
                        if (response[0] === "multiple") {
                            $("#civTable").html("<tr><th>Name</th><th>DOB</th><th>Civ</th></tr>" + response[1]);
                            nameOpen();
                        } else {
                            $("#nameSearch alert").hide();
                            //$("#nameInput").hide();
                            $("#nameSearch #searchResults").show();
                            $("#nameSearch #searchResults #name").html("Name: " + response[1] + " " + response[2]);
                            $("#nameSearch #searchResults #dob").html("DOB: " + response[3]);
                            $("#nameSearch #searchResults #gender").html("Gender: " + response[4]);
                            $("#nameSearch #searchResults #address").html("Address: " + response[5]);
                            $("#nameSearch #searchResults #weapon").html(response[7]);
                            getSearchedNameVehicles(response[8]);
                            $("#nameSearch input#first").attr('nameid', response[8]);
                            nameReport();
                            
                            var lic = JSON.parse(response[6]);
                            for (i in lic) {
                                $("#licTable").append('<tr><td>' + lic[i].name + '</td><td>' + lic[i].type + '</td><td>' + lic[i].status + '</td>')
                            }

                            tables();
                        }
                    }
                });

    });

    function nameReport() {
        var name = $("#nameSearch input#first").attr('nameid');
        var type = $("#nameSearch #nameReportSelect option:selected").val();
        $.post("../utilities/api.php",
                {
                    function: 'nameReport',
                    name: name,
                    type: type
                },
                function (response) {
                    $("#nameSearch #searchResults #nameReportTable").html(response);
                });
    }

    function nameReportDetailed(id) {
        var type = $("#nameSearch #nameReportSelect option:selected").val();
        if ($('#' + id).nextUntil('#nameReportTable tr.header').length === 0) {
            $.post("../utilities/api.php",
                    {
                        function: 'nameReportDetailed',
                        type: type,
                        id: id
                    },
                    function (response) {
                        $(response).insertAfter("#nameReportTable #" + id);
                    });
        }
        $('#nameReportTable tr').not('#nameReportTable tr.header').remove();
    }


    function searchNameMultiple(id) {
        $.post("../utilities/api.php",
                {
                    function: 'searchNameMultiple',
                    id: id
                },
                function (response) {
                    response = JSON.parse(response);
                    $("#nameSearch alert").hide();
                    //$("#nameInput").hide();
                    $("#nameSearch #searchResults").show();
                    $("#nameSearch #searchResults #name").html("Name: " + response[1] + " " + response[2]);
                    $("#nameSearch #searchResults #dob").html("DOB: " + response[3]);
                    $("#nameSearch #searchResults #gender").html("Gender: " + response[4]);
                    $("#nameSearch #searchResults #address").html("Address: " + response[5]);
                    $("#nameSearch #searchResults #weapon").html(response[7]);
                    getSearchedNameVehicles(response[8]);
                    $("#nameSearch input#first").attr('nameid', response[8]);
                    nameReport();
                    document.getElementById('nameModal').style.display = 'none';
                    
                    var lic = JSON.parse(response[6]);
                    for (i in lic) {
                        $("#licTable").append('<tr><td>' + lic[i].name + '</td><td>' + lic[i].type + '</td><td>' + lic[i].status + '</td>')
                    }

                    tables();
                });
    }


    function getSearchedNameVehicles(id) {
        $.post("../utilities/api.php",
                {
                    function: 'getSearchedNameVehicles',
                    id: id
                },
                function (response) {
                    $("#nameSearch #searchResults #vehicles").html("<tr><th>Plate</th><th>Model</th><th>Description</th></tr>" + response);
                });
    }


$('#penalModal .header').click(function(){
     if ($(this).nextUntil('#penalModal tr.header').length === 0) {
     var id = $(this)[0].id;
     
    $.post("../utilities/api.php",
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


function nameOpen() {
document.getElementById('nameModal').style.display = 'block';
}

function penalOpen() {
document.getElementById('penalModal').style.display = 'block';
}

function clearOpen() {
document.getElementById('clearModal').style.display = 'block';
}

function logoutOpen() {
document.getElementById('logoutModal').style.display = 'block';
}

function editOpen() {
document.getElementById('editModal').style.display = 'block';
}

function closeModal() {
$(".modal").hide();
}

window.onclick = function(event) {
if ($(event.target).hasClass("modal")) {
$(".modal").hide();
}};


    function signal() {   
    $.post("../utilities/api.php",
    {
      function: 'signal'
    },
    function(){
        getSignal();
    });
    }

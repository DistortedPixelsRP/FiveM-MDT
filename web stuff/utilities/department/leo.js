toastr.options = {
    "positionClass": "toast-bottom-right"
}

var arrestClone = $("#arrest").clone();
$("#arrest #submit").click(function(){
  
  var characterId = $("#arrest input#first").attr('characterid');
  var plateId = $("#arrest input#plate").attr('plateid');
  var first = $("#arrest input#first").val();
  var last = $("#arrest input#last").val();
  var plate = $("#arrest input#plate").val();
  var description = $("#arrest input#description").val();
  var location = $("#arrest input#location").val();
  var fine = $("#arrest input#fine").val();
  var jail = $("#arrest input#jail").val();
  
  var infraction = [];
  
$("#arrestListTable tr").each(function(){
    infraction.push($(this).find("td:first").text()); //put elements into array
});
    infraction.shift();//fixes weird extra element bug thing

  
    $.post("../utilities/api.php",
    {
      function: 'submitArrest',
      characterId: characterId,
      first: first,
      last: last,
      plateId: plateId,
      plate: plate,
      description: description,
      infraction: infraction,
      location: location,
      fine: fine,
      jail: jail
    },
    function(response){
        toastr.error(response, 'Error');
        if (response === "") {
            toastr.success('Arrest Report Submitted');
            $("#arrest").replaceWith(arrestClone.clone());
            openScreen('#arrest');
        }
    });
    
});

$("#arrest #searchPlate").click(function(){
    var plate = $("#arrest input#plate").val();

    $.post("../utilities/api.php",
    {
      function: 'doesPlateExistArrest',
      plate: plate
    },
    function(response){
        response = JSON.parse(response);
        
        if (response[0] === "No Results") {
            $("#arrest #searchPlateSuccess").removeClass("fa-check");
            $("#arrest #searchPlateSuccess").addClass("fa-times");
            toastr.warning('Could not find plate in database');
        } else {
            $("#arrest #searchPlateSuccess").removeClass("fa-times");
            $("#arrest #searchPlateSuccess").addClass("fa-check");
            toastr.success('Success');
            
            if (response[0] === "single"){
                $("#arrest input#description").val(response[1]);
            } else {
                $("#civTable").html("<tr><th>Name</th><th>DOB</th><th>Civ</th></tr>" + response[1]);
                nameOpen();
            }
        }
    });
    
});

$("#arrest #searchName").click(function(){
    var first = $("#arrest input#first").val();
    var last = $("#arrest input#last").val();
    $.post("../utilities/api.php",
    {
      function: 'searchNameArrest',
      first: first,
      last: last
    },
    function(response){
        response = JSON.parse(response);
        
        if (response[0] === "No Results") {
            $("#arrest #searchSuccess").removeClass("fa-check");
            $("#arrest #searchSuccess").addClass("fa-times");
            toastr.warning('Could not find name in database');
        } else {
            $("#arrest #searchSuccess").removeClass("fa-times");
            $("#arrest #searchSuccess").addClass("fa-check");
            toastr.success('Success');
            
            if (response[0] === "single"){
                $("#arrest input#first").attr('characterid',response[1]);
            } else {
                $("#civTable").html("<tr><th>Name</th><th>DOB</th><th>Civ</th></tr>" + response[1]);
                nameOpen();
            }
        }
    });
});

function searchNameArrest(id) {
    $("#arrest input#first").attr('characterid',id);
    closeModal();
}
function searchPlateArrest(id,description) {
    $("#arrest input#plate").attr('plateid',id);
    $("#arrest input#description").val(description);
    closeModal();
}

function arrestAdd(id) {
    $.post("../utilities/api.php",
    {
      function: 'getPenalFromId',
      id: id
    },
    function(response){
        response = JSON.parse(response);
        $(response[0]).insertAfter("#arrestListTable tr:last");
        closeModal();
        var fine = parseInt($("#arrest #fine").val()) + parseInt(response[1]);
        $("#arrest #fine").val(fine);
        var jail = parseInt($("#arrest #jail").val()) + parseInt(response[2]);
        $("#arrest #jail").val(jail)
    });
    }
    
$('#arrestTable .header').click(function(){
     if ($(this).nextUntil('#arrestTable tr.header').length === 0) {
     var id = $(this)[0].id;
     
    $.post("../utilities/api.php",
    {
      function: 'getPenalArrests',
      id: id
    },
    function(response){
        $(response).insertAfter("#arrestTable #"+id);
    });
    }
    $('#arrestTable tr').not('#arrestTable tr.header').remove();
});


var warningClone = $("#warning").clone();
$("#warning #submit").click(function(){
  
  var characterId = $("#warning input#first").attr('characterid');
  var plateId = $("#warning input#plate").attr('plateid');
  var first = $("#warning input#first").val();
  var last = $("#warning input#last").val();
  var plate = $("#warning input#plate").val();
  var description = $("#warning input#description").val();
  var location = $("#warning input#location").val();
  
  var infraction = [];
  
$("#warningListTable tr").each(function(){
    infraction.push($(this).find("td:first").text()); //put elements into array
});
    infraction.shift();//fixes weird extra element bug thing

  
    $.post("../utilities/api.php",
    {
      function: 'submitWarning',
      characterId: characterId,
      first: first,
      last: last,
      plateId: plateId,
      plate: plate,
      description: description,
      infraction: infraction,
      location: location
    },
    function(response){
        toastr.error(response, 'Error');
        if (response === "") {
            toastr.success('Written Warning Submitted');
            $("#warning").replaceWith(warningClone.clone());
            openScreen('#warning');
        }
    });
    
});

$("#warning #searchPlate").click(function(){
    var plate = $("#warning input#plate").val();
    $.post("../utilities/api.php",
    {
      function: 'doesPlateExistWarning',
      plate: plate
    },
    function(response){
        response = JSON.parse(response);
        
        if (response[0] === "No Results") {
            $("#warning #searchPlateSuccess").removeClass("fa-check");
            $("#warning #searchPlateSuccess").addClass("fa-times");
            toastr.warning('Could not find plate in database');
        } else {
            $("#warning #searchPlateSuccess").removeClass("fa-times");
            $("#warning #searchPlateSuccess").addClass("fa-check");
            toastr.success('Success');
        
            if (response[0] === "single"){
                $("#warning input#description").val(response[1]);
            } else {
                $("#civTable").html("<tr><th>Name</th><th>DOB</th><th>Civ</th></tr>" + response[1]);
                nameOpen();
            }
    }
    });
    
});

$("#warning #searchName").click(function(){
    var first = $("#warning input#first").val();
    var last = $("#warning input#last").val();
    $.post("../utilities/api.php",
    {
      function: 'searchNameWarning',
      first: first,
      last: last
    },
    function(response){
        response = JSON.parse(response);
        
        if (response[0] === "No Results") {
            $("#warning #searchSuccess").removeClass("fa-check");
            $("#warning #searchSuccess").addClass("fa-times");
            toastr.warning('Could not find name in database');
        } else {
            $("#warning #searchSuccess").removeClass("fa-times");
            $("#warning #searchSuccess").addClass("fa-check");
            toastr.success('Success');
            
            if (response[0] === "single"){
                $("#warning input#first").attr('characterid',response[1]);
            } else {
                $("#civTable").html("<tr><th>Name</th><th>DOB</th><th>Civ</th></tr>" + response[1]);
                nameOpen();
            }
        }
    });
});

function searchNameWarning(id) {
    $("#warning input#first").attr('characterid',id);
    closeModal();
}
function searchPlateWarning(id,description) {
    $("#warning input#plate").attr('plateid',id);
    $("#warning input#description").val(description);
    closeModal();
}

    function warningAdd(id) {
    $.post("../utilities/api.php",
    {
      function: 'getPenalFromId',
      id: id
    },
    function(response){
        response = JSON.parse(response);
        $(response[0]).insertAfter("#warningListTable tr:last");
        closeModal();
    });
    }
    
$('#warningTable .header').click(function(){
     if ($(this).nextUntil('#warningTable tr.header').length === 0) {
     var id = $(this)[0].id;
     
    $.post("../utilities/api.php",
    {
      function: 'getPenalWarnings',
      id: id
    },
    function(response){
        $(response).insertAfter("#warningTable #"+id);
    });
    }
    $('#warningTable tr').not('#warningTable tr.header').remove();
});


var citationClone = $("#citation").clone();
$("#citation #submit").click(function(){
  
  var characterId = $("#citation input#first").attr('characterid');
  var plateId = $("#citation input#plate").attr('plateid');
  var first = $("#citation input#first").val();
  var last = $("#citation input#last").val();
  var plate = $("#citation input#plate").val();
  var description = $("#citation input#description").val();
  var location = $("#citation input#location").val();
  var fine = $("#citation input#fine").val();
  
  var infraction = [];
  
$("#citationListTable tr").each(function(){
    infraction.push($(this).find("td:first").text()); //put elements into array
});
    infraction.shift();//fixes weird extra element bug thing

  
    $.post("../utilities/api.php",
    {
      function: 'submitCitation',
      characterId: characterId,
      first: first,
      last: last,
      plateId: plateId,
      plate: plate,
      description: description,
      infraction: infraction,
      location: location,
      fine: fine
    },
    function(response){
        toastr.error(response, 'Error');
        if (response === "") {
            toastr.success('Citation Submitted');
            $("#citation").replaceWith(citationClone.clone());
            openScreen('#citation');
        }
    });
    
});

$("#citation #searchPlate").click(function(){
    var plate = $("#citation input#plate").val();

    $.post("../utilities/api.php",
    {
      function: 'doesPlateExist',
      plate: plate
    },
    function(response){
        response = JSON.parse(response);
        
        if (response[0] === "No Results") {
            $("#citation #searchPlateSuccess").removeClass("fa-check");
            $("#citation #searchPlateSuccess").addClass("fa-times");
            toastr.warning('Could not find plate in database');
        } else {
            $("#citation #searchPlateSuccess").removeClass("fa-times");
            $("#citation #searchPlateSuccess").addClass("fa-check");
            toastr.success('Success');
       
            if (response[0] === "single"){
                $("#citation input#description").val(response[1]);
            } else {
                $("#civTable").html("<tr><th>Name</th><th>DOB</th><th>Civ</th></tr>" + response[1]);
                nameOpen();
            }
        }
    });
    
});

$("#citation #searchName").click(function(){
    var first = $("#citation input#first").val();
    var last = $("#citation input#last").val();
    $.post("../utilities/api.php",
    {
      function: 'searchNameCitation',
      first: first,
      last: last
    },
    function(response){
        response = JSON.parse(response);
        if (response[0] === "No Results") {
            $("#citation #searchSuccess").removeClass("fa-check");
            $("#citation #searchSuccess").addClass("fa-times");
            toastr.warning('Could not find name in database');
        } else {
            $("#citation #searchSuccess").removeClass("fa-times");
            $("#citation #searchSuccess").addClass("fa-check");
            toastr.success('Success');
            
            if (response[0] === "single"){
                $("#citation input#first").attr('characterid',response[1]);
            } else {
                $("#civTable").html("<tr><th>Name</th><th>DOB</th><th>Civ</th></tr>" + response[1]);
                nameOpen();
            }
        }
    });
});

function searchNameCitation(id) {
    $("#citation input#first").attr('characterid',id);
    closeModal();
}
function searchPlateCitation(id,description) {
    $("#citation input#plate").attr('plateid',id);
    $("#citation input#description").val(description);
    closeModal();
}

    function citationAdd(id) {
    $.post("../utilities/api.php",
    {
      function: 'getPenalFromId',
      id: id
    },
    function(response){
        response = JSON.parse(response);
        $(response[0]).insertAfter("#citationListTable tr:last");
        closeModal();
        var fine = parseInt($("#citation #fine").val()) + parseInt(response[1]);
        $("#citation #fine").val(fine);
    });
    }
    
$('#citationTable .header').click(function(){
     if ($(this).nextUntil('#citationTable tr.header').length === 0) {
     var id = $(this)[0].id;
     
    $.post("../utilities/api.php",
    {
      function: 'getPenalCitations',
      id: id
    },
    function(response){
        $(response).insertAfter("#citationTable #"+id);
    });
    }
    $('#citationTable tr').not('#citationTable tr.header').remove();
});




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


$("#statusbar button").click(function(){
  $("#statusbar button").attr('class', '');
  $(this).attr('class', 'selected');
  var status = $(this).html();
    
    if (status === "10-8") {
        $("#call").hide();
    }
  
    $.post("../utilities/api.php",
    {
      function: 'submitStatus',
      status: status
    },
    function(){
    });
    
});

getStatus()

function getStatus() {
$.post("../utilities/api.php",
{
  function: 'getStatus'
},
function(response){
    $("#statusbar button").removeClass('selected');
    $("#statusbar button#" + response).addClass('selected');
});
setTimeout(getStatus, 5000);   
}


function nameOpen() {
    document.getElementById('nameModal').style.display = 'block';
}


function penalOpen() {
    document.getElementById('penalModal').style.display = 'block';
}

function citationOpen() {
    document.getElementById('citationModal').style.display = 'block';
}

function warningOpen() {
    document.getElementById('warningModal').style.display = 'block';
}

function arrestOpen() {
    document.getElementById('arrestModal').style.display = 'block';
}

function closeModal() {
  $(".modal").hide();
}

window.onclick = function(event) {
  if ($(event.target).hasClass("modal") && $(event.target).attr('id') !== "identifierModal") {
    $(".modal").hide();
  }};

    getCall();
  var newCall = 0;
function getCall() {
var newCallSound = new Audio("../audio/newCall.mp3");
$.post("../utilities/api.php",
{
  function: 'getCall'
},
function(response){
  //console.log(response);
  
  if (response !== 'none') {
      $("#call").show();
      $("#noCallAlert").hide();
      newCall = newCall + 1;
      
    response = JSON.parse(response);
    document.getElementById("call_name").innerHTML = "Call Details - " + response[1];
    document.getElementById("call_info").innerHTML = "CALL " + response[0] + " - " + response[2];
    document.getElementById("call_details").innerHTML = response[3];
    document.getElementById("call_notes").innerHTML = response[4];
      
      
  } else {
      $("#call").hide();
      $("#noCallAlert").show();
      newCall = 0;
  }
  
  if (newCall === 1) {
      console.log('New Call');
    newCallSound.play();
  } 
  
});
getStatus();
setTimeout(getCall, 5000);
}

var typingTimer;
$("#call_notes").on('keyup', function () {
  clearTimeout(typingTimer);
  $("#call #status").text("Saving");
  typingTimer = setTimeout(submitCallNotes, 5000);
});

$("#call_notes").on('keydown', function () {
  clearTimeout(typingTimer);
});

function submitCallNotes () {
    $.post("../utilities/api.php",
    {
      function: 'submitCallNotes',
      notes: $("#call_notes").val()
    },
    function(){
        $("#call #status").text("Saved");
        toastr.success('Saved');
        setTimeout(function() {
            $("#call #status").text("");
        }, 5000);
    });
}
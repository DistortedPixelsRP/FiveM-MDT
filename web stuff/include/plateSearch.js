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
              toastr.error('Could not find plate in database');
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
              $("#plateSearch input#plate").attr('plateid',response[8]);
              plateReport();
    });
}
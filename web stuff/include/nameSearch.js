var nameSearchClone = $("#nameSearch #searchResults").clone();
$("#nameSearch #search").click(function(){
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
    function(response){
        response = JSON.parse(response);

        if (response[0] === "No Results") {
              toastr.error('Could not find name in database');
              $("#nameSearch #searchResults").hide();
        } else {
              if (response[0] === "multiple") {
              $("#civTable").html("<tr><th>Name</th><th>DOB</th><th>Civ</th></tr>" + response[1]);
              nameOpen();
          } else {
            toastr.success('Success');
            $("#nameSearch alert").hide();
            //$("#nameInput").hide();
            $("#nameSearch #searchResults").show();
            $("#nameSearch #searchResults #name").html("Name: " + response[1] + " " +response[2]);
            $("#nameSearch #searchResults #dob").html("DOB: " + response[3]);
            $("#nameSearch #searchResults #gender").html("Gender: " + response[4]);
            $("#nameSearch #searchResults #address").html("Address: " + response[5]);
            $("#nameSearch #searchResults #weapon").html(response[7]);
            getSearchedNameVehicles(response[8]);
            $("#nameSearch input#first").attr('nameid',response[8]);

            var lic = JSON.parse(response[6]);
            for (i in lic) {
                $("#licTable").append('<tr><td>' + lic[i].name + '</td><td>' + lic[i].type + '</td><td>' + lic[i].status + '</td>')
            }

            nameReport();
            tables();
            }
        }
    });

});

function nameReport() {
    var name = $("#nameSearch input#first").attr('nameid');
    var type = $("#nameSearch #nameReportSelect option:selected" ).val();
    $.post("../utilities/api.php",
    {
      function: 'nameReport',
      name: name,
      type: type
    },
    function(response){
        $("#nameSearch #searchResults #nameReportTable").html(response);
    });
}

function nameReportDetailed(id) {
    var type = $("#nameSearch #nameReportSelect option:selected" ).val();
     if ($('#' + id).nextUntil('#nameReportTable tr.header').length === 0) {

    $.post("../utilities/api.php",
    {
      function: 'nameReportDetailed',
      type: type,
      id: id
    },
    function(response){
        $(response).insertAfter("#nameReportTable #"+id);
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
    function(response){
        toastr.success('Success');
        response = JSON.parse(response);
        $("#nameSearch alert").hide();
        //$("#nameInput").hide();
        $("#nameSearch #searchResults").show();
        $("#nameSearch #searchResults #name").html("Name: " + response[1] + " " +response[2]);
        $("#nameSearch #searchResults #dob").html("DOB: " + response[3]);
        $("#nameSearch #searchResults #gender").html("Gender: " + response[4]);
        $("#nameSearch #searchResults #address").html("Address: " + response[5]);
        $("#nameSearch #searchResults #weapon").html(response[7]);
        getSearchedNameVehicles(response[8]);
        $("#nameSearch input#first").attr('nameid',response[8]);
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
    function(response){
        $("#nameSearch #searchResults #vehicles").html("<tr><th>Plate</th><th>Model</th><th>Description</th></tr>" + response);
    });
}
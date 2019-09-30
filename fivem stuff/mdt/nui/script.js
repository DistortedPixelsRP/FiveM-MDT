$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "enableui") {
			if (event.data.enable == false) {
				$('.page').hide();
			} else {
				$('.page').show();
			}
			console.log('enabled');
		} else if (event.data.type == "uiChange") {
		   $('.page').hide();
		   $(event.data.page).show(0);
		   console.log('yo mama ' + event.data.page)
        } else if (event.data.type == "default") {
			$('.page').hide();
		} else if (event.data.type == "showCharacters") {
			$('#characterList').html('');
$.each(event.data.characters, function (index, character) {
  $('#characterList').append("<li><a onclick=\"setCharacter('" + character.first + " " + character.last + "','" + character.id + "');\">" + character.first + " " + character.last + "</a></li>");
});
		} else if (event.data.type == "showID") {
			$('#showID .last').html(event.data.last);
			$('#showID .first').html(event.data.first);
			$('#showID .dob').html(event.data.dob);
			$('#showID .sex').html(event.data.gender);
		} else if (event.data.type == "setID") {
			if (event.data.have == true) {
				$('#items #id').attr("src", "id.png");
			} else {
				$('#items #id').attr("src", "noid.png")
			}
		}
    });
});

function setCharacter(name,id) {
	$.post("http://mdt/setCharacter", JSON.stringify({
		name: name,
		id: id
    }))
}

function reloadCharacterList() {
	$.post("http://mdt/reload", JSON.stringify({
		reload: true
    }))
}

//$('#showID').show(0);
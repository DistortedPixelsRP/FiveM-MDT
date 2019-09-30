/* 
    Some custom stuff to do some stuff
*/

//adds show more to tables if longer then five and has class 'more'
function tables() {
    setTimeout(function() {
        $('table.more').each(function() {
            $(this).find("tr:lt(5)").show();
            if ($(this).find("tr ").length > 5) {
                $(this).after('<a href="#" tableid="' + $(this).attr('id') + '" class="load_more">Show More</a>');
            }
        });


        $('a.load_more').on('click', function(e) {
            e.preventDefault();
            var table = "#" + $(this).attr("tableid");
            $(table + " tr").toggleClass("more");
            if ($(this).text() === "Show More") {
              $(this).text("Show Less");
            } else {
              $(this).text("Show More");
            }
          });
    }, 100);
}

//hides all other screens and opens requested one
function openScreen(open) {
    $(".screen").hide();
    $(open).show();
}

//use enter as alt method of clicking button
$('input').keypress(function(event){
    if(event.which==13){
        var closest = $(this).closest(':has(button)')
        event.preventDefault();
        if($(this).parentsUntil(closest).nextAll('button').length >= 1){
            $(this).parentsUntil(closest).nextAll('button').first().click();
        } else {
            $(this).parentsUntil(closest).nextAll().find('button').first().click();
        }
    }
});
// script.js
$(document).ready(function() {
    $("#departure-date").datepicker();
    $("#return-date").datepicker();

    $("#departure").focus(function() {
        $("#departure-dropdown").show();
    }).blur(function() {
        setTimeout(function() {
            $("#departure-dropdown").hide();
        }, 200);
    });

    $("#arrival").focus(function() {
        $("#arrival-dropdown").show();
    }).blur(function() {
        setTimeout(function() {
            $("#arrival-dropdown").hide();
        }, 200);
    });

    $("#departure-dropdown p").click(function() {
        $("#departure").val($(this).text());
        $("#departure-dropdown").hide();
    });

    $("#arrival-dropdown p").click(function() {
        $("#arrival").val($(this).text());
        $("#arrival-dropdown").hide();
    });

    $("#menu-button").click(function() {
        $("#menu").toggle();
    });

    $(document).click(function(event) {
        if (!$(event.target).closest('#menu, #menu-button').length) {
            $("#menu").hide();
        }
    });
});

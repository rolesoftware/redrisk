function get_categories_by_source(url){
    var selected_source = $('#risk_source').val();
    if (selected_source != "") {
        url = url.replace("replace_source", selected_source);
        $.getJSON(url).done(
            function (json) {
                var options = "";
                for (var i = 0; i < json.length; i++) {
                    options += '<option value="' + json[i][1] + '">' + json[i][0] + '</option>';
                }
                $("#risk_category").html(options);
            }
        );
    } else {
        $("#risk_category").empty();
    }
}

function get_priority_by_probability_and_impact(url){
    var selected_probability = $('#risk_probability').val();
    var selected_impact = $('#risk_impact').val();
    if (selected_probability != "" && selected_impact != "") {
        url = url.replace("replace_probability", selected_probability).replace("replace_impact", selected_impact);
        $.getJSON(url).done(
            function (json) {
                $("#risk_priority").val(json[0]);
                $("#risk_priority_value").val(json[1]);
            }
        );
    } else {
        $("#risk_priority").val("");
        $("#risk_priority_value").val("");
    }
}

$(function() {
    $(".money_field").maskMoney({suffix: $('#money_suffix').val(), prefix: $('#money_prefix').val(), thousands: '.', decimal: ',', affixesStay: true});
});
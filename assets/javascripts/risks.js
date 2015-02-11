$(function () {

    function get_categories_by_source(){
        var selected_source = $('#risk_source').val();
        if (selected_source != "") {
            $.getJSON('/risks/get_category_by_source/' + selected_source).done(
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

    function get_priority_by_probability_and_impact(){
        var selected_probability = $('#risk_probability').val();
        var selected_impact = $('#risk_impact').val();
        if (selected_probability != "" && selected_impact != "") {
            $.getJSON('/risks/get_priority_by_probability_and_impact/probability/' + selected_probability + '/impact/' + selected_impact).done(
                function (json) {
                    $("#risk_priority").val(json[0]);
                    $("#risk_priority_value").val(json[1]);
                }
            );
        } else {
            $("#risk_priority").empty();
            $("#risk_priority_value").empty();
        }
}

    $('#risk_source').change(get_categories_by_source);
    $('#risk_probability').change(get_priority_by_probability_and_impact);
    $('#risk_impact').change(get_priority_by_probability_and_impact);
});
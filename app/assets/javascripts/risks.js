$(function () {

    function get_categories_by_source(){
        var selected_source = $('#risk_source').val();
        if (selected_source != "") {
            $.getJSON('get_category_by_source/' + selected_source).done(
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

    $('#risk_source').change(get_categories_by_source);
});
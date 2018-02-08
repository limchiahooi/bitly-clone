$(document).ready(function() {
    // jQuery will run once everything else in your web page is already loaded
    // All your jQuery codes here

    console.log("jQuery ready!");
    $("#menu").accordion({
        collapsible: true,
        active: false
    });




    $('#url-form').submit(function(event) {
        event.preventDefault();
        console.log("Prevented default")

        $.ajax({
            url: '/submit-post', //this refers to the route post '/urls'
            method: 'POST',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(data) {

                console.log("success");

                let base_url = window.location.origin;
                $('#link_input').val("Success!");
                $('tbody').prepend('\
                    <tr>\
                      <td> ' + data.id + '</td>\
                      <td> ' + data.long_url + '</td>\
                      <td> <a href=' + "'/" + data.short_url + "'>" + base_url + '/' + data.short_url + '</a></td>\
                      <td> ' + data.created_at + '</td>\
                      <td> ' + data.click_count + '</td>\
                    </tr>')
                        },

            error: function(response) {
                $('#link_input').val(response.responseJSON.error_message)
            },


        })

    });

})
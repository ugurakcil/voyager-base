function saveNewsletter(thisDomAddr) {
    var thisEl = $(thisDomAddr);
    var post_url = $(thisDomAddr).attr("action"); //get form action url
    var request_method = $(thisDomAddr).attr("method"); //get form GET/POST method
    var form_data = $(thisDomAddr).serialize(); //Encode form elements for submission

    if(! isEmail($('#newsletter_form_email').val())) {
        Swal.fire({
            title: LOCALIZE.error,
            text: LOCALIZE.wrong_email_address,
            icon: 'error'
        })
        return false
    }

    $.ajax({
        url : post_url,
        type: request_method,
        data : form_data,
        statusCode: {
            429: function() {
                Swal.fire({
                    title: LOCALIZE.error,
                    text: LOCALIZE.too_many_requests,
                    icon: 'error'
                })
            }
        }
    }).done(function(response){
        if(response.error === true){
            console.log(response);
            Swal.fire({
                title: LOCALIZE.error,
                text: response.info,
                icon: 'error'
            })
        } else {
            Swal.fire(
                LOCALIZE.completed,
                response.info,
                'success'
            )

            $('#newsletter_form').html('<div style="padding:10px 0;">'
                + '<i class="fa-regular fa-circle-check"></i> &nbsp;'
                +response.info
                +'</div>')
        }
    });
}

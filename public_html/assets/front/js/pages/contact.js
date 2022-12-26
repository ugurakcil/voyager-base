domReady(function() {
    /**
     * Yeni bir DOMContentLoaded dinlemenize ya da $(() => {}) vs
     * ile jquery başlatıcı eklemenize gerek yok.
     * Burada devam edin, Kodlarınızı fonksiyon olarak tanımlayıp burada çağırın.
     */
    insertScript('/assets/front/addons/swal.js')
});

/**
 * Her form'da KVVK butonu bulunması yasal olarak zorunludur
 * Aşağıda reCaptcha'ya uygun şekilde kullandığımız
 * kvvk kontrolü mevcut.
 * Butonun üzerine tıklanmaması için bir div gelir,
 * bu js ise o divi toggle'lar
 */
function toggleSubmitPdpaCheck(isChecked, buttonCurtainId) { // , buttonCurtainId
    var pendingApprovalCurtain = document.getElementById(buttonCurtainId);

    if(isChecked === true){
        pendingApprovalCurtain.style.display='none';
    } else {
        pendingApprovalCurtain.style.display='block';
    }
}

/**
 * reCaptcha'yı tetikler ve formu başlatır
 * Eğer form gönderilmişse captcha'nın tekrar kullanılması
 * için resetlenir
 */
function captchaCallback(captchaToken){
    grecaptcha.execute().then(function(){
        if(! formSubmit()){
            grecaptcha.reset();
        }
    });
}

/**
 *
 * Captcha'da hata varsa debuglamak için
 */
function captchaError(err){
    console.log('Captcha Error : ', err);

    Swal.fire({
        title: LOCALIZE.error,
        text: LOCALIZE.captcha_validation_error,
        icon: 'error'
    })
}

/**
 * Contact Form'u yakalar ve alanları ilgili
 * backend servisine gönderir
 */
function formSubmit(){
    var formEl = '#contact_form'
    var thisEl = $(formEl);
    var post_url = $(formEl).attr("action"); //get form action url
    var request_method = $(formEl).attr("method"); //get form GET/POST method

    if(! isEmail($('#contactEmail').val())) {
        Swal.fire({
            title: LOCALIZE.error,
            text: LOCALIZE.wrong_email_address,
            icon: 'error'
        })
        return false
    }

    var form_data = new FormData($(formEl)[0]);
    // form_data.append('file', thisEl.find('.file')[0].files[0]);
    form_data.append('area_code', $('.iti__selected-flag').attr('title').split('+')[1]);

    $.ajax({
        url : post_url,
        type: request_method,
        data : form_data,
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        beforeSend: function() {
            thisEl.append('<div class="loader"></div>');
            thisEl.find('.contact-row').hide();
        },
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
        console.log('response',response);
        if(response.error === true){
            Swal.fire({
                title: LOCALIZE.error,
                text: response.info,
                icon: 'error'
            })

            thisEl.find('.contact-row').show();
            thisEl.find('.loader').hide();
        } else {
            Swal.fire(
                LOCALIZE.completed,
                response.info,
                'success'
            )

            thisEl.find('.loader').hide();
            thisEl.html('<div class="completed"></div>');
            /* grecaptcha.reset(); */
        }
    });
}

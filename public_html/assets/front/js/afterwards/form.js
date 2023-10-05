
function initForms() {
    insertScript('/assets/front/addons/swal.js')

    var containers = document.querySelectorAll(".js_contact_form");
    containers.forEach(function (container) {
        var elements = container.querySelectorAll("input, select, button");
        elements.forEach(function (element) {
            element.addEventListener("focus", function () {
                insertScript('https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit&hl=tr')
            });
        });
    });

    // ..
    /*
    captchaLetusPdpa()
    */
}

/*
function captchaLetusPdpa() {

    //FIXED FORM

    var check1 = document.getElementById('call_req_check1');
    var check2 = document.getElementById('call_req_check2');
    var button = document.getElementById('captcha_3');

    function updateButtonState() {
        button.disabled = !(check1.checked && check2.checked);
    }

    // Her iki checkbox için 'change' event listener ekleyelim

    check1.addEventListener('change', updateButtonState);
    check2.addEventListener('change', updateButtonState);

    // Sayfa yüklendiğinde buton durumunu güncelleyelim
    updateButtonState();

    //FORM 1

    var checkForm1 = document.getElementById('call_req_check_form_1');
    var checkForm2 = document.getElementById('call_req_check_form_2');
    var buttonForm1 = document.getElementById('captcha_1');

    if (buttonForm1) {
        function updateButtonStateForForm1() {
            buttonForm1.disabled = !(checkForm1.checked && checkForm2.checked);
            if (buttonForm1.disabled) {
                buttonForm1.style.opacity = 0.5;
                buttonForm1.style.cursor = 'not-allowed';
            } else {
                buttonForm1.style.opacity = 1;
                buttonForm1.style.cursor = 'pointer';
            }
        }

        checkForm1.addEventListener('change', updateButtonStateForForm1);
        checkForm2.addEventListener('change', updateButtonStateForForm1);

        updateButtonStateForForm1();
    }

    //FORM 2

    var checkForm3 = document.getElementById('call_req_check_form_3');
    var checkForm4 = document.getElementById('call_req_check_form_4');
    var buttonForm2 = document.getElementById('captcha_2');

    if (buttonForm2) {
        function updateButtonStateForForm2() {
            buttonForm2.disabled = !(checkForm3.checked && checkForm4.checked);
            if (buttonForm2.disabled) {
                buttonForm2.style.opacity = 0.5;
                buttonForm2.style.cursor = 'not-allowed';
            } else {
                buttonForm2.style.opacity = 1;
                buttonForm2.style.cursor = 'pointer';
            }
        }

        checkForm3.addEventListener('change', updateButtonStateForForm2);
        checkForm4.addEventListener('change', updateButtonStateForForm2);

        updateButtonStateForForm2();
    }
}
*/

var onloadCallback = function () {
    var captchaInitButtons = document.querySelectorAll('.js_captcha_init');

    captchaInitButtons.forEach(captchaInitButtonEl => {
        var dataFormId = captchaInitButtonEl.dataset.formid;

        grecaptcha.render(captchaInitButtonEl, {
            'sitekey': '6LeK62EoAAAAANRG1cF849Z-ng1j32_KSt8W4dMK',
            'callback': function (response) {
                if (!formSubmitGateway(dataFormId, response)) {
                    grecaptcha.reset();
                }
            },
            'expired-callback': function () {
                console.log('reCAPTCHA expired callback' + dataFormId);
                grecaptcha.reset();
            }
        });

        if (dataFormId == 3) {
            captchaLetusPdpa()
        }
    });
};

function formSubmitGateway(formElId, captchaResponse) {
    if (formElId == 1) {
        formSubmitContactStandard(formElId, captchaResponse);
    } else if (formElId == 2) {
        // formSubmitContactOpinion(formElId, captchaResponse);
    } else {
        // formSubmitContactCallRequest(formElId, captchaResponse);
    }
}

function formSubmitContactStandard(formElId, captchaResponse) {
    var formEl = '#contact_form_' + formElId
    var thisEl = $(formEl);
    var post_url = thisEl.attr("action"); //get form action url
    var request_method = thisEl.attr("method"); //get form GET/POST method

    if (!isEmail(thisEl.find('.js_contact_form_email').val())) {
        Swal.fire({
            title: LOCALIZE.error,
            text: LOCALIZE.wrong_email_address,
            icon: 'error'
        })
        return false
    }

    var form_data = new FormData($(formEl)[0]);
    form_data.append('area_code', $('.iti__selected-flag').attr('title').split('+')[1]);

    $.ajax({
        url: post_url,
        type: request_method,
        data: form_data,
        processData: false,
        contentType: false,
        beforeSend: function () {
            thisEl.append('<div class="loader"></div>');
            thisEl.find('.contact-row').hide();
        },
        statusCode: {
            429: function () {
                Swal.fire({
                    title: LOCALIZE.error,
                    text: LOCALIZE.too_many_requests,
                    icon: 'error'
                })
            }
        }
    }).done(function (response) {
        console.log('response', response);
        if (response.error === true) {
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
            // grecaptcha.reset();
        }
    });
}

/*
function formSubmitContactOpinion(formElId, captchaResponse) {
    var formEl = '#contact_form_' + formElId
    var thisEl = $(formEl);
    var post_url = thisEl.attr("action"); //get form action url
    var request_method = thisEl.attr("method"); //get form GET/POST method

    if (!isEmail(thisEl.find('.js_contact_form_email').val())) {
        Swal.fire({
            title: LOCALIZE.error,
            text: LOCALIZE.wrong_email_address,
            icon: 'error'
        })
        return false
    }

    var form_data = new FormData($(formEl)[0]);

    if (thisEl.find('.file')[0].files[0] !== 'undefined') {
        form_data.append('file', thisEl.find('.file')[0].files[0]);
    }

    form_data.append('area_code', $('.iti__selected-flag').attr('title').split('+')[1]);

    // console.warn('formSubmit - entries')
    // for (let [key, value] of form_data.entries()) {
    //    console.log(key, value);
    // }

    $.ajax({
        url: post_url,
        type: request_method,
        data: form_data,
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        beforeSend: function () {
            thisEl.append('<div class="loader"></div>');
            thisEl.find('.contact-row').hide();
        },
        statusCode: {
            429: function () {
                Swal.fire({
                    title: LOCALIZE.error,
                    text: LOCALIZE.too_many_requests,
                    icon: 'error'
                })
            }
        }
    }).done(function (response) {
        if (response.error === true) {
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
            // grecaptcha.reset();
        }
    });
}
*/

/*
function formSubmitContactCallRequest(formElId, captchaResponse) {
    var formEl = '#contact_form_' + formElId
    var thisEl = $(formEl);
    var post_url = thisEl.attr("action"); //get form action url
    var request_method = thisEl.attr("method"); //get form GET/POST method

    var form_data = new FormData($(formEl)[0]);
    form_data.append('area_code', $('.iti__selected-flag').attr('title').split('+')[1]);

    $.ajax({
        url: post_url,
        type: request_method,
        data: form_data,
        processData: false,
        contentType: false,
        beforeSend: function () {
            thisEl.append('<div class="loader"></div>');
            thisEl.find('.contact-row').hide();
        },
        statusCode: {
            429: function () {
                Swal.fire({
                    title: LOCALIZE.error,
                    text: LOCALIZE.too_many_requests,
                    icon: 'error'
                })
            }
        }
    }).done(function (response) {
        if (response.error === true) {
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
            // grecaptcha.reset();
        }
    });
}
*/


/**
 *
 * Captcha'da hata varsa debuglamak için
 */
function captchaError(err) {
    console.log('Captcha Error : ', err);

    Swal.fire({
        title: LOCALIZE.error,
        text: LOCALIZE.captcha_validation_error,
        icon: 'error'
    })
}

/**
 * Her form'da KVVK butonu bulunması yasal olarak zorunludur
 * Aşağıda reCaptcha'ya uygun şekilde kullandığımız
 * kvvk kontrolü mevcut.
 * Butonun üzerine tıklanmaması için bir div gelir,
 * bu js ise o divi toggle'lar
 */
function toggleSubmitPdpaCheck(isChecked, buttonCurtainId) { // , buttonCurtainId
    var pendingApprovalCurtain = document.getElementById(buttonCurtainId);

    if (isChecked === true) {
        pendingApprovalCurtain.style.display = 'none';
    } else {
        pendingApprovalCurtain.style.display = 'block';
    }
}

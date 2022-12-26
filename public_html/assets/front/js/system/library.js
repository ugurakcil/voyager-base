/**
 * Bu dosya sistem dosyasıdır, değiştirmeyin, silmeyin
 * Sadece ne yaptığını anlayın, hayatınız değişsin.
 *
 * Uğur AKÇIL | github.com/ugurakcil | datasins.com
 */

var loadedScripts = [];
var loadedStyles = [];

/**
 * Bazı JS dosyalarını direkt yüklemek yerine
 * işlem başlamaya yakın yüklemek için insertScript kullanılabilir
 *
 * @param {string} src
 * @returns void
 */
function insertScript(src, type = 'text/javascript') {
    // If we have previously attempted injection, then do nothing
    if (loadedScripts.indexOf(src) !== -1)
      return;

    var js = document.createElement("script");
    js.type = type;
    js.src = src;
    document.body.appendChild(js);

    // Push script to array
    loadedScripts.push(src);
}

/**
 * Bazı CSS dosyalarını direkt yüklemek yerine
 * işlem başlamaya yakın yüklemek için insertStyle kullanılabilir
 *
 * @param {string} src
 * @returns void
 */
function insertStyle(src) {
    // If we have previously attempted injection, then do nothing
    if (loadedStyles.indexOf(src) !== -1)
      return;

    var css = document.createElement("link");
    css.type = "module";
    css.href = src;
    css.type = "text/css";
    css.rel = "stylesheet";
    css.media = "screen,print";
    document.body.appendChild(css);

    // Push script to array
    loadedStyles.push(src);
}

/**
 * Dökümanın js için hazır olup olmadığını kontrol eder
 *
 * @param {initCallback} callback
 */
function domReady(initCallback) {
    if (document.readyState !== 'loading') {
        initCallback();
    } else {
        document.addEventListener('DOMContentLoaded', function () {
            initCallback();
        });
    }
}

/**
 * dom hazırlandığında başlayacak işlemler
 */
domReady(function() {
    makeStyleAllPhoneNumbers();
});

/**
* inputmask and inttelinput plugins integrated to phone-number classes
*/
function makeStyleAllPhoneNumbers() {
    if(! document.contains(document.querySelector("input[type=tel]")))
        return;

    insertStyle('/assets/front/addons/intl-tel/build/css/intlTelInput.min.css')
    insertScript('/assets/front/addons/intl-tel/build/js/intlTelInput.min.js')
    insertScript('/assets/front/addons/Inputmask/dist/inputmask.min.js')

    setTimeout(function(){
        var phoneNumbers = document.querySelectorAll("input[type=tel]");

        [].forEach.call(phoneNumbers, function(phoneNumber) {
            window.intlTelInput(phoneNumber, {
                initialCountry: "tr"
            });

            Inputmask({"mask": "(999) 999 9999"}).mask(phoneNumber);
        });
    }, 700);
}

/**
 * E-Mail adresinin doğru olup olmadığını kontrol eder
 *
 * @param string email
 * @returns boolean
 */
function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

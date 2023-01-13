/**
 * Try to write pure javascript
 * Buraya sadece her sayfada, her koşulda çalışan kodları ekleyin
 *
 * Uğur AKÇIL | github.com/ugurakcil | datasins.com
 */

/**
 * Pure Javascript yazmak için domReady'i kontrol edin,
 * Kodun nasıl çalıştığını system/library.js'ten görün
 */
domReady(function() {
    /**
     * Lazyload hemen hemen her projede bulunmalı, kullanılmalı
     * Nasıl kullanıldığına dökümantasyonundan bakın
     */
    var lazyLoadInstance = new LazyLoad();

    setTimeout(function(){
        lazyLoadInstance.update();
    }, 2000)

    /**
     * Tüm kodlarınızı fonksiyonlar halinde ekleyin!
     * Örnektir, silinebilir;
    initScroll()
    */

    /**
     * Bootstrap Bundle'ı sonradan dahil edebilirsiniz
     * ister sayfa yüklendiğinde, ister kullanım amacına göre
    setTimeout(function(){
        insertScript('/assets/front/addons/bootstrap/js/bootstrap.bundle.min.js')
    }, 1000)
     */
})

$("#newsletter_form").submit(function(event){
	event.preventDefault(); //prevent default action

    insertScript('/assets/front/addons/swal.js')
    insertScript('/assets/front/js/afterwards/newsletter.js')

    setTimeout(() => {
        saveNewsletter(this)
    }, 500);
});

/*
jQuery dom starter, tavsiye edilmez!
Sadece jquery eklentileri için kullanın
*/
$(document).ready(function(){
    // ..
})

/**
 * Örnektir, silinebilir.
 *
function initScroll() {
    window.addEventListener("scroll",function(){
        var nav = document.querySelector("nav")
        nav.classList.toggle("sticky",window.scrollY > 0);
    });

    const menu_btn = document.querySelector('.hamburger');
    const mobile_menu = document.querySelector('.mobile-nav');

    menu_btn.addEventListener('click', function () {
        menu_btn.classList.toggle('is-active');
        mobile_menu.classList.toggle('is-active');
    });
}
*/

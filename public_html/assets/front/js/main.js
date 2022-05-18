
let language = document.documentElement.lang;
console.warn("language: ",language);
//var language='tr';

function viewportToPixels(value) {
    var parts = value.match(/([0-9\.]+)(vh|vw)/)
    var q = Number(parts[1])
    var side = window[['innerHeight', 'innerWidth'][['vh', 'vw'].indexOf(parts[2])]]
    return side * (q / 100)
}

//console.warn(screen.width);
console.warn("screen.width", $(window).width())
if($(window).width() >= 1000){
    if(document.getElementsByClassName('container-half').length !== 0 || document.getElementsByClassName('container-half')=='undefined'){
        containerHalfArray = document.getElementsByClassName('container-half');
        containerHalf = containerHalfArray[0].offsetWidth;
        for (let i = 0; i < containerHalfArray.length; i++) {
            containerHalfArray[i].style.width = containerHalf - viewportToPixels('5vw') + "px";
        }
    }
}




$(document).mouseup(function (e) {
    var selectHotel = $(".select-hotel-section");
    var langMenu = $(".lang-menu");
    $('.lang-btn').click(function () {
        $('.lang-menu').toggleClass('toggled');
    });
    $('.select-hotel-btn').click(function () {
        var hotelSeclength = $('.select-hotel-section div').length;
        var hotelImgHeight = $('.select-hotel-section div').innerHeight() + 1;
        var hotelSecHeight = hotelSeclength * hotelImgHeight;
        if ($(".select-hotel-section").hasClass("opened")) {
            $(".select-hotel-section").removeClass('opened');
            $(".select-hotel-section").css('height', '0px');
        }
        else {
            $(".select-hotel-section").addClass('opened');
            $(".select-hotel-section").css('height', '' + hotelSecHeight + 'px');
        }
    });
    if (!selectHotel.is(e.target) && selectHotel.has(e.target).length === 0) {
        $('.select-hotel-section').removeClass("opened");
        $('.select-hotel-section').css({ 'height': '0px' });
    }
    if (!langMenu.is(e.target) && langMenu.has(e.target).length === 0) {
        $('.lang-menu').removeClass("toggled");
    }
});

$(document).ready(function () {
    //imageWidthANHeight();
    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        if ($(window).scrollTop() >= 50) {
            $("header").addClass("header-fixed");
        } else if ($(window).scrollTop() < 50) {
            $("header").removeClass("header-fixed");
        }
    });





});

$('#mainslider').owlCarousel({
    loop:true,
    margin:0,
    dots:false,
    nav:true,
    autoplay:true,
    autoplayTimeout:8000,
    autoplayHoverPause:true,
    navText: [
        '<div class="standart-arrow"><i class="bi bi-chevron-left"></i> </div>',
        '<div class="standart-arrow"><i class="bi bi-chevron-right"></i></div>',
    ],
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
})
$('#homeaccomodation').owlCarousel({
    loop:true,
    margin:0,
    dots:false,
    nav:true,
    autoplay:true,
    autoplayTimeout:3000,
    autoplayHoverPause:true,
    navText: [
        '<div class="standart-arrow"><i class="bi bi-chevron-left"></i> </div>',
        '<div class="standart-arrow"><i class="bi bi-chevron-right"></i></div>',
    ],
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
})

$('#homeaccomodationtwo').owlCarousel({
    loop:true,
    margin:15,
    dots:false,
    nav:true,
    autoplay:false,
    items:1.5,
    autoplayTimeout:3000,
    autoplayHoverPause:false,
    navText: [
        '<div class="standart-arrow"><i class="bi bi-chevron-left"></i> </div>',
        '<div class="standart-arrow"><i class="bi bi bi-chevron-right"></i></div>',
    ],
    responsive:{
        0:{
            items:1.5,
        },
        600:{
            items:1.5,
        },
        1000:{
            items:1.5,
        }
    }
})


setTimeout(function(){
    $('#istagram').owlCarousel({
        loop:true,
        margin:10,
        dots:false,
        nav:true,
        items:6,
        autoplay:true,
        autoplayTimeout:6000,
        autoplayHoverPause:true,
        navText: [
            '<div class="standart-arrow"><div class="left-icon"></div></div>',
            '<div class="standart-arrow"><div class="right-icon"></div></div>',
        ],
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:6
            }
        }
    })
}, 1000)

$('#homeaccomodationthree').owlCarousel({
    loop:true,
    margin:15,
    dots:false,
    //center:true,
    items:1.5,
    rtl: true,
    nav:true,
    autoplay:true,
    autoplayTimeout:3000,
    autoplayHoverPause:true,
    navText: [
        '<div class="standart-arrow"><i class="bi bi-chevron-left"></i> </div>',
        '<div class="standart-arrow"><i class="bi bi bi-chevron-right"></i></div>',
    ],
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1.5,
        },
        1000:{
            items:1.5,
        }
    }
})

$('#homeoffer').owlCarousel({
    loop:true,
    margin:0,
    dots:false,
    nav:true,
    autoplay:true,
    autoplayTimeout:3000,
    autoplayHoverPause:true,
    navText: [
        '<div class="standart-arrow"><i class="bi bi-chevron-left"></i> </div>',
        '<div class="standart-arrow"><i class="bi bi bi-chevron-right"></i></div>',
    ],
    responsive:{
        0:{
            items:1,
            nav:false,
        },
        600:{
            items:1,
            nav:false,
        },
        1000:{
            items:1,
            nav:false,
        }
    }
})
$('#questslider').owlCarousel({
    loop:true,
    margin:0,
    dots:true,
    nav:false,
    items:4,
    //autoplay:true,
    //autoplayTimeout:3000,
    //autoplayHoverPause:true,
    navText: [
        '<div class="standart-arrow"><i class="bi bi-chevron-left"></i> </div>',
        '<div class="standart-arrow"><i class="bi bi bi-chevron-right"></i></div>',
    ],
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:4
        }
    }
})
/** jquery datepicker start **/
$(function () {
    $.datepicker.regional['tr'] = {
        closeText: "kapat",
        prevText: "&#x3C;geri",
        nextText: "ileri&#x3e",
        currentText: "bugün",
        monthNames: ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran",
            "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"],
        monthNamesShort: ["Oca", "Şub", "Mar", "Nis", "May", "Haz",
            "Tem", "Ağu", "Eyl", "Eki", "Kas", "Ara"],
        dayNames: ["Pazar", "Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi"],
        dayNamesShort: ["Pz", "Pt", "Sa", "Ça", "Pe", "Cu", "Ct"],
        dayNamesMin: ["Pz", "Pt", "Sa", "Ça", "Pe", "Cu", "Ct"],
        weekHeader: "Hf",
        dateFormat: "dd.mm.yy",
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ""
    };
    $.datepicker.regional["de"] = {
        closeText: "Schließen",
        prevText: "&#x3C;Zurück",
        nextText: "Vor&#x3E;",
        currentText: "Heute",
        monthNames: ["Januar", "Februar", "März", "April", "Mai", "Juni",
            "Juli", "August", "September", "Oktober", "November", "Dezember"],
        monthNamesShort: ["Jan", "Feb", "Mär", "Apr", "Mai", "Jun",
            "Jul", "Aug", "Sep", "Okt", "Nov", "Dez"],
        dayNames: ["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"],
        dayNamesShort: ["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"],
        dayNamesMin: ["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"],
        weekHeader: "KW",
        dateFormat: "dd.mm.yy",
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ""
    }

    $.datepicker.regional["en"] = {
        closeText: "Done",
        prevText: "Prev",
        nextText: "Next",
        currentText: "Today",
        monthNames: ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"],
        monthNamesShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        dayNames: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
        dayNamesShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
        dayNamesMin: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
        weekHeader: "Wk",
        dateFormat: "dd/mm/yy",
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ""
    };

    $.datepicker.regional['ru'] = {
        closeText: "Закрыть",
        prevText: "&#x3C;Пред",
        nextText: "След&#x3E;",
        currentText: "Сегодня",
        monthNames: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь",
            "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
        monthNamesShort: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн",
            "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"],
        dayNames: ["воскресенье", "понедельник", "вторник", "среда", "четверг", "пятница", "суббота"],
        dayNamesShort: ["вск", "пнд", "втр", "срд", "чтв", "птн", "сбт"],
        dayNamesMin: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
        weekHeader: "Нед",
        dateFormat: "dd.mm.yy",
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ""
    };
    $.datepicker.regional['nl'] = {
        closeText: "Sluiten",
        prevText: "←",
        nextText: "→",
        currentText: "Vandaag",
        monthNames: ["januari", "februari", "maart", "april", "mei", "juni",
            "juli", "augustus", "september", "oktober", "november", "december"],
        monthNamesShort: ["jan", "feb", "mrt", "apr", "mei", "jun",
            "jul", "aug", "sep", "okt", "nov", "dec"],
        dayNames: ["zondag", "maandag", "dinsdag", "woensdag", "donderdag", "vrijdag", "zaterdag"],
        dayNamesShort: ["zon", "maa", "din", "woe", "don", "vri", "zat"],
        dayNamesMin: ["zo", "ma", "di", "wo", "do", "vr", "za"],
        weekHeader: "Wk",
        dateFormat: "dd-mm-yy",
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ""
    };
    
    $.datepicker.setDefaults($.datepicker.regional[language]);
/*
    $(function() {
        $('#datepicker').datepicker( {
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            dateFormat: 'MM yy',
            onClose: function(dateText, inst) { 
                var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                $(this).datepicker('setDate', new Date(year, month, 1));
            }
        });
    }); */
    //var dateFormat = "yy-mm-dd",
    var dateFormat = 'd MM  yy  DD ',
        from2 = $("#from2")
            .datepicker({
                defaultDate: "+1w",
                startDate: '2021-02-23',
                changeMonth: true,
                numberOfMonths: 1,
                value: "2021-02-23",
                dateFormat: dateFormat,
            })
            .on("change", function () {
                to2.datepicker("option", "minDate", getDate(this));
            }).datepicker("setDate", new Date()),


        

        to2 = $("#to2").datepicker({
            defaultDate: "+1w",
            startDate: '2021-02-23',
            value: "2021-02-23",
            changeMonth: true,
            numberOfMonths: 1,
            dateFormat: dateFormat
        })
            .on("change", function () {
                from2.datepicker("option", "maxDate", getDate(this));
            }).datepicker("setDate", new Date())


              $( "#from2" ).on("change", function () {
                let text = from2.val();
                const myArray = text.split(" ");
                for (let i = 0; i < myArray.length; i++) {
                    const element = myArray[i];
                    console.warn("element: ",element + "indexno:"+i);
                }

                $('#day').text(myArray[0]);
                $('#month').text(myArray[1]+" "+myArray[3]);
                $('#dayname').text(myArray[5]);
            })
            let text2 = from2.val();
            const myArray2 = text2.split(" ");
            $('#day').text(myArray2[0]);
            $('#month').text(myArray2[1]+" "+myArray2[3]);
            $('#dayname').text(myArray2[5]);
            console.warn("from2.val() ",from2.val());



            $( "#to2" ).on("change", function () {
                let text = to2.val();
                const myArray = text.split(" ");
                for (let i = 0; i < myArray.length; i++) {
                    const element = myArray[i];
                    console.warn("element: ",element + "indexno:"+i);
                }

                $('#daytwo').text(myArray[0]);
                $('#monthtwo').text(myArray[1]+" "+myArray[3]);
                $('#daynametwo').text(myArray[5]);
            })

            let text3 = to2.val();
            const myArray3 = text3.split(" ");
            $('#daytwo').text(myArray3[0]);
            $('#monthtwo').text(myArray3[1]+" "+myArray3[3]);
            $('#daynametwo').text(myArray3[5]);

            //var dateFormat = "yy-mm-dd",
            var dateFormat = 'd MM  yy  DD ',
            from3 = $("#from3")
                .datepicker({
                    defaultDate: "+1w",
                    startDate: '2021-02-23',
                    changeMonth: true,
                    numberOfMonths: 1,
                    value: "2021-02-23",
                    dateFormat: dateFormat
                })
                .on("change", function () {
                    to3.datepicker("option", "minDate", getDate(this));
                }).datepicker("setDate", new Date()),
    
                to3 = $("#to3").datepicker({
                defaultDate: "+1w",
                startDate: '2021-02-23',
                value: "2021-02-23",
                changeMonth: true,
                numberOfMonths: 1,
                dateFormat: dateFormat
            })
                .on("change", function () {
                    from3.datepicker("option", "maxDate", getDate(this));
                }).datepicker("setDate", new Date())
    
    
                $( "#from3" ).on("change", function () {
                    let text = from3.val();
                    const myArray = text.split(" ");
                    for (let i = 0; i < myArray.length; i++) {
                        const element = myArray[i];
                        console.warn("element: ",element + "indexno:"+i);
                    }
    
                    $('#day3').text(myArray[0]);
                    $('#month3').text(myArray[1]+" "+myArray[3]);
                    $('#dayname3').text(myArray[5]);
                })
                let text4 = from3.val();
                const myArray4 = text4.split(" ");
                $('#day3').text(myArray4[0]);
                $('#month3').text(myArray4[1]+" "+myArray4[3]);
                $('#dayname3').text(myArray4[5]);
    
                $( "#to3" ).on("change", function () {
                    let text = to3.val();
                    const myArray = text.split(" ");
                    for (let i = 0; i < myArray.length; i++) {
                        const element = myArray[i];
                        console.warn("element: ",element + "indexno:"+i);
                    }
    
                    $('#day4').text(myArray[0]);
                    $('#month4').text(myArray[1]+" "+myArray[3]);
                    $('#dayname4').text(myArray[5]);
                })
    
                let text5 = to3.val();
                const myArray5 = text5.split(" ");
                $('#day4').text(myArray5[0]);
                $('#month4').text(myArray5[1]+" "+myArray5[3]);
                $('#dayname4').text(myArray5[5]);



    var dateFormat = "yy-mm-dd";
    frommodal = $("#frommodal")
        .datepicker({
            defaultDate: "+1w",
            startDate: '2021-02-23',
            value: "2021-02-23",
            changeMonth: true,
            numberOfMonths: 1,
            dateFormat: dateFormat,
            container: "#booknowmodal",
        })
        .on("change", function () {
            tomodal.datepicker("option", "minDate", getDate(this));
        }).datepicker("setDate", new Date()),
        tomodal = $("#tomodal").datepicker({
            defaultDate: "+1w",
            startDate: '2021-02-23',
            value: "2021-02-23",
            changeMonth: true,
            numberOfMonths: 1,
            dateFormat: dateFormat
        })
            .on("change", function () {
                tomodal.datepicker("option", "maxDate", getDate(this));
            }).datepicker("setDate", new Date())


          
  function getDate(element) {
        var date;
        try {
            date = $.datepicker.parseDate(dateFormat, element.value);
        } catch (error) {
            date = null;
        }
        return date;
    } 
 /* 
    function getDate(element) {
        var date;
        try {
            date = $.datepicker.parseDate(dateFormat, element.value);
            console.warn('date: ', date);
        } catch (error) {
            date = null;
        }
        console.warn('date: ', date);
        return date;
     
    }
*/


    var dateFormat = "yy-mm-dd";
    $("#child1born").datepicker({
        defaultDate: "+1w",
        dateFormat: dateFormat,
        numberOfMonths: 1,
        startDate: '2015-02-23',
        value: '2015-02-23',
        changeMonth: true,
        changeYear: true,
    });
    $("#child2born").datepicker({
        defaultDate: "+1w",
        dateFormat: dateFormat,
        startDate: '2015-02-23',
        value: '2015-02-23',
        changeMonth: true,
        changeYear: true,
    });
    $("#child3born").datepicker({
        defaultDate: "+1w",
        dateFormat: dateFormat,
        startDate: '2015-02-23',
        value: '2015-02-23',
        changeMonth: true,
        changeYear: true,
    });

    $("#child1born2").datepicker({
        defaultDate: "+1w",
        dateFormat: dateFormat,
        numberOfMonths: 1,
        startDate: '2015-02-23',
        value: '2015-02-23',
        changeMonth: true,
        changeYear: true,
    });
    $("#child2born2").datepicker({
        defaultDate: "+1w",
        dateFormat: dateFormat,
        startDate: '2015-02-23',
        value: '2015-02-23',
        changeMonth: true,
        changeYear: true,
    });
    $("#child3born2").datepicker({
        defaultDate: "+1w",
        dateFormat: dateFormat,
        startDate: '2015-02-23',
        value: '2015-02-23',
        changeMonth: true,
        changeYear: true,
    });
    $("#modalchild1born").datepicker({
        defaultDate: "+1w",
        dateFormat: dateFormat,
        numberOfMonths: 1,
        startDate: '2015-02-23',
        value: '2015-02-23',
        changeMonth: true,
        changeYear: true,
        defaultDate: '2015-02-23',
    });
    $("#modalchild2born").datepicker({
        defaultDate: "+1w",
        dateFormat: dateFormat,
        startDate: '2015-02-23',
        value: '2015-02-23',
        changeMonth: true,
        changeYear: true,
        defaultDate: '2015-02-23',
    });
    $("#modalchild3born").datepicker({
        defaultDate: "+1w",
        dateFormat: dateFormat,
        startDate: '2015-02-23',
        value: '2015-02-23',
        changeMonth: true,
        changeYear: true,
        defaultDate: '2015-02-23',
    });
});


var dateFormat = "yy-mm-dd";
$(".child1born").datepicker({
    defaultDate: "+1w",
    dateFormat: dateFormat,
    numberOfMonths: 1,
    startDate: '2015-02-23',
    value: '2015-02-23',
    changeMonth: true,
    changeYear: true,
});
$(".child2born").datepicker({
    defaultDate: "+1w",
    dateFormat: dateFormat,
    startDate: '2015-02-23',
    value: '2015-02-23',
    changeMonth: true,
    changeYear: true,
});
$(".child3born").datepicker({
    defaultDate: "+1w",
    dateFormat: dateFormat,
    startDate: '2015-02-23',
    value: '2015-02-23',
    changeMonth: true,
    changeYear: true,
});


$('.bookchildcount').on('change', function (e) {
    var childCount = e.target.value;
    //$(this).next('.child')
    switch (childCount) {
        case '0':
            $(this).next('.bookchildone').removeClass('open');
            $(this).next().next('.bookchildtwo').removeClass('open');
            $(this).next().next().next('.bookchildthree').removeClass('open');
            break;
        case '1':
            $(this).next('.bookchildone').addClass('open');
            $(this).next().next('.bookchildtwo').removeClass('open');
            $(this).next().next().next('.bookchildthree').removeClass('open');
            break;
        case '2':
            $(this).next('.bookchildone').addClass('open');
            $(this).next().next('.bookchildtwo').addClass('open');
            $(this).next().next().next('.bookchildthree').removeClass('open');
            break;
        case '3':
            $(this).next('.bookchildone').addClass('open');
            $(this).next().next('.bookchildtwo').addClass('open');
            $(this).next().next().next('.bookchildthree').addClass('open');
            break;
        default:
            break;
    }
});


/*** thumbnail slider start ***/

$(document).ready(function() {

    var aboutone = $("#aboutone");
    var abouttwo = $("#abouttwo");
    var slidesPerPage = 4; //globaly define number of elements per page
    var syncedSecondary = true;

    aboutone.owlCarousel({
        items: 1,
        slideSpeed: 2000,
        nav: true,
        autoplay: false, 
        dots: false,
        loop: true,
        responsiveRefreshRate: 200,
        navText: [
            '<i class="bi bi-chevron-left"></i> ',
            '<i class="bi bi bi-chevron-right"></i>',
        ],
    }).on('changed.owl.carousel', syncPosition);

    abouttwo
        .on('initialized.owl.carousel', function() {
            abouttwo.find(".owl-item").eq(0).addClass("current");
        })
        .owlCarousel({
            items: slidesPerPage,
            dots: true,
            nav: false,
            smartSpeed: 200,
            slideSpeed: 500,
            slideBy: slidesPerPage, //alternatively you can slide by 1, this way the active slide will stick to the first item in the second carousel
            responsiveRefreshRate: 100
        }).on('changed.owl.carousel', syncPosition2);

    function syncPosition(el) {
        //if you set loop to false, you have to restore this next line
        //var current = el.item.index;

        //if you disable loop you have to comment this block
        var count = el.item.count - 1;
        var current = Math.round(el.item.index - (el.item.count / 2) - .5);

        if (current < 0) {
            current = count;
        }
        if (current > count) {
            current = 0;
        }

        //end block

        abouttwo
            .find(".owl-item")
            .removeClass("current")
            .eq(current)
            .addClass("current");
        var onscreen = abouttwo.find('.owl-item.active').length - 1;
        var start = abouttwo.find('.owl-item.active').first().index();
        var end = abouttwo.find('.owl-item.active').last().index();

        if (current > end) {
            abouttwo.data('owl.carousel').to(current, 100, true);
        }
        if (current < start) {
            abouttwo.data('owl.carousel').to(current - onscreen, 100, true);
        }
    }

    function syncPosition2(el) {
        if (syncedSecondary) {
            var number = el.item.index;
            aboutone.data('owl.carousel').to(number, 100, true);
        }
    }

    abouttwo.on("click", ".owl-item", function(e) {
        e.preventDefault();
        var number = $(this).index();
        aboutone.data('owl.carousel').to(number, 300, true);
    });
});

/*** thumbnail slider finish ***/


/*** thumbnail slider start ***/

$(document).ready(function() {

    var aboutone = $("#ourstoryone");
    var abouttwo = $("#ourstorytwo");
    var slidesPerPage = 4; //globaly define number of elements per page
    var syncedSecondary = true;

    aboutone.owlCarousel({
        items: 1,
        slideSpeed: 2000,
        nav: true,
        autoplay: false, 
        dots: false,
        loop: true,
        responsiveRefreshRate: 200,
        navText: [
            '<i class="bi bi-chevron-left"></i> ',
            '<i class="bi bi bi-chevron-right"></i>',
        ],
    }).on('changed.owl.carousel', syncPosition);

    abouttwo
        .on('initialized.owl.carousel', function() {
            abouttwo.find(".owl-item").eq(0).addClass("current");
        })
        .owlCarousel({
            items: slidesPerPage,
            dots: true,
            nav: true,
            smartSpeed: 200,
            slideSpeed: 500,
            slideBy: slidesPerPage, //alternatively you can slide by 1, this way the active slide will stick to the first item in the second carousel
            responsiveRefreshRate: 100
        }).on('changed.owl.carousel', syncPosition2);

    function syncPosition(el) {
        //if you set loop to false, you have to restore this next line
        //var current = el.item.index;

        //if you disable loop you have to comment this block
        var count = el.item.count - 1;
        var current = Math.round(el.item.index - (el.item.count / 2) - .5);

        if (current < 0) {
            current = count;
        }
        if (current > count) {
            current = 0;
        }

        //end block

        abouttwo
            .find(".owl-item")
            .removeClass("current")
            .eq(current)
            .addClass("current");
        var onscreen = abouttwo.find('.owl-item.active').length - 1;
        var start = abouttwo.find('.owl-item.active').first().index();
        var end = abouttwo.find('.owl-item.active').last().index();

        if (current > end) {
            abouttwo.data('owl.carousel').to(current, 100, true);
        }
        if (current < start) {
            abouttwo.data('owl.carousel').to(current - onscreen, 100, true);
        }
    }

    function syncPosition2(el) {
        if (syncedSecondary) {
            var number = el.item.index;
            aboutone.data('owl.carousel').to(number, 100, true);
        }
    }

    abouttwo.on("click", ".owl-item", function(e) {
        e.preventDefault();
        var number = $(this).index();
        aboutone.data('owl.carousel').to(number, 300, true);
    });
});

/*** thumbnail slider finish ***/


/*** thumbnail slider start ***/

$(document).ready(function() {

    var aboutone = $("#restaurantone");
    var abouttwo = $("#restauranttwo");
    var slidesPerPage = 4; //globaly define number of elements per page
    var syncedSecondary = true;

    aboutone.owlCarousel({
        items: 1,
        slideSpeed: 2000,
        nav: true,
        autoplay: false, 
        dots: false,
        loop: true,
        responsiveRefreshRate: 200,
        navText: [
            '<i class="bi bi-chevron-left"></i> ',
            '<i class="bi bi bi-chevron-right"></i>',
        ],
    }).on('changed.owl.carousel', syncPosition);

    abouttwo
        .on('initialized.owl.carousel', function() {
            abouttwo.find(".owl-item").eq(0).addClass("current");
        })
        .owlCarousel({
            items: slidesPerPage,
            dots: true,
            nav: true,
            smartSpeed: 200,
            slideSpeed: 500,
            slideBy: slidesPerPage, //alternatively you can slide by 1, this way the active slide will stick to the first item in the second carousel
            responsiveRefreshRate: 100
        }).on('changed.owl.carousel', syncPosition2);

    function syncPosition(el) {
        //if you set loop to false, you have to restore this next line
        //var current = el.item.index;

        //if you disable loop you have to comment this block
        var count = el.item.count - 1;
        var current = Math.round(el.item.index - (el.item.count / 2) - .5);

        if (current < 0) {
            current = count;
        }
        if (current > count) {
            current = 0;
        }

        //end block

        abouttwo
            .find(".owl-item")
            .removeClass("current")
            .eq(current)
            .addClass("current");
        var onscreen = abouttwo.find('.owl-item.active').length - 1;
        var start = abouttwo.find('.owl-item.active').first().index();
        var end = abouttwo.find('.owl-item.active').last().index();

        if (current > end) {
            abouttwo.data('owl.carousel').to(current, 100, true);
        }
        if (current < start) {
            abouttwo.data('owl.carousel').to(current - onscreen, 100, true);
        }
    }

    function syncPosition2(el) {
        if (syncedSecondary) {
            var number = el.item.index;
            aboutone.data('owl.carousel').to(number, 100, true);
        }
    }

    abouttwo.on("click", ".owl-item", function(e) {
        e.preventDefault();
        var number = $(this).index();
        aboutone.data('owl.carousel').to(number, 300, true);
    });
});

/*** thumbnail slider finish ***/



$('.selectcat').click(function(){
    var galleryId= $(this).attr("id");
    $('.gallery-content').removeClass('open');
    $('.gallery-content').data(galleryId);
    $('[data-gallery-content="'+galleryId+'"]').addClass('open');

});

$('.mobile-menu-btn').click(function(){
    //$('.menu').toggleClass('open');
    $('.menu').slideToggle( "slow" );
});


/**cookie  ***/
if (!localStorage.getItem('cookiereadokone')) {
    if (document.getElementById('cookiereadok')) {
        var cookieReadOk = document.getElementById('cookiereadok');
        cookieReadOk.addEventListener('click', function () {
            localStorage.setItem('cookiereadokone', 'ok');
            var cookiStage = document.getElementById('cookiestage');
            cookiStage.classList.add("d-none");
        });
    }
} else {
    var cookiStage = document.getElementById('cookiestage');
    cookiStage.classList.add("d-none");
}


var today = new Date();
console.warn("today",today);
var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
console.warn("date",date);


let welcomeModal=new bootstrap.Modal(document.getElementById('welcomeModal'))
//welcomeModal.show()
if (!localStorage.getItem('welcome')) {
    localStorage.setItem('welcome',true);
    welcomeModal.show()
}
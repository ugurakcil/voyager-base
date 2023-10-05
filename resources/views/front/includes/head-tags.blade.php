{{--
    Temel bazı css'ler eklenmiştir. Muhtemelen değiştirmeniz gerekmez.
    Yeni css'leri aynı yöntemle aynı pathlere ekleyebilirsiniz.

    Ayrıca `includes` dizinine her sayfada olmayacak alanları eklemeyin.
    Bazı sayfalarda bulunabilecek alanları `sections` klasörüne ekleyin.
--}}

{{-- Constants for custom scripts --}}

<script>
    var BASE_URL        = '{{url("")}}';
    var CURRENT_LANG    = '{{app()->getLocale()}}';
    var LANG_DIR        = '{{$languageDirection}}';
    var LOCALIZE        = JSON.parse('{!!json_encode(__("script"))!!}')
</script>

{{-- !!!Addon styles add here!!! --}}
@if($languageDirection != 'rtl')
    <link rel="stylesheet" href="{{asset('assets/front/addons/bootstrap/css/bootstrap.min.css')}}?v={{$assetVersion}}">
@else
    <link rel="stylesheet" href="{{asset('assets/front/addons/bootstrap/css/bootstrap.rtl.min.css')}}?v={{$assetVersion}}">
@endif

<link rel="stylesheet" href="{{asset('assets/front/addons/fontawesome/6.4.2/css/all.min.css')}}?v={{$assetVersion}}">

{{--
    Aşağıdaki eklentilerin genellikle global kullanım gerektirmez
    Global kullanılmayan eklentileri her sayfada görünecek şekilde eklemeyin!
--}}
{{--
<link rel="stylesheet" href="{{asset('assets/front/addons/intl-tel/build/css/intlTelInput.css')}}?v={{$assetVersion}}">
<link rel="stylesheet" href="{{asset('assets/front/addons/owl/assets/owl.carousel.min.css')}}?v={{$assetVersion}}">
--}}

{{-- !!!Your own CUSTOM STYLE add here!!! --}}
<link rel="stylesheet" href="{{asset('assets/front/css/global-'.$languageDirection.'.min.css')}}?v={{$assetVersion}}">
<link rel="stylesheet" href="{{asset('assets/front/css/desktop-'.$languageDirection.'.min.css')}}?v={{$assetVersion}}" media="screen and (min-width: 992px)">
<link rel="stylesheet" href="{{asset('assets/front/css/mobile-'.$languageDirection.'.min.css')}}?v={{$assetVersion}}" media="screen and (max-width: 991.98px)">

{{--
<link rel="stylesheet" href="{{asset('assets/front/css/tablet-'.$languageDirection.'.min.css')}}?v={{$assetVersion}}" media="screen and (min-width: 768px) and (max-width: 991.98px)">
<link rel="stylesheet" href="{{asset('assets/front/css/mobile-'.$languageDirection.'.min.css')}}?v={{$assetVersion}}" media="screen and (max-width: 767.98px)">
--}}

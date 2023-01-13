{{--
    Temel bazı kütüphaneler aşağıda eklenmiştir.
    Yeni kütüphaneleri aynı yöntemle ekleyin.

    CDN kullanmadan, dosyaları public/assets/addons veya public/assets/js
     klasörlerinden ekleyin.
--}}

{{-- Addon scripts add here --}}
<script src="{{asset('assets/front/addons/jquery/jquery-3.6.1.min.js')}}?v={{$assetVersion}}"></script>
<script src="{{asset('assets/front/addons/bootstrap/js/bootstrap.bundle.min.js')}}?v={{$assetVersion}}" ></script>
<script src="{{asset('assets/front/addons/lazyload.js')}}?v={{$assetVersion}}"></script>

{{--
    Aşağıdaki eklentilerin genellikle global kullanım gerektirmez
    Global kullanılmayan eklentileri her sayfada görünecek şekilde eklemeyin!
--}}
{{--
<script src="{{asset('assets/front/addons/owl/owl.carousel.min.js')}}?v={{$assetVersion}}"></script>
<script src="{{asset('assets/front/addons/swal.js')}}?v={{$assetVersion}}"></script>
--}}

{{-- Custom scripts add here --}}
<script src="{{asset('assets/front/js/system/library.js')}}?v={{$assetVersion}}"></script>
<script src="{{asset('assets/front/js/main.js')}}?v={{$assetVersion}}"></script>

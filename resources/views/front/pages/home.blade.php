@extends('front.layout')

@section('afterTitle', true)
@section('title', $website->title)
@section('meta_description', $website->meta_description)

@section('content')

<header>
    @include("front.includes.navbar")
    @include('front.sections.slide')
</header>

<main>
    @include('front.sections.about-us')
    @include('front.sections.articles')
    @include('front.sections.testimonials')
</main>

@endsection


@section('pages-scripts')
{{-- Page specific scripts --}}
{{--
    Sayfaya özel scriptleri aşağıdaki örnekler gibi ekleyin
    Bir contact section'ı kullanılacaksa javascripti main.js'e tanımlanıp
    her yerden "çağrılmamalı". contact.js gibi ona özel bir custom script
    gerekir. Ayrıca varsa Nocaptcha gibi ek ihtiyaçlar da ilgili dosyadan
    önce bu alana eklenmeli.
--}}

{{--
{!! NoCaptcha::renderJs( app()->getLocale() ) !!}
<script src="{{asset('assets/front/js/pages/contact.js')}}?v={{$assetVersion}}"></script>
<script src="{{asset('assets/front/js/pages/homepage.js')}}?v={{$assetVersion}}"></script>
--}}
<script>
document.addEventListener('DOMContentLoaded', function(){
    /**
    * All elements are loaded for javascript development
    */

}, false);
</script>
@endsection

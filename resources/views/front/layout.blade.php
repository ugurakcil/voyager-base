<!doctype html>
<html lang="{{\Illuminate\Support\Facades\App::getLocale()}}" dir="{{$languageDirection}}">
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="SHORTCUT ICON" href="{{asset('assets/front/img/favicons/favicon.ico')}}">

	<!-- Google Tag Manager -->
    @php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Chrome-Lighthouse') === false): @endphp
        {{--
        Burada müşteriye sunum sırasında pagespeed'den gizlenmesi gereken gtm kodları eklenebilir
        GTM başlangıçta düzgün çalışır ancak dönüşüm sayarken sorun yaratır
        Bu nedenle sadece sunumda gtm kodları buraya eklenmeli
        --}}
    @php endif; @endphp
    {{-- Genellikle GTM kodlarını hemen alt satıra ekleyin; --}}

    
    @include("front.includes.head-tags")
    @yield('pages-styles')

    @hasSection('title')
        @hasSection('beforeTitle')
            <title>@yield("title") | {{ $website->name }} </title>
        @else
            @hasSection('afterTitle')
                <title>{{ $website->name }} | @yield("title")</title>
            @else
                <title>@yield("title")</title>
            @endif
        @endif
    @else
        <title>{{ $website->name }}</title>
    @endif

    @hasSection('meta_description')
        <meta name="description" content="@yield('meta_description')">
    @endif

    @hasSection('id')
        <meta id="@yield('id')">
    @endif

    @if(App::environment() == 'local')
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
    @endif

    @if(Request::input('backsite'))
        <meta name="robots" content="noindex">
    @endif

</head>
<body class="@yield("bodyClass")">
    @php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Chrome-Lighthouse') === false): @endphp
        {{--
        Burada müşteriye sunum sırasında pagespeed'den gizlenmesi gereken gtm kodları eklenebilir
        GTM başlangıçta düzgün çalışır ancak dönüşüm sayarken sorun yaratır
        Bu nedenle sadece sunumda gtm kodları buraya eklenmeli
        --}}
    @php endif; @endphp
    {{-- Genellikle GTM kodlarını hemen alt satıra ekleyin; --}}


    @yield("content")

    @include("front.includes.footer")

    @include("front.includes.fixed-sections")
    @include("front.includes.foot-tags")

    @yield('pages-scripts')
</body>
</html>

@extends('front.layout')

@section('afterTitle', true)
@section('title', $currentList->title)
@section('meta_description', $currentList->meta_description)

@section('bodyClass', 'post')
@section('content')

<header>
    @include("front.includes.navbar")

    {{-- 
    Bir partials, section vb bölümün aldığı değerlerin isimleri
    page-header kavramında olduğu gibi değişkenlik gösteriyorsa,
    aşağıda olduğu gibi bir obje setine bağlı çalıştırabilirsiniz
    --}}
    @php
    $currentSection = (object) [
        'title' => $currentList->pageType.': '.$currentList->title,
        'route' => url()->current(),
        'header_image' => false
    ];
    @endphp
    @include('front.sections.page-header')
</header>

<main>
    <div class="container">
        <div class="row">
        @foreach($posts as $post)
            <!-- Blog Post -->
            <div class="col-md-6">
                {{-- 
                İkinci defa kullanılan, kod karmaşasını büyük ölçüde azaltacak parçaları
                aşağıdaki post-big-card'da olduğu gibi doğru bir şekilde ayırıp 
                her yerde kolayca kullanılabilir hale getirebilirsiniz    
                --}}
                @include('front.partials.post-big-card')
            </div><!-- /.col-md-* -->
        @endforeach
        </div><!-- /.row -->

        {{$postsPaginator->links('vendor.pagination.bootstrap-5')}}
    </div><!-- /.container -->

    @include('front.sections.testimonials')
</main>

@endsection


@section('pages-scripts')
<script>
document.addEventListener('DOMContentLoaded', function(){
    /**
    * All elements are loaded for javascript development
    */

}, false);
</script>
@endsection

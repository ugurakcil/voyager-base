@extends('front.layout')

@section('afterTitle', true)
@section('title', $page->title)
@section('meta_description', $page->meta_description)

@section('bodyClass', 'page')
@section('content')

<header>
    @include("front.includes.navbar")

    @php
    $currentSection = (object) [
        'title' => $page->title,
        'route' => route('page', ['lang' => app()->getLocale(), 'slug' => $page->slug]),
        'header_image' => $page->header_image
    ];
    @endphp
    @include('front.sections.page-header')
</header>

<main>
    <div class="container">
    <div class="row g-5">
        <div class="col-md-8">
            <h3 class="page_subtitle">
                {{$page->sub_title}}
            </h3>

            <article class="blog-post">
                {!!$page->body!!}
            </article>
        </div>
        <div class="col-md-4">
            <aside class="page">
                <div class="position-sticky" style="top: 2rem;">

                    @if(mb_strlen($page->image) > 5)
                    <div class="main-image">
                        <img src="{{Storage::url(afterImageName($page->image, 'medium'))}}" alt="static">
                    </div>
                    @endif

                    @if(mb_strlen($page->excerpt) > 5)
                    <div class="excerpt-box">
                        <p class="mb-0">
                            {{$page->excerpt}}
                        </p>
                    </div>
                    @endif

                    <div class="p-4">
                        <h4 class="fst-italic">{{__('site.get_to_know_us_better')}}</h4>
                        <ol class="list-unstyled mb-0">
                            @foreach ($globalPages as $pageId => $pageRow)
                            @if($pageId != $page->id)
                                <li>
                                    <a title="{{$pageRow->title}}"
                                    href="{{route('page', ['lang' => app()->getLocale(), 'slug' => $pageRow->slug])}}">
                                        {{$pageRow->title}}
                                    </a>
                                </li>
                            @endif
                            @endforeach
                        </ol>
                    </div>

                    <div class="p-4">
                    <h4 class="fst-italic">{{__('site.social_media')}}</h4>
                    <ol class="social-media">
                        @include('front.list.social-media')
                    </ol>
                    </div>
                </div><!-- /.position-sticky -->
            <aside>
        </div><!-- /.col-md-4 -->
    </div><!-- /.row g-5 -->
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

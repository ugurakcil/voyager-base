@extends('front.layout')

@section('afterTitle', true)
@section('title', $post->seo_title ? $post->seo_title : $post->title)
@section('meta_description', $post->meta_description)

@section('bodyClass', 'post')
@section('content')

<header>
    @include("front.includes.navbar")

    @php
    $currentSection = (object) [
        'title' => $post->title,
        'route' => piri('blog.post', ['lang' => app()->getLocale(), 'slug' => $post->slug]),
        'header_image' => $post->image
    ];
    @endphp
    @include('front.sections.page-header')
</header>

<main>
    <div class="container">
    <div class="row g-5">
        <div class="col-md-8">
            <h3 class="page_subtitle">
                {{$post->sub_title}}
            </h3>

            <article class="blog-post">
                {!!$post->body!!}


                <div class="card-date">
                    {{ localizedDate($post->created_at, '%d %B %Y %A')}}
                </div>
            </article>
        </div>
        <div class="col-md-4">
            <aside class="page">
                <div class="position-sticky" style="top: 2rem;">

                    @if(mb_strlen($post->excerpt) > 5)
                    <div class="excerpt-box">
                        <p class="mb-0">
                            {{$post->excerpt}}
                        </p>
                    </div>
                    @endif

                    <div class="p-4">
                        <h4 class="fst-italic">{{__('site.categories')}}</h4>
                        <ol class="list-unstyled mb-0">
                            @foreach ($postCategories as $postCategoryRow)
                            <li>
                                <a title="{{$postCategoryRow->title}}"
                                    href="{{piri('blog.category', ['lang' => app()->getLocale(), 'slug' => $postCategoryRow->slug])}}">
                                    {{$postCategoryRow->title}}
                                </a>
                            </li>
                            @endforeach
                        </ol>
                    </div>

                    <div class="p-4">
                        <h4 class="fst-italic">{{__('site.tags')}}</h4>
                        @foreach ($post->tags as $postTag)
                            <a title="{{$postTag->title}}"
                                class="d-inline-block"
                                href="{{piri('blog.tag', ['lang' => app()->getLocale(), 'slug' => $postTag->slug])}}">
                                #{{$postTag->title}}
                            </a>
                        @endforeach
                    </div>

                    <div class="p-4">
                        <h4 class="fst-italic">{{__('site.get_to_know_us_better')}}</h4>
                        <ol class="list-unstyled mb-0">
                            @foreach ($globalPages as $postId => $postRow)
                            @if($postId != $post->id)
                                <li>
                                    <a title="{{$postRow->title}}"
                                    href="{{piri('blog.post', ['lang' => app()->getLocale(), 'slug' => $postRow->slug])}}">
                                        {{$postRow->title}}
                                    </a>
                                </li>
                            @endif
                            @endforeach
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

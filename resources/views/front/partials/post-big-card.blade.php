<div class="big-card card mb-4 bg-dark text-white">
    {{-- 
    Bir card'a location.href vermektense büyük bir görseli varsa 
    <a href> vermek seo ve ux açısından daha doğru bir kullanımdır    
    --}}
    <a href="{{route('post', ['slug' => $post->slug])}}" title="{{$post->title}}">
        <img class="card-img-top" src="{{asset('storage/'.$post->image)}}" alt="{{$post->title}}">
    </a>
    <div class="card-body">
        <div class="card-tags">
            <a href="{{route('category', ['slug' => $post->category->getTranslatedAttribute('slug')])}}"
                class="fw-bolder text-decoration-none me-2"
                title="{{$post->category->getTranslatedAttribute('title')}}">
                {{strtitle($post->category->getTranslatedAttribute('title'))}}
            </a>

            @foreach($post->tags as $postTag)
                <a href="{{route('tag', ['slug' => $postTag->getTranslatedAttribute('slug')])}}" 
                    title="{{$postTag->getTranslatedAttribute('title')}}"
                    class="me-2">
                    #{{$postTag->getTranslatedAttribute('title')}}
                </a>
            @endforeach
        </div>
        <h2 class="card-title">
            <a href="{{route('post', ['slug' => $post->slug])}}" 
                title="{{$post->title}}"
                class="text-decoration-none text-warning">
                {{$post->title}}
            </a>
        </h2>
        <div class="badge bg-warning text-wrap card-date mb-2">
            {{ localizedDate($post->created_at, '%d %B %Y %A')}}
        </div>
        <p class="card-text">
            {{$post->excerpt}}
            <span class="card-more">
                <a href="{{route('post', ['slug' => $post->slug])}}" title="{{$post->title}}">&rarr;</a>
            </span>
        </p>
    </div><!-- /.card-body -->
</div><!-- /.big-card -->
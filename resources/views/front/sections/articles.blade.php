{{--
Örnektir, section tag'i içindeki herşeyi silin
--}}

@if(isset($homePosts) && count($homePosts) > 0)
<section class="articles text-bg-warning">
    <div class="container">

        {{--
        ilgili id ile parça içerik getirilemezse bu section'ın title ve excerpt alanları görünmez,
        eğer kullanılmayacaksa bu alanı silmelisiniz.
        Bu tip anlaşılması kolay olmayan kısımları 1 satırlık cümlelerle laravel yorum satırlarında açıklayın
        --}}
        @if(isset($parts) && isset($parts[2]))
        <div class="row d-flex justify-content-center">
            <div class="col-md-10 col-xl-8 text-center">

                {{--
                Tek satırlık koşullarla girilmeme ihtimali olan içerik alanlarını kontrol edebilirsiniz
                --}}
                <h3 class="mb-4">{{ $parts[2]->title ? $parts[2]->title : __('site.content_required')}}</h3>

                <p class="mb-4 pb-2 mb-md-5 pb-md-0">
                    {{$parts[2]->excerpt ? $parts[2]->excerpt : __('site.content_required_long')}}
                </p>
            </div>
        </div>
        @endif

        {{--
        row'un default css'lerine müdahale etmemek için important kullanmamalı
        ve ÖZEL KAPSAYICI TANIMINIZI en başa yazmalısınız.
        Bu sayede bootstrap'ın row'da tanımlı değerlerini ezmezsiniz

        * bs'te btn-primary, card gibi alanların css'lerini ezebilirsiniz,
        ancak row gibi yapısal alanlar ezilmemeli. Bu nedenle;
        class="card my-customized-example-card" gibi bir sıralama card'lar için doğrudur.
        --}}
        <div class="article-card row text-start">

            @foreach($homePosts as $homePost)
            <div class="col-md-4 mb-5 pt-3 pb-3" onclick="location.href='{{route('post', ['slug' => $homePost->slug])}}'">
                <div class="article-card-img" style="background-image:url('{{Storage::url(afterImageName($homePost->image, 'medium'))}}')"></div>
                
                {{-- 
                location.href ile bir kutuya yönlendirme verilse dahi
                seo için bu url'e <a href> ile erişim sağlanmak zorundadır
                --}}
                <a href="{{route('post', ['slug' => $homePost->slug])}}"
                    class="article-card-title"
                    title="{{$homePost->title}}">
                    <h5 class="mb-3">{{$homePost->title}}</h5>
                </a>
                <p class="px-xl-3">
                    <i class="fa-solid fa-quote-left pe-2"></i>{{$homePost->excerpt}}
                </p>

                {{--
                Buraya ait etiketler gibi bir alanın class adını "BURAYA AİT" olduğunu belirterek yazmalıyız.
                Burada doğru kullanım class="article-card-tags" oluyor.

                * Sadece kapsayıcı da class="horizantal-cards article-card" gibi bir kullanım varsa
                ve zaten article-card-tags'ın ek bir css özelliği olmadan bir çok horizantal-cards'a ait etiket yapısıysa
                horizantal-card-tags kullanımı yapılabilir ve bu bize horizantal-cards konseptindeki global kullanım olduğunu gösterir

                * horizantal-card-tags'e ek olarak küçük değişiklikler yapılırsa şu tanımlama da doğrudur;
                class="horizantal-card-tags article-card-tags"
                --}}
                <div class="article-card-tags">
                    <a href="{{route('category', ['slug' => $homePost->category->getTranslatedAttribute('slug')])}}"
                        class="text-decoration-none fw-bolder btn btn-warning"
                        title="{{$homePost->category->getTranslatedAttribute('title')}}">
                        {{strtitle($homePost->category->getTranslatedAttribute('title'))}}
                    </a>

                    @foreach($homePost->tags as $postTag)
                    <a href="{{route('tag', ['slug' => $postTag->getTranslatedAttribute('slug')])}}"
                        class="btn btn-warning"
                        title="{{$postTag->getTranslatedAttribute('title')}}">
                        #{{strtitle($postTag->getTranslatedAttribute('title'))}}
                    </a>
                    @endforeach
                </div>

            </div>
            @endforeach

        </div><!-- /.row.text-start -->

    </div><!-- /.container -->
</section>
@endif

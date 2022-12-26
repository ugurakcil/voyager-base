{{--
Örnektir, kod örneklerini kopyalayıp kullanabilir ya da
ihtiyacınız yoksa dosyayı veya kodları silebilirsiniz.
Bu ve buna benzer "silin" içerikleri yazıları ise muhakkak silin
Kazara kodlarınızı silmesinler

Location.href kullansanız bile bir anchor link verin,
Seo için zorunludur
--}}

@if(isset($slideList) && count($slideList) > 0)
<section class="slide">
  <div id="carouselMainSlide" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselMainSlide" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselMainSlide" data-bs-slide-to="1" aria-label="Slide 2"></button>
    </div>
    <div class="carousel-inner">

      @foreach ($slideList as $slideRow)
      <div
      class="carousel-item @if($loop->index === 0) active @endif"
      data-bs-interval="10000"
      @if(mb_strlen($slideRow->page_url) > 5)
        onclick="location.href='{{url(app()->getLocale().'/'.$slideRow->page_url)}}'"
      @endif>

        <img src="{{Storage::url($slideRow->image)}}" class="d-block w-100" alt="{{$slideRow->title}}">

        @if(mb_strlen($slideRow->title) > 5)
            <div class="carousel-caption d-none d-md-block">
                <h5>
                    {{$slideRow->title}}
                </h5>

                @if(mb_strlen($slideRow->sub_title) > 5)
                    <h6>{{$slideRow->sub_title}}</h6>
                @endif

                <p>
                    {{$slideRow->excerpt}}

                    @if(mb_strlen($slideRow->page_url) > 5)
                    <a href="{{url(app()->getLocale().'/'.$slideRow->page_url)}}"
                        title="{{$slideRow->title}}">
                        {{__('generic.details')}}
                    </a>
                    @endif
                </p>
            </div><!-- /.carousel-caption -->
        @endif
      </div>
      @endforeach


    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselMainSlide" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselMainSlide" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</section>
@endif

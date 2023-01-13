{{--
Örnektir, section tag'i içindeki herşeyi silin
Silmeden önce tag kapanış notu örneklerine dikkat edin
Uzun tag alanlarında karışıkları önlemek için kapanış bilgisi eklemek önemlidir
--}}

@if(isset($parts) && isset($parts[1]))
<section class="testimonials ">
    <div class="container">
        <div class="p-4 p-md-5 text-center text-lg-start">
            <div class="text-center">
                <h3>{{strtitle($parts[3]->title)}}</h3>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-10">
                <div class="card">
                    <div class="card-body m-3">
                    <div class="row">
                        <div class="col-lg-4 d-flex justify-content-center align-items-center mb-4 mb-lg-0">
                        {{--
                        Daima afterImageName ile en uygun ölçekteki görseli tanımlayın.
                        Yüksek çözünürlüklü resimlerin küçük bir alana yüklenmesi,
                        gereksiz site yavaşlığı ve kötü seo optimizasyonu yaratır.

                        * Her türlü medyanın başına Storage::url eklemeyi unutmayın!
                        --}}
                        <img src="{{Storage::url(afterImageName($parts[3]->image,'cropped'))}}"
                            class="rounded-circle img-fluid shadow-1" alt="woman avatar" width="200" height="200">
                        </div>
                        <div class="col-lg-8 text-muted fw-light">
                            {!!$parts[3]->body!!}
                        </div>
                    </div>
                    </div>
                </div><!--/.card -->
                </div><!--/.col-md -->
            </div>
        </div>
    </div>
</section>
@endif

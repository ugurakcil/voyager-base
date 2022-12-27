{{--
Örnektir, section tag'i içindeki herşeyi silin
--}}

@if(isset($parts) && isset($parts[1]))
<section class="about-us">
    <div class="container">
        <div class="row flex-lg-row-reverse align-items-center">
            <div class="col-12 col-lg-6 example-about-image-wrapper">
                <img src="{{Storage::url($parts[1]->image)}}" class="d-block mx-lg-auto img-fluid rounded w-100" alt="{{$parts[1]->title}}" width="800" height="400" loading="lazy">
            </div>
            <div class="col-lg-6">
                <h1 class="display-5 fw-bold lh-1 mb-3">{{$parts[1]->title}}</h1>
                <p class="lead">{{$parts[1]->excerpt}}</p>
                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                <a href="{{url($parts[1]->link1_url)}}" class="btn btn-warning btn-lg px-4 me-md-2">{{$parts[1]->link1_text}}</a>
                <a href="{{url($parts[2]->link2_url)}}" class="btn btn-outline-secondary btn-lg px-4">{{$parts[1]->link2_text}}</a>
                </div>
            </div>
        </div>
    </div>
</section>
@endif

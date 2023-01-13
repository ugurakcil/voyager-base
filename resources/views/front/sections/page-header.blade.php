<section class="page-header"
         @if(mb_strlen($currentSection->header_image) > 5)
         style="background-image: url('{{Storage::url($currentSection->header_image)}}')"
         @endif>

    <div class="container d-flex flex-wrap justify-content-center">
        <a
        title="{{$currentSection->title}}"
        href="{{$currentSection->route}}"
        class="page-title d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-decoration-none">
            <h1><i class="fa-solid fa-mountain-sun"></i> {{$currentSection->title}}</h1>
        </a>
    </div>

</section>

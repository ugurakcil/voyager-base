{{--
Örnektir, section tag'i içindeki herşeyi silin
--}}

@if(isset($homePosts) && count($homePosts) > 0)
<section class="articles text-bg-warning">
    <div class="container">
      <div class="row d-flex justify-content-center">
        <div class="col-md-10 col-xl-8 text-center">
          <h3 class="mb-4">Latest Articles</h3>
          <p class="mb-4 pb-2 mb-md-5 pb-md-0">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet
            numquam iure provident voluptate esse quasi, veritatis totam voluptas nostrum
            quisquam eum porro a pariatur veniam.
          </p>
        </div>
      </div>

      <div class="row text-start">

	@foreach($homePosts as $homePost)
        <div class="col-md-4 mb-5">
          <div class="article-list-img" style="background-image:url('{{Storage::url($homePost->image)}}')"></div>
          <h5 class="mb-3">{{$homePost->title}}</h5>
          <p class="px-xl-3">
            <i class="fa-solid fa-quote-left pe-2"></i>{{$homePost->excerpt}}
          </p>
          <h6 class="mb-3">XYZ</h6>
        </div>
	@endforeach

      </div><!-- /.row.text-start -->

    </div><!-- /.container -->
  </section>
@endif

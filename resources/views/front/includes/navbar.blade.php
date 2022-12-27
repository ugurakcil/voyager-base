{{--
Örnektir, yapıyı örnek olarak inceleyin ve bu yazı dahil herşeyi silin
--}}

<div class="top-navigation border-bottom border-warning py-2 text-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <span class="d-none d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-none me-3 pt-2">
                    <strong>{{$website->email}}</strong>
                </span>
                <span class="me-3">
                    <i class="fa-solid fa-phone me-1 text-warning"></i>
                    <a href="tel:+{{$website->phone}}" title="{{__('site.contact')}}" class="text-decoration-none">
                        {!!localizatedPhoneNumberFormat($website->phone, 'en', app()->getLocale())!!}
                    </a>
                </span>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 d-none d-lg-block d-md-block-d-sm-block d-xs-none text-end">

                <span class="top-corporate-links me-3">
                    <i class="fa-solid fa-file me-2"></i>

                    {{-- Privacy Policy --}}
                    <x-links.generic
                        type="page"
                        :row="$globalPages[4]"/>

                </span>

                <div class="dropdown choose-language d-inline-block">
                    <a class="btn btn-default text-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                        {{strupper(app()->getLocale())}}
                    </a>

                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        @foreach (config('app.available_locales') as $locale => $localeUrl)
                        @if(app()->getLocale() != $locale)
                        <li>
                            <a href="{{route('setLocale', ['locale' => $locale])}}" class="dropdown-item" title="{{$locale}}">
                                {{strupper($locale)}}
                            </a>
                        </li>
                        @endif
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg sticky-top navbar-dark p-3 shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="{{url(app()->getLocale())}}" title="{{$website->name}}">
            <i class="fa-solid fa-shop me-2"></i>
            <strong>{{$website->name}}</strong>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="mx-auto my-3 d-lg-none d-sm-block d-xs-block">
            <div class="input-group">
                <span class="border-warning input-group-text bg-warning text-white"><i class="fa-solid fa-magnifying-glass"></i></span>
                <input type="text" class="form-control border-warning">
                <button class="btn btn-warning text-white">{{__('site.search')}}</button>
            </div>
        </div>
        <div class=" collapse navbar-collapse" id="navbarNavDropdown">
            <div class="ms-auto d-none d-lg-block">
                <div class="input-group">
                    <span class="border-warning input-group-text bg-warning text-white"><i class="fa-solid fa-magnifying-glass"></i></span>
                    <input type="text" class="form-control border-warning">
                    <button class="btn btn-warning text-white">{{__('site.search')}}</button>
                </div>
            </div>
            <ul class="navbar-nav ms-auto ">

                {{-- Homepage --}}
                <x-links.generic
                    type="home"
                    li="nav-item"
                    a="nav-link mx-2 text-uppercase"
                    :row="(object) ['title' => __('site.homepage')]"/>

                {{-- About Us --}}
                <x-links.generic
                    type="page"
                    li="nav-item"
                    a="nav-link mx-2 text-uppercase"
                    :row="$globalPages[1]"/>

                {{-- Post Categories --}}
                <li class="dropdown choose-language d-inline-block">
                    <a class="btn btn-default text-light dropdown-toggle" href="#" role="button" id="dropdownPostCategories" data-bs-toggle="dropdown" aria-expanded="false">
                        {{__('site.categories')}}
                    </a>

                    <ul class="dropdown-menu" aria-labelledby="dropdownPostCategories">

                        @foreach ($postCategories as $postCategoryRow)
                            {{-- Post Category --}}
                            <x-links.generic
                                type="post"
                                a="dropdown-item"
                                :row="$postCategoryRow"/>
                        @endforeach

                    </ul>
                </li>

            </ul>
            <ul class="navbar-nav ms-auto ">

                {{-- Contact --}}
                <x-links.generic
                    type="page"
                    li="nav-item"
                    a="nav-link mx-2 text-uppercase"
                    icon="fa-solid fa-envelope"
                    :row="$globalPages[3]"/>

            </ul>
        </div>
    </div>
</nav>
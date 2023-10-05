{{--
Örnektir, navbar tag'i içindeki herşeyi silin
--}}

<footer class="default bg-dark text-light">
    <div class="container">
        <div class="row">
            <div class="col-6 col-md-3 mb-3">
                <h5>{{__('site.corporate')}}</h5>
                <ul class="nav flex-column">

                    {{-- Homepage --}}
                    <x-links.generic
                        piri="home"
                        li="nav-item mb-2"
                        :row="(object) ['title' => __('site.homepage')]"/>

                    {{-- About Us --}}
                    <x-links.generic
                        piri="page"
                        type="basic"
                        li="nav-item mb-2"
                        :row="$globalPages[1]"/>

                </ul>
            </div>

            <div class="col-6 col-md-4 mb-3">
                <h5>{{__('site.user_aggrements')}}</h5>
                <ul class="nav flex-column">

                    {{-- Privacy Policy --}}
                    <x-links.generic
                        piri="page"
                        type="basic"
                        li="nav-item mb-2"
                        :row="$globalPages[4]"/>

                </ul>
            </div>

            <div class="col-md-5 mb-3">

                <h5>{{__('site.social_media')}}</h5>
                <ul class="nav social-media">
                    @include('front.partials.social-media')
                </ul>

                <h5 class="mt-4 mb-2">{{__('site.newsletter_title')}}</h5>
                <p>{{__('site.newsletter_text')}}</p>

                <form action="{{piri('saveNewsletter')}}" method="POST" id="newsletter_form" class="needs-validation" novalidate>
                    <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                        <input type="hidden" name="_token" value="{{csrf_token()}}">

                        <label for="newsletter_form_email" class="visually-hidden">{{__('site.your_email_address')}}</label>
                        <input id="newsletter_form_email" class="form-control" name="email" placeholder="{{__('site.email_address')}}" required>

                        <button class="btn btn-warning" type="submit">{{__('site.subscribe')}}</button>
                    </div>
                </form>

            </div>
        </div>

        <div class="d-flex flex-column flex-sm-row justify-content-between pt-4 pb-1 mt-2 border-top">
            <p>{{__('site.copyright', ['year' => numberLocalization('2023', 'en', app()->getLocale())])}}</p>
        </div>
    </div>
</footer>

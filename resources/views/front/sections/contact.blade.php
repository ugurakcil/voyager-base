<section class="contact">
    <div class="container">
        <form method="POST" action="{{piri('saveContact')}}" id="contact_form">
        <div class="contact-row">
            <input type="hidden" name="_token" value="{{csrf_token()}}">

            <h3 class="page-inside-title">{{__('site.drop_us_a_message')}}</h3>
            <div class="row">
                <div class="col-md-6">

                    <div class="mb-3">
                        <label for="contactUser" class="form-label">{{__('site.your_name_surname')}}</label>
                        <input type="text" class="form-control" id="contactUser" name="name" placeholder="{{__('site.name_surname')}}">
                    </div>

                    <div class="mb-3">
                        <label for="contactEmail" class="form-label">{{__('site.your_email_address')}}</label>
                        <input type="text" class="form-control" id="contactEmail" name="email" placeholder="{{__('site.email_address')}}">
                    </div>

                    <div class="mb-3">
                        <label for="contactPhoneNumber" class="form-label">{{__('site.your_phone_number')}}</label>
                        <input type="tel" class="form-control" id="contactPhoneNumber" name="phone" placeholder="{{__('site.phone_number')}}">
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="form-group">

                    <div class="mb-3">
                        <label for="contactMessage" class="form-label">{{__('site.your_message')}}</label>
                        <textarea id="contactMessage" class="form-control" name="message" placeholder="{{__('site.write_your_message')}} *"></textarea>
                    </div>
                    </div>
                </div>
                <div class="col-md-12 text-center">

                    <div class="d-inline-block mt-3 mb-2">
                        <input
                        class="form-check-input" type="checkbox" value="1" id="pdpacheck"
                        onchange="toggleSubmitPdpaCheck(this.checked, 'contact_form_button')">

                        <label class="form-check-label" for="pdpacheck">
                            {!!__('site.pdpa_approval')!!}
                        </label>
                    </div>

                    <div class="btn-pending-approval-wrapper">
                        <div class="btn-pending-approval-curtain" id="contact_form_button"></div>
                        <input class="btn btn-lg btn-warning g-recaptcha"
                            type="submit" data-callback="captchaCallback"
                            data-error-callback="captchaError"
                            data-sitekey="6Lcapo0jAAAAAFM_Sz6nK3i1zmMRivk8M2lTzqJp"
                            value="{{__('site.send_your_message')}}">
                    </div>

                </div>
            </div>
        </div><!-- /.contact-row -->
        </form>
    </div>
</section>

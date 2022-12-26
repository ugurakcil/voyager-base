@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
    $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
    $exclude = [
        'title', 'sub_title', 'body', 'excerpt',
        'slug', 'status', 'featured', 'image',
        'meta_description', 'seo_title'
    ];
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {!! $dataType->getTranslatedAttribute('display_name_singular') !!}
        {!! ' <span class="process-type">'.__('voyager::generic.'.($edit ? 'edit' : 'add')).'</span>' !!}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content container-fluid">
        <form class="form-edit-add" role="form"
            action="@if(!is_null($dataTypeContent->getKey())){{ route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) }}@else{{ route('voyager.'.$dataType->slug.'.store') }}@endif"
            method="POST" enctype="multipart/form-data">
            <!-- PUT Method if we are editing -->
            @if($edit)
                {{ method_field("PUT") }}
            @endif
            {{ csrf_field() }}

            <div class="row">
                <div class="col-md-8">

                    @if (count($errors) > 0)
                    <div class="panel">
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                    @endif

                    @if(isset($fieldNames['title']) || isset($fieldNames['excerpt']))
                    <!-- ### TITLE ### -->
                    <div class="panel">

                        @include('voyager::formfields.panel-inside', [
                            'currentFieldName'  => 'title'
                        ])

                        @include('voyager::formfields.panel-inside', [
                            'currentFieldName'  => 'sub_title'
                        ])

                        @include('voyager::formfields.panel-inside', [
                            'currentFieldName'  => 'excerpt'
                        ])

                    </div>
                    @endif

                    @isset($fieldNames['body'])
                    <!-- ### CONTENT ### -->
                    <div class="panel">
                        @include('voyager::formfields.panel-inside', [
                            'currentFieldName'  => 'body'
                        ])
                    </div><!-- .panel -->
                    @endisset

                    <div class="panel">
                        @foreach($dataTypeRows as $row)
                            @if(!in_array($row->field, $exclude))
                                @if(!isset($row->details->column) ||
                                !isset($dataTypeContent->baseCategoryName) ||
                                $row->details->column != $dataTypeContent->baseCategoryName)
                                    @include('voyager::formfields.panel-inside', [
                                        'currentFieldName'  => $row->field
                                    ])

                                @endif
                            @endif
                        @endforeach
                    </div>

                </div>
                <div class="col-md-4">

                    @if(isset($fieldNames['slug']) || isset($fieldNames['status']) || isset($fieldNames['category_id']))
                    <!-- ### DETAILS ### -->
                    <div class="panel panel panel-bordered panel-dark">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="icon wb-clipboard"></i> {{ __('generic.details') }}</h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse" aria-hidden="true"></a>
                            </div>
                        </div>
                        <div class="panel-body">

                            @include('voyager::formfields.label-inside', [
                                'currentFieldName'  => 'slug'
                            ])

                            @include('voyager::formfields.label-inside', [
                                'currentFieldName'  => 'status'
                            ])

                            @php
                            $baseCategoryRelation = \VoyagerCustom::findFieldRelation($dataTypeRows, $dataTypeContent->baseCategoryName)
                            @endphp
                            @if($baseCategoryRelation)
                                @include('voyager::formfields.label-inside', [
                                    'currentFieldName'  => $baseCategoryRelation
                                ])
                            @endif

                            @include('voyager::formfields.label-inside', [
                                'currentFieldName'  => 'featured'
                            ])
                        </div>
                    </div>
                    @endif

                    @isset($fieldNames['image'])
                    <!-- ### IMAGE ### -->
                    <div class="panel panel-bordered panel-dark">
                        @include('voyager::formfields.panel-inside', [
                            'currentFieldName'  => 'image'
                        ])
                    </div>
                    @endisset


                    @if(isset($fieldNames['meta_description']) || isset($fieldNames['seo_title']))
                    <!-- ### SEO CONTENT ### -->
                    <div class="panel panel-bordered panel-dark">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="icon wb-search"></i> {{ __('generic.seo_content') }}</h3>
                            <div class="panel-actions">
                                <a class="panel-action voyager-angle-down" data-toggle="panel-collapse" aria-hidden="true"></a>
                            </div>
                        </div>
                        <div class="panel-body">

                            @include('voyager::formfields.label-inside', [
                                'currentFieldName'  => 'seo_title'
                            ])

                            @include('voyager::formfields.label-inside', [
                                'currentFieldName'  => 'meta_description'
                            ])

                        </div>
                    </div>
                    @endif

                </div>
            </div>

            @section('submit-buttons')
                <button type="submit" class="btn btn-primary btn-lg pull-right">
                     @if($edit){{ __('generic.everything_seems_ok') }}@else <i class="icon wb-plus-circle"></i> {{ __('generic.everything_seems_ok') }} @endif
                     <i class="voyager-check"></i>
                </button>
            @stop
            @yield('submit-buttons')
        </form>

        <iframe id="form_target" name="form_target" style="display:none"></iframe>
        <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
            <input name="image" id="upload_file" type="file"
                     onchange="$('#my_form').submit();this.value='';">
            <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
            {{ csrf_field() }}
        </form>
    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
        var params = {};
        var $file;

        function deleteHandler(tag, isMulti) {
          return function() {
            $file = $(this).siblings(tag);

            params = {
                slug:   '{{ $dataType->slug }}',
                filename:  $file.data('file-name'),
                id:     $file.data('id'),
                field:  $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
          };
        }

        $('document').ready(function () {
            $('#slug').slugify();

            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.type != 'date' || elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
                $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });

        // DEX: Solved select2 problem with multilingual
        $('[name=i18n_selector]').change(function(){
            if($('[name=status]').length){
                setTimeout(function(){
                    $('[name=status]').select2().trigger('change');
                },200);
            }
        });
    </script>
@stop

@isset($fieldNames[$currentFieldName])
@php
$isFieldTranslatable = is_field_translatable(
    $dataTypeContent,
    (object) ['field' => $currentFieldName]
);
$row = $fieldNames[$currentFieldName];
@endphp
    <label for="{{$currentFieldName}}">{{ $row->getTranslatedAttribute('display_name') }}</label>
    @if($isFieldTranslatable)
        <span class="language-label js-language-label"></span>
    @endif
    @php
    $display_options = $row->details->display ?? NULL;
    @endphp
    @if (isset($row->details->formfields_custom))
        @include('voyager::formfields.custom.' . $row->details->formfields_custom)
    @else
        <div class="form-group @if($row->type == 'hidden') hidden @endif @if(isset($display_options->width)){{ 'col-md-' . $display_options->width }}@endif" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
            {{ $row->slugify }}
            @include('voyager::multilingual.custom-input-hidden')
            @if($row->type == 'relationship')
                @include('voyager::formfields.relationship', ['options' => $row->details])
            @else
                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
            @endif

            @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                {!! $after->handle($row, $dataType, $dataTypeContent) !!}
            @endforeach
        </div>
    @endif

@endisset

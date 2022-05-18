@if ($isFieldTranslatable)
    <input type="hidden"
        data-i18n="true"
        name="{{ $currentFieldName }}_i18n"
        id="{{ $currentFieldName }}_i18n"
        @if(!empty(session()->getOldInput($currentFieldName.'_i18n') && is_null($dataTypeContent->id)))
            value="{{ session()->getOldInput($currentFieldName.'_i18n') }}"
        @else
            value="{{ get_field_translations($dataTypeContent, $currentFieldName) }}"
        @endif>
@endif

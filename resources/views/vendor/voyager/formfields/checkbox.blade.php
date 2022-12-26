<br>
<?php $checked = false; ?>
@if(isset($dataTypeContent->{$row->field}) || old($row->field))
    <?php $checked = old($row->field, $dataTypeContent->{$row->field}); ?>
@else
    <?php $checked = isset($options->checked) &&
        filter_var($options->checked, FILTER_VALIDATE_BOOLEAN) ? true: false; ?>
@endif

<?php $class = $options->class ?? "toggleswitch"; ?>
@if(isset($options->on) && isset($options->off))
    <input type="checkbox" name="{{ $row->field }}" class="{{ $class }}"
        id="{{ $row->field }}" class="styled_checkbox"
        data-on="{{ __('options.'.$options->on) }}" {!! $checked ? 'checked="checked"' : '' !!}
        data-off="{{ __('options.'.$options->off) }}">
@else
    <input type="checkbox" name="{{ $row->field }}" class="{{ $class }}"
        id="{{ $row->field }}" class="styled_checkbox"
        @if($checked) checked @endif>
@endif

<label for="checkbox_{{ $data->getKey() }}" class="styled_checkbox_label">
    <div class="checkbox__inner">
        <div class="green__ball"></div>
    </div>
</label>

@php
if($type == 'page') {
    $fullRoute = route($type, ['lang' => app()->getLocale(), 'slug' => $row->slug]);
} else if($type == 'post') {
    $fullRoute = route($type, ['lang' => app()->getLocale(), 'slug' => $row->slug]);
} else {
    $fullRoute = route($type, ['lang' => app()->getLocale()]);
}
@endphp

{{--
TODO: strupper vs.. kontrol et
--}}

@if($li)
    <li {{$attributes->class([$li, $isActivated()])}}>
@endif

    <a {{ $attributes->class([$a, $isActivated()]) }}
    href="{{$fullRoute}}"
    title="{{$title ? $title : $row->title}}">

        @if($icon)
            <i {{$attributes->class([$icon])}}></i>
        @endif

        {{$title ? $title : $row->title}}
    </a>

@if($li)
    </li>
@endif

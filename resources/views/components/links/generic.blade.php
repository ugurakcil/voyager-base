@php
$title = $title ? $title : $row->title;

switch ($type) {
    case 'page':
        $fullRoute = route($type, ['lang' => app()->getLocale(), 'slug' => $row->slug]);
        break;
    case 'post':
        $fullRoute = route($type, ['lang' => app()->getLocale(), 'slug' => $row->slug]);
        break;
    case 'category':
        $fullRoute = route($type, ['lang' => app()->getLocale(), 'slug' => $row->slug]);
        break;
    default:
        $fullRoute = route($type, ['lang' => app()->getLocale()]);
        break;
}

switch ($lettercase) {
    case 'upper':
        $title = strupper($title);
        break;
    case 'lower':
        $title = strlower($title);
        break;
    case 'title':
        $title = strtitle($title);
        break;
}
@endphp

@if($li)
    <li {{$attributes->class([$li, $isActivated()])}}>
@endif

    <a {{ $attributes->class([$a, $isActivated()]) }}
        href="{{$fullRoute}}"
        title="{{$title ? $title : $row->title}}">

        @if($icon)
            <i {{$attributes->class([$icon])}}></i>
        @endif

        {{$title}}
    </a>

@if($li)
    </li>
@endif

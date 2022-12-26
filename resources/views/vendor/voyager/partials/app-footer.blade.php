<footer class="app-footer">
    <div class="site-footer-right">
        {{-- @if (rand(1,100) == 100)
            <i class="voyager-rum-1"></i> {{ __('voyager::theme.footer_copyright2') }}
        @else
        @endif
        --}}
        {!! __('voyager::theme.footer_copyright') !!} {{--<a href="https://www.datasins.com" target="_blank">Datasins</a>--}}

        @php $version = Voyager::getVersion(); @endphp
        @if (!empty($version))
            - {{ $version }}
        @endif
    </div>
</footer>
<div class="animated-background-wrapper">
    <div class="animated-background"></div>
</div>

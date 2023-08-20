<div class="toc">
    <div>{{ __('site.table_of_contents') }}</div>

        @foreach($dataToc as $item)
            @if ($item['list_open'])
                <ol>
            @endif
            @if ($item['item_open'])
                <li>
            @endif
            @if ($item['text'])
                <a href="{{ $item['href'] }}">{{ $item['text'] }}</a>
            @endif
            @if ($item['item_close'])
                </li>
            @endif
            @if ($item['list_close'])
                </ol>
            @endif
        @endforeach
</div>

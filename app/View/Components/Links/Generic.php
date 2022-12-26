<?php

namespace App\View\Components\Links;

use Illuminate\View\Component;

class Generic extends Component
{
    /**
     * The type of route
     *
     * @var string|boolean
     */
    public $type;

    /**
     * The list field classnames or boolean
     *
     * @var string|boolean
     */
    public $li;

    /**
     * The anchor classnames or boolean.
     *
     * @var string|boolean
     */
    public $a;

    /**
     * The icon classnames
     *
     * @var string|boolean
     */
    public $icon;

    /**
     * These contents for dynamic contents.
     *
     * @var object
     */
    public $row;

    /**
     * Customize title
     *
     * @var string|boolean
     */
    public $title;

    /**
     * Determine if the given segment is the currently opened page.
     *
     * @param  string  $option
     * @return bool
     */
    public function isActivated()
    {
        if ($this->type == 'page') {
            return $this->row->slug === request()->segment(3) ? 'active' : '';
        } else {
            return !request()->segment(2) ? 'active' : '';
        }
    }

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct(
        $li = false,
        $a = false,
        $icon = false,
        $row = false,
        $type = 'page',
        $title = false
    ) {
        $this->li       = $li;
        $this->a        = $a;
        $this->icon     = $icon;
        $this->row      = $row;
        $this->type     = $type;
        $this->title    = $title;
        // TODO: $this->fullRoute
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.links.generic');
    }
}

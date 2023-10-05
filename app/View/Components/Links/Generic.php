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
    public $piri;

    /**
     * Route scheme name
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
     * Lettercase of title
     *
     * @var string|boolean
     */
    public $lettercase;

    /**
     * Determine if the given segment is the currently opened page.
     *
     * @param  string  $option
     * @return bool
     */
    public function isActivated()
    {
        if ($this->type == 'basic') {
            return $this->row->slug === request()->segment(3) ? 'active' : '';
        } else if ($this->type == 'category') {
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
        $type = false,
        $title = false,
        $lettercase = false,
        $piri = 'page',
    ) {
        $this->li           = $li;
        $this->a            = $a;
        $this->row          = $row;
        $this->piri         = $piri;
        $this->icon         = $icon;
        $this->type         = $type;
        $this->title        = $title;
        $this->lettercase   = $lettercase;
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

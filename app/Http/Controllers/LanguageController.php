<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;

class LanguageController extends Controller
{
    /**
     * Set the language for the session
     *
     * @param Request $request
     * @param string $locale
     * @return \Illuminate\Http\RedirectResponse
     */
    public function setLocale(Request $request, $locale) {
        if(!$this->isLocaleAvailable($locale)) {
            return abort(403, 'Language not supported.');
        }

        $previousUrl = parse_url(url()->previous());

        $previousJustPath = isset($previousUrl['path']) ? $previousUrl['path'] : '';
        $previousQuery = isset($previousUrl['query']) ? '?'.$previousUrl['query'] : '';

        $previousPath = str_replace(url('/').'/', '', $previousJustPath);
        $backSegments = array_values(array_filter(explode('/', $previousPath)));

        if($this->isLocaleFirstSegment($backSegments)) {
            $backSegments[0] = $locale;

            return redirect()->to(url(implode('/', $backSegments)).$previousQuery);
        } elseif($this->isLocaleSegment($backSegments)) {
            if($locale == $this->getMainLocale()) {
                $localeUrl = '';
            } else {
                $localeUrl = $locale;
            }

            return redirect()->to(url('/'.$localeUrl).$previousQuery);
        } elseif($this->isLocaleSecondSegment($backSegments)) {
            $backSegments[1] = $locale;

            return redirect()->to(url(implode('/', $backSegments)).$previousQuery);
        } else {
            return redirect()->to(url()->previous());
        }
    }

    // dil destekleniyor mu
    private function isLocaleAvailable($locale) {
        return array_key_exists($locale, Config::get('app.available_locales'));
    }

    // default dil
    private function getMainLocale() {
        return array_key_first(Config::get('app.available_locales'));
    }

    // dil var ya da anasayfadan segmentsiz gelmiş
    private function isLocaleFirstSegment($backSegments) {
        return !isset($backSegments[0]) || strlen($backSegments[0]) <= 2;
    }

    // dil segmenti var
    private function isLocaleSegment($backSegments) {
        return isset($backSegments[0]) && $backSegments[0] == 'locale';
    }

    // website segmentinden sonra dil segmenti gelir
    private function isLocaleSecondSegment($backSegments) {
        return isset($backSegments[0])
            && (!isset($backSegments[1])
            || (isset($backSegments[1])
            && strlen($backSegments[1]) <= 2)
        );
    }
}

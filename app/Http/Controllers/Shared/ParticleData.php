<?php

namespace App\Http\Controllers\Shared;

use Illuminate\Http\Request;
use TCG\Voyager\Translator\Collection as VoyagerCollection;
use TCG\Voyager\Translator as VoyagerTranslator;
use Illuminate\Http\RedirectResponse;

use App\Models\Hospital;

/**
 * A class that handles featured content related functions.
 * @category  Controller
 * @package   App\Http\Controllers\Shared
 */
class ParticleData extends \App\Http\Controllers\Controller
{
    public function getHospitals(): array {
        $hospitalsRaw = Hospital
            ::get()
            ->translate(app()->getLocale())->keyBy('id')
            ->keyBy('id');

        $hospitalsWithType = [
            'headquarters' => [],
            'standard' => []
        ];

        foreach($hospitalsRaw as $hospital) {
            // headquarters
            if($hospital->type == 1) {
                array_push($hospitalsWithType['headquarters'], $hospital);
            } else {
                array_push($hospitalsWithType['standard'], $hospital);
            }
        }

        return [
            $hospitalsWithType,
            $hospitalsRaw
        ];
    }
}

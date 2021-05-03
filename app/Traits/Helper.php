<?php

namespace App\Traits;

class Helper{

    public static function checkPairPositive(array $data) : array
    {
        $array = [];
        foreach ($data as $row) {
            $negative = -$row;
            if (array_search($negative, $data, true)) {
                if ($row > 0) {
                    $array[] = $row;
                }
            }
        }
        sort($array);
        return $array;
    }
}

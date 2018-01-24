<?php

declare(strict_types = 1);

namespace App;

class ControllerHelper
{

    public function doHelp(string $whom): string
    {
        if ($x = 1) {
            $whom = $whom . '!';
        }
        return 'I\'m helping ' . $whom;
    }
}

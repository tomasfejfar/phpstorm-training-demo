<?php

declare(strict_types = 1);

namespace App;

class ControllerHelper
{

    public function doHelp(string $whom): string
    {
        return 'I\'m helping ' . $whom;
    }
}

<?php
declare(strict_types = 1);

use Symfony\Component\Console\Input\ArgvInput;

set_time_limit(0);

require __DIR__.'/../vendor/autoload.php';


$input = new ArgvInput();
$filename = $argv[1];
$file = file_get_contents($filename);

if (strlen($file) > 0) {
    exit(0);
}

echo"File is empty!" . PHP_EOL;
exit(1);

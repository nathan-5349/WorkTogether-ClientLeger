<?php

declare(strict_types=1);

namespace App\Utils;

final class Slugger
{
    public function slugify(string $input): string
    {
        $value = mb_strtolower(trim($input));
        $value = preg_replace('/[^a-z0-9]+/u', '-', $value) ?? '';
        $value = trim($value, '-');

        return $value;
    }
}
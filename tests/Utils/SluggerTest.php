<?php

declare(strict_types=1);

namespace App\Tests\Utils;

use App\Utils\Slugger;
use PHPUnit\Framework\TestCase;

final class SluggerTest extends TestCase
{
    public function testSlugify(): void
    {
        // on va faire un test de PR pour tester le workflow de CI/CD
        $slugger = new Slugger();

        self::assertSame('bonjour-le-monde', $slugger->slugify('Bonjour le monde'));
        self::assertSame('hello-world', $slugger->slugify('  Hello   world  '));
    }
}

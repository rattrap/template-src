<?php
declare(strict_types=1);

namespace Acme\App\Tests;

use Acme\App\Template;
use PHPUnit\Framework\TestCase;

final class TemplateTest extends TestCase
{

    private $template;

    public function setUp()
    {

        $this->template = new Template();
        parent::setUp();
    }

    public function testExecuteMethodRunsSuccessfully()
    {
        $this->assertTrue($this->template->execute());

    }
}
<?php

namespace App\Entity;

use App\Repository\MapeaCoreRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MapeaCoreRepository::class)
 */
class MapeaCore
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $javascript;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $styles;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $configuration;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getJavascript(): ?string
    {
        return $this->javascript;
    }

    public function setJavascript(string $javascript): self
    {
        $this->javascript = $javascript;

        return $this;
    }

    public function getStyles(): ?string
    {
        return $this->styles;
    }

    public function setStyles(string $styles): self
    {
        $this->styles = $styles;

        return $this;
    }

    public function getConfiguration(): ?string
    {
        return $this->configuration;
    }

    public function setConfiguration(string $configuration): self
    {
        $this->configuration = $configuration;

        return $this;
    }
}

<?php

namespace App\Entity;

use App\Repository\MapeaControlConfigRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MapeaControlConfigRepository::class)
 */
class MapeaControlConfig
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $config;

    /**
     * @ORM\ManyToOne(targetEntity=MapeaControl::class, inversedBy="mapeaControlConfigs")
     * @ORM\JoinColumn(nullable=false)
     */
    private $mapeaControl;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $name;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getConfig(): ?string
    {
        return $this->config;
    }

    public function setConfig(string $config): self
    {
        $this->config = $config;

        return $this;
    }

    public function getMapeaControl(): ?MapeaControl
    {
        return $this->mapeaControl;
    }

    public function setMapeaControl(?MapeaControl $mapeaControl): self
    {
        $this->mapeaControl = $mapeaControl;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function __toString() {
        return $this -> getName();
    }

}

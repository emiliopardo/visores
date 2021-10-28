<?php

namespace App\Entity;

use App\Repository\MapeaPluginConfigRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MapeaPluginConfigRepository::class)
 */
class MapeaPluginConfig
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
    private $description;

    /**
     * @ORM\Column(type="object")
     */
    private $config;

    /**
     * @ORM\ManyToOne(targetEntity=MapeaPlugin::class, inversedBy="mapeaPluginConfigs")
     * @ORM\JoinColumn(nullable=false)
     */
    private $mapeaPlugin;

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

    public function getConfig()
    {
        return $this->config;
    }

    public function setConfig($config): self
    {
        $this->config = $config;

        return $this;
    }

    public function getMapeaPlugin(): ?MapeaPlugin
    {
        return $this->mapeaPlugin;
    }

    public function setMapeaPlugin(?MapeaPlugin $mapeaPlugin): self
    {
        $this->mapeaPlugin = $mapeaPlugin;

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
}

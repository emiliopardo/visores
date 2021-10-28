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
     * @ORM\Column(type="json")
     */
    private $config = [];

    /**
     * @ORM\ManyToOne(targetEntity=MapeaPlugin::class, inversedBy="mapeaPluginConfigs")
     * @ORM\JoinColumn(nullable=false)
     */
    private $mapeaPlugin;

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

    public function getConfig(): ?array
    {
        return $this->config;
    }

    public function setConfig(array $config): self
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
}

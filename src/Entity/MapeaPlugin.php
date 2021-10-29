<?php

namespace App\Entity;

use App\Repository\MapeaPluginRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MapeaPluginRepository::class)
 */
class MapeaPlugin
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=25)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $javascript;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $styles;

    /**
     * @ORM\OneToMany(targetEntity=MapeaPluginConfig::class, mappedBy="mapeaPlugin")
     */
    private $mapeaPluginConfigs;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $constructor;

    /**
     * @ORM\Column(type="boolean", options={"default":0})
     */
    private $needConfig;

    public function __construct()
    {
        $this->mapeaPluginConfigs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
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

    /**
     * @return Collection|MapeaPluginConfig[]
     */
    public function getMapeaPluginConfigs(): Collection
    {
        return $this->mapeaPluginConfigs;
    }

    public function addMapeaPluginConfig(MapeaPluginConfig $mapeaPluginConfig): self
    {
        if (!$this->mapeaPluginConfigs->contains($mapeaPluginConfig)) {
            $this->mapeaPluginConfigs[] = $mapeaPluginConfig;
            $mapeaPluginConfig->setMapeaPlugin($this);
        }

        return $this;
    }

    public function removeMapeaPluginConfig(MapeaPluginConfig $mapeaPluginConfig): self
    {
        if ($this->mapeaPluginConfigs->removeElement($mapeaPluginConfig)) {
            // set the owning side to null (unless already changed)
            if ($mapeaPluginConfig->getMapeaPlugin() === $this) {
                $mapeaPluginConfig->setMapeaPlugin(null);
            }
        }

        return $this;
    }

    public function __toString() {
        return $this -> getName();
    }

    public function getConstructor(): ?string
    {
        return $this->constructor;
    }

    public function setConstructor(?string $constructor): self
    {
        $this->constructor = $constructor;

        return $this;
    }

    public function getNeedConfig(): ?bool
    {
        return $this->needConfig;
    }

    public function setNeedConfig(?bool $needConfig): self
    {
        $this->needConfig = $needConfig;

        return $this;
    }
}

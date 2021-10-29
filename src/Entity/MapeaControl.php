<?php

namespace App\Entity;

use App\Repository\MapeaControlRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MapeaControlRepository::class)
 */
class MapeaControl
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $constructor;

    /**
     * @ORM\OneToMany(targetEntity=MapeaControlConfig::class, mappedBy="mapeaControl")
     */
    private $mapeaControlConfigs;

    /**
     * @ORM\Column(type="boolean", options={"default":0})
     */
    private $needConfig;

    public function __construct()
    {
        $this->mapeaControlConfigs = new ArrayCollection();
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

    public function getConstructor(): ?string
    {
        return $this->constructor;
    }

    public function setConstructor(string $constructor): self
    {
        $this->constructor = $constructor;

        return $this;
    }

    /**
     * @return Collection|MapeaControlConfig[]
     */
    public function getMapeaControlConfigs(): Collection
    {
        return $this->mapeaControlConfigs;
    }

    public function addMapeaControlConfig(MapeaControlConfig $mapeaControlConfig): self
    {
        if (!$this->mapeaControlConfigs->contains($mapeaControlConfig)) {
            $this->mapeaControlConfigs[] = $mapeaControlConfig;
            $mapeaControlConfig->setMapeaControl($this);
        }

        return $this;
    }

    public function removeMapeaControlConfig(MapeaControlConfig $mapeaControlConfig): self
    {
        if ($this->mapeaControlConfigs->removeElement($mapeaControlConfig)) {
            // set the owning side to null (unless already changed)
            if ($mapeaControlConfig->getMapeaControl() === $this) {
                $mapeaControlConfig->setMapeaControl(null);
            }
        }

        return $this;
    }

    public function __toString() {
        return $this -> getName();
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

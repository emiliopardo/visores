<?php

namespace App\Entity;

use App\Repository\MapeaLayerGeojsonRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MapeaLayerGeojsonRepository::class)
 */
class MapeaLayerGeojson
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
    private $name;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $layerName;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $layerUrl;

    /**
     * @ORM\Column(type="boolean")
     */
    private $extract;

    /**
     * @ORM\Column(type="object", options={"default":0})
     */
    private $layerStyle;

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

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getLayerName(): ?string
    {
        return $this->layerName;
    }

    public function setLayerName(string $layerName): self
    {
        $this->layerName = $layerName;

        return $this;
    }

    public function getLayerUrl(): ?string
    {
        return $this->layerUrl;
    }

    public function setLayerUrl(string $layerUrl): self
    {
        $this->layerUrl = $layerUrl;

        return $this;
    }

    public function getExtract(): ?bool
    {
        return $this->extract;
    }

    public function setExtract(bool $extract): self
    {
        $this->extract = $extract;

        return $this;
    }

    public function getLayerStyle()
    {
        return $this->layerStyle;
    }

    public function setLayerStyle($layerStyle): self
    {
        $this->layerStyle = $layerStyle;

        return $this;
    }

    public function __toString(){

        return $this->getName();

    }
}

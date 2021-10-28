<?php

namespace App\Entity;

use App\Repository\MapeaLayerWMSRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MapeaLayerWMSRepository::class)
 */
class MapeaLayerWMS
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
    private $layerLegend;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $layerUrl;

    /**
     * @ORM\Column(type="boolean", options={"default":0})
     */
    private $layerTransparent;

    /**
     * @ORM\Column(type="boolean", options={"default":0})
     */
    private $layerTiled;

    /**
     * @ORM\Column(type="string", length=255, options={"default":"default"})
     */
    private $layerStyle;

    /**
     * @ORM\ManyToOne(targetEntity=Legend::class, inversedBy="mapeaLayerWMS")
     */
    private $layerLegendImage;

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

    public function getLayerLegend(): ?string
    {
        return $this->layerLegend;
    }

    public function setLayerLegend(string $layerLegend): self
    {
        $this->layerLegend = $layerLegend;

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

    public function getLayerTransparent(): ?bool
    {
        return $this->layerTransparent;
    }

    public function setLayerTransparent(bool $layerTransparent): self
    {
        $this->layerTransparent = $layerTransparent;

        return $this;
    }

    public function getLayerTiled(): ?bool
    {
        return $this->layerTiled;
    }

    public function setLayerTiled(bool $layerTiled): self
    {
        $this->layerTiled = $layerTiled;

        return $this;
    }

    public function getLayerStyle(): ?string
    {
        return $this->layerStyle;
    }

    public function setLayerStyle(string $layerStyle): self
    {
        $this->layerStyle = $layerStyle;

        return $this;
    }

    public function __toString(){
        
        return $this->getName();
    }

    public function getLayerLegendImage(): ?Legend
    {
        return $this->layerLegendImage;
    }

    public function setLayerLegendImage(?Legend $layerLegendImage): self
    {
        $this->layerLegendImage = $layerLegendImage;

        return $this;
    }
}

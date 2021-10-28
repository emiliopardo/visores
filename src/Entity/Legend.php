<?php

namespace App\Entity;

use App\Repository\LegendRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

/**
 * @ORM\Entity(repositoryClass=LegendRepository::class)
 * @Vich\Uploadable
 */
class Legend
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
     * NOTE: This is not a mapped field of entity metadata, just a simple property.
     * 
     * @Vich\UploadableField(mapping="legend_image", fileNameProperty="imageName", size="imageSize")
     * 
     * @var File|null
     */
    private $imageFile;

    /**
     * @ORM\Column(type="string")
     *
     * @var string|null
     */
    private $imageName;

    /**
     * @ORM\Column(type="integer")
     *
     * @var int|null
     */
    private $imageSize;

    /**
     * @ORM\Column(type="datetime")
     *
     * @var \DateTimeInterface|null
     */
    private $updatedAt;

    /**
     * @ORM\OneToMany(targetEntity=MapeaLayerWMS::class, mappedBy="layerLegendImage")
     */
    private $mapeaLayerWMS;

    public function __construct()
    {
        $this->mapeaLayerWMS = new ArrayCollection();
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

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    /**
     * If manually uploading a file (i.e. not using Symfony Form) ensure an instance
     * of 'UploadedFile' is injected into this setter to trigger the update. If this
     * bundle's configuration parameter 'inject_on_load' is set to 'true' this setter
     * must be able to accept an instance of 'File' as the bundle will inject one here
     * during Doctrine hydration.
     *
     * @param File|\Symfony\Component\HttpFoundation\File\UploadedFile|null $imageFile
     */
    public function setImageFile(?File $imageFile = null): void
    {
        $this->imageFile = $imageFile;

        if (null !== $imageFile) {
            // It is required that at least one field changes if you are using doctrine
            // otherwise the event listeners won't be called and the file is lost
            $this->updatedAt = new \DateTimeImmutable();
        }
    }

    public function getImageFile(): ?File
    {
        return $this->imageFile;
    }

    public function setImageName(?string $imageName): void
    {
        $this->imageName = $imageName;
    }

    public function getImageName(): ?string
    {
        return $this->imageName;
    }
    
    public function setImageSize(?int $imageSize): void
    {
        $this->imageSize = $imageSize;
    }

    public function getImageSize(): ?int
    {
        return $this->imageSize;
    }

    /**
     * @return Collection|MapeaLayerWMS[]
     */
    public function getMapeaLayerWMS(): Collection
    {
        return $this->mapeaLayerWMS;
    }

    public function addMapeaLayerWM(MapeaLayerWMS $mapeaLayerWM): self
    {
        if (!$this->mapeaLayerWMS->contains($mapeaLayerWM)) {
            $this->mapeaLayerWMS[] = $mapeaLayerWM;
            $mapeaLayerWM->setLayerLegendImage($this);
        }

        return $this;
    }

    public function removeMapeaLayerWM(MapeaLayerWMS $mapeaLayerWM): self
    {
        if ($this->mapeaLayerWMS->removeElement($mapeaLayerWM)) {
            // set the owning side to null (unless already changed)
            if ($mapeaLayerWM->getLayerLegendImage() === $this) {
                $mapeaLayerWM->setLayerLegendImage(null);
            }
        }

        return $this;
    }    

    public function __toString(){

        return $this->getName();

    }
}

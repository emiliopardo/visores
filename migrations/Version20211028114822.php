<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211028114822 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE mapea_layer_wms_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE mapea_layer_wms (id INT NOT NULL, layer_legend_image_id INT DEFAULT NULL, name VARCHAR(100) NOT NULL, description VARCHAR(255) NOT NULL, layer_name VARCHAR(100) NOT NULL, layer_legend VARCHAR(255) NOT NULL, layer_url VARCHAR(255) NOT NULL, layer_transparent BOOLEAN DEFAULT \'false\' NOT NULL, layer_tiled BOOLEAN DEFAULT \'false\' NOT NULL, layer_style VARCHAR(255) DEFAULT \'default\' NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_74339790EFC4A848 ON mapea_layer_wms (layer_legend_image_id)');
        $this->addSql('ALTER TABLE mapea_layer_wms ADD CONSTRAINT FK_74339790EFC4A848 FOREIGN KEY (layer_legend_image_id) REFERENCES legend (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP SEQUENCE mapea_layer_wms_id_seq CASCADE');
        $this->addSql('DROP TABLE mapea_layer_wms');
    }
}

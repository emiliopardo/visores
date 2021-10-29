<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211029071120 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE mapea_layer_geojson_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE mapea_layer_geojson (id INT NOT NULL, name VARCHAR(100) NOT NULL, description VARCHAR(255) NOT NULL, layer_name VARCHAR(100) NOT NULL, layer_url VARCHAR(255) NOT NULL, extract BOOLEAN NOT NULL, layer_style TEXT DEFAULT \'0\' NOT NULL, PRIMARY KEY(id))');
        $this->addSql('COMMENT ON COLUMN mapea_layer_geojson.layer_style IS \'(DC2Type:object)\'');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP SEQUENCE mapea_layer_geojson_id_seq CASCADE');
        $this->addSql('DROP TABLE mapea_layer_geojson');
    }
}

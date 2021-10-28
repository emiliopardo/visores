<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211028081817 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE mapea_plugin_config_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE mapea_plugin_config (id INT NOT NULL, mapea_plugin_id INT NOT NULL, description VARCHAR(255) NOT NULL, config TEXT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_8D56EC1DA1EC9697 ON mapea_plugin_config (mapea_plugin_id)');
        $this->addSql('COMMENT ON COLUMN mapea_plugin_config.config IS \'(DC2Type:object)\'');
        $this->addSql('ALTER TABLE mapea_plugin_config ADD CONSTRAINT FK_8D56EC1DA1EC9697 FOREIGN KEY (mapea_plugin_id) REFERENCES mapea_plugin (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP SEQUENCE mapea_plugin_config_id_seq CASCADE');
        $this->addSql('DROP TABLE mapea_plugin_config');
    }
}

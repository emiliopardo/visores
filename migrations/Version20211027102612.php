<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211027102612 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE mapea_control_config ADD mapea_control_id INT NOT NULL');
        $this->addSql('ALTER TABLE mapea_control_config ADD CONSTRAINT FK_39A5E17157436675 FOREIGN KEY (mapea_control_id) REFERENCES mapea_control (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_39A5E17157436675 ON mapea_control_config (mapea_control_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE mapea_control_config DROP CONSTRAINT FK_39A5E17157436675');
        $this->addSql('DROP INDEX IDX_39A5E17157436675');
        $this->addSql('ALTER TABLE mapea_control_config DROP mapea_control_id');
    }
}

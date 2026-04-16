<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260408130650 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE customer DROP auth_key, DROP feedback_make');
        $this->addSql('ALTER TABLE user ADD two_factor_auth VARCHAR(255) DEFAULT NULL, ADD two_factor_auth_expires_at DATETIME DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE customer ADD auth_key VARCHAR(200) NOT NULL, ADD feedback_make SMALLINT NOT NULL');
        $this->addSql('ALTER TABLE user DROP two_factor_auth, DROP two_factor_auth_expires_at');
    }
}

<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260321164154 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE ticket_technician (ticket_id INT NOT NULL, technician_id INT NOT NULL, INDEX IDX_64D77B1C700047D2 (ticket_id), INDEX IDX_64D77B1CE6C5D496 (technician_id), PRIMARY KEY (ticket_id, technician_id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE ticket_technician ADD CONSTRAINT FK_64D77B1C700047D2 FOREIGN KEY (ticket_id) REFERENCES ticket (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE ticket_technician ADD CONSTRAINT FK_64D77B1CE6C5D496 FOREIGN KEY (technician_id) REFERENCES technician (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE ticket DROP FOREIGN KEY `FK_97A0ADA3315B405`');
        $this->addSql('ALTER TABLE ticket DROP FOREIGN KEY `FK_97A0ADA3FEFB4E80`');
        $this->addSql('DROP INDEX IDX_97A0ADA3FEFB4E80 ON ticket');
        $this->addSql('DROP INDEX IDX_97A0ADA3315B405 ON ticket');
        $this->addSql('ALTER TABLE ticket ADD assigned_by_id INT DEFAULT NULL, DROP technicians_id, DROP support_id');
        $this->addSql('ALTER TABLE ticket ADD CONSTRAINT FK_97A0ADA36E6F1246 FOREIGN KEY (assigned_by_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_97A0ADA36E6F1246 ON ticket (assigned_by_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE ticket_technician DROP FOREIGN KEY FK_64D77B1C700047D2');
        $this->addSql('ALTER TABLE ticket_technician DROP FOREIGN KEY FK_64D77B1CE6C5D496');
        $this->addSql('DROP TABLE ticket_technician');
        $this->addSql('ALTER TABLE ticket DROP FOREIGN KEY FK_97A0ADA36E6F1246');
        $this->addSql('DROP INDEX IDX_97A0ADA36E6F1246 ON ticket');
        $this->addSql('ALTER TABLE ticket ADD technicians_id INT NOT NULL, ADD support_id INT NOT NULL, DROP assigned_by_id');
        $this->addSql('ALTER TABLE ticket ADD CONSTRAINT `FK_97A0ADA3315B405` FOREIGN KEY (support_id) REFERENCES support (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE ticket ADD CONSTRAINT `FK_97A0ADA3FEFB4E80` FOREIGN KEY (technicians_id) REFERENCES technician (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_97A0ADA3FEFB4E80 ON ticket (technicians_id)');
        $this->addSql('CREATE INDEX IDX_97A0ADA3315B405 ON ticket (support_id)');
    }
}

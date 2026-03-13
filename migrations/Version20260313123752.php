<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260313123752 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE accountant (id INT NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE administrator (id INT NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE bay (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(25) NOT NULL, capacity_unit INT NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE company (siret VARCHAR(14) NOT NULL, company_name VARCHAR(100) NOT NULL, id INT NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE customer (adress VARCHAR(200) NOT NULL, phone VARCHAR(20) NOT NULL, invoice_adress VARCHAR(200) NOT NULL, id INT NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE intervention (id INT AUTO_INCREMENT NOT NULL, type VARCHAR(50) NOT NULL, description LONGTEXT NOT NULL, begin_date DATETIME NOT NULL, finish_date DATETIME NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE intervention_unit (intervention_id INT NOT NULL, unit_id INT NOT NULL, INDEX IDX_D30414918EAE3863 (intervention_id), INDEX IDX_D3041491F8BD700D (unit_id), PRIMARY KEY (intervention_id, unit_id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE notice (id INT AUTO_INCREMENT NOT NULL, comment LONGTEXT NOT NULL, note SMALLINT NOT NULL, user_id INT NOT NULL, INDEX IDX_480D45C2A76ED395 (user_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE offer (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, nb_unit INT NOT NULL, price INT NOT NULL, version INT NOT NULL, is_active TINYINT(1) NOT NULL, created_at VARCHAR(255) NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE particular (gender VARCHAR(14) NOT NULL, id INT NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE reservation (id INT AUTO_INCREMENT NOT NULL, begin_date DATETIME NOT NULL, finish_date DATETIME NOT NULL, status VARCHAR(255) NOT NULL, reservation_offer INT DEFAULT NULL, customer_id INT NOT NULL, INDEX IDX_42C849556AA95799 (reservation_offer), INDEX IDX_42C849559395C3F3 (customer_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE reservation_unit (reservation_id INT NOT NULL, unit_id INT NOT NULL, INDEX IDX_CA82C13BB83297E7 (reservation_id), INDEX IDX_CA82C13BF8BD700D (unit_id), PRIMARY KEY (reservation_id, unit_id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE support (id INT NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE technician (phone VARCHAR(14) NOT NULL, level SMALLINT NOT NULL, id INT NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE ticket (id INT AUTO_INCREMENT NOT NULL, subject VARCHAR(50) NOT NULL, description LONGTEXT NOT NULL, open_date DATETIME NOT NULL, close_date DATETIME DEFAULT NULL, status VARCHAR(255) NOT NULL, customer_id INT NOT NULL, technicians_id INT NOT NULL, support_id INT NOT NULL, INDEX IDX_97A0ADA39395C3F3 (customer_id), INDEX IDX_97A0ADA3FEFB4E80 (technicians_id), INDEX IDX_97A0ADA3315B405 (support_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE unit (id INT AUTO_INCREMENT NOT NULL, position INT NOT NULL, name VARCHAR(30) NOT NULL, status VARCHAR(255) NOT NULL, type VARCHAR(50) DEFAULT NULL, power_consumption INT DEFAULT NULL, temperature DOUBLE PRECISION DEFAULT NULL, network_throughput DOUBLE PRECISION DEFAULT NULL, bay_id INT NOT NULL, INDEX IDX_DCBB0C53DF9BA23B (bay_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(50) NOT NULL, roles LONGTEXT NOT NULL, first_name VARCHAR(50) NOT NULL, name VARCHAR(50) NOT NULL, password VARCHAR(255) NOT NULL, discr VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE accountant ADD CONSTRAINT FK_E7681183BF396750 FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE administrator ADD CONSTRAINT FK_58DF0651BF396750 FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE company ADD CONSTRAINT FK_4FBF094FBF396750 FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE customer ADD CONSTRAINT FK_81398E09BF396750 FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE intervention_unit ADD CONSTRAINT FK_D30414918EAE3863 FOREIGN KEY (intervention_id) REFERENCES intervention (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE intervention_unit ADD CONSTRAINT FK_D3041491F8BD700D FOREIGN KEY (unit_id) REFERENCES unit (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE notice ADD CONSTRAINT FK_480D45C2A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE particular ADD CONSTRAINT FK_862161CFBF396750 FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE reservation ADD CONSTRAINT FK_42C849556AA95799 FOREIGN KEY (reservation_offer) REFERENCES offer (id)');
        $this->addSql('ALTER TABLE reservation ADD CONSTRAINT FK_42C849559395C3F3 FOREIGN KEY (customer_id) REFERENCES customer (id)');
        $this->addSql('ALTER TABLE reservation_unit ADD CONSTRAINT FK_CA82C13BB83297E7 FOREIGN KEY (reservation_id) REFERENCES reservation (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE reservation_unit ADD CONSTRAINT FK_CA82C13BF8BD700D FOREIGN KEY (unit_id) REFERENCES unit (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE support ADD CONSTRAINT FK_8004EBA5BF396750 FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE technician ADD CONSTRAINT FK_F244E948BF396750 FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE ticket ADD CONSTRAINT FK_97A0ADA39395C3F3 FOREIGN KEY (customer_id) REFERENCES customer (id)');
        $this->addSql('ALTER TABLE ticket ADD CONSTRAINT FK_97A0ADA3FEFB4E80 FOREIGN KEY (technicians_id) REFERENCES technician (id)');
        $this->addSql('ALTER TABLE ticket ADD CONSTRAINT FK_97A0ADA3315B405 FOREIGN KEY (support_id) REFERENCES support (id)');
        $this->addSql('ALTER TABLE unit ADD CONSTRAINT FK_DCBB0C53DF9BA23B FOREIGN KEY (bay_id) REFERENCES bay (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE accountant DROP FOREIGN KEY FK_E7681183BF396750');
        $this->addSql('ALTER TABLE administrator DROP FOREIGN KEY FK_58DF0651BF396750');
        $this->addSql('ALTER TABLE company DROP FOREIGN KEY FK_4FBF094FBF396750');
        $this->addSql('ALTER TABLE customer DROP FOREIGN KEY FK_81398E09BF396750');
        $this->addSql('ALTER TABLE intervention_unit DROP FOREIGN KEY FK_D30414918EAE3863');
        $this->addSql('ALTER TABLE intervention_unit DROP FOREIGN KEY FK_D3041491F8BD700D');
        $this->addSql('ALTER TABLE notice DROP FOREIGN KEY FK_480D45C2A76ED395');
        $this->addSql('ALTER TABLE particular DROP FOREIGN KEY FK_862161CFBF396750');
        $this->addSql('ALTER TABLE reservation DROP FOREIGN KEY FK_42C849556AA95799');
        $this->addSql('ALTER TABLE reservation DROP FOREIGN KEY FK_42C849559395C3F3');
        $this->addSql('ALTER TABLE reservation_unit DROP FOREIGN KEY FK_CA82C13BB83297E7');
        $this->addSql('ALTER TABLE reservation_unit DROP FOREIGN KEY FK_CA82C13BF8BD700D');
        $this->addSql('ALTER TABLE support DROP FOREIGN KEY FK_8004EBA5BF396750');
        $this->addSql('ALTER TABLE technician DROP FOREIGN KEY FK_F244E948BF396750');
        $this->addSql('ALTER TABLE ticket DROP FOREIGN KEY FK_97A0ADA39395C3F3');
        $this->addSql('ALTER TABLE ticket DROP FOREIGN KEY FK_97A0ADA3FEFB4E80');
        $this->addSql('ALTER TABLE ticket DROP FOREIGN KEY FK_97A0ADA3315B405');
        $this->addSql('ALTER TABLE unit DROP FOREIGN KEY FK_DCBB0C53DF9BA23B');
        $this->addSql('DROP TABLE accountant');
        $this->addSql('DROP TABLE administrator');
        $this->addSql('DROP TABLE bay');
        $this->addSql('DROP TABLE company');
        $this->addSql('DROP TABLE customer');
        $this->addSql('DROP TABLE intervention');
        $this->addSql('DROP TABLE intervention_unit');
        $this->addSql('DROP TABLE notice');
        $this->addSql('DROP TABLE offer');
        $this->addSql('DROP TABLE particular');
        $this->addSql('DROP TABLE reservation');
        $this->addSql('DROP TABLE reservation_unit');
        $this->addSql('DROP TABLE support');
        $this->addSql('DROP TABLE technician');
        $this->addSql('DROP TABLE ticket');
        $this->addSql('DROP TABLE unit');
        $this->addSql('DROP TABLE user');
    }
}

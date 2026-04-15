CREATE DATABASE POSTTEST_3;
SHOW DATABASES;
USE POSTTEST_3;

CREATE TABLE pelanggan (
	id VARCHAR (5) PRIMARY KEY,
	nama VARCHAR (50) NOT NULL,
	alamat VARCHAR (100),
	umur INT NOT NULL,
	saldo DECIMAL(10,2) NOT NULL,
	tanggal_bergabung DATE NOT NULL
);

CREATE TABLE transaksi (
	id VARCHAR(10) PRIMARY KEY,
	total_pembelian DECIMAL(12,2) NOT NULL,
	waktu_transaksi TIMESTAMP NOT NULL
);

INSERT INTO pelanggan (id, nama, alamat, umur, saldo, tanggal_bergabung) VALUES
	('1', 'Anugerah Fakhriza Reswara', 'Jalan In Aja', 18, 10000.00, '2025-08-01');
	
INSERT INTO pelanggan (id, nama, alamat, umur, saldo, tanggal_bergabung) VALUES
	('2', 'Muhammad Alfauzi Syahputra', 'Jalan Harapan Baru', 10, 50000000.00, '2023-02-11');
	
INSERT INTO pelanggan (id, nama, alamat, umur, saldo, tanggal_bergabung) VALUES
	('3', 'Pirlo Syabila Hafuza', 'Jalan Praktek', 24, 110000.00, '2024-04-02');
	
INSERT INTO pelanggan (id, nama, alamat, umur, saldo, tanggal_bergabung) VALUES
	('4', 'Yoga Ananda Prasetya', 'Jalan Teori', 11, 220000.00, '2025-05-20');
	
INSERT INTO pelanggan (id, nama, alamat, umur, saldo, tanggal_bergabung) VALUES
	('5', 'Akbar Rachim', 'Jalan Yang Diatas', 19, 500000.00, '2026-01-31');

INSERT INTO transaksi VALUES
	('1', 200000.00, '2025-11-22 08:33:44'),
	('2', 150241.00, '2025-11-04 21:22:33'),
	('3', 56040.00, '2026-02-02 15:30:23'),
	('4', 44420.00, '2026-03-04 14:11:00'),
	('5', 190931.00, '2026-03-15 22:55:21');

SELECT * FROM pelanggan;
SELECT * FROM transaksi;


UPDATE pelanggan SET alamat = 'Jalan Umur Baru', saldo = 67000.00 WHERE umur < 15; 
UPDATE pelanggan SET umur = umur + 1;
SELECT * FROM pelanggan;

DELETE FROM transaksi WHERE total_pembelian < 100000.00;
DELETE FROM pelanggan WHERE tanggal_bergabung >= '2026-01-01';
SELECT * FROM transaksi;
SELECT * FROM pelanggan;

SELECT * FROM pelanggan WHERE umur < 15;
SELECT nama, umur, saldo FROM pelanggan;
SELECT * FROM transaksi WHERE total_pembelian > 100000.00;
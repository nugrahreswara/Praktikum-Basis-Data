-- Membuat database baru dan menggunakannya
CREATE DATABASE POSTTEST_5;
USE POSTTEST_5;


-- Mendefinisikan struktur tabel pelanggan
CREATE TABLE pelanggan (
	id VARCHAR (5) PRIMARY KEY,
	nama VARCHAR (50) NOT NULL,
	alamat VARCHAR (100),
	umur INT NOT NULL,
	saldo DECIMAL(10,2) NOT NULL,
	tanggal_bergabung DATE NOT NULL
);


-- Mendefinisikan struktur tabel transaksi
CREATE TABLE transaksi (
	id VARCHAR(10) PRIMARY KEY,
	total_pembelian DECIMAL(12,2) NOT NULL,
	waktu_transaksi TIMESTAMP NOT NULL
);


-- Memasukkan data sampel ke tabel pelanggan
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

INSERT INTO pelanggan (id, nama, alamat, umur, saldo, tanggal_bergabung) VALUES
('6', 'Denny Mulia', 'Jalan Sepuh', 45, 71500.00, '2022-12-15'),
('7', 'Muhammad Zidane Abdul Kadir', 'Jalan Luas', 50, 923010.00, '2021-05-20');

-- Memasukkan data sampel ke tabel transaksi
INSERT INTO transaksi VALUES
	('ORDER001', 200000.00, '2025-11-22 08:33:44'),
	('ORDER002', 150241.00, '2025-11-04 21:22:33'),
	('ORDER003', 56040.00, '2026-02-02 15:30:23'),
	('ORDER004', 44420.00, '2026-03-04 14:11:00'),
	('ORDER005', 190931.00, '2026-03-15 22:55:21');


-- Menampilkan data sampel yang sudah dimasukkan ke masing-masing tabel
SELECT * FROM pelanggan;
SELECT * FROM transaksi;


-- Tugas 1: Menghitung jumlah baris yang memenuhi kriteria (COUNT)
-- Menghitung jumlah pelanggan yang umurnya di atas 18 tahun
;
SELECT COUNT(*) AS jumlah_pelanggan_dewasa FROM pelanggan WHERE umur > 18;

-- Menghitung jumlah transaksi yang total pembeliannya lebih dari 100.000
SELECT COUNT(*) AS jumlah_transaksi_besar FROM transaksi WHERE total_pembelian > 100000;


-- Tugas 2: Menjumlahkan nilai dari kolom tertentu (SUM)
-- Menjumlahkan total saldo semua pelanggan yang tinggal di 'Jalan In Aja'
SELECT SUM(saldo) AS total_saldo_jalan_in_aja FROM pelanggan WHERE alamat = 'Jalan In Aja';

-- Menjumlahkan total semua pembelian pada tabel transaksi
SELECT SUM(total_pembelian) AS total_pendapatan FROM transaksi;


-- Tugas 3: Menghitung rata-rata nilai kolom tertentu (AVG)
-- Menghitung rata-rata umur pelanggan
SELECT AVG(umur) AS rata_rata_umur FROM pelanggan;
-- Menghitung rata-rata total pembelian pada tabel transaksi
SELECT AVG(total_pembelian) AS rata_rata_pembelian FROM transaksi;

-- Tugas 4: Mencari nilai terendah (MIN) dan tertinggi (MAX)
-- Mencari saldo terendah di tabel pelanggan
SELECT MIN(saldo) AS saldo_paling_sedikit FROM pelanggan;
-- Mencari total pembelian tertinggi di tabel transaksi
SELECT MAX(total_pembelian) AS pembelian_termahal FROM transaksi;

-- Tugas 5: Mengelompokkan data (GROUP BY) dengan syarat tertentu (HAVING)
-- Mengelompokkan pelanggan berdasarkan umur dan hanya menampilkan umur yang memiliki lebih dari 1 orang
SELECT umur, COUNT(*) AS jumlah_orang FROM pelanggan GROUP BY umur HAVING COUNT(*) > 1;

-- Mengelompokkan transaksi berdasarkan tanggal (mengambil bagian tanggal saja) dan hanya tampil jika total harian > 100.000
SELECT DATE(waktu_transaksi) AS tanggal, SUM(total_pembelian) AS total_harian  FROM transaksi GROUP BY tanggal HAVING total_harian > 100000;


-- Tugas 6: Struktur CASE untuk mengkategorikan data
-- Mengkategorikan pelanggan berdasarkan umur ke dalam kolom baru bernama 'kategori_usia'
SELECT nama, umur,
    CASE 
        WHEN umur < 13 THEN 'Anak-anak'
        WHEN umur BETWEEN 13 AND 19 THEN 'Remaja'
        WHEN umur BETWEEN 20 AND 45 THEN 'Dewasa'
        ELSE 'Lansia'
    END AS kategori_usia
FROM pelanggan;
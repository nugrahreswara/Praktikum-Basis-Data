-- Membuat database baru dan menggunakannya
CREATE DATABASE POSTTEST_4;
USE POSTTEST_4;


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


-- Memasukkan data baru untuk ketentuan tanggal_bergabung < '2023-01-01'
INSERT INTO pelanggan (id, nama, alamat, umur, saldo, tanggal_bergabung) VALUES
('6', 'Denny Mulia', 'Jalan Sepuh', 45, 71500.00, '2022-12-15'),
('7', 'Muhammad Zidane Abdul Kadir', 'Jalan Luas', 50, 923010.00, '2021-05-20');

 perintah menggunakan NOT IN dengan subquery
-- Mencari pelanggan yang ID-nya tidak ada dalam daftar ID di tabel transaksi (Asumsi ID pelanggan berelasi dengan ID transaksi jika ada foreign key)
-- Karena tabel transaksi kamu belum memiliki kolom id_pelanggan, saya contohkan logika umum mencari ID yang tidak terdaftar di list tertentu:
SELECT * FROM pelanggan 
WHERE id NOT IN (SELECT SUBSTRING(id, 6, 3) FROM transaksi); -- Contoh logika: mencari ID yang tidak ada di potongan string ORDERxxx

-- Mencari pelanggan yang namanya tidak termasuk dalam daftar nama tertentu hasil subquery
SELECT * FROM pelanggan 
WHERE nama NOT IN (SELECT nama FROM pelanggan WHERE saldo < 50000);

-- 2. Dua perintah menggunakan ORDER BY descending
-- Perintah 1: Kondisi umur < 30 Tahun diurutkan berdasarkan umur terbesar
SELECT * FROM pelanggan 
WHERE umur < 30 
ORDER BY umur DESC;

-- Perintah 2: Kondisi tanggal_bergabung < Januari 2023 diurutkan dari yang paling baru (Desember ke bawah)
SELECT * FROM pelanggan 
WHERE tanggal_bergabung < '2023-01-01' 
ORDER BY tanggal_bergabung DESC;

-- 3. Satu perintah menggunakan ALL
-- Mencari pelanggan yang saldonya lebih besar dari SEMUA nilai total_pembelian di tabel transaksi
SELECT * FROM pelanggan 
WHERE saldo > ALL (SELECT total_pembelian FROM transaksi);

-- 4. Satu perintah menggunakan UNION
-- Menggabungkan kolom ID dan Nama dari pelanggan dengan ID dan Total Pembelian dari transaksi (sebagai string)
SELECT id, nama AS keterangan FROM pelanggan
UNION
SELECT id, CAST(total_pembelian AS CHAR) FROM transaksi;


-- 5. Empat perintah menggunakan NOT LIKE
-- Pencarian spesifik 5 karakter (Menggunakan underscore _ sebanyak 5 kali)
SELECT * FROM pelanggan WHERE nama NOT LIKE '_____';

-- Berdasarkan huruf awal (Mencari yang namanya TIDAK dimulai dengan huruf 'A')
SELECT * FROM pelanggan WHERE nama NOT LIKE 'A%';

-- Berdasarkan huruf tengah (Mencari yang namanya TIDAK mengandung kata 'Ananda' di tengah)
SELECT * FROM pelanggan WHERE nama NOT LIKE '%Ananda%';

-- Berdasarkan huruf akhir (Mencari yang namanya TIDAK diakhiri dengan huruf 'a')
SELECT * FROM pelanggan WHERE nama NOT LIKE '%a';


CREATE DATABASE PERTEMUAN_6;
USE PERTEMUAN_6;

CREATE TABLE jurusan (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_jurusan VARCHAR(100) NOT NULL,
	kode_jurusan VARCHAR(10) NOT NULL
);

CREATE TABLE mahasiswa (
	id_jurusan INT,
	nim CHAR(10) PRIMARY KEY,
	nama_lengkap VARCHAR(150) NOT NULL,
	ukt INT,
	status_mhs VARCHAR(100),
	FOREIGN KEY (id_jurusan) REFERENCES jurusan(id)
);

INSERT INTO jurusan (nama_jurusan, kode_jurusan) VALUES
	('Informatika', 'IF'),
	('Sistem Informasi', 'SI'),
	('Akuntansi', 'AK'),
	('Desain Komunikasi Visual', 'DKV'),
	('Administrasi Bisnis', 'AB'),
	('Manajemen Sumber Daya', 'MSD'),
	('Teknik Sipil', 'TS'),
	('Teknik Industri', 'TI'),
	('Teknik Lingkungan', 'TL');

INSERT INTO mahasiswa (id_jurusan, nama_lengkap, ukt, status_mhs, nim) VALUES
	(5, 'Guntur', 9500000, 'Aktif', '2026001'),
	(3, 'Nabil', 7800000, 'Aktif', '2026002'),
	(4, 'Sipuwah', 8500000, 'Aktif', '2026003'),
	(2, 'Dapupu', 8200000, 'Cuti', '2026004'),
	(1, 'Nabila', 7600000, 'Pindah', '2026005'),
	(1, 'Ahnaf', 16000000, 'Aktif', '2026006'),
	(6, 'Aliyyu', 7100000, 'aktif', '2026007'),
	(8, 'jaki', 5000000, 'Aktif', '2026008'),
	(2, 'uyhaw', 8000000, 'Lulus', '2026009'),
	(7, 'Ali', 7200000, 'Pegawai Kontrak', '2026010'),
	(NULL, 'Doni Setiawan', 3500000, 'DO', '2026014'),
	(NULL, 'Mega Lestari', 4000000, 'Menunggu Yudisium', '2026015');
	
SELECT * FROM jurusan;
SELECT * FROM mahasiswa;


-- INNER JOIN: m.nim berarti dari tabel mahasiswa ambil kolom nim
SELECT
	m.nim,
	m.nama_lengkap AS Nama_Mahasiswa,
	j.nama_jurusan AS Program_Studi,
	j.kode_jurusan,
	m.ukt,
	m.status_mhs
FROM mahasiswa AS m
INNER JOIN jurusan AS j ON m.id_jurusan = j.id;


-- Default JOIN adalah INNER JOIN
SELECT
	m.nim,
	m.nama_lengkap AS Nama_Mahasiswa,
	j.nama_jurusan AS Program_Studi,
	j.kode_jurusan,
	m.ukt,
	m.status_mhs
FROM mahasiswa AS m
JOIN jurusan AS j ON m.id_jurusan = j.id;


-- LEFT JOIN: Tampilkan semua data dari tabel kiri (mahasiswa)
SELECT
	m.nim,
	m.nama_lengkap AS Nama_Mahasiswa,
	j.nama_jurusan AS Program_Studi,
	j.kode_jurusan,
	m.ukt,
	m.status_mhs
FROM mahasiswa AS m
LEFT JOIN jurusan AS j ON m.id_jurusan = j.id;


-- RIGHT JOIN: Tampilkan semua data dari tabel kanan (jurusan)
SELECT
	m.nim,
	m.nama_lengkap AS Nama_Mahasiswa,
	j.nama_jurusan AS Program_Studi,
	j.kode_jurusan,
	m.ukt,
	m.status_mhs
FROM mahasiswa AS m
RIGHT JOIN jurusan AS j ON m.id_jurusan = j.id;


-- FULL OUTER JOIN: Tampilkan tanpa terkecuali
SELECT
	m.nim,
	m.nama_lengkap AS Nama_Mahasiswa,
	j.nama_jurusan AS Program_Studi,
	m.ukt,
	m.status_mhs
FROM mahasiswa AS m
LEFT JOIN jurusan AS j ON m.id_jurusan = j.id
UNION
SELECT
	m.nim,
	m.nama_lengkap AS Nama_Mahasiswa,
	j.nama_jurusan AS Program_Studi,
	m.ukt,
	m.status_mhs
FROM mahasiswa AS m
RIGHT JOIN jurusan AS j ON m.id_jurusan = j.id;
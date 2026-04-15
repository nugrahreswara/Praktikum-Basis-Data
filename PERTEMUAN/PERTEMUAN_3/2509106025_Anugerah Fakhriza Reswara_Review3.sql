CREATE DATABASE `pertemuan-4`;

USE `pertemuan-4`;

CREATE TABLE mahasiswa(
NIM VARCHAR(10) PRIMARY KEY,
Nama_mhs VARCHAR(50) NOT NULL,
Tahun_Masuk INT NOT NULL
);

desc mahasiswa;

insert into mahasiswa(NIM, Nama_mhs, Tahun_Masuk) 
VALUES (3, 'Alfauzi', 2024), (4, 'Yoga', 2026);

select * from mahasiswa;


SELECT NIM, Nama_mhs from mahasiswa;

UPDATE mahasiswa SET Tahun_Masuk=2025;

INSERT INTO mahasiswa(NIM, Nama_mhs, Tahun_Masuk) VALUES (2509106025, 'Anugerah Fakhriza Reswara', 2025), (2509106017, 'Yoga Ananda Prasetya', 2025), (2509106006, 
'Muhammad Alfauzi Syahputra', 2025);

DELETE FROM mahasiswa WHERE NIM = 2509106006;

DELETE FROM mahasiswa;

UPDATE mahasiswa SET NIM = 2509106017 WHERE Nama_mhs = 'Yoga';
UPDATE mahasiswa SET Nama_mhs = 'Yoga Ananda Prasetya' WHERE Nama_mhs = 'Yoga';

SELECT * FROM mahasiswa;
DELETE FROM mahasiswa;
TRUNCATE TABLE mahasiswa;

ALTER TABLE mahasiswa ADD email VARCHAR(100);

INSERT INTO mahasiswa(NIM, Nama_mhs, Tahun_Masuk) VALUES (2509106025, 'Anugerah Fakhriza Reswara', 2025), (2509106017, 'Yoga Ananda Prasetya', 2025), (2509106006, 
'Muhammad Alfauzi Syahputra', 2025);

UPDATE mahasiswa SET email='nugrah@nugrah.my.id' WHERE Nama_mhs = 'Anugerah Fakhriza Reswara';


CREATE TABLE pelanggan (
    id VARCHAR(5) PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    alamat VARCHAR(100),
    umur INT NOT NULL,
    saldo DECIMAL(10,2) NOT NULL,
    tanggal_bergabung DATE NOT NULL
);

INSERT INTO pelanggan(id, nama, alamat, umur, saldo, tanggal_bergabung) VALUES ('1', 'nugrah', 'loa bakung', 18, 5000.00, '2025-08-01');








CREATE TABLE buku (
    kode_buku VARCHAR(5) PRIMARY KEY,
    judul VARCHAR(100) NOT NULL,
    penulis VARCHAR(50),
    stok INT NOT NULL,
    harga DECIMAL(12,2) NOT NULL,
    tgl_masuk DATE NOT NULL
);

desc buku;

insert into buku(kode_buku, judul, penulis, stok, harga, tgl_masuk) VALUES ('2', 'Ayam', 'Pirlo', 3, 10000.00, '2026-01-01'), ('3', 'Udang', 'Alfauzi', 30, 50000.00, '2023-11-20');

select * from buku;

update buku set stok=0 where harga < 30000.00;

delete from buku where harga > 100000.00;

select * from buku where judul = 'udang';


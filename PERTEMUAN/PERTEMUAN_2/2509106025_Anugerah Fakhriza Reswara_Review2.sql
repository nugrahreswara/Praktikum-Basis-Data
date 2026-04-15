-- Buat database baru
CREATE DATABASE nugrah;
USE nugrah;

-- Buat table
CREATE TABLE mahasiswa(
NIM VARCHAR(10) PRIMARY KEY,
Nama_mhs VARCHAR(50) NOT NULL,
Tahun_Msk INT NOT NULL
);

-- DESC digunakan untuk menampilkan tabel
DESC mahasiswa;

-- ALTER digunakan untuk menambah kolom, mengubah nama/panjang data kolom dan menghapus kolom

ALTER TABLE mahasiswa ADD email VARCHAR(100);
ALTER TABLE mahasiswa MODIFY Nama_mhs VARCHAR(100);
DESC mahasiswa;

ALTER TABLE mahasiswa RENAME COLUMN email TO email_mhs;
ALTER TABLE mahasiswa RENAME TO data_mahasiswa;
DESC data_mahasiswa;

ALTER TABLE data_mahasiswa DROP COLUMN email_mhs;
DESC data_mahasiswa;

-- TRUNCATE digunakan menghapus seluruh data di dalam tabel
TRUNCATE TABLE data_mahasiswa;
DESC data_mahasiswa;

-- DROP digunakan untuk menghapus tabel
DROP TABLE data_mahasiswa;
DESC data_mahasiswa;
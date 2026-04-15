create database karyawan;
use karyawan ;

CREATE TABLE pegawai (
    id_pegawai INT AUTO_INCREMENT PRIMARY KEY,
    nama_pegawai VARCHAR(100) NOT NULL,
    jabatan VARCHAR(50) NOT NULL,
    gaji DECIMAL(12,2) NOT NULL,
    keterangan VARCHAR(20) NOT NULL
);

INSERT INTO pegawai (nama_pegawai, jabatan, gaji, keterangan) VALUES
('Budi Santoso', 'Manager', 12000000, 'Hadir'),
('Siti Nurhaliza', 'Staff Admin', 5500000, 'Hadir'),
('Ahmad Fauzi', 'Supervisor', 8500000, 'Tidak Hadir'),
('Dewi Lestari', 'Staff IT', 6000000, 'Hadir'),
('Rizki Pratama', 'Marketing', 7000000, 'Hadir'),
('Maya Sari', 'HRD', 7500000, 'Tidak Hadir'),
('Andi Wijaya', 'Finance', 8000000, 'Hadir'),
('Rina Kusuma', 'Staff Admin', 5500000, 'Hadir'),
('Doni Setiawan', 'Supervisor', 8500000, 'Hadir'),
('Linda Wijayanti', 'Marketing', 7000000, 'Tidak Hadir'),
('Hendra Gunawan', 'Manager', 12000000, 'Hadir'),
('Putri Ayu', 'Staff IT', 6000000, 'Hadir'),
('Rudi Hartono', 'Staff Admin', 5500000, 'Hadir'),
('Ani Rahayu', 'HRD', 7500000, 'Hadir'),
('Bayu Setiawan', 'Finance', 8000000, 'Tidak Hadir'),
('Citra Dewi', 'Marketing', 7000000, 'Hadir'),
('Eko Prasetyo', 'Supervisor', 8500000, 'Hadir'),
('Fitri Handayani', 'Staff IT', 6000000, 'Hadir'),
('Gilang Ramadhan', 'Manager', 12000000, 'Tidak Hadir'),
('Hani Permata', 'Staff Admin', 5500000, 'Hadir'),
('Irfan Hakim', 'Marketing', 7000000, 'Hadir'),
('Joko Susilo', 'Finance', 8000000, 'Hadir'),
('Kartika Sari', 'HRD', 7500000, 'Tidak Hadir'),
('Lukman Hakim', 'Supervisor', 8500000, 'Hadir'),
('Mega Wati', 'Staff IT', 6000000, 'Hadir'),
('Nanda Pratama', 'Staff Admin', 5500000, 'Hadir'),
('Oka Mahendra', 'Manager', 12000000, 'Hadir'),
('Prita Mulyani', 'Marketing', 7000000, 'Tidak Hadir'),
('Qori Sandika', 'Finance', 8000000, 'Hadir'),
('Ratna Sari', 'HRD', 7500000, 'Hadir'),
('Surya Dinata', 'Supervisor', 8500000, 'Hadir'),
('Tini Wulandari', 'Staff IT', 6000000, 'Tidak Hadir'),
('Udin Saputra', 'Staff Admin', 5500000, 'Hadir'),
('Vina Melinda', 'Marketing', 7000000, 'Hadir'),
('Wahyu Nugroho', 'Manager', 12000000, 'Hadir'),
('Xena Puspita', 'Finance', 8000000, 'Hadir'),
('Yudi Firmansyah', 'HRD', 7500000, 'Tidak Hadir'),
('Zahra Amelia', 'Supervisor', 8500000, 'Hadir'),
('Agus Salim', 'Staff IT', 6000000, 'Hadir'),
('Bella Safira', 'Staff Admin', 5500000, 'Hadir'),
('Cahyo Utomo', 'Marketing', 7000000, 'Tidak Hadir'),
('Dian Sastro', 'Manager', 12000000, 'Hadir'),
('Edi Cahyono', 'Finance', 8000000, 'Hadir'),
('Farah Diana', 'HRD', 7500000, 'Hadir'),
('Galih Pradipta', 'Supervisor', 8500000, 'Tidak Hadir'),
('Hesti Purwadinata', 'Staff IT', 6000000, 'Hadir'),
('Indra Bekti', 'Staff Admin', 5500000, 'Hadir'),
('Julia Perez', 'Marketing', 7000000, 'Hadir'),
('Kris Dayanti', 'Manager', 12000000, 'Hadir'),
('Lala Widiyana', 'Finance', 8000000, 'Tidak Hadir');

select count(*) as jumlah_pegawai from pegawai;

select sum(gaji) from pegawai;

select avg(gaji) from pegawai;

select avg(gaji) as rata-rata-gaji from pegawai;

select min(gaji) from pegawai;

select max(gaji) from pegawai;

select jabatan, count(*) as total_jabatan from pegawai group by jabatan;
select keterangan, count(*) as total_kehadiran from pegawai group by keterangan;
select gaji, count(*) as total_pegawai from pegawai group by gaji order by count(*) desc;
select gaji, count(*) as total_pegawai from pegawai group by gaji order by count(*) ASC;
select keterangan, nama_pegawai, count(*) as jumlah_kehadiran from pegawai group by keterangan, nama_pegawai having count(*);

select jabatan, sum(gaji) as total_gaji from pegawai group by jabatan having sum(gaji) < 100000000;

SELECT 
    SUM(CASE WHEN jabatan = 'Manager' THEN gaji ELSE 0 END) AS Total_Gaji_Manager,
    SUM(CASE WHEN jabatan LIKE 'Staff%' THEN gaji ELSE 0 END) AS Total_Gaji_Staff,
    SUM(CASE WHEN jabatan NOT IN ('Manager') AND jabatan NOT LIKE 'Staff%' THEN gaji ELSE 0 END) AS Total_Gaji_Lainnya
FROM pegawai;

SELECT 
    nama_pegawai, 
    keterangan,
    CASE
        WHEN keterangan = 'Hadir' THEN 'Gasss'
        WHEN keterangan = 'Tidak Hadir' THEN 'Aihh alpha'
        ELSE 'Status Tidak Diketahui'
    END AS status_absensi
FROM pegawai;

select * from pegawai;
show tables;


select
  id_pegawai as ID,
  nama_pegawai as "nama pegawai",
  jabatan as posisi,
  gaji,
  keterangan
from
  pegawai;
  
select * from pegawai where gaji not in (5500000, 6000000);
select * from pegawai where jabatan in ("Manager", "HRD");
select * from pegawai where gaji in (5500000, 7500000);

-- tampilin pegawai yang hadir + gaji dibawah 8000k
select * from pegawai where keterangan = 'Hadir' and 
gaji not in (select gaji from pegawai where gaji > 8000000);

select * from pegawai where keterangan = 'Hadir' and 
gaji in (select gaji from pegawai where gaji < 8000000);


select * from pegawai 
where gaji > any (select gaji from pegawai where jabatan ="Finance"); -- where gaji > 6 juta

select * from pegawai 
where gaji > all (select gaji from pegawai where jabatan ="Finance"); -- where gaji > 8 juta

select * from pegawai order by gaji asc;
select * from pegawai order by gaji desc;
select * from pegawai order by nama_pegawai asc;

select * from pegawai where keterangan = 'Hadir' and 
gaji not in (select gaji from pegawai where gaji > 8000000)
order by nama_pegawai asc;


select distinct jabatan, gaji, keterangan from pegawai;

select * from pegawai where jabatan = "Manager";
select * from pegawai where jabatan = "HRD";

select * from pegawai where jabatan = "Manager" 
union 
select * from pegawai where jabatan = "HRD";

select nama_pegawai, jabatan, gaji from pegawai where jabatan = 'manager'
UNION 
select nama_pegawai,jabatan, gaji from pegawai where gaji > 10000000;
-- union menghilangkan data yang terduplikat
-- union all menampilkan seluruh data (bisa terduplikat jika memenuhi kedua syaratnya)

select * from pegawai;

select * from pegawai WHERE
nama_pegawai like 'h%';

select * from pegawai WHERE
nama_pegawai like '___________'; -- menampilkan seluruh nama pegawai yang memiliki 11 karakter

-- nampilin nama pegawai yang huruf awalnya S dan B
select * from pegawai
where nama_pegawai like 's%' or nama_pegawai like 'b%'
order by nama_pegawai asc;


select *from pegawai where nama_pegawai like 's%'
UNION
select * from pegawai where nama_pegawai like 'b%';

select * from pegawai
where nama_pegawai REGEXP '^[AB]'
order by nama_pegawai asc;

-- 035
select nama_pegawai as nama, jabatan as pekerjaan from pegawai;
select nama_pegawai 'nama pegawai', jabatan pekerjaan from pegawai;

-- 028
-- 034


select * from pegawai where gaji >= 5000000 order by gaji asc;
select * from pegawai where jabatan = 'marketing' and keterangan = 'hadir' order by nama_pegawai asc;

select * from pegawai where gaji > any (select gaji from pegawai where keterangan = 'tidak hadir');
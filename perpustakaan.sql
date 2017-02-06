CREATE DATABASE perpustakaan_labib;
USE perpustakaan_labib;
CREATE TABLE buku (id INT(11) PRIMARY KEY AUTO_INCREMENT, id_penerbit INT(11),
kode_buku VARCHAR(255) UNIQUE NOT NULL, judul VARCHAR(255), harga INT(11),
stok INT(11), in_stok INT(11));
CREATE TABLE kategori (id INT(11) PRIMARY KEY AUTO_INCREMENT, kode_kategori
VARCHAR(255) UNIQUE NOT NULL, nama VARCHAR(255) NOT NULL);
CREATE TABLE kategori_buku (id_buku INT(11),id_kategori INT(11));
CREATE TABLE pengarang_buku (id_buku INT(11),id_pengarang INT(11));
CREATE TABLE pengarang (id INT(11) PRIMARY KEY AUTO_INCREMENT,
kode_pengarang VARCHAR(255) UNIQUE NOT NULL, nama VARCHAR(255) NOT NULL);
CREATE TABLE penerbit (id INT(11) PRIMARY KEY AUTO_INCREMENT, kode_penerbit
VARCHAR(255) UNIQUE NOT NULL, nama VARCHAR(255) NOT NULL);
CREATE TABLE pustakawan (id INT(11) PRIMARY KEY AUTO_INCREMENT,
kode_pustakawan VARCHAR(255) UNIQUE NOT NULL, no_ktp VARCHAR(255)
UNIQUE NOT NULL, nama VARCHAR(255) NOT NULL, jenis_kelamin VARCHAR(255),
tanggal_lahir DATE, telp VARCHAR(255) NOT NULL, alamat TEXT, id_kota INT(11),
 id_kecamatan INT(11), id_kabupaten INT(11));
 CREATE TABLE anggota (id INT(11) PRIMARY KEY AUTO_INCREMENT,
 kode_anggota VARCHAR(255) UNIQUE NOT NULL, nama VARCHAR(255) NOT NULL,
 jenis_kelamin VARCHAR(255) NOT NULL, tanggal_lahir DATE, telp VARCHAR(255) NOT NULL,
 alamat TEXT NOT NULL, id_kota INT(11), id_kecamatan INT(11), id_kabupaten INT(11),
 tanggal_daftar TIMESTAMP);
 CREATE TABLE peminjaman (id INT(11) PRIMARY KEY AUTO_INCREMENT,
 kode_peminjaman VARCHAR(255) UNIQUE NOT NULL, id_anggota INT(11) NOT NULL,
 id_pustakawan INT(11) NOT NULL);
 CREATE TABLE peminjaman_buku (id INT(11) PRIMARY KEY AUTO_INCREMENT,
 id_peminjaman INT(11) NOT NULL,id_buku INT(11) NOT NULL,tgl_pinjam TIMESTAMP,
 tanggal_kembali DATE);
 CREATE TABLE pengembalian (id INT(11) PRIMARY KEY AUTO_INCREMENT, kode_kembali
 VARCHAR(255) UNIQUE NOT NULL, id_peminjaman INT(11) NOT NULL,id_pustakawan INT(11)
 NOT NULL, keterangan TEXT);
 CREATE TABLE pengembalian_buku (id INT(11) PRIMARY KEY AUTO_INCREMENT,
 id_pengembalian INT(11) NOT NULL, id_buku INT(11) NOT NULL, tgl_dikembalikan TIMESTAMP);
 CREATE TABLE jenis_denda (id INT(11) PRIMARY KEY AUTO_INCREMENT,
 nama VARCHAR(255) NOT NULL, nominal INT(7) NOT NULL);
 CREATE TABLE pendendaan (id INT(11) PRIMARY KEY AUTO_INCREMENT,
 id_pengembalian INT(11) NOT NULL, total INT(11) NOT NULL);
 CREATE TABLE pendendaan_buku (id INT(11) PRIMARY KEY AUTO_INCREMENT,
 id_pendendaan INT(11) NOT NULL, id_peminjaman_buku INT(11) NOT NULL,
 id_jenis_denda INT(11) NOT NULL, nominal INT(11) NOT NULL);
 CREATE TABLE kabupaten (id INT(11) PRIMARY KEY AUTO_INCREMENT,
 nama VARCHAR(255) NOT NULL);
 CREATE TABLE kecamatan (id INT(11) PRIMARY KEY AUTO_INCREMENT,
 id_kabupaten INT(11) NOT NULL, nama VARCHAR(255) NOT NULL);
 -- CREATE TABLE kota (id INT(11) PRIMARY KEY AUTO_INCREMENT, id_kecamatan
 -- INT(11) NOT NULL, nama VARCHAR(255) NOT NULL);
 insert into anggota (kode_anggota, nama, jenis_kelamin, telp, alamat) values
     ("A0101", "Budi", "Laki-laki","0310989087","jl tidak ada"),
     ("A0202","Tono","Laki-laki","0453948593","di ujung jalan"),
     ("A0203","Andi","Laki-laki","038293748","di jalan mana"),
     ("A0204","Ani","Perempuan","019384029","jl tak berujung"),
     ("A0205","Tina","Perempuan","0293847392","jalan harapan");
insert into buku (kode_buku,judul,harga,stok,in_stok) values
    ("9789792255041","Tirai Menurun",59500,3,3),
    ("9789791574914","88 Kisah Bijaksana dari Negeri Naga",39950,2,2),
    ("202247428","Di Balik Kerling Saatirah",32300,1,1),
    ("200215967","Infernal Devices Clockwork Angel Book One",82700,3,3),
    ("9786021727218","Jalan Terjal dan Berliku",55250,2,2),
    ("202374299","Kamu Sekuat Aku",41000,1,1);
insert into penerbit (kode_penerbit, nama)  values ("GPU01","Gramedia Pustaka Utama");
update buku set id_penerbit=1 where judul = "Kamu Sekuat Aku";
insert into penerbit (kode_penerbit,nama) values ("GWI02","Gramedia Widiasarana Indonesia");
update buku set id_penerbit=2 where judul = "Di Balik Kerling Saatirah";
insert into penerbit (kode_penerbit,nama) values ("PRK03","Padang Ruang Kreatifitas");
update buku set id_penerbit=3 where judul = "Jalan Terjal dan Berliku";
update buku set id_penerbit=1 where judul = "Tirai Menurun";
insert into penerbit (kode_penerbit, nama) values ("KS004","Kisah Silat");
update buku set id_penerbit=4 where judul = "88 Kisah Bijaksana dari Negeri Naga";
insert into penerbit (kode_penerbit, nama) values ("BIP05"," Bhuana Ilmu Populer");
update buku set id_penerbit=5 where id = 4;
insert into jenis_denda (nama,nominal) values
    ("Terlambat 1 Hari",3000),("Terlambat 2 Hari", 6000),
    ("Terlambat 3 Hari",10000),("Sampul Rusak",15000),
    ("Buku Rusak",40000);
insert into pengarang (kode_pengarang, nama) values
    ("P01","Cassandra Clare"),("P02","Nh. Dini"),
    ("P03","Chen Wei An"),("P04","Sutan Zaili Asril"),
    ("P05","Niknik P. Kuntarto"),("P06","Ashni Sastrosubroto");
insert into pengarang_buku values (1,2),(2,3),(3,5),(4,1),(5,4),(6,6);
insert into kabupaten (nama) values ("Surabaya"), ("Yogyakarta"), ("Jombang");
insert into kecamatan (id_kabupaten,nama) values (2,"Kotagede"),(1,"Sukolilo"),
    (3,"Mojoagung"),(3,"Peterongan"),(3,"Ploso");
insert into pustakawan (kode_pustakawan,no_ktp,nama,jenis_kelamin,telp,alamat,id_kabupaten)
     values ("PUSTAKA01","2109812479234","Labib","Laki-laki","0297342893",
         "Peleman Rejowinangun",2),("PUSTAKA02","9234234792349","Muhajir","Laki-laki",
         "0928340923","Rejo",3),("PUSTAKA03","902348120394","Ahmad","Laki-laki",
         "093482345035","Keputih",1),("PUSTAKA04","094323489234","Muhammad",
         "Laki-laki","092342938423","Driyo",3),("PUSTAKA05","2903482134823","Sulaiman",
         "Laki-laki","983274928374","Ketintang",1);
insert into kategori (kode_kategori, nama) values
    ("KTG01","Percintaan"),("KTG02","Legenda"),("KTG03","Misteri"),
    ("KTG04","Fiksi"),("KTG05","Horor");
insert into kategori_buku values (1,4),(2,2),(3,1),(4,4),(4,3),(5,1),(6,1);
alter table peminjaman_buku drop column tgl_pinjam;
alter table peminjaman_buku drop column tanggal_kembali;
alter table peminjaman add tgl_peminjaman date not null;
alter table peminjaman add tgl_pengembalian date not null;
insert into peminjaman (kode_peminjaman,id_anggota,id_pustakawan, tgl_peminjaman,
    tgl_pengembalian) values ("PJM2017020301",9,1,"2017-01-29","2017-02-02"),
    ("PJM2017020302",8,1,"2017-01-31","2017-02-4"),
    ("PJM2017020303",6,1,"2017-01-31","2017-02-4"),
    ("PJM2017020304",10,1,"2017-01-31","2017-02-4"),
    ("PJM2017020305",7,1,"2017-01-31","2017-02-4");
update buku set in_stok = 1 where id = 1;
update buku set in_stok = 1 where id = 4;
update buku set in_stok = 0 where id = 3;
update buku set in_stok = 0 where id = 6;
insert into peminjaman_buku (id_peminjaman,id_buku) values (1,3),(1,1),(2,4),(3,6),(4,1),(5,4);
insert into pengembalian (kode_kembali, id_peminjaman, id_pustakawan, keterangan) values
    ("KBL2017020301",6,1,"Terlambat 1 hari");
insert into pengembalian (kode_kembali, id_peminjaman, id_pustakawan) values
    ("KBL2017020302",2,1),("KBL2017020305",5,1);
insert into pengembalian_buku (id_pengembalian, id_buku) values (1,3),(1,1),(2,4),(3,4);
insert into pendendaan (id_pengembalian, total) values (1,6000);
insert into pendendaan_buku (id_pendendaan,id_peminjaman_buku,id_jenis_denda,nominal)
    values (1,1,1,3000),(1,2,1,3000);
update buku set in_stok = 2 where id = 1;
update buku set in_stok = 1 where id = 3;
update buku set in_stok = 3 where id = 4;
alter table anggota
add foreign key (id_kecamatan)
references kecamatan (id);
alter table anggota
add foreign key (id_kabupaten)
references kabupaten(id);
alter table buku  add foreign key (id_penerbit) references penerbit (id);
alter table kategori_buku add foreign key (id_buku) references buku(id);
alter table kategori_buku add foreign key (id_kategori) references kategori(id);
alter table kecamatan add foreign key (id_kabupaten) references kabupaten(id);
alter table peminjaman add foreign key (id_anggota) references anggota(id);
alter table peminjaman add foreign key (id_pustakawan) references pustakawan(id);
alter table peminjaman_buku add foreign key (id_peminjaman) references peminjaman(id);
alter table peminjaman_buku add foreign key (id_buku) references buku(id);
alter table pendendaan add foreign key (id_pengembalian) references pengembalian(id);
alter table pendendaan_buku add foreign key(id_pendendaan) references pendendaan(id);
alter table pendendaan_buku add foreign key(id_peminjaman_buku) references peminjaman_buku(id);
alter table pendendaan_buku add foreign key(id_jenis_denda) references jenis_denda(id);
alter table pengarang_buku add foreign key(id_buku) references buku(id);
alter table pengarang_buku add foreign key(id_pengarang) references pengarang(id);
alter table pengembalian add foreign key (id_peminjaman) references peminjaman(id);
alter table pengembalian add foreign key (id_pustakawan) references pustakawan(id);
alter table pengembalian_buku add foreign key (id_pengembalian) references pengembalian(id);
alter table pengembalian_buku add foreign key (id_buku) references buku(id);

alter table anggota drop column id_kota;
alter table pustakawan drop column id_kota;

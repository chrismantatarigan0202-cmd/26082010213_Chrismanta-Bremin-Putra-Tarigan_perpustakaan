CREATE DATABASE IF NOT EXISTS perpustakaan
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE perpustakaan;

CREATE TABLE IF NOT EXISTS kategori (
    id_kategori INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nama_kategori VARCHAR(50) NOT NULL,
    deskripsi VARCHAR(150) DEFAULT NULL,
    PRIMARY KEY (id_kategori)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS penerbit (
    id_penerbit INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nama_penerbit VARCHAR(100) NOT NULL,
    kota VARCHAR(50) DEFAULT NULL,
    telepon VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (id_penerbit)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS buku (
    id_buku INT UNSIGNED NOT NULL AUTO_INCREMENT,
    judul VARCHAR(150) NOT NULL,
    pengarang VARCHAR(100) NOT NULL,
    tahun_terbit YEAR DEFAULT NULL,
    stok INT UNSIGNED NOT NULL DEFAULT 0,
    id_kategori INT UNSIGNED DEFAULT NULL,
    id_penerbit INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id_buku),
    KEY idx_buku_kategori (id_kategori),
    KEY idx_buku_penerbit (id_penerbit),
    CONSTRAINT fk_buku_kategori
        FOREIGN KEY (id_kategori) REFERENCES kategori (id_kategori),
    CONSTRAINT fk_buku_penerbit
        FOREIGN KEY (id_penerbit) REFERENCES penerbit (id_penerbit)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO kategori (nama_kategori, deskripsi) VALUES
    ('Pemrograman', 'Buku tentang bahasa dan logika pemrograman'),
    ('Basis Data', 'Buku tentang perancangan dan pengelolaan database'),
    ('Jaringan', 'Buku tentang jaringan komputer dan keamanan'),
    ('Sistem Informasi', 'Buku tentang analisis dan perancangan sistem'),
    ('Desain', 'Buku tentang desain antarmuka dan grafis');

INSERT INTO penerbit (nama_penerbit, kota, telepon) VALUES
    ('Informatika Bandung', 'Bandung', '022-7500001'),
    ('Andi Offset', 'Yogyakarta', '0274-561881'),
    ('Elex Media Komputindo', 'Jakarta', '021-5365001'),
    ('Gava Media', 'Yogyakarta', '0274-889398'),
    ('Deepublish', 'Sleman', '0274-4533427');

INSERT INTO buku (judul, pengarang, tahun_terbit, stok, id_kategori, id_penerbit) VALUES
    ('Belajar PHP dan MySQL untuk Pemula', 'Budi Raharjo', 2022, 8, 1, 1),
    ('Dasar-Dasar Basis Data', 'Siti Aminah', 2021, 5, 2, 2),
    ('Pemrograman Web dengan HTML dan CSS', 'Andi Wijaya', 2023, 10, 1, 3),
    ('Perancangan Basis Data Relasional', 'Rina Kartika', 2020, 4, 2, 1),
    ('Jaringan Komputer untuk Mahasiswa', 'Dedi Santoso', 2019, 6, 3, 4),
    ('Analisis dan Perancangan Sistem Informasi', 'Maya Puspita', 2022, 7, 4, 2),
    ('Git dan GitHub untuk Kolaborasi Tim', 'Rizky Pratama', 2024, 9, 1, 5),
    ('Desain UI/UX Modern', 'Lestari Dewi', 2023, 3, 5, 3);

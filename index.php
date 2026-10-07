<?php

require_once __DIR__ . '/services/config.php';

$kategori = mysqli_query(
    $conn,
    'SELECT id_kategori, nama_kategori, deskripsi FROM kategori ORDER BY nama_kategori'
)->fetch_all(MYSQLI_ASSOC);

$penerbit = mysqli_query(
    $conn,
    'SELECT id_penerbit, nama_penerbit, kota, telepon FROM penerbit ORDER BY nama_penerbit'
)->fetch_all(MYSQLI_ASSOC);

$buku = mysqli_query(
    $conn,
    'SELECT buku.id_buku, buku.judul, buku.pengarang, buku.tahun_terbit, buku.stok,
            kategori.nama_kategori, penerbit.nama_penerbit
     FROM buku
     LEFT JOIN kategori ON buku.id_kategori = kategori.id_kategori
     LEFT JOIN penerbit ON buku.id_penerbit = penerbit.id_penerbit
     ORDER BY buku.judul'
)->fetch_all(MYSQLI_ASSOC);

function e($value)
{
    return htmlspecialchars((string) ($value ?? '-'), ENT_QUOTES, 'UTF-8');
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Katalog perpustakaan sederhana berisi data buku, kategori, dan penerbit.">
    <title>Katalog Perpustakaan</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header class="site-header">
        <nav class="navigation container" aria-label="Navigasi utama">
            <a class="brand" href="#beranda"><span class="brand-mark">P</span> Perpustakaan</a>
            <div class="nav-links">
                <a href="#buku">Koleksi buku</a>
                <a href="#kategori">Kategori</a>
                <a href="#penerbit">Penerbit</a>
            </div>
        </nav>
        <div class="hero container" id="beranda">
            <p class="eyebrow">KATALOG DIGITAL</p>
            <h1>Temukan bacaan<br><span>yang menginspirasi.</span></h1>
            <p class="hero-copy">Jelajahi koleksi perpustakaan berdasarkan buku, kategori, dan penerbit.</p>
            <a class="button" href="#buku">Jelajahi koleksi <span aria-hidden="true">↓</span></a>
            <div class="hero-decoration" aria-hidden="true">BACA<br>LEBIH</div>
        </div>
    </header>

    <main class="container main-content">
        <section class="stats" aria-label="Ringkasan koleksi">
            <div class="stat-card"><span class="stat-icon">▤</span><div><strong><?= count($buku) ?></strong><span>Judul buku</span></div></div>
            <div class="stat-card"><span class="stat-icon">◈</span><div><strong><?= count($kategori) ?></strong><span>Kategori</span></div></div>
            <div class="stat-card"><span class="stat-icon">⌂</span><div><strong><?= count($penerbit) ?></strong><span>Penerbit</span></div></div>
        </section>

        <section class="section" id="buku">
            <div class="section-heading">
                <div><p class="eyebrow">KOLEKSI</p><h2>Daftar buku</h2></div>
                <span class="record-count"><?= count($buku) ?> buku tersedia</span>
            </div>
            <div class="table-wrap">
                <table>
                    <thead><tr><th>Judul &amp; pengarang</th><th>Kategori</th><th>Penerbit</th><th>Tahun</th><th>Stok</th></tr></thead>
                    <tbody>
                    <?php if (!$buku): ?>
                        <tr><td class="empty-state" colspan="5">Belum ada data buku.</td></tr>
                    <?php else: ?>
                        <?php foreach ($buku as $item): ?>
                            <tr>
                                <td><strong><?= e($item['judul']) ?></strong><span class="secondary"><?= e($item['pengarang']) ?></span></td>
                                <td><span class="tag"><?= e($item['nama_kategori']) ?></span></td>
                                <td><?= e($item['nama_penerbit']) ?></td>
                                <td><?= e($item['tahun_terbit']) ?></td>
                                <td><span class="stock"><?= e($item['stok']) ?></span></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </section>

        <div class="reference-grid">
            <section class="section" id="kategori">
                <div class="section-heading compact"><div><p class="eyebrow">JELAJAHI</p><h2>Kategori</h2></div></div>
                <div class="info-list">
                    <?php if (!$kategori): ?><p class="empty-state">Belum ada data kategori.</p><?php endif; ?>
                    <?php foreach ($kategori as $item): ?>
                        <article class="info-item">
                            <span class="list-number"><?= e(str_pad((string) $item['id_kategori'], 2, '0', STR_PAD_LEFT)) ?></span>
                            <div><h3><?= e($item['nama_kategori']) ?></h3><p><?= e($item['deskripsi']) ?></p></div>
                        </article>
                    <?php endforeach; ?>
                </div>
            </section>

            <section class="section" id="penerbit">
                <div class="section-heading compact"><div><p class="eyebrow">MITRA BACA</p><h2>Penerbit</h2></div></div>
                <div class="info-list">
                    <?php if (!$penerbit): ?><p class="empty-state">Belum ada data penerbit.</p><?php endif; ?>
                    <?php foreach ($penerbit as $item): ?>
                        <article class="info-item publisher-item">
                            <span class="publisher-icon" aria-hidden="true">P</span>
                            <div><h3><?= e($item['nama_penerbit']) ?></h3><p><?= e($item['kota']) ?><?php if ($item['telepon']): ?> · <?= e($item['telepon']) ?><?php endif; ?></p></div>
                        </article>
                    <?php endforeach; ?>
                </div>
            </section>
        </div>
    </main>

    <footer class="site-footer">
        <div class="container footer-content"><a class="brand" href="#beranda"><span class="brand-mark">P</span> Perpustakaan</a><p>Koleksi pilihan untuk membuka wawasan.</p></div>
    </footer>
</body>
</html>

<?php

$host = 'localhost';
$user = 'root';
$password = '';
$database = 'perpustakaan';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    http_response_code(500);
    exit('Koneksi database gagal: ' . htmlspecialchars(mysqli_connect_error(), ENT_QUOTES, 'UTF-8'));
}

if (!mysqli_set_charset($conn, 'utf8mb4')) {
    http_response_code(500);
    exit('Charset database gagal diatur: ' . htmlspecialchars(mysqli_error($conn), ENT_QUOTES, 'UTF-8'));
}

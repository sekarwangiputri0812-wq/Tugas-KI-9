<?php

echo '<link rel="stylesheet" href="style.css">'; 

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Cek apakah file ada dan tidak error
    if (isset($_FILES['pdf_file']) && $_FILES['pdf_file']['error'] === UPLOAD_ERR_OK) {

        $file_tmp_path = $_FILES['pdf_file']['tmp_name'];
        $file_name = $_FILES['pdf_file']['name'];
        $file_size = $_FILES['pdf_file']['size'];
        $file_type = $_FILES['pdf_file']['type'];
        $file_name_parts = explode('.', $file_name);
        $file_ext = strtolower(end($file_name_parts));

        // Validasi tipe file
        if ($file_ext === 'pdf' && $file_type === 'application/pdf') {
            
            // Validasi ukuran file (10 MB)
            if ($file_size <= 10485760) {
                
                // Simpan file
                $upload_dir = 'uploads/';
                $new_file_name = 'sekar' . time() . '_' . $file_name;
                $dest_path = $upload_dir . $new_file_name;

                // Buat folder jika belum ada
                if (!is_dir($upload_dir)) {
                    mkdir($upload_dir, 0755, true);
                }

                if (move_uploaded_file($file_tmp_path, $dest_path)) {
                    // Simpan ke database
                    saveToDatabase($dest_path, $file_name);
                    
                    echo "<h1>Upload Berhasil!</h1>";
                    echo "<p>File " . htmlspecialchars($file_name) . " telah berhasil diunggah.</p>";
                } else {
                    echo "<h1>Upload Gagal!</h1>";
                    echo "<p>Terjadi kesalahan saat memindahkan file.</p>";
                }

            } else {
                echo "<h1>Upload Gagal!</h1>";
                echo "<p>Ukuran file terlalu besar. Maksimal 10MB.</p>";
            }

        } else {
            echo "<h1>Upload Gagal!</h1>";
            echo "<p>Hanya file PDF yang diperbolehkan.</p>";
        }

    } else {
        echo "<h1>Error!</h1>";
        echo "<p>Tidak ada file yang dipilih atau terjadi error saat upload.</p>";
    }
}

function saveToDatabase($file_path, $original_name) {
    $host = 'localhost';
    $dbname = 'upload_pdf_db';
    $username = 'root';
    $password = '';

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        
        // Buat tabel jika belum ada
        $pdo->exec("CREATE TABLE IF NOT EXISTS pdf_files (
            id INT AUTO_INCREMENT PRIMARY KEY,
            path VARCHAR(500) NOT NULL,
            name VARCHAR(255)
        )");

        $stmt = $pdo->prepare("INSERT INTO pdf_files (path, name) VALUES (?, ?)");
        $stmt->execute([$file_path, $original_name]);
        
    } catch (PDOException $e) {
        echo "Error database: " . $e->getMessage();
    }
}
?>
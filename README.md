# Identitas
Nama                : Yasmine Putri Viryadhani<br>
NPM                 : 2206081862<br>
Kelas               : PBP A<br>
Nama App            : ultr4milk<br>

# Latar Belakang:
- Saya membuat program Flutter bertema inventory susu Ultra Milk karena barang yang diinventorikan hanyalah susu Ultra Milk (homogen).
- Belakangan ini, Ultra Milk berkolaborasi dengan [**Stray Kids**](https://en.wikipedia.org/wiki/Stray_Kids) untuk iklan terbarunya
- Jika pengguna meraih poin tertentu, mereka dapat menukarkan poin dengan photocard digital Ultra Milk x Stray Kids

# Checklist
## Checklist Tugas 3
<details>
<summary>Spoiler</summary>

## ✅ Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
- Setelah setup dan instalasi Flutter, kita membuat program Flutter dengan cara:
    ```
    flutter create ultr4milk
    cd ultr4milk
    ```
- Untuk menjalankan app, kita jalankan <code>flutter run</code> di Terminal

## ✅ Membuat tiga tombol sederhana dengan ikon dan teks untuk Lihat Item, Tambah Item, dan Logout
- Saya membuat empat tombol, yaitu Purchase, Add Item (Tambah Item), Logout, dan Inventory (Lihat Item)

## ✅ Memunculkan Snackbar dengan tulisan "Kamu telah menekan tombol XXX"
</details>

# Pertanyaan
## Pertanyaan Tugas 7
<details>
<summary>Spoiler</summary>

### 1. Apa itu Django <code>UserCreationForm</code>, dan jelaskan apa kelebihan dan kekurangannya?
<details>
<summary>Show Answer</summary>

- <code>UserCreationForm</code> adalah import bawaan yang berfungsi untuk memudahkan pembuatan formulir pendaftaran user dalam suatu aplikasi web.
- Kelebihan:
    - <code>UserCreationForm</code> memudahkan pengguna baru untuk mendaftar sebagai user di website yang kita buat tanpa harus membuat kode dari awal.
    - Kita juga dapat mengkustomisasi label dari form yang kita buat dengan membuat forms yang dilengkapi dengan impor <code>UserCreationForm</code> sehingga tidak mengikuti format default yang disediakan Django
- Kekurangan:
    - Field-field dalam <code>UserCreationForm</code> secara default hanya terdiri atas username, password, dan konfirmasi password. Jika user ingin menambahkan field-field lain, maka mereka harus membuat kustomisasi form.
    - <code>UserCreationForm</code> tidak langsung terhubung ke user, sehingga kita harus menghubungkan model-model dalam app dengan user secara manual
</details>

### 2. Apa perbedaan antara autentikasi dan otorisasi dalam konteks Django, dan mengapa keduanya penting?
<details>

- Authentication (AuthN) adalah suatu proses memastikan dan memverifikasi user bahwa mereka benar-benar dirinya. Biasanya di dalam proses ini dilakukan pengecekan atribut user dengan database aplikasi. Jika atribut user cocok dengan data yang ada di database, user tersebut dikatakan telah terautentikasi.
- Authorization (AuthZ) adalah proses menentukan apa yang seorang user boleh lakukan dalam aplikasi. Biasanya proses ini berupa pemberian *roles*, *groups*, *permissions*, dll yang menunjukkan apa yang user tersebut bisa lakukan.
- Authentication dan Authorization dibutuhkan untuk keamanan aset data dalam app. Tanpa keduanya, data dalam app kita akan rentan pada kebocoran data serta pembobolan akses data.
<summary>Show Answer</summary>
</details>

### 3. Apa itu cookies dalam konteks aplikasi web, dan bagaimana Django menggunakan cookies untuk mengelola data sesi pengguna?
<details>
<summary>Show Answer</summary>

- Cookies adalah secuil informasi yang disimpan di browser milik klien.
- Cookies digunakan untuk menyimpan data di dalam suatu file secara permanen atau dalam jangka waktu tertentu.
- Cookies memiliki batas waktu dan akan hilang jika kadaluwarsa.
- Django menyediakan metode bawaan untuk meng-*set* dan *fetch* cookie:
    - Method <code>set_cookie()</code> digunakan untuk meng-*set* cookie
    - Method <code>get()</code> digunakan untuk mendapatkan cookie
    - Array <code>request.COOKIES['key']</code> digunakan untuk mendapatkan value dari cookie
</details>

### 4. Apakah penggunaan cookies aman secara default dalam pengembangan web, atau apakah ada risiko potensial yang harus diwaspadai?
<details>
<summary>Show Answer</summary>

- Beberapa cookies lebih *secure* dari cookies lainnya.
- Secara default, cookies terkoneksi dengan <code>http</code>.
- Dalam beberapa kasus, kita perlu menggunakan <code>https</code> untuk mengirim cookie
- Untuk mengindari kebocoran data cookies, kita harus meng-*set* setting <code>SESSION_COOKIE_SECURE</code> dan <code>CSRF_COOKIE_SECURE</code> ke <code>True</code>
</details>

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).
Baca bagian [Checklist Tugas 4](#checklist-tugas-4) di atas
</details>
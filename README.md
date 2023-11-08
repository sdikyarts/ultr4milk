# Identitas
Nama                : Yasmine Putri Viryadhani<br>
NPM                 : 2206081862<br>
Kelas               : PBP A<br>
Nama App            : ultr4milk<br>

# Latar Belakang:
- Saya membuat program Flutter bertema inventory susu Ultra Milk karena barang yang diinventorikan hanyalah susu Ultra Milk (homogen).
- Belakangan ini, Ultra Milk berkolaborasi dengan [**Stray Kids**](https://en.wikipedia.org/wiki/Stray_Kids) untuk iklan terbarunya
- Jika pengguna meraih poin tertentu, mereka dapat menukarkan poin dengan photocard digital Ultra Milk x Stray Kids

# Tampilan Aplikasi:
- Coming Soon

# Checklist
## Checklist Tugas 7
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
- Kode lengkap bisa dilihat di [sini](https://github.com/sdikyarts/ultr4milk/blob/main/ultr4milk/lib/home.dart) di atas

## ✅ Memunculkan Snackbar dengan tulisan "Kamu telah menekan tombol XXX"
- Untuk membuat itu, saya memakai syntax ini:
    ```
    return InkWell(
        onTap: () {
            final message = "You pressed ${item.name} button!";
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text(message)));
    },
    ```
</details>


# Pertanyaan
## Pertanyaan Tugas 7
<details>
<summary>Spoiler</summary>

### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
<details>
<summary>Show Answer</summary>

Dalam pengembangan aplikasi Flutter, perbedaan utama antara stateless dan stateful widget terletak pada kemampuan untuk mempertahankan dan mengubah data atau keadaan (state). Stateless widget adalah komponen tampilan yang tidak memiliki keadaan internal dan bersifat statis, artinya tampilan yang dibuat oleh widget ini tidak dapat berubah sepanjang siklus hidupnya. Sementara itu, stateful widget memiliki kemampuan untuk menyimpan dan memperbarui keadaan internal, sehingga tampilan yang dibuatnya dapat berubah sesuai dengan perubahan data atau interaksi pengguna. Sebagai contoh, tombol dengan teks yang dapat berubah berdasarkan tindakan pengguna akan menggunakan stateful widget, sementara ikon tetap atau teks statis akan menggunakan stateless widget.
</details>

### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
<details>

- Scaffold: Widget ini berfungsi untuk membuat tampilan dasar yang biasanya digunakan untuk membuat tampilan aplikasi yang berisi beberapa komponen seperti appbar, body, dan floating action button.
- Container: Widget ini berfungsi untuk membuat tampilan kotak yang dapat diatur ukurannya, seperti margin, padding, dan sebagainya.
- Column: Widget ini berfungsi untuk membuat tampilan kolom yang dapat diatur ukurannya, seperti margin, padding, dan sebagainya.
- Row: Widget ini berfungsi untuk membuat tampilan baris yang dapat diatur ukurannya, seperti margin, padding, dan sebagainya.
- Text: Widget ini berfungsi untuk membuat tampilan teks yang dapat diatur ukurannya, seperti margin, padding, dan sebagainya.
- InkWell: Widget ini berfungsi untuk membuat tampilan yang dapat diinteraksi dengan pengguna, seperti menekan tombol.
- Padding: Widget ini berfungsi untuk membuat tampilan yang dapat diatur ukurannya, seperti margin, padding, dan sebagainya.
- Image: Widget ini berfungsi untuk membuat tampilan gambar yang dapat diatur ukurannya, seperti margin, padding, dan sebagainya.
- Icon: Widget ini berfungsi untuk membuat tampilan ikon yang dapat diatur ukurannya, seperti margin, padding, dan sebagainya.
- SizedBox: Widget ini berfungsi untuk membuat tampilan kotak yang dapat diatur ukurannya, seperti margin, padding, dan sebagainya.
<summary>Show Answer</summary>
</details>

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).
Baca bagian Checklist Tugas 7 di atas
</details>
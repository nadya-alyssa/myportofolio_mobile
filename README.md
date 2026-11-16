### Tugas 7

1. Widget tree adalah struktur hierarki atau susunan bertingkat dari berbagai widget yang membentuk tampilan (UI) suatu aplikasi. Widget paling atas adalah root, dan setiap widget bisa punya widget lain di dalamnya.

Hubungan parent-child artinya widget induk (parent) membungkus dan mengatur widget anak (child). Parent menentukan batasan ukuran (constraints) dan posisi child, sedangkan child menentukan ukurannya sendiri dalam batasan tersebut. Data dan tema juga mengalir dari atas ke bawah.
   
2. - MaterialApp: root aplikasi yang menyediakan tema, judul, dan konfigurasi Material Design.
- Scaffold: kerangka dasar halaman (AppBar, body, tempat SnackBar muncul).
- AppBar: bar di bagian atas halaman yang menampilkan judul "MyPortfolio".
- Padding: memberi jarak di sekeliling child.
- Column: menyusun child secara vertikal.
- Row: menyusun child secara horizontal (tiga InfoCard sejajar).
- Center: menempatkan child di tengah.
- SizedBox: memberi jarak kosong dengan ukuran tetap antar-widget.
- GridView.count: menampilkan ItemCard dalam kisi dengan jumlah kolom tetap (3 kolom).
- Card: kartu dengan bayangan (elevation) untuk membungkus isi InfoCard.
- Container: kotak serbaguna untuk mengatur lebar, padding, dan dekorasi.
- Material: permukaan bergaya Material yang mengatur warna latar dan sudut membulat ItemCard.
- InkWell: area yang bisa disentuh dan memberi efek ripple, serta menjalankan `onTap`.
- Icon: menampilkan ikon pada setiap tombol.
- Text: menampilkan teks (judul, NPM, nama, kelas, nama tombol).
- SnackBar: notifikasi singkat di bawah layar saat tombol ditekan.
- ScaffoldMessenger: pengelola SnackBar, dipakai untuk menampilkan dan menyembunyikannya.
- MyHomePage, InfoCard, ItemCard: widget buatan sendiri (StatelessWidget) agar komponen bisa dipakai ulang.

3. MaterialApp adalah widget yang membungkus aplikasi berbasis Material Design. Fungsinya menyediakan tema global (ThemeData, contohnya colorScheme dengan seed indigo), judul aplikasi, halaman awal (home), sistem navigasi/routing, dan pengaturan lokalisasi. Widget ini juga menyiapkan hal-hal yang dibutuhkan widget Material lain, seperti Scaffold, Theme.of(context), dan ScaffoldMessenger. Karena semua widget di bawahnya membutuhkan konfigurasi tersebut, MaterialApp diletakkan di paling atas sebagai root agar tema dan layanan itu bisa diakses oleh seluruh widget di dalam aplikasi.

4. StatelessWidget tidak menyimpan state yang berubah, tampilannya hanya ditentukan oleh data yang diberikan saat dibuat dan tidak berubah sendiri selama hidupnya. StatefulWidget punya objek State terpisah yang menyimpan data berubah, dan tampilannya bisa dibangun ulang dengan memanggil setState().

StatelessWidget sebaiknya dipilih untuk tampilan statis, seperti halaman menu pada proyek ini (identitas, kartu menu, dan tombol tidak berubah). StatefulWidget sebaiknya dipilih ketika tampilan harus berubah mengikuti interaksi atau data, misalnya counter, form dengan input, checkbox, atau data yang dimuat dari server.

5. BuildContext adalah objek yang merepresentasikan lokasi sebuah widget di dalam widget tree. Lewat context, widget bisa melihat ke atas tree untuk mengakses informasi dari widget leluhurnya. Context diberikan sebagai parameter pada method build(BuildContext context).

Pada proyek ini, context dipakai di Theme.of(context) untuk mengambil warna tema, MediaQuery.of(context) untuk mengambil ukuran layar untuk lebar InfoCard, dan ScaffoldMessenger.of(context) untuk menampilkan SnackBar.

6. Hot reload menyuntikkan kode yang baru diubah ke Dart VM yang sedang berjalan lalu membangun ulang widget tree, tanpa menghilangkan state aplikasi. Prosesnya sangat cepat, sehingga cocok untuk mengubah tampilan seperti warna atau teks. Hot restart menjalankan ulang aplikasi dari awal sehingga semua state kembali ke nilai awal, tetapi tetap lebih cepat daripada full restart.

Hot reload saja tidak cukup jika ingin mengubah isi main() atau nilai variabel global/static yang sudah terinisialisasi, mengubah state awal (initState) atau struktur class (mengubah Stateless menjadi Stateful atau sebaliknya), menambah atau mengubah enum dan tipe generik, menambah dependensi atau asset di pubspec.yaml, atau mengubah kode native di folder android/ atau ios/, yang memerlukan full restart.

Disclosure AI: Saya tidak menggunakan AI dalam pengerjaan tugas ini.
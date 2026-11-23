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

### Tugas 8

1. - `Navigator.push()` menambahkan route baru di atas stack. Halaman sebelumnya tetap ada di bawahnya, sehingga pengguna bisa kembali dengan tombol back.

    - `Navigator.pushReplacement()` menggantikan route teratas dengan route baru. Halaman lama dihapus dari stack, sehingga pengguna tidak bisa kembali ke halaman tersebut dengan tombol back.

    - `Navigator.pop()` menghapus route teratas dari stack dan kembali ke route di bawahnya. Pada proyek ini `pop()` dipakai untuk menutup `AlertDialog` ringkasan.

    Untuk membuka formulir dari kartu aksi, aplikasi memakai `Navigator.push()`. Dengan begitu halaman utama tetap berada di stack dan pengguna bisa kembali lewat tombol back di AppBar atau tombol back perangkat.

    Opsi Home di drawer memakai `Navigator.pushReplacement()` ke `MyHomePage()`. Halaman formulir yang sedang tampil digantikan oleh halaman utama, sehingga pengguna langsung sampai ke halaman utama tanpa tumpukan halaman formulir yang tersisa.

2. `Scaffold` menyediakan kerangka standar halaman: `appBar` di bagian atas, `drawer` di sisi kiri, dan `body` untuk konten. Karena semua halaman memakai kerangka yang sama, posisi judul, tombol menu, dan area konten selalu konsisten sehingga pengguna tidak perlu beradaptasi ulang di tiap halaman.

    `AppBar` menampilkan judul halaman dan otomatis memunculkan ikon drawer atau tombol back. `Drawer` dibuat sekali sebagai widget `LeftDrawer` di `widgets/left_drawer.dart` lalu dipakai ulang di `MyHomePage`, `ProjectFormPage`, dan `ExperienceFormPage`, sehingga menu navigasinya selalu sama dan perubahan cukup dilakukan di satu tempat.

    Contoh penggunaan warna tema portofolio di lebih dari satu halaman: warna indigo dipakai pada `AppBar` halaman utama, pada `AppBar` halaman formulir, pada `DrawerHeader` di drawer, dan pada tombol Simpan.

3. Formulir disusun vertikal dengan `Column` di dalam `Form` karena layar ponsel sempit dan susunan vertikal paling mudah dibaca dan diisi. Field diurutkan mengikuti model `Experience` pada proyek web Django (judul, deskripsi, kategori, thumbnail, tanggal mulai, tanggal selesai), lalu tombol Simpan di bagian bawah untuk menyimpan input form.

    Widget pengatur jarak seperti `Padding` memberi ruang di sekitar field agar tidak menempel satu sama lain dan area sentuh lebih nyaman. `SizedBox` bisa dipakai untuk jarak tetap antar-elemen.

    Widget penggulir, yaitu `SingleChildScrollView`, membungkus `Column` agar seluruh isi formulir tetap bisa digulir. `Column` sendiri tidak bisa di-scroll, sehingga tanpa `SingleChildScrollView` field dan tombol Simpan bisa terpotong atau memunculkan overflow ketika layar sempit atau ketika papan ketik tampil dan memakan sebagian layar. Dengan scroll, semua field dan tombol Simpan tetap dapat dijangkau.

4. - `GlobalKey<FormState>` dipasang pada widget `Form` sebagai pengenal agar kode di luar `Form` (misalnya tombol Simpan) bisa mengakses `FormState` dan mengendalikan seluruh form, seperti memanggil `validate()` dan `reset()`.

    - `validator` adalah fungsi di setiap `TextFormField` yang memeriksa isinya. Fungsi mengembalikan `String` berisi pesan error jika input tidak valid, atau `null` jika valid.

    - `validate()` dipanggil lewat `_formKey.currentState!.validate()` saat tombol Simpan ditekan. Method ini menjalankan semua `validator`, menampilkan pesan error di field yang bermasalah, dan mengembalikan `true` hanya jika semua field valid. Dialog ringkasan baru ditampilkan jika hasilnya `true`.

    Contoh nilai yang ditolak adalah pada field Thumbnail, `contoh.com/foto.jpg` atau `htp:/gambar` ditolak karena bukan URL berskema `http`/`https` dengan host yang valid. Contoh lain, judul yang hanya berisi spasi ditolak karena `trim()` membuatnya kosong, dan tanggal selesai yang lebih awal dari tanggal mulai ditolak oleh validator tanggal.

    Memilih jenis input atau papan ketik saja belum cukup karena `keyboardType: TextInputType.url` hanya mengubah tampilan papan ketik, tetapi pengguna tetap bisa mengetik atau mem-paste teks apa saja. Papan ketik angka pun tidak mencegah angka yang tidak masuk akal. Selain itu, aturan seperti urutan tanggal, batas panjang, dan input yang hanya berisi spasi tidak bisa dijamin oleh jenis input. Oleh karena itu, validasi harus tetap dilakukan di sisi aplikasi agar data yang masuk sesuai aturan model.

Disclosure AI: saya menggunakan bantuan Claude untuk mengimplementasi `showDatePicker()` dan validasi URL, serta membantu proofreading jawaban pertanyaan reflektif.
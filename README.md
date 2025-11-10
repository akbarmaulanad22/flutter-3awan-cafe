# 🍽️ Flutter - 3awan Cafe

Aplikasi mobile sederhana untuk menampilkan menu cafe, memesan makanan, dan mengelola keranjang belanja.  
Dibuat menggunakan **Flutter + Provider (State Management)** dan terhubung ke API Flask.

---

## 📦 Cara Install & Run

### 1️⃣ Clone Repository
```sh
git clone https://github.com/akbarmaulanad22/flutter-3awan-cafe.git
cd flutter-3awan-cafe
```

### 2️⃣ Install Dependencies
```sh
flutter pub get
```

### 3️⃣ Jalankan Aplikasi
```sh
flutter run
```

Pastikan API Flask sudah berjalan dan URL API sudah disesuaikan di menu_service.dart dan order_service.dart.

#### 🧱 Struktur Folder Project
``` css
Copy code
lib/
├── core/
│   ├── constants/
│   └── utils/
│
├── data/
│   ├── models/
│   │   ├── cart_item.dart
│   │   └── menu.dart
│   │
│   ├── services/
│   │   ├── menu_service.dart
│   │   └── order_service.dart
│   │
│   └── domain/
│       └── repositories/
│
├── presentations/
│   ├── viewmodels/
│   │   ├── cart_viewmodel.dart
│   │   └── home_viewmodel.dart
│   │
│   └── views/
│       ├── widgets/
│       │   └── menu_card.dart
│       ├── home_view.dart
│       ├── cart_view.dart
│       └── order_view.dart
│
├── app.dart
└── main.dart
```

### 🔗 Koneksi API
Pastikan kamu mengganti base URL pada file:

``` bash
lib/data/services/menu_service.dart
lib/data/services/order_service.dart
```

Contoh:

``` dart
final String baseUrl = "https://your-railway-api-url.up.railway.app";
```

## 🧭 Halaman yang Tersedia

| Halaman | Deskripsi |
|--------|-----------|
| **Home** | Menampilkan daftar menu dari API |
| **Cart** | Menampilkan item yang sudah ditambahkan ke keranjang |
| **Order** | Menampilkan daftar / riwayat pesanan |

## 🤝 Kontribusi
Pull request dipersilakan. Silakan edit sesuai kebutuhan dan kembangkan fitur sesuai kreativitasmu 🎨

## 🚀 License
Project ini dibuat untuk keperluan pembelajaran dan bebas diadaptasi.
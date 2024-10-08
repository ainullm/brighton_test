Berikut adalah ringkasan untuk aplikasi film menggunakan OMDB API:

### **Fitur-Fitur**
1. **List Movie**
   - **Deskripsi**: Menampilkan daftar film berdasarkan kategori.
   - **API**: `https://www.omdbapi.com/?s={query}&apikey={your_api_key}`

2. **Popular**
   - **Deskripsi**: Menampilkan film populer saat ini.
   - **API**: `https://www.omdbapi.com/?s=popular&apikey={your_api_key}`

3. **Search**
   - **Deskripsi**: Cari film berdasarkan judul.
   - **API**: `https://www.omdbapi.com/?t={title}&apikey={your_api_key}`

4. **Favorite**
   - **Deskripsi**: Simpan dan kelola film favorit secara lokal.

### **Struktur Data (Contoh)**
- **List Movie**: Daftar film dengan `Title`, `Year`, `imdbID`, `Poster`.
- **Detail Film**: Informasi lengkap termasuk `Title`, `Plot`, `Poster`, `Ratings`.

### **Antarmuka Pengguna (UI)**
1. **Halaman Utama**: Pilih kategori (List, Popular, Search).
2. **Halaman Popular**: Daftar film populer.
3. **Halaman Search**: Formulir pencarian film.
4. **Halaman Favorite**: Daftar film favorit.
5. **Halaman Detail**: Informasi lengkap film terpilih.

Semoga ini membantu!


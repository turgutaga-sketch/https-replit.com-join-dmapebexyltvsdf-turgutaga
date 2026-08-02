# Son İki Adım

Bu dosya, içeride yapılabilecek hazırlıklar tamamlandıktan sonra hesap sahibinin yapacağı son işlemleri gösterir.

## 1. Bulut sunucuyu aç ve projeyi kur

Önerilen başlangıç kapasitesi:
- Ubuntu LTS
- En az 4 vCPU
- En az 8 GB RAM
- En az 160 GB NVMe
- Günlük yedekleme

Sunucuda:
1. Docker ve Docker Compose kurulur.
2. Bu GitHub deposu klonlanır.
3. `deploy/.env.example`, `deploy/.env` olarak kopyalanır.
4. Güçlü parolalar ve alan adı yazılır.
5. `bash deploy/install.sh` çalıştırılır.
6. HTTPS ve sağlık kontrolü doğrulanır.

## 2. Hesap izinlerini onayla

Hesap sahibi yalnız güvenli sağlayıcı ekranlarından izin verir:
- Telegram bot tokeni ve owner chat ID
- YouTube kanal OAuth izinleri
- Kullanılacak AI/TTS/müzik servis anahtarları
- Depolama erişim anahtarı

Kurallar:
- Google, Telegram veya AI servis şifreleri GitHub'a yazılmaz.
- Şifre veya kart bilgisi Telegram mesajıyla gönderilmez.
- Her YouTube kanalı ayrı credential ile bağlanır.
- İlk yayınlar private/unlisted test edilir.

## Canlıya alma testi

1. Telegram test mesajı gelir.
2. Hata workflow'u test hatasında alarm gönderir.
3. Veritabanı yedeği alınır ve geri açma testi yapılır.
4. Bir test videosu private olarak doğru kanala yüklenir.
5. Maliyet kaydı ve günlük rapor Telegram'da görünür.
6. Kaliteyi geçmeyen test içeriği veritabanı tarafından engellenir.
7. Tüm testler geçince yayın modu kontrollü olarak açılır.

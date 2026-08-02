# Go-Live Checklist

Bu liste yalnızca hesap sahibinin bir kez yapması gereken işlemleri gösterir. Günlük işletim otomatik olacaktır.

## 1. Bulut sunucu

- Ubuntu 24.04 LTS VPS
- En az 2 vCPU / 4 GB RAM başlangıç
- Docker ve Docker Compose
- Alan adı veya alt alan adı: ör. automation.example.com
- HTTPS reverse proxy

## 2. Güvenli ortam

- `deploy/.env.example` dosyasını `deploy/.env` olarak kopyala
- Güçlü PostgreSQL parolası oluştur
- En az 64 karakterlik n8n encryption key oluştur
- Gerçek `.env` dosyasını GitHub'a yükleme

## 3. Telegram

- Telegram'da BotFather üzerinden bir bot oluştur
- Tokeni yalnız n8n Credentials bölümüne kaydet
- Bota bir mesaj gönder
- Kendi chat ID değerini alarm workflow içindeki `CHANGE_ME_OWNER_CHAT_ID` alanına yaz
- Telegram credential seç
- Test mesajı gönder

## 4. n8n

- `deploy/install.sh` ile servisleri başlat
- İlk owner hesabını oluştur
- 2FA etkinleştir
- `workflows/telegram-error-alert.json` içe aktar
- Telegram credential bağla
- Workflow'u aktif et
- `n8n audit` çalıştır ve kritik bulguları düzelt

## 5. Veritabanı

- `schemas/media_system.sql` dosyasını medya veritabanında çalıştır
- İlk kanalları `testing` durumunda ekle
- Günlük kanal başına yayın ve bütçe limitlerini gir

## 6. YouTube

- Google Cloud projesi oluştur
- YouTube Data API ve Analytics API'yi aç
- OAuth consent screen ayarla
- Her kanal için yetki ver
- Tokenleri n8n Credentials içinde sakla
- İlk yüklemeyi private olarak test et

## 7. Yayına geçiş kapısı

- Telegram test alarmı ulaştı
- Veritabanı publish gate testi başarısız içeriği durduruyor
- YouTube private test videosu yüklendi
- Bütçe limiti çalışıyor
- Aynı video tekrar kontrolü çalışıyor
- İlk 30 gün insan onayı zorunlu
- Acil `/pause` ve `/resume` komutları test edildi

## Canlıya geçiş kararı

Tüm maddeler tamamlanmadan otomatik public yayın açılmaz.

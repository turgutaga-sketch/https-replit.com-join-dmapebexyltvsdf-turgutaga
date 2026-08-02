# Stack Decision

## Karar

Ana otomasyon motoru: **n8n self-hosted**.

Neden:
- İşlem başına ücret yerine kendi sunucunda sınırsıza yakın iş akışı
- YouTube, HTTP API, Google, veritabanı ve AI servisleriyle esnek bağlantı
- JSON olarak yedeklenebilir iş akışları
- Mac üzerinde test, VPS üzerinde 24/7 çalışma

## Alternatiflerin yeri

### Make
Hızlı prototip ve hazır uygulama bağlantıları için iyi; fakat her modül kredisi büyüyen üretimde maliyeti artırır. Yedek araç olarak tutulur.

### Zapier
Basit iş akışlarında kolay; ücretsiz planda 100 görev/ay ve iki adımlı akış sınırı vardır. Çok aşamalı medya fabrikasının ana sistemi yapılmaz.

### Cloudflare
- R2: düşük maliyetli medya depolama ve ücretsiz internet çıkışı
- Workers: webhook, küçük API ve güvenlik katmanı
- İlk aşamada ücretsiz limitler veya 5 USD Workers planı yeterli olabilir

### Supabase/Postgres
İlk testte ücretsiz; üretimde sürekli çalışma ve günlük yedek için Pro değerlendirilebilir. Video dosyaları burada değil R2'de tutulur.

## AI servis seçimi

- Metin ve karar: düşük maliyetli model varsayılan; yüksek kalite model yalnız final senaryo ve kritik kontrolde
- Ses: ElevenLabs yalnız önemli uzun videolarda; deneme/Shorts için düşük maliyetli veya yerel TTS
- Müzik: Suno'nun ticari kullanım hakkı veren ücretli planında üretilen yeni şarkılar
- Video: önce FFmpeg + lisanslı stok + hareketli görsel; pahalı generatif video yalnız en yüksek puanlı sahnelerde

## Tahmini başlangıç bütçesi

- n8n VPS: yaklaşık 5-10 €/ay
- Cloudflare: 0-5 €/ay başlangıç
- Veritabanı: 0 € test, üretimde ihtiyaca göre
- Suno Pro: yaklaşık 8 USD/ay yıllık ödeme eşdeğeri
- ElevenLabs: 0-22 USD/ay veya kullandıkça öde
- AI API: bütçe kapılı, kullanım bazlı

Hedef sabit maliyet: **yaklaşık 13-40 €/ay**, üretim maliyetleri hariç. Her sağlayıcıda fiyat değişebileceği için panelde aylık gerçek harcama kaydı zorunludur.

## Haklar ve lisans

- Ücretsiz Suno çıktıları ticari amaçla kullanılmaz.
- Kullanılan her müzik, görsel, video ve ses için kaynak, lisans, üretim tarihi ve hesap planı kaydedilir.
- Açık kaynak kodlar yalnız lisansları izin veriyorsa kullanılır; lisans ve atıf dosyası tutulur.
- Başka kanallardan video/ses/metin kopyalanmaz.

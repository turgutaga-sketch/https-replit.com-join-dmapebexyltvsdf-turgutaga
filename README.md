# Global AI Media System

AutoBuro ve NWASB operasyon verilerinden tamamen ayrı, düşük maliyetli ve uzun süre kullanılabilir içerik üretim sistemi.

## Amaç

Araştırma → fikir puanlama → senaryo → ses → görsel/video → kalite kontrol → insan onayı → YouTube yükleme → 24s/72s/7g analiz → öğrenme döngüsü.

## Ana ilke

Çok video basmak değil; özgünlük, izleyici memnuniyeti, telif güvenliği ve kârlılık eşiğini geçen içerikleri yayımlamak.

## Seçilen omurga

- n8n self-hosted: otomasyon ve ajan orkestrasyonu
- YouTube Data API + YouTube Analytics API: yükleme ve performans verisi
- Postgres/Supabase: kanal, fikir, içerik, maliyet ve sonuç kayıtları
- Cloudflare R2: video, ses, thumbnail ve proje dosyaları
- FFmpeg: ücretsiz video birleştirme, altyazı ve ses miksajı
- OpenAI/uygun maliyetli LLM: araştırma özeti, senaryo ve kalite kontrol
- ElevenLabs veya yerel TTS: seçilebilir ses üretimi
- Suno ücretli plan: yalnız ticari hak gereken müzik üretimi

## Başlangıç yayın modeli

- Ağ genelinde günde 1 ana uzun video
- Günde 2-4 Shorts/teaser
- Haftada 2-3 özgün şarkı
- İlk 30 gün tüm yayınlarda insan onayı
- Otomatik yayın yalnız kalite, telif ve maliyet kapılarından sonra

## Kanal kümeleri

1. Hikâye ve anlatım
2. Otomobil bilgisi
3. Müzik
4. Fitness/sağlıklı yaşam (kaynak ve güvenlik kontrolü zorunlu)

İlk aşamada aynı anda yalnız üç kanal aktif edilir. Yeni kanal, mevcut formatlardan biri veriyle doğrulanmadan açılmaz.

## Kalite kapısı

Bir içerik aşağıdakilerin tamamını geçmeden yayımlanmaz:

- Özgünlük >= 85/100
- Senaryo >= 80/100
- İlk 30 saniye kancası >= 80/100
- Görüntü-ses uyumu >= 80/100
- Thumbnail okunabilirliği >= 85/100
- Telif kontrolü: geçti
- Yanlış bilgi kontrolü: geçti
- Tahmini maliyet: bütçe içinde

## Klasör planı

- `docs/` strateji ve işletme kitapları
- `workflows/` n8n iş akışları
- `schemas/` veritabanı şemaları
- `prompts/` ajan ve içerik şablonları
- `scripts/` FFmpeg ve yardımcı araçlar
- `dashboard/` üretim, maliyet ve performans paneli

## Güvenlik

API anahtarları GitHub'a yazılmaz. `.env` yalnız sunucuda tutulur. YouTube OAuth yetkileri kanal bazında ayrılır. Her otomatik yükleme öncesi kanal kimliği doğrulanır.

## Maliyet yaklaşımı

Sabit ve düşük altyapı maliyeti; pahalı video üretimi yalnız puanı yüksek içeriklerde. İlk hedef altyapıyı yaklaşık 5-30 €/ay aralığında tutmak, AI üretim maliyetini içerik başına ölçmek ve gelir getirmeyen formatı otomatik durdurmaktır.

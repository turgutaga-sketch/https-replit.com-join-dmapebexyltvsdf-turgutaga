# Global AI Media Agent System

## Global kurallar
- Kopya içerik üretme.
- Lisansı belirsiz ses, video, görsel veya müzik kullanma.
- Sağlık, finans, hukuk ve güvenlik iddialarında doğrulanabilir kaynak olmadan kesin konuşma.
- Aynı şablonu seri üretim biçiminde yeniden kullanma.
- Kanal vaadine uymayan içeriği reddet.
- Bütçe sınırını aşan işi üretme.
- Kritik hata halinde ilgili kuyruğu durdur ve Telegram alarmı oluştur.

## CEO Agent
Girdi: kanal performansı, bütçe, üretim kuyruğu, hata kayıtları.
Çıktı: büyüt, koru, azalt veya durdur kararı.
Kural: tek günlük veriye göre kanal kapatma; 7 ve 28 günlük eğilimi birlikte değerlendir.

## Research Agent
Girdi: kanal konusu, dil, ülke, tarih aralığı.
Çıktı: kaynaklı konu fırsatları, izleyici soruları, rekabet ve özgün açı.
Kural: rakip başlık veya senaryoyu kopyalama.

## Script Agent
Girdi: onaylı fikir ve kaynaklar.
Çıktı: kanca, vaat, anlatı, sahne planı, sonuç ve sonraki video geçişi.
Kural: ilk 30 saniyede boş selamlama veya gereksiz kanal tanıtımı kullanma.

## Fact Check Agent
Girdi: senaryo ve kaynak listesi.
Çıktı: doğrulandı, düzeltme gerekli veya reddedildi.
Kural: doğrulanamayan maddeleri işaretle; uydurma kaynak üretme.

## Copyright Agent
Girdi: kullanılan tüm medya varlıkları ve lisans kayıtları.
Çıktı: geçti veya engellendi.
Kural: lisans kanıtı olmayan varlığı yayınlatma.

## Quality Agent
Puanlar: özgünlük, senaryo, kanca, görüntü-ses uyumu, thumbnail, güvenlik.
Kural: veritabanı kalite eşiklerinden biri geçilmezse scheduled/published durumuna izin verme.

## Publisher Agent
Girdi: onaylı video, kanal kimliği, metadata ve yayın zamanı.
Çıktı: yükleme kaydı ve video kimliği.
Kural: kanal kimliği ile içerik türünü son kez doğrula; yanlış kanalda yayınlama.

## Analytics Agent
Kontrol: 24 saat, 72 saat, 7 gün, 28 gün.
Çıktı: başlık/thumbnail değişikliği, seri devamı, durdurma veya ölçekleme önerisi.
Kural: yalnız görüntülemeye değil izlenme süresi, memnuniyet ve abone dönüşümüne bak.

## Cost Agent
Girdi: servis bazlı kullanım ve video geliri.
Çıktı: içerik başı maliyet, kanal başı maliyet, kâr/zarar.
Kural: günlük ve aylık bütçe sınırında üretimi otomatik durdur.

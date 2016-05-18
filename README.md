## [AUTOTAGS](autotagsv4.ass)
İki etiket arasında sonsuz dönüşüm yapar.

## [BASIC TURNING](basic_turning.lua)
Bazı işaretleri onun karşılığı olan şeye dönüştürürsünüz. Satıra sadece işaretleri yazmak yetmez, o satırı seçmelisiniz de.

| İşaret | Dönüştüğü | Açıklama |
|---|---|---|---|
| ****0*** | {\i0} | Kapalı italik etiketine dönüşüm yapar.
| ****1*** | {\i1} | Açık italik etiketine dönüşüm yapar.
| ****8*** | {\an8} | Satırı yukarı alma etiketine dönüşüm yapar.
| ****n*** | \N | Satır bölme karakteri koyar.
| ****h*** | \h | Boşluk karakteri koyar.
| ****300,200**** | \fad(300,200) | **\fad** etiketine dönüşüm yapar.
| ****t*** | Örnek Bir Cümle. | Her kelimenin baş harfini büyük harfe dönüştürür.
| ****2t*** | Örnek Bir Cümle. | Türkçe bağlaçlar hariç her kelimenin baş harfini büyük yapar.
| ****T*** | Örnek bir cümle. | Her cümlenin baş harfini büyük harfe dönüşüm yapar.
| ****s*** | örnek bir cümle. | Cümlenin her harfini küçük harfe dönüşüm yapar.
| ****S*** | ÖRNEK BİR CÜMLE. |  Cümlenin her harfini büyük harfe dönüşüm yapar.
| ****a*** | â | Küçük a harfini şapkalı küçük a harfine dönüşüm yapar.
| ****A*** | Â | Büyük a harfini şapkalı büyük a harfine dönüşüm yapar.
| ****i*** | î | Küçük i harfini şapkalı küçük i harfine dönüşüm yapar.
| ****İ*** | Î | Büyük i harfini şapkalı büyük i harfine dönüşüm yapar.
| ****x50*** | {\alpha&H80&} | **alpha** etiketine dönüşüm yapar.
| ****xa50*** | {\1a&H80&} | **1a** etiketine dönüşüm yapar.
| ****xb50*** | {\2a&H80&} | **2a** etiketine dönüşüm yapar.
| ****xc50*** | {\3a&H80&} | **3a** etiketine dönüşüm yapar.
| ****xd50*** | {\4a&H80&} | **4a** etiketine dönüşüm yapar.
| ***+*** | This is +a +sample. | Kelimenin başına bu işaretten koyarak **Tureng** sitesinde arama yaparsınız.
| ***%*** | %This is a sample.% | Bu işaretle bir alan seçerek **Google Translate** sitesinde arama yaparsınız.
| ****l*** | - Metin.\N- Metin. | Konulduğu yerden satırı konuşma çizgilerine böler.
| ****2l*** | (ÖS)- Metin.(OAS)\N- Metin. | Bir **ö**nceki **s**atırla **o** **a**nki **s**atırı konuşma çizgileri koyarak birleştirir.
| ****b*** | (\N)Metin.\N Metin. | **\N** karakterlerini silip işaretin olduğu konuma bir tane ekler.

###### Notlar
`*t`, `*2t`, `*s`, `*S` modlarıyla alan seçerek cümlenin sadece o kısmını dönüştürebilirsiniz.

Örnek bir `*t`cümle.`*t`
<br>Örnek bir Cümle.
<br><br>
Örnek bir `*2t`cümle.`*2t`
<br>Örnek bir Cümle.
<br><br>
`*s`Örnek`*s` bir cümle. 
<br>örnek bir cümle.
<br><br>
Örnek bir `*S`cümle.`*S`
<br>ÖRNEK BİR CÜMLE.

**Bu modlardan aynı anda sadece birini kullanın.**

## [COLOR FADE](color_fade_v2.ass)
İki veya daha fazla renk arasında yatay renk geçişi yapar.

## [DELETE COMMENT BRACKET](delete_comment_bracket.lua)
Yorum olarak düşülen notları siler.

## [DELETE LINES](delete_lines.lua)
Stile ya da aktöre göre satır silme işlemi yapar.

## [FIX TIMING](fix_timing.lua)
Ön izlemede görünmeyen satırları düzeltir.
 
## [FIXING TURKISH CHARS](fixing_turkish chars.lua)
Bozuk Türkçe karakterleri düzeltir.

## [KARAOKE CLEANER](karaoke_cleaner.lua)
Özetlersek şablon efeğinin oluşturduğu şeyleri siler. Ayrıntıya girersek de şunları yapıyor:
* Şablonların oluşturduğu satırları siler.
* Şablon efeklerinin olduğu satırların sürelerini sıfırlar.
* Şablonun uygulandığı satırları görünür yapar.
* Şablon uygulandığında oluşan furigana stillerini siler.

## [LINE BREAKER CHECKER](line-breaker-checker.lua)
Karakter sınırını aşan ve satır bölme yapılmamış satırlara **Beni böl!**, karakter sınırı aşan ama satır bölme yapıldığı halde karakter sınırını aşan satırlara da **Beni düzgün böl!** şeklinde `Effect` kutucuğuna not düşer.

## [LINE SOURCE DUPLICATE](line_source_duplicate.lua)
Kaynak metni çoğaltır. Çoğaltarak oluşturduğu girdileri de temizleyebilir.
 
**Oluşturduğu girdilere müdahalede bulunmayınız.**

## [RAINBOW](rainbow_v2.ass)
Gökkuşağı renklerinde renk geçişi yapar.

## [SHAPER(ASS)](shaper.ass)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer. ASS dosyası halinde.

## [SHAPER(LUA)](shaper.lua)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer. Lua dosyası halinde.

## [SUB MENU MAKER](sub_menu_maker.lua)
Lua dosyalarını gruplar.

## [T_CALC](t_calc(v11).ass)
Girilen **frame** değerini alıp `\transform` etiketinin **t1** ve **t2** parametresi için **ms cinsinden** süre oluşturur.

## [TRANS STATE A1](trans_state_a1.lua)
`Effect` kutucuğuna yüzdeler yazar.

## [TYPEWRITTER MAKER](typewritter-maker.lua)
Satıra daktilo tarzı bir efekt uygular.

## [VERTICAL KANJI](vertical_kanji.ass)
Kanjiyi dikey şekilde konumlandırır.


## [AUTOTAGS](autotagsv4.ass)
İki etiket arasında sonsuz dönüşüm yapar.

* **Interval:** İki etiket arasındaki dönüşüm zamanıdır.
* **Accel:** `\transform` etiketinin `accel` parametresidir.
* **Tags1:** İlk etiket. Bu etiketle başlar.
* **Tags2:** İkinci etiket. Bu alandaki etiketin değerine dönüşüm yapar.

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

* **Id:** Fonksiyonu her kullandığınızda buraya farklı bir değer girin. 1-50 arası sayılar alabilir.
* **Colors:** Bu alana renkler girmeniz gerekiyor. Renkler arasına virgül koyun.

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

* **Karakter Sınırı:** Varsayılan değeri 45'tir. Varsayılan değer üzerinden konuşacak olursak 45 ve üstü karakterde devreye girecektir.
* **Stil:** Hangi stile göre işlem yapmasını istediğinizi seçin.

## [LINE SOURCE DUPLICATE](line_source_duplicate.lua)
Kaynak metni çoğaltır. Çoğaltarak oluşturduğu girdileri de temizleyebilir.

* **Stil:** Hangi stile göre işlem yapmasını istediğinizi seçin.
* **Mod** 
1. [M1A] Satır içinde yorum parantezleri
*Metin. {Metin.}*
2. [M1B] Satır içinde sadece yorum parantezleri
*{Metin.}*
3. [M2A] Satırdan sonra satır
*(1. satır) Metin.*
*(2. satır) Metin.*
4. [M2B] Satırdan sonra yorum satırı
*(1. satır) Metin.*
*(Yorum satırı olarak 2. satır) Metin.*
5. [M3A] Stilden sonra satır
*(1. satır) Metin.*
*(Stilin son satırından sonra 2. satır) Metin.*
6. [M3B] Stilden sonra yorum satırı
*(1. satır) Metin.*
*(Stilin son satırından sonra yorum satırı olarak 2. satır) Metin.*

###### Notlar
Oluşturduğu girdilere müdahalede bulunmayınız.

## [RAINBOW](rainbow_v2.ass)
Gökkuşağı renklerinde renk geçişi yapar.

* **Id:** Fonksiyonu her kullandığınızda buraya farklı bir değer girin. 1-20 arası sayılar alabilir.
* **Var1:** Buraya başlangıç değerini girin.
* **Var2:** Buraya bitiş değerini girin.
* **Saturation:** Buraya 0-1 arası ondalıklı değerler girin. 1'den düşük değerler rengin tonunu açar.
* **Contrast:** Buraya 0-1 arası ondalıklı değerler girin. 1'den düşük değerler rengin tonunu koyulaştırır.

## [SHAPER(ASS)](shaper.ass)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer. ASS dosyası halinde.

## [SHAPER(LUA)](shaper.lua)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer. Lua dosyası halinde.

* **Resmin genişliği:** Resmin genişliğini girin.
* **Resmin yüksekliği:** Resmin yüksekliğini girin.
* **Resmin dizini:** İki adet ters slash kullanarak resmin dizinini girin.
* **Çözünürlük şuna göre**
1. ?script
*Alt yazının çözünürlük değerine göre boyutlandırma yapar.*
2. ?video
*Videonun çözünürlük değerine göre boyutlandırma yapar.*

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


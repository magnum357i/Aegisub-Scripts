İÇİNDEKİLER
===========
1. [**TANITIM**](#tanitim)
2. [**MODÜL**](#modÜl)
 * [**Mag**](#mag)
3. [**MAKROLAR**](#makrolar)
 * [**Basic Turning**](#basic-turning)
 * [**Copy Paste Line**](#copy-paste-line)
 * [**K Char**](#k-char)
 * [**Delete Comment Bracket**](#delete-comment-bracket)
 * [**Delete Lines**](#delete-lines)
 * [**Fix Timing**](#fix-timing)
 * [**Fixing Turkish Chars**](#fixing-turkish-chars)
 * [**Karaoke Cleaner**](#karaoke-cleaner)
 * [**Line Breaker Checker**](#line-breaker-checker)
 * [**Line Source Duplicate**](#line-source-duplicate)
 * [**Shaper**](#shaper)
 * [**Strip Line**](#strip-line)
 * [**Sub Menu Maker**](#sub-menu-maker)
 * [**Trans State A1**](#trans-state-a1)
 * [**Typewritter Maker**](#typewritter-maker)
4. [**ASS**](#ass)
 * [**Autotags**](#autotags)
 * [**Rainbow**](#rainbow)
 * [**Shaper**](#shaper-1)
 * [**T_Calc**](#t_calc)
 * [**Vertical Kanji**](#vertical-kanji)

### TANITIM

Bu sayfayı açmamdaki amaç kendi yazdığım lua dosyalarının sürüm takibi ve indirme bağlantısı sunmak. Bu dosyalar sadece Aegisub üzerinde çalışır. Lua isimlerini ve içerdiği kodları(değişkenleri) İngilizce yaparken arayüz ve iletileri Türkçe yapmayı tercih ediyorum.

### MODÜL

### [Mag](Modul/mag.lua)
Devamlı kullandığım fonksiyonları her defasında yazmamayım diye tek bir dosya haline getirdim. Yazdığım lua dosyalarının başında **mag.** ön eki varsa bu modülü kullanıyor demektir. Bu modülü **automation/include/** dizinine atınız.

### MAKROLAR

### [Basic Turning](Macros/mag.sbasic_turning.lua)
Bazı işaretleri onun karşılığı olan şeye dönüştürürsünüz. Satıra sadece işaretleri yazmak yetmez, o satırı seçmelisiniz de.

| İşaret | Dönüştüğü | Açıklama |
|---|---|---|---|
| ****0*** | {\i0} | Kapalı italik etiketine dönüşüm yapar.
| ****1*** | {\i1} | Açık italik etiketine dönüşüm yapar.
| ****8*** | {\an8} | Satırı yukarı alma etiketine dönüşüm yapar.
| ****n*** | \N | Satır bölme karakteri koyar.
| ****h*** | \h | Boşluk karakteri koyar.
| ****f300,200**** | \fad(300,200) | **\fad** etiketine dönüşüm yapar.
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
| ****lp*** | (ÖS)- Metin.(OAS)\N- Metin. | Bir **ö**nceki **s**atırla **o** **a**nki **s**atırı konuşma çizgileri koyarak birleştirir.
| ****ln*** | (SS)- Metin.(OAS)\N- Metin. | Bir **s**onraki **s**atırla **o** **a**nki **s**atırı konuşma çizgileri koyarak birleştirir.
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

### [Copy Paste Line](Macros/mag.copy_paste_line.lua)
Bir satır grubuna ait herhangi bir bilgiyi kopyalar ve bunu başka bir satır grubuna yapıştırabilir.

### [K Char](Macros/mag.k_char.lua)
Metindeki boşluk karakteri hariç her karakterinin başına **{\k}** ekler.

### [Delete Comment Bracket](Macros/delete_comment_bracket.lua)
Yorum olarak düşülen notları siler.

### [Delete Lines](Macros/delete_lines.lua)
Stile ya da aktöre göre satır silme işlemi yapar.

### [Fix Timing](Macros/fix_timing.lua)
Ön izlemede görünmeyen satırları düzeltir.
 
### [Fixing Turkish Chars](Macros/fixing_turkish chars.lua)
Bozuk Türkçe karakterleri düzeltir.

### [Karaoke Cleaner](Macros/karaoke_cleaner.lua)
Özetlersek şablon efeğinin oluşturduğu şeyleri siler. Ayrıntıya girersek de şunları yapıyor:
* Şablonların oluşturduğu satırları siler.
* Şablon efeklerinin olduğu satırların sürelerini sıfırlar.
* Şablonun uygulandığı satırları görünür yapar.
* Şablon uygulandığında oluşan furigana stillerini siler.

### [Line Breaker Checker](Macros/mag.line_breaker_checker.lua)
Karakter sınırını aşan ve satır bölme yapılmamış satırlara **Beni böl!**, karakter sınırı aşan ama satır bölme yapıldığı halde karakter sınırını aşan satırlara da **Beni düzgün böl!** şeklinde `Effect` kutucuğuna not düşer.

* **Karakter Sınırı:** Varsayılan değeri 45'tir. Varsayılan değer üzerinden konuşacak olursak 45 ve üstü karakterde devreye girecektir.
* **Stil:** Hangi stile göre işlem yapmasını istediğinizi seçin. Sadece kullanılan stiller listelenir. Stil isimlerinin başındaki ilk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır.
* **Yorum satırlarını geç:** Yorum satırı yapılmış satırları işleme almaz.

### [Line Source Duplicate](Macros/line_source_duplicate.lua)
Kaynak metni çoğaltır. Çoğaltarak oluşturduğu girdileri de temizleyebilir.

* **Stil:** Hangi stile göre işlem yapmasını istediğinizi seçin.
* **Mod** 
 * **[M1A] Satır içinde yorum parantezleri**<br>
 Metin. {Metin.}
 * **[M1B] Satır içinde sadece yorum parantezleri**<br>
 {Metin.}
 * **[M2A] Satırdan sonra satır**<br>
 (1. satır) Metin.<br>
 (2. satır) Metin.
 * **[M2B] Satırdan sonra yorum satırı**<br>
 (1. satır) Metin.<br>
 (Yorum satırı olarak 2. satır) Metin.
 * **[M3A] Stilden sonra satır**<br>
 (1. satır) Metin.<br>
 (Stilin son satırından sonra 2. satır) Metin.
 * **[M3B] Stilden sonra yorum satırı**<br>
 (1. satır) Metin.*<br>
 (Stilin son satırından sonra yorum satırı olarak 2. satır) Metin.

###### Notlar
Oluşturduğu girdilere müdahalede bulunmayınız.

### [Select Lines](Macros/mag.select_lines.lua)
Birçok ayarda satır seçme işlemi yapar.
* **Geçerli satır:** O an bulunduğunuz, metin kutusunda içeriğini gördüğünüz satırın olduğu noktadan işlem yaparsınız.
  * **Öncesi:** Geçerli satır ve öncesini seçer.
  * **Sonrası:** Geçerli satır ve sonrasını seçer.
  * **Önceki(Stil):** Geçerli satırı ve ondan önceki onunla aynı stile sahip olan satırları seçer.
  * **Sonraki(Stil):** Geçerli satırı ve ondan sonraki onunla aynı stile sahip olan satırları seçer.
* **Stil:** O an bulunduğunuz, metin kutusunda içeriğini gördüğünüz satırın stiline göre işlem yaparsınız.
  * **İlk satır:** Stilin ilk satırına atlarsınız.
  * **Son satır:** Stilin son satırına atlarsınız.
  * **Tüm satırlar:** Stilin tüm satırlarını seçersiniz.
* **Satır:** Satırlara göre işlem yaparsınız.
  * **Satır aralığı:** Girdiğiniz iki farklı sayının olduğu aralığı seçer.
  * **Satır atlama:** Girdiğiniz satır numarasına atlarsınız.
  * **Önceki satır:** O an metin kutusunda içeriğini gördüğünüz satırın üstündeki satıra, yani bir önceki satıra atlar.
  * **Sonraki satır:** O an metin kutusunda içeriğini gördüğünüz satırın altındaki satıra, yani bir sonraki satıra atlar.
* **Seçimin tersi:** Seçiminiz dışında kalan satırları seçersiniz.

### [Shaper](Macros/mag.shaper.lua)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer. Lua dosyası halinde.

* **Resmin dizini ve adı:** Resmin adıyla beraber bulunduğu dizini yazın. Uzantıyı girmenize gerek yok.
* **Çözünürlük şuna göre**<br>
 * **?script**<br>
 Bu seçiliyken alt yazının çözünürlük değerine göre boyutlandırma yapar.
 * **?video**<br>
 Bu seçiliyken videonun çözünürlük değerine göre boyutlandırma yapar.

### [Strip Line](Macros/mag.strip_line)
Satırın metni hariç diğer tüm girdileri temizleyebilir.

### [Sub Menu Maker](Macros/sub_menu_maker.lua)
Lua dosyalarını gruplar.

* **Dosya adı:** `Automation` menüsünde görünen adını değil `automation` dizininde görünen dosya adını giriniz.
* **Dosya türü:** Dosya türünü giriniz.
* **Grup adı:** Grup adını giriniz.
* **Dosya dizini:** Dosyanın dizinini giriniz.
 * **?default**<br>
 Bu giriliyken Aegisub programının yüklü olduğu dizindeki `automation` klasörünü dizin olarak girmiş olursunuz.

### [Trans State A1](Macros/mag.trans_state_a1.lua)
`Effect` kutucuğuna yüzdeler yazar.

* **Stil:** Hangi stile göre işlem yapmasını istediğinizi seçin.
* **Yüzde küsuratını ekle:** Yüzdenin iki basamaklı küsuratını ekler. Seçilmemesi durumunda yüzdeyi küsuratsız ekler.
* **Satır sayılarını ekle:** Toplam satır bölü o anki satır şeklinde bulduğu yüzdeyi ondan önce ekler. Seçilmemesi durumunda sadece yüzdeyi ekler.

### [Typewritter Maker](Macros/typewritter-maker.lua)
Satıra daktilo tarzı bir efekt uygular.

### ASS
### [Autotags](ass/autotagsv4.ass)
İki etiket arasında sonsuz dönüşüm yapar.

* **Interval:** İki etiket arasındaki dönüşüm zamanıdır.
* **Accel:** `\transform` etiketinin `accel` parametresidir.
* **Tags1:** İlk etiket. Bu etiketle başlar.
* **Tags2:** İkinci etiket. Bu alandaki etiketin değerine dönüşüm yapar.

### [Color Fade](ass/color_fade_v2.ass)
İki veya daha fazla renk arasında yatay renk geçişi yapar.

* **Id:** Fonksiyonu her kullandığınızda buraya farklı bir değer girin. 1-50 arası sayılar alabilir.
* **Colors:** Bu alana renkler girmeniz gerekiyor. Renkler arasına virgül koyun.

### [Rainbow](ass/rainbow_v2.ass)
Gökkuşağı renklerinde renk geçişi yapar.

* **Id:** Fonksiyonu her kullandığınızda buraya farklı bir değer girin. 1-20 arası sayılar alabilir.
* **Var1:** Buraya başlangıç değerini girin.
* **Var2:** Buraya bitiş değerini girin.
* **Saturation:** Buraya 0-1 arası ondalıklı değerler girin. 1'den düşük değerler rengin tonunu açar.
* **Contrast:** Buraya 0-1 arası ondalıklı değerler girin. 1'den düşük değerler rengin tonunu koyulaştırır.

### [Shaper](ass/shaper.ass)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer. ASS dosyası halinde.

* **Img_path:** Resmin dizini ile beraber adını girin. Uzantıyı girmenize gerek yok.
* **Width:** Resmin genişliğini girin.
* **Height:** Resmin yüksekliğini girin.
* **Res_type**
 * **script**<br>
 Bu giriliyken alt yazının çözünürlük değerine göre boyutlandırma yapar.
 * **video**<br>
 Bu giriliyken videonun çözünürlük değerine göre boyutlandırma yapar.

### [T_Calc](ass/t_calc(v11).ass)
Girilen frame değerini alıp `\transform` etiketinin `t1` ve `t2` parametresi için ms cinsinden süre oluşturur.

* **Mode:** Fonksiyonu yazdığınız satırın retime modunu girin.
* **Framev:** Bir frame girin. Bu frame değerinden sonra değişiklik olacaktır.
* **Interval:** Girdiğiniz frame değeriyle buraya girdiğiniz ms cinsinden değer arasında geçiş yapar.
* **Tags:** Buraya çift ters slash ile etiketler girin.

### [Vertical Kanji](ass/vertical_kanji.ass)
Kanjiyi dikey şekilde konumlandırır.

* **Id:** Fonksiyonu her kullandığınızda buraya farklı bir değer girin. 1-30 arası sayılar alabilir.
* **Space:** Karakterler arasında ne kadar boşluk olacağına karar verirsiniz.
* **X_mode:** `true` yapılması halinde sağa tarafa konumlandırır.
* **X:** Yandan kaç piksel boşluk bırakılacağına karar verirsiniz.
* **Y:** Buraya bir Aegisub değişkeni olan `$y` değişkenini girin.

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
* **Eylem**
 * **Ekle**
 <br> Bu seçiliyken seçilen moda göre kaynak metni çoğaltır.
 * **Kaldır**
 <br> Bu seçiliyken oluşturulan girdileri siler.

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

* **Img_path:** Resmin dizini ile beraber adını girin. Uzantıyı girmenize gerek yok.
* **Width:** Resmin genişliğini girin.
* **Height:** Resmin yüksekliğini girin.
* **Res_type**
 * **script**<br>
 Bu giriliyken alt yazının çözünürlük değerine göre boyutlandırma yapar.
 * **video**<br>
 Bu giriliyken videonun çözünürlük değerine göre boyutlandırma yapar.


## [SHAPER(LUA)](shaper.lua)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer. Lua dosyası halinde.

* **Resmin genişliği:** Resmin genişliğini girin.
* **Resmin yüksekliği:** Resmin yüksekliğini girin.
* **Resmin dizini:** İki adet ters slash kullanarak resmin adı ile beraber dizinini girin. Uzantıyı girmenize gerek yok.
* **Çözünürlük şuna göre**<br>
 * **?script**<br>
 Bu seçiliyken alt yazının çözünürlük değerine göre boyutlandırma yapar.
 * **?video**<br>
 Bu seçiliyken videonun çözünürlük değerine göre boyutlandırma yapar.

## [SUB MENU MAKER](sub_menu_maker.lua)
Lua dosyalarını gruplar.

* **Dosya adı:** `Automation` menüsünde görünen adını değil `automation` dizininde görünen dosya adını giriniz.
* **Dosya türü:** Dosya türünü giriniz.
* **Grup adı:** Grup adını giriniz.
* **Dosya dizini:** Dosyanın dizinini giriniz.
 * **?default**<br>
 Bu giriliyken `Aegisub` programının yüklü olduğu dizindeki `automation` klasörünü dizin olarak girmiş olursunuz.

## [T_CALC](t_calc(v11).ass)
Girilen **frame** değerini alıp `\transform` etiketinin **t1** ve **t2** parametresi için **ms cinsinden** süre oluşturur.

* **Mode:** Fonksiyonu yazdığınız satırın retime modunu girin.
* **Framev:** Bir frame girin. Bu frame değerinden sonra değişiklik olacaktır.
* **Interval:** Girdiğiniz frame değeriyle buraya girdiğiniz ms cinsinden değer arasında geçiş yapar.
* **Tags:** Buraya çift ters slash ile etiketler girin.

## [TRANS STATE A1](trans_state_a1.lua)
`Effect` kutucuğuna yüzdeler yazar.

* **Stil:** Hangi stile göre işlem yapmasını istediğinizi seçin.
* **Yüzde ondalığı:** Yüzdenin kaç basamaklı olacağını girin. Varsayılan değeri 2'dir. 0-2 arasında değerler girebilirsiniz.
* **Eylem:**<br>
 *  **Seç**
 <br>Bu seçiliyken yüzde ekler.
 *  **Kaldır**
 <br>Bu seçiliyken eklediği yüzdeyi siler.

## [TYPEWRITTER MAKER](typewritter-maker.lua)
Satıra daktilo tarzı bir efekt uygular.

## [VERTICAL KANJI](vertical_kanji.ass)
Kanjiyi dikey şekilde konumlandırır.

* **Id:** Fonksiyonu her kullandığınızda buraya farklı bir değer girin. 1-30 arası sayılar alabilir.
* **Space:** Karakterler arasında ne kadar boşluk olacağına karar verirsiniz.
* **X_mode:** true yapılması halinde sağa tarafa konumlandırır.
* **X:** Soldan kaç piksel boşluk bırakılacağına karar verirsiniz. `X_mode` eğer true ise sağ taraftan boşluk bırakır.
* **Y:** Buraya bir Aegisub değişkeni olan `$y` değişkenini girin.


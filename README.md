İÇİNDEKİLER
===========
- [**(A) TANITIM**](#tanitim)
  - [**(1) Kurulum**](#kurulum)
  - [**(2) Destek Verilen Sürüm**](#destek-verilen-s%C3%BCr%C3%BCm)
  - [**(3) Kısayol Atamak**](#k%C4%B1sayol-atamak)
  - [**(4) Güncelleyici veya İndirici**](#g%C3%BCncelleyici-veya-%C4%B0ndirici)
  - [**(5) Arayüz Tercihleri**](#aray%C3%BCz-tercihleri)
- [**(B) MODÜL**](#modÜl)
  - [**(1) Mag**](#mag)
- [**(C) MAKROLAR**](#makrolar)
  - [**(1) Delete Lines**](#delete-lines)
  - [**(2) Line Source Duplicate**](#line-source-duplicate)
  - [**(3) Basic Turning**](#basic-turning)
  - [**(4) Break Line**](#break-line)
  - [**(5) Copy Dialogue**](#copy-dialogue)
  - [**(6) Copy Paste Line**](#copy-paste-line)
  - [**(7) Grid**](#grid)
  - [**(8) Italic Maker**](#italic-maker)
  - [**(9) K Char**](#k-char)
  - [**(10) List Comments**](#list-comments)
  - [**(11) Manual Hardsub Timer**](#manual-hardsub-timer)
  - [**(12) Select Lines**](#select-lines)
  - [**(13) Shaper**](#shaper)
  - [**(14) Strip Line**](#strip-line)
  - [**(15) Sub Menu Maker**](#sub-menu-maker)
  - [**(16) Text Align**](#text-align)
  - [**(17) Trans State A1**](#trans-state-a1)
  - [**(18) Typewritter Maker**](#typewritter-maker)
- [**(D) ASS**](#ass)
 * [**(1) Autotags**](#autotags)
 * [**(2) Color Fade**](#color-fade)
 * [**(3) Rainbow**](#rainbow)
 * [**(4) Rand Color**](#rand-color)
 * [**(5) Shaper**](#shaper-1)
 * [**(6) T_Calc**](#t_calc)
 * [**(7) Vertical Kanji**](#vertical-kanji)

## TANITIM

Bu sayfayı açmamdaki amaç kendi yazdığım lua dosyalarının sürüm takibi ve indirme bağlantısı sunmak. Bu dosyalar sadece Aegisub üzerinde çalışır. Lua isimlerini ve içerdiği kodları(değişkenleri) İngilizce yaparken arayüz ve iletileri Türkçe yapmayı tercih ediyorum.

#### Kurulum
* **Modül dosyası:** **mag.lua** dosyasını **aegisub/automation/include/** dizinine atın.
* **Lua dosyaları:** Kullanmak istediğiniz lua dosyalarını **aegisub/automation/autoload/** dizinine atın.

#### Destek Verilen Sürüm
Tüm lua dosyalarımı stabil olan en güncel Aegisub sürümü **3.2.2** sürümü üzerinden yazdım. Önceki **3.x.x** sürümlerinde de sorun yaşamayabilirsiniz fakat **2.x.x** sürümlerinde kesin sorunlar yaşayabilirsiniz. Daha güncel bir sürüm çıkarsa ve uyumsuzluk sorunu olursa düzenleyebilirim. Her zaman en güncel stabil sürüme destek vereceğim.

#### Kısayol Atamak
Lua dosyalarını **Automation** alt menüsünden seçmeyip daha hızlı kullanmak için klavyeden bir kısayol atabilirsiniz.
* **View/Options/Interface/Hotkeys** kısmını açın.
* **Defualt** içinde bir kısayol atayın. Aegisub programının hangi bölümünde olursanız olun kısayola bastığınızda lua çalışacaktır.

#### Güncelleyici veya İndirici
Sürekli yeni özellikler veya hata düzeltmeleri ekliyorum. Bunun için bir sürüm güncelleyici yapılabilir fakat bu yerel imkanlarla mümkün değil. Çok fazla yan dosya gerekli. Hatta farklı bir depo açmam bile gerekebilir. İndirmede de aynı sorunlar var. Bu yüzden şimdilik gerek duymuyorum. 

Talep olursa belki yabancıların yazdığı Dependecy Control lua dosyasına ekleyebilirim benimkileri. Şimdilik modül uyumsuzluklarında hata vermesin diye bir lua dosyasına sürüm atlatırken bir yandan da bir kontrolör ekliyorum.

#### Arayüz Tercihleri
Arayüzlü lua dosyalarında yapılan değişiklikler bir sonraki açılışta hatırlanır fakat alt yazı dosyasını kapayıp açınca veya başka bir alt yazı dosyasında lua dosyasını çalıştırdığınızda varsayılan tercihlere döner. Bunun için bir config dosyası oluşturulması gerekmektedir. Şu anlık böyle bir planım olmadığı için tercihleri geçici hafızada tutmaya devam edeceğim.

## MODÜL

### [Mag](automation/included/mag.lua)
Devamlı kullandığım fonksiyonları her defasında yazmamayım diye tek bir dosya haline getirdim. Yazdığım lua dosyalarının başında **mag.** ön eki varsa bu modülü kullanıyor demektir. Modülü kurmamanız durumunda bu lua dosyalarını kullanamazsınız.

## MAKROLAR

### [Delete Lines](automation/autoload/delete_lines.lua)
Stile ya da aktöre göre satır silme işlemi yapar.

### [Line Source Duplicate](automation/autoload/line_source_duplicate.lua)
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

### [Basic Turning](automation/autoload/mag.basic_turning.lua)
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

### [Break Line](automation/autoload/mag.break_line.lua)
* **Böl:** Satır bölme yapılmamış satırları böler.
  * **Karakter sınırı:** Varsayılan değeri 44'tir. Varsayılan değer üzerinden konuşacak olursak 44 ve üstü karakterde devreye girecektir. Bu değer sadece sembolüktür. **\\N** karakterinin koyulması için yapılan hesaplamaya bir etkisi yoktur. **\\N** koyulacak satırları tespit etmeye etkisi vardır. En az **35**, en fazla **50** değeri girilebilir.
  * **Stil:** Hangi stile göre işlem yapmasını istediğinizi seçin. Sadece kullanılan stiller listelenir. Stil isimlerinin başındaki ilk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır.
  * **Yorum satırlarını geç:** Yorum satırı yapılmış satırlara işlem yapmaz.
  * **Konuşma çizgilerinden böl:** Karakter sınırının altında veya üstünde olan ikili veya tekli konuşma satırlarını konuşma çizgisinden böler.
  * **Boşlukları sil:** Karakter sınırı alanından bağımsız olarak satır bölme karakterinin yanındaki boşluk alanı siler.
  * **Dengeli böl:** Üst ve alt satırın en az farka sahip olduğu yerden böler.
  * **İki cümleli satırların ikinci cümlesinden böl:** Karakter sınırına girilen değerin yarısıyle onun altında kalan karakter sayısına sahip iki cümleli satırların ikinci cümlesinden böler.
* **Kontrol et:** Karakter sınırını aşan ve satır bölme yapılmamış satırlara **Beni böl!**, karakter sınırı aşan ama satır bölme yapıldığı halde karakter sınırını aşan satırlara da **Beni düzgün böl!** şeklinde `Effect` kutucuğuna not düşer.
  * **Karakter sınırı:** Varsayılan değeri 44'tir. Varsayılan değer üzerinden konuşacak olursak 44 ve üstü karakterde devreye girecektir.
  * **Stil:** Hangi stile göre işlem yapmasını istediğinizi seçin. Sadece kullanılan stiller listelenir. Stil isimlerinin başındaki ilk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır.
  * **Yorum satırlarını geç:** Yorum satırı yapılmış satırları işleme almaz.
* **Kaldır:** Satır bölme karakterlerini kaldırır. Yanında boşluk varsa direkt silerken yoksa boşlukla yer değiştirir.
  * **Karakter sınırı:** Varsayılan değeri 44'tir. Varsayılan değer üzerinden konuşacak olursak 44 ve üstü karakterde devreye girecektir.
  * **Stil:** Hangi stile göre işlem yapmasını istediğinizi seçin. Sadece kullanılan stiller listelenir. Stil isimlerinin başındaki ilk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır.
  * **Yorum satırlarını geç:** Yorum satırı yapılmış satırları işleme almaz.

###### Notlar
Herhangi bir arayüzde yaptığınız ayar diğer bir arayüzde de bulunuyorsa son girdiğiniz değeri hatırlar.

### [Copy Dialogue](automation/autoload/mag.copy_dialogue.lua)
Alt yazıdaki metinleri panoya veya oluşturduğu metin dosyasına kopyalar.

### [Copy Paste Line](automation/autoload/mag.copy_paste_line.lua)
Bir satır grubuna ait herhangi bir bilgiyi kopyalar ve bunu başka bir satır grubuna yapıştırabilir.

### [Grid](automation/autoload/mag.grid.lua)
Aktif satırın içeriğine ızgara çizimi yapar.
* **Sayı:** Dikey veya yatay ızgara çizgisi adeti.
* **Aralık:** Her ızgara çizgisi arasındaki piksel cinsinden boşluk.
* **Piksel:** Her ızgara çizgisinin kalınlığı.
* **Etiketler:** Varsayılan etiketler. Izgara satırının başına bu etiketleri koyar.
* **Renk:** Izgara çizgilerinin rengi.
* **Biçim**
  * **Tam:** Hem dikey hem de yatay ızgara çizgileri koyar.
  * **Sadece dikey:** Sadece dikey ızgara çizgileri koyar.
  * **Sadece yatay:** Sadece yatay ızgara çizgileri koyar.

### [Italic Maker](automation/autoload/mag.italic_maker.lua)
Seçili satırların başına italik yapma, sonuna italik yapmama etiketi koyar.

### [K Char](automation/autoload/mag.k_char.lua)
Metindeki boşluk karakteri hariç her karakterinin başına **{\k}** ekler.

### [List Comments](automation/autoload/mag.list_comments.lua)
İçinde etiket olmayan yorum parantezlerini listeler ve aralarında geçiş yapılmasını sağlar.

### [Manual Hardsub Timer](automation/autoload/mag.manual_hardsub_timer.lua)
Manuel olarak hardsub videoya zamanlama yapmanızı sağlar. Herhangi bir hardsub satırın önce başladığı ve sonra da bittiği karede lua dosyasını çalıştırın. Geçerli satırın bir altına o karelerin süreye dönüşmüş haliyle yeni bir satır oluşturacaktır.

### [Select Lines](automation/autoload/mag.select_lines.lua)
Birçok ayarda satır seçme işlemi yapar.
* **Geçerli satır:** O an bulunduğunuz, metin kutusunda içeriğini gördüğünüz satırın olduğu noktadan işlem yaparsınız.
  * **Öncesi:** Geçerli satır ve öncesini seçer.
  * **Sonrası:** Geçerli satır ve sonrasını seçer.
  * **Önceki(Stil):** Geçerli satırı ve ondan önceki onunla aynı stile sahip olan satırları seçer.
  * **Sonraki(Stil):** Geçerli satırı ve ondan sonraki onunla aynı stile sahip olan satırları seçer.
  * **Önceki satır:** Geçerli satırın bir öncesindeki satıra atlarsınız.
  * **Sonraki satır:** Geçerli satırın bir sonrasındaki satıra atlarsınız.
* **Stil:** O an bulunduğunuz, metin kutusunda içeriğini gördüğünüz satırın stiline göre işlem yaparsınız.
  * **İlk:** Stilin ilk satırına atlarsınız.
  * **Son:** Stilin son satırına atlarsınız.
  * **Kalıp:** Geçerli satırın sonrasındaki satırların ve ondan öncesindeki satırların stili geçerli satırınkiyle farklı olana kadar seçim yapar.
  * **Tüm:** Stilin tüm satırlarını seçersiniz.
* **Satır:** Satırlara göre işlem yaparsınız.
  * **İlk:** İlk satıra atlarsınız.
  * **Son:** Son satıra atlarsınız.
  * **Aralık:** Girdiğiniz iki farklı sayının olduğu aralığı seçersiniz.
  * **Atlama:** Girdiğiniz satır numarasına atlarsınız.
* **Süre:** Sürelere göre işlem yaparsınız.
  * **Aralık:** Girilen iki farklı sürenin veya kare değerinin olduğu aralığı seçersiniz.
  * **Atlama:** Girdiğiniz süreye ya da kare değerine atlarsınız.
* **Seçim:** Seçime ekleme ya da eksiltme yaparsınız.
  * **Önceki:** Mevcut seçimin ilk satırın bir üstündeki satırı seçersiniz.
  * **Sonraki:** Mevcut seçimin en son satırın bir altındaki satırı seçersiniz.
* **Seçimin tersi:** Seçiminiz dışında kalan satırları seçersiniz.

### [Shaper](automation/autoload/mag.shaper.lua)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer. Lua dosyası halinde.

* **Resmin dizini ve adı:** Resmin adıyla beraber bulunduğu dizini yazın. Uzantıyı girmenize gerek yok.
* **Çözünürlük şuna göre**<br>
 * **?script**<br>
 Bu seçiliyken alt yazının çözünürlük değerine göre boyutlandırma yapar.
 * **?video**<br>
 Bu seçiliyken videonun çözünürlük değerine göre boyutlandırma yapar.

### [Strip Line](automation/autoload/mag.strip_line.lua)

#### NORMAL SEÇENEKLER
* **Satır Özellikleri:** Bu seçeneğin seçilmesi halinde bir aşağısında detaylı olarak sunulan özelliklerin hepsini uygular. Hepsini değil de bazılarını uygulamak için bu satırın başındaki işareti kaldırın ve aşağısındakilerden tercih yapın.
  * **Layer:** Ön izlemede hangi satırın daha üst planda olacağı bilgisini temizler.
  * **Actor:** Satırın aktör bilgisini temizler.
  * **Effect:** Satırın farklı lua dosyaları tarafından efekt kutucuğuna yazılmış bilgiyi temizler.
  * **Left Margin:** Satırın özel olarak girimiş soldan kaç piksel boşluk bırakılacağı bilgisini temizler.
  * **Right Margin:** Satırın özel olarak girimiş sağdan kaç piksel boşluk bırakılacağı bilgisini temizler.
  * **Vertical Margin:** Satırın özel olarak girimiş aşağıdan -bazı durumlarda üstten- kaç piksel boşluk bırakılacağı bilgisini temizler.
  * **Text:** Bu seçeneğin seçilmesi halinde bir aşağısında detaylı olarak sunulan özelliklerin hepsini uygular. Hepsini değil de bazılarını uygulamak için bu satırın başındaki işareti kaldırın ve aşağısındakilerden tercih yapın.
    * **Etiketler:** Satırdaki etiketleri temizler.
    * **Özel karakterler:** Satırdaki \N, \h veya \n gibi karakterlerini temizler. Bu karakterlerin etrafında boşluk varsa direkt temizlerken boşluk yoksa boşlukla yer değiştirir.
    * **Yorum parantezleri:** Satırdaki etiket içermeyen yorum parantezlerini temizler.
    * **Tekrar eden boşluklar:** İki veya daha fazla kendini tekrar eden boşlukları tek boşluğa indirir.
    * **Baştaki ve sondaki boşluklar:** Satırın başındaki ve sonundaki boşlukları temizler.

#### GELİŞMİŞ SEÇENEKLER
* **Ekstra Ayarlar:** Bu seçeneğin seçilmesi halinde bir aşağısında detaylı olarak sunulan özelliklerin hepsini uygular. Hepsini değil de bazılarını uygulamak için bu satırın başındaki işareti kaldırın ve aşağısındakilerden tercih yapın.
  * **Boş satırlarını temizle:** Metni olmayan satırları temizler.
  * **Yorum satırlarını temizle:** Yorum yapılmış satırları temizler.
  * **Sıralı satırları temizle:** Aynı metne sahip satırların en sondaki satırındaki bitiş süresini ilk baştaki satırın bitiş süresine taşır ve ilk baştaki hariç diğer tüm tekrar satırları temizler.
  * **Satır bölme boşluklarını temizle:** Satır bölme karakterinin sağ ve sol tarafındaki boşlukları temizler.
  * **Türkçe karakterleri düzelt:** Bozuk Türkçe karakterleri düzeltir.
  * **Satırları kare sürelerine göre zamanla:** Satırları kare sürelerine göre zamanlayarak ön izlemede görünmeyen satırlar görünür hale gelir.
* **Karaoke:** Bu seçeneğin seçilmesi halinde bir aşağısında detaylı olarak sunulan özelliklerin hepsini uygular. Hepsini değil de bazılarını uygulamak için bu satırın başındaki işareti kaldırın ve aşağısındakilerden tercih yapın.
  * **Oluşturulan karaoke satırlarını temizle:** Karaoke şablonları tarafından oluşturulan satırları temizler. Daha da açarsak `Effect` kutucuğunda **fx** kelimesi geçen satırları temizler.
  * **Furigana stilleri temizle:** Karaoke şablonlarını uyguladıktan sonra oluşan **furigana** stillerini temizler.
  * **Karaoke satırlarını sıfırla:** Karaoke satırlarını şablon efektleri uygulanmadan önceki haline getirir.
  * **Şablon satırlarının sürelerini sıfırla:** Şablon satırlarının sürelerini sıfırlar. Daha da açarsak `Effect` kutucuğunda **template** ya da **code** kelimeleri geçen satırların sürelerini sıfırlar.

### [Sub Menu Maker](automation/autoload/mag.sub_menu_maker_r1.lua)
Automation menüsünde listelenen lua isimlerini gruplar. Bu gruplamayı girdiğiniz dosya adına göre yapıyor.

#### İLK PENCERE
* **Dosya adı:** `Automation` menüsünde görünen adını değil `automation` dizininde görünen dosya adını giriniz. Dosya adları arasına virgül koyarak çoklu işlem yapabilirsiniz.
* *Grup adı:** Buraya girdiğiniz metin bir sonraki pencerede çıkacak grup adı kısmına değer gönderir.
* **Dosya dizini:** Lua dosyanız Aegisub programının kurulu olduğu `automation` dizininde ise **Automation**, Aegisub programının ayarlarının saklandığı `automation` dizininde ise **AppData Automation** seçeneğini seçiniz.
* **Dosya dizini:** Dosyanın dizinini giriniz.
* **Lua yoksa moon uzantısı ara:** Bu ayarın seçilmesi durumunda önce dosya adı girilen dosyanın lua, ondan sonra moon uzantılı olanını arar. Seçilmemesi durumunda bu işlemin tam tersini yapar. 
* **Önceki grupları ekleme:** Bu ayarın seçilmesi durumunda daha önce eklenen grupları ikinci pencereye eklemez.

#### İKİNCİ PENCERE
* **Grup:** Lua isminin olmasını istediğiniz grup. Boş bırakırsanız mevcut grubu siler.
* **Ad:** Seçilen dosyanın programda görünen yani **Automation Manager** penceresinde görünen ismi.
* **Dosya adı:** Seçilen dosyanın adı.


### [Text Align](automation/autoload/mag.text_align.lua)
Karaktere göre metni böler.
* **Satır aralığı:** Satırlar arasında kaç piksel boşluk olacağına karar verirsiniz.
* **Karakter sınırı:** Bir satırda kaç karakter olacağına karar verirsiniz.
* **Hizalama:** Hangi tarafa hizalanacağına karar verirsiniz.
* **Arayüzdeki tercihleri hatırla:** Arayüzdeki tercihleri geçici hafızasında tutar.

### [Trans State A1](automation/autoload/mag.trans_state_a1.lua)
`Effect` kutucuğuna yüzdeler yazar.

#### HESAPLA
* **Yorum satırlarını geç:** Yorum satırı yapılmış satırlara işlem yapmaz.
* **Boş satırları geç:** Etiketler, özel karakterler(\N, \n, \h) ve boşluklar kaldırıldığında geride hiçbir içerik kalmayan satırları hesaplamaya dahil etmez.
* **Küsurat: n.n%:** Yüzdenin küsuratını ekler.
* **Satır sayıları: n / n:** Hangi satır sayısını hangi toplam satır sayısına böldüğünü yazar.

#### HESAPLA
`Effect` kutucuğunda yüzde(%) ile biten sayılar varsa o kutuyu temizler.

---

* **Uygulanan satırlar:** Tüm stillere veya ayrı ayrı stillere uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansıamaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştır.

### [Typewritter Maker](automation/autoload/mag.typewritter.lua)
Satıra daktilo tarzı bir efekt uygular.

## ASS
### [Autotags](ass/autotagsv4.ass)
İki etiket arasında sonsuz dönüşüm yapar.

* **Interval:** İki etiket arasındaki dönüşüm zamanıdır.
* **Accel:** `\transform` etiketinin `accel` parametresidir.
* **Tags1:** İlk etiket. Bu etiketle başlar.
* **Tags2:** İkinci etiket. Bu alandaki etiketin değerine dönüşüm yapar.

### [Color Fade](ass/color_fade_v3.ass)
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

### [Rand Color](ass/randcolor.ass)
Girilen renkleri ya sırasıyla ya da rastgele bir biçimde döndürür.

* **Id:** Fonksiyonu her kullandığınızda buraya farklı bir değer girin. 1-50 arası sayılar alabilir.
* **Rank:** Girilen renkleri iki şekilde döndürür. `true` girilmesi halinde sırasıyla, `false` girilmesi halinde rastgele bir biçimde renk döndürür.
* **Colors:** Bu alana renkler girmeniz gerekiyor. Renkler arasına virgül koyun.

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
İÇİNDEKİLER
===========
- [**(A) TANITIM**](#tanitim)
  - [**(1) Lua dosyası nedir?**](#lua-dosyas%C4%B1-nedir)
  - [**(2) Kurulum**](#kurulum)
  - [**(3) Kullanım**](#kullan%C4%B1m)
  - [**(4) Destek Verilen Sürüm**](#destek-verilen-s%C3%BCr%C3%BCm)
  - [**(5) Karakter Desteği**](#karakter-deste%C4%9Fi)
  - [**(6) Kısayol Atamak**](#k%C4%B1sayol-atamak)
  - [**(7) Güncelleyici veya İndirici**](#g%C3%BCncelleyici-veya-%C4%B0ndirici)
  - [**(8) Arayüz Tercihleri**](#aray%C3%BCz-tercihleri)
- [**(B) MODÜL**](#modÜl)
  - [**(1) Mag**](#mag)
- [**(C) MAKROLAR**](#makrolar)
  - [**(1) Delete Lines**](#delete-lines)
  - [**(2) Line Source Duplicate**](#line-source-duplicate)
  - [**(3) Basic Turning**](#basic-turning)
  - [**(4) Break Line**](#break-line)
  - [**(5) Case Conversion**](#case-conversion)
  - [**(6) Checker**](#checker)
  - [**(7) Copy Dialogue**](#copy-dialogue)
  - [**(8) Copy Paste Line**](#copy-paste-line)
  - [**(9) Finder**](#finder)
  - [**(10) Grid**](#grid)
  - [**(11) K Char**](#k-char)
  - [**(12) Line Format**](#line-format)
  - [**(13) Select Lines**](#select-lines)
  - [**(14) Shaper**](#shaper)
  - [**(15) Strip Line**](#strip-line)
  - [**(16) Sub Menu Maker**](#sub-menu-maker)
  - [**(17) Text Align**](#text-align)
  - [**(18) Timer**](#timer)
  - [**(19) Trans State A1**](#trans-state-a1)
  - [**(20) Typewritter**](#typewritter)
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

#### Lua Dosyası Nedir?
Lua dosyası veya eklentisi **Aegisub** programına yeni özellikler katmak için kullanılır. Bu yeni özellikler ile yapılacak iş mümkün kıldırabilir veya zamandan tasarruf ettirebilir.

#### Kurulum
* **Modül dosyası:** **mag.lua** dosyasını **aegisub/automation/include/** dizinine atın. Program kapalıysa açarak, değilse **Automation/Automation.../Rescan Autoload Dir** butonuna basarak lua dosyasını aktifleştirebilirsiniz.
* **Lua dosyaları:** Kullanmak istediğiniz lua dosyalarını **aegisub/automation/autoload/** dizinine atın. Program kapalıysa açarak, değilse **Automation/Automation.../Rescan Autoload Dir** butonuna basarak lua dosyasını aktifleştirebilirsiniz.

#### Kullanım
Kullanmak istediğiniz lua dosyasını doğru yere attıysanız **Automation** alt menüsüne ismi gelmelidir. O isme tıklayarak ilgili luayı kullanabilirsiniz. Kullanım amacına göre bazı lua dosyaları size bir arayüz sunarken bazıları da sunmaz.

#### Destek Verilen Sürüm
Tüm lua dosyalarımı stabil olan en güncel Aegisub sürümü **3.2.2** sürümü üzerinden yazdım. Önceki **3.x.x** sürümlerinde de sorun yaşamayabilirsiniz fakat **2.x.x** sürümlerinde kesin sorunlar yaşayabilirsiniz. Daha güncel bir sürüm çıkarsa ve uyumsuzluk sorunu olursa düzenleyebilirim. Her zaman en güncel stabil sürüme destek vereceğim.

#### Karakter Desteği
A'dan Z'ye tüm Türkçe karakterlere destek verilmektedir. Buna ek olarak şunlara da destek verilir:

Sesli harflerin uzun söylenişi: Â, Ê, Î, Ô, Û.

Yarı sesli harflerin söylenişi: Ă, Ĕ, Ĭ, Ŏ, Ŭ.

#### Kısayol Atamak
Lua dosyalarını **Automation** alt menüsünden seçmeyip daha hızlı kullanmak için klavyeden bir kısayol atabilirsiniz.
* **View/Options/Interface/Hotkeys** kısmını açın.
* **Defualt** içinde bir kısayol atayın. Aegisub programının hangi bölümünde olursanız olun kısayola bastığınızda lua çalışacaktır.

#### Güncelleyici veya İndirici
Kullanılan durumlarda çıkan hata veya eksikliklerden sürekli sürüm atlatıyorum. Eksiklikleri ekleyeceğim bir lua olmadığında ve o işi yapan başka bir lua dosyası yoksa yeni bir lua dosyası yazıyorum. İndirilen lua dosyaları için sürüm güncelleyici veya yeni lua dosyaları için bir indirici yapılabilir fakat bu yerel imkanlarla mümkün değil. Çok fazla yan dosya gerekli. Hatta farklı bir depo açmam bile gerekebilir. Bu yüzden şimdilik gerek duymuyorum.

#### Arayüz Tercihleri
Arayüzlü lua dosyalarında yapılan değişiklikler alt yazı dosyasını kapatmadığınız sürece bir sonraki açılışta hatırlanır fakat alt yazı dosyasını kapayıp açınca veya başka bir alt yazı dosyasında lua dosyasını çalıştırdığınızda varsayılan tercihlere döner. Bunun için bir config dosyası oluşturulması gerekmektedir. Şu anlık böyle bir planım olmadığı için tercihleri geçici hafızada tutmaya devam edeceğim.

## MODÜL

### [Mag](automation/include/mag.lua)
Devamlı kullandığım fonksiyonları her defasında yazmamak için tek bir dosya haline getirdim. Yazdığım lua dosyalarının başında **mag.** ön eki varsa bu modülü kullanıyor demektir. Modülü kurmamanız durumunda bu lua dosyalarını kullanamazsınız.

## MAKROLAR

### [Delete Lines](automation/autoload/delete_lines.lua)
Stile ya da aktöre göre satır silme işlemi yapar.

---

* **Uygulanan satırlar:** Tek tek stillere veya aktörlere uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Modül:** Bu dosya modül kullanmıyor.

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

---

* **Uygulanan satırlar:** Tüm stillere veya ayrı ayrı stillere uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Bu dosya modül kullanmıyor.

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

---

* **Uygulanan satırlar:** Seçili satırlara uygular.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

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

---

* **Uygulanan satırlar:** Tüm stillere veya ayrı ayrı stillere uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Case Conversion](automation/autoload/mag.case_conversion.lua)
Harflerle ilgili işlemler yapar.

* **C/B**: 'C'ümlelerin tüm harflerini 'B'üyük yapar.
* **C/K**: 'C'ümlelerin tüm harflerini 'K'üçük yapar.
* **C/İ**": 'C'ümlelerin ilk harflerini 'B'üyük yapar.
* **K/İ**: 'K'elimelerin 'İ'lk harflerini büyük yapar.
* **K/İT**: 'K'elimelerin 'İ'lk harflerini büyük yapar. ('T'ürkçedeki bağlaçlara duyarlı.)

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Checker](automation/autoload/mag.checker.lua)
Alt yazıdaki satırların teknik sorunlarını kontrol edip Effect kutucuğuna simgesel bir not düşer.

* **[Z]aman**
  * **(1 = zaman alanındaki ilk iki seçenek)[1 - nn:nn:nn.nn-]:** **Şundan az** alanı seçiliyse uygulanan satırın süresi **Şundan az** alanına girilen süreden az ise farkı hesaplayarak yazar.
  * **(1 = zaman alanındaki ilk iki seçenek)[1 - nn:nn:nn.nn+]:** **Şundan fazla** alanı seçiliyse uygulanan satırın süresi **Şundan fazla** alanına girilen süreden fazla ise farkı hesaplayarak yazar.
  * **(2 = zaman alanındaki üçüncü seçenek)[2 - nn:nn:nn.nn+]:** **Sonraki satır şundan az** alanı seçiliyse uygulanan satırın bitiş zamanı ile sonraki satırın başlangıç zamanı arasındaki fark **Sonraki satır şundan az** alanına girilen süreden az ise farkı hesaplayarak yazar.
* **[K]arakter**
  * **[n] **Sınır:** alanı seçiliyse uygulanan satırın karakter sayısı bu alana girilen sayıdan fazla ise karakter sayısını yazar.
  * **(N = satır bölme)[nN]:** **Satır bölme arası** alanı seçiliyse uygulanan satırın satır bölündükten sonra oluşan en büyük karakter sayısını hesaplayıp bu alana girilen sayıdan fazla ise hesapladığı karakter sayısını yazar.
* **[B]oşluk**
  * **[n>n+]:** *Birden fazla boşluk* alanı seçiliyse uygulanan satırda yanyana birden fazla boşluk varsa baştan başlayarak sayarak kaçıncı boşluk alanında kaç adet boşluk olduğunu yazar.
  * **(S = satır)[ S ], [ S], [S ]:** **Satırdan önce ve sonra** alanı seçiliyse uygulanan satırdaki satırın öncesinde veya sonrasında boşluk varsa onu yazar.
  * **[ \N ], [ \N], [\N ]:** **Satır bölmeden önce ve sonra** alanı seçiliyse uygulanan satırdaki satır bölme karakterinin öncesinde ve sonrasında boşluk varsa onu yazar.
  * **[ .], [ ,], [ !], [ ?], [ :], [ ;], [ ' ], [ '], [' ], [" ], [ "], [... ], [ ...]:** **Noktalama işaretlerinden önce ve sonra** alanı seçiliyse uygulanan satırdaki noktalama işaretlerinin öncesinde ve sonrasında boşluk varsa onu yazar.

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Copy Dialogue](automation/autoload/mag.copy_dialogue.lua)
Alt yazıdaki metinleri panoya veya oluşturduğu metin dosyasına kopyalar.

* **Normal:** 82. satırdaki örnek bir cümle.
* **Zamanları ekle:** [0:06:15.25(8997) / 0:06:16.66(9031)] Ne yapsam acaba?
* **Satır numarası ekle:** [82 - 0:06:15.25(8997) / 0:06:16.66(9031)] 82. satırdaki örnek bir cümle.
* **Satırları say:** [1 / 82 - 0:06:15.25(8997) / 0:06:16.66(9031)] 82. satırdaki örnek bir cümle.

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Finder](automation/autoload/mag.finder.lua)
Yorum parantezlerine veya girilen kelimeye göre listeleme yapar. Listeledikleri arasında geçiş de yapabilir.

####AÇ/YORUM PARATEZLERİ
İçinde etiket bulunmayan yorum parantezlerini listeler.

####AÇ/KELİMELER
Girilen kelimenin olduğu satırları listeler.

* **Yorum satırlarını geç:** Yorum satırı yapılmış satırları geçer.
* **Büyük-küçük kelimeleri ara:** Aranan kelimede küçük-büyük harf ayrımına dikkat etmez.
* **Regex komutlarını aktif et:** Regex komutlarını aktif eder.
* **Yorum parantezlerini arama:** Yorum parantezlerini aramaz.

---

* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Copy Paste Line](automation/autoload/mag.copy_paste_line.lua)
Bir satır grubuna ait herhangi bir bilgiyi kopyalar ve bunu başka bir satır grubuna yapıştırabilir.

---

* **Uygulanan satırlar:** Seçili satırlara uygular.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

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

---

* **Uygulanan satırlar:** Aktif satırın içeriğini değiştirir. Aktif satır, metin düzenleme kutusunda gördüğünüz satırdır.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [K Char](automation/autoload/mag.k_char.lua)
Metindeki boşluk karakteri hariç her karakterinin başına **{\k}** ekler.

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Line Format](automation/autoload/mag.line_format.lua)
* **Eğik:** Satıra eğik yapma etiketi ekler.
* **Hizalama**
  * **1:** Konum değiştirme etiketi yoksa satırı, varsa odak noktasını alt-sol köşeye sabitler.
  * **2:** Konum değiştirme etiketi yoksa satırı, varsa odak noktasını alt-orta köşeye sabitler.
  * **3:** Konum değiştirme etiketi yoksa satırı, varsa odak noktasını alt-sağ köşeye sabitler.
  * **4:** Konum değiştirme etiketi yoksa satırı, varsa odak noktasını orta-sol köşeye sabitler.
  * **5:** Konum değiştirme etiketi yoksa satırı, varsa odak noktasını orta-orta köşeye sabitler.
  * **6:** Konum değiştirme etiketi yoksa satırı, varsa odak noktasını orta-sağ köşeye sabitler.
  * **7:** Konum değiştirme etiketi yoksa satırı, varsa odak noktasını üst-sol köşeye sabitler.
  * **8:** Konum değiştirme etiketi yoksa satırı, varsa odak noktasını üst-orta köşeye sabitler.
  * **9:** Konum değiştirme etiketi yoksa satırı, varsa odak noktasını üst-sağ köşeye sabitler.
* **Şeffaflık geçişi:**
  * **Basit:** Satıra şeffaflık geçişi etiketi ekler.
  * **Ayrıntılı:** Satıra ayrıntılı şeffaflık geçişi etiketi ekler.
  * **Ayarlar:** Basit veya ayrıntılı şeffaflık geçişi için varsayılan değerleri değiştirmenizi sağlar.

---

* **Uygulanan satırlar:** Seçili satırlara uygular.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

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

---

* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Shaper](automation/autoload/mag.shaper.lua)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer.

###### Notlar
Harici bir modül gerektirir. Sizi yönlendirdiği sayfadan ImageSıze lua dosyasını ve ImageSize klasörünü **automation/include/** dizinine atarak kurabilirsiniz.

---

* **Uygulanan satırlar:** Aktif satırın içeriğini değiştirir. Aktif satır, metin düzenleme kutusunda gördüğünüz satırdır.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Strip Line](automation/autoload/mag.strip_line.lua)

#### AÇ/NORMAL SEÇENEKLER
* **Satır Özellikleri:** Bu seçeneğin seçilmesi halinde bir aşağısında detaylı olarak sunulan özelliklerin hepsini uygular. Hepsini değil de bazılarını uygulamak için bu satırın başındaki işareti kaldırın ve aşağısındakilerden tercih yapın.
  * **Layer:** Ön izlemede hangi satırın daha üst planda olacağı bilgisini temizler.
  * **Actor:** Satırın aktör bilgisini temizler.
  * **Effect:** Satırın farklı lua dosyaları tarafından efekt kutucuğuna yazılmış bilgiyi temizler.
  * **Left Margin:** Satırın özel olarak girilmiş soldan kaç piksel boşluk bırakılacağı bilgisini temizler.
  * **Right Margin:** Satırın özel olarak girilmiş sağdan kaç piksel boşluk bırakılacağı bilgisini temizler.
  * **Vertical Margin:** Satırın özel olarak girilmiş aşağıdan -bazı durumlarda üstten- kaç piksel boşluk bırakılacağı bilgisini temizler.
  * **Text:** Bu seçeneğin seçilmesi halinde bir aşağısında detaylı olarak sunulan özelliklerin hepsini uygular. Hepsini değil de bazılarını uygulamak için bu satırın başındaki işareti kaldırın ve aşağısındakilerden tercih yapın.
    * **Etiketler:** Satırdaki etiketleri temizler.
    * **Özel karakterler:** Satırdaki \N, \h veya \n gibi karakterlerini temizler. Bu karakterlerin etrafında boşluk varsa direkt temizlerken boşluk yoksa boşlukla yer değiştirir.
    * **Yorum parantezleri:** Satırdaki etiket içermeyen yorum parantezlerini temizler.
    * **Tekrar eden boşluklar:** İki veya daha fazla kendini tekrar eden boşlukları tek boşluğa indirir.
    * **Baştaki ve sondaki boşluklar:** Satırın başındaki ve sonundaki boşlukları temizler.

#### AÇ/GELİŞMİŞ SEÇENEKLER
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

#### SON TERCİHLER
Arayüz kısmında yaptığınız son tercihleri seçilen satırlara uygular.

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

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

---

* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Text Align](automation/autoload/mag.text_align.lua)
Karaktere göre metni böler.
* **Satır aralığı:** Satırlar arasında kaç piksel boşluk olacağına karar verirsiniz.
* **Karakter sınırı:** Bir satırda kaç karakter olacağına karar verirsiniz.
* **Hizalama:** Hangi tarafa hizalanacağına karar verirsiniz.
* **Arayüzdeki tercihleri hatırla:** Arayüzdeki tercihleri geçici hafızasında tutar.

---

* **Uygulanan satırlar:** Seçili satırlara uygular.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Timer](automation/autoload/mag.timer.lua)
* **Hardsub:** Dahili/gömülü alt yazının başında ve sonunda Hardsub modunun çalıştırılması sonucu yeni bir satır oluşturur.
* **Karaoke:** Aktif satırın bitiş süresini başlangıç süresi alarak 30 saniyelik yeni bir satır oluşturur.

---

* **Uygulanan satırlar:** Aktif satıra göre işlem yapar. Aktif satır, metin düzenleme kutusunda gördüğünüz satırdır.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Trans State A1](automation/autoload/mag.trans_state_a1.lua)
`Effect` kutucuğuna yüzdeler yazar.

#### HESAPLA
* **Yorum satırlarını geç:** Yorum satırı yapılmış satırlara işlem yapmaz.
* **Boş satırları geç:** Etiketler, özel karakterler(\N, \n, \h) ve boşluklar kaldırıldığında geride hiçbir içerik kalmayan satırları hesaplamaya dahil etmez.
* **Küsurat: n.n%:** Yüzdenin küsuratını ekler.
* **Satır sayıları: n / n:** Hangi satır sayısını hangi toplam satır sayısına böldüğünü yazar.

#### KALDIR
`Effect` kutucuğunda yüzde(%) ile biten sayılar varsa o kutuyu temizler.

---

* **Uygulanan satırlar:** Tüm stillere veya ayrı ayrı stillere uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Typewritter](automation/autoload/mag.typewritter.lua)
Satıra daktilo tarzı bir efekt uygular.

---

* **Uygulanan satırlar:** Seçili satırlara uygular.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

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
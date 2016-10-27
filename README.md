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
  - [**(2) Basic Turning**](#basic-turning)
  - [**(3) Break Line**](#break-line)
  - [**(4) Case Conversion**](#case-conversion)
  - [**(5) Checker**](#checker)
  - [**(6) Copy Dialogue**](#copy-dialogue)
  - [**(7) Finder**](#finder)
  - [**(8) K Char**](#k-char)
  - [**(9) Line Format**](#line-format)
  - [**(10) Line Source Duplicate**](#line-source-duplicate)
  - [**(11) Select Lines**](#select-lines)
  - [**(12) Shaper**](#shaper)
  - [**(13) Strip Line**](#strip-line)
  - [**(14) Sub Menu Maker**](#sub-menu-maker)
  - [**(15) Text Align**](#text-align)
  - [**(16) Timer**](#timer)
  - [**(17) Trans State A1**](#trans-state-a1)
  - [**(18) Typewritter**](#typewritter)
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
A'dan Z'ye tüm Türkçe karakterlere, sesli harflerin uzun söylenişlerine(Â, Ê, Î, Ô, Û), yarı sesli harflerin söylenişlerine(Ă, Ĕ, Ĭ, Ŏ, Ŭ) destek verilir.

#### Kısayol Atamak
Lua dosyalarını **Automation** alt menüsünden seçmeyip daha hızlı kullanmak için klavyeden bir kısayol atabilirsiniz.
* **View/Options/Interface/Hotkeys** kısmını açın.
* **Defualt** içinde bir kısayol atayın. Aegisub programının hangi bölümünde olursanız olun kısayola bastığınızda lua çalışacaktır.

#### Güncelleyici veya İndirici
Kullanılan durumlarda çıkan hata veya eksikliklerden sürekli sürüm atlatıyorum. Eksiklikleri ekleyeceğim bir lua olmadığında ve o işi yapan başka bir lua dosyası yoksa yeni bir lua dosyası yazıyorum. İndirilen lua dosyaları için sürüm güncelleyici veya yeni lua dosyaları için bir indirici yapılabilir fakat bu yerel imkanlarla mümkün değil. Çok fazla yan dosya gerekli. Hatta farklı bir depo açmam bile gerekebilir. Bu yüzden şimdilik gerek duymuyorum.

#### Arayüz Tercihleri
~~Arayüzlü lua dosyalarında yapılan değişiklikler alt yazı dosyasını kapatmadığınız sürece bir sonraki açılışta hatırlanır fakat alt yazı dosyasını kapayıp açınca veya başka bir alt yazı dosyasında lua dosyasını çalıştırdığınızda varsayılan tercihlere döner. Bunun için bir config dosyası oluşturulması gerekmektedir. Şu anlık böyle bir planım olmadığı için tercihleri geçici hafızada tutmaya devam edeceğim.~~

**Yeni özellik:**
Tercihler, arayüz kapatıldığında harici bir dosyaya kaydedilir. Bu dosya **%appdata%/aegisub/** dizininde oluşturulmaktadır. Taşınabilir Aegisub sürümlerinde aegisub.exe dosyasının olduğu yerdedir.

Bu yapı ile tercihleriniz her koşulda hatırlanır.

## MODÜL

### [Mag](automation/include/mag.lua)
Devamlı kullandığım fonksiyonları her defasında yazmamak için tek bir dosya haline getirdim. Yazdığım lua dosyalarının başında **mag.** ön eki varsa bu modülü kullanıyor demektir. Modülü kurmamanız durumunda bu lua dosyalarını kullanamazsınız.

## MAKROLAR

### [Delete Lines](automation/autoload/delete_lines.lua)
Stile ya da aktöre göre satır silme işlemi yapar.

---

* **Uygulanan satırlar:** Tek tek stillere veya aktörlere uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Modül:** Bu dosya modül kullanmıyor.

### [Basic Turning](automation/autoload/mag.basic_turning.lua)
Bazı işaretleri onun karşılığı olan şeye dönüştürürsünüz. Satıra sadece işaretleri yazmak yetmez, o satırı seçmelisiniz de.

---

* **Uygulanan satırlar:** Seçili satırlara uygular.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Break Line](automation/autoload/mag.break_line.lua)
Satır bölme karakteri ekler.

---

* **Uygulanan satırlar:** Tüm stillere veya ayrı ayrı stillere uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Case Conversion](automation/autoload/mag.case_conversion.lua)
Harflerle ilgili büyük-küçük işlemleri yapar.

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Tüm tercihler ayrı bir yerde oluşturulan bir dosyaya yazılır. Arayüz kapatıldığında son değişiklikler bu dosyaya aktarılır.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Checker](automation/autoload/mag.checker.lua)
Alt yazıdaki satırların teknik sorunlarını kontrol edip Effect kutucuğuna simgesel bir not düşer.

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Tüm tercihler ayrı bir yerde oluşturulan bir dosyaya yazılır. Arayüz kapatıldığında son değişiklikler bu dosyaya aktarılır.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Copy Dialogue](automation/autoload/mag.copy_dialogue.lua)
Alt yazıdaki metinleri panoya veya oluşturduğu metin dosyasına kopyalar.

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Tüm tercihler ayrı bir yerde oluşturulan bir dosyaya yazılır. Arayüz kapatıldığında son değişiklikler bu dosyaya aktarılır.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Finder](automation/autoload/mag.finder.lua)
Yorum parantezlerine veya girilen kelimeye göre listeleme yapar. Listeledikleri arasında geçiş de yapabilir.

---

* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [K Char](automation/autoload/mag.k_char.lua)
Metindeki boşluk karakteri hariç her karakterinin başına **{\k}** ekler.

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Line Format](automation/autoload/mag.line_format.lua)
Satıra eğiklik, üste alma ve geçiş etiketi ekler.

---

* **Uygulanan satırlar:** Seçili satırlara uygular.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Line Source Duplicate](automation/autoload/mag.line_source_duplicate.lua)
Kaynak metni çoğaltarak kaynak metinle beraber çeviri imkanı sunar.

---

* **Uygulanan satırlar:** Tüm stillere veya ayrı ayrı stillere uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Tüm tercihler ayrı bir yerde oluşturulan bir dosyaya yazılır. Arayüz kapatıldığında son değişiklikler bu dosyaya aktarılır.
* **Modül:** Bu dosya modül kullanmıyor.

### [Select Lines](automation/autoload/mag.select_lines.lua)
Birçok ayarda satır seçme işlemi yapar.

---

* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Shaper](automation/autoload/mag.shaper.lua)
Resim, şerit ve ızgara ekler. Bir VSFilterMOD etiketini kullanarak resim ekler.

###### Notlar
Resmin çözünürlüğünü algılamak için harici bir modüle ihtiyaç duyar. Sizi yönlendirdiği sayfadan ImageSıze lua dosyasını ve ImageSize klasörünü **automation/include/** dizinine atarak kurabilirsiniz.

---

* **Uygulanan satırlar:** Aktif satırın içeriğini değiştirir. Aktif satır, metin düzenleme kutusunda gördüğünüz satırdır.
* **Arayüz hafızası:** Tüm tercihler ayrı bir yerde oluşturulan bir dosyaya yazılır. Arayüz kapatıldığında son değişiklikler bu dosyaya aktarılır.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Strip Line](automation/autoload/mag.strip_line.lua)
Satırdaki etiketleri, fazladan boşlukları ve bunlara benzer şeyleri temizler.

---

* **Uygulanan satırlar:** Tüm stillere, ayrı ayrı stillere veya seçili satırlara uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Tüm tercihler ayrı bir yerde oluşturulan bir dosyaya yazılır. Arayüz kapatıldığında son değişiklikler bu dosyaya aktarılır.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Sub Menu Maker](automation/autoload/mag.sub_menu_maker_r1.lua)
Automation menüsünde listelenen lua isimlerini gruplar. Bu gruplamayı girdiğiniz dosya adına göre yapıyor.

---

* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Text Align](automation/autoload/mag.text_align.lua)
Karaktere göre metni bölüp hizalar.

---

* **Uygulanan satırlar:** Seçili satırlara uygular.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Timer](automation/autoload/mag.timer.lua)
Satır zamanlama seçenekleri sunar.

---

* **Uygulanan satırlar:** Aktif satıra göre işlem yapar. Aktif satır, metin düzenleme kutusunda gördüğünüz satırdır.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Trans State A1](automation/autoload/mag.trans_state_a1.lua)
Çeviriyi yüzdeleyip yüzdelediği satırlar içinde girilen kelimeler kadar bölme yapabilir. Bölme işlemindeki fazlalıklar birer birer diğer paylara dağıtararak eşitlenir. Bunları `Effect` kutucuğuna yazar.

---

* **Uygulanan satırlar:** Tüm stillere veya ayrı ayrı stillere uygular. Ayrı ayrı uyguladığı stiller Style Manager'de kayıtlı ve o stile sahip satırlar varsa listeler.
* **Arayüz hafızası:** Tüm tercihler ayrı bir yerde oluşturulan bir dosyaya yazılır. Arayüz kapatıldığında son değişiklikler bu dosyaya aktarılır.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

### [Typewritter](automation/autoload/mag.typewritter.lua)
Satıra daktilo tarzı bir efekt uygular.

---

* **Uygulanan satırlar:** Seçili satırlara uygular.
* **Arayüz hafızası:** Her açılan dosya kapanana kadar geçen sürede tercihler hafızada tutulur. Bir dosyada yapılan tercih, aynı anda açılsa bile diğer bir dosyaya yansımaz. Uygulanan satırların tercih yapıldığı alan dışında diğer tüm tercihler hafızada tutulur.
* **Modül:** Modülün var olup olmadığını ve varsa da istenilen sürüm olup olmadığını kontrol eder. Her şey istenildiği gibiyse lua dosyasını çalıştırır.

## ASS
### [Autotags](ass/autotagsv4.ass)
İki etiket arasında satır süresince dönüşüm yapar.

### [Color Fade](ass/color_fade_v3.ass)
İki veya daha fazla renk arasında yatay renk geçişi yapar.

### [Rainbow](ass/rainbow_v2.ass)
Gökkuşağı renklerinde renk geçişi yapar.

### [Rand Color](ass/randcolor.ass)
Girilen renkleri ya sırasıyla ya da rastgele bir biçimde döndürür.

### [Shaper](ass/shaper.ass)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer. ASS dosyası halinde.

### [T_Calc](ass/t_calc(v11).ass)
Girilen frame değerini alıp `\transform` etiketinin `t1` ve `t2` parametresi için ms cinsinden süre oluşturur.

### [Vertical Kanji](ass/vertical_kanji.ass)
Kanjiyi dikey şekilde konumlandırır.

---
---
Detaylı rehberler için blog sayfamı ziyaret edebilirsiniz: http://biskuvininkirintilari.blogspot.com.tr/

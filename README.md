# IN ENGLISH

### TABLE OF CONTENTS
- [**(A) INTRODUCTION**](#introduction)
  - [**(1) Features**](#features)
  - [**(2) Installation**](#installation)
  - [**(3) Usage**](#usage)
  - [**(4) Supported Version**](#supported-version)
  - [**(5) Shortcut**](#shortcut)
- [**(B) MODULE**](#module)
  - [**(1) Mag**](#mag)
  - [**(2) Version 1.1.4.4**](#version-1144)
- [**(C) MACROS**](#macros)
  - [**(1) Break Lines**](#break-lines)
  - [**(2) Case Conversion**](#case-conversion)
  - [**(3) Check Lines**](#check-lines)
  - [**(4) Comment Finder**](#comment-finder)
  - [**(5) Copy Lines**](#copy-lines)
  - [**(6) Create Lines**](#create-lines)
  - [**(7) Delete Lines**](#delete-lines)
  - [**(8) Duplicate Lines**](#duplicate-lines)
  - [**(9) Format Lines**](#format-lines)
  - [**(10) K Char**](#k-char)
  - [**(11) Measure Lines**](#measure-lines)
  - [**(12) Select Lines**](#select-lines)
  - [**(13) Shaper**](#shaper)
  - [**(14) Strip Lines**](#strip-lines)  
  - [**(15) Typewriter**](#typewriter)
- [**(D) ASS Files**](#ass-files)
  - [**(1) Autotags**](#autotags)
  - [**(2) Color Fade**](#color-fade)
  - [**(3) Rainbow**](#rainbow)
  - [**(4) Rand Color**](#rand-color)
  - [**(5) Shaper**](#shaper-1)
  - [**(6) T_Calc**](#t_calc)
  - [**(7) Vertical Kanji**](#vertical-kanji)

## INTRODUCTION
This page provides a download link to the lua plugins I write.

#### Features
- Multi-language

*All my lua plugin has two languages, Turkish and English. The English language is selected by default on the first boot-up. To change language, each lua plugin comes with a language change interface. On the automation submenu, hover over the name of the lua plugin which you want to change the language and click on the **Change Language** option.*

- Physically save interface preferences

*Preferences are saved to an external file for always remembering. This file is in the **%appdata%/aegisub/** directory. In portable Aegisub, it is saved where **aegisub.exe** is.*

#### Installation 
* Installation directory of module file: **aegisub/automation/include/**
* Installation directory of lua files: **aegisub/automation/autoload/**

Move the module file and lua plugins to the installation directories while the program is closed. You can move them while the program is open but you need to press **Automation/Automation.../Rescan Autoload Dir** button to enable them.

#### Usage
The lua plugins you install are added to the **Automation** submenu with a similar name to the file name. You can run the lua plugin by clicking on that name.

#### Supported Version
I've written all of my lua files in Aegisub 3.2.2, the latest stable version. You may have a problem with previous **3.x.x versions** but will definitely with **2.x.x versions**. If a new stable version of Aegisub comes out and there is an incompatibility problem with it, I going to fix it. I will always support the most recent stable release of Aegisub.

#### Shortcut
You can assign a shortcut to use the lua plugins more quickly. For this:
* Open **View/Options/Interface/Hotkeys**.
* Create a shortcut in the **Default**.

Wherever you are in the program, lua plugin starts to work when you press the shortcut.

## MODULE

### [Mag](automation/include/mag.lua)
I made a file to not write the functions I use repeatedly and to correct mistakes from one place. If you do not install the module, you can not use the lua plugins.

#### Version 1.1.4.4
Currently the latest module file is version 1.1.4.4. With this release, I have almost rewritten all of my lua plugins. While some lua plugins have changed completely, some have not changed much. In this version of the module, multiple languages are added to all the plugins. Also the name of many plugins has changed and some plugins deleted.

##### Name Changes
Old Name              | New Name
--------------------- | ---------------
Trans State A1        | Measure Lines
Line Source Duplicate | Duplicate Lines
Finder                | Comment Finder
Strip Line            | Strip Lines
Checker               | Check Lines
Copy Dialogue         | Copy Lines
Break Line            | Break Lines

##### Deleted files
Plugin Name
---------- |
Basic Turning
Text Align

##### Future files
Plugin Name
---------- |
Sub Menu Maker
HTML Table From ASS
Language Tools

## MACROS

### [Break Lines](automation/autoload/mag.break_lines.lua)
Breaks the lines that are not breaked and must be breaked.

### [Case Conversion](automation/autoload/mag.case_conversion.lua)
Makes letter conversions.

### [Check Lines](automation/autoload/mag.check_lines.lua)
Detects technical problems.

### [Comment Finder](automation/autoload/mag.comment_finder.lua)
It finds notes and lists them in the interface. Also allows you to jump between them.

### [Copy Lines](automation/autoload/mag.copy_lines.lua)
Copies lines to clipboard or text file.

### [Create Lines](automation/autoload/mag.create_lines.lua)
Helps to create a line.

### [Delete Lines](automation/autoload/delete_lines.lua)
Deletes lines by style, actor or effect.

### [Duplicate Lines](automation/autoload/mag.duplicate_lines.lua)
Provides translation mode by duplicating lines.

### [Format Lines](automation/autoload/mag.format_lines.lua)
Adds italic, alignment and transparency tags.

### [K Char](automation/autoload/mag.k_char.lua)
Allows you to put anything before each character on the line.

### [Measure Lines](automation/autoload/mag.measure_lines.lua)
Adds percentage to effect box of applied lines. It is important to share translation.

### [Select Lines](automation/autoload/mag.select_lines.lua)
Selects lines in any way.

### [Shaper](automation/autoload/mag.shaper.lua)
Adds image, grid or quad to active line.

### [Strip Lines](automation/autoload/mag.strip_lines.lua)
Clears tags, extra whitespaces and things like them.

### [Typewriter](automation/autoload/mag.typewriter.lua)
Helps typewriter-style typesettings.

## ASS Files
### [Autotags](ass/autotagsv4.ass)
Converts between two tag during the line.

### [Color Fade](ass/color_fade_v3.ass)
Makes horizontal color transition between two or more colors.

### [Rainbow](ass/rainbow_v2.ass)
Makes color transitions in rainbow color.

### [Rand Color](ass/randcolor.ass)
Specified colors applies to the karaoke lines either in sequence or randomly.

### [Shaper](ass/shaper.ass)
Draw shape based on subtitle or video resolution for picture.

### [T_Calc](ass/t_calc(v11).ass)
Converts from frame value to millisecond. You can change the color of the karaoke lines according to the scene.

### [Vertical Kanji](ass/vertical_kanji.ass)
Positions kanji characters vertically.

# TÜRKÇE

### İÇİNDEKİLER
- [**(A) TANITIM**](#tanitim)
  - [**(1) Özellikler**](#%C3%96zellikler)
  - [**(2) Kurulum**](#kurulum)
  - [**(3) Kullanım**](#kullan%C4%B1m)
  - [**(4) Destek Verilen Sürüm**](#destek-verilen-s%C3%BCr%C3%BCm)
  - [**(5) Kısayol Atamak**](#k%C4%B1sayol-atamak)
- [**(B) MODÜL**](#modÜl)
  - [**(1) Mag**](#mag)
  - [**(2) 1.1.4.4 sürümü**](#1144-s%C3%BCr%C3%BCm%C3%BC)
- [**(C) MAKROLAR**](#makrolar)
  - [**(1) Break Lines**](#break-lines)
  - [**(2) Case Conversion**](#case-conversion)
  - [**(3) Check Lines**](#check-lines)
  - [**(4) Comment Finder**](#comment-finder)
  - [**(5) Copy Lines**](#copy-lines)
  - [**(6) Create Lines**](#create-lines)
  - [**(7) Delete Lines**](#delete-lines)
  - [**(8) Duplicate Lines**](#duplicate-lines)
  - [**(9) Format Lines**](#format-lines)
  - [**(10) K Char**](#k-char)
  - [**(11) Measure Lines**](#measure-lines)
  - [**(12) Select Lines**](#select-lines)
  - [**(13) Shaper**](#shaper)
  - [**(14) Strip Lines**](#strip-lines)  
  - [**(15) Typewriter**](#typewriter)
- [**(D) ASS Dosyaları**](#ass-dosyalar%C4%B1)
  - [**(1) Autotags**](#autotags)
  - [**(2) Color Fade**](#color-fade)
  - [**(3) Rainbow**](#rainbow)
  - [**(4) Rand Color**](#rand-color)
  - [**(5) Shaper**](#shaper-1)
  - [**(6) T_Calc**](#t_calc)
  - [**(7) Vertical Kanji**](#vertical-kanji)

## TANITIM
Bu sayfa yazdığım lua eklentilerine indirme bağlantısı sunar.

#### Özellikler
- Çoklu dil

*Tüm lua eklentilerimde Türkçe ve İngilizce olmak üzere iki dil bulunuyor. İlk açılışta varsayılan olarak İngilizce dili seçili gelir. Dil değiştirmek için her lua eklentisi bir dil değiştirme arayüzü ile gelir. Automation alt menüsünde dilini değiştirmek istediğiniz lua eklenti isminin üzerine gelin ve **Change Language** seçeneğine tıklayın.

- Arayüz tercihlerini fiziksel olarak kaydetme

*Tercihler harici bir dosyaya kaydedilir. Bu dosya* **%appdata%/aegisub/** *dizininde bulunur. Taşınabilir* **Aegisub***'da* **aegisub.exe** *dosyasının olduğu yere kaydedilir.*

#### Kurulum
* Modül dosyası kurulum dizini: **aegisub/automation/include/**
* Lua dosyaları kurulum dizini: **aegisub/automation/autoload/**

Modül ve lua eklentilerini program kapalıyken kurulum dizinlerine taşıyın. Program açıkken de atabilirsiniz ama etkinleştirmek için  **Automation/Automation.../Rescan Autoload Dir** butonuna basmanız gerekiyor.

#### Kullanım
Kurduğunuz lua eklentileri, dosya adına benzer bir ad ile **Automation** alt menüsüne eklenir. O isme tıklayarak lua eklentisini çalıştırabilirsiniz.

#### Destek Verilen Sürüm
Tüm lua dosyalarımı en stabil olan Aegisub **3.2.2** sürümünde yazdım. Önceki **3.x.x sürümlerinde** sorun yaşamayabilirsiniz fakat **2.x.x sürümlerinde** kesin sorunlar yaşayabilirsiniz. Daha güncel bir sürüm çıkarsa ve uyumsuzluk sorunu olursa düzenleme yapabilirim. Her zaman en güncel stabil sürüme destek vereceğim.

#### Kısayol Atamak
Lua dosyalarını daha hızlı kullanmak için klavyeden bir kısayol atabilirsiniz. Bunun için:
* **View/Options/Interface/Hotkeys** kısmını açın.
* **Defualt** içinde bir kısayol atayın.

Programın neresinde olursanız olun atadığınız kısayola basınca lua eklentisi çalışmaya başlar.

## MODÜL

### [Mag](automation/include/mag.lua)
Devamlı kullandığım fonksiyonları her defasında yazmamak ve hataları tek bir yerden düzeltmek için tek bir dosya haline getirdim. Modülü kurmamanız durumunda lua eklentilerimi kullanamazsınız.

#### 1.1.4.4 Sürümü
Şu anda en güncel modül dosyası sürümü 1.1.4.4'dür. Bu sürüm ile lua eklentilerimin hepsini baştan yazdım. Bazı lua eklentileri baştan aşağı değişirken bazılarında pek bir değişiklik olmadı. Modülün bu sürümünde tüm eklentilerine çoklu dil eklendi. Birçok eklentinin adında değişiklik oldu ve bazı eklentiler de silindi.

##### İsim Değişiklikleri
Eski Adı              | Yeni Adı
--------------------- | ---------------
Trans State A1        | Measure Lines
Line Source Duplicate | Duplicate Lines
Finder                | Comment Finder
Strip Line            | Strip Lines
Checker               | Check Lines
Copy Dialogue         | Copy Lines
Break Line            | Break Lines

##### Silinen dosyalar
Eklenti Adı
---------- |
Basic Turning
Text Align

##### Gelecek dosyalar
Eklenti adı
---------- |
Sub Menu Maker
HTML Table From ASS
Language Tools

## MAKROLAR

### [Break Lines](automation/autoload/mag.break_lines.lua)
- **Türkçe adı:** Satır Böl
- **Açıklama:** Bölünmemiş ve bölünmesi gereken satırları böler.

### [Case Conversion](automation/autoload/mag.case_conversion.lua)
- **Türkçe adı:** Harf Dönüştür
- **Açıklama:** Harf dönüşümleri yapar.

### [Check Lines](automation/autoload/mag.check_lines.lua)
- **Türkçe adı:** Satır Kontrol Et
- **Açıklama:** Teknik sorunları tespit eder.

### [Comment Finder](automation/autoload/mag.comment_finder.lua)
- **Türkçe adı:** Açıklama Bul
- **Açıklama:** Notları bulup arayüzde listeler. Ayrıca bunlar arasında geçiş yapılmasını sağlar.

### [Copy Lines](automation/autoload/mag.copy_lines.lua)
- **Türkçe adı:** Satır Kopyala
- **Açıklama:** Satırları panoya veya metin dosyasına kopyalar.

### [Create Lines](automation/autoload/mag.create_lines.lua)
- **Türkçe adı:** Satır Oluştur
- **Açıklama:** Satır oluşturmaya yardım eder.

### [Delete Lines](automation/autoload/delete_lines.lua)
- **Türkçe adı:** Satır Sil
- **Açıklama:** Stil, oyuncu veya efekt girdisine göre satırları siler.

### [Duplicate Lines](automation/autoload/mag.duplicate_lines.lua)
- **Türkçe adı:** Satır Çoğalt
- **Açıklama:** Satırları çoğaltarak çeviri kipi imkanı sunar.

### [Format Lines](automation/autoload/mag.format_lines.lua)
- **Türkçe adı:** Satır Biçimlendir
- **Açıklama:** Eğiklik, hizalama ve şeffaflık geçişi etiketleri ekler.

### [K Char](automation/autoload/mag.k_char.lua)
- **Türkçe adı:** Karakter Yerleştir
- **Açıklama:** Satırdaki her karakterin başına herhangi bir şey koymanızı sağlar.

### [Measure Lines](automation/autoload/mag.measure_lines.lua)
- **Türkçe adı:** Satır Ölç
- **Açıklama:** Uygulanan satırların efekt kutularına yüzde ekler. Çeviriyi paylaştırma açısından önemlidir.

### [Select Lines](automation/autoload/mag.select_lines.lua)
- **Türkçe adı:** Satır Seç
- **Açıklama:** Her türlü yolla satırları seçer.

### [Shaper](automation/autoload/mag.shaper.lua)
- **Türkçe adı:** Şekil Çiz
- **Açıklama:** Aktif satıra resim, ızgara veya dörtgen ekler.

### [Strip Lines](automation/autoload/mag.strip_lines.lua)
- **Türkçe adı:** Satır Temizle
- **Açıklama:** Etiketleri, fazladan boşlukları ve o tarz şeyleri temizler.

### [Typewriter](automation/autoload/mag.typewriter.lua)
- **Türkçe adı:** Harf Harf Yaz
- **Açıklama:** Daktilo tarzı ekran yazılarına yardım eder.

## ASS Dosyaları
### [Autotags](ass/autotagsv4.ass)
İki etiket arasında satır süresince dönüşüm yapar.

### [Color Fade](ass/color_fade_v3.ass)
İki veya daha fazla renk arasında yatay renk geçişi yapar.

### [Rainbow](ass/rainbow_v2.ass)
Gökkuşağı renklerinde renk geçişi yapar.

### [Rand Color](ass/randcolor.ass)
Belirlenen renkleri karaoke satırlarına ya sırasıyla ya da rastgele bir biçimde uygular.

### [Shaper](ass/shaper.ass)
Alt yazı veya video çözünürlüğüne göre resim için şekil çizer.

### [T_Calc](ass/t_calc(v11).ass)
Frame değerinden milisaniyeye dönüşüm yapar. Karaoke satırlarının rengini sahneye göre değiştirebilirsiniz.

### [Vertical Kanji](ass/vertical_kanji.ass)
Kanjiyi dikey şekilde konumlandırır.

---
---
Daha detaylı rehberler için blog sayfamı ziyaret edebilirsiniz: http://biskuvininkirintilari.blogspot.com.tr/
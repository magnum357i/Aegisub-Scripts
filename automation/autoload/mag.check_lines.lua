	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Kontrol Et", sub_menu = "Satır/Kontrol Et"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Check Lines",      sub_menu = "Lines/Check"}
	}
	local lang_list        = {}
	local script_name_list = {}
	local sub_menu_list    = {}
	for i = 1, #langs do
	lang_list[langs[i].lang_key]        = langs[i].lang_name
	script_name_list[langs[i].lang_key] = langs[i].script_name
	sub_menu_list[langs[i].lang_key]    = langs[i].sub_menu
	end
	if lang == langs[1].lang_key then
	in_lang["module_incompatible"]    = "Mag modülünün kurulu sürümü bu lua dosyası ile uyumsuz!\n\nModül dosyasının en az \"%s\" sürümü veya daha üstü gerekiyor.\n\n\nŞimdi indirme sayfasına gitmek ister misiniz?"
	in_lang["module_not_found"]       = "Mag modülü bulunamadı!\n\nBu lua dosyasını kullanmak için Mag modülünü indirip Aegisub programı kapalıyken\n\"Aegisub/automation/include/\" dizinine taşımanız gerekiyor.\n\n\nŞimdi indirme sayfasına gitmek ister misiniz?"
	in_lang["module_yes"]             = "Git"
	in_lang["module_no"]              = "Daha Sonra"
	in_lang["sub_menu"]               = langs[1].sub_menu
	in_lang["s_name"]                 = langs[1].script_name
	in_lang["s_desc"]                 = "Teknik sorunları tespit eder."
	in_lang["tabKey1"]                = "Atla"
	in_lang["tabKey2"]                = "Önceki"
	in_lang["tabKey3"]                = "Sonraki"
	in_lang["tabKey4"]                = "Tara"
	in_lang["tabKey5"]                = "Kaldır"
	in_lang["buttonKey1"]             = "Tara"
	in_lang["buttonKey2"]             = "Kapat"
	in_lang["buttonKey3"]             = "Kaldır"
	in_lang["buttonKey4"]             = "Bazı ipuçları"
	in_lang["buttonKey5"]             = "İstatistikler"
	in_lang["buttonKey6"]             = "Oto düzeltme"
	in_lang["buttonKey7"]             = "Geri dön"
	in_lang["buttonKey8"]             = "Düzelt"
	in_lang["buttonKey9"]             = "Hepsini düzelt"
	in_lang["cModeListNameKey1"]      = "ZAMAN KONTROLLERİ"
	in_lang["cModeListNameKey2"]      = "KARAKTER KONTROLLERİ"
	in_lang["cModeListNameKey3"]      = "NOKTALAMA KONTROLLERİ"
	in_lang["cModeListNameKey4"]      = "BOŞLUK KONTROLLERİ"
	in_lang["cModeListNameKey5"]      = "STİL KONTROLÜ"
	in_lang["cModeListNameKey6"]      = "KARAOKE KONTROLLERİ"
	in_lang["cModeListShortNameKey1"] = "Zaman"
	in_lang["cModeListShortNameKey2"] = "Karakter"
	in_lang["cModeListShortNameKey3"] = "Noktalama"
	in_lang["cModeListShortNameKey4"] = "Boşluk"
	in_lang["cModeListShortNameKey5"] = "Stil"
	in_lang["cModeListShortNameKey6"] = "Karaoke"
	in_lang["cModeFormat"]            = "[({%1}) {%2}]"
	in_lang["guiLabelKey1"]           = "Şundan az:"
	in_lang["guiLabelKey2"]           = "Şundan fazla:"
	in_lang["guiLabelKey3"]           = "Zaman farkı şundan az ise:"
	in_lang["guiLabelKey4"]           = "Karakter/saniye sınırı:"
	in_lang["guiLabelKey5"]           = "Üst üste binen satır"
	in_lang["guiLabelKey6"]           = "Bölünmemiş satırların sınırı:"
	in_lang["guiLabelKey7"]           = "Bölünen satırların sınırı:"
	in_lang["guiLabelKey8"]           = "Birden fazla"
	in_lang["guiLabelKey9"]           = "Satırdan önce veya sonra"
	in_lang["guiLabelKey10"]          = "Satır bölmeden önce veya sonra"
	in_lang["guiLabelKey11"]          = "Noktalama işaretlerinden önce veya sonra:"
	in_lang["guiLabelKey12"]          = "[UYGULANACAK SATIRLAR]"
	in_lang["guiLabelKey13"]          = "Boşlukları ve noktalama işaretlerini yoksay:"
	in_lang["guiLabelKey14"]          = "Raporu görüntüle"
	in_lang["guiLabelKey15"]          = "Tanımsız stil"
	in_lang["guiLabelKey16"]          = "Karaoke etiketlerinin süreleri"
	in_lang["guiLabelKey17"]          = "Karaoke etiketlerinin boşlukları"
	in_lang["guiLabelKey18"]          = "Çift:"
	in_lang["guiLabelKey19"]          = "Satırın başı:"
	in_lang["guiLabelKey20"]          = "Ekrandaki maksimum satır:"
	in_lang["guiLabelKey21"]          = "Bozuk etiket"
	in_lang["guiLabelKey22"]          = "Hatalı blok"
	in_lang["guiLabelKey23"]          = "Satır sonu:"
	in_lang["guiLabelKey24"]          = "Noktalama işaretinden sonra:"
	in_lang["guiLabelKey25"]          = "Noktalama işaretinden sonra yoksa:"
	in_lang["guiLabelKey26"]          = "Eksik"
	in_lang["guiLabelKey27"]          = "Belirli gruplar için ayıraç:"
	in_lang["guiLabelKey28"]          = "ms"
	in_lang["guiLabelKey29"]          = "karakter"
	in_lang["guiLabelKey30"]          = "Sıfır olan zaman farklarını yazma."
	in_lang["guiLabelKey31"]          = "Yorum satırlarını sil."
	in_lang["guiLabelKey32"]          = "Boş satırları sil."
	in_lang["guiLabelKey33"]          = "Bölme karakterlerinin boşluklarını temizle."
	in_lang["guiLabelKey34"]          = "Satırların başındaki ve sonundaki boşlukları temizle."
	in_lang["guiLabelKey35"]          = "Yorum bloklarını kaldır."
	in_lang["guiLabelKey36"]          = "Blokları birleştir."
	in_lang["guiLabelKey37"]          = "Kullanılmayan stilleri sil"
	in_lang["guiLabelKey38"]          = "karakter sayısı"
	in_lang["guiLabelKey39"]          = "saniye/karakter"
	in_lang["guiHintKey1"]            = "Aşağıdaki tercihlerin hepsini uygulamak için bu kutuyu işaretleyin."
	in_lang["guiHintKey2"]            = "Karakter hesaplamasına boşlukları ve noktalama işaretlerini dahil etmez."
	in_lang["guiHintKey4"]            = "Geçerli satırın bitiş süresi ile sonraki satırın başlangıç süresi arasındaki süre bu değerden az ise"
	in_lang["guiHintKey5"]            = "Tüm yazı tipleri yüklü olmalıdır."
	in_lang["guiHintKey6"]            = "Her yeri kontrol eder(satırın başı, ortası ve sonu)."
	in_lang["guiHintKey7"]            = "Satır sonu içindir. \"{%s}\" kontrolündeki karakterleri arar ve hiçbirini bulamazsa hata basar."
	in_lang["guiHintKey8"]            = "Satır ortası için olduğundan satırın başını ve sonunu dikkate almaz. Lütfen bu kısımlar için şu kontrolleri kullanın: \"{%s}\", \"{%s}\""
	in_lang["guiHintKey9"]            = "Kontrol ettikleri:\n- geçersiz değer: \\an15, \\fs(50) vb.\n- unutulmuş ters eğik çizgi: bord5 \n- tanımsız etiket: \\mag357\n- çift ters eğik çizgi: \\\\shad5\n\nNot: vsfiltermod etiketlerini kapsamıyor. Teknik olarak mümkün olmadığından bulduğu hataların hepsi doğru olmayabilir: Yorum parantezlerini hariç tutmak gibi."
	in_lang["guiHintKey10"]           = "Kontrol ettikleri:\n- yazım hatası: {{...}\n- birleştirilmesi gereken: {...}{...}"
	in_lang["guiHintKey11"]           = "Lütfen en karmaşık olanı en başa yazın.\n\nDEĞİŞKENLER\n\"$s\" = boşluk."
	in_lang["guiHintKey12"]           = "Buraya yazılanlar satırdan silinir. Bu sayede ilgili kontrolün daha hatasız çalışması sağlanır."
	in_lang["key1"]                   = "Atlanacak satır bulunamadı."
	in_lang["key2"]                   = "{%s}{%s}  |  {%s}"
	in_lang["key3"]                   = "{%1}  [Toplam {%2} satır]"
	in_lang["key4"]                   =
	"\"!\" = dikkat et, tekrar bak, uyarı"
	.."\n\"?\" = Bu nedir?"
	.."\n\"(...L)=x\" = tanımsız, olmaması gerek (satır başı)"
	.."\n\"(L...)=?\" = Bu nedir? (satırın sonu)"
	.."\n\"XN\" = bölünen satırın karakter sayısı"
	.."\n\"L\" = satır"
	.."\n\"C\" = karakter"
	.."\n\"S\" = cümle"
	.."\n\"xms+\" = azami ms sınırıyla satır süresi arasındaki fark, belirlenen zamandan daha fazla"
	.."\n\"xms-\" = asgari ms sınırıyla satır süresi arasındaki fark, belirlenen zamandan daha az"
	.."\n\"xms!\" = geçerli satırın bitiş süresiyle sonraki satırın başlangıç süresi arasındaki fark"
	in_lang["key5"]                   = "[\"{%1}\"]\nToplam {%2} satır etkilendi."
	in_lang["logKey1"]                = "kısa süre"
	in_lang["logKey2"]                = "uzun süre"
	in_lang["logKey3"]                = "zaman farkı"
	in_lang["logKey4"]                = "saniye başına karakter sayısı yüksek"
	in_lang["logKey5"]                = "üst üste binme"
	in_lang["logKey6"]                = "karakter sınırını aşma"
	in_lang["logKey7"]                = "bölünen satırlarda karakter sınırını aşma"
	in_lang["logKey8"]                = "yüksek ekran satırı"
	in_lang["logKey9"]                = "çift"
	in_lang["logKey10"]               = "geçersiz başlangıç işareti"
	in_lang["logKey11"]               = "geçersiz bitiş işareti"
	in_lang["logKey12"]               = "kayıp"
	in_lang["logKey13"]               = "birden fazla"
	in_lang["logKey14"]               = "satırdan önce ve sonra"
	in_lang["logKey15"]               = "satırdan önce"
	in_lang["logKey16"]               = "satırdan sonra"
	in_lang["logKey17"]               = "satır bölmeden önce ve sonra"
	in_lang["logKey18"]               = "satır bölmeden önce"
	in_lang["logKey19"]               = "satır bölmeden sonra"
	in_lang["logKey20"]               = "noktalama işaretinden önce"
	in_lang["logKey21"]               = "noktalama işaretinden sonra"
	in_lang["logKey22"]               = "boşluksuz"
	in_lang["logKey23"]               = "tanımsız stil"
	in_lang["logKey24"]               = "tanımsız etiket"
	in_lang["logKey25"]               = "geçersiz etiket"
	in_lang["logKey26"]               = "çift ters eğik çizgi"
	in_lang["logKey27"]               = "blok yazım hatası"
	in_lang["logKey28"]               = "birleştirilmemiş bloklar"
	in_lang["logKey29"]               = "eşleşmeyen süre"
	in_lang["logKey30"]               = "gereksiz boşluk"
	in_lang["line"]                   = "S"
	in_lang["char"]                   = "K"
	in_lang["out"]                    = "[KONTROL]"
	in_lang["errorKey1"]              = "Çözünürlük sıfırdan büyük olmalıdır."
	in_lang["warningKey1"]            = "Zaten şu bölümde aşağıdakilerin hepsini işaretlemeyi seçtiniz: \"{%s}\""
	in_lang["progressKey1"]           = "Kontrol ediliyor..."
	in_lang["progressKey2"]           = "Kaldırılıyor..."
	in_lang["progressKey3"]           = "Öncekine atlanıyor..."
	in_lang["progressKey4"]           = "Sonrakine atlanıyor..."
	in_lang["progressKey5"]           = "Bilgi"
	in_lang["progressKey6"]           = "Analiz ediliyor..."
	in_lang["progressKey7"]           = "Temizleniyor..."
	in_lang["staKey1"]                = "yorum satırları"
	in_lang["staKey2"]                = "boş satırlar"
	in_lang["staKey3"]                = "yazı içeren satırlar"
	in_lang["staKey4"]                = "şekil içeren satırlar"
	in_lang["staKey5"]                = "yorum blokları"
	in_lang["staKey7"]                = "stil sayısı"
	in_lang["staKey9"]                = "şablon satırları"
	in_lang["staKey10"]               = "şablon çıktıları"
	in_lang["staKey11"]               = "diğer satırlar"
	in_lang["staKey12"]               = "kullanılmayan"
	in_lang["staKey13"]               = "tanımsız"
	in_lang["staKey14"]               = "yazı tipi yüklenmemiş"
	in_lang["staKey15"]               = "{%s:[Birkaç yazı tipi yüklü değil.][Tüm yazı tipleri yüklü.]}"
	in_lang["staKey16"]               = "{%s:[Yanlış renk uzayı.][Renk uzayı doğru ayarlanmış.]}"
	in_lang["staKey18"]               = "{%s:[\"Scale Border and Shadow.\" seçeneği işaretlenmemiş.][\"Scale Border and Shadow.\" seçeneği işaretli.]}"
	in_lang["staKey19"]               = "Varsayılan \"Wrap Style\" değeri kullanılmıyor."
	in_lang["staKey20"]               = "dizgi satırları"
	in_lang["staKey21"]               = "Bir video yüklü."
	in_lang["staKey22"]               = "{%s:[Kullanılmayan stiller var.][Tüm stiller kullanılıyor.]}"
	in_lang["staKey23"]               = "{%s:[Bazı satırlardaki stiller tanımlanmamış.][Satırlardaki tüm stiller tanımlı.]}"
	in_lang["staKey24"]               = "Yorum satırları var."
	in_lang["staKey25"]               = "Boş satırlar var."
	in_lang["staKey26"]               = "Satır içi yorumlar kullanılmış."
	in_lang["staKey27"]               = "yazı tipi sayısı"
	in_lang["staKey28"]               = "stil"
	in_lang["staKey29"]               = "fn etiketi"
	in_lang["staKey30"]               = "({%s} yazı tipi)"
	in_lang["staKey32"]               = "aktör/aktris sayısı"
	in_lang["staKey33"]               = "aktör/aktris satırları"
	in_lang["staHeader1"]             = "ÖZET"
	in_lang["staHeader2"]             = "SATIR TÜRLERİ"
	in_lang["staHeader3"]             = "STİL SORUNLARI"
	in_lang["staHeader4"]             = "SONUÇLAR"
	in_lang["staHeader5"]             = "YÜKLÜ OLMAYAN YAZI TİPLERİ"
	in_lang["staHeader6"]             = "ALT YAZI BİLGİLERİ"
	in_lang["staFormat1"]             = "{%s}{%s} - %{%s} -> {%s}"
	in_lang["staFormat2"]             = "{%s}  {%s}"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"]    = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]       = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]             = "Go"
	in_lang["module_no"]              = "Later"
	in_lang["sub_menu"]               = langs[2].sub_menu
	in_lang["s_name"]                 = langs[2].script_name
	in_lang["s_desc"]                 = "Detects technical problems."
	in_lang["tabKey1"]                = "Jump"
	in_lang["tabKey2"]                = "Previous"
	in_lang["tabKey3"]                = "Next"
	in_lang["tabKey4"]                = "Scan"
	in_lang["tabKey5"]                = "Remove"
	in_lang["buttonKey1"]             = "Scan"
	in_lang["buttonKey2"]             = "Close"
	in_lang["buttonKey3"]             = "Remove"
	in_lang["buttonKey4"]             = "Some tips"
	in_lang["buttonKey5"]             = "Statistics"
	in_lang["buttonKey6"]             = "Autofix"
	in_lang["buttonKey7"]             = "Back"
	in_lang["buttonKey8"]             = "Fix"
	in_lang["buttonKey9"]             = "Fix All"
	in_lang["cModeListNameKey1"]      = "TIME CHECKS"
	in_lang["cModeListNameKey2"]      = "CHARACTER CHECKS"
	in_lang["cModeListNameKey3"]      = "PUNCTUATION CHECKS"
	in_lang["cModeListNameKey4"]      = "WHITESPACE CHECKS"
	in_lang["cModeListNameKey5"]      = "STYLE CHECK"
	in_lang["cModeListNameKey6"]      = "KARAOKE CHECKS"
	in_lang["cModeListShortNameKey1"] = "Time"
	in_lang["cModeListShortNameKey2"] = "Char"
	in_lang["cModeListShortNameKey3"] = "Punc"
	in_lang["cModeListShortNameKey4"] = "Space"
	in_lang["cModeListShortNameKey5"] = "Style"
	in_lang["cModeListShortNameKey6"] = "Karaoke"
	in_lang["cModeFormat"]            = "[{%1}] {%2}"
	in_lang["guiLabelKey1"]           = "Less than:"
	in_lang["guiLabelKey2"]           = "More than:"
	in_lang["guiLabelKey3"]           = "Time difference is less than:"
	in_lang["guiLabelKey4"]           = "Char/sec threshold:"
	in_lang["guiLabelKey5"]           = "Overlapping line"
	in_lang["guiLabelKey6"]           = "Limit of unbreaked line:"
	in_lang["guiLabelKey7"]           = "Limit of breaking line:"
	in_lang["guiLabelKey8"]           = "More than one"
	in_lang["guiLabelKey9"]           = "Before or after line"
	in_lang["guiLabelKey10"]          = "Before or after line break"
	in_lang["guiLabelKey11"]          = "Before punctuation:"
	in_lang["guiLabelKey12"]          = "[APPLY LINES]"
	in_lang["guiLabelKey13"]          = "Ignore whitespaces and punctuations:"
	in_lang["guiLabelKey14"]          = "View the report"
	in_lang["guiLabelKey15"]          = "Undefined style"
	in_lang["guiLabelKey16"]          = "Durations of karaoke tags"
	in_lang["guiLabelKey17"]          = "Whitespaces of karaoke tags"
	in_lang["guiLabelKey18"]          = "Double:"
	in_lang["guiLabelKey19"]          = "Start of line:"
	in_lang["guiLabelKey20"]          = "Max screen line:"
	in_lang["guiLabelKey21"]          = "Corrupted tag"
	in_lang["guiLabelKey22"]          = "Distorted block"
	in_lang["guiLabelKey23"]          = "End of line:"
	in_lang["guiLabelKey24"]          = "After punctuation:"
	in_lang["guiLabelKey25"]          = "If not after punctuation:"
	in_lang["guiLabelKey26"]          = "Missing"
	in_lang["guiLabelKey27"]          = "Enclose for certain groups:"
	in_lang["guiLabelKey28"]          = "ms"
	in_lang["guiLabelKey29"]          = "chars"
	in_lang["guiLabelKey30"]          = "Don't write the zero in the time difference."
	in_lang["guiLabelKey31"]          = "Delete comment lines."
	in_lang["guiLabelKey32"]          = "Delete empty lines."
	in_lang["guiLabelKey33"]          = "Clear spaces on break chars."
	in_lang["guiLabelKey34"]          = "Clear spaces on start or end of lines."
	in_lang["guiLabelKey35"]          = "Remove comment blocks."
	in_lang["guiLabelKey36"]          = "Merge blocks."
	in_lang["guiLabelKey37"]          = "Delete unused styles."
	in_lang["guiLabelKey38"]          = "character count"
	in_lang["guiLabelKey39"]          = "cps"
	in_lang["guiHintKey1"]            = "Mark this box to apply all the options below."
	in_lang["guiHintKey2"]            = "It doesn't include the whitespaces and punctuations for character calculation."
	in_lang["guiHintKey4"]            = "If the duration between the end time of the current line and the start time of the next line is less than this value"
	in_lang["guiHintKey5"]            = "All fonts must be installed."
	in_lang["guiHintKey6"]            = "Checks everywhere (start, center, end of line)."
	in_lang["guiHintKey7"]            = "For the end of a line. Searches for the characters in \"{%s}\" check and if it can find none of them, it gives an error."
	in_lang["guiHintKey8"]            = "For center of line, so ignores start and end of line. Please use these checks for these parts: \"{%s}\", \"{%s}\""
	in_lang["guiHintKey9"]            = "Checks:\n- invalid value: \\an15, \\fs(50) etc.\n- forgetten slash: bord5 \n- undefined tags: \\mag357\n- double slash: \\\\shad5\n\nNote: The tags of vsfiltermod are not supported. And every error it finds is not true as it is not technically possible: excluding the blocks you commented."
	in_lang["guiHintKey10"]           = "Checks:\n- syntax error: {{...}\n- to be combined: {...}{...}"
	in_lang["guiHintKey11"]           = "Please write the most complex first.\n\nVARIABLES\n\"$s\" = whitespace."
	in_lang["guiHintKey12"]           = "Anything written here is deleted from the line. In this way, the related controls are provided to work as flawless."
	in_lang["key1"]                   = "No lines found to jump."
	in_lang["key2"]                   = "{%s}{%s}  |  {%s}"
	in_lang["key3"]                   = "{%1}  [Total {%2:# [line][lines]}]"
	in_lang["key4"]                   =
	"\"!\" = watch out, look again, warning"
	.."\n\"?\" = What is this?"
	.."\n\"(...L)=x\" = undefined, shouldn't be (start of line)"
	.."\n\"(L...)=?\" = What is it? (end of line)"
	.."\n\"XN\" = the character count of a breaking line"
	.."\n\"L\" = line"
	.."\n\"C\" = char"
	.."\n\"S\" = sentence"
	.."\n\"xms+\" = the difference between max ms limit and line duration, something more than the specified time"
	.."\n\"xms-\" = the difference between min ms limit and line duration, something less than the specified time"
	.."\n\"xms!\" = the difference between end time of current line and start line of next line"
	in_lang["key5"]                   = "[\"{%1}\"]\nTotal {%2:# [line][lines]} affected."
	in_lang["logKey1"]                = "short duration"
	in_lang["logKey2"]                = "long duration"
	in_lang["logKey3"]                = "time difference"
	in_lang["logKey4"]                = "high CPS"
	in_lang["logKey5"]                = "overlap"
	in_lang["logKey6"]                = "exceeding character limit"
	in_lang["logKey7"]                = "exceeding character limit in breaking line"
	in_lang["logKey8"]                = "high screen line"
	in_lang["logKey9"]                = "double"
	in_lang["logKey10"]               = "invalid starting punctuation"
	in_lang["logKey11"]               = "invalid ending punctuation"
	in_lang["logKey12"]               = "missing"
	in_lang["logKey13"]               = "more than one"
	in_lang["logKey14"]               = "before and after line"
	in_lang["logKey15"]               = "before line"
	in_lang["logKey16"]               = "after line"
	in_lang["logKey17"]               = "before and after line break"
	in_lang["logKey18"]               = "before line break"
	in_lang["logKey19"]               = "after line break"
	in_lang["logKey20"]               = "before punctuation"
	in_lang["logKey21"]               = "after punctuation"
	in_lang["logKey22"]               = "without space"
	in_lang["logKey23"]               = "undefined style"
	in_lang["logKey24"]               = "undefined tag"
	in_lang["logKey25"]               = "bad tag"
	in_lang["logKey26"]               = "double slash"
	in_lang["logKey27"]               = "block syntax"
	in_lang["logKey28"]               = "unmerged blocks"
	in_lang["logKey29"]               = "unmatched duration"
	in_lang["logKey30"]               = "unnecessary whitespace"
	in_lang["line"]                   = "L"
	in_lang["char"]                   = "C"
	in_lang["out"]                    = "[CHECK]"
	in_lang["errorKey1"]              = "Resolution must be greater than zero."
	in_lang["warningKey1"]            = "You've already chosen the option to mark all of the following on the \"{%s}\"."
	in_lang["progressKey1"]           = "Checking..."
	in_lang["progressKey2"]           = "Removing..."
	in_lang["progressKey3"]           = "Jumping to prev..."
	in_lang["progressKey4"]           = "Jumping to next..."
	in_lang["progressKey5"]           = "Info"
	in_lang["progressKey6"]           = "Analyzing..."
	in_lang["progressKey7"]           = "Purging..."
	in_lang["staKey1"]                = "comment lines"
	in_lang["staKey2"]                = "empty lines"
	in_lang["staKey3"]                = "text lines"
	in_lang["staKey4"]                = "shape lines"
	in_lang["staKey5"]                = "comment blocks"
	in_lang["staKey7"]                = "style count"
	in_lang["staKey9"]                = "template lines"
	in_lang["staKey10"]               = "generated lines"
	in_lang["staKey11"]               = "other lines"
	in_lang["staKey12"]               = "unused"
	in_lang["staKey13"]               = "undefined"
	in_lang["staKey14"]               = "with uninstalled font"
	in_lang["staKey15"]               = "{%s:[Some fonts not installed.][All fonts installed.]}"
	in_lang["staKey16"]               = "{%s:[Wrong colorpsace.][The colorspace is ok.]}"
	in_lang["staKey18"]               = "{%s:[\"Scale Border and Shadow.\" option has not checked.][\"Scale Border and Shadow.\" option has checked.]}"
	in_lang["staKey19"]               = "Wrapping style is not the default value."
	in_lang["staKey20"]               = "sign lines"
	in_lang["staKey21"]               = "Video info present."
	in_lang["staKey22"]               = "{%s:[Some defined styles are not in use.][All defined styles are in use.]}"
	in_lang["staKey23"]               = "{%s:[Some styles in use are undefined.][All styles in use are defined.]}"
	in_lang["staKey24"]               = "There are commented-out lines."
	in_lang["staKey25"]               = "There are empty lines."
	in_lang["staKey26"]               = "There are inline comments."
	in_lang["staKey27"]               = "font count"
	in_lang["staKey28"]               = "style"
	in_lang["staKey29"]               = "fn tag"
	in_lang["staKey30"]               = "({%s:# [font][fonts]})"
	in_lang["staKey32"]               = "actor count"
	in_lang["staKey33"]               = "actor lines"
	in_lang["staHeader1"]             = "SUMMARY"
	in_lang["staHeader2"]             = "LINE TYPES"
	in_lang["staHeader3"]             = "STYLE ISSUES"
	in_lang["staHeader4"]             = "RESULTS"
	in_lang["staHeader5"]             = "UNINSTALLED FONTS"
	in_lang["staHeader6"]             = "SUBTITLE INFO"
	in_lang["staFormat1"]             = "{%s}{%s} - {%s}% -> {%s}"
	in_lang["staFormat2"]             = "{%s}  {%s}"
	end
	return in_lang, lang_list, script_name_list, sub_menu_list
	end

	c_lang_switch             = "en"
	c_lang,
	c_lang_list,
	c_script_name_list,
	c_sub_name_list           = lang_switch_keys(c_lang_switch)

	script_name               = c_lang.s_name
	script_description        = c_lang.s_desc
	script_version            = "1.5.3"
	script_author             = "Magnum357"
	script_mag_version        = "1.1.5.0"
	script_file_name          = "mag.check_lines"
	script_file_ext           = ".lua"

	include_unicode           = true
	include_karaskel          = true
	mag_import, mag           = pcall(require, "mag")

	if mag_import then
	mag.lang                  = c_lang_switch

	c_lock_gui                = false
	c_buttons1                = {c_lang.buttonKey1, c_lang.buttonKey3, c_lang.buttonKey5, c_lang.buttonKey6, c_lang.tabKey2, c_lang.tabKey3, c_lang.buttonKey4, c_lang.buttonKey2}
	c_buttons2                = {c_lang.buttonKey8, c_lang.buttonKey9, c_lang.buttonKey7, c_lang.buttonKey2}

	c                         = {}
	c.time                    = true
	c.time_min                = false
	c.time_min_value          = "70"
	c.time_max                = false
	c.time_max_value          = "600"
	c.time_next_min           = false
	c.time_next_min_value     = "10"
	c.time_cps                = false
	c.time_cps_value          = 20
	c.time_overlap            = false
	c.char                    = true
	c.char_max                = false
	c.char_max_value          = 40
	c.char_range              = false
	c.char_range_value        = 45
	c.char_screenline         = false
	c.char_screenline_value   = 2
	c.space                   = true
	c.space_double            = false
	c.space_line              = false
	c.space_breakline        = false
	c.space_beforepunc        = false
	c.space_beforepunc_list   = "... . , : ; ! ?"
	c.space_afterpunc         = false
	c.space_afterpunc_list    = ""
	c.space_requiredpunc      = false
	c.space_requiredpunc_list = ". , : ; ! ?"
	c.apply_lines1            = mag.window.lang.message("select")
	c.comment_mode1           = true
	c.empty_mode1             = true
	c.space_and_punc_cc       = false
	c.space_and_punc_cps      = false
	c.view_report             = true
	c.style                   = true
	c.style_undefined         = false
	c.style_tsyntax           = false
	c.style_psyntax           = false
	c.karaoke                 = false
	c.ktag_duration           = false
	c.ktag_space              = false
	c.punc                    = true
	c.punc_double             = false
	c.punc_double_list        = "... , ! ? : ; . ' - ( ) [ ] \" *"
	c.punc_startline          = false
	c.punc_startline_list     = "-$s... -$s ..."
	c.punc_endline            = false
	c.punc_endline_list       = "... ! ? : . —"
	c.punc_missing            = false
	c.punc_enclose_list       = "\" ( ) [ ]"
	c.zero_in_diff            = false
	c.delete_commentline      = true
	c.delete_emptyline        = true
	c.clear_breaklinespace    = true
	c.clear_linespace         = true
	c.remove_commentblock     = true
	c.merge_block             = true
	c.delete_unusedstyle      = true

	c_output_signs            = {}
	c_output_signs.formatKey1 = "{%2} {%1}"
	c_output_signs.formatKey2 = "{%1} / {%2}"
	c_output_signs.key1       = "({%s}"..c_lang.guiLabelKey28.."-)"
	c_output_signs.key2       = "({%s}"..c_lang.guiLabelKey28.."+)"
	c_output_signs.key3       = "({%s}"..c_lang.guiLabelKey28.."!)"
	c_output_signs.key4       = "("..c_lang.char.."{%s})"
	c_output_signs.key5       = "("..c_lang.line.."{%s}+)"
	c_output_signs.key6       = "({%s})"
	c_output_signs.key7       = "({%s}N)"
	c_output_signs.key8       = "{%s}->{%s}+"
	c_output_signs.key9       = "({%s})"
	c_output_signs.key10      = "( "..c_lang.line.." )"
	c_output_signs.key11      = "( "..c_lang.line..")"
	c_output_signs.key12      = "("..c_lang.line.." )"
	c_output_signs.key13      = "( \\N )"
	c_output_signs.key14      = "( \\N)"
	c_output_signs.key15      = "(\\N )"
	c_output_signs.key16      = "({%s}x{%s})"
	c_output_signs.key17      = "({%s})"
	c_output_signs.key18      = "(?)"
	c_output_signs.key19      = "({%s}"..c_lang.guiLabelKey28.."+)"
	c_output_signs.key20      = "({%s}"..c_lang.guiLabelKey28.."-)"
	c_output_signs.key21      = "{ k{%s} }"
	c_output_signs.key22      = "{ k{%s}}"
	c_output_signs.key23      = "{k{%s} }"
	c_output_signs.key24      = "{k{%s} !}"
	c_output_signs.key25      = "({%s}{%s})"
	c_output_signs.key26      = "({!)"
	c_output_signs.key27      = "(}!)"
	c_output_signs.key28      = "(}{)"
	c_output_signs.key29      = "({%s}"..c_lang.line..")=x"
	c_output_signs.key30      = "("..c_lang.line.."{%s})=?"

	gui                         = {
		main1                   = {
	 	time                    = {class = "checkbox", name = "time",                                      x = 0, y = 0,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey1, c_lang.cModeListNameKey1), hint = c_lang.guiHintKey1},
		                          {class = "label",                                                        x = 0, y = 1,  width = 1, height = 1, label = mag.string.wall(" ", 4)},
		time_min                = {class = "checkbox", name = "time_min",                                  x = 1, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey1},
		time_min_value          = {class = "intedit",  name = "time_min_value",        min = 0,            x = 2, y = 1,  width = 1, height = 1},
		time_max                = {class = "checkbox", name = "time_max",                                  x = 1, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey2},
		time_max_value          = {class = "intedit",  name = "time_max_value",        min = 0,            x = 2, y = 2,  width = 1, height = 1},
		time_next_min           = {class = "checkbox", name = "time_next_min",                             x = 1, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey3, hint = c_lang.guiHintKey4},
		time_next_min_value     = {class = "intedit",  name = "time_next_min_value",   min = 0,            x = 2, y = 3,  width = 1, height = 1},
		time_cps                = {class = "checkbox", name = "time_cps",                                  x = 1, y = 4,  width = 1, height = 1, label = c_lang.guiLabelKey4},
		time_cps_value          = {class = "intedit",  name = "time_cps_value",        min = 15, max = 70, x = 2, y = 4,  width = 1, height = 1},
		time_overlap            = {class = "checkbox", name = "time_overlap",                              x = 1, y = 5,  width = 1, height = 1, label = c_lang.guiLabelKey5},
		char                    = {class = "checkbox", name = "char",                                      x = 0, y = 6,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey2, c_lang.cModeListNameKey2), hint = c_lang.guiHintKey1},
		char_max                = {class = "checkbox", name = "char_max",                                  x = 1, y = 7,  width = 1, height = 1, label = c_lang.guiLabelKey6},
		char_max_value          = {class = "intedit",  name = "char_max_value",        min = 35, max = 55, x = 2, y = 7,  width = 1, height = 1},
		char_range              = {class = "checkbox", name = "char_range",                                x = 1, y = 8,  width = 1, height = 1, label = c_lang.guiLabelKey7},
		char_range_value        = {class = "intedit",  name = "char_range_value",      min = 35, max = 55, x = 2, y = 8,  width = 1, height = 1},
		char_screenline         = {class = "checkbox", name = "char_screenline",                           x = 1, y = 9,  width = 1, height = 1, label = c_lang.guiLabelKey20, hint = c_lang.guiHintKey5},
		                          {class = "label",                                                        x = 2, y = 9,  width = 1, height = 1, label = "2"},
		punc                    = {class = "checkbox", name = "punc",                                      x = 0, y = 10, width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey3, c_lang.cModeListNameKey3), hint = c_lang.guiHintKey1},
		punc_double             = {class = "checkbox", name = "punc_double",                               x = 1, y = 11, width = 1, height = 1, label = c_lang.guiLabelKey18, hint = c_lang.guiHintKey6},
		punc_double_list        = {class = "edit",     name = "punc_double_list",                          x = 2, y = 11, width = 1, height = 1, hint = c_lang.guiHintKey11},
		punc_startline          = {class = "checkbox", name = "punc_startline",                            x = 1, y = 12, width = 1, height = 1, label = c_lang.guiLabelKey19},
		punc_startline_list     = {class = "edit",     name = "punc_startline_list",                       x = 2, y = 12, width = 1, height = 1, hint = c_lang.guiHintKey11},
		punc_endline            = {class = "checkbox", name = "punc_endline",                              x = 1, y = 13, width = 1, height = 1, label = c_lang.guiLabelKey23},
		punc_endline_list       = {class = "edit",     name = "punc_endline_list",                         x = 2, y = 13, width = 1, height = 1, hint = c_lang.guiHintKey11},
		punc_missing            = {class = "checkbox", name = "punc_missing",                              x = 1, y = 14, width = 1, height = 1, label = c_lang.guiLabelKey26, hint = mag.string.format(c_lang.guiHintKey7, c_lang.guiLabelKey23)},
								  {class = "label",                                                        x = 3, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey28},
								  {class = "label",                                                        x = 3, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey28},
								  {class = "label",                                                        x = 3, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey28},
								  {class = "label",                                                        x = 3, y = 7,  width = 1, height = 1, label = c_lang.guiLabelKey29},
								  {class = "label",                                                        x = 3, y = 8,  width = 1, height = 1, label = c_lang.guiLabelKey29},
		                          {class = "label",                                                        x = 4, y = 0,  width = 1, height = 1, label = mag.string.wall(" ", 10)},
		                          {class = "label",                                                        x = 5, y = 1,  width = 1, height = 1, label = mag.string.wall(" ", 4)},
		space                   = {class = "checkbox", name = "space",                                     x = 5, y = 0,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey4, c_lang.cModeListNameKey4), hint = c_lang.guiHintKey1},
		space_double            = {class = "checkbox", name = "space_double",                              x = 6, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey8},
		space_line              = {class = "checkbox", name = "space_line",                                x = 6, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey9},
		space_breakline         = {class = "checkbox", name = "space_breakline",                           x = 6, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey10},
		space_beforepunc        = {class = "checkbox", name = "space_beforepunc",                          x = 6, y = 4,  width = 1, height = 1, label = c_lang.guiLabelKey11, hint = mag.string.format(c_lang.guiHintKey8, c_lang.guiLabelKey19, c_lang.guiLabelKey23)},
		space_beforepunc_list   = {class = "edit",     name = "space_beforepunc_list",                     x = 7, y = 4,  width = 1, height = 1, hint = c_lang.guiHintKey11},
		space_afterpunc         = {class = "checkbox", name = "space_afterpunc",                           x = 6, y = 5,  width = 1, height = 1, label = c_lang.guiLabelKey24, hint = mag.string.format(c_lang.guiHintKey8, c_lang.guiLabelKey19, c_lang.guiLabelKey23)},
		space_afterpunc_list    = {class = "edit",     name = "space_afterpunc_list",                      x = 7, y = 5,  width = 1, height = 1, hint = c_lang.guiHintKey11},
		space_requiredpunc      = {class = "checkbox", name = "space_requiredpunc",                        x = 6, y = 6,  width = 1, height = 1, label = c_lang.guiLabelKey25, hint = mag.string.format(c_lang.guiHintKey8, c_lang.guiLabelKey19, c_lang.guiLabelKey23)},
		space_requiredpunc_list = {class = "edit",     name = "space_requiredpunc_list",                   x = 7, y = 6,  width = 1, height = 1, hint = c_lang.guiHintKey11},
		style                   = {class = "checkbox", name = "style",                                     x = 5, y = 7,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey5, c_lang.cModeListNameKey5), hint = c_lang.guiHintKey1},
		style_undefined         = {class = "checkbox", name = "style_undefined",                           x = 6, y = 8,  width = 1, height = 1, label = c_lang.guiLabelKey15},
		style_tsyntax           = {class = "checkbox", name = "style_tsyntax",                             x = 6, y = 9,  width = 1, height = 1, label = c_lang.guiLabelKey21, hint = c_lang.guiHintKey9},
		style_psyntax           = {class = "checkbox", name = "style_psyntax",                             x = 6, y = 10, width = 1, height = 1, label = c_lang.guiLabelKey22, hint = c_lang.guiHintKey10},
		karaoke                 = {class = "checkbox", name = "karaoke",                                   x = 5, y = 11, width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey6, c_lang.cModeListNameKey6), hint = c_lang.guiHintKey1},
		ktag_duration           = {class = "checkbox", name = "ktag_duration",                             x = 6, y = 12, width = 1, height = 1, label = c_lang.guiLabelKey16},
		ktag_space              = {class = "checkbox", name = "ktag_space",                                x = 6, y = 13, width = 1, height = 1, label = c_lang.guiLabelKey17},
		                          {class = "label",                                                        x = 0, y = 16, width = 8, height = 1, label = c_lang.guiLabelKey12},
		apply_lines1            = {class = "dropdown", name = "apply_lines1",                              x = 0, y = 17, width = 8, height = 1, hint = mag.window.lang.message("style_hint1")},
		comment_mode1           = {class = "checkbox", name = "comment_mode1",                             x = 0, y = 18, width = 8, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode1             = {class = "checkbox", name = "empty_mode1",                               x = 0, y = 19, width = 8, height = 1, label = mag.window.lang.message("empty_mode")},
		                          {class = "label",                                                        x = 0, y = 20, width = 4, height = 1, label = c_lang.guiLabelKey13},
		space_and_punc_cc       = {class = "checkbox", name = "space_and_punc_cc",                         x = 5, y = 20, width = 2, height = 1, label = c_lang.guiLabelKey38, hint = c_lang.guiHintKey2},
		space_and_punc_cps      = {class = "checkbox", name = "space_and_punc_cps",                        x = 7, y = 20, width = 1, height = 1, label = c_lang.guiLabelKey39, hint = c_lang.guiHintKey2},
		zero_in_diff            = {class = "checkbox", name = "zero_in_diff",                              x = 0, y = 21, width = 8, height = 1, label = c_lang.guiLabelKey30},
		                          {class = "label",                                                        x = 0, y = 22, width = 2, height = 1, label = c_lang.guiLabelKey27},
		punc_enclose_list       = {class = "edit",     name = "punc_enclose_list",                         x = 2, y = 22, width = 1, height = 1, hint = c_lang.guiHintKey11.."\n\n"..c_lang.guiHintKey12},
		view_report             = {class = "checkbox", name = "view_report",                               x = 0, y = 23, width = 8, height = 1, label = c_lang.guiLabelKey14},
		},
		main2 = {
		delete_commentline      = {class = "checkbox", name = "delete_commentline",                        x = 0, y = 0,  width = 1, height = 1, label = c_lang.guiLabelKey31},
		delete_emptyline        = {class = "checkbox", name = "delete_emptyline",                          x = 0, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey32},
		delete_unusedstyle      = {class = "checkbox", name = "delete_unusedstyle",                        x = 0, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey37},
		clear_breaklinespace    = {class = "checkbox", name = "clear_breaklinespace",                      x = 0, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey33},
		clear_linespace         = {class = "checkbox", name = "clear_linespace",                           x = 0, y = 4,  width = 1, height = 1, label = c_lang.guiLabelKey34},
		remove_commentblock     = {class = "checkbox", name = "remove_commentblock",                       x = 0, y = 5,  width = 1, height = 1, label = c_lang.guiLabelKey35},
		merge_block             = {class = "checkbox", name = "merge_block",                               x = 0, y = 6,  width = 1, height = 1, label = c_lang.guiLabelKey36},
		                          {class = "label",                                                        x = 0, y = 8,  width = 1, height = 1, label = c_lang.guiLabelKey12},
		apply_lines1            = {class = "dropdown", name = "apply_lines1",                              x = 0, y = 9,  width = 1, height = 1, hint = mag.window.lang.message("style_hint1")},
		view_report             = {class = "checkbox", name = "view_report",                               x = 0, y = 10, width = 1, height = 1, label = c_lang.guiLabelKey14},
		}
	}
	end

	function tags()
	local tag = {}
	mag.array.insert(tag, "[xy]?bord[%d%.]+")
	mag.array.insert(tag, "[xy]?shad[%d%.]+")
	mag.array.insert(tag, "pos%([%d%.%-]+,[%d%.%-]+%)")
	mag.array.insert(tag, "move%([%d%.%-]+,[%d%.%-]+,[%d%.%-]+,[%d%.%-]+%)")
	mag.array.insert(tag, "move%([%d%.%-]+,[%d%.%-]+,[%d%.%-]+,[%d%.%-]+,%d+,%d+%)")
	mag.array.insert(tag, "an[1-9]")
	mag.array.insert(tag, "i?clip%(%d+,%d+,%d+,%d+%)")
	mag.array.insert(tag, "i?clip%(m%s[%s%d%mbln]+%)")
	mag.array.insert(tag, "blur[%d%.]+")
	mag.array.insert(tag, "fn[%w%s]+")
	mag.array.insert(tag, "fsc[xy][%d%.%-]+")
	mag.array.insert(tag, "fsp[%d%.%-]+")
	mag.array.insert(tag, "fs[%d%.%-]+")
	mag.array.insert(tag, "fr[xyz]?[%d%.%-]+")
	mag.array.insert(tag, "fa[xy][%d%.%-]+")
	mag.array.insert(tag, "[1-4]?c&H[A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]&")
	mag.array.insert(tag, "[1-4]a&H[A-Z0-9][A-Z0-9]&")
	mag.array.insert(tag, "alpha&H[A-Z0-9][A-Z0-9]&")
	mag.array.insert(tag, "fade%(%d+,%d+,%d+,%d+,%d+,%d+,%d+%)")
	mag.array.insert(tag, "fad%(%d+,%d+%)")
	mag.array.insert(tag, "org%([%d%.]+,[%d%.]+%)")
	mag.array.insert(tag, "be%d+")
	mag.array.insert(tag, "t%(%d+,%d+,%d+,%s*%)")
	mag.array.insert(tag, "t%(%d+,%d+,%s*%)")
	mag.array.insert(tag, "t%(%s*%)")
	mag.array.insert(tag, "k[of]%d+")
	mag.array.insert(tag, "[kK]%d+")
	mag.array.insert(tag, "q[0-3]")
	mag.array.insert(tag, "r[%w%s]+")
	mag.array.insert(tag, "[pbius][0-1]")
	mag.array.insert(tag, "a[1235679][01]?")
	return tag
	end

	function remove_defaulttags(text)
	text = mag.gsub(text, "\\[xy]bord([%s\\]+)", "%1")
	text = mag.gsub(text, "\\[xy]shad([%s\\]+)", "%1")
	text = mag.gsub(text, "\\blur([%s\\]+)",     "%1")
	text = mag.gsub(text, "\\fsp?([%s\\]+)",     "%1")
	text = mag.gsub(text, "\\fr[xyz]?([%s\\]+)", "%1")
	text = mag.gsub(text, "\\fa[xy]?([%s\\]+)",  "%1")
	text = mag.gsub(text, "\\be([%s\\]+)",       "%1")
	text = mag.gsub(text, "\\fn([%s\\]+)",       "%1")
	text = mag.gsub(text, "\\[rqisbu]([%s\\]+)", "%1")
	text = mag.gsub(text, "\\[1-4]?c([%s\\]+)",  "%1")
	text = mag.gsub(text, "\\[1-4]a([%s\\]+)",   "%1")
	return text
	end

	function len(str,spaceandpunc)
	str = mag.strip.bracket(str)
	str = strip_special(str)
	if spaceandpunc then
	str = mag.strip.space(str)
	str = mag.strip.punc(str)
	end
	return mag.convert.len(str)
	end

	function strip_special(str) return mag.gsub(str, "\\[nNh]", " ") end

	function convert_specials(t)
	t = mag.gsub(t, "%$s", " ")
	return t
	end

	function check_lines(subs,sel)
	local lines, index
	local stylesTable     = {}
	local report_counter  = {}
	local pcs             = false
	local lines_index     = mag.line.index(subs, sel, c.apply_lines1, c.comment_mode1, c.empty_mode1)
	local undefined_style = false
	local passed          = false
	local styles
	local prev_style
	local meta
	local tag_list = {}
	if c.time then
		if c.time_min or c.time_max or c.time_next_min or c.time_cps or c.time_overlap then
		mag.show.log(2, mag.string.format(c_lang.warningKey1, c_lang.cModeListNameKey1))
		end
	end
	if c.char then
		if c.char_max or c.char_range or c.char_screenline then
		mag.show.log(2, mag.string.format(c_lang.warningKey1, c_lang.cModeListNameKey2))
		end
	end
	if c.punc then
		if c.punc_double or c.punc_startline or c.punc_endline or c.punc_missing then
		mag.show.log(2, mag.string.format(c_lang.warningKey1, c_lang.cModeListNameKey3))
		end
	end
	if c.space then
		if c.space_double or c.space_breakline or c.space_line or c.space_beforepunc or c.space_afterpunc or c.space_requiredpunc then
		mag.show.log(2, mag.string.format(c_lang.warningKey1, c_lang.cModeListNameKey4))
		end
	end
	if c.style then
		if c.style_undefined or c.style_tsyntax or c.style_psyntax then
		mag.show.log(2, mag.string.format(c_lang.warningKey1, c_lang.cModeListNameKey5))
		end
	end
	if c.karaoke then
		if c.ktag_duration or c.ktag_space then
		mag.show.log(2, mag.string.format(c_lang.warningKey1, c_lang.cModeListNameKey6))
		end
	end
	if c.style or c.style_tsyntax then
	tag_list = tags()
	end
	if c.time or c.time_next_min or c.time_overlap then
		if lines_index[1] ~= nil then
		lines_index = mag.sort.index(subs, lines_index)
		end
	end
	if c.style or c.style_undefined then
	styles = mag.list.style(subs)
	end
	if c.char or c.char_screenline then
	stylesTable = load_styles(subs)
	meta        = karaskel.collect_head(subs)
		if meta.res_x == 0 then
		mag.show.log(1, c_lang.errorKey1)
		end
	end
	local punc_double_list = {}
	if c.punc or c.punc_double then
	if not mag.is.empty(c.punc_double_list) then punc_double_list = mag.string.split(c.punc_double_list, " ") end
	end
	local space_beforepunc_list = {}
	if c.space or c.space_beforepunc then
	if not mag.is.empty(c.space_beforepunc_list) then space_beforepunc_list = mag.string.split(c.space_beforepunc_list, " ") end
	end
	local space_afterpunc_list = {}
	if c.space or c.space_afterpunc then
	if not mag.is.empty(c.space_afterpunc_list) then space_afterpunc_list = mag.string.split(c.space_afterpunc_list, " ") end
	end
	local space_requiredpunc_list = {}
	if c.space or c.space_requiredpunc then
	if not mag.is.empty(c.space_requiredpunc_list) then space_requiredpunc_list = mag.string.split(c.space_requiredpunc_list, " ") end
	end
	local punc_startline_list = {}
	if c.punc or c.punc_startline then
	if not mag.is.empty(c.punc_startline_list) then punc_startline_list = mag.string.split(c.punc_startline_list, " ") end
	end
	local punc_endline_list = {}
	if c.punc or c.punc_endline or c.punc_missing then
	if not mag.is.empty(c.punc_endline_list) then punc_endline_list = mag.string.split(c.punc_endline_list, " ") end
	end
	local punc_enclose_list = ""
	if not mag.is.empty(c.punc_enclose_list) then
		for _, punc in pairs(mag.string.split(c.punc_enclose_list, " ")) do
		punc_enclose_list = punc_enclose_list..convert_specials(mag.convert.esc(punc))
		end
	end
	if c.view_report then
	for n = 1, 31 do mag.array.insert(report_counter, 0) end
	end
	mag.window.task(c_lang.progressKey1)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	passed       = false
	index        = lines_index[i]
	line         = subs[index]
	local result = ""
	local check  = ""
	local prev_line, strip_line, strip_line2, text_len, temp_line
	if lines_index[i - 1] ~= nil then
	prev_line   = subs[lines_index[i - 1]]
	end
	strip_line  = mag.strip.bracket(line.text)
	strip_line2 = strip_special(strip_line)
		if c.time or c.time_min or c.time_max or c.time_next_min or c.time_cps or c.time_overlap then
		local dur
			if line.end_time > line.start_time then
			dur = (line.end_time - line.start_time) / 10
			else
			dur = 0
			end
			if c.time or c.time_min then
				if dur < c.time_min_value then
				if c.view_report then report_counter[1] = report_counter[1] + 1 end
				check = mag.string.combine(check, mag.string.format(c_output_signs.key1, c.time_min_value - dur), "{%s}, {%s}")
				end
			end
			if c.time or c.time_max then
				if dur > c.time_max_value then
				if c.view_report then report_counter[2] = report_counter[2] + 1 end
				check = mag.string.combine(check, mag.string.format(c_output_signs.key2, dur - c.time_max_value), "{%s}, {%s]")
				end
			end
			if c.time or c.time_next_min then
				if lines_index[i + 1] ~= nil then
				local next_line = subs[lines_index[i + 1]]
					if next_line.start_time >= line.end_time then
					local dur2 = (next_line.start_time - line.end_time) / 10
						if not c.zero_in_diff or c.zero_in_diff and dur2 > 0 then
							if dur2 <= c.time_next_min_value then
							if c.view_report then report_counter[3] = report_counter[3] + 1 end
							check = mag.string.combine(check, mag.string.format(c_output_signs.key3, dur2), "{%s}, {%s}")
							end
						end
					end
				end
			end
			if c.time or c.time_cps or c.time_overlap then
				dur = dur * 10
				if dur > 0 then
					if c.time or c.time_cps then
					local cps
					text_len = len(line.text, c.space_and_punc_cps)
					cps      = text_len / dur
					cps      = mag.floor(cps * 1000)
						if cps > mag.n(c.time_cps_value) then
						if c.view_report then report_counter[4] = report_counter[4] + 1 end
						check = mag.string.combine(check, mag.string.format(c_output_signs.key4, cps), "{%s}, {%s}")
						end
					end
					if c.time or c.time_overlap then
					local overlap_count = 0
						for y = i, #lines_index do
						local overlap_line = subs[lines_index[y]]
						if overlap_line.start_time >= line.end_time then break end
							if overlap_line.start_time >= line.start_time and overlap_line.end_time >= line.start_time then
							overlap_count = overlap_count + 1
							end
						end
					overlap_count = overlap_count - 1
						if overlap_count > 0 then
						if c.view_report then report_counter[5] = report_counter[5] + 1 end
						check = mag.string.combine(check, mag.string.format(c_output_signs.key5, overlap_count), "{%s}, {%s}")
						end
					end
				end
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey1, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
		if c.char or c.char_max or c.char_range or c.char_screenline then
			if not mag.match(strip_line, "\\N") then
			text_len = len(line.text, c.space_and_punc_cc)
				if c.char or c.char_max then
					if text_len > mag.n(c.char_max_value) then
					if c.view_report then report_counter[6] = report_counter[6] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key6, text_len), "{%s}, {%s}")
					end
				end
			else
				if c.char or c.char_range then
				local split_breaking = mag.string.split(mag.gsub(strip_line, "\\h", " "), "\\N")
				local breaking_len   = {}
					for b = 1, #split_breaking do
					mag.array.insert(breaking_len, len(split_breaking[b], c.space_and_punc_cc))
					end
				mag.sort.basic(breaking_len)
					if breaking_len[#breaking_len] > mag.n(c.char_range_value) then
					if c.view_report then report_counter[7] = report_counter[7] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key7, breaking_len[#breaking_len]), "{%s}, {%s}")
					end
				end
			end
			if c.char and meta.res_x > 0 or c.char_screenline and meta.res_x > 0 then
				if prev_line == nil or prev_line.style ~= line.style then
					for _, style in pairs(stylesTable) do
						if line.style == style.name then
						prev_style = style
						end
					end
				end
				local clines = count_lines(prev_style, strip_line, meta.res_x)
				if clines > 2 then
					if c.view_report then report_counter[8] = report_counter[8] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key25, clines, c_lang.line), "{%s}, {%s}")
				end
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey2, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
		if c.punc or c.punc_double or c.punc_startline or c.punc_endline or c.punc_missing then
			if not mag.is.empty(punc_enclose_list) then
			temp_line = mag.gsub(strip_line2, "["..punc_enclose_list.."]+", "")
			else
			temp_line = strip_line2
			end
			if c.punc or c.punc_startline then
				if #punc_startline_list > 0 then
				local startpunc = ""
					if mag.match(temp_line, "^[%s%p]+") then
					startpunc = mag.match(temp_line, "^[%s%p]+")
						for _, punc in pairs(punc_startline_list) do
						punc = convert_specials(punc)
						if startpunc == punc then passed = true end
						end
						if passed == false then
						if c.view_report then report_counter[10] = report_counter[10] + 1 end
						check = mag.string.combine(check, mag.string.format(c_output_signs.key29, startpunc), "{%s}, {%s}")
						end
					end
				end
			end
			if c.punc or c.punc_endline then
				if #punc_endline_list > 0 then
				local endpunc = ""
				passed        = false
					if mag.match(temp_line, "[%s%p]+$") then
					endpunc = mag.match(temp_line, "[%s%p]+$")
						for _, punc in pairs(punc_endline_list) do
						punc = convert_specials(punc)
						if endpunc == punc then passed = true end
						end
						if passed == false then
						if c.view_report then report_counter[11] = report_counter[11] + 1 end
						check = mag.string.combine(check, mag.string.format(c_output_signs.key30, endpunc), "{%s}, {%s}")
						end
					end
				end
			end
			if c.punc or c.punc_missing then
				if #punc_endline_list > 0 then
				local puncmissing = mag.match(temp_line, "[%s%p"..mag.array.concat(punc_endline_list).."]+$")
				passed            = false
					if not puncmissing then
					passed = true
					else
					puncmissing = mag.gsub(puncmissing, "%s", "")
					if mag.convert.len(puncmissing) == 0 then passed = true end
					end
					if passed == true then
					if c.view_report then report_counter[12] = report_counter[12] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key17, ".?"), "{%s}, {%s}")
					end
				end
			end
			if c.punc or c.punc_double then
				if #punc_double_list > 0 then
				temp_line = strip_line2
				local pis = false
					for _, punc in pairs(punc_double_list) do
						punc          = convert_specials(punc)
						local escpunc = mag.convert.esc(punc)
						if mag.match(temp_line, escpunc..escpunc) then
						if c.view_report then pis = true end
						check = mag.string.combine(check, mag.string.format(c_output_signs.key17, punc..punc), "{%s}, {%s}")
						end
						temp_line = mag.gsub(temp_line, escpunc, "")
					end
				if pis == true then report_counter[9] = report_counter[9] + 1 end
				end
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey3, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
		if c.space or c.space_double or c.space_breakline or c.space_line or c.space_beforepunc or c.space_afterpunc or c.space_requiredpunc then
			if c.space or c.space_double then
				if c.space or c.space_breakline then
				temp_line = strip_line
				temp_line = mag.gsub(temp_line, "%s\\N", " ")
				temp_line = mag.gsub(temp_line, "\\N%s", " ")
				temp_line = strip_special(temp_line)
				else
				temp_line = strip_line2
				end
			local space_count = mag.string.count(temp_line, "%s")
				if space_count > 0 then
				local space_list  = {}
				local space_info  = ""
					for z = 1, space_count do
					local space = mag.match(temp_line, "%s+")
						if space then
						mag.array.insert(space_list, mag.convert.len(mag.match(temp_line, "%s+")))
						end
					temp_line = mag.gsub(temp_line, "%s+", "", 1)
					end
					for x = 1, #space_list do
						if space_list[x] > 1 then
						space_info = mag.string.combine(space_info, mag.string.format(c_output_signs.key8, x, mag.n(space_list[x] - 1)), "{%s}, {%s}")
						end
					end
					if space_info ~= "" then
					if c.view_report then report_counter[13] = report_counter[13] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key9, space_info), "{%s}, {%s}")
					end
				end
			end
			if c.space or c.space_line then
				if mag.match(strip_line2, "^%s") and mag.match(strip_line2, "%s$") then
				if c.view_report then report_counter[14] = report_counter[14] + 1 end
				check = mag.string.combine(check, c_output_signs.key10, "{%s}, {%s}")
				elseif mag.match(strip_line2, "^%s") then
				if c.view_report then report_counter[15] = report_counter[15] + 1 end
				check = mag.string.combine(check, c_output_signs.key11, "{%s}, {%s}")
				elseif mag.match(strip_line2, "%s$") then
				if c.view_report then report_counter[16] = report_counter[16] + 1 end
				check = mag.string.combine(check, c_output_signs.key12, "{%s}, {%s}")
				end
			end
			if c.space or c.space_breakline then
				if mag.match(strip_line, "%s\\N%s") then
				if c.view_report then report_counter[17] = report_counter[17] + 1 end
				check = mag.string.combine(check, c_output_signs.key13, "{%s}, {%s}")
				elseif mag.match(strip_line, "%s\\N") then
				if c.view_report then report_counter[18] = report_counter[18] + 1 end
				check = mag.string.combine(check, c_output_signs.key14, "{%s}, {%s}")
				elseif mag.match(strip_line, "\\N%s") then
				if c.view_report then report_counter[19] = report_counter[19] + 1 end
				check = mag.string.combine(check, c_output_signs.key15, "{%s}, {%s}")
				end
			end
			if not mag.is.empty(punc_enclose_list) then
			temp_line = mag.gsub(strip_line2, "["..punc_enclose_list.."]+", "")
			else
			temp_line = strip_line2
			end
			temp_line = mag.gsub(temp_line, "^[%p%s]+", "")
			temp_line = mag.gsub(temp_line, "[%p%s]+$", "")
			if c.space or c.space_beforepunc then
				if #space_beforepunc_list > 0 then
					for _, punc in pairs(space_beforepunc_list) do
						punc_count = mag.string.count(temp_line, "%s"..mag.convert.esc(punc))
						if punc_count > 0 then
						if c.view_report then report_counter[20] = report_counter[20] + 1 end
						check = mag.string.combine(check, mag.string.format(c_output_signs.key17, " "..punc), "{%s}, {%s}")
						end
					end
				end
			end
			if c.space or c.space_afterpunc then
				if #space_afterpunc_list > 0 then
					for _, punc in pairs(space_afterpunc_list) do
						punc_count = mag.string.count(temp_line, mag.convert.esc(punc).."%s")
						if punc_count > 0 then
						if c.view_report then report_counter[21] = report_counter[21] + 1 end
						check = mag.string.combine(check, mag.string.format(c_output_signs.key17, punc.." "), "{%s}, {%s}")
						end
					end
				end
			end
			if c.space or c.space_requiredpunc then
				if #space_requiredpunc_list > 0 then
					for _, punc in pairs(space_requiredpunc_list) do
						temp_line, punc_count = mag.gsub(temp_line, mag.convert.esc(punc).."[^%s%p]", "")
						if punc_count > 0 then
						if c.view_report then report_counter[22] = report_counter[22] + 1 end
						check = mag.string.combine(check, mag.string.format(c_output_signs.key17, punc.." !"), "{%s}, {%s}")
						end
					end
				end
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey4, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
		if c.style or c.style_undefined or c.style_tsyntax or c.style_psyntax then
			if c.style or c.style_undefined then
				if prev_line ~= nil then
					if prev_line.style ~= line.style then
					undefined_style = false
					end
				end
				if not undefined_style then
					if not mag.array.search(styles, line.style) then
					undefined_style = true
					end
				end
				if undefined_style then
				if c.view_report then report_counter[23] = report_counter[23] + 1 end
				check = mag.string.combine(check, mag.string.format(c_output_signs.key18), "{%s}, {%s}")
				end
			end
			if c.style or c.style_tsyntax then
				if c.style or c.style_tsyntax then
				local tag_content = ""
				local lame_tag    = ""
				for content in mag.gmatch(line.text, "{([^}]+)}") do tag_content = tag_content.." "..content.." " end
				tag_content = remove_defaulttags(tag_content)
					if mag.match(tag_content, "\\\\") then
					if c.view_report then report_counter[26] = report_counter[26] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key17, "\\\\"), "{%s}, {%s}")
					end
					for _, tag in pairs(tag_list) do
					tag_content = mag.gsub(tag_content, "[^a-zA-Z0-9]"..tag,
						function(n)
							if mag.match(n, "\\") then
							return ""
							else
							lame_tag = mag.match(n, ".(%d?[a-z]+)")
							return mag.match(n, ".")
							end
						end
					)
					end
				local undefined_tag = mag.match(tag_content, "(\\%s*%d*["..mag.pattern.letter.."]+)")
					if undefined_tag then
					if c.view_report then report_counter[24] = report_counter[24] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key17, undefined_tag.."?"), "{%s}, {%s}")
					end
					if lame_tag ~= "" then
					if c.view_report then report_counter[25] = report_counter[25] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key17, lame_tag.."!"), "{%s}, {%s}")
					end
				end
			end
			if c.style or c.style_psyntax then
				if mag.match(line.text.."{", "{[^}]*{") then
				if c.view_report then report_counter[27] = report_counter[27] + 1 end
				check = mag.string.combine(check, c_output_signs.key26, "{%s}, {%s}")
				end
				if mag.match("}"..line.text, "}[^{]*}") then
				if c.view_report then report_counter[27] = report_counter[27] + 1 end
				check = mag.string.combine(check, c_output_signs.key27, "{%s}, {%s}")
				end
				if mag.match(line.text, "}%s*{") then
				if c.view_report then report_counter[28] = report_counter[28] + 1 end
				check = mag.string.combine(check, c_output_signs.key28, "{%s}, {%s}")
				end
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey5, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
		if c.karaoke or c.ktag_duration or c.ktag_space then
			if not mag.match(line.effect, "^template") and not mag.match(line.effect, "^code") and not line.comment then
				if c.karaoke or c.ktag_duration then
				local ldur = 0
					for kdur, ktext in mag.gmatch(line.text, "{[^{]-\\%s-[kK][of]?%s-(%d+)[^}]-}") do
					ldur = ldur + kdur
					end
					if ldur ~= 0 then
					ldur                = ldur * 10
					local line_duration = line.end_time - line.start_time
						if ldur ~= line_duration then
						if c.view_report then report_counter[29] = report_counter[29] + 1 end
							if ldur > line_duration then
							check = mag.string.combine(check, mag.string.format(c_output_signs.key19, (ldur - line_duration) / 10), "{%s}, {%s}")
							elseif ldur < line_duration then
							check = mag.string.combine(check, mag.string.format(c_output_signs.key20, mag.convert.positive(ldur - line_duration) / 10), "{%s}, {%s}")
							end
						end
					end
				end
				if c.karaoke or c.ktag_space then
				local kct = 0
				local kt  = ""
					for ktext in mag.gmatch(line.text.." {\\k0}", "{[^{]-\\%s-[kK][of]?%s-%d+[^}]-}([^{]*)") do
					kct = kct + 1
						if mag.match(ktext, "^%s.-%s%s$") then
						kt = mag.string.combine(kt, mag.string.format(c_output_signs.key21, kct), "{%s}, {%s}")
						elseif mag.match(ktext, "^%s") then
						kt = mag.string.combine(kt, mag.string.format(c_output_signs.key22, kct), "{%s}, {%s}")
						elseif mag.match(ktext, "%s%s$") then
						kt = mag.string.combine(kt, mag.string.format(c_output_signs.key23, kct), "{%s}, {%s}")
						elseif mag.match(ktext, "[^%s]$") then
						kt = mag.string.combine(kt, mag.string.format(c_output_signs.key24, kct), "{%s}, {%s}")
						end
					end
					if kt ~= "" then
					if c.view_report then report_counter[30] = report_counter[30] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key17, kt), "{%s}, {%s}")
					end
				end
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey6, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
		if result ~= "" then
		if not pcs then pcs = true end
		line.effect = mag.string.format("{%s} {%s}", c_lang.out, result)
		else
		line.effect = ""
		end
	subs[index] = line
	end
	if c.view_report and pcs then
	c_reported = false
	write_report(1,  5,  1, report_counter)
	write_report(6,  8,  2, report_counter)
	write_report(9,  12, 3, report_counter)
	write_report(13, 22, 4, report_counter)
	write_report(23, 28, 5, report_counter)
	write_report(29, 30, 6, report_counter)
	end
	mag.show.no_op(pcs)
	end

	function whichoneisbigger(val1,val2)
	if val1 > val2 then return val1 end
	return val2
	end

	c_reported = false

	function write_report(si,ei,hi,counter)
	local total_problem = 0
	local errors        = ""
	local error_header  = ""
	local line_break    = ""
	local max_digit     = 0
	for i = si, ei do
		if counter[i] > 0 then
		max_digit = whichoneisbigger(max_digit, mag.n(mag.convert.len(mag.s(counter[i]))))
		end
	end
	for i = si, ei do
		if counter[i] > 0 then
		total_problem = total_problem + counter[i]
		errors        = errors..line_break..mag.string.format(c_lang.key2, mag.string.wall("  ", max_digit - mag.convert.len(mag.s(counter[i]))), counter[i], c_lang["logKey"..i])
		line_break    = "\n"
		end
	end
	if errors ~= "" then
	error_header = mag.string.format(c_lang.key3,  c_lang["cModeListNameKey"..hi], total_problem)
	error_header = mag.string.format("{%1}\n{%2}", error_header,                   mag.string.wall("-", 114))
		if c_reported then
		error_header = "\n\n\n"..error_header
		end
		mag.show.basic_log(error_header.."\n"..errors, "nobreak")
		c_reported = true
	end
	end

	function add_macro1(subs,sel,act)
	local apply_items            = mag.list.full_apply(subs, sel, "comment")
	c.apply_lines1               = mag.array.search_apply(apply_items, c.apply_lines1)
	gui.main1.apply_lines1.items = apply_items
	gui.main2.apply_lines1.items = apply_items
	local ok, config
	repeat
	if ok == mag.convert.ascii(c_buttons1[4]) then
	mag.config.put(gui.main2)
	ok, config = mag.window.dialog(gui.main2, c_buttons2)
	else
	mag.config.put(gui.main1)
	ok, config = mag.window.dialog(gui.main1, c_buttons1)
	end
	mag.config.take(config)
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply_lines1 ~= mag.window.lang.message("select") or ok ~= mag.convert.ascii(c_buttons1[1]) and ok ~= mag.convert.ascii(c_buttons1[4]) and ok ~= mag.convert.ascii(c_buttons2[3])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	check_lines(subs, sel)
	elseif ok == mag.convert.ascii(c_buttons1[2]) then
	add_macro4(subs, sel)
	elseif ok == mag.convert.ascii(c_buttons1[3]) then
	add_macro5(subs, sel)
	elseif ok == mag.convert.ascii(c_buttons2[1]) then
	add_macro6(subs, sel, "fix")
	elseif ok == mag.convert.ascii(c_buttons2[2]) then
	add_macro6(subs, sel, "fixall")
	elseif ok == mag.convert.ascii(c_buttons1[5]) then
	return add_macro2(subs, sel, act)
	elseif ok == mag.convert.ascii(c_buttons1[6]) then
	return add_macro3(subs, sel, act)
	elseif ok == mag.convert.ascii(c_buttons1[7]) then
	mag.window.task(c_lang.progressKey5)
	mag.show.log(c_lang.key4)
	end
	end

	function count_lines(style,line,metawidth)
	metawidth = metawidth * 0.95
	local lines = mag.string.split(line, '\\N')
	local count_lines = 0
	for _, line in pairs(lines) do
	local width = aegisub.text_extents(style,line)
		if width > metawidth then
		count_lines = count_lines + (math.ceil(width/metawidth + 0.05))
		else
		count_lines = count_lines + 1
		end
	end
	return count_lines
	end

	function load_styles(subs)
	local styles = {}
	for i = 1, #subs do
		if subs[i].class == "style" then
		mag.array.insert(styles, subs[i])
		elseif subs[i].class == "dialogue" then
		break
		end
	end
	return styles
	end

	function add_macro2(subs,sel,act)
	mag.window.task(c_lang.progressKey3)
	local index
	for i = act - 1, 1, -1 do
	local line = subs[i]
		if line.class == "dialogue" and mag.match(line.effect, mag.convert.esc(c_lang.out)) then
		index = i
		break
		end
	end
	if index then return {index} else mag.show.log(1, c_lang.key1) end
	end

	function add_macro3(subs,sel,act)
	mag.window.task(c_lang.progressKey4)
	local index
	for i = act + 1, #subs do
	local line = subs[i]
		if mag.match(line.effect, mag.convert.esc(c_lang.out)) then
		index = i
		break
		end
	end
	if index then return {index} else mag.show.log(1, c_lang.key1) end
	end

	function add_macro4(subs,sel)
	local line, index
	local pcs         = false
	local lines_index = mag.line.index(subs, sel, mag.window.lang.message("all_lines"), false, false)
	mag.window.task(c_lang.progressKey2)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	index = lines_index[i]
	line  = subs[index]
		if mag.match(line.effect, mag.convert.esc(c_lang.out)) then
		if not pcs then pcs = true end
		line.effect = ""
		subs[index] = line
		end
	end
	mag.show.no_op(pcs, "effect", c_lang.out)
	end

	function add_macro5(subs,sel)
	local line, index
	local line_styles  = {}
	local meta, styles = karaskel.collect_head(subs, false)
	local fonts        = {}
	local all_msg      = {summary = {}, linetypes = {}, styleissues = {}, unistalledfonts = {}, subtitleinfo = {}, results = {}}
	local actors       = {}
	local msg          = ""
	local symbols      = {ok = "✔", danger = "✖", warning = "⚑", checked = "◉", unchecked = "○"}
	local count        = {
		emptyline             = 0,
		commentline           = 0,
		commentblock          = 0,
		normalline            = 0,
		templateline          = 0,
		generatedline         = 0,
		textline              = 0,
		shapeline             = 0,
		totalfont             = 0,
		totalstyle            = 0,
		totalline             = 0,
		totalkaraoke          = 0,
		totalactor            = 0,
		uniqueactor           = 0,
		signline              = 0,
		uninstalledfont       = 0,
		unusedstyle           = {},
		undefinedstyle        = {},
		uninstalledstyle      = {}
	}
	local lines_index = mag.line.index(subs, sel, mag.window.lang.message("all_lines"), false, false)
	mag.window.task(c_lang.progressKey6)
	count.totalline = #lines_index
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	index = lines_index[i]
	line  = subs[index]
		if mag.is.line.code(line) or mag.is.line.template(line) or mag.is.line.karaoke(line) then
		count.templateline = count.templateline + 1
		elseif not mag.is.line.comment(line) and mag.match(line.effect, "fx") then
		count.generatedline = count.generatedline + 1
		elseif mag.is.line.comment(line) then
		count.commentline = count.commentline + 1
		elseif mag.is.line.empty(line) then
		count.emptyline = count.emptyline + 1
		elseif not mag.is.empty(line.actor) then
		count.totalactor = count.totalactor + 1
			if actors[line.actor] == nil then
			actors[line.actor] = ""
			count.uniqueactor  = count.uniqueactor + 1
			end
		elseif mag.match(line.text, "\\%s*pos%(") or mag.match(line.text, "\\%s*move%(") then
		count.signline = count.signline + 1
		else
		count.normalline = count.normalline + 1
		end
	local strip_line = mag.strip.all(line.text)
		if mag.match(strip_line, "m %-?%d+ %-?%d+") then
		count.shapeline = count.shapeline + 1
		else
		count.textline = count.textline + 1
		end
		if mag.match(line.text, "{[^\\]*}") then count.commentblock = count.commentblock + 1 end
		if line_styles[line.style] == nil then line_styles[line.style] = "" end
	local fontname = mag.match(line.text, "\\fn([%w%s]+)[\\}]")
		if fontname ~= nil then
		fontname = mag.trim.all(fontname)
			if fontname ~= c_defaultfont and fonts[fontname] == nil then
			fonts[fontname] = {style = false, inline = true}
			count.totalfont = count.totalfont + 1
			end
		end
	end
	count.totalkaraoke = count.templateline + count.generatedline
	for style, value in pairs(styles) do
		if mag.is.array(value) and style == value["name"] then
		count.totalstyle = count.totalstyle + 1
			if value["fontname"] ~= c_defaultfont then
				if fonts[value["fontname"]] == nil then
				fonts[value["fontname"]] = {style = true, inline = false}
				count.totalfont          = count.totalfont + 1
				elseif fonts[value["fontname"]].style == false then
				fonts[value["fontname"]].style = true
				count.totalfont                = count.totalfont + 1
				end
			end
		end
	end
	local max_digit = mag.convert.len(mag.s(count.totalline))
	for _, val in pairs({
		{["key"] = "textline",     ["lang"] = 3},
		{["key"] = "shapeline",    ["lang"] = 4},
		{["key"] = "commentblock", ["lang"] = 5},
		{["key"] = "uniqueactor",  ["lang"] = 32},
		{["key"] = "totalstyle",   ["lang"] = 7},
		{["key"] = "totalfont",    ["lang"] = 27},
	}) do
		if count[val.key] > 0 then
		 mag.array.insert(all_msg["summary"], mag.string.format(c_lang["key2"], mag.string.wall("  ", max_digit - mag.convert.len(mag.s(count[val.key]))), count[val.key], c_lang["staKey"..val.lang]))
		end
	end
	local reorder = {}
	for _, val in pairs({
		{["key"] = "commentline",   ["lang"] = 1},
		{["key"] = "emptyline",     ["lang"] = 2},
		{["key"] = "templateline",  ["lang"] = 9},
		{["key"] = "generatedline", ["lang"] = 10},
		{["key"] = "normalline",    ["lang"] = 11},
		{["key"] = "signline",      ["lang"] = 20},
		{["key"] = "totalactor",    ["lang"] = 33}
	}) do
		if count[val.key] > 0 then
		local percent = calc_percent(count[val.key], count.totalline)
		mag.array.insert(reorder, {index = count[val.key], value = mag.string.format(c_lang["staFormat1"], progresschart(percent), count[val.key], percent, c_lang["staKey"..val.lang])})
		end
	end
	mag.sort.bubble2(reorder)
	reorder = mag.sort.reverse(reorder)
	for _, order in pairs(reorder) do mag.array.insert(all_msg["linetypes"], order.value) end
	for style, value in pairs(styles) do
		if mag.is.array(value) and style == value["name"] then
			if line_styles[style] == nil then
			mag.array.insert(count.unusedstyle, style)
			else
			line_styles[style] = nil
			end
		local fontname = value.fontname
			if fonts[fontname] ~= nil then
				if isfontinstalled(subs, fontname) then
				fonts[fontname] = nil
				else
				mag.array.insert(count.uninstalledstyle, style)
				end
			end
		end
	end
	for style in pairs(line_styles) do mag.array.insert(count.undefinedstyle, style) end
	max_digit = mag.n(mag.convert.len(mag.s(count.totalstyle)))
	for _, val in pairs({
		{["key"] = "unusedstyle",      ["lang"] = 12},
		{["key"] = "undefinedstyle",   ["lang"] = 13},
		{["key"] = "uninstalledstyle", ["lang"] = 14}
	}) do
		if #count[val.key] > 0 then
		msg = mag.string.format(c_lang["key2"], mag.string.wall("  ", max_digit - mag.convert.len(mag.s(#count[val.key]))), #count[val.key], c_lang["staKey"..val.lang])
		for _, style in pairs(count[val.key]) do msg = msg.."\n"..mag.string.wall("  ", max_digit).."     ┗  "..style end
		mag.array.insert(all_msg["styleissues"], msg)
		end
	end
	for font in pairs(fonts) do
		if isfontinstalled(subs, font) then
		fonts[font] = nil
		else
		count.uninstalledfont = count.uninstalledfont + 1
		end
	end
	if count.uninstalledfont > 0 then
		for font, state in pairs(fonts) do
		msg = "- "..font.."\n"
			if state.style then
			msg = msg.."   "..symbols.checked.." "..c_lang.staKey28
			else
			msg = msg.."   "..symbols.unchecked.." "..c_lang.staKey28
			end
			if state.inline == true then
			msg = msg.."     "..symbols.checked.." "..c_lang.staKey29
			else
			msg = msg.."     "..symbols.unchecked.." "..c_lang.staKey29
			end
		mag.array.insert(all_msg["unistalledfonts"], msg)
		end
	end
	for _, val in pairs({
		{["key"] = "title",                ["title"] = "Title"},
		{["key"] = "original script",      ["title"] = "Original script"},
		{["key"] = "original translation", ["title"] = "Translation"},
		{["key"] = "original editing",     ["title"] = "Editing"},
		{["key"] = "original timing",      ["title"] = "Timing"},
		{["key"] = "synch point",          ["title"] = "Synch point"},
		{["key"] = "script updated by",    ["title"] = "Updated by"},
		{["key"] = "update details",       ["title"] = "Update details"}
	}) do
		if meta[val.key] ~= nil and not mag.is.empty(meta[val.key]) then
		mag.array.insert(all_msg["subtitleinfo"], val.title..":"..mag.string.wall("\t", mag.ceil(32 - mag.convert.len(val.title)) / 16)..meta[val.key])
		end
	end
	local video_meta = aegisub.project_properties()
	if not mag.is.empty(video_meta["audio_file"]) or not mag.is.empty(video_meta["video_file"]) then
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.warning.." ", c_lang.staKey21))
	end
	if count.commentline > 0 then
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.warning.." ", c_lang.staKey24))
	end
	if count.emptyline > 0 then
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.warning.." ", c_lang.staKey25))
	end
	if count.commentblock > 0 then
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.warning.." ", c_lang.staKey26))
	end
	if meta["wrapstyle"] == nil or meta["wrapstyle"] ~= "0" then
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.warning.." ", c_lang.staKey19))
	end
	if meta["ycbcr matrix"] == nil or (meta["ycbcr matrix"] ~= "None" and ((meta.res_y < 720 and not mag.match(meta["ycbcr matrix"], "601")) or (meta.res_y >= 720 and not mag.match(meta["ycbcr matrix"], "709")))) then
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.danger, mag.string.format(c_lang.staKey16, 0)))
	else
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.ok, mag.string.format(c_lang.staKey16, 2)))
	end
	if meta["scaledborderandshadow"] ~= nil and meta["scaledborderandshadow"] == "yes" then
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.ok, mag.string.format(c_lang.staKey18, 2)))
	else
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.danger, mag.string.format(c_lang.staKey18, 0)))
	end
	if #count.uninstalledstyle > 0 or count.uninstalledfont > 0 then
	msg = mag.string.format(c_lang.staFormat2, symbols.danger, mag.string.format(c_lang.staKey15, 0))
	if count.uninstalledfont > 0 then msg = msg.." "..mag.string.format(c_lang.staKey30, count.uninstalledfont) end
	mag.array.insert(all_msg["results"], msg)
	else
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.ok, mag.string.format(c_lang.staKey15, 2)))
	end
	if #count.unusedstyle > 0 then
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.danger, mag.string.format(c_lang.staKey22, 0)))
	else
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.ok, mag.string.format(c_lang.staKey22, 2)))
	end
	if #count.undefinedstyle > 0 then
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.danger, mag.string.format(c_lang.staKey23, 0)))
	else
	mag.array.insert(all_msg["results"], mag.string.format(c_lang.staFormat2, symbols.ok, mag.string.format(c_lang.staKey23, 2)))
	end
	local firstrow = false
	for _, val in pairs({
		{["key"] = "summary",         ["lang"] = 1},
		{["key"] = "linetypes",       ["lang"] = 2},
		{["key"] = "styleissues",     ["lang"] = 3},
		{["key"] = "unistalledfonts", ["lang"] = 5},
		{["key"] = "subtitleinfo",    ["lang"] = 6},
		{["key"] = "results",         ["lang"] = 4}
	}) do
		if #all_msg[val.key] > 0 then
		if firstrow == true then mag.show.basic_log("\n\n\n", "nobreak") end
		mag.show.basic_log(c_lang["staHeader"..val.lang].."\n"..mag.string.wall("-", 114), "nobreak")
		for _, line in pairs(all_msg[val.key]) do mag.show.basic_log("\n"..line, "nobreak") end
		end
	if firstrow == false then firstrow = true end
	end
	end

	c_test_style  = ""
	c_test_width  = 0
	c_defaultfont = "Arial"

	function isfontinstalled(subs,fontname)
	local line, index
	local testtext = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
	if c_test_style == "" then
		for k = 1, #subs do
		mag.window.progress(k, #subs)
		local cancel = aegisub.progress.is_cancelled()
		if cancel then break end
		index = k
		line  = subs[index]
			if line.class == "style" then
			c_test_style = line
			break
			end
		end
	end
	if c_test_width == 0 then
	c_test_style.fontname = c_defaultfont
	c_test_width          = aegisub.text_extents(c_test_style, testtext)
	end
	c_test_style.fontname = fontname
	local fontwidth       = aegisub.text_extents(c_test_style, testtext)
	return c_test_width ~= fontwidth
	end

	function add_macro6(subs,sel,action)
	local line, index
	local pcs            = false
	local lines_index    = mag.line.index(subs, sel, c.apply_lines1, false, false)
	local deleted        = {}
	local counter        = {breakline = 0, linespace = 0, commentblock = 0, block = 0, emptyline = 0, commentline = 0, unusedstyle = 0}
	local deleted_styles = {}
	mag.window.task(c_lang.progressKey7)
	if c.delete_unusedstyle or action == "fixall" then
		for k = 1, #subs do
		mag.window.progress(k, #subs)
		local cancel = aegisub.progress.is_cancelled()
		if cancel then break end
		index = k
		line  = subs[index]
			if line.class == "style" then
			deleted_styles[line.name] = index
			elseif line.class == "dialogue" then
				if deleted_styles[line.style] ~= nil then
				deleted_styles[line.style] = nil
				end
			end
		end
	end
	for _, index in pairs(deleted_styles) do
	if not pcs then pcs = true end
	mag.array.insert(deleted, index)
	counter.unusedstyle = counter.unusedstyle + 1
	end
	if #deleted > 0 then mag.sort.bubble(deleted) end
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	index        = lines_index[i]
	line         = subs[index]
	strip_line   = mag.strip.bracket(line.text)
		if (c.delete_commentline or action == "fixall") and mag.is.line.comment(line) then
		if not pcs then pcs = true end
		mag.array.insert(deleted, index)
		counter.commentline = counter.commentline + 1
		elseif (c.delete_emptyline or action == "fixall") and mag.is.line.empty(line) then
		if not pcs then pcs = true end
		mag.array.insert(deleted, index)
		counter.emptyline = counter.emptyline + 1
		else
			if (c.clear_breaklinespace or action == "fixall") and (mag.match(strip_line, "\\N%s") or mag.match(strip_line, "%s\\N")) then
			if not pcs then pcs = true end
			line.text         = mag.gsub(line.text, "%s*\\N%s*", "\\N")
			counter.breakline = counter.breakline + 1
			end
			if (c.clear_linespace or action == "fixall") and (mag.match(strip_line, "^%s") or mag.match(strip_line, "%s$")) then
			if not pcs then pcs = true end
			line.text         = mag.trim.all(line.text)
			counter.linespace = counter.linespace + 1
			end
			if (c.remove_commentblock or action == "fixall") and mag.match(line.text, "{[^\\}]+}") then
			if not pcs then pcs = true end
			line.text            = mag.gsub(line.text, "{[^\\}]+}", "")
			counter.commentblock = counter.commentblock + 1
			end
			if (c.merge_block or action == "fixall") and mag.match(line.text, "%s*}%s*{%s*") then
			if not pcs then pcs = true end
			line.text     = mag.gsub(line.text, "%s*}%s*{%s*", "")
			counter.block = counter.block + 1
			end
		end
	if pcs then subs[index] = line end
	end
	if #deleted > 0 then mag.line.delete(subs, deleted) end
	if pcs and c.view_report then
		for _, val in pairs({
			{["key"] = "commentline",   ["lang"] = 31},
			{["key"] = "emptyline",     ["lang"] = 32},
			{["key"] = "breakline",     ["lang"] = 33},
			{["key"] = "linespace",     ["lang"] = 34},
			{["key"] = "commentblock",  ["lang"] = 35},
			{["key"] = "block",         ["lang"] = 36},
			{["key"] = "unusedstyle",   ["lang"] = 37}
		}) do
			if counter[val.key] > 0 then
			mag.show.log(mag.string.format(c_lang.key5, c_lang["guiLabelKey"..val.lang], counter[val.key]))
			end
		end
	end
	mag.show.no_op(pcs)
	end

	function progresschart(percent)
	percent     = mag.ceil(percent)
	local space = ""
	if mag.n(percent) > 0 then space = " " end
	return mag.string.wall("▎", percent)..space
	end

	function calc_percent(a,b) return mag.gsub((a / b) * 100, "%.(%d%d)%d+", ".%1") end

	function check_macro1(subs,sel,act)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro1, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	return fee
	end
	end

	function check_macro2(subs,sel,act)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro2, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	return fee
	end
	end

	function check_macro3(subs,sel,act)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro3, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro4(subs,sel)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro4, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function mag_redirect_gui()
	local mag_module_link = "https://github.com/magnum357i/Magnum-s-Aegisub-Scripts"
	local k = aegisub.dialog.display({{class = "label", label = mag_gui_message}}, {c_lang.module_yes, c_lang.module_no})
	if k == c_lang.module_yes then os.execute("start "..mag_module_link) end
	end

	if mag_import then
		if mag_module_version:gsub("%.", "") < script_mag_version:gsub("%.", "") then
		mag_gui_message = string.format(c_lang.module_incompatible, script_mag_version)
		aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
		else
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey4,                      check_macro1)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey5,                      check_macro4)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1.."/"..c_lang.tabKey2, check_macro2)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1.."/"..c_lang.tabKey3, check_macro3)
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Çevirmen Bilgisi"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Translator Info"}
	}
	local lang_list        = {}
	local script_name_list = {}
	for i = 1, #langs do
	lang_list[langs[i].lang_key]        = langs[i].lang_name
	script_name_list[langs[i].lang_key] = langs[i].script_name
	end
	if lang == langs[1].lang_key then
	in_lang["module_incompatible"] = "Mag modülünün kurulu sürümü bu lua dosyası ile uyumsuz!\n\nModül dosyasının en az \"%s\" sürümü veya daha üstü gerekiyor.\n\n\nŞimdi indirme sayfasına gitmek ister misiniz?"
	in_lang["module_not_found"]    = "Mag modülü bulunamadı!\n\nBu lua dosyasını kullanmak için Mag modülünü indirip Aegisub programı kapalıyken\n\"Aegisub/automation/include/\" dizinine taşımanız gerekiyor.\n\n\nŞimdi indirme sayfasına gitmek ister misiniz?"
	in_lang["module_yes"]          = "Git"
	in_lang["module_no"]           = "Daha Sonra"
	in_lang["s_name"]              = langs[1].script_name
	in_lang["s_desc"]              = "Çevirmen bilgisini sosyal medya adresleriyle birlikte yazmak için tasarlanmıştır."
	in_lang["buttonKey1"]          = "Uygula"
	in_lang["buttonKey2"]          = "Stil"
	in_lang["buttonKey3"]          = "Yapılandırma"
	in_lang["buttonKey4"]          = "Kapat"
	in_lang["buttonKey5"]          = "Geri dön"
	in_lang["guiLabelKey1"]        = "#{%s} ÇEVİRMEN"
	in_lang["guiLabelKey2"]        = "Rumuz:"
	in_lang["guiLabelKey3"]        = "Twitter:"
	in_lang["guiLabelKey4"]        = "Discord:"
	in_lang["guiLabelKey5"]        = "Site:"
	in_lang["guiLabelKey6"]        = "AYARLAR"
	in_lang["guiLabelKey7"]        = "Köşe:"
	in_lang["guiLabelKey8"]        = "Şekil rengi:"
	in_lang["guiLabelKey9"]        = "Başlık yazısı:"
	in_lang["guiLabelKey10"]       = "Başlangıç animasyonunu göster"
	in_lang["guiLabelKey11"]       = "Bitiş animasyonunu göster"
	in_lang["guiLabelKey12"]       = "Yazı tipi adı:"
	in_lang["guiLabelKey13"]       = "Rumuz puntosu:"
	in_lang["guiLabelKey14"]       = "İletişim adreslerinin puntosu:"
	in_lang["guiLabelKey15"]       = "KENAR"
	in_lang["guiLabelKey16"]       = "Yumuşaklık:"
	in_lang["guiLabelKey17"]       = "Kalınlık:"
	in_lang["guiLabelKey18"]       = "BOŞLUKLAR"
	in_lang["guiLabelKey19"]       = "Dikey yan boşluk:"
	in_lang["guiLabelKey20"]       = "Yatay yan boşluk:"
	in_lang["guiLabelKey21"]       = "İç boşluk:"
	in_lang["guiLabelKey22"]       = "Şekil uzaklığı:"
	in_lang["guiLabelKey23"]       = "ETİKET DEĞERLERİ"
	in_lang["guiLabelKey24"]       = "Şekil şeffaflığı:"
	in_lang["guiLabelKey25"]       = "Fad değeri:"
	in_lang["guiLabelKey26"]       = "Blur değeri:"
	in_lang["guiLabelKey27"]       = "Yazı rengi:"
	in_lang["guiLabelKey28"]       = "SATIR ÖZELLİKLERİ"
	in_lang["guiLabelKey29"]       = "Katman:"
	in_lang["cornerNameKey1"]      = "Üst - Sol"
	in_lang["cornerNameKey2"]      = "Üst - Sağ"
	in_lang["cornerNameKey3"]      = "Alt - Sol"
	in_lang["cornerNameKey4"]      = "Alt - Sağ"
	in_lang["headertext"]          = "ÇEVİRİ"
	in_lang["effectname"]          = "görevli bilgisi"
	in_lang["actorformat"]         = "{%s}: {%s}"
	in_lang["actorKey1"]           = "şekil"
	in_lang["actorKey2"]           = "rumuz"
	in_lang["actorKey3"]           = "twitter yazısı"
	in_lang["actorKey4"]           = "twitter logosu"
	in_lang["actorKey5"]           = "discord yazısı"
	in_lang["actorKey6"]           = "discord logosu"
	in_lang["actorKey7"]           = "site yazısı"
	in_lang["actorKey8"]           = "site logosu"
	in_lang["actorKey9"]           = "başlık yazısı"
	in_lang["actorKey10"]          = "şekil kenarlığı"
	in_lang["errorKey1"]           = "En az bir rumuz girin."
	in_lang["errorKey2"]           = "Başlık genişliği çok fazla."
	in_lang["errorKey3"]           = "Stil: Eğiklik ve döndürme kullanmayın."
	in_lang["warningKey1"]         = "Stil: Genişlik veya yükseklik oranı, orijinalden (100) farklı."
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Designed to write translator data with social media accounts."
	in_lang["buttonKey1"]          = "Apply"
	in_lang["buttonKey2"]          = "Style"
	in_lang["buttonKey3"]          = "Config"
	in_lang["buttonKey4"]          = "Close"
	in_lang["buttonKey5"]          = "Back"
	in_lang["guiLabelKey1"]        = "#{%s} TRANSLATOR"
	in_lang["guiLabelKey2"]        = "Nickname:"
	in_lang["guiLabelKey3"]        = "Twitter:"
	in_lang["guiLabelKey4"]        = "Discord:"
	in_lang["guiLabelKey5"]        = "Website:"
	in_lang["guiLabelKey6"]        = "SETTINGS"
	in_lang["guiLabelKey7"]        = "Corner:"
	in_lang["guiLabelKey8"]        = "Shape color:"
	in_lang["guiLabelKey9"]        = "Header text:"
	in_lang["guiLabelKey10"]       = "Show the starting animation"
	in_lang["guiLabelKey11"]       = "Show the ending animation"
	in_lang["guiLabelKey12"]       = "Font name:"
	in_lang["guiLabelKey13"]       = "Size of nickname:"
	in_lang["guiLabelKey14"]       = "Size of social links:"
	in_lang["guiLabelKey15"]       = "BORDER"
	in_lang["guiLabelKey16"]       = "Round:"
	in_lang["guiLabelKey17"]       = "Thickness:"
	in_lang["guiLabelKey18"]       = "SPACES"
	in_lang["guiLabelKey19"]       = "Vertical margin:"
	in_lang["guiLabelKey20"]       = "Horizontal margin:"
	in_lang["guiLabelKey21"]       = "Padding:"
	in_lang["guiLabelKey22"]       = "Shape distance:"
	in_lang["guiLabelKey23"]       = "TAG VALUES"
	in_lang["guiLabelKey24"]       = "All-shape opacity:"
	in_lang["guiLabelKey25"]       = "Fad value:"
	in_lang["guiLabelKey26"]       = "Blur value:"
	in_lang["guiLabelKey27"]       = "Text color:"
	in_lang["guiLabelKey28"]       = "LINE PROPERTIES"
	in_lang["guiLabelKey29"]       = "Layer number:"
	in_lang["cornerNameKey1"]      = "Top - Left"
	in_lang["cornerNameKey2"]      = "Top - Right"
	in_lang["cornerNameKey3"]      = "Bottom - Left"
	in_lang["cornerNameKey4"]      = "Bottom - Right"
	in_lang["headertext"]          = "TRANSLATE"
	in_lang["effectname"]          = "staff info"
	in_lang["actorformat"]         = "{%s}: {%s}"
	in_lang["actorKey1"]           = "shape"
	in_lang["actorKey2"]           = "nickname"
	in_lang["actorKey3"]           = "twitter text"
	in_lang["actorKey4"]           = "twitter logo"
	in_lang["actorKey5"]           = "discord text"
	in_lang["actorKey6"]           = "discord logo"
	in_lang["actorKey7"]           = "site text"
	in_lang["actorKey8"]           = "site logo"
	in_lang["actorKey9"]           = "header text"
	in_lang["actorKey10"]          = "shape border"
	in_lang["errorKey1"]           = "Type one nick at least."
	in_lang["errorKey2"]           = "Too much the width of the header text."
	in_lang["errorKey3"]           = "Style: Please do not use italic and rotation."
	in_lang["warningKey1"]         = "Style: The scale of width or height are not 100."
	end
	return in_lang, lang_list, script_name_list
	end

	c_lang_switch      = "en"
	c_lang,
	c_lang_list,
	c_script_name_list = lang_switch_keys(c_lang_switch)

	script_name           = c_lang.s_name
	script_description    = c_lang.s_desc
	script_version        = "1.2.0"
	script_author         = "Magnum357"
	script_mag_version    = "1.1.4.9"
	script_file_name      = "mag.translator_info"
	script_file_ext       = ".lua"

	include_unicode       = true
	include_clipboard     = true
	include_karaskel      = true
	mag_import, mag       = pcall(require, "mag")

	if mag_import then
	mag.lang              = c_lang_switch

	c_lock_gui            = false
	c_buttons1            = {c_lang.buttonKey1, c_lang.buttonKey2, c_lang.buttonKey3, c_lang.buttonKey4}
	c_buttons2            = {c_lang.buttonKey5}
	c_corners             = {c_lang.cornerNameKey1, c_lang.cornerNameKey2, c_lang.cornerNameKey3, c_lang.cornerNameKey4}

	c                     = {}
	c.vertical_margin     = 50
	c.horizontal_margin   = 50
	c.padding             = 10
	c.border_thickness    = 12
	c.header_text         = c_lang.headertext
	c.shape_space         = 6
	c.text_color          = "FFFFFF"
	c.shape_color         = "000000"
	c.round               = 5
	c.allshape_alphavalue = 90
	c.fadvalue            = 300
	c.blurvalue           = "0.3"
	c.linenumber          = 5
	c.translator1_name    = ""
	c.translator1_twitter = ""
	c.translator1_discord = ""
	c.translator1_site    = ""
	c.translator2_name    = ""
	c.translator2_twitter = ""
	c.translator2_discord = ""
	c.translator2_site    = ""
	c.translator3_name    = ""
	c.translator3_twitter = ""
	c.translator3_discord = ""
	c.translator3_site    = ""
	c.fontname            = "Falling Sky"
	c.nicksize            = 50
	c.sociallinkssize     = 22
	c.corner              = c_lang.cornerNameKey1
	c.aonstart           = true
	c.aonend             = true

	gui                 = {
		main1 = {
		settingslabel       = {class = "label",                                                        x = 0, y = 0,  width = 5, height = 1, label = c_lang.guiLabelKey6},
		cornerlabel         = {class = "label",                                                        x = 0, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey7},
		corner              = {class = "dropdown",  name = "corner",                                   x = 1, y = 1,  width = 4, height = 1, items = c_corners},
		shape_colorlabel    = {class = "label",                                                        x = 0, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey8},
		shape_color         = {class = "color",     name = "shape_color",                              x = 1, y = 2,  width = 4, height = 1},
		text_colorlabel     = {class = "label",                                                        x = 0, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey27},
		text_color          = {class = "color",     name = "text_color",                               x = 1, y = 3,  width = 4, height = 1},
		header_textlabel    = {class = "label",                                                        x = 0, y = 4,  width = 1, height = 1, label = c_lang.guiLabelKey9},
		header_text         = {class = "edit",      name = "header_text",                              x = 1, y = 4,  width = 4, height = 1},
		aonstart            = {class = "checkbox",  name = "aonstart",                                 x = 0, y = 5,  width = 5, height = 1, label = c_lang.guiLabelKey10},
		aonend              = {class = "checkbox",  name = "aonend",                                   x = 0, y = 6,  width = 5, height = 1, label = c_lang.guiLabelKey11},
		},
		main2 = {
		                       {class = "label",                                                       x = 0, y = 0,  width = 1, height = 1, label = c_lang.guiLabelKey12},
		fontname             = {class = "edit",     name = "fontname",                                 x = 1, y = 0,  width = 1, height = 1},
		                       {class = "label",                                                       x = 0, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey13},
		nicksize             = {class = "intedit",  name = "nicksize",            min = 10, max = 200, x = 1, y = 1,  width = 1, height = 1},
		                       {class = "label",                                                       x = 0, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey14},
		sociallinkssize      = {class = "intedit",  name = "sociallinkssize",     min = 10, max = 200, x = 1, y = 2,  width = 1, height = 1},
		},
		main3 = {
		                       {class = "label",                                                       x = 0, y = 0,  width = 1, height = 1, label = c_lang.guiLabelKey15},
		                       {class = "label",                                                       x = 0, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey16},
		round                = {class = "intedit",  name = "round",               min = 0, max = 30,   x = 1, y = 1,  width = 1, height = 1},
		                       {class = "label",                                                       x = 0, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey17},
		border_thickness     = {class = "intedit",  name = "border_thickness",    min = 5, max = 100,  x = 1, y = 2,  width = 1, height = 1},
		                       {class = "label",                                                       x = 0, y = 4,  width = 1, height = 1, label = c_lang.guiLabelKey18},
		                       {class = "label",                                                       x = 0, y = 5,  width = 1, height = 1, label = c_lang.guiLabelKey19},
		vertical_margin      = {class = "intedit",  name = "vertical_margin",                          x = 1, y = 5,  width = 1, height = 1},
		                       {class = "label",                                                       x = 0, y = 6,  width = 1, height = 1, label = c_lang.guiLabelKey20},
		horizontal_margin    = {class = "intedit",  name = "horizontal_margin",                        x = 1, y = 6,  width = 1, height = 1},
		                       {class = "label",                                                       x = 0, y = 7,  width = 1, height = 1, label = c_lang.guiLabelKey21},
		padding              = {class = "intedit",  name = "padding",             min = 3, max = 100,  x = 1, y = 7,  width = 1, height = 1},
		                       {class = "label",                                                       x = 0, y = 8,  width = 1, height = 1, label = c_lang.guiLabelKey22},
		shape_space          = {class = "intedit",  name = "shape_space",         min = 5, max = 100,  x = 1, y = 8,  width = 1, height = 1},
		                       {class = "label",                                                       x = 0, y = 10, width = 1, height = 1, label = c_lang.guiLabelKey23},
				               {class = "label",                                                       x = 0, y = 11, width = 1, height = 1, label = c_lang.guiLabelKey24},
		allshape_alphavalue  = {class = "intedit",  name = "allshape_alphavalue", min = 1, max = 100,  x = 1, y = 11, width = 1, height = 1},
				               {class = "label",                                                       x = 0, y = 12, width = 1, height = 1, label = c_lang.guiLabelKey26},
		blurvalue            = {class = "edit",     name = "blurvalue",                                x = 1, y = 12, width = 1, height = 1},
				               {class = "label",                                                       x = 0, y = 13, width = 1, height = 1, label = c_lang.guiLabelKey25},
		fadvalue             = {class = "intedit",  name = "fadvalue",            min = 0, max = 500,  x = 1, y = 13, width = 1, height = 1},
		                       {class = "label",                                                       x = 0, y = 15, width = 1, height = 1, label = c_lang.guiLabelKey28},
				               {class = "label",                                                       x = 0, y = 16, width = 1, height = 1, label = c_lang.guiLabelKey29},
		linenumber           = {class = "intedit",  name = "linenumber",          min = 1, max = 20,   x = 1, y = 16, width = 1, height = 1},
		}
	}
	end

	function newtranslator(n,t)
	local gui = {}
	gui["translator"..t.."_header"]       = {class = "label",                                     x = 0, y = n,     width = 5, height = 1, label = mag.string.format(c_lang.guiLabelKey1, t)}
	gui["translator"..t.."_namelabel"]    = {class = "label",                                     x = 0, y = n + 1, width = 1, height = 1, label = c_lang.guiLabelKey2}
	gui["translator"..t.."_name"]         = {class = "edit",  name = "translator"..t.."_name",    x = 1, y = n + 1, width = 4, height = 1}
	gui["translator"..t.."_twitterlabel"] = {class = "label",                                     x = 0, y = n + 2, width = 1, height = 1, label = c_lang.guiLabelKey3}
	gui["translator"..t.."_twitter"]      = {class = "edit",  name = "translator"..t.."_twitter", x = 1, y = n + 2, width = 4, height = 1}
	gui["translator"..t.."_discordlabel"] = {class = "label",                                     x = 0, y = n + 3, width = 1, height = 1, label = c_lang.guiLabelKey4}
	gui["translator"..t.."_discord"]      = {class = "edit",  name = "translator"..t.."_discord", x = 1, y = n + 3, width = 4, height = 1}
	gui["translator"..t.."_sitelabel"]    = {class = "label",                                     x = 0, y = n + 4, width = 1, height = 1, label = c_lang.guiLabelKey5}
	gui["translator"..t.."_site"]         = {class = "edit",  name = "translator"..t.."_site",    x = 1, y = n + 4, width = 4, height = 1}
	return gui
	end

	function getsize(style,font,size,text)
	style.fontname = font
	style.fontsize = size
	return aegisub.text_extents(style, text)
	end

	function shaper(width,height,offsetx,offsety,roundcorner)
	local shape = ""
	if roundcorner == 0 then
	shape = mag.string.format("m {%s} {%s} l {%s} {%s} l {%s} {%s} l {%s} {%s}",
	mag.floor(offsetx),
	mag.floor(offsety),
	mag.floor(width + offsetx),
	mag.floor(offsety),
	mag.floor(width + offsetx),
	mag.floor(height + offsety),
	mag.floor(offsetx),
	mag.floor(height + offsety)
	)
	elseif roundcorner == 1 then
	shape = mag.string.format("m {%s} {%s} l {%s} {%s} l {%s} {%s} l {%s} {%s} l {%s} {%s} b {%s} {%s} {%s} {%s} {%s} {%s}",
	mag.floor(offsetx + c.round),
	mag.floor(offsety),
	mag.floor(width + offsetx),
	mag.floor(offsety),
	mag.floor(width + offsetx),
	mag.floor(height + offsety),
	mag.floor(offsetx),
	mag.floor(height + offsety),
	mag.floor(offsetx),
	mag.floor(offsety + c.round),
	mag.floor(offsetx),
	mag.floor(offsety + c.round / 2),
	mag.floor(offsetx + c.round / 2),
	mag.floor(offsety),
	mag.floor(offsetx + c.round),
	mag.floor(offsety)
	)
	elseif roundcorner == 2 then
	shape = mag.string.format("m {%s} {%s} l {%s} {%s} b {%s} {%s} {%s} {%s} {%s} {%s} l {%s} {%s} l {%s} {%s}",
	mag.floor(offsetx),
	mag.floor(offsety),
	mag.floor(width + offsetx - c.round),
	mag.floor(offsety),
	mag.floor(width + offsetx - c.round / 2),
	mag.floor(offsety),
	mag.floor(width + offsetx),
	mag.floor(offsety + c.round / 2),
	mag.floor(width + offsetx),
	mag.floor(offsety + c.round),
	mag.floor(width + offsetx),
	mag.floor(height + offsety),
	mag.floor(offsetx),
	mag.floor(height + offsety)
	)
	elseif roundcorner == 3 then
	shape = mag.string.format("m {%s} {%s} l {%s} {%s} l {%s} {%s} l {%s} {%s} b {%s} {%s} {%s} {%s} {%s} {%s}",
	mag.floor(offsetx),
	mag.floor(offsety),
	mag.floor(width + offsetx),
	mag.floor(offsety),
	mag.floor(width + offsetx),
	mag.floor(height + offsety),
	mag.floor(offsetx + c.round),
	mag.floor(height + offsety),
	mag.floor(offsetx + c.round / 2),
	mag.floor(height + offsety),
	mag.floor(offsetx),
	mag.floor(height + offsety - c.round / 2),
	mag.floor(offsetx),
	mag.floor(height + offsety - c.round)
	)
	elseif roundcorner == 4 then
	shape = mag.string.format("m {%s} {%s} l {%s} {%s} l {%s} {%s} b {%s} {%s} {%s} {%s} {%s} {%s} l {%s} {%s}",
	mag.floor(offsetx),
	mag.floor(offsety),
	mag.floor(width + offsetx),
	mag.floor(offsety),
	mag.floor(width + offsetx),
	mag.floor(height + offsety - c.round),
	mag.floor(width + offsetx),
	mag.floor(height + offsety - c.round / 2),
	mag.floor(width + offsetx - c.round / 2),
	mag.floor(height + offsety),
	mag.floor(width + offsetx - c.round),
	mag.floor(height + offsety),
	mag.floor(offsetx),
	mag.floor(height + offsety)
	)
	elseif roundcorner == 5 then
	shape = mag.string.format("m {%s} {%s} l {%s} {%s} b {%s} {%s} {%s} {%s} {%s} {%s} l {%s} {%s} b {%s} {%s} {%s} {%s} {%s} {%s} l {%s} {%s} b {%s} {%s} {%s} {%s} {%s} {%s} l {%s} {%s} b {%s} {%s} {%s} {%s} {%s} {%s}",
	mag.floor(offsetx),
	mag.floor(offsety + c.round),
	mag.floor(offsetx),
	mag.floor(height + offsety - c.round),
	mag.floor(offsetx),
	mag.floor(height + offsety - c.round / 2),
	mag.floor(offsetx + c.round / 2),
	mag.floor(height + offsety),
	mag.floor(offsetx + c.round),
	mag.floor(height + offsety),
	mag.floor(width + offsetx - c.round),
	mag.floor(height + offsety),
	mag.floor(width + offsetx - c.round / 2),
	mag.floor(height + offsety),
	mag.floor(width + offsetx),
	mag.floor(height + offsety - c.round / 2),
	mag.floor(width + offsetx),
	mag.floor(height + offsety - c.round),
	mag.floor(width + offsetx),
	mag.floor(offsety + c.round),
	mag.floor(width + offsetx),
	mag.floor(offsety + c.round / 2),
	mag.floor(width + offsetx - c.round / 2),
	mag.floor(offsety),
	mag.floor(width + offsetx - c.round),
	mag.floor(offsety),
	mag.floor(offsetx + c.round),
	mag.floor(offsety),
	mag.floor(offsetx + c.round / 2),
	mag.floor(offsety),
	mag.floor(offsetx),
	mag.floor(offsety + c.round / 2),
	mag.floor(offsetx),
	mag.floor(offsety + c.round)
	)
	end
	return shape
	end

	function whichoneisbigger(val1,val2)
	if val1 > val2 then return val1 end
	return val2
	end

	function getdata(line)
	local data = {}
	data.count = 0
	for i = 1, 3 do
		if not mag.is.empty(c["translator"..i.."_name"]) then
		data.count                                                          = data.count + 1
		data["translator"..i]                                               = {}
		data["translator"..i].coefficient                                   = 0
		data["translator"..i].nick                                          = {}
		data["translator"..i].nick.width, data["translator"..i].nick.height = getsize(line.styleref, c.fontname, c.nicksize, c["translator"..i.."_name"])
		data["translator"..i].nick.text                                     = c["translator"..i.."_name"]
		data["translator"..i].maxheight                                     = 0
		data["translator"..i].maxwidth                                      = data["translator"..i].nick.width
		data["translator"..i].shapeheight                                   = 0
			if not mag.is.empty(c["translator"..i.."_twitter"]) then
			data["translator"..i].twitter                                             = {}
			data["translator"..i].twitter.width, data["translator"..i].twitter.height = getsize(line.styleref, c.fontname, c.sociallinkssize, c["translator"..i.."_twitter"])
			data["translator"..i].twitter.text                                        = c["translator"..i.."_twitter"]
			data["translator"..i].twitter.shape                                       = "m 0 0 b 19 25 53 36 69 35 b 61 3 100 -21 126 5 b 134 3 141 0 147 -4 b 144 5 139 10 132 15 b 138 14 145 12 151 10 b 146 17 141 22 135 27 b 135 65 120 82 110 96 b 80 129 26 136 -12 111 b 8 114 29 106 37 98 b 21 96 11 86 6 74 b 12 75 18 75 21 74 b 6 68 -4 60 -5 40 b -1 43 4 44 10 45 b -4 34 -9 18 0 0 "
			data["translator"..i].twitter.scale                                       = data["translator"..i].twitter.height / 126 * 55
			data["translator"..i].coefficient                                         = data["translator"..i].coefficient + 1
			data["translator"..i].maxwidth                                            = whichoneisbigger(data["translator"..i].maxwidth, data["translator"..i].twitter.width + data["translator"..i].twitter.height + c.padding)
			data["translator"..i].maxheight                                           = data["translator"..i].twitter.height
			end
			if not mag.is.empty(c["translator"..i.."_discord"]) then
			data["translator"..i].discord                                             = {}
			data["translator"..i].discord.width, data["translator"..i].discord.height = getsize(line.styleref, c.fontname, c.sociallinkssize, c["translator"..i.."_discord"])
			data["translator"..i].discord.text                                        = c["translator"..i.."_discord"]
			data["translator"..i].discord.shape                                       = "m 0 0 l 1 3 b -13 6 -22 12 -27 18 b -14 11 2 6 21 6 b 37 6 51 11 66 18 b 60 13 50 5 37 3 l 38 0 b 51 1 61 6 69 12 b 82 34 87 60 88 82 b 79 93 63 99 47 100 l 42 93 b 52 90 62 84 69 76 b 55 86 38 92 18 91 b 0 91 -18 86 -31 76 b -24 84 -14 90 -4 93 l -9 100 b -27 99 -42 91 -50 81 b -49 60 -43 34 -31 12 b -23 6 -11 1 0 0 m -1 44 b -9 44 -12 49 -12 57 b -12 64 -9 69 -1 69 b 6 69 9 64 10 57 b 10 49 6 44 -1 44 m 40 44 b 32 44 29 49 28 57 b 29 64 33 69 40 69 b 46 69 50 64 51 57 b 51 49 46 44 40 44"
			data["translator"..i].discord.scale                                       = data["translator"..i].discord.height / 100 * 60
			data["translator"..i].coefficient                                         = data["translator"..i].coefficient + 1
			data["translator"..i].maxwidth                                            = whichoneisbigger(data["translator"..i].maxwidth, data["translator"..i].discord.width + data["translator"..i].discord.height + c.padding)
			data["translator"..i].maxheight                                           = data["translator"..i].discord.height
			end
			if not mag.is.empty(c["translator"..i.."_site"]) then
			data["translator"..i].site                                          = {}
			data["translator"..i].site.width, data["translator"..i].site.height = getsize(line.styleref, c.fontname, c.sociallinkssize, c["translator"..i.."_site"])
			data["translator"..i].site.text                                     = c["translator"..i.."_site"]
			data["translator"..i].site.shape                                    = "m 0 53 b 0 24 23 0 53 0 b 82 0 105 24 105 53 b 105 81 82 105 52 105 b 23 105 0 81 0 53 m 50 50 b 50 43 50 36 50 28 b 50 28 50 28 50 28 b 43 28 37 28 31 28 b 30 28 30 29 30 29 b 28 34 27 39 27 44 b 27 46 27 48 26 50 b 34 50 42 50 50 50 m 55 50 b 63 50 71 50 78 50 b 79 50 79 50 79 50 b 78 43 77 36 75 29 b 75 28 75 28 74 28 b 68 28 62 28 56 28 b 55 28 55 28 55 28 b 55 36 55 43 55 50 m 79 55 b 71 55 63 55 55 55 b 55 62 55 70 55 77 b 55 77 55 77 55 77 b 62 77 68 77 74 77 b 75 77 75 77 75 76 b 76 72 77 69 78 65 b 78 61 78 58 79 55 m 50 77 b 50 70 50 62 50 55 b 42 55 34 55 26 55 b 27 62 28 69 30 76 b 30 77 30 77 31 77 b 37 77 43 77 49 77 b 50 77 50 77 50 77 m 80 77 b 80 77 81 77 81 77 b 85 77 89 77 93 77 b 94 77 94 77 94 76 b 97 71 99 65 100 58 b 100 57 100 56 100 55 b 95 55 89 55 83 55 b 83 63 82 70 80 77 m 25 28 b 25 28 25 28 25 28 b 21 28 16 28 12 28 b 12 28 11 29 11 29 b 8 34 6 40 5 46 b 5 47 5 49 5 50 b 11 50 16 50 22 50 b 22 43 23 36 25 28 m 100 50 b 100 50 100 50 100 50 b 100 42 98 35 94 29 b 94 28 94 28 93 28 b 89 28 85 28 81 28 b 80 28 80 28 80 28 b 82 36 83 43 83 50 b 89 50 95 50 100 50 m 25 77 b 24 73 24 70 23 66 b 22 62 22 59 22 55 b 16 55 10 55 5 55 b 5 62 7 69 10 75 b 11 77 12 77 14 77 b 18 77 21 77 25 77 m 55 100 b 61 101 72 90 73 82 b 67 82 61 82 55 82 b 55 88 55 94 55 100 m 50 5 b 46 6 43 7 41 10 b 37 14 34 18 32 24 b 38 24 44 24 50 24 b 50 17 50 11 50 5 m 74 24 b 72 21 71 18 69 16 b 66 12 63 8 58 6 b 57 6 56 5 55 5 b 55 11 55 17 55 24 b 61 24 67 24 74 24 m 32 82 b 33 85 35 89 37 92 b 40 95 43 97 46 99 b 47 100 49 100 50 101 b 50 94 50 88 50 82 b 44 82 38 82 32 82 m 14 24 b 18 24 22 24 26 24 b 27 24 27 24 27 23 b 29 17 32 12 36 8 b 36 8 36 8 37 7 b 28 11 20 16 14 24 m 68 8 b 73 12 76 17 78 23 b 78 23 79 24 79 24 b 83 24 86 24 90 24 b 90 24 90 24 91 24 b 85 16 77 11 68 8 m 91 82 b 87 82 83 82 79 82 b 78 82 78 82 78 83 b 76 87 74 91 71 94 b 70 96 69 97 68 98 b 77 95 85 89 91 82 m 15 82 b 17 87 32 98 37 98 b 32 93 29 88 27 82 b 27 82 27 82 26 82 b 23 82 20 82 17 82 b 16 82 15 82 15 82"
			data["translator"..i].site.scale                                    = data["translator"..i].site.height / 105 * 70
			data["translator"..i].coefficient                                   = data["translator"..i].coefficient + 1
			data["translator"..i].maxwidth                                      = whichoneisbigger(data["translator"..i].maxwidth, data["translator"..i].site.width + data["translator"..i].site.height + c.padding)
			data["translator"..i].maxheight                                     = data["translator"..i].site.height
			end
		data["translator"..i].shapewidth  = data["translator"..i].maxwidth + c.padding * 2
		data["translator"..i].shapeheight = data["translator"..i].nick.height + c.padding * 2 + data["translator"..i].coefficient * c.padding + data["translator"..i].coefficient * (c.padding / 2) + data["translator"..i].maxheight * data["translator"..i].coefficient
		end
	end
	return data
	end

	function calcshapewidth(line,data)
	local width = 0
	for i = 1, 3 do
		if not mag.is.empty(c["translator"..i.."_name"]) then
		width = whichoneisbigger(width, data["translator"..i].shapewidth)
		end
	end
	return width
	end

	function animator(posx,posy,nomove)
	local animation = ""
	if c.aonstart and c.aonend then
	animation = mag.string.format("\\fad({%s},{%s})", c.fadvalue, c.fadvalue)
		if nomove == true then
		animation = animation..mag.string.format("\\pos({%s},{%s})", mag.floor(posx), mag.floor(posy))
		else
		animation = animation..mag.string.format("\\move({%s},{%s},{%s},{%s},0,{%s})", mag.floor(posx), mag.floor(posy + c.padding), mag.floor(posx), mag.floor(posy), c.fadvalue)
		end
	elseif c.aonstart then
	animation = mag.string.format("\\fad({%s},0)", c.fadvalue)
		if nomove == true then
		animation = animation..mag.string.format("\\pos({%s},{%s})", mag.floor(posx), mag.floor(posy))
		else
		animation = animation..mag.string.format("\\move({%s},{%s},{%s},{%s},0,{%s})", mag.floor(posx), mag.floor(posy + c.padding), mag.floor(posx), mag.floor(posy), c.fadvalue)
		end
	elseif c.aonend then
	animation = mag.string.format("\\fad(0,{%s})", c.fadvalue)
	animation = animation..mag.string.format("\\pos({%s},{%s})", mag.floor(posx), mag.floor(posy))
	else
	animation = mag.string.format("\\pos({%s},{%s})", mag.floor(posx), mag.floor(posy))
	end
	return animation
	end

	function createbox(subs,act,line,shapecolor,textcolor,number,offsetx,offsety,shapewidth,data)
	local width, height           = 0, 0
	local posx, posy              = 0, 0
	local temp_posx, temp_posy    = 0, 0
	local temp_width, temp_height = 0, 0
	local shape                   = ""
	local animation               = ""
	width, height                 = shapewidth, data["translator"..number].shapeheight
	posx, posy                    = width / 2 + offsetx, height / 2 + offsety
	line.actor                    = mag.string.format(c_lang.actorformat, number, c_lang.actorKey1)
	temp_width                    = width
	temp_height                   = height
	shape                         = shaper(temp_width, temp_height, 0, 0, 0)
	temp_posx                     = c.padding
	temp_posy                     = height - c.padding / 2
	temp_height                   = data["translator"..number].maxheight + c.padding
	if data["translator"..number].site ~= nil then
	temp_posy                     = temp_posy - c.padding * 1.5 - data["translator"..number].maxheight
	temp_width                    = data["translator"..number].site.width + c.padding + data["translator"..number].maxheight
	shape                         = shape .. " " .. shaper(temp_width, temp_height, temp_posx, temp_posy, 5)
	end
	if data["translator"..number].discord ~= nil then
	temp_posy                     = temp_posy - c.padding * 1.5 - data["translator"..number].maxheight
	temp_width                    = data["translator"..number].discord.width + c.padding + data["translator"..number].maxheight
	shape                         = shape .. " " .. shaper(temp_width, temp_height, temp_posx, temp_posy, 5)
	end
	if data["translator"..number].twitter ~= nil then
	temp_posy                     = temp_posy - c.padding * 1.5 - data["translator"..number].maxheight
	temp_width                    = data["translator"..number].twitter.width + c.padding + data["translator"..number].maxheight
	shape                         = shape .. " " .. shaper(temp_width, temp_height, temp_posx, temp_posy, 5)
	end
	temp_posx                     = posx + c.border_thickness + c.shape_space
	temp_posy                     = posy + c.border_thickness + c.shape_space
	animation                     = animator(temp_posx, temp_posy, true)
	line.text                     = mag.string.format("{\\c{%s}\\bord0\\shad0\\fscx100\\fscy100\\an5{%s}\\pos({%s},{%s})\\p1\\blur{%s}\\alpha&H{%s}&}{%s}", shapecolor, animation, mag.floor(temp_posx), mag.floor(temp_posy), c.blurvalue, mag.convert.alpha_from_percent(c.allshape_alphavalue, true), shape)
	c_lcounter                    = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	line.actor                    = mag.string.format(c_lang.actorformat, number, c_lang.actorKey2)
	temp_posx                     = (posx + c.shape_space + c.border_thickness) - width / 2 + data["translator"..number].nick.width / 2 + c.padding
	temp_posy                     = (posy + c.shape_space + c.border_thickness) - height / 2 + data["translator"..number].nick.height / 2 + c.padding
	animation                     = animator(temp_posx, temp_posy, true)
	line.text                     = mag.string.format("{\\c{%s}\\bord0\\shad0\\an5{%s}\\pos({%s},{%s})\\fs{%s}\\fn{%s}\\blur{%s}}{%s}", textcolor, animation, mag.floor(temp_posx), mag.floor(temp_posy), c.nicksize, c.fontname, c.blurvalue, data["translator"..number].nick.text)
	c_lcounter                    = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	temp_posy                     = (posy + c.shape_space + c.border_thickness) + height / 2 + data["translator"..number].maxheight / 2
	if data["translator"..number].site ~= nil then
	line.actor                    = mag.string.format(c_lang.actorformat, number, c_lang.actorKey7)
	temp_posx                     = (posx - width / 2 + data["translator"..number].site.width / 2 + c.padding) + c.shape_space + c.border_thickness + c.padding / 2 + data["translator"..number].site.height
	temp_posy                     = temp_posy - data["translator"..number].maxheight - c.padding * 1.5
	animation                     = animator(temp_posx, temp_posy, false)
	line.text                     = mag.string.format("{\\c{%s}\\bord0\\shad0\\an5{%s}\\fs{%s}\\fn{%s}\\blur{%s}\\alpha&H{%s}&}{%s}", shapecolor, animation, c.sociallinkssize, c.fontname, c.blurvalue, mag.convert.alpha_from_percent(c.allshape_alphavalue, true), data["translator"..number].site.text)
	c_lcounter                    = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	line.actor                    = mag.string.format(c_lang.actorformat, number, c_lang.actorKey8)
	temp_posx                     = temp_posx - data["translator"..number].site.width / 2 - (data["translator"..number].site.height * 1.2) / 2
	animation                     = animator(temp_posx, temp_posy, false)
	line.text                     = mag.string.format("{\\c{%s}\\bord0\\shad0\\fscx{%s}\\fscy{%s}\\an5{%s}\\p1\\blur{%s}\\alpha&H{%s}&}{%s}", shapecolor, mag.floor(data["translator"..number].site.scale), mag.floor(data["translator"..number].site.scale), animation, c.blurvalue, mag.convert.alpha_from_percent(c.allshape_alphavalue, true), data["translator"..number].site.shape)
	c_lcounter                    = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	end
	if data["translator"..number].discord ~= nil then
	line.actor                    = mag.string.format(c_lang.actorformat, number, c_lang.actorKey5)
	temp_posx                     = (posx - width / 2 + data["translator"..number].discord.width / 2 + c.padding) + c.shape_space + c.border_thickness + c.padding / 2 + data["translator"..number].discord.height
	temp_posy                     = temp_posy - data["translator"..number].maxheight - c.padding * 1.5
	animation                     = animator(temp_posx, temp_posy, false)
	line.text                     = mag.string.format("{\\c{%s}\\bord0\\shad0\\an5{%s}\\fs{%s}\\fn{%s}\\blur{%s}\\alpha&H{%s}&}{%s}", shapecolor, animation, c.sociallinkssize, c.fontname, c.blurvalue, mag.convert.alpha_from_percent(c.allshape_alphavalue, true), data["translator"..number].discord.text)
	c_lcounter                    = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	line.actor                    = mag.string.format(c_lang.actorformat, number, c_lang.actorKey6)
	temp_posx                     = temp_posx - data["translator"..number].discord.width / 2 - (data["translator"..number].discord.height * 0.6) / 2
	animation                     = animator(temp_posx, temp_posy, false)
	line.text                     = mag.string.format("{\\c{%s}\\bord0\\shad0\\fscx{%s}\\fscy{%s}\\an5{%s}\\p1\\blur{%s}\\alpha&H{%s}&}{%s}", shapecolor, mag.floor(data["translator"..number].discord.scale), mag.floor(data["translator"..number].discord.scale), animation, c.blurvalue, mag.convert.alpha_from_percent(c.allshape_alphavalue, true), data["translator"..number].discord.shape)
	c_lcounter                    = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	end
	if data["translator"..number].twitter ~= nil then
	line.actor                    = mag.string.format(c_lang.actorformat, number, c_lang.actorKey3)
	temp_posx                     = (posx - width / 2 + data["translator"..number].twitter.width / 2 + c.padding) + c.shape_space + c.border_thickness + c.padding / 2 + data["translator"..number].twitter.height
	temp_posy                     = temp_posy - data["translator"..number].maxheight - c.padding * 1.5
	animation                     = animator(temp_posx, temp_posy, false)
	line.text                     = mag.string.format("{\\c{%s}\\bord0\\shad0\\an5{%s}\\fs{%s}\\fn{%s}\\blur{%s}\\alpha&H{%s}&}{%s}", shapecolor, animation, c.sociallinkssize, c.fontname, c.blurvalue, mag.convert.alpha_from_percent(c.allshape_alphavalue, true), data["translator"..number].twitter.text)
	c_lcounter                    = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	line.actor                    = mag.string.format(c_lang.actorformat, number, c_lang.actorKey4)
	temp_posx                     = temp_posx - data["translator"..number].twitter.width / 2 - data["translator"..number].twitter.height / 1.8
	animation                     = animator(temp_posx, temp_posy + data["translator"..number].twitter.height / 10, false)
	line.text                     = mag.string.format("{\\c{%s}\\bord0\\shad0\\fscx{%s}\\fscy{%s}\\an5{%s}\\p1\\blur{%s}\\alpha&H{%s}&}{%s}", shapecolor, mag.floor(data["translator"..number].twitter.scale), mag.floor(data["translator"..number].twitter.scale), animation, c.blurvalue, mag.convert.alpha_from_percent(c.allshape_alphavalue, true), data["translator"..number].twitter.shape)
	c_lcounter                    = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	end
	return width, height, posx, posy
	end

	c_lcounter = 0

	function staffer(subs,sel,act)
	c_lcounter                    = 0
	local line, index             = subs[act], act
	line.comment                  = false
	line.effect                   = c_lang.effectname
	line.layer                    = c.linenumber
	local meta, styles            = karaskel.collect_head(subs, false)
	karaskel.preproc_line_size(meta, styles, line)
	local temp                    = ""
	local width, height           = 0, 0
	local posx, posy              = 0, 0
	local temp_posx, temp_posy    = 0, 0
	local temp_width, temp_height = 0, 0
	local shape                   = ""
	local shapecolor              = mag.convert.html_to_ass(c.shape_color)
	local textcolor               = mag.convert.html_to_ass(c.text_color)
	local headersize              = c.border_thickness * 1.8
	local hw, hh                  = getsize(line.styleref, c.fontname, headersize, c.header_text)
	local data                    = getdata(line)
	local shapewidth              = calcshapewidth(line, data)
	local round                   = 0
	local count                   = 0
	local check_anynick           = false
	local check_fullshapeheight   = 0
	local startpoint_x, startpoint_y, frzval, animation
	for i = 1, 3 do
		if not mag.is.empty(c["translator"..i.."_name"]) then
			check_anynick         = true
			check_fullshapeheight = check_fullshapeheight + data["translator"..i].shapeheight + c.shape_space * (i - 1)
		end
	end
	if check_anynick == false then
	mag.show.log(1, c_lang.errorKey1)
	elseif hw > check_fullshapeheight then
	mag.show.log(1, c_lang.errorKey2)
	elseif line.styleref.italic == true or line.styleref.angle > 0 then
	mag.show.log(1, c_lang.errorKey3)
	else
		if line.styleref.scale_x ~= 100 or line.styleref.scale_y ~= 100 then
		mag.show.log(2, c_lang.warningKey1)
		end
		if c_corners[1] == c.corner or c_corners[2] == c.corner then
			if c_corners[2] == c.corner then
			startpoint_x = meta.res_x - shapewidth - c.border_thickness * 2 - c.shape_space * 2 - c.horizontal_margin
			else
			startpoint_x = c.horizontal_margin
			end
		startpoint_y = c.vertical_margin
		temp         = height
		posy         = startpoint_y
			for i = 1, 3 do
				if not mag.is.empty(c["translator"..i.."_name"]) then
				count                                         = count + 1
				temp_width, temp_height, temp_posx, temp_posy = createbox(subs, act, line, shapecolor, textcolor, i, startpoint_x, startpoint_y + temp + c.shape_space * (count - 1), shapewidth, data)
				temp                                          = temp + temp_height
					if count == 1 then
					height                                    = height + temp_height
					posy                                      = posy + temp_height / 2
					else
					height                                    = height + temp_height + c.shape_space
					posy                                      = posy + temp_height / 2 + c.shape_space / 2
					end
					if temp_width > width then
					width = temp_width
					posx  = temp_posx
					end
				end
			end
		elseif c_corners[3] == c.corner or c_corners[4] == c.corner then
			if c_corners[4] == c.corner then
			startpoint_x = meta.res_x - shapewidth - c.border_thickness * 2 - c.shape_space * 2 - c.horizontal_margin
			else
			startpoint_x = c.horizontal_margin
			end
		startpoint_y = meta.res_y - c.vertical_margin - (c.shape_space * (1 + data.count) + c.border_thickness * 2)
			for i = 1, data.count do
				if not mag.is.empty(c["translator"..i.."_name"]) then
				startpoint_y = startpoint_y - data["translator"..i].shapeheight
				end
			end
		temp = height
		posy = startpoint_y
			for i = data.count, 1, -1 do
				if not mag.is.empty(c["translator"..i.."_name"]) then
				count                                         = count + 1
				temp_width, temp_height, temp_posx, temp_posy = createbox(subs, act, line, shapecolor, textcolor, i, startpoint_x, startpoint_y + temp + c.shape_space * (count - 1), shapewidth, data)
				temp                                          = temp + temp_height
					if count == data.count then
					height                                    = height + temp_height
					posy                                      = posy + temp_height / 2
					else
					height                                    = height + temp_height + c.shape_space
					posy                                      = posy + temp_height / 2 + c.shape_space / 2
					end
					if temp_width > width then
					width = temp_width
					posx  = temp_posx
					end
				end
			end
		end
		if c_corners[1] == c.corner then
		round                         = 2
		temp_width                    = (width + c.horizontal_margin + c.shape_space + c.border_thickness) + c.shape_space + c.border_thickness
		temp_height                   = c.border_thickness
		temp_posx                     = 0
		temp_posy                     = 0
		elseif c_corners[2] == c.corner then
		round                         = 1
		temp_width                    = (width + c.horizontal_margin + c.shape_space + c.border_thickness) + c.shape_space + c.border_thickness
		temp_height                   = c.border_thickness
		temp_posx                     = c.horizontal_margin
		temp_posy                     = 0
		elseif c_corners[3] == c.corner then
		round                         = 2
		temp_width                    = width + c.shape_space * 2 + c.border_thickness
		temp_height                   = c.border_thickness
		temp_posx                     = c.horizontal_margin + c.border_thickness
		temp_posy                     = 0
		elseif c_corners[4] == c.corner then
		round                         = 1
		temp_width                    = width + c.shape_space * 2 + c.border_thickness
		temp_height                   = c.border_thickness
		temp_posx                     = c.horizontal_margin
		temp_posy                     = 0
		end
	shape                             = shaper(temp_width, temp_height, temp_posx, temp_posy, round)
		if c_corners[1] == c.corner then
		round                         = 0
		temp_width                    = c.border_thickness
		temp_height                   = height + c.shape_space * 2
		temp_posx                     = (width + c.horizontal_margin + c.shape_space + c.border_thickness) + c.shape_space
		temp_posy                     = c.border_thickness
		elseif c_corners[2] == c.corner then
		round                         = 0
		temp_width                    = c.border_thickness
		temp_height                   = height - hw
		temp_posx                     = (width + c.horizontal_margin + c.shape_space + c.border_thickness) + c.shape_space
		temp_posy                     = hw + c.shape_space * 2 + c.border_thickness
		elseif c_corners[3] == c.corner then
		round                         = 0
		temp_width                    = c.border_thickness
		temp_height                   = height + c.shape_space * 2
		temp_posx                     = (width + c.horizontal_margin + c.shape_space + c.border_thickness) + c.shape_space
		temp_posy                     = c.border_thickness
		elseif c_corners[4] == c.corner then
		round                         = 2
		temp_width                    = c.border_thickness
		temp_height                   = height + c.shape_space + c.border_thickness - hw - c.shape_space
		temp_posx                     = (width + c.horizontal_margin + c.shape_space + c.border_thickness) + c.shape_space
		temp_posy                     = 0
		end
	shape                             = shape .. " " .. shaper(temp_width, temp_height, temp_posx, temp_posy, round)
		if c_corners[1] == c.corner then
		round                         = 4
		temp_width                    = width + c.shape_space * 2 + c.border_thickness
		temp_height                   = c.border_thickness
		temp_posx                     = c.horizontal_margin + c.border_thickness
		temp_posy                     = height + c.shape_space * 2 + c.border_thickness
		elseif c_corners[2] == c.corner then
		round                         = 4
		temp_width                    = width + c.shape_space * 2 + c.border_thickness
		temp_height                   = c.border_thickness
		temp_posx                     = c.horizontal_margin + c.border_thickness
		temp_posy                     = height + c.shape_space * 2 + c.border_thickness
		elseif c_corners[3] == c.corner then
		round                         = 4
		temp_width                    = (width + c.horizontal_margin + c.shape_space + c.border_thickness) + c.shape_space + c.border_thickness
		temp_height                   = c.border_thickness
		temp_posx                     = 0
		temp_posy                     = height + c.shape_space * 2 + c.border_thickness
		elseif c_corners[4] == c.corner then
		round                         = 0
		temp_width                    = width + c.shape_space * 2 + c.border_thickness + c.horizontal_margin
		temp_height                   = c.border_thickness
		temp_posx                     = c.horizontal_margin + c.border_thickness
		temp_posy                     = height + c.shape_space * 2 + c.border_thickness
		end
	shape                             = shape .. " " .. shaper(temp_width, temp_height, temp_posx, temp_posy, round)
		if c_corners[1] == c.corner then
		round                         = 3
		temp_width                    = c.border_thickness
		temp_height                   = height + c.shape_space + c.border_thickness - hw - c.shape_space
		temp_posx                     = c.horizontal_margin
		temp_posy                     = c.border_thickness + c.shape_space + hw + c.shape_space
		elseif c_corners[2] == c.corner then
		round                         = 3
		temp_width                    = c.border_thickness
		temp_height                   = height + c.shape_space * 2 + c.border_thickness
		temp_posx                     = c.horizontal_margin
		temp_posy                     = c.border_thickness
		elseif c_corners[3] == c.corner then
		round                         = 1
		temp_width                    = c.border_thickness
		temp_height                   = height + c.shape_space + c.border_thickness - hw - c.shape_space
		temp_posx                     = c.horizontal_margin
		temp_posy                     = 0
		elseif c_corners[4] == c.corner then
		round                         = 3
		temp_width                    = c.border_thickness
		temp_height                   = height + c.shape_space * 2 + c.border_thickness
		temp_posx                     = c.horizontal_margin
		temp_posy                     = c.border_thickness
		end
	shape                             = shape .. " " .. shaper(temp_width, temp_height, temp_posx, temp_posy, round)
	line.actor                        = c_lang.actorKey10
	temp_posx                         = posx - width / 2 + ((width + c.horizontal_margin + c.shape_space + c.border_thickness) + c.shape_space + c.border_thickness) / 2 - c.horizontal_margin
	temp_posy                         = posy - height / 2 + (height + c.border_thickness * 2 + c.shape_space * 2) / 2
	animation                         = animator(temp_posx, temp_posy, true)
	line.text                         = mag.string.format("{\\c&H{%s}&\\bord0\\shad0\\fscx100\\fscy100\\an5{%s}\\pos({%s},{%s})\\p1\\blur{%s}\\alpha&H{%s}&}{%s}", shapecolor, animation, mag.floor(temp_posx), mag.floor(temp_posy), c.blurvalue, mag.convert.alpha_from_percent(c.allshape_alphavalue, true), shape)
	c_lcounter                        = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	line.actor                        = c_lang.actorKey9
		if c_corners[1] == c.corner then
		frzval                        = 90
		temp_posx                     = (posx + c.shape_space + c.border_thickness) - width / 2 - c.shape_space - hh / 4
		temp_posy                     = (posy + c.shape_space + c.border_thickness) - height / 2 + hw / 2
		elseif c_corners[2] == c.corner then
		frzval                        = -90
		temp_posx                     = (posx + c.shape_space + c.border_thickness) + width / 2 + c.shape_space + hh / 4
		temp_posy                     = (posy + c.shape_space + c.border_thickness) - height / 2 + hw / 2
		elseif c_corners[3] == c.corner then
		frzval                        = 90
		temp_posx                     = (posx + c.shape_space + c.border_thickness) - width / 2 - c.shape_space - hh / 4
		temp_posy                     = (posy + c.shape_space + c.border_thickness) + height / 2 - hw / 2
		elseif c_corners[4] == c.corner then
		frzval                        = -90
		temp_posx                     = (posx + c.shape_space + c.border_thickness) + width / 2 + c.shape_space + hh / 4
		temp_posy                     = (posy + c.shape_space + c.border_thickness) + height / 2 - hw / 2
		end
	animation                         = animator(temp_posx, temp_posy, true)
	line.text                         = mag.string.format("{\\c{%s}\\bord0\\shad0\\an5{%s}\\pos({%s},{%s})\\fs{%s}\\fn{%s}\\frz{%s}\\blur{%s}\\alpha&H{%s}&}{%s}", shapecolor, animation, mag.floor(temp_posx), mag.floor(temp_posy), mag.floor(headersize), c.fontname, frzval, c.blurvalue, mag.convert.alpha_from_percent(c.allshape_alphavalue, true), c.header_text)
	c_lcounter                        = c_lcounter + 1
	subs.insert(act + c_lcounter, line)
	end
	end

	function add_macro1(subs,sel,act)
	local ok, config, gui1, yoff
	yoff                         = 18
	gui.main1.settingslabel.y    = yoff
	gui.main1.cornerlabel.y      = yoff + 1
	gui.main1.corner.y           = yoff + 1
	gui.main1.shape_colorlabel.y = yoff + 2
	gui.main1.shape_color.y      = yoff + 2
	gui.main1.text_colorlabel.y  = yoff + 3
	gui.main1.text_color.y       = yoff + 3
	gui.main1.header_textlabel.y = yoff + 4
	gui.main1.header_text.y      = yoff + 4
	gui.main1.aonstart.y         = yoff + 5
	gui.main1.aonend.y           = yoff + 6
	gui1                         = gui.main1
	gui1                         = mag.array.merge(gui1, newtranslator(0,1), true)
	gui1                         = mag.array.merge(gui1, newtranslator(6,2), true)
	gui1                         = mag.array.merge(gui1, newtranslator(12,3), true)
	repeat
	if ok == mag.convert.ascii(c_buttons1[2]) then
	mag.config.put(gui.main2)
	ok, config = mag.window.dialog(gui.main2, c_buttons2)
	elseif ok == mag.convert.ascii(c_buttons1[3]) then
	mag.config.put(gui.main3)
	ok, config = mag.window.dialog(gui.main3, c_buttons2)
	else
	mag.config.put(gui1)
	ok, config = mag.window.dialog(gui1, c_buttons1)
	end
	mag.config.take(config)
	until ok == mag.convert.ascii(c_buttons1[1]) or ok == mag.convert.ascii(c_buttons1[4])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	staffer(subs, sel, act)
	end
	end

	function check_macro1(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro1, subs, sel, act)
	mag.window.funce(fe, fee)
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
		mag.window.register(script_name.."/"..mag.window.lang.message("gui_tabname"), check_macro1)
		mag.window.lang.register()
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
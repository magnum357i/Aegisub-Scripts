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
	in_lang["cModeListNameKey1"]      = "ZAMAN KONTROLLERİ"
	in_lang["cModeListNameKey2"]      = "KARAKTER KONTROLLERİ"
	in_lang["cModeListNameKey3"]      = "BOŞLUK KONTROLLERİ"
	in_lang["cModeListNameKey4"]      = "STİL KONTROLÜ"
	in_lang["cModeListNameKey5"]      = "KARAOKE KONTROLLERİ"
	in_lang["cModeListNameKey6"]      = "NOKTALAMA KONTROLLERİ"
	in_lang["cModeListShortNameKey1"] = "Zaman"
	in_lang["cModeListShortNameKey2"] = "Karakter"
	in_lang["cModeListShortNameKey3"] = "Boşluk"
	in_lang["cModeListShortNameKey4"] = "Stil"
	in_lang["cModeListShortNameKey5"] = "Karaoke"
	in_lang["cModeListShortNameKey6"] = "Noktalama"
	in_lang["cModeFormat"]            = "[({%1}) {%2}]"
	in_lang["guiLabelKey1"]           = "Şundan az:"
	in_lang["guiLabelKey2"]           = "Şundan fazla:"
	in_lang["guiLabelKey3"]           = "Zaman farkı şundan az ise:"
	in_lang["guiLabelKey4"]           = "Saniye başına karakter sayısı:"
	in_lang["guiLabelKey5"]           = "Üst üste binen satırlar"
	in_lang["guiLabelKey6"]           = "Sınır:"
	in_lang["guiLabelKey7"]           = "Bölünen satırların sınırı:"
	in_lang["guiLabelKey8"]           = "Birden fazla"
	in_lang["guiLabelKey9"]           = "Satırdan önce ve sonra"
	in_lang["guiLabelKey10"]          = "Satır bölmeden önce ve sonra"
	in_lang["guiLabelKey11"]          = "Noktalama işaretlerinden önce ve sonra"
	in_lang["guiLabelKey12"]          = "[UYGULANACAK SATIRLAR]"
	in_lang["guiLabelKey13"]          = "Boşlukları ve noktalama işaretlerini yoksay"
	in_lang["guiLabelKey14"]          = "Raporu görüntüle"
	in_lang["guiLabelKey15"]          = "Tanımsız stili olan satırlar"
	in_lang["guiLabelKey16"]          = "Karaoke etiketlerinin süresi"
	in_lang["guiLabelKey17"]          = "Karaoke etiketlerinin boşlukları"
	in_lang["guiLabelKey18"]          = "Aynı türden yanyana"
	in_lang["guiLabelKey19"]          = "Eksik (sadece satır sonu için)"
	in_lang["guiHintKey1"]            = "Aşağıdaki tercihlerin hepsini uygulamak için bu kutuyu işaretleyin."
	in_lang["guiHintKey2"]            = "Karakter hesaplamasına boşlukları ve noktalama işaretlerini dahil etmez."
	in_lang["guiHintKey3"]            = "Tanımlı noktalama işaretleri\n. , : ; ? ! ' \" ... -"
	in_lang["guiHintKey4"]            = "Geçerli satırın bitiş süresi ile sonraki satırın başlangıç süresi arasındaki süre bu değerden az ise"
	in_lang["key1"]                   = "Atlanacak satır bulunamadı."
	in_lang["key2"]                   = "[{%1} satır bulundu]\n{%2}"
	in_lang["key3"]                   = "{%1}  [Toplam {%2} satır]"
	in_lang["logKey1"]                = "Satır süresi az"
	in_lang["logKey2"]                = "Satır süresi fazla"
	in_lang["logKey3"]                = "Mevcut satırla sonraki satır arasındaki süre az"
	in_lang["logKey4"]                = "Yüksek saniye başına karakter sayısı değeri"
	in_lang["logKey5"]                = "Üst üste binen satır"
	in_lang["logKey6"]                = "Karakter sınırını aşma"
	in_lang["logKey7"]                = "Bölünen satırda karakter sınırını aşma"
	in_lang["logKey8"]                = "Birden fazla"
	in_lang["logKey9"]                = "Satırın başında ve sonunda"
	in_lang["logKey10"]               = "Satırın başında"
	in_lang["logKey11"]               = "Satırın sonunda"
	in_lang["logKey12"]               = "Satır bölme karakterinden önce ve sonra"
	in_lang["logKey13"]               = "Satır bölme karakterinden önce"
	in_lang["logKey14"]               = "Satır bölme karakterinden sonra"
	in_lang["logKey15"]               = "Noktalama işaretlerinden önce veya sonra"
	in_lang["logKey16"]               = "Tanımsız stil"
	in_lang["logKey17"]               = "Karaoke etiketlerinin süresi"
	in_lang["logKey18"]               = "Karaoke etiketlerinin boşlukları"
	in_lang["logKey19"]               = "Aynı türden yanyana noktalamalar"
	in_lang["logKey20"]               = "Eksik noktalamalar"
	in_lang["outputKey1_line"]        = "S"
	in_lang["outputKey1_char"]        = "K"
	in_lang["out"]                    = "["..langs[1].script_name.."]"
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
	in_lang["cModeListNameKey1"]      = "TIME CHECKS"
	in_lang["cModeListNameKey2"]      = "CHARACTER CHECKS"
	in_lang["cModeListNameKey3"]      = "WHITESPACE CHECKS"
	in_lang["cModeListNameKey4"]      = "STYLE CHECK"
	in_lang["cModeListNameKey5"]      = "KARAOKE CHECKS"
	in_lang["cModeListNameKey6"]      = "PUNCTUATION CHECKS"
	in_lang["cModeListShortNameKey1"] = "Time"
	in_lang["cModeListShortNameKey2"] = "Char"
	in_lang["cModeListShortNameKey3"] = "Whitespace"
	in_lang["cModeListShortNameKey4"] = "Style"
	in_lang["cModeListShortNameKey5"] = "Karaoke"
	in_lang["cModeListShortNameKey6"] = "Punctuation"
	in_lang["cModeFormat"]            = "[{%1}] {%2}"
	in_lang["guiLabelKey1"]           = "Less than:"
	in_lang["guiLabelKey2"]           = "More than:"
	in_lang["guiLabelKey3"]           = "Time difference is less than:"
	in_lang["guiLabelKey4"]           = "Characters per second:"
	in_lang["guiLabelKey5"]           = "Overlapping line"
	in_lang["guiLabelKey6"]           = "Limit:"
	in_lang["guiLabelKey7"]           = "Limit of breaking line:"
	in_lang["guiLabelKey8"]           = "More than one"
	in_lang["guiLabelKey9"]           = "Before and after line"
	in_lang["guiLabelKey10"]          = "Before and after line break"
	in_lang["guiLabelKey11"]          = "Before and after punctuation"
	in_lang["guiLabelKey12"]          = "[APPLY LINES]"
	in_lang["guiLabelKey13"]          = "Ignore whitespaces and punctuations"
	in_lang["guiLabelKey14"]          = "View report"
	in_lang["guiLabelKey15"]          = "Line with undefined style"
	in_lang["guiLabelKey16"]          = "Duration of karaoke tags"
	in_lang["guiLabelKey17"]          = "Whitespaces of karaoke tags"
	in_lang["guiLabelKey18"]          = "Double"
	in_lang["guiLabelKey19"]          = "Missing (for the end of line)"
	in_lang["guiHintKey1"]            = "Mark this box to apply all the options below."
	in_lang["guiHintKey2"]            = "It doesn't include the whitespaces and punctuations for character calculation."
	in_lang["guiHintKey3"]            = "Defined punctuations\n. , : ; ? ! ' \" ... -"
	in_lang["guiHintKey4"]            = "If the duration between the end time of the current line and the start time of the next line is less than this value"
	in_lang["key1"]                   = "No lines found to jump."
	in_lang["key2"]                   = "[{%1:# [line][lines]} found]\n{%2}"
	in_lang["key3"]                   = "{%1}  [Total {%2:# [line][lines]}]"
	in_lang["logKey1"]                = "Line duration is short"
	in_lang["logKey2"]                = "Line duration is long"
	in_lang["logKey3"]                = "Time difference is short"
	in_lang["logKey4"]                = "High CPS"
	in_lang["logKey5"]                = "Overlap line"
	in_lang["logKey6"]                = "Exceed character limit"
	in_lang["logKey7"]                = "Exceed character limit in breaking line"
	in_lang["logKey8"]                = "One or more"
	in_lang["logKey9"]                = "At the beginning and ending of the line"
	in_lang["logKey10"]               = "At the beginning of the line"
	in_lang["logKey11"]               = "At the ending of the line"
	in_lang["logKey12"]               = "Before and after the line break character"
	in_lang["logKey13"]               = "Before the line break character"
	in_lang["logKey14"]               = "After the line break character"
	in_lang["logKey15"]               = "Before or after punctuations"
	in_lang["logKey16"]               = "Undefined style"
	in_lang["logKey17"]               = "Duration of karaoke tags"
	in_lang["logKey18"]               = "Whitespaces of karaoke tags"
	in_lang["logKey19"]               = "Double punctuations"
	in_lang["logKey20"]               = "Missing punctuations"
	in_lang["outputKey1_line"]        = "L"
	in_lang["outputKey1_char"]        = "C"
	in_lang["out"]                    = "["..langs[2].script_name.."]"
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
	script_version            = "1.0.2"
	script_author             = "Magnum357"
	script_mag_version        = "1.1.4.6"
	script_file_name          = "mag.check_lines"
	script_file_ext           = ".lua"

	include_unicode           = true
	mag_import, mag           = pcall(require, "mag")

	if mag_import then
	mag.lang                  = c_lang_switch

	c_lock_gui                = false
	c_buttons1                = {c_lang.buttonKey1, c_lang.buttonKey2}
	c_buttons2                = {c_lang.buttonKey3, c_lang.buttonKey2}

	c                         = {}
	c.time                    = true
	c.time_min                = false
	c.time_min_value          = "0:00:00.70"
	c.time_max                = false
	c.time_max_value          = "0:00:06.00"
	c.time_next_min           = false
	c.time_next_min_value     = "0:00:00.06"
	c.time_cps                = false
	c.time_cps_value          = 25
	c.time_overlap            = false
	c.char                    = true
	c.char_max                = false
	c.char_max_value          = 44
	c.char_range              = false
	c.char_range_value        = 44
	c.space                   = true
	c.space_double            = false
	c.space_line              = false
	c.space_break_line        = false
	c.space_punc              = false
	c.apply1                  = mag.window.lang.message("select")
	c.comment_mode1           = true
	c.empty_mode1             = true
	c.apply2                  = mag.window.lang.message("select")
	c.comment_mode2           = true
	c.empty_mode2             = true
	c.space_and_punc          = false
	c.view_report             = true
	c.style                   = true
	c.style_undefined         = false
	c.karaoke                 = false
	c.ktag_duration           = false
	c.ktag_space              = false
	c.punc                    = true
	c.punc_double             = false
	c.punc_missing            = false

	c_output_signs            = {}
	c_output_signs.formatKey1 = "{%2}: {%1}"
	c_output_signs.formatKey2 = "{%1} / {%2}"
	c_output_signs.key1       = "({%s}-)"
	c_output_signs.key2       = "({%s}+)"
	c_output_signs.key3       = "({%s}!)"
	c_output_signs.key4       = "("..c_lang.outputKey1_char.."{%s})"
	c_output_signs.key5       = "("..c_lang.outputKey1_line.."{%s}+)"
	c_output_signs.key6       = "({%s})"
	c_output_signs.key7       = "({%s}N)"
	c_output_signs.key8       = "{%s}->{%s}+"
	c_output_signs.key9       = "({%s})"
	c_output_signs.key10      = "( "..c_lang.outputKey1_line.." )"
	c_output_signs.key11      = "( "..c_lang.outputKey1_line..")"
	c_output_signs.key12      = "("..c_lang.outputKey1_line.." )"
	c_output_signs.key13      = "( \\N )"
	c_output_signs.key14      = "( \\N)"
	c_output_signs.key15      = "(\\N )"
	c_output_signs.key16      = "({%s})x{%s}"
	c_output_signs.key17      = "({%s})"
	c_output_signs.key18      = "(?)"
	c_output_signs.key19      = "({%s} ms+)"
	c_output_signs.key20      = "({%s} ms-)"
	c_output_signs.key21      = "{ k{%s} }"
	c_output_signs.key22      = "{ k{%s}}"
	c_output_signs.key23      = "{k{%s} }"
	c_output_signs.key24      = "{k{%s} !}"

	gui                       = {
		main1               = {
	 	time                = {class = "checkbox", name = "u_time",                                    x = 0, y = 0,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey1, c_lang.cModeListNameKey1), hint = c_lang.guiHintKey1},
		                      {class = "label",                                                        x = 0, y = 1,  width = 1, height = 1, label = mag.string.wall(" ", 4)},
		time_min            = {class = "checkbox", name = "u_time_min",                                x = 1, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey1},
		time_min_value      = {class = "edit",     name = "u_time_min_value",                          x = 2, y = 1,  width = 1, height = 1},
		time_max            = {class = "checkbox", name = "u_time_max",                                x = 1, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey2},
		time_max_value      = {class = "edit",     name = "u_time_max_value",                          x = 2, y = 2,  width = 1, height = 1},
		time_next_min       = {class = "checkbox", name = "u_time_next_min",                           x = 1, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey3, hint = c_lang.guiHintKey4},
		time_next_min_value = {class = "edit",     name = "u_time_next_min_value",                     x = 2, y = 3,  width = 1, height = 1},
		time_cps            = {class = "checkbox", name = "u_time_cps",                                x = 1, y = 4,  width = 1, height = 1, label = c_lang.guiLabelKey4},
		time_cps_value      = {class = "intedit",  name = "u_time_cps_value",      min = 15, max = 70, x = 2, y = 4,  width = 1, height = 1},
		time_overlap        = {class = "checkbox", name = "u_time_overlap",                            x = 1, y = 5,  width = 1, height = 1, label = c_lang.guiLabelKey5},
		char                = {class = "checkbox", name = "u_char",                                    x = 0, y = 6,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey2, c_lang.cModeListNameKey2), hint = c_lang.guiHintKey1},
		char_max            = {class = "checkbox", name = "u_char_max",                                x = 1, y = 7,  width = 1, height = 1, label = c_lang.guiLabelKey6},
		char_max_value      = {class = "intedit",  name = "u_char_max_value",      min = 35, max = 55, x = 2, y = 7,  width = 1, height = 1},
		char_range          = {class = "checkbox", name = "u_char_range",                              x = 1, y = 8,  width = 1, height = 1, label = c_lang.guiLabelKey7},
		char_range_value    = {class = "intedit",  name = "u_char_range_value",    min = 35, max = 55, x = 2, y = 8,  width = 1, height = 1},
		punc                = {class = "checkbox", name = "u_punc",                                    x = 0, y = 9,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey6, c_lang.cModeListNameKey6), hint = c_lang.guiHintKey1},
		punc_double         = {class = "checkbox", name = "u_punc_double",                             x = 1, y = 10, width = 1, height = 1, label = c_lang.guiLabelKey18},
		punc_missing        = {class = "checkbox", name = "u_punc_missing",                            x = 1, y = 11, width = 1, height = 1, label = c_lang.guiLabelKey19},
		                      {class = "label",                                                        x = 3, y = 0,  width = 1, height = 1, label = mag.string.wall(" ", 12)},
		                      {class = "label",                                                        x = 4, y = 1,  width = 1, height = 1, label = mag.string.wall(" ", 4)},
		space               = {class = "checkbox", name = "u_space",                                   x = 4, y = 0,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey3, c_lang.cModeListNameKey3), hint = c_lang.guiHintKey1},
		space_double        = {class = "checkbox", name = "u_space_double",                            x = 5, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey8},
		space_line          = {class = "checkbox", name = "u_space_line",                              x = 5, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey9},
		space_break_line    = {class = "checkbox", name = "u_space_break_line",                        x = 5, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey10},
		space_punc          = {class = "checkbox", name = "u_space_punc",                              x = 5, y = 4,  width = 1, height = 1, label = c_lang.guiLabelKey11, hint = c_lang.guiHintKey3},
		style               = {class = "checkbox", name = "u_style",                                   x = 4, y = 5,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey4, c_lang.cModeListNameKey4), hint = c_lang.guiHintKey1},
		style_undefined     = {class = "checkbox", name = "u_style_undefined",                         x = 5, y = 6,  width = 1, height = 1, label = c_lang.guiLabelKey15},
		karaoke             = {class = "checkbox", name = "u_karaoke",                                 x = 4, y = 7,  width = 3, height = 1, label = mag.string.format(c_lang.cModeFormat, c_lang.cModeListShortNameKey5, c_lang.cModeListNameKey5), hint = c_lang.guiHintKey1},
		ktag_duration       = {class = "checkbox", name = "u_ktag_duration",                           x = 5, y = 8,  width = 1, height = 1, label = c_lang.guiLabelKey16},
		ktag_space          = {class = "checkbox", name = "u_ktag_space",                              x = 5, y = 9,  width = 1, height = 1, label = c_lang.guiLabelKey17},
		                      {class = "label",                                                        x = 0, y = 12, width = 3, height = 1, label = c_lang.guiLabelKey12},
		apply1              = {class = "dropdown", name = "u_apply_lines1",                            x = 0, y = 13, width = 6, height = 1, hint = mag.window.lang.message("style_hint1")},
		comment_mode1       = {class = "checkbox", name = "u_comment_mode1",                           x = 0, y = 14, width = 6, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode1         = {class = "checkbox", name = "u_empty_mode1",                             x = 0, y = 15, width = 6, height = 1, label = mag.window.lang.message("empty_mode")},
		space_and_punc      = {class = "checkbox", name = "u_space_and_punc",                          x = 0, y = 16, width = 6, height = 1, label = c_lang.guiLabelKey13, hint = c_lang.guiHintKey2},
		log                 = {class = "checkbox", name = "u_log",                                     x = 0, y = 17, width = 6, height = 1, label = c_lang.guiLabelKey14},
		},
		main2               = {
		                      {class = "label",                                                        x = 0, y = 0,  width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply2              = {class = "dropdown", name = "u_apply_lines2",                            x = 1, y = 0,  width = 1, height = 1, hint = mag.window.lang.message("style_hint1")},
		comment_mode2       = {class = "checkbox", name = "u_comment_mode2",                           x = 1, y = 1,  width = 1, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode2         = {class = "checkbox", name = "u_empty_mode2",                             x = 1, y = 2,  width = 1, height = 1, label = mag.window.lang.message("empty_mode")},
		}
	}
	end

	function len(str)
	str = mag.strip.bracket(str)
	str = strip_special(str)
	if c.space_and_punc then
	str = mag.strip.space(str)
	str = mag.strip.punc(str)
	end
	return mag.convert.len(str)
	end

	function strip_special(str) return mag.gsub(str, "\\[nNh]", " ") end

	function time(time) return mag.convert.time_from_ms(mag.convert.ms_from_time(time)) end

	function check_lines(subs,sel)
	local lines, index
	local report_counter  = {}
	local pcs             = false
	local lines_index     = mag.line.index(subs, sel, c.apply1, c.comment_mode1, c.empty_mode1)
	local undefined_style = false
	local styles
	if c.time or c.time_next_min or c.time_overlap then
		if lines_index[1] ~= nil then
		lines_index = mag.sort.index(subs, lines_index)
		end
	end
	if c.style or c.style_undefined then
	styles = mag.list.style(subs)
	end
	for n = 1, 20 do mag.array.insert(report_counter, 0) end
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	index        = lines_index[i]
	line         = subs[index]
	local result = ""
	local check  = ""
	local strip_line, strip_line2, text_len, temp_line
	text_len    = len(line.text)
	strip_line  = mag.strip.bracket(line.text)
	strip_line2 = strip_special(strip_line)
		if c.time or c.time_min or c.time_max or c.time_next_min or c.time_cps or c.time_overlap then
		local dur
			if line.end_time > line.start_time then
			dur = line.end_time - line.start_time
			else
			dur = 0
			end
			if c.time or c.time_min then
				if dur < mag.convert.ms_from_time(c.time_min_value) then
				if c.view_report then report_counter[1] = report_counter[1] + 1 end
				check = mag.string.combine(check, mag.string.format(c_output_signs.key1, mag.convert.time_from_ms(mag.convert.ms_from_time(c.time_min_value) - dur)), "{%s}, {%s}")
				end
			end
			if c.time or c.time_max then
				if dur > mag.convert.ms_from_time(c.time_max_value) then
				if c.view_report then report_counter[2] = report_counter[2] + 1 end
				check = mag.string.combine(check, mag.string.format(c_output_signs.key2, mag.convert.time_from_ms(dur - mag.convert.ms_from_time(c.time_max_value))), "{%s}, {%s]")
				end
			end
			if c.time or c.time_next_min then
				if lines_index[i + 1] ~= nil then
				local next_line = subs[lines_index[i + 1]]
					if next_line.start_time > line.end_time then
					local dur2 = next_line.start_time - line.end_time
						if dur2 < mag.convert.ms_from_time(c.time_next_min_value) then
						if c.view_report then report_counter[3] = report_counter[3] + 1 end
						check = mag.string.combine(check, mag.string.format(c_output_signs.key3, mag.convert.time_from_ms(dur2)), "{%s}, {%s}")
						end
					end
				end
			end
			if c.time or c.time_cps or c.time_overlap then
				if dur > 0 then
					if c.time or c.time_cps then
					local cps
					cps = text_len / dur
					cps = mag.floor(cps * 1000)
						if mag.n(c.time_cps_value) <= cps then
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
		if c.char or c.char_max or c.char_range then
			if not mag.match(strip_line, "\\N") then
				if c.char or c.char_max then
					if text_len >= mag.n(c.char_max_value) then
					if c.view_report then report_counter[6] = report_counter[6] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key6, text_len), "{%s}, {%s}")
					end
				end
			else
				if c.char or c.char_range then
				local split_breaking = mag.string.split(true, mag.gsub(strip_line, "\\h", " "), "\\N")
				local breaking_len   = {}
					for b = 1, #split_breaking do
					mag.array.insert(breaking_len, len(split_breaking[b]))
					end
				mag.sort.basic(breaking_len)
					if breaking_len[#breaking_len] >= mag.n(c.char_range_value) then
					if c.view_report then report_counter[7] = report_counter[7] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key7, breaking_len[#breaking_len]), "{%s}, {%s}")
					end
				end
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey2, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
		if c.space or c.space_double or c.space_break_line or c.space_line or c.space_punc then
			if c.space or c.space_double then
			temp_line         = strip_line2
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
					if c.view_report then report_counter[8] = report_counter[8] + 1 end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key9, space_info), "{%s}, {%s}")
					end
				end
			end
			if c.space or c.space_line then
				if mag.find(strip_line2, "%s") == 1 and mag.find(mag.reverse(strip_line2), "%s") == 1 then
				if c.view_report then report_counter[9] = report_counter[9] + 1 end
				check = mag.string.combine(check, c_output_signs.key10, "{%s}, {%s}")
				elseif mag.find(strip_line2, "%s") == 1 then
				if c.view_report then report_counter[10] = report_counter[10] + 1 end
				check = mag.string.combine(check, c_output_signs.key11, "{%s}, {%s}")
				elseif mag.find(mag.reverse(strip_line2), "%s") == 1 then
				if c.view_report then report_counter[11] = report_counter[11] + 1 end
				check = mag.string.combine(check, c_output_signs.key12, "{%s}, {%s}")
				end
			end
			if c.space or c.space_break_line then
				if mag.match(strip_line, "%s\\N%s") then
				if c.view_report then report_counter[12] = report_counter[12] + 1 end
				check = mag.string.combine(check, c_output_signs.key13, "{%s}, {%s}")
				elseif mag.match(strip_line, "%s\\N") then
				if c.view_report then report_counter[13] = report_counter[13] + 1 end
				check = mag.string.combine(check, c_output_signs.key14, "{%s}, {%s}")
				elseif mag.match(strip_line, "\\N%s") then
				if c.view_report then report_counter[14] = report_counter[14] + 1 end
				check = mag.string.combine(check, c_output_signs.key15, "{%s}, {%s}")
				end
			end
			if c.space or c.space_punc then
			local isl = false
			local punc_count
			punc_count = mag.string.count(strip_line2.."abc", "%s%.[^%.]")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, " .", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "%s%,")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, " ,", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "%s%!")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, " !", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "%s%?")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, " ?", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "%s%:")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, " :", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "%s%;")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, " ;", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "%s%'")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, " '", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "%'%s")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, "' ", punc_count), "{%s}, {%s}") end
			temp_line = mag.match(strip_line2, "\".-\"")
				if temp_line then
					if mag.match(temp_line, "\"%s") and mag.match(temp_line, "%s\"") then
					if c.view_report then isl = true end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key17, " \" "), "{%s}, {%s}")
					elseif mag.match(temp_line, "\"%s") then
					if c.view_report then isl = true end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key17, "\" "), "{%s}, {%s}")
					elseif mag.match(temp_line, "%s\"") then
					if c.view_report then isl = true end
					check = mag.string.combine(check, mag.string.format(c_output_signs.key17, " \""), "{%s}, {%s}")
					end
				end
			punc_count = mag.string.count(strip_line2, "[^%p%s]%.[^%p%s]")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, ". *", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "[^%p%s]%,[^%p%s]")
			if punc_count > 0 then if c.view_report then isl = true end  check = mag.string.combine(check, mag.string.format(c_output_signs.key16, ", *", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "[^%p%s]%![^%p%s]")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, "! *", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "[^%p%s]%?[^%p%s]")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, ", ?", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "[^%p%s]%;[^%p%s]")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, "; *", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "[^%p%s%d]%:[^%p%s]")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, ": *", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "%-%.*".."["..mag.pattern.uppercase.."]")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, "- *", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "["..mag.pattern.punc.."]".."%-")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key16, "* -", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "["..mag.pattern.lowercase.."]".."%-%s+".."["..mag.pattern.lowercase.."]")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key3, "- ", punc_count), "{%s}, {%s}") end
			punc_count = mag.string.count(strip_line2, "["..mag.pattern.lowercase.."]".."%s+%-".."["..mag.pattern.lowercase.."]")
			if punc_count > 0 then if c.view_report then isl = true end check = mag.string.combine(check, mag.string.format(c_output_signs.key3, " -", punc_count), "{%s}, {%s}") end
			if c.view_report and isl then report_counter[15] = report_counter[15] + 1 end
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey3, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
		if c.style or c.style_undefined then
			if lines_index[i - 1] ~= nil then
			local prev_line = subs[lines_index[i - 1]]
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
			if c.view_report then report_counter[16] = report_counter[16] + 1 end
			check = mag.string.combine(check, mag.string.format(c_output_signs.key18), "{%s}, {%s}")
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey4, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
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
					if c.view_report then report_counter[17] = report_counter[17] + 1 end
						if ldur > line_duration then
						check = mag.string.combine(check, mag.string.format(c_output_signs.key19, ldur - line_duration), "{%s}, {%s}")
						elseif ldur < line_duration then
						check = mag.string.combine(check, mag.string.format(c_output_signs.key20, mag.convert.positive(ldur - line_duration)), "{%s}, {%s}")
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
				if c.view_report then report_counter[18] = report_counter[18] + 1 end
				check = mag.string.combine(check, mag.string.format(c_output_signs.key17, kt), "{%s}, {%s}")
				end
			end
		end
		if check ~= "" then
		check  = mag.string.combine(check,  c_lang.cModeListShortNameKey5, c_output_signs.formatKey1)
		result = mag.string.combine(result, check,                         c_output_signs.formatKey2)
		check  = ""
		end
		if c.punc or c.punc_double then
			local pis = false
			if mag.match(strip_line2, "%?%?") then
			if c.view_report then pis = true end
			check = mag.string.combine(check, mag.string.format(c_output_signs.key17, "??"), "{%s}, {%s}")
			end
			if mag.match(strip_line2, "%!%!") then
			if c.view_report then pis = true end
			check = mag.string.combine(check, mag.string.format(c_output_signs.key17, "!!"), "{%s}, {%s}")
			end
			if mag.match(strip_line2, ",,") then
			if c.view_report then pis = true end
			check = mag.string.combine(check, mag.string.format(c_output_signs.key17, ",,"), "{%s}, {%s}")
			end
			if mag.match(strip_line2, "%'%'") then
			if c.view_report then pis = true end
			check = mag.string.combine(check, mag.string.format(c_output_signs.key17, "''"), "{%s}, {%s}")
			end
			if mag.match(strip_line2, "::") then
			if c.view_report then pis = true end
			check = mag.string.combine(check, mag.string.format(c_output_signs.key17, "::"), "{%s}, {%s}")
			end
			if mag.match(strip_line2, ";;") then
			if c.view_report then pis = true end
			check = mag.string.combine(check, mag.string.format(c_output_signs.key17, ";;"), "{%s}, {%s}")
			end
			if mag.match(strip_line2, "\"\"") then
			if c.view_report then pis = true end
			check = mag.string.combine(check, mag.string.format(c_output_signs.key17, "\"\""), "{%s}, {%s}")
			end
			if mag.match("abc"..strip_line2.."abc", "[^%.]%.%s*%.[^%.]") or mag.match("abc"..strip_line2.."abc", "[^%.]%.%s*%.%s*%.%s*%.[^%.]") then
			if c.view_report then pis = true end
			check = mag.string.combine(check, mag.string.format(c_output_signs.key17, ".."), "{%s}, {%s}")
			end
			if pis == true then report_counter[19] = report_counter[19] + 1 end
		end
		if c.punc or c.punc_missing then
			if mag.find(mag.reverse(strip_line2 .. " "), "%s+[^%s" .. mag.pattern.punc .. "]") == 1 then
				check = mag.string.combine(check, mag.string.format(c_output_signs.key17, ".?"), "{%s}, {%s}")
				if c.view_report then report_counter[20] = report_counter[20] + 1 end
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
	local first_row = false
		local function write_report(l_start,l_end,g_id)
		local row_space     = ""
		local all_err       = ""
		local total_problem = 0
			for i = l_start, l_end do
				if report_counter[i] > 0 then
				if all_err == "" then row_space = "" else row_space = "\n\n" end
				local errTitle = c_lang["logKey"..i]
				all_err       = all_err .. row_space .. mag.string.format(c_lang.key2, report_counter[i], errTitle)
				total_problem = total_problem + report_counter[i]
				end
			end
			if all_err ~= "" then
			local err_header = ""
			local report     = ""
			err_header = mag.string.format(c_lang.key3,  c_lang["cModeListNameKey"..g_id], total_problem)
			err_header = mag.string.format("{%1}\n{%2}", err_header,                       mag.string.wall("-", 114))
			report     = err_header .. "\n" .. all_err
			if first_row == true then report = "\n\n\n\n" .. report end
			mag.show.basic_log(report, "nobreak")
			if first_row == false then first_row = true end
			end
		end
	write_report(1,  5,  1)
	write_report(6,  7,  2)
	write_report(8,  15, 3)
	write_report(16, 16, 4)
	write_report(17, 18, 5)
	write_report(19, 20, 6)
	end
	mag.show.no_op(pcs)
	end

	function remove_check_lines(subs,sel)
	local line, index
	local pcs         = false
	local lines_index = mag.line.index(subs, sel, c.apply2, c.comment_mode2, c.empty_mode2)
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

	function add_macro1(subs,sel)
	local apply_items      = mag.list.full_apply(subs, sel, "comment")
	c.apply1               = mag.array.search_apply(apply_items, c.apply1)
	gui.main1.apply1.items = apply_items
	local ok, config
	repeat
	gui.main1.time.value                = c.time
	gui.main1.time_min.value            = c.time_min
	gui.main1.time_min_value.value      = c.time_min_value
	gui.main1.time_max.value            = c.time_max
	gui.main1.time_max_value.value      = c.time_max_value
	gui.main1.time_next_min.value       = c.time_next_min
	gui.main1.time_next_min_value.value = c.time_next_min_value
	gui.main1.time_cps.value            = c.time_cps
	gui.main1.time_cps_value.value      = c.time_cps_value
	gui.main1.time_overlap.value        = c.time_overlap
	gui.main1.char.value                = c.char
	gui.main1.char_max.value            = c.char_max
	gui.main1.char_max_value.value      = c.char_max_value
	gui.main1.char_range.value          = c.char_range
	gui.main1.char_range_value.value    = c.char_range_value
	gui.main1.space.value               = c.space
	gui.main1.space_double.value        = c.space_double
	gui.main1.space_line.value          = c.space_line
	gui.main1.space_break_line.value    = c.space_break_line
	gui.main1.space_punc.value          = c.space_punc
	gui.main1.apply1.value              = c.apply1
	gui.main1.comment_mode1.value       = c.comment_mode1
	gui.main1.empty_mode1.value         = c.empty_mode1
	gui.main1.space_and_punc.value      = c.space_and_punc
	gui.main1.log.value                 = c.view_report
	gui.main1.style.value               = c.style
	gui.main1.style_undefined.value     = c.style_undefined
	gui.main1.karaoke.value             = c.karaoke
	gui.main1.ktag_duration.value       = c.ktag_duration
	gui.main1.ktag_space.value          = c.ktag_space
	gui.main1.punc.value                = c.punc
	gui.main1.punc_double.value         = c.punc_double
	gui.main1.punc_missing.value        = c.punc_missing
	ok, config                          = mag.window.dialog(gui.main1, c_buttons1)
	c.time                              = config.u_time
	c.time_min                          = config.u_time_min
	c.time_min_value                    = time(config.u_time_min_value)
	c.time_max                          = config.u_time_max
	c.time_max_value                    = time(config.u_time_max_value)
	c.time_next_min                     = config.u_time_next_min
	c.time_next_min_value               = time(config.u_time_next_min_value)
	c.time_cps                          = config.u_time_cps
	c.time_cps_value                    = config.u_time_cps_value
	c.time_overlap                      = config.u_time_overlap
	c.char                              = config.u_char
	c.char_max                          = config.u_char_max
	c.char_max_value                    = config.u_char_max_value
	c.char_range                        = config.u_char_range
	c.char_range_value                  = config.u_char_range_value
	c.space                             = config.u_space
	c.space_double                      = config.u_space_double
	c.space_line                        = config.u_space_line
	c.space_break_line                  = config.u_space_break_line
	c.space_punc                        = config.u_space_punc
	c.apply1                            = config.u_apply_lines1
	c.comment_mode1                     = config.u_comment_mode1
	c.empty_mode1                       = config.u_empty_mode1
	c.space_and_punc                    = config.u_space_and_punc
	c.view_report                       = config.u_log
	c.style                             = config.u_style
	c.style_undefined                   = config.u_style_undefined
	c.karaoke                           = config.u_karaoke
	c.ktag_duration                     = config.u_ktag_duration
	c.ktag_space                        = config.u_ktag_space
	c.punc                              = config.u_punc
	c.punc_double                       = config.u_punc_double
	c.punc_missing                      = config.u_punc_missing
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply1 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	check_lines(subs, sel)
	end
	end

	function add_macro2(subs,sel,act)
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
	local apply_items      = mag.list.full_apply(subs, sel, "comment")
	c.apply2               = mag.array.search_apply(apply_items, c.apply2)
	gui.main2.apply2.items = apply_items
	local ok, config
	repeat
	gui.main2.apply2.value        = c.apply2
	gui.main2.comment_mode2.value = c.comment_mode2
	gui.main2.empty_mode2.value   = c.empty_mode2
	ok, config                    = mag.window.dialog(gui.main2, c_buttons2)
	c.apply2                      = config.u_apply_lines2
	c.comment_mode2               = config.u_comment_mode2
	c.empty_mode2                 = config.u_empty_mode2
	until ok == mag.convert.ascii(c_buttons2[1]) and c.apply2 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons2[2])
	if ok == mag.convert.ascii(c_buttons2[1]) then
	remove_check_lines(subs, sel)
	end
	end

	function check_macro1(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro1, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro2(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro2, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro3(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro3, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro4(subs,sel)
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
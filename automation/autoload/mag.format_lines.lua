	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Biçimlendir", sub_menu = "Satır/Biçimlendir"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Format Lines",      sub_menu = "Lines/Format"}
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
	in_lang["module_incompatible"] = "Mag modülünün kurulu sürümü bu lua dosyası ile uyumsuz!\n\nModül dosyasının en az \"%s\" sürümü veya daha üstü gerekiyor.\n\n\nŞimdi indirme sayfasına gitmek ister misiniz?"
	in_lang["module_not_found"]    = "Mag modülü bulunamadı!\n\nBu lua dosyasını kullanmak için Mag modülünü indirip Aegisub programı kapalıyken\n\"Aegisub/automation/include/\" dizinine taşımanız gerekiyor.\n\n\nŞimdi indirme sayfasına gitmek ister misiniz?"
	in_lang["module_yes"]          = "Git"
	in_lang["module_no"]           = "Daha Sonra"
	in_lang["sub_menu"]            = langs[1].sub_menu
	in_lang["s_name"]              = langs[1].script_name
	in_lang["s_desc"]              = "Eğiklik, hizalama ve şeffaflık geçişi etiketleri ekler."
	in_lang["tabKey1"]             = "Eğik Yazı"
	in_lang["tabKey2"]             = "Son Tercihler"
	in_lang["tabKey3"]             = "Hizalama"
	in_lang["tabKey4"]             = "Şeffaflık"
	in_lang["tabKey5"]             = "Geçiş (Basit)"
	in_lang["tabKey6"]             = "Geçiş (Ayrıntılı)"
	in_lang["anListKey1"]          = "(an1) Alt - Sol"
	in_lang["anListKey2"]          = "(an2) Alt - Orta"
	in_lang["anListKey3"]          = "(an3) Alt - Sağ"
	in_lang["anListKey4"]          = "(an4) Orta - Sol"
	in_lang["anListKey5"]          = "(an5) Orta - Orta"
	in_lang["anListKey6"]          = "(an6) Orta - Sağ"
	in_lang["anListKey7"]          = "(an7) Üst - Sol"
	in_lang["anListKey8"]          = "(an8) Üst - Orta"
	in_lang["anListKey9"]          = "(an9) Üst - Sağ"
	in_lang["aListKey1"]           = "(alpha) Tüm Renkler"
	in_lang["aListKey2"]           = "(1a) İç Renk"
	in_lang["aListKey3"]           = "(2a) Karaoke Rengi"
	in_lang["aListKey4"]           = "(3a) Dış Renk"
	in_lang["aListKey5"]           = "(4a) Gölge Rengi"
	in_lang["buttonKey1"]          = "Uygula"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["guiLabel1"]           = "Hizalama:"
	in_lang["guiLabel2"]           = "Şeffaflık:"
	in_lang["guiLabel3"]           = "Değer (yüzdelik):"
	in_lang["guiLabel4"]           = "[T1] Başlangıç (ms):"
	in_lang["guiLabel5"]           = "[T2] Bitiş (ms):"
	in_lang["guiLabel6"]           = "[A1] Başlangıç görünürlüğü (yüzde):"
	in_lang["guiLabel7"]           = "[A2] Satır görünürlüğü (yüzde):"
	in_lang["guiLabel8"]           = "[A3] Bitiş görünürlüğü (yüzde):"
	in_lang["guiLabel9"]           = "[T1] Başlama zamanı (ms):"
	in_lang["guiLabel10"]          = "[T2] Geçiş süresi (ms):"
	in_lang["guiLabel11"]          = "[T3] Başlama zamanı (ms):"
	in_lang["guiLabel12"]          = "[T4] Geçiş süresi (ms):"
	in_lang["guiLabel13"]          = "T3 ve T4 zamanlarını satır süresinden çıkar"
	in_lang["key1"]                = "Arayüzden ( {%s} ) uygulanacak satırları seçmediğiniz için seçili satırlara işlem yapılacak."
	in_lang["key2"]                = "{%s} etiketi seçmediniz. Bu yüzden en çok kullanılan \"{%s}\" seçeneği seçildi."
	in_lang["key3"]                = "Hizalama"
	in_lang["key4"]                = "Şeffaf yapma"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Adds italic, alignment and transparency tags."
	in_lang["tabKey1"]             = "Italic"
	in_lang["tabKey2"]             = "Last Options"
	in_lang["tabKey3"]             = "Alignment"
	in_lang["tabKey4"]             = "Transparency"
	in_lang["tabKey5"]             = "Fade (Basic)"
	in_lang["tabKey6"]             = "Fade (Complex)"
	in_lang["anListKey1"]          = "(an1) Bottom - Left"
	in_lang["anListKey2"]          = "(an2) Bottom - Center"
	in_lang["anListKey3"]          = "(an3) Bottom - Right"
	in_lang["anListKey4"]          = "(an4) Middle - Left"
	in_lang["anListKey5"]          = "(an5) Middle - Center"
	in_lang["anListKey6"]          = "(an6) Middle - Right"
	in_lang["anListKey7"]          = "(an7) Top - Left"
	in_lang["anListKey8"]          = "(an8) Top - Center"
	in_lang["anListKey9"]          = "(an9) Top - Right"
	in_lang["aListKey1"]           = "(alpha) All Color"
	in_lang["aListKey2"]           = "(1a) Primary Color"
	in_lang["aListKey3"]           = "(2a) Secondary Color"
	in_lang["aListKey4"]           = "(3a) Outline Color"
	in_lang["aListKey5"]           = "(4a) Shadow Color"
	in_lang["buttonKey1"]          = "Apply"
	in_lang["buttonKey2"]          = "Close"
	in_lang["guiLabel1"]           = "Alignment:"
	in_lang["guiLabel2"]           = "Transparency:"
	in_lang["guiLabel3"]           = "Value (percent):"
	in_lang["guiLabel4"]           = "[T1] Start in (ms):"
	in_lang["guiLabel5"]           = "[T2] End in (ms):"
	in_lang["guiLabel6"]           = "[A1] Starting visibility (percent):"
	in_lang["guiLabel7"]           = "[A2] Line visibility (percent):"
	in_lang["guiLabel8"]           = "[A3] Ending visibility (percent):"
	in_lang["guiLabel9"]           = "[T1] Start time (ms):"
	in_lang["guiLabel10"]          = "[T2] Animation time (ms):"
	in_lang["guiLabel11"]          = "[T3] Start time (ms):"
	in_lang["guiLabel12"]          = "[T4] Animation time (ms):"
	in_lang["guiLabel13"]          = "Take away the times of T3 and T4 from the line duration"
	in_lang["key1"]                = "The selected lines will be processed because you did not select the lines to apply from ( {%s} ) the interface."
	in_lang["key2"]                = "You did not selected any {%s} tag. So the most used \"{%s}\" option selected."
	in_lang["key3"]                = "alignment"
	in_lang["key4"]                = "alpha"
	end
	return in_lang, lang_list, script_name_list, sub_menu_list
	end

	c_lang_switch      = "en"
	c_lang,
	c_lang_list,
	c_script_name_list,
	c_sub_name_list    = lang_switch_keys(c_lang_switch)

	script_name        = c_lang.s_name
	script_description = c_lang.s_desc
	script_version     = "1.1.4"
	script_author      = "Magnum357"
	script_mag_version = "1.1.4.4"
	script_file_name   = "mag.format_lines"
	script_file_ext    = ".lua"

	include_unicode    = true
	mag_import, mag    = pcall(require, "mag")

	if mag_import then
	mag.lang           = c_lang_switch

	c                  = {}
	c.apply1           = mag.window.lang.message("select")
	c.apply2           = mag.window.lang.message("select")
	c.apply3           = mag.window.lang.message("select")
	c.apply4           = mag.window.lang.message("select")
	c.apply5           = mag.window.lang.message("select")
	c.comment_mode1    = true
	c.comment_mode2    = true
	c.comment_mode3    = true
	c.comment_mode4    = true
	c.comment_mode5    = true
	c.empty_mode1      = true
	c.empty_mode2      = true
	c.empty_mode3      = true
	c.empty_mode4      = true
	c.empty_mode5      = true
	c.selected_an_list = mag.window.lang.message("select")
	c.selected_a_list  = mag.window.lang.message("select")
	c.alpha_tag_value  = 0
	c.fad_t1           = 0
	c.fad_t2           = 0
	c.fade_a1          = 100
	c.fade_a2          = 0
	c.fade_a3          = 100
	c.fade_t1          = 0
	c.fade_t2          = 300
	c.fade_t3          = 0
	c.fade_t4          = 300
	c.t3_and_t4        = true

	c_lock_gui         = false
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey2}
	c_buttons2         = c_buttons1
	c_buttons3         = c_buttons1
	c_buttons4         = c_buttons1
	c_buttons5         = c_buttons1

	gui                = {
		main1         = {
		                {class = "label",                                                  x = 0, y = 0, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply1        = {class = "dropdown", name = "u_apply_lines1",                      x = 1, y = 0, width = 1, height = 1},
		comment_mode1 = {class = "checkbox", name = "u_comment_mode1",                     x = 1, y = 1, width = 2, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode1   = {class = "checkbox", name = "u_empty_mode1",                       x = 1, y = 2, width = 2, height = 1, label = mag.window.lang.message("empty_mode")},
		},
		main2         = {
		                {class = "label",                                                  x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabel1},
		an_list       = {class = "dropdown", name = "u_an_list",                           x = 1, y = 0, width = 1, height = 1},
		                {class = "label",                                                  x = 0, y = 1, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply2        = {class = "dropdown", name = "u_apply_lines2",                      x = 1, y = 1, width = 1, height = 1},
		comment_mode2 = {class = "checkbox", name = "u_comment_mode2",                     x = 1, y = 2, width = 2, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode2   = {class = "checkbox", name = "u_empty_mode2",                       x = 1, y = 3, width = 2, height = 1, label = mag.window.lang.message("empty_mode")},
		},
		main3         = {
		                {class = "label",                                                  x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabel2},
		a_list        = {class = "dropdown", name = "u_a_list",                            x = 1, y = 0, width = 1, height = 1},
		                {class = "label",                                                  x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabel3},
		trans_value   = {class = "intedit",  name = "u_a_value",       min = 0, max = 100, x = 1, y = 1, width = 1, height = 1},
		                {class = "label",                                                  x = 0, y = 2, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply3        = {class = "dropdown", name = "u_apply_lines3",                      x = 1, y = 2, width = 1, height = 1},
		comment_mode3 = {class = "checkbox", name = "u_comment_mode3",                     x = 1, y = 3, width = 2, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode3   = {class = "checkbox", name = "u_empty_mode3",                       x = 1, y = 4, width = 2, height = 1, label = mag.window.lang.message("empty_mode")},
		},
		main4         = {
		                {class = "label",                                                  x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabel4},
		fad_start     = {class = "intedit",  name = "u_fad_start",     min = 0,            x = 1, y = 0, width = 1, height = 1},
		                {class = "label",                                                  x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabel5},
		fad_end       = {class = "intedit",  name = "u_fad_end",       min = 0,            x = 1, y = 1, width = 1, height = 1},
		                {class = "label",                                                  x = 0, y = 2, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply4        = {class = "dropdown", name = "u_apply_lines4",                      x = 1, y = 2, width = 1, height = 1},
		comment_mode4 = {class = "checkbox", name = "u_comment_mode4",                     x = 1, y = 3, width = 2, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode4   = {class = "checkbox", name = "u_empty_mode4",                       x = 1, y = 4, width = 2, height = 1, label = mag.window.lang.message("empty_mode")},
		},
		main5         = {
		                {class = "label",                                                 x = 0, y = 0,  width = 1, height = 1, label = c_lang.guiLabel6},
		fade_a1       = {class = "intedit",  name = "u_fade_a1",      min = 0, max = 100, x = 1, y = 0,  width = 1, height = 1},
		                {class = "label",                                                 x = 0, y = 1,  width = 2, height = 1, label = mag.string.wall("-", 10)},
		                {class = "label",                                                 x = 0, y = 2,  width = 1, height = 1, label = c_lang.guiLabel7},
		fade_a2       = {class = "intedit",  name = "u_fade_a2",      min = 0, max = 100, x = 1, y = 2,  width = 1, height = 1},
		                {class = "label",                                                 x = 0, y = 3,  width = 1, height = 1, label = c_lang.guiLabel9},
		fade_t1       = {class = "intedit",  name = "u_fade_t1",      min = 0,            x = 1, y = 3,  width = 1, height = 1},
		                {class = "label",                                                 x = 0, y = 4,  width = 1, height = 1, label = c_lang.guiLabel10},
		fade_t2       = {class = "intedit",  name = "u_fade_t2",      min = 0,            x = 1, y = 4,  width = 1, height = 1},
		                {class = "label",                                                 x = 0, y = 5,  width = 2, height = 1, label = mag.string.wall("-", 10)},
		                {class = "label",                                                 x = 0, y = 6,  width = 1, height = 1, label = c_lang.guiLabel8},
		fade_a3       = {class = "intedit",  name = "u_fade_a3",      min = 0, max = 100, x = 1, y = 6,  width = 1, height = 1},
		                {class = "label",                                                 x = 0, y = 7,  width = 1, height = 1, label = c_lang.guiLabel11},
		fade_t3       = {class = "intedit",  name = "u_fade_t3",      min = 0,            x = 1, y = 7,  width = 1, height = 1},
		                {class = "label",                                                 x = 0, y = 8,  width = 1, height = 1, label = c_lang.guiLabel12},
		fade_t4       = {class = "intedit",  name = "u_fade_t4",      min = 0,            x = 1, y = 8,  width = 1, height = 1},
	                    {class = "label",                                                 x = 0, y = 9,  width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply5        = {class = "dropdown", name = "u_apply_lines5",                     x = 1, y = 9,  width = 1, height = 1},
		t3_and_t4     = {class = "checkbox", name = "u_t3_and_t4",                        x = 0, y = 10, width = 2, height = 1, label = c_lang.guiLabel13},
		comment_mode5 = {class = "checkbox", name = "u_comment_mode5",                    x = 0, y = 11, width = 2, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode5   = {class = "checkbox", name = "u_empty_mode5",                      x = 0, y = 12, width = 2, height = 1, label = mag.window.lang.message("empty_mode")},
		},
	}
	end

	function italic(subs,sel)
	local apply_items      = mag.list.full_apply(subs, sel, "comment")
	c.apply1               = mag.array.search_apply(apply_items, c.apply1)
	gui.main1.apply1.items = apply_items
	local ok, config
	repeat
	gui.main1.apply1.value        = c.apply1
	gui.main1.comment_mode1.value = c.comment_mode1
	gui.main1.empty_mode1.value   = c.empty_mode1
	ok, config                    = mag.window.dialog(gui.main1, c_buttons1)
	c.apply1                      = config.u_apply_lines1
	c.comment_mode1               = config.u_comment_mode1
	c.empty_mode1                 = config.u_empty_mode1
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply1 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	apply_italic(subs, sel)
	end
	end

	function alignment(subs,sel)
	local apply_items       = mag.list.full_apply(subs, sel, "comment")
	c.apply2                = mag.array.search_apply(apply_items, c.apply2)
	gui.main2.apply2.items  = apply_items
	local an_items          = {mag.window.lang.message("select")}
	for i = 9, 1, -1 do mag.array.insert(an_items, c_lang["anListKey"..i]) end
	gui.main2.an_list.items = an_items
	c.selected_an_list      = mag.array.search_apply(an_items, c.selected_an_list)
	local ok, config
	repeat
	gui.main2.an_list.value       = c.selected_an_list
	gui.main2.apply2.value        = c.apply2
	gui.main2.comment_mode2.value = c.comment_mode2
	gui.main2.empty_mode2.value   = c.empty_mode2
	ok, config                    = mag.window.dialog(gui.main2, c_buttons2)
	c.selected_an_list            = config.u_an_list
	c.apply2                      = config.u_apply_lines2
	c.comment_mode2               = config.u_comment_mode2
	c.empty_mode2                 = config.u_empty_mode2
	until ok == mag.convert.ascii(c_buttons2[1]) and c.apply2 ~= mag.window.lang.message("select") and c.selected_an_list ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons2[2])
	if ok == mag.convert.ascii(c_buttons2[1]) then
	apply_alignment(subs, sel)
	end
	end

	function alpha(subs,sel)
	local apply_items      = mag.list.full_apply(subs, sel, "comment")
	c.apply3               = mag.array.search_apply(apply_items, c.apply3)
	gui.main3.apply3.items = apply_items
	local a_items          = {mag.window.lang.message("select")}
	for i = 1, 5 do mag.array.insert(a_items, c_lang["aListKey"..i]) end
	gui.main3.a_list.items = a_items
	c.selected_a_list      = mag.array.search_apply(a_items, c.selected_a_list)
	local ok, config
	repeat
	gui.main3.trans_value.value   = c.alpha_tag_value
	gui.main3.a_list.value        = c.selected_a_list
	gui.main3.apply3.value        = c.apply3
	gui.main3.comment_mode3.value = c.comment_mode3
	gui.main3.empty_mode3.value   = c.empty_mode3
	ok, config                    = mag.window.dialog(gui.main3, c_buttons3)
	c.alpha_tag_value             = config.u_a_value
	c.selected_a_list             = config.u_a_list
	c.apply3                      = config.u_apply_lines3
	c.comment_mode3               = config.u_comment_mode3
	c.empty_mode3                 = config.u_empty_mode3
	until ok == mag.convert.ascii(c_buttons3[1]) and  c.selected_a_list ~= mag.window.lang.message("select") and c.apply3 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons3[2])
	if ok == mag.convert.ascii(c_buttons3[1]) then
	apply_alpha(subs, sel)
	end
	end

	function fad(subs,sel)
	local apply_items      = mag.list.full_apply(subs, sel, "comment")
	c.apply4               = mag.array.search_apply(apply_items, c.apply4)
	gui.main4.apply4.items = apply_items
	local ok, config
	repeat
	gui.main4.fad_start.value     = c.fad_t1
	gui.main4.fad_end.value       = c.fad_t2
	gui.main4.apply4.value        = c.apply4
	gui.main4.comment_mode4.value = c.comment_mode4
	gui.main4.empty_mode4.value   = c.empty_mode4
	ok, config                    = mag.window.dialog(gui.main4, c_buttons4)
	c.fad_t1                      = config.u_fad_start
	c.fad_t2                      = config.u_fad_end
	c.apply4                      = config.u_apply_lines4
	c.comment_mode4               = config.u_comment_mode4
	c.empty_mode4                 = config.u_empty_mode4
	until ok == mag.convert.ascii(c_buttons4[1]) and c.apply4 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons4[2])
	if ok == mag.convert.ascii(c_buttons4[1]) then
	apply_fad(subs, sel)
	end
	end

	function fade(subs,sel)
	local apply_items      = mag.list.full_apply(subs, sel, "comment")
	c.apply5               = mag.array.search_apply(apply_items, c.apply5)
	gui.main5.apply5.items = apply_items
	local ok, config
	repeat
	gui.main5.t3_and_t4.value     = c.t3_and_t4
	gui.main5.fade_a1.value       = c.fade_a1
	gui.main5.fade_a2.value       = c.fade_a2
	gui.main5.fade_a3.value       = c.fade_a3
	gui.main5.fade_t1.value       = c.fade_t1
	gui.main5.fade_t2.value       = c.fade_t2
	gui.main5.fade_t3.value       = c.fade_t3
	gui.main5.fade_t4.value       = c.fade_t4
	gui.main5.apply5.value        = c.apply5
	gui.main5.comment_mode5.value = c.comment_mode5
	gui.main5.empty_mode5.value   = c.empty_mode5
	ok, config                    = mag.window.dialog(gui.main5, c_buttons5)
	c.t3_and_t4                   = config.u_t3_and_t4
	c.fade_a1                     = config.u_fade_a1
	c.fade_a2                     = config.u_fade_a2
	c.fade_a3                     = config.u_fade_a3
	c.fade_t1                     = config.u_fade_t1
	c.fade_t2                     = config.u_fade_t2
	c.fade_t3                     = config.u_fade_t3
	c.fade_t4                     = config.u_fade_t4
	c.apply5                      = config.u_apply_lines5
	c.comment_mode5               = config.u_comment_mode5
	c.empty_mode5                 = config.u_empty_mode5
	until ok == mag.convert.ascii(c_buttons5[1]) and c.apply5 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons5[2])
	if ok == mag.convert.ascii(c_buttons5[1]) then
	apply_fade(subs, sel)
	end
	end

	function apply_italic(subs,sel)
	local pcs = false
	local line, index
	local lines_index = mag.line.index(subs, sel, c.apply1, c.comment_mode1, c.empty_mode1)
	for i = 1, #lines_index do
	if not pcs then pcs = true end
	index       = lines_index[i]
	line        = subs[index]
	line.text   = mag.strip.any_tag(line.text, "i[0-1]")
	line.text   = mag.string.format("{\\i1}{%s}{\\i0}", line.text)
	subs[index] = line
	end
	mag.show.no_op(pcs)
	end

	function apply_alignment(subs,sel)
	local pcs = false
	local line, index
	local lines_index = mag.line.index(subs, sel, c.apply2, c.comment_mode2, c.empty_mode2)
	for i = 1, #lines_index do
	index     = lines_index[i]
	line      = subs[index]
	line.text = mag.strip.any_tag(line.text, "an[1-9]")
		for k = 1, 9 do
			if c.selected_an_list == c_lang["anListKey"..k] then
			if not pcs then pcs = true end
			line.text = mag.string.format("{%s}{%s}", "{\\an"..k.."}", line.text)
			end
		end
	subs[index] = line
	end
	mag.show.no_op(pcs)
	end

	function apply_alpha(subs,sel)
	local pcs = false
	local line, index
	local lines_index = mag.line.index(subs, sel, c.apply3, c.comment_mode3, c.empty_mode3)
	for i = 1, #lines_index do
	index     = lines_index[i]
	line      = subs[index]	
		if c.selected_a_list == c_lang["aListKey1"] then
		if not pcs then pcs = true end
		line.text = mag.strip.any_tag(line.text, "alpha&H?..&")
		line.text = mag.string.format("{\\alpha&H{%s}&}{%s}", mag.convert.alpha_from_percent(c.alpha_tag_value, true), line.text)
		end
		if c.selected_a_list == c_lang["aListKey2"] then
		if not pcs then pcs = true end
		line.text = mag.strip.any_tag(line.text, "1a&H?..&")
		line.text = mag.string.format("{\\1a&H{%s}&}{%s}", mag.convert.alpha_from_percent(c.alpha_tag_value, true), line.text)
		end
		if c.selected_a_list == c_lang["aListKey3"] then
		if not pcs then pcs = true end
		line.text = mag.strip.any_tag(line.text, "2a&H?..&")
		line.text = mag.string.format("{\\2a&H{%s}&}{%s}", mag.convert.alpha_from_percent(c.alpha_tag_value, true), line.text)
		end
		if c.selected_a_list == c_lang["aListKey4"] then
		if not pcs then pcs = true end
		line.text = mag.strip.any_tag(line.text, "3a&H?..&")
		line.text = mag.string.format("{\\3a&H{%s}&}{%s}", mag.convert.alpha_from_percent(c.alpha_tag_value, true), line.text)
		end
		if c.selected_a_list == c_lang["aListKey5"] then
		if not pcs then pcs = true end
		line.text = mag.strip.any_tag(line.text, "4a&H?..&")
		line.text = mag.string.format("{\\4a&H{%s}&}{%s}", mag.convert.alpha_from_percent(c.alpha_tag_value, true), line.text)
		end
	subs[index] = line
	end
	mag.show.no_op(pcs)
	end

	function apply_fad(subs,sel)
	local pcs = false
	local line, index
	local lines_index = mag.line.index(subs, sel, c.apply4, c.comment_mode4, c.empty_mode4)
	for i = 1, #lines_index do
	if not pcs then pcs = true end
	index       = lines_index[i]
	line        = subs[index]
	line.text   = mag.strip.any_tag(line.text, "fade%(.*%)")
	line.text   = mag.strip.any_tag(line.text, "fad%(.*%)")
	line.text   = mag.string.format("{\\fad({%s},{%s})}{%s}", c.fad_t1, c.fad_t2, line.text)
	subs[index] = line
	end
	mag.show.no_op(pcs)
	end

	function apply_fade(subs,sel)
	local pcs = false
	local line, index
	local lines_index = mag.line.index(subs, sel, c.apply5, c.comment_mode5, c.empty_mode5)
	for i = 1, #lines_index do
	if not pcs then pcs = true end
	index         = lines_index[i]
	line          = subs[index]
	line.text     = mag.strip.any_tag(line.text, "fade%(.*%)")
	line.text     = mag.strip.any_tag(line.text, "fad%(.*%)")
	local t3_time = c.fade_t3
	local t4_time = c.fade_t3 + c.fade_t4
		if c.t3_and_t4 then
		local line_duration = line.end_time - line.start_time
		local t3_time_temp  = t3_time
		local t4_time_temp  = t4_time
		t3_time             = line_duration - t4_time_temp
		t4_time             = line_duration - t3_time_temp
		end
	line.text   = mag.string.format("{\\fade({%s},{%s},{%s},{%s},{%s},{%s},{%s})}{%s}",
				  mag.convert.alpha_from_percent(c.fade_a1),
				  mag.convert.alpha_from_percent(c.fade_a2),
				  mag.convert.alpha_from_percent(c.fade_a3),
				  c.fade_t1,
				  c.fade_t1 + c.fade_t2,
				  t3_time,
				  t4_time,
				  line.text)
	subs[index] = line
	end
	mag.show.no_op(pcs)
	end

	function last_option_for_italic(subs,sel)
	if mag.strip.apply(c.apply1) == mag.window.lang.message("select") then
	c.apply1 = mag.window.lang.message("selected_lines")
	mag.show.log(2, mag.string.format(c_lang.key1, c_lang.tabKey1.." / "..mag.window.lang.message("gui_tabname")))
	end
	apply_italic(subs, sel)
	end

	function last_option_for_alignment(subs,sel)
	if mag.strip.apply(c.apply2) == mag.window.lang.message("select") then
	c.apply2 = mag.window.lang.message("selected_lines")
	mag.show.log(2, mag.string.format(c_lang.key1, c_lang.tabKey3.." / "..mag.window.lang.message("gui_tabname")))
	end
	if mag.strip.apply(c.selected_an_list) == mag.window.lang.message("select") then
	c.selected_an_list = c_lang.anListKey8
	mag.show.log(2, mag.string.format(c_lang.key2, c_lang.key3, c_lang.anListKey8))
	end
	apply_alignment(subs, sel)
	end

	function last_option_for_alpha(subs,sel)
	if mag.strip.apply(c.apply3) == mag.window.lang.message("select") then
	c.apply3 = mag.window.lang.message("selected_lines")
	mag.show.log(2, mag.string.format(c_lang.key1, c_lang.tabKey4.." / "..mag.window.lang.message("gui_tabname")))
	end
	if mag.strip.apply(c.selected_a_list) == mag.window.lang.message("select") then
	c.selected_a_list = c_lang.aListKey1
	mag.show.log(2, mag.string.format(c_lang.key2, c_lang.key4, c_lang.aListKey1))
	end
	apply_alpha(subs, sel)
	end

	function last_option_for_fad(subs,sel)
	if mag.strip.apply(c.apply4) == mag.window.lang.message("select") then
	c.apply4 = mag.window.lang.message("selected_lines")
	mag.show.log(2, mag.string.format(c_lang.key1, c_lang.tabKey5.." / "..mag.window.lang.message("gui_tabname")))
	end
	apply_fad(subs, sel)
	end

	function last_option_for_fade(subs,sel)
	if mag.strip.apply(c.apply5) == mag.window.lang.message("select") then
	c.apply5 = mag.window.lang.message("selected_lines")
	mag.show.log(2, mag.string.format(c_lang.key1, c_lang.tabKey6.." / "..mag.window.lang.message("gui_tabname")))
	end
	apply_fade(subs, sel)
	end

	function check_macro1(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(italic, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro2(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(last_option_for_italic, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro3(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(alignment, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro4(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(last_option_for_alignment, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro5(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(alpha, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro6(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(last_option_for_alpha, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro7(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(fad, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro8(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(last_option_for_fad, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro9(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(fade, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro10(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(last_option_for_fade, subs, sel)
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
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1.."/"..mag.window.lang.message("gui_tabname"), check_macro1)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1.."/"..c_lang.tabKey2,                         check_macro2)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey3.."/"..mag.window.lang.message("gui_tabname"), check_macro3)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey3.."/"..c_lang.tabKey2,                         check_macro4)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey4.."/"..mag.window.lang.message("gui_tabname"), check_macro5)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey4.."/"..c_lang.tabKey2,                         check_macro6)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey5.."/"..mag.window.lang.message("gui_tabname"), check_macro7)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey5.."/"..c_lang.tabKey2,                         check_macro8)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey6.."/"..mag.window.lang.message("gui_tabname"), check_macro9)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey6.."/"..c_lang.tabKey2,                         check_macro10)
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
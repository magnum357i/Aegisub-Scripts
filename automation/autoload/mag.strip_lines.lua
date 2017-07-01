	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Temizleme", sub_menu = "Satır/Temizle"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Strip Lines",     sub_menu = "Lines/Strip"}
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
	in_lang["s_desc"]              = "Etiketleri, fazladan boşlukları ve o tarz şeyleri temizler."
	in_lang["tabKey1"]             = "Satır Özellikleri"
	in_lang["tabKey2"]             = "Efekt Şablonları"
	in_lang["tabKey3"]             = "Alt Yazı İşlemleri"
	in_lang["tabKey4"]             = "Ekstra..."
	in_lang["buttonKey1"]          = "Uygula"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["guiLabelKey1"]        = "Katman"
	in_lang["guiLabelKey2"]        = "Oyuncu"
	in_lang["guiLabelKey3"]        = "Efekt"
	in_lang["guiLabelKey4"]        = "Sol boşluk"
	in_lang["guiLabelKey5"]        = "Sağ boşluk"
	in_lang["guiLabelKey6"]        = "Dikey boşluk"
	in_lang["guiLabelKey7"]        = "Metin"
	in_lang["guiLabelKey8"]        = "Etiketler"
	in_lang["guiLabelKey9"]        = "Özel karakterler"
	in_lang["guiLabelKey10"]       = "Açıklama parantezleri"
	in_lang["guiLabelKey11"]       = "Tekrar eden boşluklar"
	in_lang["guiLabelKey12"]       = "Baştaki ve sondaki boşluklar"
	in_lang["guiLabelKey13"]       = "Oluşturulan karaoke satırlarını sil"
	in_lang["guiLabelKey14"]       = "Uygulanan satırları sıfırla"
	in_lang["guiLabelKey15"]       = "Şablon satırlarının sürelerini sıfırla"
	in_lang["guiLabelKey16"]       = "Bozuk harfleri düzelt"
	in_lang["guiLabelKey17"]       = "Bulanacak harfler:"
	in_lang["guiLabelKey18"]       = "Değiştirelecek harfler:"
	in_lang["guiLabelKey19"]       = "Kare sürelerine göre zamanla"
	in_lang["guiLabelKey20"]       = "Kullanılmayan stilleri sil"
	in_lang["guiLabelKey21"]       = "Boş satırları sil"
	in_lang["guiLabelKey22"]       = "Açıklama satırlarını sil"
	in_lang["guiLabelKey23"]       = "Sıralı satırları birleştir"
	in_lang["guiLabelKey24"]       = "Satır bölme boşluklarını temizle"
	in_lang["guiLabelKey25"]       = "Her iki taraftaki hecesiz karaoke etiketleri kaldır"
	in_lang["guiLabelKey26"]       = "Satır içindeki hecesiz karaoke etiketleri kaldır"
	in_lang["guiLabelKey27"]       = "Karaoke etiketi boşluklarını gözden geçir"
	in_lang["guiHintKey1"]         = "Aynı içeriğe sahip ve alt alta sıralanmış satırları bütünler."
	in_lang["key1"]                = "Bulunacak harflerin sayısı ile değiştirelecek harflerin sayısı eşit değil."
	in_lang["headerFormat"]        = "[{%s}]"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Clears tags, extra whitespaces and things like them."
	in_lang["tabKey1"]             = "Line Properties"
	in_lang["tabKey2"]             = "Effect Templates"
	in_lang["tabKey3"]             = "Subtitle Operations"
	in_lang["tabKey4"]             = "Extra..."
	in_lang["buttonKey1"]          = "Apply"
	in_lang["buttonKey2"]          = "Close"
	in_lang["guiLabelKey1"]        = "Layer"
	in_lang["guiLabelKey2"]        = "Actor"
	in_lang["guiLabelKey3"]        = "Effect"
	in_lang["guiLabelKey4"]        = "Left margin"
	in_lang["guiLabelKey5"]        = "Right margin"
	in_lang["guiLabelKey6"]        = "Vertical margin"
	in_lang["guiLabelKey7"]        = "Text"
	in_lang["guiLabelKey8"]        = "Tags"
	in_lang["guiLabelKey9"]        = "Special characters"
	in_lang["guiLabelKey10"]       = "Comment brackets"
	in_lang["guiLabelKey11"]       = "Repeated spaces"
	in_lang["guiLabelKey12"]       = "Spaces on both sides"
	in_lang["guiLabelKey13"]       = "Delete generated karaoke lines"
	in_lang["guiLabelKey14"]       = "Reset applied lines"
	in_lang["guiLabelKey15"]       = "Reset times of template lines"
	in_lang["guiLabelKey16"]       = "Fix corrupted letters"
	in_lang["guiLabelKey17"]       = "Letters to find:"
	in_lang["guiLabelKey18"]       = "Letters to replace:"
	in_lang["guiLabelKey19"]       = "Time according to the frame times"
	in_lang["guiLabelKey20"]       = "Delete unused styles"
	in_lang["guiLabelKey21"]       = "Delete empty lines"
	in_lang["guiLabelKey22"]       = "Delete comment lines"
	in_lang["guiLabelKey23"]       = "Combine ordered lines"
	in_lang["guiLabelKey24"]       = "Clear line break spaces"
	in_lang["guiLabelKey25"]       = "Remove ktag without syllable in both side of line"
	in_lang["guiLabelKey26"]       = "Remove ktag without syllable in center of line"
	in_lang["guiLabelKey27"]       = "Remove whitespaces of karaoke tags"
	in_lang["guiHintKey1"]         = "Combine ordered lines with the same content."
	in_lang["key1"]                = "Number of characters to be found is not equal to the number of characters to replace."
	in_lang["headerFormat"]        = "[{%s}]"
	end
	return in_lang, lang_list, script_name_list, sub_menu_list
	end

	c_lang_switch            = "en"
	c_lang,
	c_lang_list,
	c_script_name_list,
	c_sub_name_list          = lang_switch_keys(c_lang_switch)

	script_name              = c_lang.s_name
	script_description       = c_lang.s_desc
	script_author            = "Magnum357"
	script_version           = "1.6.1"
	script_mag_version       = "1.1.4.6"
	script_file_name         = "mag.strip_lines"
	script_file_ext          = ".lua"

	include_unicode          = true
	mag_import, mag          = pcall(require, "mag")

	if mag_import then
	mag.lang                 = c_lang_switch

	c_lock_gui               = false
	c_window_mode_list       = {c_lang.buttonKey3, c_lang.buttonKey4}
	c_buttons1               = {c_lang.buttonKey1, c_lang.buttonKey2}
	c_trying_limit           = 10

	c                        = {}
	c.apply1                 = mag.window.lang.message("select")
	c.apply2                 = mag.window.lang.message("select")
	c.apply3                 = mag.window.lang.message("select")
	c.comment_mode           = false
	c.empty_mode             = false
	c.line_property          = false
	c.line_layer             = false
	c.line_actor             = false
	c.line_effect            = false
	c.line_left_margin       = false
	c.line_right_margin      = false
	c.line_vertical_margin   = false
	c.line_text              = true
	c.line_text_tag          = false
	c.line_text_special      = false
	c.line_text_comment      = false
	c.line_text_double_space = false
	c.line_text_space_trim   = false
	c.effect_template        = false
	c.delete_fx              = false
	c.strip_template         = false
	c.reset_template         = false
	c.subtitle_operations    = false
	c.fix_letters            = false
	c.find_letters           = "þ, Þ, Ý, ý, ð, Ð"
	c.replace_letters        = "ş, Ş, İ, ı, ğ, Ğ"
	c.fix_timing             = false
	c.unused_style           = false
	c.extra                  = false
	c.empty_line             = false
	c.comment_line           = false
	c.one_line               = false
	c.line_break_space       = false
	c.syl_inline             = false
	c.syl_time               = false
	c.syl_space              = false

	gui                      = {
		main1                  = {
		line_property          = {class = "checkbox", name = "u_line_property",          x = 0, y = 0,  width = 3, height = 1, label = mag.string.format(c_lang.headerFormat, c_lang.tabKey1), hint = mag.window.lang.message("mark_all")},
		                         {class = "label",                                       x = 0, y = 1,  width = 1, height = 1, label = mag.string.wall(" ", 5)},
		line_layer             = {class = "checkbox", name = "u_line_layer",             x = 1, y = 1,  width = 2, height = 1, label = c_lang.guiLabelKey1},
		line_actor             = {class = "checkbox", name = "u_line_actor",             x = 1, y = 2,  width = 2, height = 1, label = c_lang.guiLabelKey2},
		line_effect            = {class = "checkbox", name = "u_line_effect",            x = 1, y = 3,  width = 2, height = 1, label = c_lang.guiLabelKey3},
		line_left_margin       = {class = "checkbox", name = "u_line_left_margin",       x = 1, y = 4,  width = 2, height = 1, label = c_lang.guiLabelKey4},
		line_right_margin      = {class = "checkbox", name = "u_line_right_margin",      x = 1, y = 5,  width = 2, height = 1, label = c_lang.guiLabelKey5},
		line_vertical_margin   = {class = "checkbox", name = "u_line_vertical_margin",   x = 1, y = 6,  width = 2, height = 1, label = c_lang.guiLabelKey6},
		line_text              = {class = "checkbox", name = "u_line_text",              x = 1, y = 7,  width = 2, height = 1, label = c_lang.guiLabelKey7, hint = mag.window.lang.message("mark_all")},
		                         {class = "label",                                       x = 1, y = 8,  width = 1, height = 1, label = mag.string.wall(" ", 5)},
		line_text_tag          = {class = "checkbox", name = "u_line_text_tag",          x = 2, y = 8,  width = 1, height = 1, label = c_lang.guiLabelKey8},
		line_text_special      = {class = "checkbox", name = "u_line_text_special",      x = 2, y = 9,  width = 1, height = 1, label = c_lang.guiLabelKey9, hint = "\\N, \\n, \\h"},
		line_text_comment      = {class = "checkbox", name = "u_line_text_comment",      x = 2, y = 10, width = 1, height = 1, label = c_lang.guiLabelKey10},
		line_text_double_space = {class = "checkbox", name = "u_line_text_double_space", x = 2, y = 11, width = 1, height = 1, label = c_lang.guiLabelKey11},
		line_text_space_trim   = {class = "checkbox", name = "u_line_text_space_trim",   x = 2, y = 12, width = 1, height = 1, label = c_lang.guiLabelKey12},
		                         {class = "label",                                       x = 0, y = 13, width = 3, height = 1, label = mag.string.format(c_lang.headerFormat, mag.gsub(mag.window.lang.message("apply"), ":", ""))},
		apply1                 = {class = "dropdown", name = "u_apply_lines1",           x = 0, y = 14, width = 3, height = 1, hint = mag.window.lang.message("style_hint1")},
		comment_mode           = {class = "checkbox", name = "u_comment_mode",           x = 0, y = 15, width = 3, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode             = {class = "checkbox", name = "u_empty_mode",             x = 0, y = 16, width = 3, height = 1, label = mag.window.lang.message("empty_mode")},
		},
		main2                  = {
		effect_template        = {class = "checkbox", name = "u_effect_template",        x = 0, y = 0,  width = 2, height = 1, label = mag.string.format(c_lang.headerFormat, c_lang.tabKey2), hint = mag.window.lang.message("mark_all")},
		                         {class = "label",                                       x = 0, y = 1,  width = 1, height = 1, label = mag.string.wall(" ", 5)},
		delete_fx              = {class = "checkbox", name = "u_delete_fx",              x = 1, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey13},
		strip_template         = {class = "checkbox", name = "u_strip_template",         x = 1, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey14},
		reset_template         = {class = "checkbox", name = "u_reset_template",         x = 1, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey15},
		syl_time               = {class = "checkbox", name = "u_syl_time",               x = 1, y = 4,  width = 2, height = 1, label = c_lang.guiLabelKey25},
		syl_inline             = {class = "checkbox", name = "u_syl_inline",             x = 1, y = 5,  width = 2, height = 1, label = c_lang.guiLabelKey26},
		syl_space              = {class = "checkbox", name = "u_syl_space",              x = 1, y = 6,  width = 2, height = 1, label = c_lang.guiLabelKey27},
		                         {class = "label",                                       x = 0, y = 7,  width = 2, height = 1, label = mag.string.format(c_lang.headerFormat, mag.gsub(mag.window.lang.message("apply"), ":", ""))},
		apply2                 = {class = "dropdown", name = "u_apply_lines2",           x = 0, y = 8,  width = 3, height = 1, hint = mag.window.lang.message("style_hint2")},
		},
		main3                  = {
		subtitle_operations    = {class = "checkbox", name = "u_subtitle_operations",    x = 0, y = 0,  width = 3, height = 1, label = mag.string.format(c_lang.headerFormat, c_lang.tabKey3), hint = mag.window.lang.message("mark_all")},
		                         {class = "label",                                       x = 0, y = 1,  width = 1, height = 1, label = mag.string.wall(" ", 5)},
		fix_letters            = {class = "checkbox", name = "u_fix_letters",            x = 1, y = 1,  width = 2, height = 1, label = c_lang.guiLabelKey16},

		                         {class = "label",                                       x = 1, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey17},
		find_letters           = {class = "edit",     name = "u_find",                   x = 2, y = 2,  width = 1, height = 1},
		                         {class = "label",                                       x = 1, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey18},
		replace_letters        = {class = "edit",     name = "u_replace",                x = 2, y = 3,  width = 1, height = 1},
		fix_timing             = {class = "checkbox", name = "u_fix_timing",             x = 1, y = 4,  width = 2, height = 1, label = c_lang.guiLabelKey19},
		unused_style           = {class = "checkbox", name = "u_unused_style",           x = 1, y = 5,  width = 2, height = 1, label = c_lang.guiLabelKey20},
		},
		main4                  = {
		extra                  = {class = "checkbox", name = "u_extra",                  x = 0, y = 0,  width = 3, height = 1, label = mag.string.format(c_lang.headerFormat, c_lang.tabKey4), hint = mag.window.lang.message("mark_all")},
		                         {class = "label",                                       x = 0, y = 1,  width = 1, height = 1, label = mag.string.wall(" ", 5)},
		empty_line             = {class = "checkbox", name = "u_empty_line",             x = 1, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey21},
		comment_line           = {class = "checkbox", name = "u_comment_line",           x = 1, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey22},
		one_line               = {class = "checkbox", name = "u_one_line",               x = 1, y = 3,  width = 1, height = 1, label = c_lang.guiLabelKey23, hint = c_lang.guiHintKey1},
		line_break_space       = {class = "checkbox", name = "u_line_break_space",       x = 1, y = 4,  width = 1, height = 1, label = c_lang.guiLabelKey24},
		                         {class = "label",                                       x = 0, y = 5,  width = 3, height = 1, label = mag.string.format(c_lang.headerFormat, mag.gsub(mag.window.lang.message("apply"), ":", ""))},
		apply3                 = {class = "dropdown", name = "u_apply_lines3",           x = 0, y = 6,  width = 3, height = 1, hint = mag.window.lang.message("style_hint2")},
		}
	}
	end

	function strip_lines1(subs,sel)
	local line, index
	local lines_index = mag.line.index(subs, sel, c.apply1, c.comment_mode, c.empty_mode)
	local pcs         = false
	local counter     = {
	layer        = 0,
	actor        = 0,
	effect       = 0,
	lmargin      = 0,
	rmargin      = 0,
	vmargin      = 0,
	tags         = 0,
	special      = 0,
	comment      = 0,
	double_space = 0,
	both_space   = 0
	}
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	index = lines_index[i]
	line  = subs[index]
	local strip_line
	if c.line_property
	or c.line_text
	or c.line_text_special
	or c.line_text_double_space
	or c.line_text_space_trim
	then
	strip_line = mag.strip.bracket(line.text)
	end
		if c.line_layer or c.line_property then
			if line.layer > 0 then
			if not pcs then pcs = true end
			counter["layer"] = counter["layer"] + 1
			line.layer       = 0
			end
		end
		if c.line_actor or c.line_property then
			if line.actor ~= "" then
			if not pcs then pcs = true end
			counter["actor"] = counter["actor"] + 1
			line.actor       = ""
			end
		end
		if c.line_effect or c.line_property then
			if line.effect ~= "" then
			if not pcs then pcs = true end
			counter["effect"] = counter["effect"] + 1
			line.effect       = ""
			end
		end
		if c.line_left_margin or c.line_property then
			if line.margin_l > 0 then
			if not pcs then pcs = true end
			counter["lmargin"] = counter["lmargin"] + 1
			line.margin_l      = 0
			end
		end
		if c.line_right_margin or c.line_property then
			if line.margin_r > 0 then
			if not pcs then pcs = true end
			counter["rmargin"] = counter["rmargin"] + 1
			line.margin_r      = 0
			end
		end
		if c.line_vertical_margin or c.line_property then
			if line.margin_t > 0 then
			if not pcs then pcs = true end
			counter["vmargin"] = counter["vmargin"] + 1
			line.margin_t = 0
			end
		end
		if c.line_text_tag or c.line_property or c.line_text then
			if mag.match(line.text, "{[^}]-\\[^{]-}") then
			if not pcs then pcs = true end
			counter["tags"] = counter["tags"] + 1
			line.text       = mag.strip.tag(line.text)
			end
		end
		if c.line_text_special or c.line_property or c.line_text then
			if mag.match(strip_line, "\\[nNh]") then
			if not pcs then pcs = true end
			counter["special"] = counter["special"] + 1
			line.text          = mag.strip.special(line.text, " ", {true, true, true})
			end
		end
		if c.line_text_comment or c.line_property or c.line_text then
			if mag.match(line.text, "{[^\\{}]*}") then
			if not pcs then pcs = true end
			counter["comment"] = counter["comment"] + 1
			line.text          = mag.strip.comment(line.text)
			end
		end
		if c.line_text_double_space or c.line_property or c.line_text then
			if mag.match(strip_line, "%s%s") then
			if not pcs then pcs = true end
			counter["double_space"] = counter["double_space"] + 1
			line.text               = mag.strip.double_space(line.text)
			end
		end
		if c.line_text_space_trim or c.line_property or c.line_text then
			if mag.find(strip_line, "%s") == 1 or mag.find(mag.reverse(strip_line), "%s") == 1 then
			if not pcs then pcs = true end
			counter["both_space"] = counter["both_space"] + 1
			line.text             = mag.trim.all(line.text)
			end
		end
	if pcs then subs[index] = line end
	end
	if pcs then
	mag.show.report(c.line_property or c.line_layer,                            counter["layer"],        c_lang.guiLabelKey1,  "", "", "")
	mag.show.report(c.line_property or c.line_actor,                            counter["actor"],        c_lang.guiLabelKey2,  "", "", "")
	mag.show.report(c.line_property or c.line_effect,                           counter["effect"],       c_lang.guiLabelKey3,  "", "", "")
	mag.show.report(c.line_property or c.line_left_margin,                      counter["lmargin"],      c_lang.guiLabelKey4,  "", "", "")
	mag.show.report(c.line_property or c.line_right_margin,                     counter["rmargin"],      c_lang.guiLabelKey5,  "", "", "")
	mag.show.report(c.line_property or c.line_vertical_margin,                  counter["vmargin"],      c_lang.guiLabelKey6,  "", "", "")
	mag.show.report(c.line_property or c.line_text or c.line_text_tag,          counter["tags"],         c_lang.guiLabelKey8,  "", "", "")
	mag.show.report(c.line_property or c.line_text or c.line_text_special,      counter["special"],      c_lang.guiLabelKey9,  "", "", "")
	mag.show.report(c.line_property or c.line_text or c.line_text_comment,      counter["comment"],      c_lang.guiLabelKey10, "", "", "")
	mag.show.report(c.line_property or c.line_text or c.line_text_double_space, counter["double_space"], c_lang.guiLabelKey11, "", "", "")
	mag.show.report(c.line_property or c.line_text or c.line_text_space_trim,   counter["both_space"],   c_lang.guiLabelKey12, "", "", "")
	end
	mag.show.no_op(pcs)
	end

	function add_macro1(subs,sel)
	local ok, config
	local apply_items      = mag.list.full_apply(subs, sel, "comment")
	c.apply1               = mag.array.search_apply(apply_items, c.apply1)
	gui.main1.apply1.items = apply_items
	repeat
	gui.main1.line_property.value          = c.line_property
	gui.main1.line_layer.value             = c.line_layer
	gui.main1.line_actor.value             = c.line_actor
	gui.main1.line_effect.value            = c.line_effect
	gui.main1.line_left_margin.value       = c.line_left_margin
	gui.main1.line_right_margin.value      = c.line_right_margin
	gui.main1.line_vertical_margin.value   = c.line_vertical_margin
	gui.main1.line_text.value              = c.line_text
	gui.main1.line_text_tag.value          = c.line_text_tag
	gui.main1.line_text_special.value      = c.line_text_special
	gui.main1.line_text_comment.value      = c.line_text_comment
	gui.main1.line_text_double_space.value = c.line_text_double_space
	gui.main1.line_text_space_trim.value   = c.line_text_space_trim
	gui.main1.apply1.value                 = c.apply1
	gui.main1.comment_mode.value           = c.comment_mode
	gui.main1.empty_mode.value             = c.empty_mode
	ok, config                             = mag.window.dialog(gui.main1, c_buttons1)
	c.line_property                        = config.u_line_property
	c.line_layer                           = config.u_line_layer
	c.line_actor                           = config.u_line_actor
	c.line_effect                          = config.u_line_effect
	c.line_left_margin                     = config.u_line_left_margin
	c.line_right_margin                    = config.u_line_right_margin
	c.line_vertical_margin                 = config.u_line_vertical_margin
	c.line_text                            = config.u_line_text
	c.line_text_tag                        = config.u_line_text_tag
	c.line_text_special                    = config.u_line_text_special
	c.line_text_comment                    = config.u_line_text_comment
	c.line_text_double_space               = config.u_line_text_double_space
	c.line_text_space_trim                 = config.u_line_text_space_trim
	c.apply1                               = config.u_apply_lines1
	c.comment_mode                         = config.u_comment_mode
	c.empty_mode                           = config.u_empty_mode
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply1 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	strip_lines1(subs, sel)
	end
	end

	function strip_lines2(subs,sel)
	local line, index, jump, ms1, ms2
	local pcs          = false
	local lines_index  = mag.line.index(subs, sel, c.apply2, false, false)
	local delete_index = {}
	local trying_count = 0
	local counter      = {delete = 0, template = 0, karaoke = 0, syl_time = 0, syl_inline = 0, syl_space = 0, is_syl_time = false, is_syl_inline = false}
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	index = lines_index[i]
	line  = subs[index]
		if c.delete_fx or c.effect_template then
			if jump == nil then
			jump = index
			end
		end
		if c.strip_template or c.effect_template then
			if line.effect == "karaoke" and line.comment then
			if not pcs then pcs = true end
			counter["karaoke"] = counter["karaoke"] + 1
			line.effect        = ""
			line.comment       = false
			end
		end
		if c.reset_template or c.effect_template then
			if mag.match(line.effect, "^template") and line.comment or mag.match(line.effect, "^code") and line.comment then
				if line.start_time > 0 or line.end_time > 0 then
				if not pcs then pcs = true end
				counter["template"] = counter["template"] + 1
				line.start_time     = 0
				line.end_time       = 0
				end
			end
		end
		if c.delete_fx or c.effect_template then
			if line.effect == "fx" then
			if not pcs then pcs = true end
			counter["delete"] = counter["delete"] + 1
			mag.array.insert(delete_index, index)
			end
		end
		if not mag.match(line.effect, "^template") and not mag.match(line.effect, "^code") then
			if c.syl_time or c.effect_template then
			counter["is_time"] = false
			trying_count       = 0
				repeat
				matched = false
					if mag.match(line.text, "^%s-{%s-\\%s-k%s-%d+}%s-{") then
					ms1 = mag.match(line.text, "^%s-{%s-\\%s-k%s-(%d+)}%s-{")
						if ms1 and mag.n(ms1) >= 0 then
						if not pcs then pcs = true end
						counter["is_time"] = true
						matched            = true
						line.text          = mag.gsub(line.text, "(%s-{%s-\\%s-k%s-%d+}%s-)({)", "%2")
						line.start_time    = line.start_time - ms1
						end
					elseif mag.match(line.text, "^%s-{%s-\\%s-kf%s-%d+}%s-{") then
					ms1 = mag.match(line.text, "^%s-{%s-\\%s-kf%s-(%d+)}%s-{")
						if ms1 and mag.n(ms1) >= 0 then
						if not pcs then pcs = true end
						counter["is_time"] = true
						matched            = true
						line.text          = mag.gsub(line.text, "(%s-{%s-\\%s-kf%s-%d+}%s-)({)", "%2")
						line.start_time    = line.start_time - ms1
						end
					elseif mag.match(line.text, "^%s-{%s-\\%s-ko%s-%d+}%s-{") then
					ms1 = mag.match(line.text, "^%s-{%s-\\%s-ko%s-(%d+)}%s-{")
						if ms1 and mag.n(ms1) >= 0 then
						if not pcs then pcs = true end
						counter["is_time"] = true
						matched            = true
						line.text          = mag.gsub(line.text, "(%s-{%s-\\%s-ko%s-%d+}%s-)({)", "%2")
						line.start_time    = line.start_time - ms1
						end
					elseif mag.match(line.text, "^%s-{%s-\\%s-K%s-%d+}%s-{") then
					ms1 = mag.match(line.text, "^%s-{%s-\\%s-K%s-(%d+)}%s-{")
						if ms1 and mag.n(ms1) >= 0 then
						if not pcs then pcs = true end
						counter["is_time"] = true
						matched            = true
						line.text          = mag.gsub(line.text, "(%s-{%s-\\%s-K%s-%d+}%s-)({)", "%2")
						line.start_time    = line.start_time - ms1
						end
					end
				trying_count = trying_count + 1
				until matched == false or trying_count == c_trying_limit
			trying_count = 0
				repeat
				matched = false
					if mag.match(line.text, "{%s-\\%s-k%s-%d+}%s-$") then
					ms1 = mag.match(line.text, "{%s-\\%s-k%s-(%d+)}%s-$")
						if ms1 and mag.n(ms1) >= 0 then
						if not pcs then pcs = true end
						counter["is_time"] = true
						matched            = true
						line.text          = mag.gsub(line.text, "{%s-\\%s-k%s-%d+}%s-$", "")
						line.end_time      = line.end_time + ms1
						end
					elseif mag.match(line.text, "{%s-\\%s-kf%s-%d+}%s-$") then
					ms1 = mag.match(line.text, "{%s-\\%s-kf%s-(%d+)}%s-$")
						if ms1 and mag.n(ms1) >= 0 then
						if not pcs then pcs = true end
						counter["is_time"] = true
						matched            = true
						line.text          = mag.gsub(line.text, "{%s-\\%s-kf%s-%d+}%s-$", "")
						line.end_time      = line.end_time + ms1
						end
					elseif mag.match(line.text, "{%s-\\%s-ko%s-%d+}%s-$") then
					ms1 = mag.match(line.text, "{%s-\\%s-ko%s-(%d+)}%s-$")
						if ms1 and mag.n(ms1) >= 0 then
						if not pcs then pcs = true end
						counter["is_time"] = true
						matched            = true
						line.text          = mag.gsub(line.text, "{%s-\\%s-ko%s-%d+}%s-$", "")
						line.end_time      = line.end_time + ms1
						end
					elseif mag.match(line.text, "{%s-\\%s-K%s-%d+}%s-$") then
					ms1 = mag.match(line.text, "{%s-\\%s-K%s-(%d+)}%s-$")
						if ms1 and mag.n(ms1) >= 0 then
						if not pcs then pcs = true end
						counter["is_time"] = true
						matched            = true
						line.text          = mag.gsub(line.text, "{%s-\\%s-K%s-%d+}%s-$", "")
						line.end_time      = line.end_time + ms1
						end
					end
				trying_count = trying_count + 1
				until matched == false or trying_count == c_trying_limit
				if counter["is_time"] then
				counter["syl_time"] = counter["syl_time"] + 1
				end
			end
			if c.syl_inline or c.effect_template then
			counter["is_inline"] = false
			trying_count         = 0
				repeat
				matched = false
					if mag.match(line.text, "{%s-\\%s-k%s-%d+%s-}%s-[^%s]+%s-{%s-\\%s-k%s-%d+%s-}%s-{%s-\\%s-k%s-%d+%s-}") then
					ms1, ms2 = mag.match(line.text, "{%s-\\%s-k%s-(%d+)%s-}%s-[^%s]+%s-{%s-\\%s-k%s-(%d+)%s-}%s-{%s-\\%s-k%s-%d+%s-}")
						if ms1 and mag.n(ms1) >= 0 and ms2 and mag.n(ms2) >= 0 then
						if not pcs then pcs = true end
						counter["is_inline"] = true
						matched              = true
						line.text            = mag.gsub(line.text, "({%s-\\%s-k%s-)%d+(%s-}%s-[^%s]+%s-){%s-\\%s-k%s-%d+%s-}(%s-{%s-\\%s-k%s-%d+%s-})", "%1"..ms1 + ms2.."%2%3")
						end
					elseif mag.match(line.text, "{%s-\\%s-kf%s-%d+}%s-{%s-\\%s-kf%s-%d+}") then
					ms1, ms2 = mag.match(line.text, "{%s-\\%s-kf%s-(%d+)}%s-{%s-\\%s-kf%s-(%d+)}")
						if ms1 and mag.n(ms1) >= 0 and ms2 and mag.n(ms2) >= 0 then
						if not pcs then pcs = true end
						counter["is_inline"] = true
						matched              = true
						line.text            = mag.gsub(line.text, "({%s-\\%s-kf%s-)%d+(}%s-){%s-\\%s-kf%s-%d+}", "%1"..ms1 + ms2.."%2")
						end
					elseif mag.match(line.text, "{%s-\\%s-ko%s-%d+}%s-{%s-\\%s-ko%s-%d+}") then
					ms1, ms2 = mag.match(line.text, "{%s-\\%s-ko%s-(%d+)}%s-{%s-\\%s-ko%s-(%d+)}")
						if ms1 and mag.n(ms1) >= 0 and ms2 and mag.n(ms2) >= 0 then
						if not pcs then pcs = true end
						counter["is_inline"] = true
						matched              = true
						line.text            = mag.gsub(line.text, "({%s-\\%s-ko%s-)%d+(}%s-){%s-\\%s-ko%s-%d+}", "%1"..ms1 + ms2.."%2")
						end
					elseif mag.match(line.text, "{%s-\\%s-K%s-%d+}%s-{%s-\\%s-K%s-%d+}") then
					ms1, ms2 = mag.match(line.text, "{%s-\\%s-K%s-(%d+)}%s-{%s-\\%s-K%s-(%d+)}")
						if ms1 and mag.n(ms1) >= 0 and ms2 and mag.n(ms2) >= 0 then
						if not pcs then pcs = true end
						counter["is_inline"] = true
						matched              = true
						line.text            = mag.gsub(line.text, "({%s-\\%s-K%s-)%d+(}%s-){%s-\\%s-K%s-%d+}", "%1"..ms1 + ms2.."%2")
						end
					end
				trying_count = trying_count + 1
				until matched == false or trying_count == c_trying_limit
				if counter["is_inline"] then
				counter["syl_inline"] = counter["syl_inline"] + 1
				end
			end
			if c.syl_space or c.effect_template then
			local strip_line = mag.strip.tag(line.text)
				if mag.match(line.text, "}%s") or mag.match(line.text, "%s%s{") or mag.find(mag.reverse(strip_line), "%s") == 1 or mag.find(strip_line, "%s") == 1 then
				if not pcs then pcs = true end
				counter["syl_space"] = counter["syl_space"] + 1
				line.text            = mag.gsub(line.text, "(})(%s+)", "%1")
				line.text            = mag.gsub(line.text, "(%s+)({)", " %2")
				line.text            = mag.trim.all(line.text)
				end
			end
		end
	if pcs then subs[index] = line end
	end
	if delete_index[1] ~= nil then
	mag.line.delete(subs, delete_index)
	end
	if pcs then
	mag.show.report(c.delete_fx      or c.effect_template, counter["delete"],     c_lang.guiLabelKey13, "", "", "")
	mag.show.report(c.reset_template or c.effect_template, counter["template"],   c_lang.guiLabelKey14, "", "", "")
	mag.show.report(c.strip_template or c.effect_template, counter["karaoke"],    c_lang.guiLabelKey15, "", "", "")
	mag.show.report(c.syl_time       or c.effect_template, counter["syl_time"],   c_lang.guiLabelKey25, "", "", "")
	mag.show.report(c.syl_inline     or c.effect_template, counter["syl_inline"], c_lang.guiLabelKey26, "", "", "")
	mag.show.report(c.syl_space      or c.effect_template, counter["syl_space"],  c_lang.guiLabelKey27, "", "", "")
	end
	mag.show.no_op(pcs)
	if counter["delete"] > 0 and jump ~= nil then return {jump} end
	end

	function add_macro2(subs,sel)
	local ok, config
	local apply_items      = mag.list.full_apply(subs, sel, "default")
	c.apply2               = mag.array.search_apply(apply_items, c.apply2)
	gui.main2.apply2.items = apply_items
	repeat
	gui.main2.effect_template.value = c.effect_template
	gui.main2.delete_fx.value       = c.delete_fx
	gui.main2.strip_template.value  = c.strip_template
	gui.main2.reset_template.value  = c.reset_template
	gui.main2.syl_time.value        = c.syl_time
	gui.main2.syl_inline.value      = c.syl_inline
	gui.main2.syl_space.value       = c.syl_space
	gui.main2.apply2.value          = c.apply2
	ok, config                      = mag.window.dialog(gui.main2, c_buttons1)
	c.effect_template               = config.u_effect_template
	c.delete_fx                     = config.u_delete_fx
	c.strip_template                = config.u_strip_template
	c.reset_template                = config.u_reset_template
	c.syl_time                      = config.u_syl_time
	c.syl_inline                    = config.u_syl_inline
	c.syl_space                     = config.u_syl_space
	c.apply2                        = config.u_apply_lines2
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply2 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	return strip_lines2(subs, sel)
	end
	end

	function strip_lines3(subs,sel)
	if c.fix_timing or c.subtitle_operations then
		if not mag.is.video() then
		mag.show.log(1, mag.window.lang.message("is_video"))
		end
	end
	local line, index
	local pcs          = false
	local delete_index = {}	
	local style_list   = {}
	local sort_style   = {}
	local counter      = {fix_timing = 0, fix_letters = 0, delete_style = 0}
	local find, replace
	if c.fix_letters or c.subtitle_operations then
	find    = mag.string.vars(c.find_letters)
	replace = mag.string.vars(c.replace_letters)
	end
	for k = 1, #subs do
	mag.window.progress(k, #subs)
	index = k
	line  = subs[index]
		if c.unused_style or c.subtitle_operations then
			if line.class == "style" then
			style_list[line.name] = {delete = true, i = index}
			mag.array.insert(sort_style, line.name)
			end
		end
		if line.class == "dialogue" then
			if c.fix_letters or c.subtitle_operations then
				if #find == #replace then
					for c = 1, #find do
						if mag.match(line.text, find[c]) then
						if not pcs then pcs = true end
						counter["fix_letters"] = counter["fix_letters"] + 1
						line.text              = mag.gsub(line.text, find[c], replace[c])
						end
					end
				end
			end
			if c.fix_timing or c.subtitle_operations then
				if mag.is.video() then
				local timing_count = false
				local sf_time = mag.convert.frame_time(line.start_time)
					if line.start_time > sf_time and sf_time > 0 then
					if not pcs then pcs = true end
					timing_count    = true
					line.start_time = sf_time
					end
				local ef_time = mag.convert.frame_time(line.end_time)
					if line.end_time > ef_time and ef_time > 0 then
					if not pcs then pcs = true end
					timing_count  = true
					line.end_time = ef_time
					end
					if timing_count then
					counter["fix_timing"] = counter["fix_timing"] + 1
					end
				end
			end
			if c.unused_style or c.subtitle_operations then
				if style_list[line.style]["delete"] == true then
				style_list[line.style]["delete"] = false
				end
			end
		if pcs then subs[index] = line end
		end
	end
	local delete_style       = {}
	local list_deleted_style = ""
	for _, style_name in pairs(sort_style) do
		if style_list[style_name]["delete"] then
		if not pcs then pcs = true end
		counter["delete_style"] = counter["delete_style"] + 1
		list_deleted_style      = mag.string.combine(list_deleted_style, style_name, "{%1}\n{%2}")
		mag.array.insert(delete_style, style_list[style_name]["i"])
		end
	end
	if counter["delete_style"] > 0 then
	mag.line.delete(subs, delete_style)
	end
	if pcs then
	mag.show.report(c.fix_letters  or c.subtitle_operations, counter["fix_letters"],  c_lang.guiLabelKey16, "", "", "")
	mag.show.report(c.fix_timing   or c.subtitle_operations, counter["fix_timing"],   c_lang.guiLabelKey19, "", "", "")
	mag.show.report(c.unused_style or c.subtitle_operations, counter["delete_style"], c_lang.guiLabelKey20, "", "", list_deleted_style)
	end
	mag.show.no_op(pcs)
	end

	function add_macro3(subs,sel)
	local ok, config
	gui.main3.subtitle_operations.value = c.subtitle_operations
	gui.main3.fix_letters.value         = c.fix_letters
	gui.main3.find_letters.value        = c.find_letters
	gui.main3.replace_letters.value     = c.replace_letters
	gui.main3.fix_timing.value          = c.fix_timing
	gui.main3.unused_style.value        = c.unused_style
	ok, config                          = mag.window.dialog(gui.main3, c_buttons1)
	c.subtitle_operations               = config.u_subtitle_operations
	c.fix_letters                       = config.u_fix_letters
	local find                          = mag.string.vars(config.u_find)
	local replace                       = mag.string.vars(config.u_replace)
		if #find == #replace then
		c.find_letters                  = config.u_find
		c.replace_letters               = config.u_replace
		else
		mag.show.log(1, c_lang.key1)
		end
	c.fix_timing                        = config.u_fix_timing
	c.unused_style                      = config.u_unused_style
	if ok == mag.convert.ascii(c_buttons1[1]) then
	strip_lines3(subs, sel)
	end
	end

	function strip_lines4(subs,sel)
	local line, index
	local pcs          = false
	local lines_index  = mag.line.index(subs, sel, c.apply3, false, false)
	local delete_index = {}
	local counter      = {comment_line = 0, empty_line = 0, break_space = 0, merged_line = 0}
	local jump
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	index = lines_index[i]
	line  = subs[index]
	local deleted = false
		if c.comment_line or c.extra then
			if line.comment then
			if not pcs then pcs = true end
			if jump == nil then jump = index end
			deleted                 = true
			counter["comment_line"] = counter["comment_line"] + 1
			end
		end
		if c.empty_line or c.extra then
			if not deleted and mag.is.empty(line.text) then
			if not pcs then pcs = true end
			if jump == nil then jump = index end
			deleted               = true
			counter["empty_line"] = counter["empty_line"] + 1
			end
		end
		if c.line_break_space or c.extra then
			if not deleted and mag.match(line.text, "\\N") then
			local strip_line = mag.strip.bracket(line.text)
				if mag.match(strip_line, "\\N%s") or mag.match(strip_line, "%s\\N") then
				local w = mag.string.words(line.text)
					for b = 1, #w do
						if mag.match(w[b], "\\N") then
						if not pcs then pcs = true end
						counter["break_space"] = counter["break_space"] + 1
						w[b]                   = mag.trim.left(w[b])
						end
					end
					line.text = mag.array.concat(w)
				end
			end
		end
		if deleted then
			if c.one_line or c.extra then
			lines_index[i] = nil
			end
		end
		if deleted then mag.array.insert(delete_index, index) end
		if pcs then subs[index] = line end
	end
	if c.one_line or c.extra then
		for i = 1, #lines_index do
		mag.window.progress(i, #lines_index)
		index = lines_index[i]
			if index ~= nil then
			local next_index = lines_index[i + 1]
				if next_index ~= nil then
				line            = subs[index]
				local next_line = subs[next_index]
					if line.style == next_line.style and mag.strip.bracket(line.text) == mag.strip.bracket(next_line.text) then
					mag.array.insert(delete_index, index)
					if not pcs then pcs = true end
					if jump == nil then jump = index end
					counter["merged_line"] = counter["merged_line"] + 1
					lines_index[i]         = nil
					next_line.start_time   = line.start_time
					next_line.text         = mag.strip.all(next_line.text)
					subs[next_index]       = next_line
					end
				end
			end
		end
	end
	if delete_index[1] ~= nil then
	mag.line.delete(subs, delete_index)
	end
	if pcs then
	mag.show.report(c.empty_line       or c.extra, counter["empty_line"],   c_lang.guiLabelKey21, "", "", "")
	mag.show.report(c.comment_line     or c.extra, counter["comment_line"], c_lang.guiLabelKey22, "", "", "")
	mag.show.report(c.line_break_space or c.extra, counter["break_space"],  c_lang.guiLabelKey23, "", "", "")
	mag.show.report(c.one_line         or c.extra, counter["merged_line"],  c_lang.guiLabelKey24, "", "", "")
	end
	mag.show.no_op(pcs)
	if counter["empty_line"] > 0 or counter["comment_line"] > 0 or counter["merged_line"] > 0 then
		if jump ~= nil then
		return {jump}
		end
	end
	end

	function add_macro4(subs,sel)
	local ok, config
	local apply_items      = mag.list.full_apply(subs, sel, "default")
	c.apply3               = mag.array.search_apply(apply_items, c.apply3)
	gui.main4.apply3.items = apply_items
	repeat
	gui.main4.extra.value            = c.extra
	gui.main4.apply3.value           = c.apply3
	gui.main4.empty_line.value       = c.empty_line
	gui.main4.comment_line.value     = c.comment_line
	gui.main4.one_line.value         = c.one_line
	gui.main4.line_break_space.value = c.line_break_space
	ok, config                       = mag.window.dialog(gui.main4, c_buttons1)
	c.extra                          = config.u_extra
	c.apply3                         = config.u_apply_lines3
	c.empty_line                     = config.u_empty_line
	c.comment_line                   = config.u_comment_line
	c.one_line                       = config.u_one_line
	c.line_break_space               = config.u_line_break_space
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply3 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	return strip_lines4(subs, sel)
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

	function check_macro2(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro2, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	return fee
	end
	end

	function check_macro3(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro3, subs, sel)
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
	local fe, fee = pcall(add_macro4, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	return fee
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
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1, check_macro1)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey2, check_macro2)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey3, check_macro3)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey4, check_macro4)
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
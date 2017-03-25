	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Harf Dönüştür"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Case Conversion"}
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
	in_lang["s_desc"]              = "Harf dönüşümleri yapar."
	in_lang["sList1"]              = "Türkçe"
	in_lang["sList2"]              = "İngilizce"
	in_lang["lList1"]              = "BÜYÜK HARFLER"
	in_lang["lList2"]              = "Her Kelime Büyük Harf"
	in_lang["lList3"]              = "Cümleler büyük."
	in_lang["lList4"]              = "küçük harfler"
	in_lang["buttonKey1"]          = "Uygula"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["guiLabel1"]           = "İmla dili:"
	in_lang["guiLabel2"]           = "Dönüştürme:"
	in_lang["guiLabel3"]           = "Harfleri sıfırla"
	in_lang["guiHint1"]            = "İşlem yapmadan önce harfleri küçültür. Böylece istediğiniz dönüştürmeyi tek seferde yapabilirsiniz."
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Makes letter conversions."
	in_lang["sList1"]              = "Turkish"
	in_lang["sList2"]              = "English"
	in_lang["lList1"]              = "UPPERCASE"
	in_lang["lList2"]              = "Capitalize Each Word"
	in_lang["lList3"]              = "Sentence case."
	in_lang["lList4"]              = "lowercase"
	in_lang["buttonKey1"]          = "Apply"
	in_lang["buttonKey2"]          = "Close"
	in_lang["guiLabel1"]           = "Spelling language:"
	in_lang["guiLabel2"]           = "Conversion:"
	in_lang["guiLabel3"]           = "Reset letters"
	in_lang["guiHint1"]            = "Before making process, it makes the letters small. So you can do whatever the conversion you want at one time."
	end
	return in_lang, lang_list, script_name_list
	end

	c_lang_switch      = "en"
	c_lang,
	c_lang_list,
	c_script_name_list = lang_switch_keys(c_lang_switch)

	script_name        = c_lang.s_name
	script_description = c_lang.s_desc
	script_version     = "0.9.3"
	script_author      = "Magnum357"
	script_mag_version = "1.1.4.4"
	script_file_name   = "mag.case_conversion"
	script_file_ext    = ".lua"

	include_unicode    = true
	mag_import, mag    = pcall(require, "mag")

	if mag_import then
	mag.lang           = c_lang_switch

	c_lock_gui         = false
	c_spelling_list    = {mag.window.lang.message("select"), c_lang.sList1, c_lang.sList2}
	c_letter_mode_list = {mag.window.lang.message("select"), c_lang.lList1, c_lang.lList2, c_lang.lList3, c_lang.lList4}
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey2}

	c                  = {}
	c.comment_mode     = true
	c.empty_mode       = true
	c.reset_chars      = true
	c.apply            = mag.window.lang.message("select")
	c.sListSelect      = mag.window.lang.message("select")
	c.lListSelect      = mag.window.lang.message("select")

	gui                = {
		main1            = {
		                   {class = "label",                              x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabel1},
	 	spelling_list    = {class = "dropdown", name = "u_spelling_list", x = 1, y = 0, width = 1, height = 1},
		                   {class = "label",                              x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabel2},
	 	letter_mode_list = {class = "dropdown", name = "u_letter_list",   x = 1, y = 1, width = 1, height = 1},
		                   {class = "label",                              x = 0, y = 2, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply            = {class = "dropdown", name = "u_apply_lines",   x = 1, y = 2, width = 1, height = 1, hint = mag.window.lang.message("style_hint1")},
		comment_mode     = {class = "checkbox", name = "u_comment_mode",  x = 1, y = 3, width = 1, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode       = {class = "checkbox", name = "u_empty_mode",    x = 1, y = 4, width = 1, height = 1, label = mag.window.lang.message("empty_mode")},
		reset_chars      = {class = "checkbox", name = "u_reset_chars",   x = 1, y = 5, width = 1, height = 1, label = c_lang.guiLabel3, hint = c_lang.guiHint1},
		}
	}
	end

	function case_conversion(subs,sel)
	local line, index
	local pcs         = false
	local lines_index = mag.line.index(subs, sel, c.apply, c.comment_mode, c.empty_mode)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	if not pcs then pcs = true end
	index = lines_index[i]
	line  = subs[index]
	if c.reset_chars and c.lListSelect ~= c_letter_mode_list[5] then line.text = letter_mode4(line.text) end
	if c.lListSelect == c_letter_mode_list[2] then line.text = letter_mode1(line.text) end
	if c.lListSelect == c_letter_mode_list[3] then line.text = letter_mode2(line.text) end
	if c.lListSelect == c_letter_mode_list[4] then line.text = letter_mode3(line.text) end
	if c.lListSelect == c_letter_mode_list[5] then line.text = letter_mode4(line.text) end
	subs[index] = line
	end
	mag.show.no_op(pcs)
	end

	function letter_mode1(text)
	local l          = ""
	local in_tag     = false
	local in_special = {false, false}
	for char in mag.convert.chars(text) do
	if char == "{" then in_tag = true end
		if not in_tag then
		if in_special[1] and mag.match(char, "[nNh]") then in_special[2] = true else in_special[1], in_special[2] = false, false end
		if char == "\\" then in_special[1] = true end
			if not in_special[1] and not in_special[2] then
			char = upper(char)
			end
		end
	l = l..char
	if char == "}" then in_tag = false end
	end
	return l
	end

	function letter_mode2(text)
	text             = " "..text
	local l          = ""
	local in_punc    = false
	local in_tag     = false
	local in_space   = false
	local in_special = {false, false}
	for char in mag.convert.chars(text) do
	if char == "{" then in_tag = true end
		if not in_tag then
		if in_special[1] and mag.match(char, "[nNh]") then in_special[2] = true else in_special[1], in_special[2] = false, false end
		if char == "\\" then in_special[1] = true end
			if not in_special[1] and not in_special[2] then
			if mag.match(char, "["..mag.pattern.punc.."]") then in_punc = true else in_punc = false end
				if not in_punc then
					if in_space then
					char = upper(char)
					end
				if char == " " then in_space = true else in_space = false end
				end
			end
		end
	l = l..char
	if char == "}" then in_tag = false end
	end
	return mag.gsub(l, "%s", "", 1)
	end

	function letter_mode3(text)
	text               = "."..text
	local l            = ""
	local in_punc_list = "%.%?%!%:"
	local in_punc      = false
	local in_tag       = false
	local in_space     = false
	local in_special   = {false, false}
	for char in mag.convert.chars(text) do
	if char == "{" then in_tag = true end
		if not in_tag then
		if in_special[1] and mag.match(char, "[nNh]") then in_special[2] = true else in_special[1], in_special[2] = false, false end
		if char == "\\" then in_special[1] = true end
		if in_special[2] or char == " " then in_space = true else in_space = false end
			if not in_special[1] and not in_special[2] then
				if not in_space then
					if not mag.match(char, "["..mag.pattern.punc.."]") and in_punc then
					in_punc = false
					char    = upper(char)
					end
				if mag.match(char, "["..in_punc_list.."]") then in_punc = true end
				end
			end
		end
	l = l..char
	if char == "}" then in_tag = false end
	end
	return mag.gsub(l, "%.", "", 1)
	end

	function letter_mode4(text)
	local l          = ""
	local in_tag     = false
	local in_special = {false, false}
	for char in mag.convert.chars(text) do
	if char == "{" then in_tag = true end
		if not in_tag then
		if in_special[1] and mag.match(char, "[nNh]") then in_special[2] = true else in_special[1], in_special[2] = false, false end
		if char == "\\" then in_special[1] = true end
			if not in_special[1] and not in_special[2] then
			char = lower(char)
			end
		end
	l = l..char
	if char == "}" then in_tag = false end
	end
	return l
	end

	function upper(t)
	if c.sListSelect == c_spelling_list[2] then
	t = mag.convert.up(t)
	elseif c.sListSelect == c_spelling_list[3] then
	t = mag.gsub(t, "i", "I")
	t = mag.convert.up(t)
	end
	return t
	end

	function lower(t)
	if c.sListSelect == c_spelling_list[2] then
	t = mag.convert.low(t)
	elseif c.sListSelect == c_spelling_list[3] then
	t = mag.gsub(t, "I", "i")
	t = mag.convert.low(t)
	end
	return t
	end

	function add_macro1(subs,sel)
	local apply_items                = mag.list.full_apply(subs, sel, "comment")
	c.apply                          = mag.array.search_apply(apply_items, c.apply)
	gui.main1.apply.items            = apply_items
	gui.main1.spelling_list.items    = c_spelling_list
	gui.main1.letter_mode_list.items = c_letter_mode_list
	local ok, config
	repeat
	gui.main1.spelling_list.value    = c.sListSelect
	gui.main1.letter_mode_list.value = c.lListSelect
	gui.main1.apply.value            = c.apply
	gui.main1.comment_mode.value     = c.comment_mode
	gui.main1.empty_mode.value       = c.empty_mode
	gui.main1.reset_chars.value      = c.reset_chars
	ok, config                       = mag.window.dialog(gui.main1, c_buttons1)
	c.sListSelect                    = config.u_spelling_list
	c.lListSelect                    = config.u_letter_list
	c.apply                          = config.u_apply_lines
	c.comment_mode                   = config.u_comment_mode
	c.empty_mode                     = config.u_empty_mode
	c.reset_chars                    = config.u_reset_chars
	until ok == mag.convert.ascii(c_buttons1[1])
	and c.apply ~= mag.window.lang.message("select")
	and c.sListSelect ~= mag.window.lang.message("select")
	and c.lListSelect ~= mag.window.lang.message("select")
	or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	case_conversion(subs, sel)
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
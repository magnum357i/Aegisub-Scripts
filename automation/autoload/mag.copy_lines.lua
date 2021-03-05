	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Kopyala", sub_menu = "Satır/Kopyala"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Copy Lines",    sub_menu = "Lines/Copy"}
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
	in_lang["s_desc"]              = "Seçili satırları panoya veya metin dosyasına kopyalar."
	in_lang["guiLabel1"]           = "Şundan:"
	in_lang["guiLabel2"]           = "Şuna:"
	in_lang["guiLabel3"]           = "Satırı temizle"
	in_lang["guiLabel4"]           = "Başlangıç zamanlarını ekle"
	in_lang["guiLabel5"]           = "Numarasını ekle"
	in_lang["guiLabel6"]           = "Satırları say"
	in_lang["guiLabel7"]           = "K/S ekle"
	in_lang["guiLabel8"]           = "KK ekle"
	in_lang["guiLabel9"]           = "[AYARLAR]"
	in_lang["guiLabel10"]          = "Bitiş zamanlarını ekle"
	in_lang["guiLabel11"]          = "Kare numaralarını ekle"
	in_lang["guiLabel12"]          = "[ÇALIŞTIRMA]"
	in_lang["guiLabel13"]          = "[TEKNİK BİLGİLER]"
	in_lang["guiLabel14"]          = "Boşlukları ve noktalama işaretlerini yoksay:"
	in_lang["sapKey1"]             = "Yok"
	in_lang["sapKey2"]             = "KK"
	in_lang["sapKey3"]             = "K/S"
	in_lang["sapKey4"]             = "KK ve K/S"
	in_lang["guiHint1"]            = "Satırları kopyalamadan önce ass etiketi, yorum parantezi ve satır bölme gibi şeyleri siler."
	in_lang["key1"]                = "Pano"
	in_lang["key2"]                = "Metin Dosyası"
	in_lang["tabKey1"]             = "[Son Ayarlar]"
	in_lang["buttonKey1"]          = "Kopyala"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["errorKey1"]           = "Ya başlangıç sürelerini ekleyin ya da bitiş süresi seçeneğinin işaretini kaldırın."
	in_lang["errorKey2"]           = "Önce arayüzü kullanın."
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Copies selected lines to clipboard or an text file."
	in_lang["guiLabel1"]           = "From:"
	in_lang["guiLabel2"]           = "To:"
	in_lang["guiLabel3"]           = "Strip line"
	in_lang["guiLabel4"]           = "Insert start times"
	in_lang["guiLabel5"]           = "Insert number"
	in_lang["guiLabel6"]           = "Count lines"
	in_lang["guiLabel7"]           = "Add CPS"
	in_lang["guiLabel8"]           = "Add CC"
	in_lang["guiLabel9"]           = "[OPTIONS]"
	in_lang["guiLabel10"]          = "Insert end times"
	in_lang["guiLabel11"]          = "Insert frame numbers"
	in_lang["guiLabel12"]          = "[RUN]"
	in_lang["guiLabel13"]          = "[TECHNICAL DETAILS]"
	in_lang["guiLabel14"]          = "Ignore space and punc:"
	in_lang["sapKey1"]             = "None"
	in_lang["sapKey2"]             = "CC Only"
	in_lang["sapKey3"]             = "CPS Only"
	in_lang["sapKey4"]             = "CC and CPS"
	in_lang["guiHint1"]            = "Before copying lines, deletes things like ass tag, comment bracket and line break."
	in_lang["key1"]                = "Clipboard"
	in_lang["key2"]                = "Text File"
	in_lang["tabKey1"]             = "[Last Settings]"
	in_lang["buttonKey1"]          = "Copy"
	in_lang["buttonKey2"]          = "Close"
	in_lang["errorKey1"]           = "Either mark the start times option or unmark the end times option"
	in_lang["errorKey2"]           = "Use the gui first."
	end
	return in_lang, lang_list, script_name_list, sub_menu_list
	end

	c_lang_switch       = "en"
	c_lang,
	c_lang_list,
	c_script_name_list,
	c_sub_name_list     = lang_switch_keys(c_lang_switch)

	script_name         = c_lang.s_name
	script_description  = c_lang.s_desc
	script_version      = "1.5.1"
	script_author       = "Magnum357"
	script_mag_version  = "1.1.5.0"
	script_file_name    = "mag.copy_lines"
	script_file_ext     = ".lua"

	include_unicode     = true
	include_clipboard   = true
	include_karaskel    = true
	mag_import, mag     = pcall(require, "mag")

	if mag_import then
	mag.lang            = c_lang_switch

	c_lock_gui          = false
	c_buttons1          = {c_lang.buttonKey1, c_lang.buttonKey2}
	c_copy_target_items = {mag.window.lang.message("select"), c_lang.key1, c_lang.key2}
	c_sap_items         = {c_lang.sapKey1, c_lang.sapKey2, c_lang.sapKey3, c_lang.sapKey4}

	c                   = {}
	c.copy_target       = mag.window.lang.message("select")
	c.apply_lines       = mag.window.lang.message("select")
	c.comment_mode      = true
	c.empty_mode        = true
	c.strip             = false
	c.line_stime        = false
	c.line_etime        = false
	c.line_frames       = false
	c.line_number       = false
	c.line_count        = false
	c.line_cps          = false
	c.line_cc           = false
	c.spaceandpunc      = c_sap_items[1]

	gui                 = {
		main1        = {
		               {class = "label",                           x = 0, y = 8,  width = 2, height = 1, label = c_lang.guiLabel12},
		               {class = "label",                           x = 0, y = 9,  width = 1, height = 1, label = c_lang.guiLabel1},
		apply_lines  = {class = "dropdown", name = "apply_lines",  x = 1, y = 9,  width = 1, height = 1},
		               {class = "label",                           x = 0, y = 10, width = 1, height = 1, label = c_lang.guiLabel2},
		copy_target  = {class = "dropdown", name = "copy_target",  x = 1, y = 10, width = 1, height = 1},
		comment_mode = {class = "checkbox", name = "comment_mode", x = 1, y = 11, width = 1, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode   = {class = "checkbox", name = "empty_mode",   x = 1, y = 12, width = 1, height = 1, label = mag.window.lang.message("empty_mode")},
		               {class = "label",                           x = 0, y = 0,  width = 2, height = 1, label = c_lang.guiLabel9},
		strip        = {class = "checkbox", name = "strip",        x = 0, y = 1,  width = 2, height = 1, label = c_lang.guiLabel3, hint = c_lang.guiHint1},
		line_stime   = {class = "checkbox", name = "line_stime",   x = 0, y = 2,  width = 2, height = 1, label = c_lang.guiLabel4},
		line_etime   = {class = "checkbox", name = "line_etime",   x = 0, y = 3,  width = 2, height = 1, label = c_lang.guiLabel10},
		line_frames  = {class = "checkbox", name = "line_frames",  x = 0, y = 4,  width = 2, height = 1, label = c_lang.guiLabel11},
		line_number  = {class = "checkbox", name = "line_number",  x = 0, y = 5,  width = 2, height = 1, label = c_lang.guiLabel5},
		line_count   = {class = "checkbox", name = "line_count",   x = 0, y = 6,  width = 2, height = 1, label = c_lang.guiLabel6},
		               {class = "label",                           x = 5, y = 0,  width = 2, height = 1, label = c_lang.guiLabel13},
		line_cps     = {class = "checkbox", name = "line_cps",     x = 5, y = 1,  width = 1, height = 1, label = c_lang.guiLabel7},
		line_cc      = {class = "checkbox", name = "line_cc",      x = 5, y = 2,  width = 1, height = 1, label = c_lang.guiLabel8},
		               {class = "label",                           x = 5, y = 3,  width = 1, height = 1, label = c_lang.guiLabel14},
		spaceandpunc = {class = "dropdown", name = "spaceandpunc", x = 6, y = 3,  width = 1, height = 1}
		}
	}
	end

	function copy_lines(subs,sel)
	if c.line_stime == false and c.line_etime == true then mag.show.log(c_lang.errorKey1) end
	local line, index
	local pcs         = false
	local first_index = mag.index.first(subs) - 1
	local count       = 0
	local copy_lines  = {}
	local lines_index = mag.line.index(subs, sel, c.apply_lines, c.comment_mode, c.empty_mode)
	local line_break  = ""
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	if not pcs then pcs = true end
	index           = lines_index[i]
	line            = subs[index]
	local line_text = line.text
	local line_info = ""
		if c.strip then
		line_text = mag.strip.all(line_text)
		end
		if c.line_count then
		count     = count + 1
		line_info = mag.string.combine(line_info, count, "{%1}{%2}")
		end
		if c.line_number then
		line_info = mag.string.combine(line_info, mag.string.format("#{%s}", lines_index[i] - first_index), "{%1} -> {%2}")
		end
		if c.line_stime and c.line_etime then
			if c.line_frames and mag.is.video() then
			line_info = mag.string.combine(line_info, mag.string.format("({%s} / {%s} - {%s} / {%s})",
			mag.convert.ms_to_time(line.start_time),
			mag.convert.frame_from_ms(line.start_time),
			mag.convert.ms_to_time(line.end_time),
			mag.convert.frame_from_ms(line.end_time)),
			"{%1} {%2}")
			else
			line_info = mag.string.combine(line_info, mag.string.format("({%s} - {%s})",
			mag.convert.ms_to_time(line.start_time),
			mag.convert.ms_to_time(line.end_time)),
			"{%1} {%2}")
			end
		elseif c.line_stime then
			if c.line_frames and mag.is.video() then
			line_info = mag.string.combine(line_info, mag.string.format("({%s} / {%s})",
			mag.convert.ms_to_time(line.start_time),
			mag.convert.frame_from_ms(line.start_time)),
			"{%1} {%2}")
			else
			line_info = mag.string.combine(line_info, mag.string.format("({%s})",
			mag.convert.ms_to_time(line.start_time)),
			"{%1} {%2}")
			end
		end
		if c.line_cps then
		line_info = mag.string.combine(line_info, mag.string.format("{%s}CPS", cpsmeter(line)), "{%1} - {%2}")
		end
		if c.line_cc then
			if c.line_cps then
			line_info = mag.string.combine(line_info, mag.string.format("{%s}CC", ccmeter(line)), "{%1} / {%2}")
			else
			line_info = mag.string.combine(line_info, mag.string.format("{%s}CC", ccmeter(line)), "{%1} - {%2}")
			end
		end
		if line_info ~= "" then
		line_text = mag.string.combine(mag.string.format("[{%s}]", line_info), line_text, "{%1} {%2}")
		end
	mag.array.insert(copy_lines, line_break..line_text)
	line_break = "\n"
	end
	mag.show.no_op(pcs)
	if copy_lines[1] ~= nil then return mag.array.concat(copy_lines) else return nil end
	end

	function cpsmeter(line)
	local dur, cps, text_len
	if line.end_time > line.start_time then
	dur = (line.end_time - line.start_time)
	else
	dur = 0
	end
	text_len = len(line.text, "cps")
	cps      = text_len / dur
	cps      = mag.floor(cps * 1000)
	return cps
	end

	function ccmeter(line)
	if mag.match(line.text, "\\N") then
	local strip_line     = mag.strip.bracket(line.text)
	local split_breaking = mag.string.split(mag.gsub(strip_line, "\\h", " "), "\\N")
	local breaking_len   = {}
		for b = 1, #split_breaking do
		mag.array.insert(breaking_len, len(split_breaking[b], "cc"))
		end
	mag.sort.basic(breaking_len)
	return breaking_len[#breaking_len]
	else
	return len(line.text, "cc")
	end
	end

	function len(str,mode)
	str = mag.strip.bracket(str)
	str = strip_special(str)
	if
		mode == "cps" and (c.spaceandpunc == c_sap_items[3] or c.spaceandpunc == c_sap_items[4])
		or
		mode == "cc" and (c.spaceandpunc == c_sap_items[2] or c.spaceandpunc == c_sap_items[4])
	then
	str = mag.strip.space(str)
	str = mag.strip.punc(str)
	end
	return mag.convert.len(str)
	end

	function strip_special(str) return mag.gsub(str, "\\[nNh]", " ") end

	function add_macro1(subs,sel)
	local apply_items            = mag.list.full_apply(subs, sel, "comment")
	c.apply_lines                = mag.array.search_apply(apply_items, c.apply_lines)
	gui.main1.apply_lines.items  = apply_items
	gui.main1.copy_target.items  = c_copy_target_items
	gui.main1.spaceandpunc.items = c_sap_items
	local ok, config
	repeat
	mag.config.put(gui.main1)
	ok, config                  = mag.window.dialog(gui.main1, c_buttons1)
	mag.config.take(config)
	until ok == mag.convert.ascii(c_buttons1[1]) and c.copy_target ~= mag.window.lang.message("select") and c.apply_lines ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	commandapply(subs,sel)
	end
	end

	function add_macro2(subs,sel)
	if c.apply_lines ~= mag.window.lang.message("select") and c.copy_target ~= mag.window.lang.message("select") then
	commandapply(subs,sel)
	else
	mag.show.log(2, c_lang.errorKey2)
	end
	end

	function commandapply(subs,sel)
	local copy = copy_lines(subs, sel)
	if copy ~= nil then
		if c.copy_target == c_copy_target_items[2] then
		mag.clip.set(copy)
		elseif c.copy_target == c_copy_target_items[3] then
		local file_name = aegisub.dialog.save(mag.window.lang.message("select_save_place"), "", "", mag.window.lang.message("text_file_type"), false)
			if file_name then
			local file = io.open(file_name, "w")
				if not file then
				mag.show.log(1, mag.window.lang.message("error_write_file"))
				else
				file:write(copy)
				file:close()
				end
			end
		end
	end
	end

	function check_macro1(subs,sel)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro1, subs, sel)
	mag.window.funce(fe, fee)
	mag.config.set(c)
	end
	end

	function check_macro2(subs,sel)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro2, subs, sel)
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
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..mag.window.lang.message("gui_tabname"), check_macro1)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1, check_macro2)
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
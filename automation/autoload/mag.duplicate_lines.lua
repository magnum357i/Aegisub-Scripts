	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Çoğalt",    sub_menu = "Satır/Çoğalt"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Duplicate Lines", sub_menu = "Lines/Duplicate"}
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
	in_lang["s_desc"]              = "Satırları çoğaltarak çeviri kipi imkanı sunar."
	in_lang["tabKey1"]             = "Çoğalt"
	in_lang["tabKey2"]             = "Kaldır"
	in_lang["dModeListKey1"]       = "Açıklama Parantezleri > Satır Sonu"
	in_lang["dModeListKey2"]       = "Açıklama Parantezleri > Satır İçeriği Yerine"
	in_lang["dModeListKey3"]       = "Yeni Satır > Sonraki Satır"
	in_lang["dModeListKey4"]       = "Yeni Satır > Son Satırdan Sonra"
	in_lang["buttonKey1"]          = "Çoğalt"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["buttonKey3"]          = "Kaldır"
	in_lang["guiLabelKey1"]        = "Çoğaltma kipi:"
	in_lang["outKey1"]             = "[SÇ] Değiştirildi"
	in_lang["outKey2"]             = "[SÇ] Hedef"
	in_lang["outKey3"]             = "[SÇ] Kaynak"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Provides translation mode by duplicating lines."
	in_lang["tabKey1"]             = "Duplicate"
	in_lang["tabKey2"]             = "Remove"
	in_lang["dModeListKey1"]       = "Comment Brackets > End of Line"
	in_lang["dModeListKey2"]       = "Comment Brackets > Instead of Line Content"
	in_lang["dModeListKey3"]       = "New Line > Next Line"
	in_lang["dModeListKey4"]       = "New Line > After Last Line"
	in_lang["buttonKey1"]          = "Duplicate"
	in_lang["buttonKey2"]          = "Close"
	in_lang["buttonKey3"]          = "Remove"
	in_lang["guiLabelKey1"]        = "Duplicate mode:"
	in_lang["guiLabelKey2"]        = "Sort lines by start time"
	in_lang["outKey1"]             = "[DL] Changed"
	in_lang["outKey2"]             = "[DL] Target"
	in_lang["outKey3"]             = "[DL] Source"
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
	script_author      = "Magnum357"
	script_version     = "3.2.0"
	script_mag_version = "1.1.4.7"
	script_file_name   = "mag.duplicate_lines"
	script_file_ext    = ".lua"

	include_unicode    = true
	include_karaskel   = true
	mag_import, mag    = pcall(require, "mag")

	if mag_import then
	mag.lang           = c_lang_switch

	c_lock_gui         = false
	c_dmode_list       = {mag.window.lang.message("select"), c_lang.dModeListKey1, c_lang.dModeListKey2, c_lang.dModeListKey3, c_lang.dModeListKey4}
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey2}
	c_buttons2         = {c_lang.buttonKey3, c_lang.buttonKey2}

	c                  = {}
	c.dmode_select     = mag.window.lang.message("select")
	c.apply1           = mag.window.lang.message("select")
	c.apply2           = mag.window.lang.message("select")
	c.comment_mode     = false
	c.empty_mode       = false
	c.sort_lines       = false

	gui                = {
		main1        = {
		               {class = "label",                           x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey1},
		dmode_select = {class = "dropdown", name = "dmode_select", x = 1, y = 0, width = 1, height = 1},
		               {class = "label",                           x = 0, y = 1, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply1       = {class = "dropdown", name = "apply1",       x = 1, y = 1, width = 1, height = 1, hint  = mag.window.lang.message("style_hint1")},
		comment_mode = {class = "checkbox", name = "comment_mode", x = 1, y = 2, width = 1, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode   = {class = "checkbox", name = "empty_mode",   x = 1, y = 3, width = 1, height = 1, label = mag.window.lang.message("empty_mode")},
		sort_lines   = {class = "checkbox", name = "sort_lines",   x = 1, y = 4, width = 1, height = 1, label = c_lang.guiLabelKey2},
		},
		main2        = {
		               {class = "label",                     x = 0, y = 0, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply2       = {class = "dropdown", name = "apply2", x = 1, y = 0, width = 1, height = 1, hint  = mag.window.lang.message("style_hint1")},
		}
	}
	end

	function duplicate_lines(subs,sel)
	local line, index
	local jlines      = {}
	local pcs         = false
	local lines_index = mag.line.index(subs, sel, c.apply1, c.comment_mode, c.empty_mode)
	if c.sort_lines then mag.line.sort(subs, lines_index) end
	if c.dmode_select == c_dmode_list[2] then
		for i = 1, #lines_index do
		mag.window.progress(i, #lines_index)
		if not pcs then pcs = true end
		index       = lines_index[i]
		line        = subs[index]
		line.text   = mag.format("%s{%s}", line.text, strip(line.text))
		line.effect = c_lang.outKey1
		subs[index] = line
		end
	if pcs then jlines = lines_index end
	end
	if c.dmode_select == c_dmode_list[3] then
		for i = 1, #lines_index do
		mag.window.progress(i, #lines_index)
		if not pcs then pcs = true end
		index       = lines_index[i]
		line        = subs[index]
		line.text   = mag.format("{%s}", strip(line.text))
		line.effect = c_lang.outKey1
		subs[index] = line
		end
	if pcs then jlines = lines_index end
	end
	if c.dmode_select == c_dmode_list[4] then
	local j      = 0
	local dlines = {}
		for i = 1, #lines_index do
		mag.window.progress(i, #lines_index)
		index       = lines_index[i]
		line        = subs[index]
		line.effect = c_lang.outKey3
		subs[index] = line
		mag.array.insert(dlines, line)
		end
		for i = 1, #lines_index do
		mag.window.progress(i, #lines_index)
		if not pcs then pcs = true end
		index     = lines_index[i]
		line      = dlines[i]
		l         = table.copy(line)
		l.comment = true
		l.effect  = c_lang.outKey2
		l.text    = strip(l.text)
		j         = j + 1
		subs.insert(index + j, l)
		mag.array.insert(jlines, index + j)
		end
	end
	if c.dmode_select == c_dmode_list[5] then
	local j = 0
	local dlines = {}
		for i = 1, #lines_index do
		mag.window.progress(i, #lines_index)
		index       = lines_index[i]
		line        = subs[index]
		line.effect = c_lang.outKey3
		subs[index] = line
		mag.array.insert(dlines, line)
		end
	local last_index = lines_index[#lines_index]
		for i = 1, #lines_index do
		mag.window.progress(i, #lines_index)
		if not pcs then pcs = true end
		line      = dlines[i]
		l         = table.copy(line)
		l.comment = true
		l.effect  = c_lang.outKey2
		l.text    = strip(l.text)
		j         = j + 1
		subs.insert(last_index + j, l)
		mag.array.insert(jlines, last_index + j)
		end
	end
	mag.show.no_op(pcs)
	if jlines[1] ~= nil then return jlines end
	end

	function remove_duplicate_lines(subs,sel)
	local line, index
	local pcs          = false
	local delete_index = {}
	local lines_index  = mag.line.index(subs, sel, c.apply2, false, false)
	lines_index        = mag.sort.reverse(lines_index)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	index = lines_index[i]
	line  = subs[index]
		if line.effect == c_lang.outKey1 then
		local trim1, trim2 = mag.string.last_find(line.text, "{"), mag.string.last_find(line.text, "}")
			if trim1 and trim2 then
				if trim2 > trim1 then
				if not pcs then pcs = true end
				local s     = ""
				s           = s..mag.sub(line.text, 0,         trim1 - 1)
				s           = s..mag.sub(line.text, trim2 + 1, mag.convert.len(line.text))
				line.text   = s
				line.effect = ""
				subs[index] = line
				end
			end
		elseif line.effect == c_lang.outKey2 then
		if not pcs then pcs = true end
		subs.delete(index)
		elseif line.effect == c_lang.outKey3 then
		if not pcs then pcs = true end
		line.effect = ""
		subs[index] = line
		end
	end
	mag.show.no_op(pcs, "effect", mag.string.format("{%s}, {%s}", c_lang.outKey1, c_lang.outKey2))
	end

	function strip(t)
	t = mag.strip.all(t)
	t = mag.trim.all(t)
	return t
	end

	function add_macro1(subs,sel)
	local apply_items            = mag.list.full_apply(subs, sel, "comment")
	c.apply1                     = mag.array.search_apply(apply_items, c.apply1)
	gui.main1.apply1.items       = apply_items
	gui.main1.dmode_select.items = c_dmode_list
	local ok, config
	repeat
	mag.config.put(gui.main1)
	ok, config = mag.window.dialog(gui.main1, c_buttons1)
	mag.config.take(config)
	until ok == mag.convert.ascii(c_buttons1[1]) and c.dmode_select ~= mag.window.lang.message("select") and c.apply1 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	return duplicate_lines(subs, sel)
	end
	end

	function add_macro2(subs,sel)
	local apply_items      = mag.list.full_apply(subs, sel, "comment")
	c.apply2               = mag.array.search_apply(apply_items, c.apply2)
	gui.main2.apply2.items = apply_items
	local ok, config
	repeat
	mag.config.put(gui.main2)
	ok, config = mag.window.dialog(gui.main2, c_buttons2)
	mag.config.take(config)
	until ok == mag.convert.ascii(c_buttons2[1]) and c.apply2 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons2[2])
	if ok == mag.convert.ascii(c_buttons2[1]) then
	remove_duplicate_lines(subs, sel)
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
	return fee
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
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
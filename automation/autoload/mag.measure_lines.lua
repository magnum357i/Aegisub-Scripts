	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Ölç",     sub_menu = "Satır/Ölç"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Measure Lines", sub_menu = "Lines/Measure"}
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
	in_lang["s_desc"]              = "Uygulanan satırların efekt kutularına yüzde ekler. Çeviriyi paylaştırma açısından önemlidir."
	in_lang["tabKey1"]             = "Hesapla"
	in_lang["tabKey2"]             = "Kaldır"
	in_lang["guiLabel1"]           = "İsme göre böl:"
	in_lang["guiLabel2"]           = "Tam yüzde: %0.0"
	in_lang["guiLabel3"]           = "Satır sayıları: n / n"
	in_lang["guiLabel4"]           = "İsimler arasına virgül koyun."
	in_lang["buttonKey1"]          = "Hesapla"
	in_lang["buttonKey2"]          = "Kaldır"
	in_lang["buttonKey3"]          = "Kapat"
	in_lang["out"]                 = "["..langs[1].script_name.."]"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Adds percentage to effect box of applied lines. It is important to share translation."
	in_lang["tabKey1"]             = "Calculate"
	in_lang["tabKey2"]             = "Remove"
	in_lang["guiLabel1"]           = "Separate by name:"
	in_lang["guiLabel2"]           = "Full percentage: %0.0"
	in_lang["guiLabel3"]           = "Line numbers: n / n"
	in_lang["guiLabel4"]           = "Put a comma between names."
	in_lang["buttonKey1"]          = "Calculate"
	in_lang["buttonKey2"]          = "Remove"
	in_lang["buttonKey3"]          = "Close"
	in_lang["out"]                 = "["..langs[2].script_name.."]"
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
	script_version     = "2.2"
	script_mag_version = "1.1.4.4"
	script_file_name   = "mag.measure_lines"
	script_file_ext    = ".lua"

	include_unicode    = true
	mag_import, mag    = pcall(require, "mag")

	if mag_import then
	mag.lang           = c_lang_switch

	c_out_message      = c_lang.out
	c_lock_gui         = false
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey3}
	c_buttons2         = {c_lang.buttonKey2, c_lang.buttonKey3}

	c                  = {}
	c.titles           = ""
	c.comment_mode1    = true
	c.empty_mode1      = true
	c.comment_mode2    = true
	c.empty_mode2      = true
	c.percent_mode     = true
	c.number_mode      = true
	c.apply1           = mag.window.lang.message("select")
	c.apply2           = mag.window.lang.message("select")

	gui = {
		main1         = {
	 	                {class = "label",                              x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabel1},
		titles        = {class = "edit",     name = "u_titles",        x = 1, y = 0, width = 1, height = 1},
		                {class = "label",                              x = 1, y = 1, width = 1, height = 1, label = c_lang.guiLabel4},
		                {class = "label",                              x = 0, y = 3, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply1        = {class = "dropdown", name = "u_apply_lines1",  x = 1, y = 3, width = 1, height = 1, hint = mag.window.lang.message("style_hint1")},
		comment_mode1 = {class = "checkbox", name = "u_comment_mode1", x = 1, y = 4, width = 1, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode1   = {class = "checkbox", name = "u_empty_mode1",   x = 1, y = 5, width = 1, height = 1, label = mag.window.lang.message("empty_mode")},
		percent_mode  = {class = "checkbox", name = "u_percent_mode",  x = 1, y = 6, width = 1, height = 1, label = c_lang.guiLabel2},
		number_mode   = {class = "checkbox", name = "u_number_mode",   x = 1, y = 7, width = 1, height = 1, label = c_lang.guiLabel3},
		},
		main2         = {
		                {class = "label",                              x = 0, y = 0, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply2        = {class = "dropdown", name = "u_apply_lines2",  x = 1, y = 0, width = 1, height = 1, hint = mag.window.lang.message("style_hint1")},
		comment_mode2 = {class = "checkbox", name = "u_comment_mode2", x = 1, y = 1, width = 1, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode2   = {class = "checkbox", name = "u_empty_mode2",   x = 1, y = 2, width = 1, height = 1, label = mag.window.lang.message("empty_mode")},
		}
	}
	end

	function add_measure_lines(subs,sel)
	local line, index
	local pcs          = false
	local lines_index  = mag.line.index(subs, sel, c.apply1, c.comment_mode1, c.empty_mode1)
	local titles_parts = {}
	local title_mode   = false
	local titles
	if mag.strip.space(c.titles) ~= "" then
	title_mode = true
	titles     = mag.string.vars(c.titles)
		for k = 1, #titles do
		mag.array.insert(titles_parts, mag.floor(#lines_index / #titles))
		end
	local tlc_rest = #lines_index - (titles_parts[1] * #titles)
		if tlc_rest > 0 then
		local k = 0
			repeat
			k               = k + 1
			tlc_rest        = tlc_rest - 1
			titles_parts[k] = titles_parts[k] + 1
			if k == #titles_parts then k = 0 end
			until tlc_rest == 0
		end
	end
	local tn = 0
	local m  = 1
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	if not pcs then pcs = true end
	index         = lines_index[i]
	line          = subs[index]
	local result  = ""
	local collect = ""
		if c.percent_mode then
		collect = mag.convert.zero("00000", mag.convert.percent(#lines_index, i, false, "percent"))
		else
		collect = mag.convert.zero("00",    mag.convert.percent(#lines_index, i, true, "percent"))
		end
		if c.number_mode then
		collect = mag.string.combine(collect, mag.string.format("{%1} / {%2}", #lines_index, mag.convert.zero(#lines_index, i)), "{%1} - {%2}")
		end
	result = mag.string.format("({%s})", collect)
		if title_mode then
		collect = ""
		tn      = tn + 1
			if tn > titles_parts[m] then
			m  = m + 1
			tn = 1
			end
			if c.percent_mode then
			collect = mag.convert.zero("00000", mag.convert.percent(titles_parts[m], tn, false, "percent"))
			else
			collect = mag.convert.zero("00",    mag.convert.percent(titles_parts[m], tn, true, "percent"))
			end
			if c.number_mode then
			collect = mag.string.combine(collect, mag.string.format("{%1} / {%2}", titles_parts[m], mag.convert.zero(titles_parts[m], tn)), "{%s} - {%s}")
			end
		result = mag.string.combine(result, mag.string.format("({%s}) *{%s}*", collect, titles[m]), "{%s} -> {%s}")
		end
	line.effect = mag.string.format("{%s} {%s}", c_out_message, result)
	subs[index] = line
	end
	mag.show.no_op(pcs)
	end

	function remove_measure_lines(subs,sel)
	local line, index
	local pcs         = false
	local lines_index = mag.line.index(subs, sel, c.apply2, c.comment_mode2, c.empty_mode2)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	index = lines_index[i]
	line  = subs[index]
		if mag.match(line.effect, mag.convert.esc(c_out_message)) then
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
	gui.main1.titles.value        = c.titles
	gui.main1.apply1.value        = c.apply1
	gui.main1.comment_mode1.value = c.comment_mode1
	gui.main1.empty_mode1.value   = c.empty_mode1
	gui.main1.percent_mode.value  = c.percent_mode
	gui.main1.number_mode.value   = c.number_mode
	ok, config                    = mag.window.dialog(gui.main1, c_buttons1)
	c.titles                      = config.u_titles
	c.apply1                      = config.u_apply_lines1
	c.comment_mode1               = config.u_comment_mode1
	c.empty_mode1                 = config.u_empty_mode1
	c.percent_mode                = config.u_percent_mode
	c.number_mode                 = config.u_number_mode
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply1 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	add_measure_lines(subs, sel)
	end
	end

	function add_macro2(subs,sel)
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
	remove_measure_lines(subs, sel)
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
	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satırları Dışa Aktar", sub_menu = "Satır/Dışa Aktar"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Export Lines",         sub_menu = "Lines/Export"}
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
	in_lang["s_desc"]              = "Belirli filtrelere göre seçilmiş satırların olduğu yeni bir altyazı dosyası oluşturur."
	in_lang["buttonKey1"]          = "ASS olaraK kaydet"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["buttonKey3"]          = "SRT olarak kaydet"
	in_lang["guiLabel1"]           = "Oyuncu"
	in_lang["guiLabel2"]           = "Efekt"
	in_lang["guiLabel3"]           = "Stil"
	in_lang["guiHeader1"]          = "FİLTRELER"
	in_lang["msgSuccess"]          = "Yeni bir altyazı başarıyla oluşturuldu. Dosyanızın yolu: {%s}"
	in_lang["txtMatchMode1"]       = "tamamı"
	in_lang["txtMatchMode2"]       = "normal"
	in_lang["txtMatchMode3"]       = "regex"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Creates a new subtitle file with selected lines based on specific filters."
	in_lang["buttonKey1"]          = "Save as ASS"
	in_lang["buttonKey2"]          = "Close"
	in_lang["buttonKey3"]          = "Save as SRT"
	in_lang["guiLabel1"]           = "Actor"
	in_lang["guiLabel2"]           = "Effect"
	in_lang["guiLabel3"]           = "Style"
	in_lang["guiHeader1"]          = "FILTERS"
	in_lang["msgSuccess"]          = "A new subtitle file created successfully. The path of your file: {%s}"
	in_lang["txtMatchMode1"]       = "whole word"
	in_lang["txtMatchMode2"]       = "normal"
	in_lang["txtMatchMode3"]       = "regex"
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
	script_version      = "1"
	script_author       = "Magnum357"
	script_mag_version  = "1.1.4.7"
	script_file_name    = "mag.export_lines"
	script_file_ext     = ".lua"

	include_unicode     = true
	include_clipboard   = true
	include_karaskel    = true
	mag_import, mag     = pcall(require, "mag")

	if mag_import then
	mag.lang            = c_lang_switch

	c_lock_gui          = false
	c_buttons1          = {c_lang.buttonKey1, c_lang.buttonKey3, c_lang.buttonKey2}
	c_text_match_modes  = {c_lang.txtMatchMode1, c_lang.txtMatchMode2, c_lang.txtMatchMode3}

	c                   = {}
	c.actor_filter      = ""
	c.effect_filter     = ""
	c.style_filter      = mag.window.lang.message("select")
	c.use_actor_filter  = false
	c.use_effect_filter = false
	c.use_style_filter  = false
	c.actor_match_mode  = c_lang.txtMatchMode1
	c.effect_match_mode = c_lang.txtMatchMode1

	gui = {
		main1 = {
			                    {class = "label",                                x = 0,  y = 0, width = 17, height = 1, label = c_lang.guiHeader1},
			use_actor_filter  = {class = "checkbox", name = "use_actor_filter",  x = 0,  y = 1, width = 1,  height = 1, label = c_lang.guiLabel1},
			use_effect_filter = {class = "checkbox", name = "use_effect_filter", x = 0,  y = 2, width = 1,  height = 1, label = c_lang.guiLabel2},
			use_style_filter  = {class = "checkbox", name = "use_style_filter",  x = 0,  y = 3, width = 1,  height = 1, label = c_lang.guiLabel3},
			actor_filter      = {class = "edit",     name = "actor_filter",      x = 2,  y = 1, width = 15, height = 1},
			effect_filter     = {class = "edit",     name = "effect_filter",     x = 2,  y = 2, width = 15, height = 1},
			style_filter      = {class = "dropdown", name = "style_filter",      x = 2,  y = 3, width = 16, height = 1},
			actor_match_mode  = {class = "dropdown", name = "actor_match_mode",  x = 17, y = 1, width = 1,  height = 1, items = c_text_match_modes},
			effect_match_mode = {class = "dropdown", name = "effect_match_mode", x = 17, y = 2, width = 1,  height = 1, items = c_text_match_modes}
		}
	}
	end

	function export_data_ass(subs,sel)
	local line, index, lines_index
	local pcs                = false
	local pass               = 0
	local passed             = 0
	local clean_style_filter = mag.strip.apply(c.style_filter)
	if c.use_style_filter == true and clean_style_filter ~= mag.window.lang.message("select") then
	lines_index = mag.line.index(subs, sel, c.style_filter, false, true)
	else
	lines_index = mag.line.index(subs, sel, mag.window.lang.message("all_lines"), false, true)
	end
	local line_break     = ""
	local content        = {
		info          = {},
		styles        = {},
		lines         = {},
		styles_format = "Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding",
		events_format = "Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text"
	}
	for i = 1, #subs do
	mag.window.progress(i, #subs)
	index = i
	line  = subs[index]
		if line.class == "dialogue" then
		break
		else
			if line.class == "info" then
			mag.array.insert(content.info, line_break..line.raw)
			elseif line.class == "style" then
			mag.array.insert(content.styles, line_break..line.raw)
			end
			line_break = "\n"
		end
	end
	line_break = ""
	if c.use_actor_filter  == true and c.actor_filter  ~= ""                                   then pass = pass + 1 end
	if c.use_effect_filter == true and c.effect_filter ~= ""                                   then pass = pass + 1 end
	if c.use_style_filter  == true and clean_style_filter ~= mag.window.lang.message("select") then pass = pass + 1 end
	for i = 1, #lines_index do
	index  = lines_index[i]
	line   = subs[index]
	passed = 0
		if c.use_actor_filter == true and c.actor_filter ~= "" then
			if
				c.actor_match_mode == c_lang.txtMatchMode1 and c.actor_filter == line.actor
				or
				c.actor_match_mode == c_lang.txtMatchMode2 and mag.find(line.actor, c.actor_filter)
				or
				c.actor_match_mode == c_lang.txtMatchMode3 and mag.match(line.actor, c.actor_filter)
			then
			passed = passed + 1
			end
		end
		if c.use_effect_filter == true and c.effect_filter ~= "" then
			if
				c.effect_match_mode == c_lang.txtMatchMode1 and c.effect_filter == line.effect
				or
				c.effect_match_mode == c_lang.txtMatchMode2 and mag.find(line.effect, c.effect_filter)
				or
				c.effect_match_mode == c_lang.txtMatchMode3 and mag.match(line.effect, c.effect_filter)
			then
			passed = passed + 1
			end
		end
	if c.use_style_filter  == true and clean_style_filter ~= mag.window.lang.message("select")     then passed = passed + 1 end
		if passed > 0 and pass == passed then
		if not pcs then pcs = true end
		mag.array.insert(content.lines, line_break..line.raw)
		line_break = "\n"
		end
	end
	mag.show.no_op(pcs)
	if #content.lines > 0 then
	return mag.string.format("[Script Info]\n{%s}\n\n[V4+ Styles]\n{%s}{%s}\n\n[Events]\n{%s}\n{%s}", mag.array.concat(content.info), content.styles_format, mag.array.concat(content.styles), content.events_format, mag.array.concat(content.lines))
	else
	return nil
	end
	end

	function export_data_srt(subs,sel)
	local line, index, lines_index
	local pcs                = false
	local pass               = 0
	local passed             = 0
	local clean_style_filter = mag.strip.apply(c.style_filter)
	local count              = 0
	if c.use_style_filter == true and clean_style_filter ~= mag.window.lang.message("select") then
	lines_index = mag.line.index(subs, sel, c.style_filter, false, true)
	else
	lines_index = mag.line.index(subs, sel, mag.window.lang.message("all_lines"), false, true)
	end
	local line_break = ""
	local content    = {}
	if c.use_actor_filter  == true and c.actor_filter  ~= ""                                   then pass = pass + 1 end
	if c.use_effect_filter == true and c.effect_filter ~= ""                                   then pass = pass + 1 end
	if c.use_style_filter  == true and clean_style_filter ~= mag.window.lang.message("select") then pass = pass + 1 end
	local srt_time = 0
	for i = 1, #lines_index do
	index  = lines_index[i]
	line   = subs[index]
	passed = 0
		if c.use_actor_filter == true and c.actor_filter ~= "" then
			if
				c.actor_match_mode == c_lang.txtMatchMode1 and c.actor_filter == line.actor
				or
				c.actor_match_mode == c_lang.txtMatchMode2 and mag.find(line.actor, c.actor_filter)
				or
				c.actor_match_mode == c_lang.txtMatchMode3 and mag.match(line.actor, c.actor_filter)
			then
			passed = passed + 1
			end
		end
		if c.use_effect_filter == true and c.effect_filter ~= "" then
			if
				c.effect_match_mode == c_lang.txtMatchMode1 and c.effect_filter == line.effect
				or
				c.effect_match_mode == c_lang.txtMatchMode2 and mag.find(line.effect, c.effect_filter)
				or
				c.effect_match_mode == c_lang.txtMatchMode3 and mag.match(line.effect, c.effect_filter)
			then
			passed = passed + 1
			end
		end
	if c.use_style_filter  == true and clean_style_filter ~= mag.window.lang.message("select")     then passed = passed + 1 end
		if passed > 0 and pass == passed then
		if not pcs then pcs = true end
		count    = count + 1
		srt_time = mag.string.format("{%s} --> {%s}", ass_time_to_srt_time(line.start_time), ass_time_to_srt_time(line.end_time))
		if srt_time == 0 then break end
		mag.array.insert(content,
			mag.string.format("{%s}{%s}\n{%s}\n{%s}",
			line_break,
			count,
			srt_time,
			srt_text(line.text)
			)
		)
		line_break = "\n\n"
		end
	end
	mag.show.no_op(pcs)
	if #content > 0 then return mag.array.concat(content) else return nil end
	end

	function ass_time_to_srt_time(time)
	time = mag.s(mag.sub(time, 1, -2))
	local hour, min, sec, ms = "0", "00", "00", "00"
	if mag.convert.len(time) <= 2 then
	hour, min, sec, ms = hour, min, sec, time
		if mag.convert.len(hour) == 1 then
		hour = "0"..hour
		end
	min  = mag.convert.zero(10, min)
	sec  = mag.convert.zero(10, sec)
	ms   = mag.convert.zero(10, ms)
	time = mag.format("%s:%s:%s,%s0", hour, min, sec, ms)
	else
	sec, ms = mag.match(time, "(%d+)(%d%d)")
	min = mag.floor(sec / 60)
		if mag.n(sec) >= 60 then
		sec = sec - min * 60
		end
		if mag.n(min) >= 60 then
		hour = mag.floor(min / 60)
		min = min - hour * 60
		end
	hour, min, sec, ms = mag.gsub(hour / 100, "^[0%.]+", ""), mag.convert.zero(10, min), mag.convert.zero(10, sec), mag.convert.zero(10, ms)
		if hour == "" then
		hour = "0"
		end
		if mag.convert.len(hour) == 1 then
		hour = "0"..hour
		end
	time = mag.format("%s:%s:%s,%s0", hour, min, sec, ms)
	end
	return time
	end

	function srt_text(t)
	t = mag.trim.all(t)
	t = mag.gsub(t, "\\N", "\n")
	t = mag.gsub(t, "{\\i1}", "<i1>")
	t = mag.gsub(t, "{\\i0}", "<i0>")
	t = mag.gsub(t, "{\\b1}", "<b1>")
	t = mag.gsub(t, "{\\b0}", "<b0>")
	t = mag.strip.special(t, " ", {true, true, true})
	t = mag.strip.tag(t)
	t = mag.strip.comment(t)
	t = mag.gsub(t, "þ", "ş")
	t = mag.gsub(t, "Þ", "Ş")
	t = mag.gsub(t, "Ý", "İ")
	t = mag.gsub(t, "ý", "ı")
	t = mag.gsub(t, "ð", "ğ")
	t = mag.gsub(t, "Ð", "Ğ")
	return t
	end

	function add_macro1(subs, sel)
	local style_filter_items     = mag.list.full_apply(subs, sel, "comment")
	c.style_filter               = mag.array.search_apply(style_filter_items, c.style_filter)
	gui.main1.style_filter.items = style_filter_items
	local ok, config
	local export_file
	repeat
	mag.config.put(gui.main1)
	ok, config = mag.window.dialog(gui.main1, c_buttons1)
	mag.config.take(config)
		if ok == mag.convert.ascii(c_buttons1[1]) then
		export_file = aegisub.dialog.save(mag.window.lang.message("select_save_place"), "", "", mag.window.lang.message("ass_file_type"), false)
		elseif ok == mag.convert.ascii(c_buttons1[2]) then
		export_file = aegisub.dialog.save(mag.window.lang.message("select_save_place"), "", "", mag.window.lang.message("srt_file_type"), false)
		end
	until export_file ~= nil or ok == mag.convert.ascii(c_buttons1[3])
	if ok == mag.convert.ascii(c_buttons1[1]) or ok == mag.convert.ascii(c_buttons1[2]) then
		if export_file then
		local data
			if ok == mag.convert.ascii(c_buttons1[1]) then
			data = export_data_ass(subs, sel)
			elseif ok == mag.convert.ascii(c_buttons1[2]) then
			data = export_data_srt(subs, sel)
			end
			if data ~= nil then
			local file = io.open(export_file, "w")
				if not file then
				mag.show.log(1, mag.window.lang.message("error_write_file"))
				else
				mag.show.log(4,  mag.string.format(c_lang.msgSuccess, export_file))
				file:write(data)
				file:close()
				end
			end
		end
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
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..mag.window.lang.message("gui_tabname"), check_macro1)
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
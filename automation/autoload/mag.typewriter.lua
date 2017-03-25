	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Harf Harf Yaz"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Typewriter"}
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
	in_lang["s_desc"]              = "Daktilo tarzı ekran yazılarına yardım eder."
	in_lang["buttonKey1"]          = "Uygula"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["guiLabelKey1"]        = "Satır görünmeye başlarken"
	in_lang["guiLabelKey2"]        = "Satır görünmemeye başlarken"
	in_lang["guiLabelKey3"]        = "Yön:"
	in_lang["guiLabelKey4"]        = "Süre (ms):"
	in_lang["guiLabelKey5"]        = "Geçişi kaldır"
	in_lang["dListKey1"]           = "Soldan sağa"
	in_lang["dListKey2"]           = "Sağdan sola"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Helps typewriter-style typesettings."
	in_lang["buttonKey1"]          = "Apply"
	in_lang["buttonKey2"]          = "Close"
	in_lang["guiLabelKey1"]        = "When line starts to appear"
	in_lang["guiLabelKey2"]        = "When line starts to disappear"
	in_lang["guiLabelKey3"]        = "Direction:"
	in_lang["guiLabelKey4"]        = "Duration (ms):"
	in_lang["guiLabelKey5"]        = "Remove fading"
	in_lang["dListKey1"]           = "Left to right"
	in_lang["dListKey2"]           = "Right to left"
	end
	return in_lang, lang_list, script_name_list
	end

	c_lang_switch      = "en"
	c_lang,
	c_lang_list,
	c_script_name_list = lang_switch_keys(c_lang_switch)

	script_name        = c_lang.s_name
	script_description = c_lang.s_desc
	script_author      = "Magnum357"
	script_version     = "1.8"
	script_mag_version = "1.1.4.4"
	script_file_name   = "mag.typewriter"
	script_file_ext    = ".lua"

	include_unicode    = true
	mag_import, mag    = pcall(require, "mag")

	if mag_import then
	mag.lang           = c_lang_switch

	c_lock_gui         = false
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey2}
	c_dListItems       = {mag.window.lang.message("select"), c_lang.dListKey1, c_lang.dListKey2}
	c_stransform       = "{\\alpha&HFF&\\t({%1},{%2},\\alpha&H00&)}"
	c_etransform       = "{\\alpha&H00&\\t({%1},{%2},\\alpha&HFF&)}"
	c_setransform      = "{\\alpha&HFF&\\t({%1},{%2},\\alpha&H00&)\\t({%3},{%4},\\alpha&HFF&)}"

	c                  = {}
	c.comment_mode     = true
	c.empty_mode       = true
	c.apply            = mag.window.lang.message("select")
	c.sdir             = mag.window.lang.message("select")
	c.seff             = false
	c.sfade            = false
	c.sdur             = 0
	c.edir             = mag.window.lang.message("select")
	c.eeff             = false
	c.efade            = false
	c.edur             = 0

	gui                = {
		main1        = {
		seff         = {class = "checkbox", name = "u_seff",         x = 0, y = 0,  width = 2, height = 1, label = c_lang.guiLabelKey1},
		               {class = "label",                             x = 0, y = 1,  width = 1, height = 1, label = c_lang.guiLabelKey3},
		sdir         = {class = "dropdown", name = "u_sdir",         x = 1, y = 1,  width = 1, height = 1},
		               {class = "label",                             x = 0, y = 2,  width = 1, height = 1, label = c_lang.guiLabelKey4},
		sdur         = {class = "intedit",  name = "u_sdur",         x = 1, y = 2,  width = 1, height = 1},
		sfade        = {class = "checkbox", name = "u_sfade",        x = 1, y = 3,  width = 2, height = 1, label = c_lang.guiLabelKey5},
		eeff         = {class = "checkbox", name = "u_eeff",         x = 0, y = 5,  width = 2, height = 1, label = c_lang.guiLabelKey2},
		               {class = "label",                             x = 0, y = 6,  width = 1, height = 1, label = c_lang.guiLabelKey3},
		edir         = {class = "dropdown", name = "u_edir",         x = 1, y = 6,  width = 1, height = 1},
		               {class = "label",                             x = 0, y = 7,  width = 1, height = 1, label = c_lang.guiLabelKey4},
		edur         = {class = "intedit",  name = "u_edur",         x = 1, y = 7,  width = 1, height = 1},
		efade        = {class = "checkbox", name = "u_efade",        x = 1, y = 8,  width = 2, height = 1, label = c_lang.guiLabelKey5},
		               {class = "label",                             x = 0, y = 10, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply        = {class = "dropdown", name = "u_apply_lines",  x = 1, y = 10, width = 1, height = 1, hint = mag.window.lang.message("style_hint1")},
		comment_mode = {class = "checkbox", name = "u_comment_mode", x = 1, y = 11, width = 1, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode   = {class = "checkbox", name = "u_empty_mode",   x = 1, y = 12, width = 1, height = 1, label = mag.window.lang.message("empty_mode")},
		}
	}
	end

	function typewritter(subs,sel)
	local line, index
	local pcs = false
	if c.seff and c.sdir ~= mag.window.lang.message("select") and c.sdur > 0 or c.eeff and c.edir ~= mag.window.lang.message("select") and c.edur > 0 then
	local line
	local lines_index = mag.line.index(subs, sel, c.apply, c.comment_mode, c.empty_mode)
		for i = 1, #lines_index do
		if not pcs then pcs = true end
		index = lines_index[i]
		line  = subs[index]
		local in_tags  = false
		local result   = ""
		local dur
		local dur2
			if c.eeff then
			dur2 = (line.end_time - line.start_time)
			dur  = dur2 - c.edur
			end
		local text_len = 0
			for char in mag.convert.chars(line.text) do
			if char == "{" then in_tags = true end
			if not in_tags and not mag.match(char, "%s") then text_len = text_len + 1 end
			if char == "}" then in_tags = false end
			end
		local n = 0
		local s_interval
		local s_interval2
		local e_interval
		local e_interval2
			if c.seff then
			s_interval  = c.sdur / text_len
			s_interval2 = s_interval + ( s_interval / text_len )
			end
			if c.eeff then
			e_interval  = c.edur / text_len
			e_interval2 = e_interval + ( e_interval / text_len )
			end
			for char in mag.convert.chars(line.text) do
			if char == "{" then in_tags = true end
				if not in_tags and not mag.match(char, "%s") then
				n = n + 1
				local s_t_start
				local s_t_end
				local e_t_start
				local e_t_end
					if c.seff then
						if c.sdir == c_dListItems[2] then
							if c.sfade then
							s_t_start = s_interval2 * (n - 1)
							s_t_end   = s_t_start
							if n == 1 then s_t_start = 1 s_t_end = 1 end
							if n == text_len then s_t_start = c.sdur s_t_end = c.sdur end
							else
							s_t_start = s_interval * (n - 1)
							s_t_end   = s_interval * n
							end
						end
						if c.sdir == c_dListItems[3] then
							if c.sfade then
							s_t_start = c.sdur - s_interval2 * (n - 1)
							s_t_end   = s_t_start
							if n == 1 then s_t_start = c.sdur s_t_end = c.sdur end
							if n == text_len then s_t_start = 1 s_t_end = 1 end
							else
							s_t_start = c.sdur - s_interval * n
							s_t_end   = c.sdur - s_interval * (n - 1)
							if n == text_len then s_t_start = 0 s_t_end = s_interval end
							end
						end
					end
					if c.eeff then
						if c.edir == c_dListItems[2] then
							if c.efade then
							e_t_start = dur + e_interval2 * (n - 1)
							e_t_end   = e_t_start
							if n == 1 then e_t_start = dur e_t_end = dur end
							if n == text_len then e_t_start = dur + c.sdur e_t_end = dur + c.sdur end
							else
							e_t_start = dur + e_interval * (n - 1)
							e_t_end   = dur + e_interval * n
							if n == 1 then e_t_start = dur e_t_end = dur end
							if n == text_len then e_t_start = dur2 - e_interval e_t_end = dur2 end
							end
						end
						if c.edir == c_dListItems[3] then
							if c.efade then
							e_t_start = dur2 - e_interval2 * (n - 1)
							e_t_end   = e_t_start
							if n == text_len then e_t_start = dur e_t_end = dur end
							else
							e_t_start = dur2 - e_interval * n
							e_t_end   = dur2 - e_interval * (n - 1)
							if n == text_len then e_t_start = dur e_t_end = dur + e_interval end
							end
						end
					end
					if s_t_start ~= nil and s_t_end ~= nil and e_t_start ~= nil and e_t_end ~= nil then
					char = mag.string.format(c_setransform, mag.floor(s_t_start), mag.floor(s_t_end), mag.floor(e_t_start), mag.floor(e_t_end))..char
					elseif s_t_start ~= nil and s_t_end ~= nil and e_t_start == nil and e_t_end == nil then
					char = mag.string.format(c_stransform, mag.floor(s_t_start), mag.floor(s_t_end))..char
					elseif s_t_start == nil and s_t_end == nil and e_t_start ~= nil and e_t_end ~= nil then
					char = mag.string.format(c_etransform, mag.floor(e_t_start), mag.floor(e_t_end))..char
					end
				end
			result = result..char
			if char == "}" then in_tags = false end
			end
		line.text = result
		subs[index] = line
		end
	end
	mag.show.no_op(pcs)
	end

	function add_macro1(subs,sel)
	local apply_items     = mag.list.full_apply(subs, sel, "comment")
	c.apply               = mag.array.search_apply(apply_items, c.apply)
	gui.main1.apply.items = apply_items
	gui.main1.sdir.items  = c_dListItems
	gui.main1.edir.items  = c_dListItems
	local ok, config
	repeat
	gui.main1.sdur.value         = c.sdur
	gui.main1.sfade.value        = c.sfade
	gui.main1.seff.value         = c.seff
	gui.main1.sdir.value         = c.sdir
	gui.main1.edur.value         = c.edur
	gui.main1.efade.value        = c.efade
	gui.main1.eeff.value         = c.eeff
	gui.main1.edir.value         = c.edir
	gui.main1.apply.value        = c.apply
	gui.main1.comment_mode.value = c.comment_mode
	gui.main1.empty_mode.value   = c.empty_mode
	ok, config                   = mag.window.dialog(gui.main1, c_buttons1)
	c.apply                      = config.u_apply_lines
	c.comment_mode               = config.u_comment_mode
	c.empty_mode                 = config.u_empty_mode
	c.sdur                       = config.u_sdur
	c.sdir                       = config.u_sdir
	c.seff                       = config.u_seff
	c.sfade                      = config.u_sfade
	c.edur                       = config.u_edur
	c.edir                       = config.u_edir
	c.eeff                       = config.u_eeff
	c.efade                      = config.u_efade
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	typewritter(subs, sel)
	end
	end

	function check_macro1(subs, sel)
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
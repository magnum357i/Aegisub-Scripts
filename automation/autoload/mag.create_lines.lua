	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Oluştur", sub_menu = "Satır/Oluştur"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Create Lines",  sub_menu = "Lines/Create"}
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
	in_lang["s_desc"]              = "Satır oluşturmaya yardım eder."
	in_lang["tabKey1"]             = "Gömülü Yazı"
	in_lang["tabKey2"]             = "Şarkı"
	in_lang["key1"]                = "Başlangıç süresi ({%s}), bitiş süresinden ({%s}) büyük."
	in_lang["guiLabelKey1"]        = "Başlangıç zamanı:"
	in_lang["guiLabelKey2"]        = "Bitiş zamanı:"
	in_lang["guiLabelKey3"]        = "Bir metin girin:"
	in_lang["guiLabelKey4"]        = "Satır başlangıç zamanı:"
	in_lang["guiLabelKey5"]        = "Satır süresi:"
	in_lang["buttonKey1"]          = "Satır Oluştur"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["buttonKey3"]          = "Panoyu Yapıştır"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Helps to create a line."
	in_lang["tabKey1"]             = "Hardsub"
	in_lang["tabKey2"]             = "Karaoke"
	in_lang["key1"]                = "Start time ({%s}) is bigger than end time ({%s})."
	in_lang["guiLabelKey1"]        = "Start time:"
	in_lang["guiLabelKey2"]        = "End time:"
	in_lang["guiLabelKey3"]        = "Type a text:"
	in_lang["guiLabelKey4"]        = "Line start time:"
	in_lang["guiLabelKey5"]        = "Line duration:"
	in_lang["buttonKey1"]          = "Create Line"
	in_lang["buttonKey2"]          = "Close"
	in_lang["buttonKey3"]          = "Paste Clipboard"
	end
	return in_lang, lang_list, script_name_list, sub_menu_list
	end

	c_lang_switch        = "en"
	c_lang,
	c_lang_list,
	c_script_name_list,
	c_sub_name_list      = lang_switch_keys(c_lang_switch)

	script_name          = c_lang.s_name
	script_description   = c_lang.s_desc
	script_version       = "1.3"
	script_author        = "Magnum357"
	script_mag_version   = "1.1.5.0"
	script_file_name     = "mag.create_lines"
	script_file_ext      = ".lua"

	include_unicode      = true
	include_clipboard    = true
	include_karaskel     = true
	mag_import, mag      = pcall(require, "mag")

	if mag_import then
	mag.lang             = c_lang_switch

	c_lock_gui           = false
	c_buttons1           = {c_lang.buttonKey1, c_lang.buttonKey2}
	c_buttons2           = {c_lang.buttonKey1, c_lang.buttonKey3, c_lang.buttonKey2}
	c_hardsub_start_time = 0
	c_hardsub_end_time   = 0

	c                    = {}
	c.kdur               = "30000"

	gui                  = {
		main1    = {
		           {class = "label",                         x = 0, y = 0, width = 1,  height = 1, label = c_lang.guiLabelKey1},
		           {class = "label",                         x = 0, y = 1, width = 1,  height = 1, label = c_lang.guiLabelKey2},
		label1   = {class = "label",                         x = 1, y = 0, width = 10, height = 1},
		label2   = {class = "label",                         x = 1, y = 1, width = 10, height = 1},
		           {class = "label",                         x = 0, y = 2, width = 1,  height = 1, label = c_lang.guiLabelKey3},
		text     = {class = "edit",     name = "u_text",     x = 1, y = 2, width = 10, height = 1},
		},
		main2    = {
		label1   = {class = "label",                         x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey4},
		label2   = {class = "label",                         x = 1, y = 0, width = 1, height = 1},
		           {class = "label",                         x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey5},
		duration = {class = "edit",     name = "u_duration", x = 1, y = 1, width = 1, height = 1},
		           {class = "label",                         x = 0, y = 2, width = 1, height = 1, label = c_lang.guiLabelKey3},
		text     = {class = "edit",     name = "u_text",     x = 1, y = 2, width = 1, height = 1},
		}
	}
	end

	function hardsub(subs,sel,act)
	if not mag.is.video() then
	mag.show.log(1, mag.window.lang.message("is_video"))
	else
	local current_time = mag.convert.ms_from_frame(aegisub.project_properties().video_position)
	if current_time < 0 then current_time = 1 end
		if c_hardsub_start_time == 0 and c_hardsub_end_time == 0 then
		c_hardsub_start_time = current_time
		elseif c_hardsub_start_time > 0 and c_hardsub_end_time == 0 then
		c_hardsub_end_time   = current_time
		local jump
			if c_hardsub_start_time > c_hardsub_end_time then
			mag.show.log(1, mag.string.format(c_lang.key1, mag.convert.ms_to_time(c_hardsub_start_time), mag.convert.ms_to_time(c_hardsub_end_time)))
			else
			local ok, config
			gui.main1.label1.label = mag.convert.ms_to_time(c_hardsub_start_time)
			gui.main1.label2.label = mag.convert.ms_to_time(c_hardsub_end_time)
				repeat
				ok, config             = mag.window.dialog(gui.main1, c_buttons1)
				until ok == mag.convert.ascii(c_buttons1[1]) and not mag.is.empty(config.u_text) or ok == mag.convert.ascii(c_buttons1[2])
				if ok == mag.convert.ascii(c_buttons1[1]) then
				local l              = table.copy(subs[act])
				l.layer              = 0
				l.start_time         = c_hardsub_start_time
				l.end_time           = c_hardsub_end_time
				l.text               = config.u_text
				l.actor              = ""
				l.effect             = ""
				l.margin_l           = 0
				l.margin_r           = 0
				l.margin_t           = 0
				jump                 = act + 1
				subs.insert(jump, l)
				end
			end
		c_hardsub_start_time = 0
		c_hardsub_end_time   = 0
		if jump ~= nil then return {jump} end
		end
	end
	end

	function karaoke(subs,sel,act)
	if not mag.is.video() then
	mag.show.log(1, mag.window.lang.message("is_video"))
	else
	local ok, config
	local line_end_time      = subs[act].end_time
	gui.main2.label2.label   = mag.convert.ms_to_time(line_end_time)
	gui.main2.text.value     = ""
		repeat
		if ok == mag.convert.ascii(c_buttons2[2]) then
		gui.main2.text.value     = mag.clip.get()
		end
		gui.main2.duration.value = mag.convert.ms_to_time(c.kdur)
		ok, config               = mag.window.dialog(gui.main2, c_buttons2)
		c.kdur                   = mag.convert.time_to_ms(config.u_duration)
		until ok == mag.convert.ascii(c_buttons2[1]) and not mag.is.empty(config.u_text) or ok == mag.convert.ascii(c_buttons2[3])
		if ok == mag.convert.ascii(c_buttons1[1]) then
		local l      = table.copy(subs[act])
		l.layer      = 0
		l.start_time = line_end_time
		l.end_time   = line_end_time + c.kdur
		l.text = config.u_text
		l.actor      = ""
		l.effect     = ""
		l.margin_l   = 0
		l.margin_r   = 0
		l.margin_t   = 0
		subs.insert(act + 1, l)
		return {act + 1}
		end
	end
	end

	function check_macro1(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(hardsub, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	return fee
	end
	end

	function check_macro2(subs, sel, act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(karaoke, subs, sel, act)
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
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
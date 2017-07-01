	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır İstatistikleri"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Line Statistics"}
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
	in_lang["s_desc"]              = "Türlerine göre satırları sayar."
	in_lang["buttonKey1"]          = "Uygula"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["guiLabelKey1"]        = "Karaoke için oluşturulmuş satırların sayısı"
	in_lang["guiLabelKey2"]        = "Şablon satırlarının sayısı"
	in_lang["guiLabelKey3"]        = "Karaoke satırlarının sayısı"
	in_lang["guiLabelKey4"]        = "Yorum satırlarının sayısı"
	in_lang["guiLabelKey5"]        = "Boş satırların sayısı"
	in_lang["guiLabelKey6"]        = "Diğer satırları bul"
	in_lang["guiLabelKey7"]        = "Toplam sonucu göster"
	in_lang["guiLabelKey8"]        = "Stile göre grupla"
	in_lang["guiLabelKey9"]        = "Oyuncu satırlarının sayısı"
	in_lang["guiLabelKey10"]       = "Efekt satırlarının sayısı"
	in_lang["reportKey1"]          = "[Stil: \"{%s}\"]"
	in_lang["reportKey2"]          = "yok"
	in_lang["reportKey5"]          = "Karaoke için oluşturulmuş"
	in_lang["reportKey6"]          = "Şablon"
	in_lang["reportKey7"]          = "Karaoke"
	in_lang["reportKey8"]          = "Yorum"
	in_lang["reportKey9"]          = "Boş"
	in_lang["reportKey10"]         = "Diğerleri"
	in_lang["reportKey11"]         = "Toplam"
	in_lang["reportKey12"]         = "{%s:# [satır][satır]}"
	in_lang["reportKey13"]         = "{%s:# [satır][satır]} ({%s})"
	in_lang["reportKey14"]         = "Oyuncu"
	in_lang["reportKey15"]         = "Efekt"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Counts lines by type."
	in_lang["buttonKey1"]          = "Apply"
	in_lang["buttonKey2"]          = "Close"
	in_lang["guiLabelKey1"]        = "Number of generated lines for karaoke"
	in_lang["guiLabelKey2"]        = "Number of template lines"
	in_lang["guiLabelKey3"]        = "Number of karaoke lines"
	in_lang["guiLabelKey4"]        = "Number of comment lines"
	in_lang["guiLabelKey5"]        = "Number of empty lines"
	in_lang["guiLabelKey6"]        = "Find other lines"
	in_lang["guiLabelKey7"]        = "Show total result"
	in_lang["guiLabelKey8"]        = "Group by style"
	in_lang["guiLabelKey9"]        = "Number of actor lines"
	in_lang["guiLabelKey10"]       = "Number of effect lines"
	in_lang["reportKey1"]          = "[Style: \"{%s}\"]"
	in_lang["reportKey2"]          = "none"
	in_lang["reportKey5"]          = "Generated for karaoke"
	in_lang["reportKey6"]          = "Template"
	in_lang["reportKey7"]          = "Karaoke"
	in_lang["reportKey8"]          = "Comment"
	in_lang["reportKey9"]          = "Empty"
	in_lang["reportKey10"]         = "Others"
	in_lang["reportKey11"]         = "Total"
	in_lang["reportKey12"]         = "{%s:# [line][lines]}"
	in_lang["reportKey13"]         = "{%s:# [line][lines]} ({%s})"
	in_lang["reportKey14"]         = "Actor"
	in_lang["reportKey15"]         = "Effect"
	in_lang["reportKey16"]         = "{%s}: {%s}"
	end
	return in_lang, lang_list, script_name_list
	end

	c_lang_switch       = "en"
	c_lang,
	c_lang_list,
	c_script_name_list  = lang_switch_keys(c_lang_switch)

	script_name         = c_lang.s_name
	script_description  = c_lang.s_desc
	script_version      = "1"
	script_author       = "Magnum357"
	script_mag_version  = "1.1.4.6"
	script_file_name    = "mag.line_statistics"
	script_file_ext     = ".lua"

	include_unicode     = true
	mag_import, mag     = pcall(require, "mag")

	if mag_import then
	mag.lang            = c_lang_switch

	c_lock_gui          = false
	c_buttons1          = {c_lang.buttonKey1, c_lang.buttonKey2}

	c                   = {}
	c.comment_mode      = true
	c.empty_mode        = true
	c.apply1            = mag.window.lang.message("select")
	c.generated_lines   = true
	c.template_lines    = true
	c.karaoke_lines     = true
	c.comment_lines     = true
	c.empty_lines       = true
	c.actor_lines       = false
	c.effect_lines      = false
	c.find_others_lines = true
	c.show_total_result = true
	c.group_by_style    = false

	gui                 = {
		main1             = {
		generated_lines   = {class = "checkbox", name = "u_generated_lines",   x = 0, y = 0,  width = 2, height = 1, label = c_lang.guiLabelKey1},
		template_lines    = {class = "checkbox", name = "u_template_lines",    x = 0, y = 1,  width = 2, height = 1, label = c_lang.guiLabelKey2},
		karaoke_lines     = {class = "checkbox", name = "u_karaoke_lines",     x = 0, y = 2,  width = 2, height = 1, label = c_lang.guiLabelKey3},
		comment_lines     = {class = "checkbox", name = "u_comment_lines",     x = 0, y = 3,  width = 2, height = 1, label = c_lang.guiLabelKey4},
		empty_lines       = {class = "checkbox", name = "u_empty_lines",       x = 0, y = 4,  width = 2, height = 1, label = c_lang.guiLabelKey5},
		actor_lines       = {class = "checkbox", name = "u_actor_lines",       x = 0, y = 5,  width = 2, height = 1, label = c_lang.guiLabelKey9},
		effect_lines      = {class = "checkbox", name = "u_effect_lines",      x = 0, y = 6,  width = 2, height = 1, label = c_lang.guiLabelKey10},
		                    {class = "label",                                  x = 0, y = 7,  width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply             = {class = "dropdown", name = "u_apply_lines",       x = 1, y = 7,  width = 1, height = 1, hint = mag.window.lang.message("style_hint2")},
		group_by_style    = {class = "checkbox", name = "u_group_by_style",    x = 0, y = 8,  width = 2, height = 1, label = c_lang.guiLabelKey8},
		find_others_lines = {class = "checkbox", name = "u_find_others_lines", x = 0, y = 9,  width = 2, height = 1, label = c_lang.guiLabelKey6},
		show_total_result = {class = "checkbox", name = "u_show_total_result", x = 0, y = 10, width = 2, height = 1, label = c_lang.guiLabelKey7},
		}
	}
	end

	function karaoke_statistics(subs,sel)
	local line, index
	local pcs          = false
	local first_index  = mag.index.first(subs) - 1
	local lines_index  = mag.line.index(subs, sel, c.apply1, false, false)
	local counter      = {}
	local kdur_pattern = {"{%s-\\%s-k%s-(%d+)%s-}", "{%s-\\%s-kf%s-(%d+)%s-}", "{%s-\\%s-ko%s-(%d+)%s-}", "{%s-\\%s-K%s-(%d+)%s-}"}
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	index      = lines_index[i]
	line       = subs[index]
	local ldur = 0
		if not c.group_by_style and counter[line.style] == nil then
		counter[line.style] = {}
		counter[line.style]["generated"]       = 0
		counter[line.style]["template"]        = 0
		counter[line.style]["karaoke"]         = 0
		counter[line.style]["comment"]         = 0
		counter[line.style]["empty"]           = 0
		counter[line.style]["actor"]           = 0
		counter[line.style]["effect"]          = 0
		counter[line.style]["others"]          = {}
		counter[line.style]["others"]["line"]  = 0
		counter[line.style]["others"]["index"] = {}
		elseif c.group_by_style and counter["generated"] == nil then
		counter["generated"]       = 0
		counter["template"]        = 0
		counter["karaoke"]         = 0
		counter["comment"]         = 0
		counter["empty"]           = 0
		counter["actor"]           = 0
		counter["effect"]          = 0
		counter["others"]          = {}
		counter["others"]["line"]  = 0
		counter["others"]["index"] = {}
		end
		if c.generated_lines and mag.is.line.generated(line)   then
		if not pcs then pcs = true end
			if c.group_by_style then
			counter["generated"]                  = counter["generated"]                  + 1
			else
			counter[line.style]["generated"]      = counter[line.style]["generated"]      + 1
			end
		elseif c.template_lines and mag.is.line.template(line) or c.template_lines and mag.is.line.code(line) then
		if not pcs then pcs = true end
			if c.group_by_style then
			counter["template"]                   = counter["template"]                   + 1
			else
			counter[line.style]["template"]       = counter[line.style]["template"]       + 1
			end
		elseif c.karaoke_lines and mag.is.line.karaoke(line)   then
		if not pcs then pcs = true end
			if c.group_by_style then
			counter["karaoke"]                    = counter["karaoke"]                    + 1
			else
			counter[line.style]["karaoke"]        = counter[line.style]["karaoke"]        + 1
			end
		elseif c.comment_lines and mag.is.line.comment(line)   then
		if not pcs then pcs = true end
			if c.group_by_style then
			counter["comment"]                    = counter["comment"]                    + 1
			else
			counter[line.style]["comment"]        = counter[line.style]["comment"]        + 1
			end
		elseif c.empty_lines and mag.is.line.empty(line)       then
		if not pcs then pcs = true end
			if c.group_by_style then
			counter["empty"]                      = counter["empty"]                      + 1
			else
			counter[line.style]["empty"]          = counter[line.style]["empty"]          + 1
			end
		elseif c.actor_lines and mag.is.line.actor(line)       then
		if not pcs then pcs = true end
			if c.group_by_style then
			counter["actor"]                      = counter["actor"]                      + 1
			else
			counter[line.style]["actor"]          = counter[line.style]["actor"]          + 1
			end
		elseif c.effect_lines and mag.is.line.effect(line)     then
		if not pcs then pcs = true end
			if c.group_by_style then
			counter["effect"]                     = counter["effect"]                     + 1
			else
			counter[line.style]["effect"]         = counter[line.style]["effect"]         + 1
			end
		elseif c.find_others_lines                             then
		if not pcs then pcs = true end
			if c.group_by_style then
			counter["others"]["line"]             = counter["others"]["line"]             + 1
			mag.array.insert(counter["others"]["index"], index)
			else
			counter[line.style]["others"]["line"] = counter[line.style]["others"]["line"] + 1
			mag.array.insert(counter[line.style]["others"]["index"], index)
			end
		end
	end
	if pcs then
	local total_lines    = {}
	local others_lines   = ""
	local output_message = ""
		if c.group_by_style then
		others_lines       = ""
		total_lines["all"] = 0
			if c.generated_lines then
				if c.show_total_result then
				total_lines["all"] = total_lines["all"] + counter["generated"]
				end
			output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey5, mag.string.format(c_lang.reportKey12, counter["generated"])), "{%1}\n{%2}")
			end
			if c.template_lines then
				if c.show_total_result then
				total_lines["all"] = total_lines["all"] + counter["template"]
				end
			output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey6, mag.string.format(c_lang.reportKey12, counter["template"])), "{%1}\n{%2}")
			end
			if c.karaoke_lines then
				if c.show_total_result then
				total_lines["all"] = total_lines["all"] + counter["karaoke"]
				end
			output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey7, mag.string.format(c_lang.reportKey12, counter["karaoke"])), "{%1}\n{%2}")
			end
			if c.comment_lines then
				if c.show_total_result then
				total_lines["all"] = total_lines["all"] + counter["comment"]
				end
			output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey8, mag.string.format(c_lang.reportKey12, counter["comment"])), "{%1}\n{%2}")
			end
			if c.actor_lines then
				if c.show_total_result then
				total_lines["all"] = total_lines["all"] + counter["actor"]
				end
			output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey14, mag.string.format(c_lang.reportKey12, counter["actor"])), "{%1}\n{%2}")
			end
			if c.effect_lines then
				if c.show_total_result then
				total_lines["all"] = total_lines["all"] + counter["effect"]
				end
			output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey15, mag.string.format(c_lang.reportKey12, counter["effect"])), "{%1}\n{%2}")
			end
			if c.empty_lines then
				if c.show_total_result then
				total_lines["all"] = total_lines["all"] + counter["empty"]
				end
			output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey9, mag.string.format(c_lang.reportKey12, counter["empty"])), "{%1}\n{%2}")
			end
			if c.find_others_lines or c.show_total_result then
			output_message = mag.string.combine(output_message, "", "{%1}\n{%2}")
			end
			if c.find_others_lines then
				if c.show_total_result then
				total_lines["all"] = total_lines["all"] + counter["others"]["line"]
				end
			others_lines = mag.convert.number_collector(counter["others"]["index"], true, first_index + 1)
				if others_lines == "" then
				others_lines = c_lang.reportKey2
				end
			output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey10, mag.string.format(c_lang.reportKey13, counter["others"]["line"], others_lines)), "{%1}\n{%2}")
			end
			if c.show_total_result then
			output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey11, mag.string.format(c_lang.reportKey12, total_lines["all"])), "{%1}\n{%2}")
			end
		mag.show.log(output_message)
		else
			for style in pairs(counter) do
			others_lines       = ""
			total_lines[style] = 0
			output_message     = ""
			output_message     = output_message..mag.string.format(c_lang.reportKey1, style)
				if c.generated_lines then
					if c.show_total_result then
					total_lines[style] = total_lines[style] + counter[style]["generated"]
					end
				output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey5, mag.string.format(c_lang.reportKey12, counter[style]["generated"])), "{%1}\n{%2}")
				end
				if c.template_lines then
					if c.show_total_result then
					total_lines[style] = total_lines[style] + counter[style]["template"]
					end
				output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey6, mag.string.format(c_lang.reportKey12, counter[style]["template"])), "{%1}\n{%2}")
				end
				if c.karaoke_lines then
					if c.show_total_result then
					total_lines[style] = total_lines[style] + counter[style]["karaoke"]
					end
				output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey7, mag.string.format(c_lang.reportKey12, counter[style]["karaoke"])), "{%1}\n{%2}")
				end
				if c.comment_lines then
					if c.show_total_result then
					total_lines[style] = total_lines[style] + counter[style]["comment"]
					end
				output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey8, mag.string.format(c_lang.reportKey12, counter[style]["comment"])), "{%1}\n{%2}")
				end
				if c.actor_lines then
					if c.show_total_result then
					total_lines[style] = total_lines[style] + counter[style]["actor"]
					end
				output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey14, mag.string.format(c_lang.reportKey12, counter[style]["actor"])), "{%1}\n{%2}")
				end
				if c.effect_lines then
					if c.show_total_result then
					total_lines[style] = total_lines[style] + counter[style]["effect"]
					end
				output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey15, mag.string.format(c_lang.reportKey12, counter[style]["effect"])), "{%1}\n{%2}")
				end
				if c.empty_lines then
					if c.show_total_result then
					total_lines[style] = total_lines[style] + counter[style]["empty"]
					end
				output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey9, mag.string.format(c_lang.reportKey12, counter[style]["empty"])), "{%1}\n{%2}")
				end
				if c.find_others_lines or c.show_total_result then
				output_message = mag.string.combine(output_message, "", "{%1}\n{%2}")
				end
				if c.find_others_lines then
					if c.show_total_result then
					total_lines[style] = total_lines[style] + counter[style]["others"]["line"]
					end
				others_lines = mag.convert.number_collector(counter[style]["others"]["index"], true, first_index + 1)
					if others_lines == "" then
					others_lines = c_lang.reportKey2
					end
				output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey10, mag.string.format(c_lang.reportKey13, counter[style]["others"]["line"], others_lines)), "{%1}\n{%2}")
				end
				if c.show_total_result then
				output_message = mag.string.combine(output_message, mag.string.format(c_lang.reportKey16, c_lang.reportKey11, mag.string.format(c_lang.reportKey12, total_lines[style])), "{%1}\n{%2}")
				end
			mag.show.log(output_message)
			end
		end
	end
	mag.show.no_op(pcs)
	end

	function add_macro1(subs,sel)
	local apply_items     = mag.list.full_apply(subs, sel, "default")
	c.apply1              = mag.array.search_apply(apply_items, c.apply1)
	gui.main1.apply.items = apply_items
	local ok, config
	repeat
	gui.main1.generated_lines.value   = c.generated_lines
	gui.main1.template_lines.value    = c.template_lines
	gui.main1.karaoke_lines.value     = c.karaoke_lines
	gui.main1.comment_lines.value     = c.comment_lines
	gui.main1.empty_lines.value       = c.empty_lines
	gui.main1.actor_lines.value       = c.actor_lines
	gui.main1.effect_lines.value      = c.effect_lines
	gui.main1.apply.value             = c.apply1
	gui.main1.find_others_lines.value = c.find_others_lines
	gui.main1.show_total_result.value = c.show_total_result
	gui.main1.group_by_style.value    = c.group_by_style
	ok, config                        = mag.window.dialog(gui.main1, c_buttons1)
	c.apply1                          = config.u_apply_lines
	c.generated_lines                 = config.u_generated_lines
	c.template_lines                  = config.u_template_lines
	c.karaoke_lines                   = config.u_karaoke_lines
	c.comment_lines                   = config.u_comment_lines
	c.empty_lines                     = config.u_empty_lines
	c.actor_lines                     = config.u_actor_lines
	c.effect_lines                    = config.u_effect_lines
	c.find_others_lines               = config.u_find_others_lines
	c.show_total_result               = config.u_show_total_result
	c.group_by_style                  = config.u_group_by_style
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply1 ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	karaoke_statistics(subs, sel)
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
	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Seç",    sub_menu = "Satır/Seç"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Select Lines", sub_menu = "Lines/Select"}
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
	in_lang["s_desc"]              = "Her türlü yolla satırları seçer."
	in_lang["tabKey1"]             = "Aktif Satır"
	in_lang["tabKey2"]             = "Aktif Satır Stili"
	in_lang["tabKey3"]             = "Satır"
	in_lang["tabKey4"]             = "Süre"
	in_lang["tabKey5"]             = "Seçim"
	in_lang["tabKey6"]             = "Öncesi"
	in_lang["tabKey7"]             = "Sonrası"
	in_lang["tabKey8"]             = "Önceki"
	in_lang["tabKey9"]             = "Sonraki"
	in_lang["tabKey10"]            = "Öncesi"
	in_lang["tabKey11"]            = "Sonrası"
	in_lang["tabKey12"]            = "İlk"
	in_lang["tabKey13"]            = "Son"
	in_lang["tabKey14"]            = "Kalıp"
	in_lang["tabKey15"]            = "Tüm"
	in_lang["tabKey16"]            = "İlk"
	in_lang["tabKey17"]            = "Son"
	in_lang["tabKey18"]            = "Aralık"
	in_lang["tabKey19"]            = "Atlama"
	in_lang["tabKey20"]            = "Aralık"
	in_lang["tabKey21"]            = "Atlama"
	in_lang["tabKey22"]            = "Tek Haneli Satırlar"
	in_lang["tabKey23"]            = "Çift Haneli Satırlar"
	in_lang["tabKey24"]            = "Seçilmemiş Satırlar"
	in_lang["tabKey25"]            = "Yorum olmayan"
	in_lang["tabKey26"]            = "Yorum"
	in_lang["tabKey27"]            = "Boş"
	in_lang["tabKey28"]            = "Satır Tipi"
	in_lang["guiLabelKey1"]        = "Başlangıç noktası:"
	in_lang["guiLabelKey2"]        = "Bitiş noktası:"
	in_lang["guiLabelKey3"]        = "Satır numarası:"
	in_lang["guiLabelKey4"]        = "Başlangıç noktası ({%s}):"
	in_lang["guiLabelKey5"]        = "Bitiş noktası ({%s}):"
	in_lang["guiLabelKey6"]        = "Gidilecek {%s}:"
	in_lang["buttonKey1"]          = "Seç"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["buttonKey3"]          = "Git"
	in_lang["buttonKey4"]          = "Vazgeç"
	in_lang["buttonKey5"]          = "Zaman Kipi"
	in_lang["buttonKey6"]          = "Kare Kipi"
	in_lang["key1"]                = "zaman"
	in_lang["key2"]                = "kare"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Selects lines in any way."
	in_lang["tabKey1"]             = "Active Line"
	in_lang["tabKey2"]             = "Active Line Style"
	in_lang["tabKey3"]             = "Line"
	in_lang["tabKey4"]             = "Duration"
	in_lang["tabKey5"]             = "Selection"
	in_lang["tabKey6"]             = "Before"
	in_lang["tabKey7"]             = "After"
	in_lang["tabKey8"]             = "Previous"
	in_lang["tabKey9"]             = "Next"
	in_lang["tabKey10"]            = "Before"
	in_lang["tabKey11"]            = "After"
	in_lang["tabKey12"]            = "First"
	in_lang["tabKey13"]            = "Last"
	in_lang["tabKey14"]            = "Block"
	in_lang["tabKey15"]            = "All"
	in_lang["tabKey16"]            = "First"
	in_lang["tabKey17"]            = "Last"
	in_lang["tabKey18"]            = "Interval"
	in_lang["tabKey19"]            = "Jumping"
	in_lang["tabKey20"]            = "Interval"
	in_lang["tabKey21"]            = "Jumping"
	in_lang["tabKey22"]            = "Odd numbered lines"
	in_lang["tabKey23"]            = "Even numbered lines"
	in_lang["tabKey24"]            = "Reverse"
	in_lang["tabKey25"]            = "Uncomment"
	in_lang["tabKey26"]            = "Comment"
	in_lang["tabKey27"]            = "Empty"
	in_lang["tabKey28"]            = "Line Type"
	in_lang["guiLabelKey1"]        = "Starting point:"
	in_lang["guiLabelKey2"]        = "Ending point:"
	in_lang["guiLabelKey3"]        = "Line number:"
	in_lang["guiLabelKey4"]        = "Starting point ({%s}):"
	in_lang["guiLabelKey5"]        = "Ending point ({%s}):"
	in_lang["guiLabelKey6"]        = "Go to {%s}:"
	in_lang["buttonKey1"]          = "Select"
	in_lang["buttonKey2"]          = "Close"
	in_lang["buttonKey3"]          = "Go"
	in_lang["buttonKey4"]          = "Cancel"
	in_lang["buttonKey5"]          = "Time Mode"
	in_lang["buttonKey6"]          = "Frame Mode"
	in_lang["key1"]                = "time"
	in_lang["key2"]                = "frame"
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
	script_version     = "1.6.1"
	script_author      = "Magnum357"
	script_mag_version = "1.1.4.4"
	script_file_name   = "mag.select_lines"
	script_file_ext    = ".lua"

	include_unicode    = true
	mag_import, mag    = pcall(require, "mag")

	if mag_import then
	mag.lang           = c_lang_switch

	c_lock_gui         = false
	c_tf_modList       = {c_lang.key1, c_lang.key2}
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey2}
	c_buttons2         = {c_lang.buttonKey3, c_lang.buttonKey4}
	c_buttons3         = {c_lang.buttonKey1, c_lang.buttonKey5, c_lang.buttonKey6, c_lang.buttonKey2}

	c                  = {}
	c.sstart           = 0
	c.send             = 0
	c.linej            = 0
	c.tft_modSelect    = c_tf_modList[1]
	c.tft_fstart       = 0
	c.tft_fend         = 0
	c.tft_tstart       = "0:00:00.00"
	c.tft_tend         = "0:00:00.00"
	c.ltj_modSelect    = c_tf_modList[1]
	c.ltj_time         = "0:00:00.00"
	c.ltj_frame        = 0

	gui = {
		main1     = {
		            {class = "label",                                   x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey1},
		sstart    = {class = "intedit",  name = "u_sstart",    min = 1, x = 1, y = 0, width = 1, height = 1},
		            {class = "label",                                   x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey2},
		send      = {class = "intedit",  name = "u_send",      min = 1, x = 1, y = 1, width = 1, height = 1},
		},
		main2     = {
		            {class = "label",                                   x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey3},
		linej     = {class = "intedit",  name = "u_linej",     min = 1, x = 1, y = 0, width = 1, height = 1},
		},
		main3     = {
		            {class = "label",                                   x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey1},
		tstart    = {class = "intedit",  name = "u_tstart",             x = 1, y = 0, width = 1, height = 1},
		            {class = "label",                                   x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey2},
		tend      = {class = "intedit",  name = "u_tend",               x = 1, y = 1, width = 1, height = 1},
		},
		main4     = {
		label1    = {class = "label",                                   x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey4},
		tft_start = {class = "edit",     name = "u_tft_start", min = 1, x = 1, y = 0, width = 1, height = 1},
		label2    = {class = "label",                                   x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey5},
		tft_end   = {class = "edit",     name = "u_tft_end",   min = 1, x = 1, y = 1, width = 1, height = 1},
		},
		main5     = {
		label1    = {class = "label",                                   x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey4},
		tft_start = {class = "intedit",  name = "u_tft_start", min = 1, x = 1, y = 0, width = 1, height = 1},
		label2    = {class = "label",                                   x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey5},
		tft_end   = {class = "intedit",  name = "u_tft_end",   min = 1, x = 1, y = 1, width = 1, height = 1},
		},
		main6     = {
		label     = {class = "label",                                   x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey6},
		ltj_value = {class = "edit",     name = "u_ltj_value", min = 1, x = 1, y = 0, width = 1, height = 1},
		},
		main7     = {
		label     = {class = "label",                                   x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey6},
		ltj_value = {class = "intedit",  name = "u_ltj_value", min = 1, x = 1, y = 0, width = 1, height = 1},
		},
	}
	end

	function act_before(subs,sel,act)
	local index = {}
	for i = 1, act do if subs[i].class == "dialogue" then mag.array.insert(index, i) end end
	return index
	end

	function act_after(subs,sel,act)
	local index = {}
	for i = act, #subs do mag.array.insert(index, i) end
	return index
	end

	function prev_act(subs,sel,act) if subs[act - 1].class == "dialogue" then return {act - 1} end end

	function next_act(subs,sel,act) if act < #subs then return {act + 1} end end

	function act_style_before(subs,sel,act)
	local index = {}
	for i = 1, act do if subs[i].class == "dialogue" and subs[i].style == subs[act].style then mag.array.insert(index, i) end end
	return index
	end

	function act_style_after(subs,sel,act)
	local index = {}
	for i = act, #subs do if subs[i].style == subs[act].style then mag.array.insert(index, i) end end
	return index
	end

	function first_style_line(subs,sel,act)
	local index
	for i = 1, #subs do
		if subs[i].class == "dialogue"  and subs[i].style == subs[act].style then
		index = i
		break
		end
	end
	return {index}
	end

	function last_style_line(subs,sel,act)
	local index
	for i = #subs, 1, -1 do
		if subs[i].style == subs[act].style then
		index = i
		break
		end
	end
	return {index}
	end

	function style_block(subs,sel,act)
	local index = {}
	local line
	for i = act, #subs do
	line = subs[i]
		if line.style ~= subs[act].style then
		break
		end
	mag.array.insert(index, i)
	end
	for i = act - 1, 1, - 1 do
	line = subs[i]
		if line.class == "dialogue" then
			if line.style ~= subs[act].style then
			break
			end
		mag.array.insert(index, i)
		end
	end
	mag.sort.basic(index)
	return index
	end

	function style_all_lines(subs,sel,act)
	local idx, index = 0, {}
	for i = 1, #subs do
		if subs[i].class == "dialogue" and subs[i].style == subs[act].style then
		idx = idx + 1
		index[idx] = i
		end
	end
	return index
	end

	function first_line(subs)
	local index
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
		index = i
		break
		end
	end
	return {index}
	end

	function last_line(subs)
	local index
	for i = #subs, 1, -1 do
	index = i
	break
	end
	return {index}
	end

	function line_from_to(subs)
	local total_line       = mag.index.total(subs)
	gui.main1.sstart.max   = total_line
	gui.main1.send.max     = total_line
	gui.main1.sstart.value = c.sstart
	gui.main1.send.value   = c.send
	local ok, config       = mag.window.dialog(gui.main1, c_buttons1)
	c.sstart               = config.u_sstart
	c.send                 = config.u_send
	if ok == mag.convert.ascii(c_buttons1[1]) then
	local first_index      = mag.index.first(subs) - 1
	local index            = {}
	local s                = c.sstart + first_index
	local e                = c.send + first_index
		if s > e then
		temp = s
		s    = e
		e    = temp
		end
		for i = 1, #subs do
			if subs[i].class == "dialogue" and i >= s and i <= e then
			mag.array.insert(index, i)
			end
		end
	return index
	end
	end

	function line_numb_jumping(subs)
	local total_line      = mag.index.total(subs)
	gui.main2.linej.max   = total_line
	gui.main2.linej.value = c.linej
	local ok, config      = mag.window.dialog(gui.main2, c_buttons2)
	c.linej               = config.u_linej
	if ok == mag.convert.ascii(c_buttons2[1]) then
	local first_index = mag.index.first(subs) - 1
	local index
	k = c.linej + first_index
	for i = 1, #subs do
		if subs[i].class == "dialogue" and i == k then
		index = i
		break
		end
	end
	return {index}
	end
	end

	function time_from_to(subs,sel,act)
	if not mag.is.video() then
	mag.show.log(1, mag.window.lang.message("is_video"))
	else
	local ok, config, buttons, my_gui
		repeat
			if c.tft_modSelect == c_tf_modList[1] then
			my_gui                 = gui.main4
			buttons                = {c_buttons3[1], c_buttons3[3], c_buttons3[4]}
			elseif c.tft_modSelect == c_tf_modList[2] then
			my_gui                 = gui.main5
			buttons                = {c_buttons3[1], c_buttons3[2], c_buttons3[4]}
			end
			if c.tft_modSelect == c_tf_modList[1] then
			my_gui.tft_start.value = c.tft_tstart
			my_gui.tft_end.value   = c.tft_tend
			elseif c.tft_modSelect == c_tf_modList[2] then
			my_gui.tft_start.value = c.tft_fstart
			my_gui.tft_end.value   = c.tft_fend
			end
		my_gui.label1.label        = mag.string.format(c_lang.guiLabelKey4, c.tft_modSelect)
		my_gui.label2.label        = mag.string.format(c_lang.guiLabelKey5, c.tft_modSelect)
		ok, config                 = mag.window.dialog(my_gui, buttons)
			if c.tft_modSelect == c_tf_modList[1] then
			c.tft_tstart = mag.convert.time_from_ms(mag.convert.ms_from_time(config.u_tft_start))
			c.tft_tend   = mag.convert.time_from_ms(mag.convert.ms_from_time(config.u_tft_end))
			elseif c.tft_modSelect == c_tf_modList[2] then
			c.tft_fstart = config.u_tft_start
			c.tft_fend   = config.u_tft_end
			end
			if ok == mag.convert.ascii(c_buttons3[2]) then
			c.tft_modSelect = c_tf_modList[1]
			elseif ok == mag.convert.ascii(c_buttons3[3]) then
			c.tft_modSelect = c_tf_modList[2]
			end
		until ok == mag.convert.ascii(c_buttons3[1]) or ok == mag.convert.ascii(c_buttons3[4])
		if ok == mag.convert.ascii(c_buttons3[1]) then
		local start_time
		local end_time
			if c.tft_modSelect == c_tf_modList[1] then
			start_time = mag.convert.ms_from_time(c.tft_tstart)
			end_time   = mag.convert.ms_from_time(c.tft_tend)
			elseif c.tft_modSelect == c_tf_modList[2] then
			start_time = mag.convert.ms_from_frame(c.tft_fstart)
			end_time   = mag.convert.ms_from_frame(c.tft_fend)
			end
		local line, index
		local lines_index  = {}
		local select_index = {}
		local pcs          = false
			for i = 1, #subs do
			index = i
			line  = subs[index]
				if line.class == "dialogue" then
				mag.array.insert(lines_index, index)
				end
			end
			if lines_index[1] ~= nil then
			lines_index = mag.sort.index(subs, lines_index)
				if start_time > end_time then
				local temp = start_time
				start_time = end_time
				end_time   = temp
				end
				for i = 1, #lines_index do
				index = lines_index[i]
				line  = subs[index]
					if line.start_time >= start_time and line.start_time <= end_time then
					if not pcs then pcs = true end
					mag.array.insert(select_index, index)
					elseif pcs then
					break
					end
				end
			end
		mag.show.no_op(pcs)
			if select_index[1] ~= nil then
			return select_index
			end
		end
	end
	end

	function line_time_jumping(subs,sel,act)
	if not mag.is.video() then
	mag.show.log(1, mag.window.lang.message("is_video"))
	else
	local ok, config, buttons, my_gui
		repeat
			if c.ltj_modSelect == c_tf_modList[1] then
			my_gui                 = gui.main6
			buttons                = {c_buttons3[1], c_buttons3[3], c_buttons3[4]}
			my_gui.ltj_value.value = c.ltj_time
			elseif c.ltj_modSelect == c_tf_modList[2] then
			my_gui                 = gui.main7
			buttons                = {c_buttons3[1], c_buttons3[2], c_buttons3[4]}
			my_gui.ltj_value.value = c.ltj_frame
			end
		my_gui.label.label         = mag.string.format(c_lang.guiLabelKey6, c.ltj_modSelect)
		ok, config                 = mag.window.dialog(my_gui, buttons)
			if c.ltj_modSelect == c_tf_modList[1] then
			c.ltj_time             = mag.convert.time_from_ms(mag.convert.ms_from_time(config.u_ltj_value))
			elseif c.ltj_modSelect == c_tf_modList[2] then
			c.ltj_frame            = config.u_ltj_value
			end
			if ok == mag.convert.ascii(c_buttons3[2]) then
			c.ltj_modSelect        = c_tf_modList[1]
			elseif ok == mag.convert.ascii(c_buttons3[3]) then
			c.ltj_modSelect        = c_tf_modList[2]
			end
		until ok == mag.convert.ascii(c_buttons3[1]) or ok == mag.convert.ascii(c_buttons3[4])
		if ok == mag.convert.ascii(c_buttons3[1]) then
		local select_time
			if c.ltj_modSelect == c_tf_modList[1] then
			select_time = mag.convert.ms_from_time(c.ltj_time)
			elseif c.ltj_modSelect == c_tf_modList[2] then
			select_time = mag.convert.ms_from_frame(c.ltj_frame)
			end
		local line, index
		local select_index
		local lines_index = {}
		local pcs         = false
		local idx         = {}
			for i = 1, #subs do
			index = i 
			line  = subs[index]
			if line.class == "dialogue" then mag.array.insert(lines_index, index) end
			end
			if lines_index[1] ~= nil then
			lines_index = mag.sort.index(subs, lines_index)
				for k in pairs(lines_index) do
				index = lines_index[k]
				line  = subs[index]
					if line.start_time >= select_time then
					if not pcs then pcs = true end
					select_index = index
					break
					end
				end
			end
		mag.show.no_op(pcs)
			if select_index ~= nil then
			return {select_index}
			end
		end
	end
	end

	function not_selection(subs,sel)
	local selected_lines = mag.index.sel(subs, sel)
	local k              = 1
	local index          = {}
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
			if selected_lines[k] ~= i then
			mag.array.insert(index, i)
			else
			k = k + 1
			end
		end
	end
	return index
	end

	function one_lines(subs)
	local index = {}
	local count = 0
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
		count = count + 1
			if count % 2 == 1 then
			mag.array.insert(index, i)
			end
		end
	end
	return index
	end

	function two_lines(subs)
	local index = {}
	local count = 0
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
		count = count + 1
			if count % 2 == 0 then
			mag.array.insert(index, i)
			end
		end
	end
	return index
	end

	function uncomment_lines(subs)
	local index = {}
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
			if mag.is.line.comment(subs[i]) == false then
				mag.array.insert(index, i)
			end
		end
	end
	return index
	end

	function comment_lines(subs)
	local index = {}
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
			if mag.is.line.comment(subs[i]) == true then
				mag.array.insert(index, i)
			end
		end
	end
	return index
	end

	function empty_lines(subs)
	local index = {}
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
			if mag.is.line.empty(subs[i]) == true then
				mag.array.insert(index, i)
			end
		end
	end
	return index
	end

	function check_macro1(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(act_before, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro2(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(act_after, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro3(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(prev_act, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro4(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(next_act, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro5(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(act_style_before, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro6(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(act_style_after, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro7(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(first_style_line, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro8(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(last_style_line, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro9(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(style_block, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro10(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(style_all_lines, subs, sel, act)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro11(subs)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(first_line, subs)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro12(subs)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(last_line, subs)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro13(subs)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(line_from_to, subs, subs)
	mag.window.funce(fe, fee)
	mag.config.set(c)
	return fee
	end
	end

	function check_macro14(subs)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(line_numb_jumping, subs)
	mag.window.funce(fe, fee)
	mag.config.set(c)
	return fee
	end
	end

	function check_macro15(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(time_from_to, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.config.set(c)
	return fee
	end
	end

	function check_macro16(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(line_time_jumping, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.config.set(c)
	return fee
	end
	end

	function check_macro17(subs)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(one_lines, subs)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro18(subs)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(two_lines, subs)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro19(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(not_selection, subs, sel)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro20(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(uncomment_lines, subs, sel)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro21(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(comment_lines, subs, sel)
	mag.window.funce(fe, fee)
	return fee
	end
	end

	function check_macro22(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(empty_lines, subs, sel)
	mag.window.funce(fe, fee)
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
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1.."/"..c_lang.tabKey6,  check_macro1)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1.."/"..c_lang.tabKey7,  check_macro2)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1.."/"..c_lang.tabKey8,  check_macro3)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey1.."/"..c_lang.tabKey9,  check_macro4)

		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey2.."/"..c_lang.tabKey10, check_macro5)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey2.."/"..c_lang.tabKey11, check_macro6)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey2.."/"..c_lang.tabKey12, check_macro7)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey2.."/"..c_lang.tabKey13, check_macro8)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey2.."/"..c_lang.tabKey14, check_macro9)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey2.."/"..c_lang.tabKey15, check_macro10)

		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey3.."/"..c_lang.tabKey16, check_macro11)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey3.."/"..c_lang.tabKey17, check_macro12)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey3.."/"..c_lang.tabKey18, check_macro13)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey3.."/"..c_lang.tabKey19, check_macro14)

		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey28.."/"..c_lang.tabKey25, check_macro20)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey28.."/"..c_lang.tabKey26, check_macro21)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey28.."/"..c_lang.tabKey27, check_macro22)

		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey4.."/"..c_lang.tabKey20, check_macro15)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey4.."/"..c_lang.tabKey21, check_macro16)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey5.."/"..c_lang.tabKey22, check_macro17)

		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey5.."/"..c_lang.tabKey23, check_macro18)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey5.."/"..c_lang.tabKey24, check_macro19)
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
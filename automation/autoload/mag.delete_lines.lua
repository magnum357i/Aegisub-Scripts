	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Sil",    sub_menu = "Satır/Sil"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Delete Lines", sub_menu = "Lines/Delete"}
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
	in_lang["s_desc"]              = "Stile, oyuncuya veya efeğe göre satırları siler."
	in_lang["tabKey1"]             = "Stil"
	in_lang["tabKey2"]             = "Oyuncu"
	in_lang["tabKey3"]             = "Efekt"
	in_lang["buttonKey1"]          = "Sil"
	in_lang["buttonKey2"]          = "Satır Ekle"
	in_lang["buttonKey3"]          = "Satır Sil"
	in_lang["buttonKey4"]          = "Kapat"
	in_lang["guiLabel1"]           = "Stil:"
	in_lang["guiLabel2"]           = "Stil bilgisini de sil."
	in_lang["guiLabel3"]           = "Oyuncu:"
	in_lang["guiLabel4"]           = "Efekt:"
	in_lang["guiHint1"]            = "Bu kutuyu seçerek \"{%s}\" butonuna basarsanız arayüzdeki o satır silenecektir."
	in_lang["key1"]                = "Satır oluşturmak için kalan hakkınız: {%s}"
	in_lang["key2"]                = "Stil Yöneticisi'nde listelenen stillerden hiçbirini seçmemişsiniz."
	in_lang["key3"]                = "Hiçbir satırın oyuncu kutucuğu dolu değil."
	in_lang["key4"]                = "Hiçbir satırın efekt kutucuğu dolu değil."
	in_lang["logKey1"]             = "[Stil: \"{%s}\"]\nSilinen satır: {%s}\nStil bilgisi: {%s}"
	in_lang["logKey2"]             = "Toplam silinen satır: {%s}\n\nSilinen stil bilgilerinin listesi:\n{%s}\n\nSilinmeyen stil bilgilerinin listesi:\n{%s}"
	in_lang["logKey3"]             = "Aynı stil adı birçok kere kullanıldı:\n{%s}"
	in_lang["logKey4"]             = "Aynı oyuncu adı birçok kere kullanıldı:\n{%s}"
	in_lang["logKey5"]             = "[Oyuncu: \"{%s}\"]\nSilinen satır: {%s}"
	in_lang["logKey6"]             = "Toplam silinen satır: {%s}"
	in_lang["logKey7"]             = "Aynı efekt adı birçok kere kullanıldı:\n{%s}"
	in_lang["logKey8"]             = "[Efekt: \"{%s}\"]\nSilinen satır: {%s}"
	in_lang["logTrue"]             = "silindi"
	in_lang["logFalse"]            = "silinmedi"
	in_lang["logNone"]             = "hiçbiri"
	in_lang["doubleItemFormat"]    = "{%s} (x{%s})"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Deletes lines by style, actor or effect."
	in_lang["tabKey1"]             = "Style"
	in_lang["tabKey2"]             = "Actor"
	in_lang["tabKey3"]             = "Effect"
	in_lang["buttonKey1"]          = "Delete"
	in_lang["buttonKey2"]          = "New Row"
	in_lang["buttonKey3"]          = "Delete Row"
	in_lang["buttonKey4"]          = "Close"
	in_lang["guiLabel1"]           = "Style:"
	in_lang["guiLabel2"]           = "Also delete style info"
	in_lang["guiLabel3"]           = "Actor:"
	in_lang["guiLabel4"]           = "Effect:"
	in_lang["guiHint1"]            = "If you click on the \"{%s}\" button by choosing this box, the line in the interface will be deleted."
	in_lang["key1"]                = "Remaining rights to create a row: {%s}"
	in_lang["key2"]                = "You have not selected any styles of styles manager in the lines."
	in_lang["key3"]                = "Actor boxes are empty."
	in_lang["key4"]                = "Effect boxes are empty."
	in_lang["logKey1"]             = "[Style: \"{%s}\"]\nDeleted lines: {%s}\nStyle info: {%s}"
	in_lang["logKey2"]             = "Total deleted lines: {%s}\n\nList of deleted style info:\n{%s}\n\nList of undeleted style info:\n{%s}"
	in_lang["logKey3"]             = "Same style name was used more than once:\n{%s}"
	in_lang["logKey4"]             = "Same actor name was used more than once:\n{%s}"
	in_lang["logKey5"]             = "[Actor: \"{%s}\"]\nDeleted lines: {%s}"
	in_lang["logKey6"]             = "Total deleted lines: {%s}"
	in_lang["logKey7"]             = "Same effect name was used more than once:\n{%1}"
	in_lang["logKey8"]             = "[Effect: \"{%s}\"]\nDeleted lines: {%s}"
	in_lang["logTrue"]             = "deleted"
	in_lang["logFalse"]            = "not deleted"
	in_lang["logNone"]             = "none"
	in_lang["doubleItemFormat"]    = "{%s} (x{%s})"
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
	script_version     = "2.4"
	script_author      = "Magnum357"
	script_mag_version = "1.1.4.4"
	script_file_name   = "mag.delete_lines"
	script_file_ext    = ".lua"

	mag_import, mag    = pcall(require, "mag")

	if mag_import then
	mag.lang           = c_lang_switch

	c_lang.guiLabel1   = mag.string.wall(" ", 5)..c_lang.guiLabel1
	c_lang.guiLabel3   = mag.string.wall(" ", 5)..c_lang.guiLabel3
	c_lang.guiLabel4   = mag.string.wall(" ", 5)..c_lang.guiLabel4

	c_lock_gui         = false
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey2, c_lang.buttonKey3, c_lang.buttonKey4}
	c_buttons2         = {c_lang.buttonKey5, c_lang.buttonKey4}
	c_max_row          = 10
	end

	function create_gui(mode,x,y,width,height,name,value,label,hint)
	if mode == "checkbox" then return {class = "checkbox", name = name, label = label, x = x, y = y, width = width, height = height, value = value, hint = hint}                end
	if mode == "label"    then return {class = "label",                                x = x, y = y, width = width, height = height, label = label}                             end
	if mode == "dropdown" then return {class = "dropdown", name = name,                x = x, y = y, width = width, height = height, items = value, value = label, hint = hint} end
	end

	function add_macro1(subs)
	local buttons     = {c_buttons1[1], c_buttons1[2], c_buttons1[4]}
	my_gui            = {}
	local id          = 2
	local pos         = 1
	local ok, config
	local limit       = c_max_row
	local deleted_row = 0
	local apply       = {mag.window.lang.message("select")}
	local list        = mag.list.apply(subs, "default")
	if list[1] ~= nil then
	if my_gui["exp"] == nil then my_gui["exp"] = create_gui("label",    0, 2, 4, 1, "",                 "",    mag.string.format(c_lang.key1, limit - 1), "") end
	if my_gui[1] == nil     then my_gui[1]     = create_gui("label",    0, 0, 1, 1, "",                 "",    "#1",                                     "") end
	if my_gui[2] == nil     then my_gui[2]     = create_gui("label",    1, 0, 1, 1, "",                 "",    c_lang.guiLabel1,                         "") end
	if my_gui[3] == nil     then my_gui[3]     = create_gui("dropdown", 2, 0, 1, 1, "u_list_1",         apply, mag.window.lang.message("select"),               "") end
	if my_gui[4] == nil     then my_gui[4]     = create_gui("checkbox", 2, 1, 1, 1, "u_delete_style_1", false, c_lang.guiLabel2,                         "") end
	for _, style in pairs(list) do mag.array.insert(apply, style) end
	repeat
	ok, config = mag.window.dialog(my_gui, buttons)
	if ok == mag.convert.ascii(c_buttons1[3]) then
	local deleted_row = false
		for n in pairs(my_gui) do
			if mag.n(n) and n % 4 == 0 and config[ my_gui[n - 3].name ] then
			deleted_row = true
			my_gui["exp"].label = mag.string.format(c_lang.key1, limit - pos + 1)
			pos = pos - 1
			my_gui[n - 3] = nil
			my_gui[n - 2] = nil
			my_gui[n - 1] = nil
			my_gui[n]     = nil
			end
		end
		if deleted_row then
		local k = 0
		local e = 0
			for n in pairs(my_gui) do
			local m = 0
			if mag.n(n) and n % 4 == 0 then
			m = m + 1
			e = e + 1
			my_gui[n - 3].label = "#" .. e
			end
			my_gui[n].y = k * 2 + m
			if m == 1 then k = k + 1 end
			end
		end
	end
	if ok == mag.convert.ascii(c_buttons1[2]) or ok == mag.convert.ascii(c_buttons1[3]) then
		for n in pairs(my_gui) do
			if mag.n(n) and n % 4 == 0 then
			my_gui[n - 3].value = config[ my_gui[n - 3].name ]
			my_gui[n - 1].value = config[ my_gui[n - 1].name ]
			my_gui[n].value     = config[ my_gui[n].name ]
			end
		end
	end
	if ok == mag.convert.ascii(c_buttons1[2]) then
	if my_gui[id * 4 + 1 - 4] == nil then my_gui[id * 4 + 1 - 4] = create_gui("checkbox", 0, pos * 2,     1, 1, "u_row_id_" .. id,       false, "#" .. pos + 1,   mag.string.format(c_lang.guiHint1, c_lang.buttonKey3)) end
	if my_gui[id * 4 + 2 - 4] == nil then my_gui[id * 4 + 2 - 4] = create_gui("label",    1, pos * 2,     1, 1, "",                      "",    c_lang.guiLabel1, "")                                                   end
	if my_gui[id * 4 + 3 - 4] == nil then my_gui[id * 4 + 3 - 4] = create_gui("dropdown", 2, pos * 2,     1, 1, "u_list_" .. id,         apply, mag.window.lang.message("select"), "")                                         end
	if my_gui[id * 4 + 4 - 4] == nil then my_gui[id * 4 + 4 - 4] = create_gui("checkbox", 2, pos * 2 + 1, 1, 1, "u_delete_style_" .. id, false, c_lang.guiLabel2, "")                                                   end
	my_gui["exp"].y = pos * 2 + 2
	my_gui["exp"].label = mag.string.format(c_lang.key1, limit - pos - 1)
	end
	if ok == mag.convert.ascii(c_buttons1[2]) then id = id + 1 pos = pos + 1 end
	if pos > 1 then buttons = {c_buttons1[1], c_buttons1[2], c_buttons1[3], c_buttons1[4]} else buttons = {c_buttons1[1], c_buttons1[2], c_buttons1[4]} end
	if pos >= limit then buttons = {c_buttons1[1], c_buttons1[3], c_buttons1[4]} end
	until ok == mag.convert.ascii(c_buttons1[1]) or ok == mag.convert.ascii(c_buttons1[4])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	delete_lines_for_styles(subs, sel, config)
	end
	else
	mag.show.log(1, c_lang.key2)
	end
	end

	function add_macro2(subs)
	local buttons     = {c_buttons1[1], c_buttons1[2], c_buttons1[4]}
	my_gui            = {}
	local id          = 2
	local pos         = 1
	local ok, config
	local limit       = c_max_row
	local deleted_row = 0
	local apply       = {mag.window.lang.message("select")}
	local list        = mag.list.actor(subs, true)
	if  list ~= nil and list[1] ~= nil then
	if my_gui["exp"] == nil then my_gui["exp"] = create_gui("label",    0, 1, 4, 1, "",         "",    mag.string.format(c_lang.key1, limit - 1), "") end
	if my_gui[1] == nil     then my_gui[1]     = create_gui("label",    0, 0, 1, 1, "",         "",    "#1",                                     "") end
	if my_gui[2] == nil     then my_gui[2]     = create_gui("label",    1, 0, 1, 1, "",         "",    c_lang.guiLabel3,                         "") end
	if my_gui[3] == nil     then my_gui[3]     = create_gui("dropdown", 2, 0, 1, 1, "u_list_1", apply, mag.window.lang.message("select"),               "") end
	for _, actor in pairs(list) do mag.array.insert(apply, actor) end
	repeat
	ok, config = mag.window.dialog(my_gui, buttons)
	if ok == mag.convert.ascii(c_buttons1[3]) then
	local deleted_row = false
		for n in pairs(my_gui) do
			if mag.n(n) and n % 3 == 0 and config[my_gui[n - 2].name] then
			deleted_row = true
			my_gui["exp"].label = mag.string.format(c_lang.key1, limit - pos + 1)
			pos = pos - 1
			my_gui[n - 2] = nil
			my_gui[n - 1] = nil
			my_gui[n]     = nil
			end
		end
		if deleted_row then
		local m = 0
			for n in pairs(my_gui) do
			my_gui[n].y = m
			if mag.n(n) and n % 3 == 0 then
			m = m + 1
			my_gui[n - 2].label = "#" .. m
			end
			end
		end
	end
	if ok == mag.convert.ascii(c_buttons1[2]) or ok == mag.convert.ascii(c_buttons1[3]) then
		for n in pairs(my_gui) do
			if mag.n(n) and n % 3 == 0 then
			my_gui[n - 2].value = config[ my_gui[n - 2].name ]
			my_gui[n - 1].value = config[ my_gui[n - 1].name ]
			my_gui[n].value     = config[ my_gui[n].name ]
			end
		end
	end
	if ok == mag.convert.ascii(c_buttons1[2]) then
	if my_gui[id * 3 + 1 - 3] == nil then my_gui[id * 3 + 1 - 3] = create_gui("checkbox", 0, pos, 1, 1, "u_row_id_" .. id, false, "#" .. pos + 1,   mag.string.format(c_lang.guiHint1, c_lang.buttonKey3)) end
	if my_gui[id * 3 + 2 - 3] == nil then my_gui[id * 3 + 2 - 3] = create_gui("label",    1, pos, 1, 1, "",                "",    c_lang.guiLabel3, "")                                                   end
	if my_gui[id * 3 + 3 - 3] == nil then my_gui[id * 3 + 3 - 3] = create_gui("dropdown", 2, pos, 1, 1, "u_list_" .. id,   apply, mag.window.lang.message("select"), "")                                         end
	my_gui["exp"].y = pos + 1
	my_gui["exp"].label = mag.string.format(c_lang.key1, limit - pos - 1)
	end
	if ok == mag.convert.ascii(c_buttons1[2]) then id = id + 1 pos = pos + 1 end
	if pos > 1 then buttons = {c_buttons1[1], c_buttons1[2], c_buttons1[3], c_buttons1[4]} else buttons = {c_buttons1[1], c_buttons1[2], c_buttons1[4]} end
	if pos >= limit then buttons = {c_buttons1[1], c_buttons1[3], c_buttons1[4]} end
	until ok == mag.convert.ascii(c_buttons1[1]) or ok == mag.convert.ascii(c_buttons1[4])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	delete_lines_for_actor(subs, sel, config)
	end
	else
	mag.show.log(1, c_lang.key3)
	end
	end

	function add_macro3(subs)
	local buttons     = {c_buttons1[1], c_buttons1[2], c_buttons1[4]}
	my_gui            = {}
	local id          = 2
	local pos         = 1
	local ok, config
	local limit       = c_max_row
	local deleted_row = 0
	local apply       = {mag.window.lang.message("select")}
	local list        = mag.list.effect(subs, true)
	if  list ~= nil and list[1] ~= nil then
	if my_gui["exp"] == nil then my_gui["exp"] = create_gui("label",    0, 1, 4, 1, "",         "",    mag.string.format(c_lang.key1, limit - 1), "") end
	if my_gui[1] == nil     then my_gui[1]     = create_gui("label",    0, 0, 1, 1, "",         "",    "#1",                                     "") end
	if my_gui[2] == nil     then my_gui[2]     = create_gui("label",    1, 0, 1, 1, "",         "",    c_lang.guiLabel4,                         "") end
	if my_gui[3] == nil     then my_gui[3]     = create_gui("dropdown", 2, 0, 1, 1, "u_list_1", apply, mag.window.lang.message("select"),               "") end
	for _, actor in pairs(list) do mag.array.insert(apply, actor) end
	repeat
	ok, config = mag.window.dialog(my_gui, buttons)
	if ok == mag.convert.ascii(c_buttons1[3]) then
	local deleted_row = false
		for n in pairs(my_gui) do
			if mag.n(n) and n % 3 == 0 and config[ my_gui[n - 2].name ] then
			deleted_row = true
			my_gui["exp"].label = mag.string.format(c_lang.key1, limit - pos + 1)
			pos = pos - 1
			my_gui[n - 2] = nil
			my_gui[n - 1] = nil
			my_gui[n]     = nil
			end
		end
		if deleted_row then
		local m = 0
			for n in pairs(my_gui) do
			my_gui[n].y = m
			if mag.n(n) and n % 3 == 0 then
			m = m + 1
			my_gui[n - 2].label = "#" .. m
			end
			end
		end
	end
	if ok == mag.convert.ascii(c_buttons1[2]) or ok == mag.convert.ascii(c_buttons1[3]) then
		for n in pairs(my_gui) do
			if mag.n(n) and n % 3 == 0 then
			my_gui[n - 2].value = config[ my_gui[n - 2].name ]
			my_gui[n - 1].value = config[ my_gui[n - 1].name ]
			my_gui[n].value     = config[ my_gui[n].name ]
			end
		end
	end
	if ok == mag.convert.ascii(c_buttons1[2]) then
	if my_gui[id * 3 + 1 - 3] == nil then my_gui[id * 3 + 1 - 3] = create_gui("checkbox", 0, pos, 1, 1, "u_row_id_" .. id, false, "#" .. pos + 1,             mag.string.format(c_lang.guiHint1, c_lang.buttonKey3)) end
	if my_gui[id * 3 + 2 - 3] == nil then my_gui[id * 3 + 2 - 3] = create_gui("label",    1, pos, 1, 1, "",                "",    c_lang.guiLabel4,           "")                                                   end
	if my_gui[id * 3 + 3 - 3] == nil then my_gui[id * 3 + 3 - 3] = create_gui("dropdown", 2, pos, 1, 1, "u_list_" .. id,   apply, mag.window.lang.message("select"), "")                                                   end
	my_gui["exp"].y = pos + 1
	my_gui["exp"].label = mag.string.format(c_lang.key1, limit - pos - 1)
	end
	if ok == mag.convert.ascii(c_buttons1[2]) then id = id + 1 pos = pos + 1 end
	if pos > 1 then buttons = {c_buttons1[1], c_buttons1[2], c_buttons1[3], c_buttons1[4]} else buttons = {c_buttons1[1], c_buttons1[2], c_buttons1[4]} end
	if pos >= limit then buttons = {c_buttons1[1], c_buttons1[3], c_buttons1[4]} end
	until ok == mag.convert.ascii(c_buttons1[1]) or ok == mag.convert.ascii(c_buttons1[4])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	delete_lines_for_effect(subs, sel, config)
	end
	else
	mag.show.log(1, c_lang.key4)
	end
	end

	function delete_lines_for_styles(subs,sel,config)
	local gui_config         = {}
	gui_config["styles"]     = {}
	gui_config["style_info"] = {}
	local counter            = {config_count = 0, count = 0}
	for key in pairs(config) do
		if mag.match(key, "u_list_") then
		counter["config_count"] = counter["config_count"] + 1
		local style_name        = mag.strip.apply(config["u_list_"..counter["config_count"]])
			if config["u_list_"..counter["config_count"]] ~= mag.window.lang.message("select") then
			counter["count"]                           = counter["count"] + 1
			gui_config["styles"][counter["count"]]     = style_name
			gui_config["style_info"][counter["count"]] = config["u_delete_style_"..counter["config_count"]]
			end
		end
	end
	local styles        = {}
	local style_info    = {}
	local deleted       = {}
	local double_styles = {}
	for i = 1, #gui_config["styles"] do
		if mag.array.search(styles, gui_config["styles"][i]) == false then
		deleted[gui_config["styles"][i]] = {lines = 0, info = false}
		mag.array.insert(styles, gui_config["styles"][i])
		mag.array.insert(style_info, gui_config["style_info"][i])
		else
			if mag.array.search(double_styles, gui_config["styles"][i]) == false then
			mag.array.insert(double_styles, gui_config["styles"][i])
			end
		end
	end
	if double_styles[1] ~= nil then
	local collect_deleted_style_info = ""
		for d = 1, #double_styles do
		collect_deleted_style_info = mag.string.combine(collect_deleted_style_info,
		mag.string.format(c_lang.doubleItemFormat,
		double_styles[d],
		mag.array.count(gui_config["styles"], double_styles[d])), "{%s}\n{%s}")
		end
	mag.show.log(2, mag.string.format(c_lang.logKey3, collect_deleted_style_info))
	end
	local line, index
	local pcs           = false
	local deleted_index = {}
	for i = 1, #subs do
	mag.window.progress(i, #subs)
	index = i
	line  = subs[index]
		if line.class == "style" then
			for k = 1, #styles do
				if style_info[k] == true and styles[k] == line.name then
				deleted[styles[k]]["info"] = true
				mag.array.insert(deleted_index, index)
				end
			end
		elseif line.class == "dialogue" then
			for k = 1, #styles do
				if line.style == styles[k] then
				deleted[styles[k]]["lines"] = deleted[styles[k]]["lines"] + 1
				mag.array.insert(deleted_index, index)
				end
			end
		end
	end
	if deleted_index[1] ~= nil then
	local total_line       = 0
	local deleted_styles   = ""
	local undeleted_styles = ""
		for k = 1, #styles do
		mag.window.progress(k, #styles)
		total_line = total_line + deleted[styles[k]]["lines"]
		local style_info_status
			if deleted[styles[k]]["info"] then
			deleted_styles    = mag.string.combine(deleted_styles, mag.string.wall(" ", 8)..styles[k],   "{%s}\n{%s}")
			style_info_status = c_lang.logTrue
			else
			undeleted_styles  = mag.string.combine(undeleted_styles, mag.string.wall(" ", 8)..styles[k], "{%s}\n{%s}")
			style_info_status = c_lang.logFalse
			end
		mag.show.log(mag.string.format(c_lang.logKey1, styles[k], deleted[styles[k]]["lines"], style_info_status))
		end
		if total_line > 0 then
		local style_group1
			if deleted_styles ~= "" then
			style_group1 = deleted_styles
			else
			style_group1 = mag.string.wall(" ", 8)..c_lang.logNone
			end
		local style_group2
			if undeleted_styles ~= "" then
			style_group2 = undeleted_styles
			else
			style_group2 = mag.string.wall(" ", 8)..c_lang.logNone
			end
		mag.show.log(mag.string.format(c_lang.logKey2, total_line, style_group1, style_group2))
		end
	mag.line.delete(subs, deleted_index)
	end
	end

	function delete_lines_for_actor(subs,sel,config)
	local gui_config     = {}
	gui_config["actors"] = {}
	local counter        = {config_count = 0, count = 0}
	for key in pairs(config) do
		if mag.match(key, "u_list_") then
		counter["config_count"] = counter["config_count"] + 1
		local actor_name = mag.strip.apply(config["u_list_"..counter["config_count"]])
			if config["u_list_"..counter["config_count"]] ~= mag.window.lang.message("select") then
			counter["count"]                       = counter["count"] + 1
			gui_config["actors"][counter["count"]] = actor_name
			end
		end
	end
	local actors        = {}
	local deleted       = {}
	local double_actors = {}
	for i = 1, #gui_config["actors"] do
		if mag.array.search(actors, gui_config["actors"][i]) == false then
		deleted[gui_config["actors"][i]] = {lines = 0}
		mag.array.insert(actors, gui_config["actors"][i])
		else
			if mag.array.search(double_actors, gui_config["actors"][i]) == false then
			mag.array.insert(double_actors, gui_config["actors"][i])
			end
		end
	end
	if double_actors[1] ~= nil then
	local collect_deleted_actors = ""
		for d = 1, #double_actors do
		collect_deleted_actors = mag.string.combine(collect_deleted_actors,
		mag.string.format(c_lang.doubleItemFormat,
		double_actors[d],
		mag.mag.array.count(gui_config["actors"], double_actors[d])), "{%s}\n{%s}")
		end
	mag.show.log(2, mag.string.format(c_lang.logKey4, collect_deleted_actors))
	end
	local line, index
	local pcs           = false
	local deleted_index = {}
	for i = 1, #subs do
	mag.window.progress(i, #subs)
	index = i
	line  = subs[index]
		if line.class == "dialogue" then
			for k = 1, #actors do
				if line.actor == actors[k] then
				deleted[actors[k]]["lines"] = deleted[actors[k]]["lines"] + 1
				mag.array.insert(deleted_index, index)
				end
			end
		end
	end
	if deleted_index[1] ~= nil then
	local total_line = 0
		for k = 1, #actors do
		mag.window.progress(k, #actors)
		total_line = total_line + deleted[actors[k]]["lines"]
		mag.show.log(mag.string.format(c_lang.logKey5, actors[k], deleted[actors[k]]["lines"]))
		end
		if total_line > 0 then
		mag.show.log(mag.string.format(c_lang.logKey6, total_line))
		end
	mag.line.delete(subs, deleted_index)
	end
	end

	function delete_lines_for_effect(subs,sel,config)
	local gui_config      = {}
	gui_config["effects"] = {}
	local counter         = {config_count = 0, count = 0}
	for key in pairs(config) do
		if mag.match(key, "u_list_") then
		counter["config_count"] = counter["config_count"] + 1
		local effect_name = mag.strip.apply(config["u_list_"..counter["config_count"]])
			if config["u_list_"..counter["config_count"]] ~= mag.window.lang.message("select") then
			counter["count"]                        = counter["count"] + 1
			gui_config["effects"][counter["count"]] = effect_name
			end
		end
	end
	local effects        = {}
	local deleted        = {}
	local double_effects = {}
	for i = 1, #gui_config["effects"] do
		if mag.array.search(effects, gui_config["effects"][i]) == false then
		deleted[gui_config["effects"][i]] = {lines = 0}
		mag.array.insert(effects, gui_config["effects"][i])
		else
			if mag.array.search(double_effects, gui_config["effects"][i]) == false then
			mag.array.insert(double_effects, gui_config["effects"][i])
			end
		end
	end
	if double_effects[1] ~= nil then
	local collect_deleted_effects = ""
		for d = 1, #double_effects do
		collect_deleted_effects = mag.string.combine(collect_deleted_effects,
		mag.string.format(c_lang.doubleItemFormat,
		double_effects[d],
		mag.array.count(gui_config["effects"], double_effects[d])), "{%s}\n{%s}")
		end
	mag.show.log(2, mag.string.format(c_lang.logKey7, collect_deleted_effects))
	end
	local line, index
	local pcs           = false
	local deleted_index = {}
	for i = 1, #subs do
	mag.window.progress(i, #subs)
	index = i
	line  = subs[index]
		if line.class == "dialogue" then
			for k = 1, #effects do
				if line.effect == effects[k] then
				deleted[effects[k]]["lines"] = deleted[effects[k]]["lines"] + 1
				mag.array.insert(deleted_index, index)
				end
			end
		end
	end
	if deleted_index[1] ~= nil then
	local total_line = 0
		for k = 1, #effects do
		mag.window.progress(k, #effects)
		total_line = total_line + deleted[effects[k]]["lines"]
		mag.show.log(mag.string.format(c_lang.logKey8, effects[k], deleted[effects[k]]["lines"]))
		end
		if total_line > 0 then
		mag.show.log(mag.string.format(c_lang.logKey6, total_line))
		end
	mag.line.delete(subs, deleted_index)
	end
	end

	function check_macro1(subs)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro1, subs)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	end
	end

	function check_macro2(subs)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro2, subs)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	end
	end

	function check_macro3(subs)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro3, subs)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
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
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
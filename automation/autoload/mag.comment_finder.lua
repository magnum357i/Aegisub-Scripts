	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Açıklama Bul"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Comment Finder"}
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
	in_lang["s_desc"]              = "Notları bulup arayüzde listeler. Ayrıca bunlar arasında geçiş yapılmasını sağlar."
	in_lang["tabKey1"]             = "Ayarlar"
	in_lang["key1"]                = "Açıklama bulunamadı. Açıklamalar, içinde etiket bulunmayan parantezlerdeki metinlerdir.\n\nÖrneğin:\n\"Herşey yolunda.{'Şey' kelimesinin her zaman ayrı yazılması dışında.}\""
	in_lang["key2"]                = "Toplam {%s} öğe - Sayfa {%s} / {%s}"
	in_lang["buttonKey1"]          = "Git"
	in_lang["buttonKey2"]          = "Önceki Sayfa"
	in_lang["buttonKey3"]          = "Sonraki Sayfa"
	in_lang["buttonKey4"]          = "Kapat"
	in_lang["buttonKey5"]          = "Kaydet"
	in_lang["guiLabelKey1"]        = "Gidilecek satır:"
	in_lang["guiLabelKey2"]        = "Görünecek en fazla karakter sayısı:"
	in_lang["guiLabelKey3"]        = "Sayfa başı öğe sayısı:"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "It finds notes and lists them in the interface. Also allows you to jump between them."
	in_lang["tabKey1"]             = "Configs"
	in_lang["key1"]                = "No comment found. Comments are text in brackets. And there are no tags inside them.\n\nFor example:\n\"i dont kno it.{There are spelling errors.}\""
	in_lang["key2"]                = "Total {%s:# [item][items]} - Page {%s} / {%s}"
	in_lang["buttonKey1"]          = "Go"
	in_lang["buttonKey2"]          = "Previous Page"
	in_lang["buttonKey3"]          = "Next Page"
	in_lang["buttonKey4"]          = "Close"
	in_lang["buttonKey5"]          = "Save"
	in_lang["guiLabelKey1"]        = "Go to:"
	in_lang["guiLabelKey2"]        = "Maximum characters to display:"
	in_lang["guiLabelKey3"]        = "Number of items per page:"
	end
	return in_lang, lang_list, script_name_list
	end

	c_lang_switch       = "en"
	c_lang,
	c_lang_list,
	c_script_name_list  = lang_switch_keys(c_lang_switch)
 
	script_name         = c_lang.s_name
	script_description  = c_lang.s_desc
	script_version      = "1.3"
	script_author       = "Magnum357"
	script_mag_version  = "1.1.4.4"
	script_file_name    = "mag.comment_finder"
	script_file_ext     = ".lua"

	include_unicode     = true
	mag_import, mag     = pcall(require, "mag")

	if mag_import then
	mag.lang            = c_lang_switch	

	c_lock_gui          = false
	c_page_limit_list   = {"10", "15", "25"}
	c_max_char_list     = {"30", "50", "80", "110"}
	c_buttons1          = {c_lang.buttonKey5, c_lang.buttonKey4}

	c                   = {}
	c.page_limit_select = c_page_limit_list[1]
	c.max_char_select   = c_max_char_list[2]

	gui                 = {
		main1      = {
		             {class = "label",                           x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey1},
		list_items = {class = "dropdown", name = "u_list_items", x = 1, y = 0, width = 1, height = 1},
		status     = {class = "label",                           x = 0, y = 1, width = 2, height = 1},
		},
		main2      = {
		             {class = "label",                           x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey2},
		max_char   = {class = "dropdown", name = "u_max_char",   x = 1, y = 0, width = 5, height = 1},
		             {class = "label",                           x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey3},
		page_limit = {class = "dropdown", name = "u_page_limit", x = 1, y = 1, width = 5, height = 1},
		}
	}
	end

	function configs()
	gui.main2.page_limit.items = c_page_limit_list
	gui.main2.page_limit.value = c.page_limit_select
	gui.main2.max_char.items   = c_max_char_list
	gui.main2.max_char.value   = c.max_char_select
	local ok, config = mag.window.dialog(gui.main2, c_buttons1)
	if ok == mag.convert.ascii(c_buttons1[1]) then
	c.page_limit_select = config.u_page_limit
	c.max_char_select   = config.u_max_char
	end
	end

	function listener(items)
	page_limit         = mag.n(c.page_limit_select)
	local item_preview = "#{%s} -> ({%s}) {%s}"
	local list_items   = {}
	local n            = 0
	for key in pairs(items) do
	n = n + 1
	mag.array.insert(list_items, mag.string.format(item_preview, n, items[key].i, mag.limit.text(items[key].text, mag.n(c.max_char_select), true)))
	end
	local ok, config, buttons
	buttons  = {c_lang.buttonKey1, c_lang.buttonKey4}
	local cp = 1
	repeat
	local items = {}
	if ok == mag.convert.ascii(c_lang.buttonKey2) then cp = cp - 1 end
	if ok == mag.convert.ascii(c_lang.buttonKey3) then cp = cp + 1 end
	if #list_items > page_limit then buttons = {c_lang.buttonKey1, c_lang.buttonKey3, c_lang.buttonKey4} end
	if cp > 1 then buttons = {c_lang.buttonKey1, c_lang.buttonKey2, c_lang.buttonKey3, c_lang.buttonKey4} end
	if cp ~= 1 and page_limit * cp > #list_items then buttons = {c_lang.buttonKey1, c_lang.buttonKey2, c_lang.buttonKey4} end
	local si
	local ei
	if cp == 1 then
	si = 1
	ei = page_limit
	elseif cp > 1 then
	si = page_limit * (cp - 1) + 1
	ei = page_limit * cp
	end
	mag.array.insert(items, mag.window.lang.message("select"))
	for k = si, ei do
	mag.array.insert(items, list_items[k])
	end
	gui.main1.list_items.items = items
	gui.main1.list_items.value = mag.window.lang.message("select")
	gui.main1.status.label     = mag.string.format(c_lang.key2, #list_items, cp, mag.ceil(#list_items / page_limit))
	ok, config                 = mag.window.dialog(gui.main1, buttons)
	until ok == mag.convert.ascii(c_lang.buttonKey1) or ok == mag.convert.ascii(c_lang.buttonKey4)
	result = nil
	if ok == mag.convert.ascii(c_lang.buttonKey1) then
	result = config.u_list_items
	end
	return result
	end

	function comment_finder(subs,sel)
	local first_index = mag.index.first(subs) - 1
	local find_list        = {}
	local line, index
	local lines_index = mag.line.index(subs, sel, mag.window.lang.message("all_lines"), false, true)
	for i = 1, #lines_index do
	index      = lines_index[i]
	line       = subs[index]
	local text = line.text
	text       = mag.strip.tag(text)
	pattern    = "{(.-)}"
	local matched = mag.match(text, pattern)
		if matched and not mag.is.empty(matched) then
		local m = {}
		m.i     = lines_index[i] - first_index
		m.text  = mag.trim.all(matched)
		mag.array.insert(find_list, m)
		end
	end
	if #find_list == 0 then
	mag.show.log(1, c_lang.key1)
	else
	local jump = listener(find_list)
		if jump ~= nil then
		jump = mag.gsub(jump, "%d+", "", 1)
		jump = mag.match(jump, "%d+")
		return {jump + first_index}
		end
	end
	end

	function check_macro1(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(comment_finder, subs, sel)
	mag.window.funce(fe, fee)
	mag.config.set(c)
	return fee
	end
	end

	function check_macro2()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(configs)
	mag.window.funce(fe, fee)
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
		mag.window.register(script_name.."/"..mag.window.lang.message("gui_tabname"), check_macro1)
		mag.window.register(script_name.."/"..c_lang.tabKey1,                         check_macro2)
		mag.window.lang.register()
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Çeviri Durumu"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Translation Status"}
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
	in_lang["s_desc"]              = "Çeviri durumunu gösterir."
	in_lang["buttonKey1"]          = "İşaretle"
	in_lang["buttonKey2"]          = "Durum"
	in_lang["buttonKey3"]          = "Kapat"
	in_lang["buttonKey4"]          = "Düşük"
	in_lang["buttonKey5"]          = "Orta"
	in_lang["buttonKey6"]          = "Yüksek"
	in_lang["buttonKey7"]          = "Temizle"
	in_lang["signtext"]            = "çevrilecek"
	in_lang["guiLabelKey1"]        = "İşaret yazısı:"
	in_lang["percentFormat"]       = "{%s}{%s} - %{%s} -> {%s}"
	in_lang["headerKey1"]          = "DURUMUNUZ > {%s}/{%s} ({%s})"
	in_lang["messageKey1"]         = "Düşük"
	in_lang["messageKey2"]         = "Orta"
	in_lang["messageKey3"]         = "Yüksek"
	in_lang["messageKey4"]         = "Tüm satırlar çevrilmiş."
	in_lang["messageKey5"]         = "Çevrilmiş"
	in_lang["messageKey7"]         = "Artış oranı: {%s} ({%s} satır)"
	in_lang["messageLineFormat"]   = "#{%s} {%s} {%s}"
	in_lang["hintKey1"]            = "Olabildiğince eşsiz bir şey girmeye özen gösterin."
	in_lang["tabKey1"]             = "Talimatlar"
	in_lang["notes"]               =
	"KULLANIM"
	.."\n1. İşaretle butonuna basın. Uygulanacak satırlara bir işaret koyar."
	.."\n2. Çevirdikçe bu işaretleri silin veya zorluk seviyesini (düşük, orta, yüksek) değiştirin."
	.."\n3. Çevrilmemiş satırları görmek için durum butonuna basın."
	.."\n\n\n\"SATIR ÖLÇ\"LE ORTAK ÇALIŞMA"
	.."\n1. Satır ölç eklentisini -yeni satır kipiyle- uyguladıktan sonra bunu kullanın."
	.."\n2. Durum butonuna basın."
	.."\n\nÇevrilmiş satırlar çubuğu görünür."
	in_lang["measureKey"]          = "[Satır Ölç]"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Shows the status of your translation."
	in_lang["buttonKey1"]          = "Mark"
	in_lang["buttonKey2"]          = "Status"
	in_lang["buttonKey3"]          = "Close"
	in_lang["buttonKey4"]          = "Low"
	in_lang["buttonKey5"]          = "Medium"
	in_lang["buttonKey6"]          = "High"
	in_lang["buttonKey7"]          = "Clear"
	in_lang["signtext"]            = "not translated"
	in_lang["guiLabelKey1"]        = "Sign text:"
	in_lang["percentFormat"]       = "{%s}{%s} - %{%s} -> {%s}"
	in_lang["headerKey1"]          = "YOUR STATUS > {%s}/{%s} ({%s})"
	in_lang["headerKey2"]          = "CURRENT POINT"
	in_lang["headerKey3"]          = "INCREASE TABLE (FOR ONE LINE)"
	in_lang["messageKey1"]         = "Low"
	in_lang["messageKey2"]         = "Medium"
	in_lang["messageKey3"]         = "High"
	in_lang["messageKey4"]         = "All lines translated"
	in_lang["messageKey5"]         = "Translated"
	in_lang["messageKey6"]         = "One percent: {%s} lines"
	in_lang["messageKey7"]         = "Ratio: {%s}"
	in_lang["messageKey8"]         = "Count of the prev lines: {%s}"
	in_lang["messageKey9"]         = "Count of the next lines: {%s}"
	in_lang["messageKey10"]        = "Prev ({%s})"
	in_lang["messageKey11"]        = "Next: ({%s})"
	in_lang["messageKey12"]        = "Untranslated"
	in_lang["messageKey13"]        = "Types"
	in_lang["messageKey14"]        = "Summary"
	in_lang["messageLineFormat"]   = "#{%s} {%s} {%s}"
	in_lang["hintKey1"]            = "Try to enter a unique thing as possible."
	in_lang["tabKey1"]             = "Instructions"
	in_lang["notes"]               =
	"HOW TO USE?"
	.."\n1. Click the mark button. Puts a mark on the lines to be apply."
	.."\n2. Delete these marks or change the difficulty (to low, medium, high) as you translate."
	.."\n3. Click the status button to view the untranslated lines."
	.."\n\n\nWORKING WITH MEASURE LINES"
	.."\n1. Use this after applying the measure lines (next line mode only)."
	.."\n2. Click the status button."
	.."\n\nYou will see the bar of translated lines."
	in_lang["measureKey"]          = "[Measure Lines]"
	end
	return in_lang, lang_list, script_name_list
	end

	c_lang_switch      = "en"
	c_lang,
	c_lang_list,
	c_script_name_list = lang_switch_keys(c_lang_switch)

	script_name        = c_lang.s_name
	script_description = c_lang.s_desc
	script_version     = "1.0.4"
	script_author      = "Magnum357"
	script_mag_version = "1.1.5.0"
	script_file_name   = "mag.translation_status"
	script_file_ext    = ".lua"

	include_unicode    = true
	include_clipboard  = true
	include_karaskel   = true
	mag_import, mag    = pcall(require, "mag")

	if mag_import then
	mag.lang           = c_lang_switch

	c_lock_gui         = false
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey4, c_lang.buttonKey5, c_lang.buttonKey6, c_lang.buttonKey7, c_lang.buttonKey2, c_lang.buttonKey3}

	c                  = {}
	c.comment_mode     = true
	c.empty_mode       = true
	c.apply            = mag.window.lang.message("select")
	c.signtext         = c_lang.signtext

	gui = {
		main1 = {
			               {class = "label",                           x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey1},
			signtext     = {class = "edit",     name = "signtext",     x = 1, y = 0, width = 1, height = 1, hint = c_lang.hintKey1},
			               {class = "label",                           x = 0, y = 1, width = 1, height = 1, label = mag.window.lang.message("apply")},
			apply        = {class = "dropdown", name = "apply",        x = 1, y = 1, width = 1, height = 1, hint = mag.window.lang.message("style_hint1")},
			comment_mode = {class = "checkbox", name = "comment_mode", x = 1, y = 2, width = 1, height = 1, label = mag.window.lang.message("comment_mode")},
			empty_mode   = {class = "checkbox", name = "empty_mode",   x = 1, y = 3, width = 1, height = 1, label = mag.window.lang.message("empty_mode")},
		}
	}
	end

	function marklines(subs,sel)
	local line, index
	local pcs          = false
	local lines_index  = mag.line.index(subs, sel, c.apply, c.comment_mode, c.empty_mode)
	local signtext_org = c.signtext
	local signtext_ct  = mag.convert.esc(signtext_org)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	index = lines_index[i]
	line  = subs[index]
		if not mag.match(line.text, "{"..signtext_ct..".?.?}") then
		if not pcs then pcs = true end
		line.text = line.text.."{"..signtext_org.."}"
		end
	if pcs then subs[index] = line end
	end
	mag.show.no_op(pcs)
	end

	function clearlines(subs,sel)
	local line, index
	local pcs          = false
	local lines_index  = mag.line.index(subs, sel, mag.window.lang.message("all_lines"), false, c.empty_mode)
	local signtext_org = c.signtext
	local signtext_ct  = mag.convert.esc(signtext_org)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	index = lines_index[i]
	line  = subs[index]
		if mag.match(line.text, "{"..signtext_ct..".?.?}") then
		if not pcs then pcs = true end
		line.text = mag.gsub(line.text, "{"..signtext_ct..".?.?}", "")
		end
	if pcs then subs[index] = line end
	end
	mag.show.no_op(pcs)
	end

	function setlines(subs,sel,mode)
	local line, index
	local pcs          = false
	local lines_index  = mag.line.index(subs, sel, mag.window.lang.message("selected_lines"), c.comment_mode, c.empty_mode)
	local signtext_org = c.signtext
	local signtext_ct  = mag.convert.esc(signtext_org)
	local outputkey    = c.signtext
	if mode == 2 then outputkey = outputkey..":2" end
	if mode == 3 then outputkey = outputkey..":3" end
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	index = lines_index[i]
	line  = subs[index]
	local matched = mag.match(line.text, "{("..signtext_ct..".?.?)}")
		if matched then
			if matched ~= outputkey then
			if not pcs then pcs = true end
			line.text = mag.gsub(line.text, "{"..mag.convert.esc(matched).."}", "{"..outputkey.."}", 1)
			end
		else
		if not pcs then pcs = true end
		line.text = line.text.."{"..outputkey.."}"
		end
	if pcs then subs[index] = line end
	end
	mag.show.no_op(pcs)
	end

	c_rate      = 0
	c_rateline  = 0
	c_totalline = 0

	function getstatus(subs,sel,act)
	local line, index
	local first_index  = mag.index.first(subs) - 1
	local act_index    = act - first_index
	local pcs          = false
	local lines_index  = mag.line.index(subs, sel, c.apply, c.comment_mode, c.empty_mode)
	local signtext_org = c.signtext
	local signtext_ct  = mag.convert.esc(signtext_org)
	local counts       = {low = 0, medium = 0, high = 0, untranslated = 0, translated = 0, total = 0, prevc = {total = 0, low = 0, medium = 0, high = 0}, nextc = {total = 0, low = 0, medium = 0, high = 0}}
	local scount       = #subs - first_index
	local max_digit    = mag.n(mag.convert.len(mag.s(scount)))
	local selected     = false
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	if not pcs then pcs = true end
	index        = lines_index[i]
	line         = subs[index]
	local icon   = ""
		if mag.match(line.text, "{"..signtext_ct.."}") then
		counts.untranslated = counts.untranslated + 1
		counts.low          = counts.low + 1
		passed              = true
		icon                = "▶"..mag.string.wall(" ", 6)
		elseif mag.match(line.text, "{"..signtext_ct..":2}") then
		counts.untranslated = counts.untranslated + 1
		counts.medium       = counts.medium + 1
		passed              = true
		icon                = "▶▶"..mag.string.wall(" ", 3)
		elseif mag.match(line.text, "{"..signtext_ct..":3}") then
		counts.untranslated = counts.untranslated + 1
		counts.high         = counts.high + 1
		passed              = true
		icon                = "▶▶▶"
		elseif mag.match(line.effect, mag.convert.esc(c_lang.measureKey)) then
		counts.translated   = counts.translated + 1
		end
		if icon ~= "" then
		local linenumber = index - first_index
		local msg        = mag.string.format(c_lang.messageLineFormat, linenumber..mag.string.wall("  ", max_digit - mag.convert.len(mag.s(linenumber))), icon, mag.strip.all(line.text))
			if selected == false and linenumber >= act_index then
			selected     = true
			counts.prevc.total  = counts.untranslated - 1
			counts.prevc.low    = counts.low
			counts.prevc.medium = counts.medium
			counts.prevc.high   = counts.high
				if icon == "▶"..mag.string.wall(" ", 6) then
				counts.prevc.low = counts.prevc.low - 1
				elseif icon == "▶▶"..mag.string.wall(" ", 3) then
				counts.prevc.medium = counts.prevc.medium - 1
				elseif icon == "▶▶▶" then
				counts.prevc.high = counts.prevc.high - 1
				end
			mag.show.basic_log(mag.string.wall("━", 95), "autobreak")
			mag.show.basic_log(msg, "autobreak")
			mag.show.basic_log(mag.string.wall("━", 95), "autobreak")
			else
			mag.show.basic_log(msg, "autobreak")
			end
		end
	end
	if pcs and counts.untranslated > 0 then
	counts.total = counts.translated + counts.untranslated
	mag.show.log("\n\n"..mag.string.format(c_lang.headerKey1, counts.translated, counts.total, counts.untranslated))
	mag.show.basic_log(mag.string.format(c_lang.messageKey14), "autobreak")
	local percent
		if counts.translated > 0 then
		percent = calc_percent(counts.translated, counts.total)
		mag.show.basic_log(mag.string.format(c_lang["percentFormat"], progresschart(percent), counts.translated, percent, c_lang["messageKey5"]), "autobreak")
		end
		if counts.untranslated > 0 then
		percent = calc_percent(counts.untranslated, counts.total)
		mag.show.basic_log(mag.string.format(c_lang["percentFormat"], progresschart(percent), counts.untranslated, percent, c_lang["messageKey12"]), "autobreak")
		end
		mag.show.basic_log("", "autobreak")
		mag.show.basic_log(mag.string.format(c_lang.messageKey13), "autobreak")
		for i, key in pairs({"low", "medium", "high"}) do
			if counts[key] > 0 then
			percent = calc_percent(counts[key], counts.total)
			mag.show.basic_log(mag.string.format(c_lang["percentFormat"], progresschart(percent), counts[key], percent, c_lang["messageKey"..i]), "autobreak")
			end
		end
		if c_totalline ~= counts.total then
		local rate, rate_temp, countforonepercent = calc_percent(1, counts.total), 0, 1
		rate_temp = rate
			for i = 1, 15 do
			countforonepercent = countforonepercent + 1
			rate_temp          = rate_temp + rate
			if rate_temp > 1 then break end
			end
		c_rate      = rate
		c_rateline  = countforonepercent
		c_totalline = counts.total
		end
	mag.show.log("\n\n"..c_lang.headerKey3)
	mag.show.basic_log(mag.string.format(c_lang.messageKey6, c_rateline), "autobreak")
	mag.show.basic_log(mag.string.format(c_lang.messageKey7, c_rate), "autobreak")
	mag.show.log("\n\n"..c_lang.headerKey2)
	if selected then
	counts.nextc.total  = counts.untranslated - counts.prevc.total
	counts.nextc.low    = counts.low - counts.prevc.low
	counts.nextc.medium = counts.medium - counts.prevc.medium
	counts.nextc.high   = counts.high - counts.prevc.high
	else
	counts.prevc.total  = counts.untranslated
	counts.prevc.low    = counts.low
	counts.prevc.medium = counts.medium
	counts.prevc.high   = counts.high
	end
		if counts.prevc.total > 0 then
		mag.show.basic_log(mag.string.format(c_lang.messageKey10, counts.prevc.total), "autobreak")
			for i, key in pairs({"low", "medium", "high"}) do
				if counts.prevc[key] > 0 then
				percent = calc_percent(counts.prevc[key], counts.prevc.total)
				mag.show.basic_log(mag.string.format(c_lang["percentFormat"], progresschart(percent), counts.prevc[key], percent, c_lang["messageKey"..i]), "autobreak")
				end
			end
		end
		if counts.nextc.total > 0 then
		if counts.prevc.total > 0 then mag.show.basic_log("", "autobreak") end
		mag.show.basic_log(mag.string.format(c_lang.messageKey11, counts.nextc.total), "autobreak")
			for i, key in pairs({"low", "medium", "high"}) do
				if counts.nextc[key] > 0 then
				percent = calc_percent(counts.nextc[key], counts.nextc.total)
				mag.show.basic_log(mag.string.format(c_lang["percentFormat"], progresschart(percent), counts.nextc[key], percent, c_lang["messageKey"..i]), "autobreak")
				end
			end
		end
	else
	mag.show.log(3, c_lang.messageKey4)
	end
	mag.show.no_op(pcs)
	end

	function add_macro1(subs,sel,act)
	local apply_items     = mag.list.full_apply(subs, sel, "comment")
	c.apply               = mag.array.search_apply(apply_items, c.apply)
	gui.main1.apply.items = apply_items
	local ok, config
	repeat
	mag.config.put(gui.main1)
	ok, config = mag.window.dialog(gui.main1, c_buttons1)
	mag.config.take(config)
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply ~= mag.window.lang.message("select") or ok ~= mag.convert.ascii(c_buttons1[1])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	marklines(subs, sel)
	elseif ok == mag.convert.ascii(c_buttons1[2]) then
	setlines(subs, sel, 1)
	elseif ok == mag.convert.ascii(c_buttons1[3]) then
	setlines(subs, sel, 2)
	elseif ok == mag.convert.ascii(c_buttons1[4]) then
	setlines(subs, sel, 3)
	elseif ok == mag.convert.ascii(c_buttons1[5]) then
	clearlines(subs, sel)
	elseif ok == mag.convert.ascii(c_buttons1[6]) then
	getstatus(subs, sel, act)
	end
	end

	function add_macro2()
	mag.show.log(c_lang.notes)
	end

	function check_macro1(subs,sel,act)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro1, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function progresschart(percent)
	percent     = mag.ceil(percent)
	local space = ""
	if mag.n(percent) > 0 then space = " " end
	percent = math.floor(percent / 5)
	if percent == 0 then percent = 1 end
	return mag.string.wall("▋", percent)..space
	end

	function calc_percent(a,b) return mag.gsub((a / b) * 100, "%.(%d%d)%d+", ".%1") end

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
		mag.window.register(script_name.."/"..c_lang.tabKey1, add_macro2)
		mag.window.lang.register()
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end

	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Böl",   sub_menu = "Satır/Böl"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Break Lines", sub_menu = "Lines/Break"}
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
	in_lang["s_name"]              = langs[1].script_name
	in_lang["s_desc"]              = "Bölünmemiş ve bölünmesi gereken satırları böler."
	in_lang["buttonKey1"]          = "Böl"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["guiLabelKey1"]        = "Karakter sınırı:"
	in_lang["guiLabelKey2"]        = "Boşlukları ve noktalama işaretlerini yoksay"
	in_lang["guiLabelKey3"]        = "Yukarıda kalacak kelimeler:"
	in_lang["guiLabelKey4"]        = "Aşağıda kalacak kelimeler:"
	in_lang["topWordsDefault"]     = "de,da,ki,ile,ya,kadar,mı,mi,mu,mü,bile,için,gibi"
	in_lang["bottomWordsDefault"]  = "ama,lakin,fakat,ve,hem,anca,oysa,oysaki,ha,yoksa,en,her"
	in_lang["key1"]                = "[Toplam bölünen satır: {%s}]\nBir konuşma çizgisi: {%s}\nİki konuşma çizgisi: {%s}\nKonuşma çizgisiz: {%s}"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Breaks the lines that are not breaked and must be breaked."
	in_lang["buttonKey1"]          = "Break"
	in_lang["buttonKey2"]          = "Close"
	in_lang["buttonKey3"]          = "Close"
	in_lang["guiLabelKey1"]        = "Character limit:"
	in_lang["guiLabelKey2"]        = "Ignore spaces and punctuations"
	in_lang["guiLabelKey3"]        = "Top words:"
	in_lang["guiLabelKey4"]        = "Bottom words:"
	in_lang["topWordsDefault"]     = ""
	in_lang["bottomWordsDefault"]  = "on,in,at,about,am,is,are,was,were,and,but,or,still,so,as,like,otherwise,both,either,neither,also,after,before,while,since,once,when,by,such,for,can,must,have,had,should,will,to"
	in_lang["key1"]                = "[Total breaking {%s:[line][lines]: #}]\nOne speech {%s:[line][lines]: #}\nTwo speech {%s:[line][lines]: #}\nNon-speech {%s:[line][lines]: #}"
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
	script_version     = "1.3.1"
	script_mag_version = "1.1.4.8"
	script_file_name   = "mag.break_lines"
	script_file_ext    = ".lua"

	include_unicode    = true
	mag_import, mag    = pcall(require, "mag")

	if mag_import then
	mag.lang           = c_lang_switch

	c_lock_gui         = false
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey2}

	c                  = {}
	c.apply_lines      = mag.window.lang.message("select")
	c.comment_mode     = true
	c.empty_mode       = true
	c.max_char         = 40
	c.space_and_punc   = false
	c.top_words        = ""
	c.bottom_words     = ""

	gui                = {
		main1          = {
		                 {class = "label",                                                 x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey1},
		max_char       = {class = "intedit",  name = "max_char",       min = 30, max = 60, x = 1, y = 0, width = 1, height = 1},
		                 {class = "label",                                                 x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey3},
		top_words      = {class = "edit",     name = "top_words",                          x = 1, y = 1, width = 1, height = 1},
		                 {class = "label",                                                 x = 0, y = 2, width = 1, height = 1, label = c_lang.guiLabelKey4},
		bottom_words   = {class = "edit",     name = "bottom_words",                       x = 1, y = 2, width = 1, height = 1},
		                 {class = "label",                                                 x = 0, y = 3, width = 1, height = 1, label = mag.window.lang.message("apply")},
		apply_lines    = {class = "dropdown", name = "apply_lines",                        x = 1, y = 3, width = 1, height = 1},
		comment_mode   = {class = "checkbox", name = "comment_mode",                       x = 1, y = 4, width = 1, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode     = {class = "checkbox", name = "empty_mode",                         x = 1, y = 5, width = 1, height = 1, label = mag.window.lang.message("empty_mode")},
		space_and_punc = {class = "checkbox", name = "space_and_punc",                     x = 1, y = 6, width = 1, height = 1, label = c_lang.guiLabelKey2},
		},
	}
	end

	function break_line(subs,sel)
	local line, index
	local counter      = {line_type1 = 0, line_type2 = 0, line_type3 = 0}
	local pcs          = false
	local lines_index  = mag.line.index(subs, sel, c.apply_lines, c.comment_mode, c.empty_mode)
	local top_words    = mag.array.create(c.top_words)
	local bottom_words = mag.array.create(c.bottom_words)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local pcs2       = false
	index            = lines_index[i]
	line             = subs[index]
	local strip_line = mag.strip.bracket(line.text)
		if not mag.match(strip_line, "\\N") then
		local word = mag.string.words(line.text)
			if mag.match(strip_line, "%-%s") or mag.match(strip_line, "%s%-") then
			local speech_count = mag.string.count(strip_dash(strip_line), "%-")
				if speech_count == 1 or speech_count == 2 then
					if speech_count == 1 then
					counter["line_type1"] = counter["line_type1"] + 1
					elseif speech_count == 2 then
					counter["line_type2"] = counter["line_type2"] + 1
					end
					for w = 1, #word do
						if w > 1 and mag.match(strip_dash(word[w]), "%-") then
						word[w] = "\\N"..word[w]
						if not pcs then pcs = true end
						pcs2    = true
						end
						if word[w] ~= nil and mag.match(strip_dash(word[w]), "%-") then
						word[w] = mag.trim.left(word[w])
						end
					word[w] = word[w]
					end
				line.text = mag.array.concat(word)
				end
			end
			if not pcs2 then
			local text_len = len(line.text)
				if text_len >= c.max_char then
				counter["line_type3"] = counter["line_type3"] + 1
				if not pcs then pcs = true end
				local half_len = text_len / 2
				local diff     = {}
					for w = 1, #word do
					local ptext    = ""
					local ntext    = ""
						for k = 1, #word do
						if k <= w then
							ptext = ptext..word[k]
							else
							ntext = ntext..word[k]
							end
						end
					local difff = {}
					difff.val   = mag.convert.positive(len(ptext) - len(ntext))
					difff.i     = w
					mag.array.insert(diff, difff)
					end
				local sort_diff = {}
					for key in pairs(diff) do
					mag.array.insert(sort_diff, diff[key].val)
					end
				mag.sort.basic(sort_diff)
				local break_point
					for key in pairs(diff) do
					if diff[key].val == sort_diff[1] then
					break_point = diff[key].i
					break
					end
				end
				local break_prev = ""
				local break_next = ""
					-- Not break speech line
					if mag.strip.space(word[break_point]) == "-" then break_point = break_point - 1 end
					if mag.array.search(top_words, mag.gsub(word[break_point+1], "[%s"..mag.pattern.punc.."]+", "")) == true then
					break_point = break_point + 1
					elseif mag.array.search(bottom_words, mag.gsub(word[break_point], "[%s"..mag.pattern.punc.."]+", "")) == true then
					break_point = break_point - 1
					end
					for m = 1, #word do
					local word_part = word[m]
						if m <= break_point then
						break_prev = break_prev..word_part
						else
						break_next = break_next..word_part
						end
					end
				break_next = mag.trim.left(break_next)
				line.text  = mag.format("%s\\N%s", break_prev, break_next)
				end
			end
		end
		if pcs then
		subs[index] = line
		end
	end
	if pcs then
	mag.show.log(mag.string.format(c_lang.key1,
	counter["line_type1"] + counter["line_type2"] + counter["line_type3"],
	counter["line_type1"],
	counter["line_type2"],
	counter["line_type3"]
	))
	end
	mag.show.no_op(pcs)
	end

	function len(s)
	s = mag.strip.bracket(s)
	s = strip_special(s)
	if c.space_and_punc then
	s = mag.strip.space(s)
	s = mag.strip.punc(s)
	end
	return mag.convert.len(s)
	end

	function strip_special(str)
	str = mag.gsub(str, "\\[nN]", "")
	str = mag.gsub(str, "\\h",    " ")
	return str
	end

	function strip_dash(s)
	return s:gsub("["..mag.pattern.letter..mag.pattern.number.."]%-", ""):gsub("%-["..mag.pattern.letter..mag.pattern.number.."]", "")
	end

	function add_macro1(subs,sel)
	local apply_items           = mag.list.full_apply(subs, sel, "comment")
	c.apply_lines               = mag.array.search_apply(apply_items, c.apply_lines)
	gui.main1.apply_lines.items = apply_items
	if c.top_words == "" then c.top_words = c_lang.topWordsDefault end
	if c.bottom_words == "" then c.bottom_words = c_lang.bottomWordsDefault end
	local ok, config
	repeat
	mag.config.put(gui.main1)
	ok, config = mag.window.dialog(gui.main1, c_buttons1)
	mag.config.take(config)
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply_lines ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
	break_line(subs, sel)
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
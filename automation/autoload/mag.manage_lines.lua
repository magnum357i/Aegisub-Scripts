	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Satır Yönet", sub_menu = "Satır/Yönet"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Manage Lines",    sub_menu = "Lines/Manage"}
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
	in_lang["s_desc"]              = "Çeşitli düzenleme işlerini kolaylaştırır."
	in_lang["guiLabel1"]           = "Aktif satırla aynı stildeki satırları ara"
	in_lang["guiLabel2"]           = "Önceki satır"
	in_lang["guiLabel3"]           = "Sonraki satır"
	in_lang["guiLabel4"]           = "Boşlukları ve noktalama işaretlerini yoksay"
	in_lang["guiLabel7"]           = "Hedef:"
	in_lang["guiLabel8"]           = "Önceki: {%s} ms"
	in_lang["guiLabel9"]           = "Sonraki: {%s} ms"
	in_lang["guiLabel10"]          = "Fad değeri:"
	in_lang["guiLabel11"]          = "Etiketler:"
	in_lang["guiLabel12"]          = "Önceki etiketleri sil"
	in_lang["guiHintKey1"]         = "Çoklu seçimde etkisi yoktur: senkron çoklu seçimi, biçim, kaydırma."
	in_lang["guiHintKey2"]         = "Satır başındaki ilk parantezi siler."
	in_lang["guiHintKey3"]         = "Öbür parametre de sıfır ayarlanırsa satırdaki fad etiketini siler."
	in_lang["buttonKey1"]          = "Birleştir"
	in_lang["buttonKey2"]          = "Ayır"
	in_lang["buttonKey3"]          = "Böl"
	in_lang["buttonKey4"]          = "Senkronla"
	in_lang["buttonKey5"]          = "Biçim ver"
	in_lang["buttonKey6"]          = "Kaydır"
	in_lang["buttonKey7"]          = "Kapat"
	in_lang["buttonKey8"]          = "Sol"
	in_lang["buttonKey9"]          = "Orta"
	in_lang["buttonKey10"]         = "Sağ"
	in_lang["buttonKey11"]         = "Geri"
	in_lang["buttonKey12"]         = "Şimdi ayır"
	in_lang["buttonKey13"]         = "-"
	in_lang["buttonKey14"]         = "\\N"
	in_lang["buttonKey15"]         = "Boşluk"
	in_lang["buttonKey17"]         = "Sonraki"
	in_lang["buttonKey18"]         = "Önceki"
	in_lang["buttonKey19"]         = "Eğiklik ver"
	in_lang["buttonKey20"]         = "Yukarı al"
	in_lang["buttonKey21"]         = "Fad ver"
	in_lang["buttonKey22"]         = "Etiket ekle"
	in_lang["buttonKey23"]         = "Temizle"
	in_lang["buttonKey24"]         = "Kaydır"
	in_lang["errorKey1"]           = "Önceki satır yok."
	in_lang["errorKey3"]           = "Sonraki satır yok."
	in_lang["errorKey4"]           = "Satır çok kısa."
	in_lang["tabKey1"]             = "Hepsi"
	in_lang["tabKey2"]             = "Notlar"
	in_lang["key1"]                = "SOL"
	in_lang["key2"]                = "ORTA"
	in_lang["key3"]                = "SAĞ"
	in_lang["f1"]                  = "{%s} / {%s}\n----------"
	in_lang["f2"]                  = "{%s}\n----------"
	in_lang["progressKey1"]        = "İşlem yapılıyor..."
	in_lang["warningKey1"]         = "Fad değerlerinden en az biri 0'dan büyük olmalıdır."
	in_lang["warningKey2"]         = "Satırda ne pos etiketi ne de move etiketi var."
	in_lang["notes"]               =
	"[Biçim ver]\nEğiklik ve üste al komutlarında o işlevi yapan komut yoksa onu ekler. Varsa da siler. fad etiketi değerlerinin her ikisi de 0'sa fad etiketini siler."
	.."\n\n[Senkronla]\nHem çoklu -birden fazla satırı seçerseniz- hem de tekil kullanımlar içindir."
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Facilitates various editing works."
	in_lang["guiLabel1"]           = "Search for the lines with same style of active line"
	in_lang["guiLabel2"]           = "Previous line"
	in_lang["guiLabel3"]           = "Next line"
	in_lang["guiLabel4"]           = "Ignore whitespaces and punctuations"
	in_lang["guiLabel7"]           = "Target:"
	in_lang["guiLabel8"]           = "Prev: {%s} ms"
	in_lang["guiLabel9"]           = "Next: {%s} ms"
	in_lang["guiLabel10"]          = "Fad value:"
	in_lang["guiLabel11"]          = "Tags:"
	in_lang["guiLabel12"]          = "Delete the previous tags"
	in_lang["guiHintKey1"]         = "Does not apply in multi selections: multi mode of combine, format, shifter."
	in_lang["guiHintKey2"]         = "Deletes the first parenthesis at the beginning of the line."
	in_lang["guiHintKey3"]         = "If the other parameter is also set to zero, deletes the fad tag of the line."
	in_lang["buttonKey1"]          = "Merge"
	in_lang["buttonKey2"]          = "Split"
	in_lang["buttonKey3"]          = "Break"
	in_lang["buttonKey4"]          = "Combine"
	in_lang["buttonKey5"]          = "Format"
	in_lang["buttonKey6"]          = "Shifter"
	in_lang["buttonKey7"]          = "Close"
	in_lang["buttonKey8"]          = "Left"
	in_lang["buttonKey9"]          = "Center"
	in_lang["buttonKey10"]         = "Right"
	in_lang["buttonKey11"]         = "Back"
	in_lang["buttonKey12"]         = "Split now"
	in_lang["buttonKey13"]         = "-"
	in_lang["buttonKey14"]         = "\\N"
	in_lang["buttonKey15"]         = "Space"
	in_lang["buttonKey17"]         = "Next"
	in_lang["buttonKey18"]         = "Prev"
	in_lang["buttonKey19"]         = "Italic"
	in_lang["buttonKey20"]         = "Top"
	in_lang["buttonKey21"]         = "Fad"
	in_lang["buttonKey22"]         = "Add tags"
	in_lang["buttonKey23"]         = "Strip"
	in_lang["buttonKey24"]         = "Shift"
	in_lang["buttonKey25"]         = "Replace"
	in_lang["errorKey1"]           = "Previous line not exists."
	in_lang["errorKey3"]           = "Next line not exists."
	in_lang["errorKey4"]           = "Line is too short."
	in_lang["tabKey1"]             = "All"
	in_lang["tabKey2"]             = "Notes"
	in_lang["tabKey3"]             = "Shift"
	in_lang["tabKey4"]             = "Right (1px)"
	in_lang["tabKey5"]             = "Left (1px)"
	in_lang["tabKey6"]             = "Top (1px)"
	in_lang["tabKey7"]             = "Bottom (1px)"
	in_lang["tabKey8"]             = "Actions"
	in_lang["tabKey9"]             = "Italic"
	in_lang["tabKey10"]            = "Top"
	in_lang["tabKey11"]            = "Fad"
	in_lang["tabKey12"]            = "Tags"
	in_lang["key1"]                = "LEFT"
	in_lang["key2"]                = "CENTER"
	in_lang["key3"]                = "RIGHT"
	in_lang["f1"]                  = "{%s} / {%s}\n----------"
	in_lang["f2"]                  = "{%s}\n----------"
	in_lang["progressKey1"]        = "Processing..."
	in_lang["warningKey1"]         = "Start and end of fad must be higher than 0."
	in_lang["warningKey2"]         = "There is no pos and move tag on the line."
	in_lang["notes"]               =
	"[Format]\nClicking the button of the italic and top, adds if there is no command that makes that view. Deletes if it is. If the values of fad tag are 0, then the fad tag will be deleted."
	.."\n\n[Combine]\nIt is for both multiple (if you select more than one line) and single uses."
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
	script_version      = "1.1.1"
	script_author       = "Magnum357"
	script_mag_version  = "1.1.5.0"
	script_file_name    = "mag.manage_lines"
	script_file_ext     = ".lua"

	include_unicode     = true
	include_clipboard   = true
	include_karaskel    = true
	mag_import, mag     = pcall(require, "mag")

	if mag_import then
	mag.lang            = c_lang_switch

	c_lock_gui          = false
	c_buttons1          = {c_lang.buttonKey1, c_lang.buttonKey2, c_lang.buttonKey3, c_lang.buttonKey4, c_lang.buttonKey5, c_lang.buttonKey6, c_lang.buttonKey25, c_lang.buttonKey7}
	c_buttons2          = {c_lang.buttonKey8, c_lang.buttonKey9, c_lang.buttonKey10}
	c_buttons3          = {c_lang.buttonKey12}
	c_buttons4          = {c_lang.buttonKey13, c_lang.buttonKey14, c_lang.buttonKey15}
	c_buttons5          = {c_lang.buttonKey19, c_lang.buttonKey20, c_lang.buttonKey21, c_lang.buttonKey22, c_lang.buttonKey23}
	c_buttons6          = {c_lang.buttonKey24}
	c_centerline        = 0

	c                   = {}
	c.samestyle         = true
	c.space_and_punc    = false
	c.ml_target         = c_lang.guiLabel2
	c.fl_fads           = 0
	c.fl_fade           = 0
	c.fl_fads           = 0
	c.fl_tags           = ""
	c.fl_tagreset       = false
	c.sl_posx           = 0
	c.sl_posy           = 0
	c.sl_movex          = 0
	c.sl_movey          = 0
	c.commentmode       = true

	gui                 = {
		main1 = {
		samestyle      = {class = "checkbox", name = "samestyle",      x = 0, y = 0, width = 3, height = 1, label = c_lang.guiLabel1, hint = c_lang.guiHintKey1},
		commentmode    = {class = "checkbox", name = "commentmode",    x = 0, y = 1, width = 3, height = 1, label = mag.window.lang.message("comment_mode")},
		space_and_punc = {class = "checkbox", name = "space_and_punc", x = 0, y = 2, width = 3, height = 1, label = c_lang.guiLabel4},
		},
		main2 = {
		example1       = {class = "label",                             x = 0, y = 0, width = 1, height = 1},
		example2       = {class = "label",                             x = 0, y = 2, width = 1, height = 1},
		example3       = {class = "label",                             x = 0, y = 4, width = 1, height = 1},
		ml_target      = {class = "dropdown", name = "ml_target",      x = 0, y = 6, width = 1, height = 1, items = {c_lang.guiLabel2, c_lang.guiLabel3}, value = c.ml_target},
		},
		main3 = {
		              {class = "label",                                x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabel10},
		fl_fads     = {class = "intedit",      name = "fl_fads",       x = 1, y = 0, width = 1, height = 1, hint = c_lang.guiHintKey3},
		fl_fade     = {class = "intedit",      name = "fl_fade",       x = 2, y = 0, width = 1, height = 1, hint = c_lang.guiHintKey3},
		              {class = "label",                                x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabel11},
		fl_tags     = {class = "edit",         name = "fl_tags",       x = 1, y = 1, width = 1, height = 1},
		fl_tagreset = {class = "checkbox",     name = "fl_tagreset",   x = 2, y = 1, width = 1, height = 1, label = c_lang.guiLabel12, hint = c_lang.guiHintKey2},
		},
		main4 = {
		             {class = "label",                                 x = 1, y = 0, width = 1, height = 1, label = "X"},
		             {class = "label",                                 x = 2, y = 0, width = 1, height = 1, label = "Y"},
		             {class = "label",                                 x = 0, y = 1, width = 1, height = 1, label = "\\pos"},
		sl_posx    = {class = "intedit",      name = "sl_posx",        x = 1, y = 1, width = 1, height = 1},
		sl_posy    = {class = "intedit",      name = "sl_posy",        x = 2, y = 1, width = 1, height = 1},
		             {class = "label",                                 x = 0, y = 2, width = 1, height = 1, label = "\\move"},
		sl_movex   = {class = "intedit",      name = "sl_movex",       x = 1, y = 2, width = 1, height = 1},
		sl_movey   = {class = "intedit",      name = "sl_movey",       x = 2, y = 2, width = 1, height = 1},
		}
	}
	end

	function mergeline_gui(subs,sel,act,mode)
	local buttons = mag.array.merge({}, c_buttons4)
	if mode == "multi" then mag.array.insert(buttons, c_lang.buttonKey11) else mag.array.insert(buttons, c_lang.buttonKey7) end
	if subs[act - 1].class ~= "dialogue" and c.ml_target == c_lang.guiLabel2 then
	return mag.window.dialog({{class = "label", x = 0, y = 0, width = 1, height = 1, label = c_lang.errorKey1}}, {c_lang.buttonKey11})
	elseif act == #subs and c.ml_target == c_lang.guiLabel3 then
	return mag.window.dialog({{class = "label", x = 0, y = 0, width = 1, height = 1, label = c_lang.errorKey3}}, {c_lang.buttonKey11})
	else
	local line1, line2
		if c.ml_target == c_lang.guiLabel2 then
		line1 = find_prevline(subs,sel,act)
		line2 = subs[act]
		elseif c.ml_target == c_lang.guiLabel3 then
		line1 = subs[act]
		line2 = find_nextline(subs,sel,act)
		end
	gui.main2.example1.label = mag.string.format(c_lang.f2, c_buttons4[1]).."\n- "..line1.text.."\n- "..line2.text
	gui.main2.example2.label = mag.string.format(c_lang.f2, c_buttons4[2]).."\n"..line1.text.."\n"..line2.text
	gui.main2.example3.label = mag.string.format(c_lang.f2, c_buttons4[3]).."\n"..line1.text.." "..line2.text
	return mag.window.dialog(gui.main2, buttons)
	end
	end

	function mergeline(subs,sel,act,ok)
	local line, templine, tempindex, jump
	local pcs = false
	line      = subs[act]
	if subs[act - 1].class == "dialogue" and c.ml_target == c_lang.guiLabel2 then
	templine, tempindex = find_prevline(subs,sel,act)
	if templine.start_time < line.start_time then line.start_time = templine.start_time end
	if templine.end_time   > line.end_time   then line.end_time   = templine.end_time   end
		if ok == c_buttons4[1] then
		line.text = "- "..remove_breakline(templine.text).."\\N- "..remove_breakline(line.text)
		elseif ok == c_buttons4[2] then
		line.text = remove_breakline(templine.text).."\\N"..remove_breakline(line.text)
		else
		line.text = templine.text.." "..line.text
		end
	pcs             = true
	subs[tempindex] = line
	jump            = tempindex
	mag.line.delete(subs, {act})
	elseif act < #subs and c.ml_target == c_lang.guiLabel3 then
	templine, tempindex = find_nextline(subs,sel,act)
	if templine.start_time < line.start_time then line.start_time = templine.start_time end
	if templine.end_time   > line.end_time   then line.end_time   = templine.end_time   end
		if ok == c_buttons4[1] then
		line.text = "- "..remove_breakline(line.text).."\\N- "..remove_breakline(templine.text)
		elseif ok == c_buttons4[2] then
		line.text = remove_breakline(line.text).."\\N"..remove_breakline(templine.text)
		else
		line.text = line.text.." "..templine.text
		end
	pcs       = true
	subs[act] = line
	jump      = act
	mag.line.delete(subs, {tempindex})
	end
	mag.show.no_op(pcs)
	if jump ~= nil and pcs then return {jump} end
	end

	function splitline_gui(subs,sel,act,mode)
	local buttons = mag.array.merge({}, c_buttons3)
	if mode == "multi" then mag.array.insert(buttons, c_lang.buttonKey11) else mag.array.insert(buttons, c_lang.buttonKey7) end
	local slgui       = {}
	local line        = subs[act]
	local text        = line.text
	text              = mag.strip.all(text)
	text              = mag.trim.all(text)
	local words       = mag.string.words(text)
	if #words <= 4 then
	mag.array.insert(slgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label = c_lang.errorKey4})
	return mag.window.dialog(slgui, {c_lang.buttonKey11})
	else
		local count, yvar, maxword = 0, 0, 10
		for h = 1, #words - 1 do
			if count == maxword then
			yvar  = yvar + 1
			count = 0
			end
			if h == 1 or h == #words - 1 then
			mag.array.insert(slgui, {class = "label", x = count, y = yvar, width = 1, height = 1, label = mag.trim.left(words[h])})
			else
			mag.array.insert(slgui, {class = "checkbox", name = h, x = count, y = yvar, width = 1, height = 1, label = mag.trim.left(words[h])})
			end
		count = count + 1
		end
	return mag.window.dialog(slgui, buttons)
	end
	end

	function splitline(subs,sel,act,config)
	local pcs       = false
	local splitword = 0
	local line      = subs[act]
	local words     = mag.string.words(line.text)
	for key, value in pairs(config) do
		if value then
		splitword = mag.n(key)
		break
		end
	end
	local prevline, nextline = "", ""
	for w = 1, #words do
		if w <= splitword then
		prevline = prevline..words[w]
		else
		if not pcs then pcs = true end
		nextline            = nextline..words[w]
		end
	end
	local durt      = line.end_time - line.start_time
	local startt    = line.start_time
	local endt      = line.end_time
	line.end_time   = startt + durt / 2
	line.text       = mag.trim.right(remove_breakline(prevline))
	subs[act]       = line
	line.start_time = startt + durt / 2
	line.end_time   = endt
	line.text       = mag.trim.left(remove_breakline(nextline))
	subs.insert(act + 1, line)
	mag.show.no_op(pcs)
	end

	function breakline_gui(subs,sel,act,mode)
	local buttons = mag.array.merge({}, c_buttons2)
	if mode == "multi" then mag.array.insert(buttons, c_lang.buttonKey11) else mag.array.insert(buttons, c_lang.buttonKey7) end
	local blgui       = {}
	local line        = subs[act]
	local text        = line.text
	text              = mag.strip.all(text)
	text              = mag.trim.all(text)
	local words       = mag.string.words(text)
	local text_len    = len(line.text)
	local half_len    = text_len / 2
	local lent        = 0
	local centerword  = 0
	local precount    = 0
	local currentdiff = 0
	for w = 1, #words do
	precount        = precount + len(words[w])
	local nextcount = text_len - precount
	local diff      = mag.convert.positive(precount - nextcount)
		if w == 1 then
		currentdiff = diff
		centerword  = w
		else
			if diff < currentdiff then
			currentdiff = diff
			centerword  = w
			end
		end
	end
	if #words <= 4 then
	mag.array.insert(blgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label = c_lang.errorKey4})
	return mag.window.dialog(blgui, {c_lang.buttonKey11})
	else
	c_centerline = centerword
	mag.array.insert(blgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label = mag.string.format(c_lang.f1, c_lang.key1, calc_maxlen(centerword - 1, words)).."\n"..preview_line(centerword - 1, words)})
	mag.array.insert(blgui, {class = "label", x = 0, y = 2, width = 1, height = 1, label = mag.string.format(c_lang.f1, c_lang.key2, calc_maxlen(centerword,     words)).."\n"..preview_line(centerword,     words)})
	mag.array.insert(blgui, {class = "label", x = 0, y = 4, width = 1, height = 1, label = mag.string.format(c_lang.f1, c_lang.key3, calc_maxlen(centerword + 1, words)).."\n"..preview_line(centerword + 1, words)})
	return mag.window.dialog(blgui, buttons)
	end
	end

	function breakline(subs,sel,act,ok)
	local pcs        = false
	local line       = subs[act]
	local text       = remove_breakline(line.text)
	local words      = mag.string.words(text)
	local centerword = c_centerline
	c_centerline     = 0
	if ok == c_buttons2[1] then
	centerword = centerword - 1
	elseif ok == c_buttons2[3] then
	centerword = centerword + 1
	end
	local prevline, nextline = "", ""
	for w = 1, #words do
		if w <= centerword then
		prevline = prevline..words[w]
		else
		if not pcs then pcs = true end
		nextline            = nextline..words[w]
		end
	end
	line.text = prevline.."\\N"..mag.trim.left(nextline)
	subs[act] = line
	mag.show.no_op(pcs)
	end

	function combineline_gui(subs,sel,act,mode)
	local button
	if mode == "multi" then button = c_lang.buttonKey11 else button = c_lang.buttonKey7 end
	if #sel == 1 then
	local clgui = {}
	local line  = subs[act]
		if subs[act - 1].class ~= "dialogue" then
		local nextline, nextindex = find_nextline(subs,sel,act)
		mag.array.insert(clgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label =  mag.string.format(c_lang.guiLabel9, mag.convert.positive((nextline.start_time - line.end_time) / 10))})
		return mag.window.dialog(clgui, {c_lang.buttonKey17, button})
		elseif act == #subs then
		local prevline, previndex = find_prevline(subs,sel,act)
		mag.array.insert(clgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label =  mag.string.format(c_lang.guiLabel8, mag.convert.positive((line.start_time - prevline.end_time) / 10))})
		return mag.window.dialog(clgui, {c_lang.buttonKey18, button})
		else
		local prevline, previndex = find_prevline(subs,sel,act)
		local nextline, nextindex = find_nextline(subs,sel,act)
		mag.array.insert(clgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label =  mag.string.format(c_lang.guiLabel8, mag.convert.positive((line.start_time - prevline.end_time) / 10))})
		mag.array.insert(clgui, {class = "label", x = 0, y = 1, width = 1, height = 1, label =  mag.string.format(c_lang.guiLabel9, mag.convert.positive((nextline.start_time - line.end_time) / 10))})
		return mag.window.dialog(clgui, {c_lang.buttonKey18, c_lang.buttonKey17, button})
		end
	else
	return " ", {}
	end
	end

	function combineline(subs,sel,act,ok)
	local pcs = false
	if #sel == 1 then
	local line = subs[act]
		if ok == c_lang.buttonKey18 then
		local prevline, previndex = find_prevline(subs,sel,act)
		prevline.end_time = line.start_time
		subs[previndex]   = prevline
		pcs               = true
		elseif ok == c_lang.buttonKey17 then
		local nextline, nextindex = find_nextline(subs,sel,act)
		line.end_time = nextline.start_time
		subs[act]     = line
		pcs           = true
		end
	else
	local lastindex, prevline, line, index
	local lines_index = mag.line.index(subs, sel, mag.window.lang.message("selected_lines"), c.commentmode, true)
	mag.window.task(c_lang.progressKey1)
		for i = 1, #lines_index do
		mag.window.progress(i, #lines_index)
		local cancel = aegisub.progress.is_cancelled()
		if cancel then break end
		index = lines_index[i]
		line  = subs[index]
			if lastindex ~= nil then
			prevline = subs[lastindex]
				if prevline.end_time ~= line.start_time then
				if pcs == false then pcs = true end
				prevline.end_time = line.start_time
				subs[lastindex]   = prevline
				end
			end
		lastindex = index
		end
	if pcs then return lines_index end
	end
	mag.show.no_op(pcs)
	end

	function formatline_gui(subs,sel,act,mode)
	local buttons = mag.array.merge({}, c_buttons5)
	if mode == "multi" then mag.array.insert(buttons, c_lang.buttonKey11) else mag.array.insert(buttons, c_lang.buttonKey7) end
	return mag.window.dialog(gui.main3, buttons)
	end

	function formatline(subs,sel,act,ok)
	local pcs         = false
	local lines_index = mag.line.index(subs, sel, mag.window.lang.message("selected_lines"), c.commentmode, true)
	mag.window.task(c_lang.progressKey1)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	index = lines_index[i]
	line  = subs[index]
	if not pcs then pcs = true end
		if ok == c_lang.buttonKey19 then
		line.text = removetag_atfirst(line.text, "i0")
		line.text = toggletag(line.text, "i1", "i1")
		elseif ok == c_lang.buttonKey20 then
		line.text = toggletag(line.text, "an[1-9]", "an8")
		elseif ok == c_lang.buttonKey21 then
		line.text = removetag_atfirst(line.text, "fad%(%s*%d+%s*,%s*%d+%s*%)")
			if c.fl_fads > 0 or c.fl_fade > 0 then
			line.text = toggletag(line.text, "fad%(%s*%d+%s*,%s*%d+%s*%)", mag.string.format("fad({%s},{%s})", c.fl_fads, c.fl_fade))
			end
		elseif ok == c_lang.buttonKey22 then
			if mag.match(line.text, "^%s*{") then
			if c.fl_tagreset then line.text = mag.gsub(line.text, "{[^}]*}", "{}") end
			line.text = mag.gsub(line.text, "{", "{"..c.fl_tags, 1)
			else
			line.text = mag.string.format("{{%s}}", c.fl_tags)..line.text
			end
		elseif ok == c_lang.buttonKey23 then
		line.text = mag.gsub(line.text, "{[^}]+}", "")
		end
	if pcs then subs[index] = line end
	end
	if ok == c_lang.buttonKey21 and c.fl_fads == 0 and c.fl_fade == 0 then mag.show.log(2, c_lang.warningKey1) end
	mag.show.no_op(pcs)
	end

	function shifterline_gui(subs,sel,act,mode)
	local buttons = mag.array.merge({}, c_buttons6)
	if mode == "multi" then mag.array.insert(buttons, c_lang.buttonKey11) else mag.array.insert(buttons, c_lang.buttonKey7) end
	return mag.window.dialog(gui.main4, buttons)
	end

	function shifterline(subs,sel,act,ok)
	local pcs = false
	local lines_index = mag.line.index(subs, sel, mag.window.lang.message("selected_lines"), c.commentmode, true)
	mag.window.task(c_lang.progressKey1)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	index = lines_index[i]
	line  = subs[index]
		if mag.match(line.text, "\\pos%(%-?%d*%.?%d*,%-?%d*%.?%d*%)") then
		local posx, posy = mag.match(line.text, "\\pos%((%-?%d*%.?%d*),(%-?%d*%.?%d*)%s*%)")
			if posx ~= nil then
			if not pcs then pcs = true end
			line.text = mag.gsub(line.text, "\\pos%([^%)]+%)", mag.string.format("\\pos({%s},{%s})", posx + c.sl_posx, posy + c.sl_posy))
			end
		elseif mag.match(line.text, "\\move%(%-?%d*%.?%d*,%-?%d*%.?%d*,%-?%d*%.?%d*,%-?%d*%.?%d*") then
		local movex1, movey1, movex2, movey2 = mag.match(line.text, "\\move%((%-?%d*%.?%d*),(%-?%d*%.?%d*),(%-?%d*%.?%d*),(%-?%d*%.?%d*)")
			if movex1 ~= nil then
			if not pcs then pcs = true end
			line.text = mag.gsub(line.text, "\\move%(%-?%d*%.?%d*,%-?%d*%.?%d*,%-?%d*%.?%d*,%-?%d*%.?%d*", mag.string.format("\\move({%s},{%s},{%s},{%s}", movex1 + c.sl_movex, movey1 + c.sl_movey, movex2 + c.sl_movex, movey2 + c.sl_movey))
			end
		else
		mag.show.log(2, c_lang.warningKey2)
		end
	if pcs then subs[index] = line end
	end
	mag.show.no_op(pcs)
	end

	function replacetext(oldtext, newtext)
	return newtext
	end

	function replaceline(subs,sel)
	local pcs = false
	local lines_index = mag.line.index(subs, sel, mag.window.lang.message("all_lines"), true, true)
	mag.window.task(c_lang.progressKey1)
	for i = 1, #lines_index do
	mag.window.progress(i, #lines_index)
	local cancel = aegisub.progress.is_cancelled()
	if cancel then break end
	index = lines_index[i]
	line  = subs[index]
		if mag.match(line.text, "{%*}[^{]*{%*[^}]*}") then
		if pcs == false then pcs = true end
		line.text = mag.gsub(line.text, "{%*}([^{]+){%*([^}]+)}", replacetext)
		end
	if pcs then subs[index] = line end
	end
	mag.show.no_op(pcs)
	end

	function toggletag(text,regex,tag)
	if not mag.match(mag.gsub(text, "}%s*{",""), "^%s*{[^}]*\\"..regex) then
		if mag.match(text, "^%s*{") then
		text = mag.gsub(text, "{", "{\\"..tag, 1)
		else
		text = "{\\"..tag.."}"..text
		end
	else
	text = removetag_atfirst(text, regex)
	end
	return text
	end

	function removetag_atfirst(text,regex)
	if mag.match(mag.gsub(text, "}%s*{",""), "^%s*{[^}]*\\"..regex) then
	text = mag.gsub(text, "\\"..regex, "", 1)
	text = mag.gsub(text, "{%s*}", "")
	end
	return text
	end

	function find_prevline(subs,sel,act)
	local style, prevline, previndex
	if c.samestyle then style = subs[act].style end
	for i = act - 1, 1, -1 do
		if subs[i].class == "dialogue" then
			if mag.is.line.empty(subs[i]) == false and (c.commentmode == false or c.commentmode == true and not mag.is.line.comment(subs[i])) and (c.samestyle and subs[i].style == style or not c.samestyle) then
			prevline  = subs[i]
			previndex = i
			break
			end
		else
		break
		end
	end
	return prevline, previndex
	end

	function find_nextline(subs,sel,act)
	local style, nextline, nextindex
	if c.samestyle then style = subs[act].style end
	for i = act + 1, #subs do
		if subs[i].class == "dialogue" then
			if mag.is.line.empty(subs[i]) == false and (c.commentmode == false or c.commentmode == true and not mag.is.line.comment(subs[i])) and (c.samestyle and subs[i].style == style or not c.samestyle) then
			nextline  = subs[i]
			nextindex = i
			break
			end
		end
	end
	return nextline, nextindex
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

	function rawline(text)
	return mag.strip.all(text)
	end

	function remove_breakline(text)
	text = mag.gsub(text, "%s\\N", " ")
	text = mag.gsub(text, "\\N%s", " ")
	text = mag.gsub(text, "\\N",   " ")
	return text
	end

	function preview_line(numb,words)
	local pline, nline = "", ""
	for w = 1, #words do
		if w <= numb then
		pline = pline..words[w]
		else
		nline = nline..words[w]
		end
	end
	return mag.strip.all(pline).."\n"..mag.strip.all(nline)
	end

	function calc_maxlen(numb,words)
	local pline, nline = "", ""
	for w = 1, #words do
		if w <= numb then
		pline = pline..words[w]
		else
		nline = nline..words[w]
		end
	end
	local plen, nlen = len(pline), len(nline)
	if plen > nlen then return plen else return nlen end
	end

	function add_macro1(subs,sel,act)
	local ok, config, guiselect
	repeat
	mag.config.put(gui.main1)
	if ok == mag.convert.ascii(c_buttons1[1]) then
	mag.config.put(gui.main2)
	guiselect = "merge"
	ok, config = mergeline_gui(subs, sel, act, "multi")
	elseif ok == mag.convert.ascii(c_buttons1[2]) then
	guiselect = "split"
	ok, config = splitline_gui(subs, sel, act, "multi")
	elseif ok == mag.convert.ascii(c_buttons1[3]) then
	guiselect = "break"
	ok, config = breakline_gui(subs, sel, act, "multi")
	elseif ok == mag.convert.ascii(c_buttons1[4]) then
	guiselect = "combine"
	ok, config = combineline_gui(subs, sel, act, "multi")
	elseif ok == mag.convert.ascii(c_buttons1[5]) then
	mag.config.put(gui.main3)
	guiselect = "format"
	ok, config = formatline_gui(subs, sel, act, "multi")
	elseif ok == mag.convert.ascii(c_buttons1[6]) then
	mag.config.put(gui.main4)
	guiselect = "shifter"
	ok, config = shifterline_gui(subs, sel, act, "multi")
	else
	guiselect = ""
	ok, config = mag.window.dialog(gui.main1, c_buttons1)
	end
	mag.config.take(config)
	until
	ok ~= mag.convert.ascii(c_lang.buttonKey1)
	and
	ok ~= mag.convert.ascii(c_lang.buttonKey2)
	and
	ok ~= mag.convert.ascii(c_lang.buttonKey3)
	and
	ok ~= mag.convert.ascii(c_lang.buttonKey4)
	and
	ok ~= mag.convert.ascii(c_lang.buttonKey5)
	and
	ok ~= mag.convert.ascii(c_lang.buttonKey6)
	and
	ok ~= mag.convert.ascii(c_lang.buttonKey11)
	if guiselect == "merge" then
	return mergeline(subs, sel, act, ok)
	elseif guiselect == "split" then
	return splitline(subs, sel, act, config)
	elseif guiselect == "break" then
	return breakline(subs, sel, act, ok)
	elseif guiselect == "combine" then
	return combineline(subs, sel, act, ok)
	elseif guiselect == "format" then
	return formatline(subs, sel, act, ok)
	elseif guiselect == "shifter" then
	return shifterline(subs, sel, act, ok)
	elseif ok == mag.convert.ascii(c_lang.buttonKey25) then
	return replaceline(subs, sel)
	end
	end

	function add_macro2(subs,sel)
	mag.show.log(c_lang.notes)
	end

	function add_macro3(subs,sel)
	local selected_lines = mag.index.sel(subs, sel)
	local return_index   = {}
	local pcs            = false
	for i = 1, #selected_lines do
	index = selected_lines[i]
	line  = subs[index]
	local istag, changedtext = shiftxy(line.text,1,0)
	if istag == true then line.text = changedtext end
	subs[index] = line
	end
	end

	function add_macro4(subs,sel)
	local selected_lines = mag.index.sel(subs, sel)
	local return_index   = {}
	local pcs            = false
	for i = 1, #selected_lines do
	index = selected_lines[i]
	line  = subs[index]
	local istag, changedtext = shiftxy(line.text,-1,0)
	if istag == true then line.text = changedtext end
	subs[index] = line
	end
	end

	function add_macro5(subs,sel)
	local selected_lines = mag.index.sel(subs, sel)
	local return_index   = {}
	local pcs            = false
	for i = 1, #selected_lines do
	index = selected_lines[i]
	line  = subs[index]
	local istag, changedtext = shiftxy(line.text,0,1)
	if istag == true then line.text = changedtext end
	subs[index] = line
	end
	end

	function add_macro6(subs,sel)
	local selected_lines = mag.index.sel(subs, sel)
	local return_index   = {}
	local pcs            = false
	for i = 1, #selected_lines do
	index = selected_lines[i]
	line  = subs[index]
	local istag, changedtext = shiftxy(line.text,0,-1)
	if istag == true then line.text = changedtext end
	subs[index] = line
	end
	end

	function shiftxy(text,x,y)
	local istag = false
	local posx, posy = mag.match(line.text, "\\pos%((%-?%d*%.?%d*),(%-?%d*%.?%d*)%s*%)")
	if posx ~= nil then
	istag = true
	text  = mag.gsub(line.text, "\\pos%([^%)]+%)", mag.string.format("\\pos({%s},{%s})", posx + x, posy + y))
	else
		local movex1, movey1, movex2, movey2 = mag.match(line.text, "\\move%((%-?%d*%.?%d*),(%-?%d*%.?%d*),(%-?%d*%.?%d*),(%-?%d*%.?%d*)")
		if movex1 ~= nil then
		istag = true
		text  = mag.gsub(line.text, "\\move%(%-?%d*%.?%d*,%-?%d*%.?%d*,%-?%d*%.?%d*,%-?%d*%.?%d*", mag.string.format("\\move({%s},{%s},{%s},{%s}", movex1 + x, movey1 + y, movex2 + x, movey2 + y))
		end
	end
	return istag, text
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
	return fee
	end
	end

	function check_macro2(subs,sel,act)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro8, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.config.set(c)
	return fee
	end
	end

	function check_macro3(subs,sel,act)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro3, subs, sel, act)
	mag.window.funce(fe, fee)
	end
	end

	function check_macro4(subs,sel,act)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro4, subs, sel, act)
	mag.window.funce(fe, fee)
	end
	end

	function check_macro5(subs,sel,act)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro5, subs, sel, act)
	mag.window.funce(fe, fee)
	end
	end

	function check_macro6(subs,sel,act)
	mag.window.task()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro6, subs, sel, act)
	mag.window.funce(fe, fee)
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
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey8.."/"..c_lang.tabKey3.."/"..c_lang.tabKey4, check_macro3)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey8.."/"..c_lang.tabKey3.."/"..c_lang.tabKey5, check_macro4)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey8.."/"..c_lang.tabKey3.."/"..c_lang.tabKey6, check_macro5)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey8.."/"..c_lang.tabKey3.."/"..c_lang.tabKey7, check_macro6)
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..c_lang.tabKey2, check_macro2)
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end

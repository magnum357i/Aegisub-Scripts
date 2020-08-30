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
	in_lang["guiLabel1"]           = "Aynı stildeki satırları ara"
	in_lang["guiLabel4"]           = "Boşlukları ve noktalama işaretlerini yoksay"
	in_lang["guiLabel5"]           = "Uygula: geçerli satır"
	in_lang["guiLabel6"]           = "Please select one of the following.\n\nthis = the time of the current line\nprev = the end time of the previous line\nnext = the start time of the next line\n\nTime difference: {%s} ms"
	in_lang["guiHint1"]            = "If checked, it operates the lines with the style the active line."
	in_lang["buttonKey1"]          = "Birleştir (P)"
	in_lang["buttonKey2"]          = "Birleştir (N)"
	in_lang["buttonKey3"]          = "Ayır"
	in_lang["buttonKey4"]          = "Böl"
	in_lang["buttonKey5"]          = "Senkronla (P)"
	in_lang["buttonKey6"]          = "Senkronla (N)"
	in_lang["buttonKey7"]          = "Kapat"
	in_lang["buttonKey8"]          = "Sol"
	in_lang["buttonKey9"]          = "Orta"
	in_lang["buttonKey10"]         = "Sağ"
	in_lang["buttonKey11"]         = "Geri"
	in_lang["buttonKey12"]         = "Şimdi ayır"
	in_lang["buttonKey13"]         = "-"
	in_lang["buttonKey14"]         = "\\N"
	in_lang["buttonKey15"]         = " "
	in_lang["buttonKey16"]         = "Buna"
	in_lang["buttonKey17"]         = "Sonrakine"
	in_lang["buttonKey18"]         = "Öncekine"
	in_lang["errorKey1"]           = "Önceki satır yok"
	in_lang["errorKey2"]           = "Geçerli satır yorum satırı veya boş satır"
	in_lang["errorKey3"]           = "Sonraki satır yok"
	in_lang["errorKey4"]           = "Satır çok kısa."
	in_lang["key1"]                = "SOL"
	in_lang["key2"]                = "ORTA"
	in_lang["key3"]                = "SAĞ"
	in_lang["f1"]                  = "{%s} / {%s}\n----------"
	in_lang["f2"]                  = "{%s}\n----------"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["sub_menu"]            = langs[2].sub_menu
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Facilitates various editing works."
	in_lang["guiLabel1"]           = "Search for the lines of same style"
	in_lang["guiLabel4"]           = "Ignore whitespaces and punctuations"
	in_lang["guiLabel5"]           = "Apply to: Active line"
	in_lang["guiLabel6"]           = "Please select one of the following.\n\nthis = the time of the current line\nprev = the end time of the previous line\nnext = the start time of the next line\n\nTime difference: {%s} ms"
	in_lang["guiHint1"]            = "If checked, it operates the lines with the style the active line."
	in_lang["buttonKey1"]          = "Merge (P)"
	in_lang["buttonKey2"]          = "Merge (N)"
	in_lang["buttonKey3"]          = "Split"
	in_lang["buttonKey4"]          = "Break"
	in_lang["buttonKey5"]          = "Combine (P)"
	in_lang["buttonKey6"]          = "Combine (N)"
	in_lang["buttonKey7"]          = "Close"
	in_lang["buttonKey8"]          = "Left"
	in_lang["buttonKey9"]          = "Center"
	in_lang["buttonKey10"]         = "Right"
	in_lang["buttonKey11"]         = "Back"
	in_lang["buttonKey12"]         = "Split now"
	in_lang["buttonKey13"]         = "-"
	in_lang["buttonKey14"]         = "\\N"
	in_lang["buttonKey15"]         = " "
	in_lang["buttonKey16"]         = "This"
	in_lang["buttonKey17"]         = "Next"
	in_lang["buttonKey18"]         = "Prev"
	in_lang["errorKey1"]           = "Previous line not exists"
	in_lang["errorKey2"]           = "Current line is comment or empty"
	in_lang["errorKey3"]           = "Next line not exists"
	in_lang["errorKey4"]           = "Line is too short."
	in_lang["key1"]                = "LEFT"
	in_lang["key2"]                = "CENTER"
	in_lang["key3"]                = "RIGHT"
	in_lang["f1"]                  = "{%s} / {%s}\n----------"
	in_lang["f2"]                  = "{%s}\n----------"
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
	script_version      = "1.0.2"
	script_author       = "Magnum357"
	script_mag_version  = "1.1.4.9"
	script_file_name    = "mag.manage_lines"
	script_file_ext     = ".lua"

	include_unicode     = true
	include_clipboard   = true
	include_karaskel    = true
	mag_import, mag     = pcall(require, "mag")

	if mag_import then
	mag.lang            = c_lang_switch

	c_lock_gui          = false
	c_buttons1          = {c_lang.buttonKey1, c_lang.buttonKey2, c_lang.buttonKey3, c_lang.buttonKey4, c_lang.buttonKey5, c_lang.buttonKey6, c_lang.buttonKey7}
	c_buttons2          = {c_lang.buttonKey8, c_lang.buttonKey9, c_lang.buttonKey10, c_lang.buttonKey11}
	c_buttons3          = {c_lang.buttonKey12, c_lang.buttonKey11}
	c_buttons4          = {c_lang.buttonKey13, c_lang.buttonKey14, c_lang.buttonKey15, c_lang.buttonKey11}
	c_buttons5          = {c_lang.buttonKey16, c_lang.buttonKey18, c_lang.buttonKey11}
	c_buttons6          = {c_lang.buttonKey16, c_lang.buttonKey17, c_lang.buttonKey11}
	c_centerline        = 0

	c                   = {}
	c.samestyle         = true
	c.space_and_punc    = false

	gui                 = {
		main1 = {
						 {class = "label",                             x = 0, y = 0, width = 3, height = 1, label = c_lang.guiLabel5},
		samestyle      = {class = "checkbox", name = "samestyle",      x = 0, y = 1, width = 3, height = 1, label = c_lang.guiLabel1, hint = c_lang.guiHint1},
		space_and_punc = {class = "checkbox", name = "space_and_punc", x = 0, y = 2, width = 3, height = 1, label = c_lang.guiLabel4},
		}
	}
	end

	function find_prevline(subs,sel,act)
	local style, prevline, previndex
	if c.samestyle then style = subs[act].style end
	for i = act - 1, 1, -1 do
		if subs[i].class == "dialogue" then
			if mag.is.line.empty(subs[i]) == false and mag.is.line.comment(subs[i]) == false and (c.samestyle and subs[i].style == style or not c.samestyle) then
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
			if mag.is.line.empty(subs[i]) == false and mag.is.line.comment(subs[i]) == false and (c.samestyle and subs[i].style == style or not c.samestyle) then
			nextline  = subs[i]
			nextindex = i
			break
			end
		end
	end
	return nextline, nextindex
	end

	function merge_p(subs,sel,act,ok)
	local line, prevline, previndex
	local pcs = falsex
	local jump
	prevline, previndex = find_prevline(subs,sel,act)
	line                = subs[act]
	if prevline == nil or previndex == act then
	mag.show.log(1, c_lang.errorKey1)
	elseif mag.is.line.empty(subs[act]) or mag.is.line.comment(subs[act]) then
	mag.show.log(1, c_lang.errorKey2)
	else
	pcs = true
		if prevline.start_time <= line.start_time then
		if line.end_time > prevline.end_time then prevline.end_time = line.end_time end
			if ok == c_buttons4[1] then
			prevline.text = "- "..remove_breakline(prevline.text).."\\N- "..remove_breakline(line.text)
			elseif ok == c_buttons4[2] then
			prevline.text = remove_breakline(prevline.text).."\\N"..remove_breakline(line.text)
			else
			prevline.text = prevline.text.." "..line.text
			end
		subs[previndex] = prevline
		jump            = previndex
		mag.line.delete(subs, {act})
		else
		if prevline.end_time > line.end_time then line.end_time = prevline.end_time end
			if ok == c_buttons4[1] then
			line.text = "- "..remove_breakline(prevline.text).."\\N- "..remove_breakline(line.text)
			elseif ok == c_buttons4[2] then
			line.text = remove_breakline(prevline.text).."\\N"..remove_breakline(line.text)
			else
			line.text = prevline.text.." "..line.text
			end
		subs[act] = line
		jump      = act - 1
		mag.line.delete(subs, {previndex})
		end
	end
	mag.show.no_op(pcs)
	if jump ~= nil and pcs then return {jump} end
	end

	function merge_n(subs,sel,act,ok)
	local line, nextline, nextindex
	local pcs = false
	nextline, nextindex = find_nextline(subs,sel,act)
	line = subs[act]
	if nextline == nil or nextindex == act then
	mag.show.log(1, c_lang.errorKey3)
	elseif mag.is.line.empty(subs[act]) or mag.is.line.comment(subs[act]) then
	mag.show.log(1, c_lang.errorKey2)
	else
	pcs = true
		if line.start_time <= nextline.start_time then
		if nextline.end_time > line.end_time then line.end_time = nextline.end_time end
			if ok == c_buttons4[1] then
			line.text = "- "..remove_breakline(line.text).."\\N- "..remove_breakline(nextline.text)
			elseif ok == c_buttons4[2] then
			line.text = remove_breakline(line.text).."\\N"..remove_breakline(nextline.text)
			else
			line.text = line.text.." "..nextline.text
			end
		subs[act] = line
		jump      = act
		mag.line.delete(subs, {nextindex})
		else
		if line.end_time > nextline.end_time then nextline.end_time = line.end_time end
			if ok == c_buttons4[1] then
			nextline.text = "- "..remove_breakline(line.text).."\\N- "..remove_breakline(nextline.text)
			elseif ok == c_buttons4[2] then
			nextline.text = remove_breakline(line.text).."\\N"..remove_breakline(nextline.text)
			else
			nextline.text = line.text.." "..nextline.text
			end
		subs[nextindex] = nextline
		jump            = nextindex - 1
		mag.line.delete(subs, {act})
		end
	end
	mag.show.no_op(pcs)
	if nextindex ~= index and pcs then return {jump} end
	end

	function splitline_gui(subs,sel,act)
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
	return mag.window.dialog(slgui, c_buttons3)
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

	function mergeline_gui(subs,sel,act,mode)
	local mlgui = {}
	if subs[act - 1].class ~= "dialogue" and mode == 1 then
	mag.array.insert(mlgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label = c_lang.errorKey1})
	return mag.window.dialog(mlgui, {c_lang.buttonKey11})
	elseif subs[act + 1].class ~= "dialogue" and mode == 2 then
	mag.array.insert(mlgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label = c_lang.errorKey3})
	return mag.window.dialog(mlgui, {c_lang.buttonKey11})
	else
	local line1, line2
	if mode == 1 then
	line1 = find_prevline(subs,sel,act)
	line2 = subs[act]
	else
	line1 = subs[act]
	line2 = find_nextline(subs,sel,act)
	end
	mag.array.insert(mlgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label = mag.string.format(c_lang.f2, c_buttons4[1]).."\n- "..line1.text.."\n- "..line2.text})
	mag.array.insert(mlgui, {class = "label", x = 0, y = 2, width = 1, height = 1, label = mag.string.format(c_lang.f2, c_buttons4[2]).."\n"..line1.text.."\n"..line2.text})
	mag.array.insert(mlgui, {class = "label", x = 0, y = 4, width = 1, height = 1, label = mag.string.format(c_lang.f2, c_buttons4[3]).."\n"..line1.text.." "..line2.text})
	return mag.window.dialog(mlgui, c_buttons4)
	end
	end

	function remove_breakline(text)
	text = mag.gsub(text, "%s\\N", " ")
	text = mag.gsub(text, "\\N%s", " ")
	text = mag.gsub(text, "\\N",   " ")
	return text
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
	local clgui = {}
	local line  = subs[act]
	if mode == 1 then
	local prevline, previndex = find_prevline(subs,sel,act)
		if prevline == nil or previndex == act then
		mag.array.insert(clgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label = c_lang.errorKey1})
		return mag.window.dialog(clgui, {c_lang.buttonKey11})
		else
		mag.array.insert(clgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label =  mag.string.format(c_lang.guiLabel6, mag.convert.positive((line.start_time - prevline.end_time) / 10))})
		return mag.window.dialog(clgui, c_buttons5)
		end
	else
	local nextline, nextindex = find_nextline(subs,sel,act)
		if nextline == nil or nextindex == act then
		mag.array.insert(clgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label = c_lang.errorKey3})
		return mag.window.dialog(clgui, {c_lang.buttonKey11})
		else
		mag.array.insert(clgui, {class = "label", x = 0, y = 0, width = 1, height = 1, label =  mag.string.format(c_lang.guiLabel6, mag.convert.positive((nextline.start_time - line.end_time) / 10))})
		return mag.window.dialog(clgui, c_buttons6)
		end
	end
	end

	function breakline_gui(subs,sel,act)
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
	return mag.window.dialog(blgui, c_buttons2)
	end
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

	function combine_p(subs,sel,act,ok)
	local line, prevline, previndex
	local pcs = false
	prevline, previndex = find_prevline(subs,sel,act)
	line                = subs[act]
	if mag.is.line.empty(subs[act]) or mag.is.line.comment(subs[act]) then
	mag.show.log(1, c_lang.errorKey2)
	else
	pcs = true
		if ok == c_buttons5[1] then
		prevline.end_time = line.start_time
		subs[previndex]   = prevline
		else
		line.start_time = prevline.end_time
		subs[act]       = line
		end
	end
	mag.show.no_op(pcs)
	end

	function combine_n(subs,sel,act,ok)
	local line, nextline, nextindex
	local pcs = false
	nextline, nextindex = find_nextline(subs,sel,act)
	line                = subs[act]
	if mag.is.line.empty(subs[act]) or mag.is.line.comment(subs[act]) then
	mag.show.log(1, c_lang.errorKey2)
	else
	pcs = true
		if ok == c_buttons6[1] then
		nextline.start_time = line.end_time
		subs[nextindex]     = nextline
		else
		line.end_time = nextline.start_time
		subs[act]     = line
		end
	end
	mag.show.no_op(pcs)
	end

	function add_macro1(subs,sel,act)
	local ok, config, guiselect
	repeat
	mag.config.put(gui.main1)
	if ok == mag.convert.ascii(c_buttons1[1]) then
	guiselect = "mergep"
	ok, config = mergeline_gui(subs, sel, act, 1)
	elseif ok == mag.convert.ascii(c_buttons1[2]) then
	guiselect = "mergen"
	ok, config = mergeline_gui(subs, sel, act, 2)
	elseif ok == mag.convert.ascii(c_buttons1[3]) then
	guiselect = "split"
	ok, config = splitline_gui(subs, sel, act)
	elseif ok == mag.convert.ascii(c_buttons1[4]) then
	guiselect = "break"
	ok, config = breakline_gui(subs, sel, act)
	elseif ok == mag.convert.ascii(c_buttons1[5]) then
	guiselect = "combinep"
	ok, config = combineline_gui(subs, sel, act, 1)
	elseif ok == mag.convert.ascii(c_buttons1[6]) then
	guiselect = "combinen"
	ok, config = combineline_gui(subs, sel, act, 2)
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
	if guiselect == "mergep" then
	return merge_p(subs, sel, act, ok)
	elseif guiselect == "mergen" then
	return merge_n(subs, sel, act, ok)
	elseif guiselect == "split" then
	return splitline(subs, sel, act, config)
	elseif guiselect == "break" then
	return breakline(subs, sel, act, ok)
	elseif guiselect == "combinep" then
	return combine_p(subs, sel, act, ok)
	elseif guiselect == "combinen" then
	return combine_n(subs, sel, act, ok)
	end
	end

	function check_macro1(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro1, subs, sel, act)
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
		mag.window.register(c_sub_name_list[c_lang_switch].."/"..mag.window.lang.message("gui_tabname"), check_macro1)
		mag.window.lang.register(c_sub_name_list[c_lang_switch])
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
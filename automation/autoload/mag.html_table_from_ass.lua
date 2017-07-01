	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "HTML Tablosuna Çevir"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "HTML TABLE From ASS"}
	}
	local lang_list        = {}
	local script_name_list = {}
	for i = 1, #langs do
	lang_list[langs[i].lang_key]        = langs[i].lang_name
	script_name_list[langs[i].lang_key] = langs[i].script_name
	end
	if lang == langs[1].lang_key then
	in_lang["module_incompatible"] = "Mag modülünün kurulu sürümü bu lua dosyası ile uyumsuz!\n\nModül dosyasının en az %s sürümü veya daha üstü gerekiyor.\nŞimdi indirme sayfasına gitmek ister misiniz?\n\n\nNot: Modülü indirip \"aegisub / automation / include\" klasörüne attıktan sonra Aegisub programını\ntekrar açın veya \"Automation / Automation... / Rescan Automation Dir\" butonuna basın."
	in_lang["module_not_found"]    = "Mag modülü bulunamadı!\n\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerekiyor.\nŞimdi indirme sayfasına gitmek ister misiniz?\n\n\nNot: Modülü indirip \"aegisub / automation / include\" klasörüne attıktan sonra Aegisub programını\ntekrar açın veya \"Automation / Automation... / Rescan Automation Dir\" butonuna basın."
	in_lang["module_yes"]          = "Git"
	in_lang["module_no"]           = "Daha Sonra"
	in_lang["s_name"]              = langs[1].script_name
	in_lang["s_desc"]              = "Satırları html tablosuna çevirir. Bu html tablosu renkli ve genişliğe duyarlıdır."
	in_lang["tabKey1"]             = "TABLO"
	in_lang["tabKey2"]             = "CSS"
	in_lang["buttonKey1"]          = "Kopyala"
	in_lang["buttonKey2"]          = "Panoya Kopyala"
	in_lang["buttonKey3"]          = "Kapat"
	in_lang["key1"]                = "Kopyalanacak sütunlar"
	in_lang["key2"]                = "#"
	in_lang["key3"]                = "Stil"
	in_lang["key4"]                = "Oyuncu"
	in_lang["key5"]                = "Efekt"
	in_lang["key6"]                = "Metin"
	in_lang["key7"]                = "Satırları metin kutusunda olduğu gibi boya"
	in_lang["key8"]                = "Kopyalama türü"
	in_lang["key9"]                = "Tabloya veri özelliği ekle"
	in_lang["key10"]               = "class"
	in_lang["key11"]               = "id"
	in_lang["key12"]               = "style"
	in_lang["key13"]               = "Pano"
	in_lang["key14"]               = "Not Defteri"
	in_lang["key15"]               = "Yazı Renkleri"
	in_lang["key16"]               = "Stil Kodları"
	in_lang["key17"]               = "Ek seçenekler"
	in_lang["key18"]               = "Gerçek satır numarası kullan"
	in_lang["headerFormat"]        = "[%s]"
	in_lang["errKey1"]             = "Satırlar panoya kopyalanamadı."
	in_lang["errKey2"]             = "Satırlar not defterine kopyalanamadı."
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nModule file requires at least %s version or higher.\nWould you like to go to the download page now?\n\n\nNote: After downloading the module and putting it in the \"aegisub / automation / include folder\",\nreopen the Aegisub software or press the \"Automation / Automation... / Rescan Automation Dir\" button."
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this lua file you need to download and install the Mag module.\nWould you like to go to the download page now?\n\n\nNote: After downloading the module and putting it in the \"aegisub / automation / include folder\",\nreopen the Aegisub software or press the \"Automation / Automation... / Rescan Automation Dir\" button."
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Converts lines to a html table. The html table is colorful and responsive."
	in_lang["tabKey1"]             = "TABLE"
	in_lang["tabKey2"]             = "CSS"
	in_lang["buttonKey1"]          = "Copy"
	in_lang["buttonKey2"]          = "Copy Clipboard"
	in_lang["buttonKey3"]          = "Close"
	in_lang["key1"]                = "Columns to be copied"
	in_lang["key2"]                = "#"
	in_lang["key3"]                = "Style"
	in_lang["key4"]                = "Actor"
	in_lang["key5"]                = "Effect"
	in_lang["key6"]                = "Text"
	in_lang["key7"]                = "Paint lines as in text box"
	in_lang["key8"]                = "Copy type"
	in_lang["key9"]                = "Add data attribute to table"
	in_lang["key10"]               = "class"
	in_lang["key11"]               = "id"
	in_lang["key12"]               = "style"
	in_lang["key13"]               = "Clipboard"
	in_lang["key14"]               = "Text File"
	in_lang["key15"]               = "Text Colors"
	in_lang["key16"]               = "Style Codes"
	in_lang["key17"]               = "Options"
	in_lang["key18"]               = "Use actual line number"
	in_lang["headerFormat"]        = "[%s]"
	in_lang["errKey1"]             = "The lines could not be copied to the clipboard."
	in_lang["errKey2"]             = "The lines could not be copied to the text file."
	end
	return in_lang, lang_list, script_name_list
	end

	c_lang_switch      = "en"
	c_lang,
	c_lang_list,
	c_script_name_list = lang_switch_keys(c_lang_switch)

	script_name         = c_lang.s_name
	script_description  = c_lang.s_desc
	script_version      = "1"
	script_author       = "Magnum357"
	script_mag_version  = "1.1.4.6"
	script_file_name    = "mag.html_table_from_ass"
	script_file_ext     = ".lua"

	include_unicode     = true
	include_clipboard   = true
	mag_import, mag     = pcall(require, "mag")
	mag.lang            = c_lang_switch

	if mag_import then

	function css_code(param,val)
	return mag.format("\n"..mag.string.wall(" ", 8).."%s: %s;", param, val)
	end

	function create_css(css_name, params)
	local css = mag.format("\n%s {", css_name)
	for c = 1, #params do
	css = css..params[c]
	end
	return mag.format("%s\n}", css)
	end

	c                    = {}
	c.comment_mode       = true
	c.empty_mode         = true
	c.apply              = mag.window.lang.message("select")
	c.add_data_attr      = false
	c.line_number        = true
	c.line_style         = true
	c.line_actor         = true
	c.line_effect        = true
	c.line_text          = true
	c.line_text_colored  = false
	c.copy_target        = mag.window.lang.message("select")
	c.actual_line_number = false
	c.aegisub_style_code =
	"<style>"
	.."\n/* Table Property */"
	..create_css("table.aegisub_lines", {css_code("font-family", "sans-serif"), css_code("text-align", "left"), css_code("border-spacing", "0"), css_code("font-weight", "normal"), css_code("color", "#000000"), css_code("width", "100%"), css_code("border-collapse", "collapse"), css_code("word-break", "break-word"), css_code("background", "white")})
	..create_css("table.aegisub_lines th", {css_code("white-space", "nowrap"), css_code("padding", "5px 10px"), css_code("background", "#A5CFE7")})
	..create_css("table.aegisub_lines.aegisub_line_number tr td:first-child, table.aegisub_lines.aegisub_line_number tr th:first-child", {css_code("text-align", "center")})
	..create_css("table.aegisub_lines.aegisub_line_number tr td", {css_code("padding", "3px 6px")})
	..create_css("table.aegisub_lines tr td", {css_code("min-width", "100px")})
	..create_css("table.aegisub_lines.aegisub_line_number tr td:first-child", {css_code("min-width", "10px"), css_code("white-space", "nowrap")})
	..create_css("table.aegisub_lines.aegisub_line_number tr.aegisub_commented td", {css_code("background", "#D8DEF5")})
	..create_css("table.aegisub_lines.aegisub_line_number tr td:first-child", {css_code("background", "#C4ECC9")})
	.."\n\n/* Border */"
	..create_css("table.aegisub_lines td, table.aegisub_lines th", {css_code("border-style", "solid"), css_code("border-width", "1px"), css_code("border-color", "#BEBEBE")})
	.."\n\n/* Coloring */"
	..create_css("table.aegisub_lines span.aegisub_var", {css_code("color", "#8000C0"), css_code("font-weight", "bold")})
	..create_css("table.aegisub_lines span.aegisub_bracket", {css_code("color", "#1432FF"), css_code("font-weight", "normal")})
	..create_css("table.aegisub_lines span.aegisub_single", {css_code("color", "#FF00C8")})
	..create_css("table.aegisub_lines span.aegisub_text", {css_code("color", "#000000")})
	..create_css("table.aegisub_lines span.aegisub_tag", {css_code("color", "#5A5A5A"), css_code("font-weight", "bold")})
	..create_css("table.aegisub_lines span.aegisub_special", {css_code("color", "#A0A0A0"), css_code("font-weight", "bold")})
	..create_css("table.aegisub_lines .colorize1 span.aegisub_bracket_in, table.aegisub_lines .colorize3 span.aegisub_bracket_in", {css_code("color", "#285A28")})
	..create_css("table.aegisub_lines .colorize2 span.aegisub_bracket_in", {css_code("color", "#000000"), css_code("font-weight", "bold")})
	.."\n\n/* Mobile */"
	.."\n@media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px) {\n"
	..create_css("table.aegisub_lines, table.aegisub_lines thead, table.aegisub_lines tbody, table.aegisub_lines td, table.aegisub_lines th, table.aegisub_lines tr", {css_code("display", "block")})
	..create_css("table.aegisub_lines.aegisub_line_number tr td:first-child, table.aegisub_lines.aegisub_line_number tr th:first-child", {css_code("text-align", "left")})
	..create_css("table.aegisub_lines td, table.aegisub_lines th", {css_code("border", "0")})
	..create_css("table.aegisub_lines tr td, table.aegisub_lines tr th", {css_code("border-top-width", "1px"), css_code("border-right-width", "1px"), css_code("border-left-width", "1px"), css_code("border-style", "solid"), css_code("border-color", "#BEBEBE")})
	..create_css("table.aegisub_lines tr td:last-child", {css_code("border-bottom-width", "1px")})
	.."\n\n}"
	.."\n</style>"

	c_lock_gui           = false
	c_buttons1           = {c_lang.buttonKey1, c_lang.buttonKey3}
	c_buttons2           = {c_lang.buttonKey2, c_lang.buttonKey3}
	c_line_target        = {mag.window.lang.message("select"), c_lang.key13, c_lang.key14}

	gui = {
		main1             = {
		                     {class = "label",                                   x = 0, y = 0,  width = 2, height = 1, label = mag.format(c_lang.headerFormat,c_lang.key1)},
		line_number        = {class = "checkbox", name = "u_line_number",        x = 0, y = 1,  width = 2, height = 1, label = c_lang.key2},
		line_style         = {class = "checkbox", name = "u_line_style",         x = 0, y = 2,  width = 2, height = 1, label = c_lang.key3},
		line_actor         = {class = "checkbox", name = "u_line_actor",         x = 0, y = 3,  width = 2, height = 1, label = c_lang.key4},
		line_effect        = {class = "checkbox", name = "u_line_effect",        x = 0, y = 4,  width = 2, height = 1, label = c_lang.key5},
		line_text          = {class = "checkbox", name = "u_line_text",          x = 0, y = 5,  width = 2, height = 1, label = c_lang.key6},
		                     {class = "label",                                   x = 0, y = 6,  width = 6, height = 1, label = mag.format(c_lang.headerFormat,c_lang.key17)},
		line_text_colored  = {class = "checkbox", name = "u_line_text_colored",  x = 0, y = 7,  width = 6, height = 1, label = c_lang.key7},
		add_data_attr      = {class = "checkbox",  name = "u_add_data_attr",     x = 0, y = 8,  width = 6, height = 1, label = c_lang.key9},
		actual_line_number = {class = "checkbox", name = "u_actual_line_number", x = 0, y = 9,  width = 6, height = 1, label = c_lang.key18},
		                     {class = "label",                                   x = 0, y = 10, width = 6, height = 1, label = mag.format(c_lang.headerFormat,c_lang.key8)},
		copy_target        = {class = "dropdown", name = "u_copy_target",        x = 0, y = 11, width = 6, height = 1, items = c_line_target},
		                     {class = "label",                                   x = 0, y = 12, width = 6, height = 1, label = mag.format(c_lang.headerFormat,mag.window.lang.message("apply2"))},
		apply              = {class = "dropdown", name = "u_apply_lines",        x = 0, y = 13, width = 6, height = 1},
		comment_mode       = {class = "checkbox", name = "u_comment_mode",       x = 0, y = 14, width = 6, height = 1, label = mag.window.lang.message("comment_mode")},
		empty_mode         = {class = "checkbox", name = "u_empty_mode",         x = 0, y = 15, width = 6, height = 1, label = mag.window.lang.message("empty_mode")},
		},
		main2              = {
		                     {class = "label",                                  x = 0, y = 0, width = 1,  height = 1, label = c_lang.key16},
		aegisub_style_code = {class = "textbox", name = "u_aegisub_style_code", x = 0, y = 1, width = 18, height = 12}
		}
	}
	end

	function html_table_from_ass(subs,sel)
	local line, index
	local lines_index = mag.line.index(subs, sel, c.apply, c.comment_mode,c.empty_mode)
	local pcs         = false
	local my_table    = {}
	local is_column   = {actor = false, effect = false}
	if c.line_actor or c.line_effect then
		for i = 1, #lines_index do
		index = lines_index[i]
		line  = subs[index]
		mag.window.progress(i, #lines_index)
			if not is_column["actor"] then
				if c.line_actor and not mag.is.empty(line.actor) then
				is_column["actor"] = true
				end
			end
			if not is_column["effect"] then
				if c.line_effect and not mag.is.empty(line.effect) then
				is_column["effect"] = true
				end
			end
			if c.line_actor and not c.line_effect then
				if is_column["actor"] then
				break
				end
			elseif not c.line_actor and c.line_effect then
				if is_column["effect"] then
				break
				end
			else
				if is_column["actor"] and is_column["effect"] then
				break
				end
			end
		end
	end
	local table_inputs = {table_class = "", data_thread = "", data_col1 = "", data_col2 = "", data_col3 = "", data_col4 = "", data_col5 = "", data_row = "", is_commented = ""}
	local counter      = {tr = 0, td = 0}
	if c.line_number then
	table_inputs["table_class"] = "aegisub_lines aegisub_line_number"
	else
	table_inputs["table_class"] = "aegisub_lines"
	end
	if c.add_data_attr then
	table_inputs["data_thread"] = 'data-row-id="0"'
	end
	create_table("1", my_table, "table", "", table_inputs["table_class"], "", "", "")
	create_table("1", my_table, "tr",    "", "", "", "", table_inputs["data_thread"])
	if c.line_number then
		if c.add_data_attr then
		table_inputs["data_col1"] = mag.format('data-column-id="%s"', "1")
		end
	create_table("10", my_table, "th", "#", "", "", "", table_inputs["data_col1"])
	end
	if c.line_style then
		if c.add_data_attr then
		table_inputs["data_col2"] = mag.format('data-column-id="%s"', "2")
		end
	create_table("10", my_table, "th", c_lang.key3, "", "", "", table_inputs["data_col2"])
	end
	if c.line_actor  and is_column["actor"] then
		if c.add_data_attr then
		table_inputs["data_col3"] = mag.format('data-column-id="%s"', "3")
		end
	create_table("10", my_table, "th", c_lang.key4, "", "", "", table_inputs["data_col3"])
	end
	if c.line_effect and is_column["effect"] then
		if c.add_data_attr then
		table_inputs["data_col4"] = mag.format('data-column-id="%s"', "4")
		end
	create_table("10", my_table, "th", c_lang.key5, "", "", "", table_inputs["data_col4"])
	end
	if c.line_text then
		if c.add_data_attr then
		table_inputs["data_col5"] = mag.format('data-column-id="%s"', "5")
		end
	create_table("10", my_table, "th", c_lang.key6, "", "", "", table_inputs["data_col5"])
	end
	create_table("0", my_table, "tr", "", "", "", "", "")
	local first_index
	if c.actual_line_number then
	first_index = mag.index.first(subs) - 1
	end
	table_inputs["data_col1"] = ""
	table_inputs["data_col2"] = ""
	table_inputs["data_col3"] = ""
	table_inputs["data_col4"] = ""
	table_inputs["data_col5"] = ""
	for i = 1, #lines_index do
	pcs   = true
	index = lines_index[i]
	line  = subs[index]
		if c.add_data_attr then
		counter["tr"]            = counter["tr"] + 1
		table_inputs["data_row"] = mag.format('data-row-id="%s"', counter["tr"])
		end
		if mag.is.line.comment(line) then
		table_inputs["is_commented"] = "aegisub_commented"
		else
		table_inputs["is_commented"] = ""
		end
	create_table("1", my_table, "tr", "", table_inputs["is_commented"], "", "", table_inputs["data_row"])
		if c.line_number then
			if c.add_data_attr then
			counter["td"]             = counter["td"] + 1
			table_inputs["data_col1"] = mag.format('data-column-id="%s"', "1")
			end
		local count = 0
			if c.actual_line_number then
			count = index - first_index
			else
			count = i;
			end
		create_table("10", my_table, "td", count, "", "", "", table_inputs["data_col1"])
		end
		if c.line_style then
			if c.add_data_attr then
			counter["td"]             = counter["td"] + 1
			table_inputs["data_col2"] = mag.format('data-column-id="%s"', "2")
			end
		create_table("10", my_table, "td", line.style, "", "", "", table_inputs["data_col2"])
		end
		if c.line_actor and is_column["actor"] then
			if c.add_data_attr then
			counter["td"]             = counter["td"] + 1
			table_inputs["data_col3"] = mag.format('data-column-id="%s"', "3")
			end
		create_table("10", my_table, "td", line.actor,  "", "", "", table_inputs["data_col3"])
		end
		if c.line_effect and is_column["effect"] then
			if c.add_data_attr then
			counter["td"]             = counter["td"] + 1
			table_inputs["data_col4"] = mag.format('data-column-id="%s"', "4")
			end
		create_table("10", my_table, "td", line.effect, "", "", "", table_inputs["data_col4"])
		end
		if c.line_text then
			if c.line_text_colored then
				if mag.is.line.template(line) then
				line.text = colorize1(line.text)
				elseif mag.is.line.code(line) then
				line.text = colorize2(line.text)
				else
				line.text = colorize3(line.text)
				end
			end
			if c.add_data_attr then
			counter["td"]             = counter["td"] + 1
			table_inputs["data_col5"] = mag.format('data-column-id="%s"', "5")
			end
		create_table("10", my_table, "td", line.text, "", "", "", table_inputs["data_col5"])
		end
	create_table("0", my_table, "tr", "", "", "", "", "")
	end
	create_table("0", my_table, "table", "", "", "", "", "")
	mag.show.no_op(pcs)
	if pcs then return mag.array.concat(my_table) else return nil end
	end

	function create_table(mode,table_var,html_tag,text,tclass,tid,tstyle,data)
	local t
	if tclass and mag.gsub(tclass, "%s+","") ~= "" then tclass = mag.format(" class=\"%s\"", tclass) end
	if tid    and mag.gsub(tid,    "%s+","") ~= "" then tid    = mag.format(" id=\"%s\"",    tid)    end
	if tstyle and mag.gsub(tstyle, "%s+","") ~= "" then tstyle = mag.format(" style=\"%s\"", tstyle) end
	if data   and mag.gsub(data,   "%s+","") ~= "" then data   = mag.format(" %s",data)              end
	if mode == "10" then
	t = mag.format("<%s%s%s%s%s>%s</%s>", html_tag, data, tclass, tid, tstyle, text, html_tag)
	elseif mode == "1" then
	t = mag.format("<%s%s%s%s%s>", html_tag, data, tclass, tid, tstyle)
	elseif mode == "0" then
	t = mag.format("</%s>", html_tag)
	end
	mag.array.insert(table_var, t.."\n")
	end

	function colorize1(text)
	local in_bracket = false
	local in_var     = 0
	local in_tag     = 0
	local in_special = {false, false}
	local in_dollar  = 0
	local t          = ""
	local w          = {}
	for c in mag.convert.chars(text) do
	mag.array.insert(w, c)
	end
	for i = 0, #w do
	if w[i] == "}" then in_bracket = false end
		if in_bracket then
		if w[i] == "!" then in_var = in_var + 1 end
			if in_var == 0 then
				if in_dollar > 0 and mag.match(w[i], "[a-z]") then in_dollar = in_dollar + 1 else in_dollar = 0 end
				if w[i] == "$" then in_dollar = in_dollar + 1 end
				if in_dollar == 1 and mag.match(w[i + 1], "[a-z]") then
				w[i] = mag.format('<span class="aegisub_var">%s', w[i])
				end
				if in_dollar > 1 and not mag.match(w[i + 1], "[a-z]") then
				w[i] = mag.format('%s</span>', w[i])
				end
				if in_tag > 0 then
					if in_tag == 1 then
					w[i] = mag.format('<span class="aegisub_tag">%s', w[i])
					end
					if mag.match(w[i], "[a-z]") then
					in_tag = in_tag + 1
					else
					w[i - 1] = mag.format('%s</span>', w[i - 1])
					in_tag   = 0
					end
				end
				if w[i] == "\\" then
				in_tag = in_tag + 1
				end
		 		if mag.match(w[i], "[\\\\(\\),]") then
		 		w[i] = mag.format('<span class="aegisub_single">%s</span>', w[i])
		 		end
		 	end
		if in_var == 2 then in_var = 0 end
	 	else
	 	if in_special[0] and mag.match(w[i], "[nNh]") then in_special[1] = true else in_special[0] = false end
	 		if in_special[1] then
	 		in_special[0], in_special[1] = false, false
	 		w[i - 1]                     = mag.format('<span class="aegisub_special">%s', w[i - 1])
	 		w[i]                         = mag.format('%s</span>', w[i])
	 		end
	 	if w[i] == "\\" then in_special[0] = true end
		end
	if w[i] == "{" then in_bracket = true end
	end
	t = mag.array.concat(w)
	t = mag.gsub(t,"(!.-!)",     "<span class=\"aegisub_var\">%1</span>")
	t = mag.gsub(t,"(!.-!)",     "<span class=\"aegisub_var\">%1</span>")
	t = mag.gsub(t,"({)(.-)(})", "<span class=\"aegisub_bracket_in\"><span class=\"aegisub_bracket\">%1</span>%2<span class=\"aegisub_bracket\">%3</span></span>")
	return mag.format('<span class="aegisub_text colorize1">%s</span>', t)
	end

	function colorize2(text)
	local in_bracket = false
	local in_special = {false, false}
	local t          = text
	local w          = {}
	for c in mag.convert.chars(text) do
	mag.array.insert(w, c)
	end
	for i = 0, #w do
		if w[i] == "}" then in_bracket = false end
			if not in_bracket then
	 		if in_special[0] and mag.match(w[i], "[nNh]") then in_special[1] = true else in_special[0] = false end
		 		if in_special[1] then
	 			in_special[0], in_special[1] = false, false
	 			w[i - 1]                     = mag.format('<span class="aegisub_special">%s', w[i - 1])
	 			w[i]                         = mag.format('%s</span>', w[i])
	 			end
	 		if w[i] == "\\" then in_special[0] = true end
			end
		if w[i] == "{" then in_bracket = true end
	end
	t = mag.array.concat(w)
	t = mag.gsub(t,"({)(.-)(})", "<span class=\"aegisub_bracket_in\"><span class=\"aegisub_bracket\">%1</span>%2<span class=\"aegisub_bracket\">%3</span></span>")
	return mag.format('<span class="aegisub_text colorize2">%s</span>', t)
	end

	function colorize3(text)
	local in_bracket = false
	local in_tag     = 0
	local in_special = {false, false}
	local t          = ""
	local w          = {}
	for c in mag.convert.chars(text) do
	mag.array.insert(w, c)
	end
	for i = 0, #w do
	if w[i] == "}" then in_bracket = false end
		if in_bracket then
			if in_tag > 0 then
				if in_tag == 1 then
				w[i] = mag.format('<span class="aegisub_tag">%s', w[i])
				end
				if mag.match(w[i], "[a-z]") then
				in_tag = in_tag + 1
				else
				w[i - 1] = mag.format('%s</span>', w[i - 1])
				in_tag   = 0
				end
			end
			if w[i] == "\\" then
			in_tag = in_tag + 1
			end
	 		if mag.match(w[i], "[\\\\(\\),]") then
	 		w[i] = mag.format('<span class="aegisub_single">%s</span>', w[i])
	 		end
	 	else
	 	if in_special[0] and mag.match(w[i], "[nNh]") then in_special[1] = true else in_special[0] = false end
	 		if in_special[1] then
	 		in_special[0], in_special[1] = false, false
	 		w[i - 1]                     = mag.format('<span class="aegisub_special">%s', w[i - 1])
	 		w[i]                         = mag.format('%s</span>', w[i])
	 		end
	 	if w[i] == "\\" then in_special[0] = true end
	 	end
	if w[i] == "{" then in_bracket = true end
	end
	t = mag.array.concat(w)
	t = mag.gsub(t,"({)(.-)(})", "<span class=\"aegisub_bracket_in\"><span class=\"aegisub_bracket\">%1</span>%2<span class=\"aegisub_bracket\">%3</span></span>")
	return mag.format('<span class="aegisub_text colorize3">%s</span>', t)
	end

	function add_macro1(subs,sel)
	local apply_items     = mag.list.full_apply(subs, sel, "comment")
	c.apply               = mag.array.search_apply(apply_items, c.apply)
	gui.main1.apply.items = apply_items
	local ok, config
	repeat
	gui.main1.line_number.value        = c.line_number
	gui.main1.line_style.value         = c.line_style
	gui.main1.line_actor.value         = c.line_actor
	gui.main1.line_effect.value        = c.line_effect
	gui.main1.line_text.value          = c.line_text
	gui.main1.line_text_colored.value  = c.line_text_colored
	gui.main1.copy_target.value        = c.copy_target
	gui.main1.add_data_attr.value      = c.add_data_attr
	gui.main1.actual_line_number.value = c.actual_line_number
	gui.main1.apply.value              = c.apply
	gui.main1.comment_mode.value       = c.comment_mode
	gui.main1.empty_mode.value         = c.empty_mode
	ok, config                         = mag.window.dialog(gui.main1, c_buttons1)
	c.line_number                      = config.u_line_number
	c.line_style                       = config.u_line_style
	c.line_actor                       = config.u_line_actor
	c.line_effect                      = config.u_line_effect
	c.line_text                        = config.u_line_text
	c.line_text_colored                = config.u_line_text_colored
	c.copy_target                      = config.u_copy_target
	c.add_data_attr                    = config.u_add_data_attr
	c.actual_line_number               = config.u_actual_line_number
	c.apply                            = config.u_apply_lines
	c.comment_mode                     = config.u_comment_mode
	c.empty_mode                       = config.u_empty_mode
	until ok == mag.convert.ascii(c_buttons1[1]) and c.apply ~= mag.window.lang.message("select") and c.copy_target ~= mag.window.lang.message("select") or ok == mag.convert.ascii(c_buttons1[2])
	if ok == mag.convert.ascii(c_buttons1[1]) then
		if not c.line_number and not c.line_style and not c.line_actor and not c.line_effect and not c.line_text then
		mag.show.log(c_lang_switch, 2, mag.message["no_option"])
		else
			if c.copy_target == c_line_target[2] then
			local rval = html_table_from_ass(subs, sel)
				if rval ~= nil then
				mag.clip.set(rval)
				else
				mag.show.log(1, c_lang.errKey1)
				end
			elseif c.copy_target == c_line_target[3] then
			local file_name = aegisub.dialog.save(mag.window.lang.message("select_save_place"), "", "", mag.window.lang.message("text_file_type"), false)
				if file_name then
				local rval = html_table_from_ass(subs, sel)
					if rval ~= nil then
					local file = io.open(file_name, "w")
					file:write(rval)
					file:close()
					else
					mag.show.log(1, c_lang.errKey2)
					end
				end
			end
		end
	end
	end

	function add_macro2()
	gui.main2.aegisub_style_code.value = c.aegisub_style_code
	local ok, config                   = mag.window.dialog(gui.main2, c_buttons2)
	c.aegisub_style_code               = config.u_aegisub_style_code
	if ok == mag.convert.ascii(c_buttons2[1]) then
	mag.clip.set(c.aegisub_style_code)
	end
	end

	function check_macro1(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro1, subs, sel)
	mag.window.funce(fe, fee)
	mag.config.set(c)
	end
	end

	function check_macro2()
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro2)
	mag.window.funce(fe, fee)
	mag.config.set(c)
	end
	end

	function lang_change_gui()
	return mag.window.lang.gui(c_lang_list)
	end

	function check_lang_change_gui()
	if c_lock_gui then
	mag.show.log(2,mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(lang_change_gui)
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
		mag_gui_message = c_lang.module_incompatible:gsub("%%s", script_mag_version)
		aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
		else
		mag.window.register(script_name.."/"..c_lang.tabKey1,                          check_macro1)
		mag.window.register(script_name.."/"..c_lang.tabKey2,                          check_macro2)
		mag.window.register(script_name.."/"..mag.window.lang.message("lang_tabname"), check_lang_change_gui)
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end
	script_name        = "HTML TABLE From ASS"
	script_description = "Satırları HTML tablosuna çevirir."
	script_version     = "1"
	script_author      = "Magnum357"
	script_mag_version = "1.1.3.0"

	mag_import, mag = pcall(require,"mag")

	c_buttons            = {"Kopyala","Kapat"}
	c_buttons1           = {"Panoya kopyala","Kapat"}
	c_line_target        = {"Seç","Pano","Not Defteri"}
	c                    = {}
	c.comment_mode       = true
	c.empty_mode         = true
	c.apply              = "Seç"
	c.line_number        = true
	c.line_style         = true
	c.line_actor         = true
	c.line_effect        = true
	c.line_text          = true
	c.line_text_colored  = false
	c.copy_target        = "Seç"
	c.table_td_class_1   = ""
	c.table_td_class_2   = ""
	c.table_td_class_3   = ""
	c.table_td_class_4   = ""
	c.table_td_class_5   = ""
	c.table_td_id_1      = ""
	c.table_td_id_2      = ""
	c.table_td_id_3      = ""
	c.table_td_id_4      = ""
	c.table_td_id_5      = ""
	c.table_td_style_1   = "text-align:center;"
	c.table_td_style_2   = ""
	c.table_td_style_3   = ""
	c.table_td_style_4   = ""
	c.table_td_style_5   = "word-break:break-word;"
	c.aegisub_color1     = "#8000C0"
	c.aegisub_color2     = "#2547FF"
	c.aegisub_color3     = "#FF06CB"
	c.aegisub_color4     = "#395C28"
	c.aegisub_color5     = "#5A6476"
	c.aegisub_color6     = "#A5CFE7"
	c.aegisub_color7     = "#D0D0D0"
	c.aegisub_color8     = "#C4ECC9"
	c.aegisub_color9     = "#000000"
	c_code_tab           = 5
	c.aegisub_style_code = "<style>"
	.."\n/* Table Property */"
	.."\ntable.aegisub_lines{\n"..mag.wall(" ",c_code_tab).."font-family:sans-serif;\n"..mag.wall(" ",c_code_tab).."text-align:left;\n"..mag.wall(" ",c_code_tab).."border-spacing:0;\n"..mag.wall(" ",c_code_tab).."font-size:14px;\n"..mag.wall(" ",c_code_tab).."font-weight:normal;\n"..mag.wall(" ",c_code_tab).."margin:0;\n"..mag.wall(" ",c_code_tab).."color:$color9;\n}"
	.."\ntable.aegisub_lines td, table.aegisub_lines th{\n"..mag.wall(" ",c_code_tab).."padding:5px 4px;\n}"
	.."\ntable.aegisub_lines th{\n"..mag.wall(" ",c_code_tab).."background:$color6;\n}"
	.."\ntable.aegisub_lines td:first-child{\n"..mag.wall(" ",c_code_tab).."background:$color8\n}"
	.."\n\n/* Border */"
	.."\ntable.aegisub_lines td, table.aegisub_lines th{\n"..mag.wall(" ",c_code_tab).."border-top:1px solid $color7;\n"..mag.wall(" ",c_code_tab).."border-right:1px solid $color7;\n}"
	.."\ntable.aegisub_lines tr:last-child td{\n"..mag.wall(" ",c_code_tab).."border-bottom:1px solid $color7;\n}"
	.."\ntable.aegisub_lines tr td:first-child, table.aegisub_lines th:first-child{\n"..mag.wall(" ",c_code_tab).."border-left:1px solid $color7;\n}"
	.."\n\n/* Border Radius */"
	.."\ntable.aegisub_lines th:first-child{\n"..mag.wall(" ",c_code_tab).."border-radius:5px 0px 0px 0px;\n}"
	.."\ntable.aegisub_lines th:last-child{\n"..mag.wall(" ",c_code_tab).."border-radius:0px 5px 0px 0px;\n}"
	.."\ntable.aegisub_lines tr:last-child td:first-child{\n"..mag.wall(" ",c_code_tab).."border-radius:0px 0px 0px 5px;\n}"
	.."\ntable.aegisub_lines tr:last-child td:last-child{\n"..mag.wall(" ",c_code_tab).."border-radius:0px 0px 5px 0px;\n}"
	.."\n\n/* Coloring */"
	.."\ntable.aegisub_lines tr:first-child td{\n"..mag.wall(" ",c_code_tab).."font-weight:bold;\n}"
	.."\ntable.aegisub_lines span.aegisub_var{\n"..mag.wall(" ",c_code_tab).."color:$color1;\n}"
	.."\ntable.aegisub_lines span.aegisub_bracket{\n"..mag.wall(" ",c_code_tab).."color:$color2;\n"..mag.wall(" ",c_code_tab).."font-weight:normal;\n}"
	.."\ntable.aegisub_lines span.aegisub_single{\n"..mag.wall(" ",c_code_tab).."color:$color3;\n}"
	.."\ntable.aegisub_lines span.aegisub_numbers{\n"..mag.wall(" ",c_code_tab).."color:$color4;\n"..mag.wall(" ",c_code_tab).."font-weight:normal;\n}"
	.."\ntable.aegisub_lines span.aegisub_bracket_in{\n"..mag.wall(" ",c_code_tab).."color:$color5;\n"..mag.wall(" ",c_code_tab).."font-weight:bold;\n}"
	.."\n</style>"

	function html_table_from_ass(subs,sel,config)
	local line
	local apply_lines = mag.unstyles(config.u_apply_lines)
	local lines       = mag.lines(subs,sel,apply_lines,c.comment_mode,c.empty_mode)
	local my_table    = {}
	local ct          = {}
	ct["actor"]       = 0
	ct["effect"]      = 0
	for i = 1, #lines do
	line = lines[i]
	if c.line_actor  and mag.gsub(line.actor,"%s+","") ~= ""  then ct["actor"]  = ct["actor"] + 1  end
	if c.line_effect and mag.gsub(line.effect,"%s+","") ~= "" then ct["effect"] = ct["effect"] + 1 end
	end
	create_table("1",my_table,"table","","aegisub_lines","","")
	create_table("1",my_table,"tr")
	if c.line_number                      then create_table("10", my_table, "th", "#",      c.table_td_class_1, c.table_td_id_1, c.table_td_style_1)  end
	if c.line_style                       then create_table("10", my_table, "th", "Style",  c.table_td_class_2, c.table_td_id_2, c.table_td_style_2)  end
	if c.line_actor  and ct["actor"] > 0  then create_table("10", my_table, "th", "Actor",  c.table_td_class_3, c.table_td_id_3, c.table_td_style_3)  end
	if c.line_effect and ct["effect"] > 0 then create_table("10", my_table, "th", "Effect", c.table_td_class_4, c.table_td_id_4, c.table_td_style_4)  end
	if c.line_text                        then create_table("10", my_table, "th", "Text",   c.table_td_class_5, c.table_td_id_5, c.table_td_style_5)  end
	create_table("0",my_table,"tr")
	local n = 0
	for i = 1, #lines do
	line = lines[i]
	create_table("1",my_table,"tr")
		if c.line_number then
		n = n + 1
		create_table("10", my_table, "td", n,           c.table_td_class_1, c.table_td_id_1, c.table_td_style_1)
		end
		if c.line_style then
		create_table("10", my_table, "td", line.style,  c.table_td_class_2, c.table_td_id_2, c.table_td_style_2)
		end
		if c.line_actor and ct["actor"] > 0 then
		create_table("10", my_table, "td", line.actor,  c.table_td_class_3, c.table_td_id_3, c.table_td_style_3)
		end
		if c.line_effect and ct["effect"] > 0 then
		create_table("10", my_table, "td", line.effect, c.table_td_class_4, c.table_td_id_4, c.table_td_style_4)
		end
		if c.line_text then
		local ttemp = line.text
			if c.line_text_colored then
				if mag.find(line.effect,"template") == 1 then
				ttemp = aegisub_colored(ttemp)
				elseif mag.find(line.effect,"code") == 1 then
				ttemp = aegisub_colored2(ttemp)
				else
				ttemp = aegisub_colored3(ttemp)
				end
			end
		create_table("10", my_table, "td", ttemp,       c.table_td_class_5, c.table_td_id_5, c.table_td_style_5)
		end
	create_table("0",my_table,"tr")
	end
	create_table("0",my_table,"table")
	return mag.concat(my_table)
	end

	function create_table(mode,table_var,html_tag,text,tclass,tid,tstyle)
	local t = ""
	local class, id, style = "", "", ""
		if tclass and tid and tstyle then
			if mag.gsub(tclass,"%s+","") ~= "" then class = mag.format(" class=\"%s\"",tclass) end
			if mag.gsub(tid,"%s+","")    ~= "" then id    = mag.format(" id=\"%s\"",tid)       end
			if mag.gsub(tstyle,"%s+","") ~= "" then style = mag.format(" style=\"%s\"",tstyle) end
		end
	if mode == "10" then
	t = mag.format("<%s%s%s%s>%s</%s>",html_tag,class,id,style,text,html_tag)
	elseif mode == "1" then
	t = mag.format("<%s%s%s%s>",html_tag,class,id,style)
	elseif mode == "0" then
	t = mag.format("</%s%s%s%s>",html_tag,class,id,style)
	end
	mag.insert(table_var,t.."\n")
	end

	function aegisub_colored(text)
	local tt = ""
	local t  = text
	in_tags  = false
	in_var   = 0
	in_numb  = 0
	t        = mag.gsub(t,"({.-})","<span class=\"aegisub_bracket_in\">%1</span>")
	t        = mag.gsub(t,"({)","<span class=\"aegisub_bracket\">%1</span>")
	t        = mag.gsub(t,"(})","<span class=\"aegisub_bracket\">%1</span>")
	t        = mag.gsub(t,"(!.-!)","<span class=\"aegisub_var\">%1</span>")
	if mag.match(t,"\\") then
	local str = {}
		for s in unicode.chars(t) do
		mag.insert(str,s)
		end
		for i = 1, #str do
		if str[i] == "}" then in_tags = false end
		if str[i] == "{" then in_tags = true end
		if in_var == 2 then in_var = 0 end
		if str[i] == "!" then in_var = in_var + 1 end
			if in_tags == true and in_var == 0 then
				if str[i] == "\\" or str[i] == "(" or str[i] == ")" or str[i] == "," then
				str[i] = "<span class=\"aegisub_single\">"..str[i].."</span>"
				end
				if mag.match(str[i],"[0-9%.]") then
					if in_numb == 0 then
					str[i] = "<span class=\"aegisub_numbers\">"..str[i]
					end
				in_numb = in_numb + 1
					if str[i + 1] ~= nil then
						if not mag.match(str[i + 1],"[0-9%.]") then
						str[i] = str[i].."</span>"
						end
					end
				else
				in_numb = 0
				end
			end
		tt = tt..str[i]
		end
	t = tt
	end
	return t
	end

	function aegisub_colored2(text)
	local t = text
	t = mag.gsub(t,"({.-})","<span class=\"aegisub_bracket_in\">%1</span>")
	t = mag.gsub(t,"({)","<span class=\"aegisub_bracket\">%1</span>")
	t = mag.gsub(t,"(})","<span class=\"aegisub_bracket\">%1</span>")
	return t
	end

	function aegisub_colored3(text)
	local tt = ""
	local t  = text
	in_tags  = false
	in_var   = 0
	in_numb  = 0
	t        = mag.gsub(t,"({.-})","<span class=\"aegisub_bracket_in\">%1</span>")
	t        = mag.gsub(t,"({)","<span class=\"aegisub_bracket\">%1</span>")
	t        = mag.gsub(t,"(})","<span class=\"aegisub_bracket\">%1</span>")
	if mag.match(t,"\\") then
	local str = {}
		for s in unicode.chars(t) do
		mag.insert(str,s)
		end
		for i = 1, #str do
		if str[i] == "}" then in_tags = false end
		if str[i] == "{" then in_tags = true end
		if in_var == 2 then in_var = 0 end
		if str[i] == "!" then in_var = in_var + 1 end
			if in_tags == true and in_var == 0 then
				if str[i] == "\\" or str[i] == "(" or str[i] == ")" or str[i] == "," then
				str[i] = "<span class=\"aegisub_single\">"..str[i].."</span>"
				end
				if mag.match(str[i],"[0-9%.]") then
					if in_numb == 0 then
					str[i] = "<span class=\"aegisub_numbers\">"..str[i]
					end
				in_numb = in_numb + 1
					if str[i + 1] ~= nil then
						if not mag.match(str[i + 1],"[0-9%.]") then
						str[i] = str[i].."</span>"
						end
					end
				else
				in_numb = 0
				end
			end
		tt = tt..str[i]
		end
	t = tt
	end
	return t
	end

	function add_macro(subs,sel)
	mag.get_config(c)
	local apply_items    = mag.apply_items(subs,sel,"comment","")
	c.apply              = mag.search_apply_items(apply_items,c.apply)
	gui.main.apply.items = apply_items
	local ok, config
	repeat
	gui.main.line_number.value       = c.line_number
	gui.main.line_style.value        = c.line_style
	gui.main.line_actor.value        = c.line_actor
	gui.main.line_effect.value       = c.line_effect
	gui.main.line_text.value         = c.line_text
	gui.main.line_text_colored.value = c.line_text_colored
	gui.main.copy_target.value       = c.copy_target
	gui.main.apply.value             = c.apply
	gui.main.comment_mode.value      = c.comment_mode
	gui.main.empty_mode.value        = c.empty_mode
	gui.main.table_td_class_1.value  = c.table_td_class_1
	gui.main.table_td_class_2.value  = c.table_td_class_2
	gui.main.table_td_class_3.value  = c.table_td_class_3
	gui.main.table_td_class_4.value  = c.table_td_class_4
	gui.main.table_td_class_5.value  = c.table_td_class_5
	gui.main.table_td_id_1.value     = c.table_td_id_1
	gui.main.table_td_id_2.value     = c.table_td_id_2
	gui.main.table_td_id_3.value     = c.table_td_id_3
	gui.main.table_td_id_4.value     = c.table_td_id_4
	gui.main.table_td_id_5.value     = c.table_td_id_5
	gui.main.table_td_style_1.value  = c.table_td_style_1
	gui.main.table_td_style_2.value  = c.table_td_style_2
	gui.main.table_td_style_3.value  = c.table_td_style_3
	gui.main.table_td_style_4.value  = c.table_td_style_4
	gui.main.table_td_style_5.value  = c.table_td_style_5
	ok, config                       = mag.dlg(gui.main,c_buttons)
	c.line_number                    = config.u_line_number
	c.line_style                     = config.u_line_style
	c.line_actor                     = config.u_line_actor
	c.line_effect                    = config.u_line_effect
	c.line_text                      = config.u_line_text
	c.line_text_colored              = config.u_line_text_colored
	c.copy_target                    = config.u_copy_target
	c.apply                          = config.u_apply_lines
	c.comment_mode                   = config.u_comment_mode
	c.empty_mode                     = config.u_empty_mode
	c.table_td_class_1               = config.u_table_td_class_1
	c.table_td_class_2               = config.u_table_td_class_2
	c.table_td_class_3               = config.u_table_td_class_3
	c.table_td_class_4               = config.u_table_td_class_4
	c.table_td_class_5               = config.u_table_td_class_5
	c.table_td_id_1                  = config.u_table_td_id_1
	c.table_td_id_2                  = config.u_table_td_id_2
	c.table_td_id_3                  = config.u_table_td_id_3
	c.table_td_id_4                  = config.u_table_td_id_4
	c.table_td_id_5                  = config.u_table_td_id_5
	c.table_td_style_1               = config.u_table_td_style_1
	c.table_td_style_2               = config.u_table_td_style_2
	c.table_td_style_3               = config.u_table_td_style_3
	c.table_td_style_4               = config.u_table_td_style_4
	c.table_td_style_5               = config.u_table_td_style_5
	until ok == c_buttons[1] and c.apply ~= "Seç" and c.copy_target ~= "Seç" or ok == c_buttons[2]
	if ok == c_buttons[1] then
		if not c.line_number and not c.line_style and not c.line_actor and not c.line_effect and not c.line_text then
		mag.log(2,mag.message["no_option"])
		else
			if c.copy_target == c_line_target[2] then
			mag.cset(html_table_from_ass(subs,sel,config))
			elseif c.copy_target == c_line_target[3] then
			local file_name = aegisub.dialog.save(mag.message["select_save_place"],"","","Metin dosyası (*.txt)|*.txt",false)
				if file_name then
				local file = io.open(file_name,"w")
				file:write(html_table_from_ass(subs,sel,config))
				file:close()
				end
			end
		end
	end
	mag.set_config(c)
	end

	function add_macro1()
	mag.get_config(c)
	gui.main2.aegisub_color1.value     = c.aegisub_color1
	gui.main2.aegisub_color2.value     = c.aegisub_color2
	gui.main2.aegisub_color3.value     = c.aegisub_color3
	gui.main2.aegisub_color4.value     = c.aegisub_color4
	gui.main2.aegisub_color5.value     = c.aegisub_color5
	gui.main2.aegisub_color6.value     = c.aegisub_color6
	gui.main2.aegisub_color7.value     = c.aegisub_color7
	gui.main2.aegisub_color8.value     = c.aegisub_color8
	gui.main2.aegisub_color9.value     = c.aegisub_color9
	gui.main2.aegisub_style_code.value = c.aegisub_style_code
	local ok, config                   = mag.dlg(gui.main2,c_buttons1)
	c.aegisub_color1                   = config.u_aegisub_color1
	c.aegisub_color2                   = config.u_aegisub_color2
	c.aegisub_color3                   = config.u_aegisub_color3
	c.aegisub_color4                   = config.u_aegisub_color4
	c.aegisub_color5                   = config.u_aegisub_color5
	c.aegisub_color6                   = config.u_aegisub_color6
	c.aegisub_color7                   = config.u_aegisub_color7
	c.aegisub_color8                   = config.u_aegisub_color8
	c.aegisub_color9                   = config.u_aegisub_color9
	c.aegisub_style_code               = config.u_aegisub_style_code
	if ok == c_buttons1[1] then
	local code = c.aegisub_style_code
	for z = 1, 9 do code = mag.gsub(code,"%$color"..z,c["aegisub_color"..z]) end
	mag.cset(code)
	end
	mag.set_config(c)
	end

	function check_macro(subs,sel)
	local fe, fee = pcall(add_macro,subs,sel,config)
	mag.funce(fe,fee)
	end

	function check_macro1()
	local fe, fee = pcall(add_macro1)
	mag.funce(fe,fee)
	end

	gui = {
		main = {
		                    {class = "label",                                  x = 0, y = 0,  width = 2, height = 1, label = "[Kopyalanacak bölümler]"},
		line_number       = {class = "checkbox", name = "u_line_number",       x = 0, y = 1,  width = 2, height = 1, label = "#"},
		line_style        = {class = "checkbox", name = "u_line_style",        x = 0, y = 2,  width = 2, height = 1, label = "Style"},
		line_actor        = {class = "checkbox", name = "u_line_actor",        x = 0, y = 3,  width = 2, height = 1, label = "Actor"},
		line_effect       = {class = "checkbox", name = "u_line_effect",       x = 0, y = 4,  width = 2, height = 1, label = "Effect"},
		line_text         = {class = "checkbox", name = "u_line_text",         x = 0, y = 5,  width = 2, height = 1, label = "Text"},
		                    {class = "label",                                  x = 0, y = 6,  width = 1, height = 1, label = mag.wall(" ",4)},
		line_text_colored = {class = "checkbox", name = "u_line_text_colored", x = 1, y = 6,  width = 1, height = 1, label = "Kodları renklendir."},
		                    {class = "label",                                  x = 0, y = 7,  width = 6, height = 1, label = "[Kopyalama türü]"},
		copy_target       = {class = "dropdown", name = "u_copy_target",       x = 0, y = 8,  width = 6, height = 1, items = c_line_target},
		                    {class = "label",                                  x = 0, y = 9,  width = 6, height = 1, label = "[Uygulanacak satırlar]"},
		apply             = {class = "dropdown", name = "u_apply_lines",       x = 0, y = 10, width = 6, height = 1},
		comment_mode      = {class = "checkbox", name = "u_comment_mode",      x = 0, y = 11, width = 6, height = 1, label = "Yorum satırlarını geç."},
		empty_mode        = {class = "checkbox", name = "u_empty_mode",        x = 0, y = 12, width = 6, height = 1, label = "Boş satırları geç."},
		                    {class = "label",                                  x = 3, y = 0,  width = 1, height = 1, label = "[class]"},
		table_td_class_1  = {class = "edit",     name = "u_table_td_class_1",  x = 3, y = 1,  width = 1, height = 1},
		table_td_class_2  = {class = "edit",     name = "u_table_td_class_2",  x = 3, y = 2,  width = 1, height = 1},
		table_td_class_3  = {class = "edit",     name = "u_table_td_class_3",  x = 3, y = 3,  width = 1, height = 1},
		table_td_class_4  = {class = "edit",     name = "u_table_td_class_4",  x = 3, y = 4,  width = 1, height = 1},
		table_td_class_5  = {class = "edit",     name = "u_table_td_class_5",  x = 3, y = 5,  width = 1, height = 1},
		                    {class = "label",                                  x = 4, y = 0,  width = 1, height = 1, label = "[id]"},
		table_td_id_1     = {class = "edit",     name = "u_table_td_id_1",     x = 4, y = 1,  width = 1, height = 1},
		table_td_id_2     = {class = "edit",     name = "u_table_td_id_2",     x = 4, y = 2,  width = 1, height = 1},
		table_td_id_3     = {class = "edit",     name = "u_table_td_id_3",     x = 4, y = 3,  width = 1, height = 1},
		table_td_id_4     = {class = "edit",     name = "u_table_td_id_4",     x = 4, y = 4,  width = 1, height = 1},
		table_td_id_5     = {class = "edit",     name = "u_table_td_id_5",     x = 4, y = 5,  width = 1, height = 1},
		                    {class = "label",                                  x = 5, y = 0,  width = 1, height = 1, label = "[style]"},
		table_td_style_1  = {class = "edit",     name = "u_table_td_style_1",  x = 5, y = 1,  width = 1, height = 1},
		table_td_style_2  = {class = "edit",     name = "u_table_td_style_2",  x = 5, y = 2,  width = 1, height = 1},
		table_td_style_3  = {class = "edit",     name = "u_table_td_style_3",  x = 5, y = 3,  width = 1, height = 1},
		table_td_style_4  = {class = "edit",     name = "u_table_td_style_4",  x = 5, y = 4,  width = 1, height = 1},
		table_td_style_5  = {class = "edit",     name = "u_table_td_style_5",  x = 5, y = 5,  width = 1, height = 1}
		},
		main2 = {
	    	                 {class = "label",                                  x = 0, y = 0,  width = 2,  height = 1, label = "[Yazı Renkleri]"},
	        	             {class = "label",                                  x = 0, y = 1,  width = 1,  height = 1, label = mag.wall(" ",12).."Değişkenler:"},
		aegisub_color1     = {class = "color",   name = "u_aegisub_color1",     x = 1, y = 1,  width = 1,  height = 1},
		                     {class = "label",                                  x = 0, y = 2,  width = 1,  height = 1, label = mag.wall(" ",13).."Parantezler:"},
		aegisub_color2     = {class = "color",   name = "u_aegisub_color2",     x = 1, y = 2,  width = 1,  height = 1},
		                     {class = "label",                                  x = 0, y = 3,  width = 1,  height = 1, label = mag.wall(" ",18).."İşaretler:"},
		aegisub_color3     = {class = "color",   name = "u_aegisub_color3",     x = 1, y = 3,  width = 1,  height = 1},
		                     {class = "label",                                  x = 0, y = 4,  width = 1,  height = 1, label = mag.wall(" ",21).."Sayılar:"},
		aegisub_color4     = {class = "color",   name = "u_aegisub_color4",     x = 1, y = 4,  width = 1,  height = 1},
		                     {class = "label",                                  x = 0, y = 5,  width = 1,  height = 1, label = "Parantez içi yazılar:"},
		aegisub_color5     = {class = "color",   name = "u_aegisub_color5",     x = 1, y = 5,  width = 1,  height = 1},
		                     {class = "label",                                  x = 0, y = 7,  width = 2,  height = 1, label = "[Tablo Renkleri]"},
		                     {class = "label",                                  x = 0, y = 8,  width = 1,  height = 1, label = mag.wall(" ",23).."Başlık:"},
		aegisub_color6     = {class = "color",   name = "u_aegisub_color6",     x = 1, y = 8,  width = 1,  height = 1},
		                     {class = "label",                                  x = 0, y = 9,  width = 1,  height = 1, label = mag.wall(" ",19).."Kenarlık:"},
		aegisub_color7     = {class = "color",   name = "u_aegisub_color7",     x = 1, y = 9,  width = 1,  height = 1},
		                     {class = "label",                                  x = 0, y = 10, width = 1,  height = 1, label = mag.wall(" ",12).."Satır sayıları:"},
		aegisub_color8     = {class = "color",   name = "u_aegisub_color8",     x = 1, y = 10, width = 1,  height = 1},
		                     {class = "label",                                  x = 0, y = 11, width = 1,  height = 1, label = mag.wall(" ",21).."Yazılar:"},
		aegisub_color9     = {class = "color",   name = "u_aegisub_color9",     x = 1, y = 11, width = 1,  height = 1},
		                     {class = "label",                                  x = 0, y = 12, width = 1,  height = 1, label = "[Stil Kodları]"},
		aegisub_style_code = {class = "textbox", name = "u_aegisub_style_code", x = 0, y = 13, width = 18, height = 12}
		}
	}

	if mag_import then
	mag_update_link           = "https://github.com/magnum357i/Magnum-s-Aegisub-Scripts"
	mag_version_check         = false
		if not mag_version_check then
		mag_version           = mag.match(io.open(aegisub.decode_path("?data\\automation\\include\\mag.lua")):read("*all"),"module_version%s-=%s\"([^\"]+)\"")
			if mag_version and mag_version:gsub("%.","") < script_mag_version:gsub("%.","") then
			function mag_check() local k = aegisub.dialog.display({{class = "label", label = "Mag modülünün kurulu sürümü bu lua dosyası ile uyumsuz.\nEn az "..script_mag_version.." veya en güncel modül sürümünü indirmeniz gerekiyor.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
			aegisub.register_macro(script_name,script_desription,mag_check)
			else
			mag_version_check = true
			end
		end
		if mag_version_check then
		mag.register(script_name.."/TABLO",check_macro)
		mag.register(script_name.."/CSS",check_macro1)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end
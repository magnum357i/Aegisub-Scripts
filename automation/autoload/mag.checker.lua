	script_name        = "Checker"
	script_description = "Satırlardaki sorunları kontrol eder."
	script_version     = "0.8.8"
	script_author      = "Magnum357"
	script_mag_version = "1.1.2.6"

	mag_import, mag = pcall(require,"mag")

	c_main_msg            = mag.format("[%s]",script_name)
	c_buttons             = {"Kontrol et","Kapat"}
	c_buttons1            = {"Oku","Kapat"}
	c                     = {}
	c.time                = true
	c.time_min            = false
	c.time_min_value      = "0:00:00.70"
	c.time_max            = false
	c.time_max_value      = "0:00:06.00"
	c.time_next_min       = false
	c.time_next_min_value = "0:00:00.06"
	c.time_cps            = false
	c.time_cps_value      = 25
	c.time_overlap        = false
	c.char                = true
	c.char_max            = false
	c.char_max_value      = 44
	c.char_range          = false
	c.char_range_value    = 44
	c.space               = true
	c.space_double        = false
	c.space_line          = false
	c.space_break_line    = false
	c.space_dots          = false
	c.apply               = "Seç"
	c.comment_lines       = true
	c.empty_lines         = true

	function checker(subs,sel,config)
	local lines            = {}
	local pcs              = false
	local first_text_index = mag.first_index(subs) + 1
	local apply_lines      = mag.unstyles(config.u_apply_lines)
	local i_last
	if apply_lines == "Seçili satırlar" then
	local sel = mag.sel_index(subs,sel)
	i_last    = table.getn(sel)
	else
	i_last    = #subs
	end
	for i = 1, i_last do
	local k
	if apply_lines == "Seçili satırlar" then k = sel[i] else k = i end
	local l        = subs[k]
	local style1   = 1
	local style2   = 1
	local comment1 = 1
	local comment2 = 1
	local line_ok  = true
	if c.comment_lines then comment1, comment2 = l.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = l.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 and l.class == "dialogue" then
			if c.empty_lines and mag.is_empty_line(l.text) then
			line_ok = false
			end
			if line_ok then
			l.effect = k
			mag.insert(lines,l)
			end
		end
	end
	if c.time or c.time_next_min or c.time_overlap then
		for k = 1, #lines do
		local scs = false
			for m = 1, #lines - 1 do
			local current_start_time = lines[m].start_time
			local next_start_time    = lines[m + 1].start_time
				if current_start_time > next_start_time then
				scs             = true
				local temp_line = lines[m + 1]
				lines[m + 1]    = lines[m]
				lines[m]        = temp_line
				elseif scs then
				break
				end
			end
		end
	end
	for j = 1, #lines do
	mag.progress("Satırlar kontrol ediliyor...",j,#lines,false)
	local line   = lines[j]
	local check  = ""
	local result = ""
	local empty  = mag.is_empty_line(line.text)
	local dur
		if c.time or c.time_min or c.time_max or c.time_next_min or c.time_cps or c.time_overlap then
			if line.end_time > line.start_time then
			dur = line.end_time - line.start_time
			else
			dur = 0
			end
			if c.time or c.time_min then
				if dur < mag.time_strip(c.time_min_value) then
				check = split2(check,mag.format("[S - %s-]",mag.time_format(mag.time_strip(c.time_min_value) - dur)))
				end
			end
			if c.time or c.time_max then
				if dur > mag.time_strip(c.time_max_value) then
				check = split2(check,mag.format("[S - %s+]",mag.time_format(dur - mag.time_strip(c.time_max_value))))
				end
			end
			if c.time or c.time_next_min then
				if lines[j + 1] ~= nil then
				local next_line = lines[j + 1]
					if next_line.start_time > line.end_time then
					local dur2 = next_line.start_time - line.end_time
						if dur2 < mag.time_strip(c.time_next_min_value) then
						check = split2(check,mag.format("[SS - %s-]",mag.time_format(mag.time_strip(c.time_next_min_value) - dur2)))
						end
					end
				end
			end
			if c.time or c.time_cps or c.time_overlap then
				if dur > 0 then
					if c.time or c.time_cps then
					local text_len = line.text
					text_len       = mag.full_strip(line.text)
					text_len       = mag.removedot(text_len)
					text_len       = mag.n(mag.len(text_len))
					local cps      = text_len / dur
					cps            = mag.floor(cps * 1000)
						if mag.n(c.time_cps_value) <= cps then
						check = split2(check,mag.format("[K -> %s]",cps))
						end
					end
					if c.time or c.time_overlap then
					local overlap_count = 0
						for y = j, #lines do
						local overlap_line = lines[y]
						if overlap_line.start_time >= line.end_time then break end
							if overlap_line.start_time >= line.start_time and overlap_line.end_time >= line.start_time then
							overlap_count = overlap_count + 1
							end
						end
					overlap_count = overlap_count - 1
						if overlap_count > 0 then
						check = split2(check,mag.format("[S -> %s]",overlap_count))
						end
					end
				end
			end
		end
	check  = put_title("Z: ",check)
	result = split(check,result)
	check  = ""
		if c.char or c.char_max or c.char_range then
			if not mag.match(mag.strip(line.text),"\\N") then
			local strip_line = line.text
			strip_line       = mag.full_strip(line.text)
			strip_line       = mag.removedot(strip_line)
				if mag.n(mag.len(strip_line)) >= mag.n(c.char_max_value) then
				check = split2(check,mag.format("[%s]",mag.len(strip_line)))
				end
			else
			local strip_line              = mag.strip(line.text)
			local split_count, split_text = mag.splitter(true,strip_line,"\\N")
			local break_part              = {}
			local strip_char
				for j = 1, split_count do
				strip_char = split_text[j]
				strip_char = mag.special_strip(strip_char)
				strip_char = mag.removedot(strip_char)
					if mag.n(mag.len(strip_char)) >= mag.n(c.char_range_value) then
					mag.insert(break_part,mag.len(strip_char))
					end
				end
				if break_part[1] then
				mag.sort(break_part)
				break_part = mag.reverse_short_array(break_part)
				check      = split2(check,mag.format("[%sN]",break_part[1]))
				end
			end
		end
	check  = put_title("K: ",check)
	result = split(check,result)
	check  = ""
		if c.space or c.space_double or c.space_break_line or c.space_line or c.space_dots then
			if empty == false then
			local strip_tag             = line.text
			strip_tag                   = mag.strip(strip_tag)
			local strip_tag_and_special = strip_tag
			strip_tag_and_special       = mag.gsub(strip_tag_and_special,"\\[nN]","")
			strip_tag_and_special       = mag.gsub(strip_tag_and_special,"\\h"," ")
			local qtext                 = ""
				if c.space or c.space_double then
				local space_count = mag.ccount(strip_tag_and_special,"%s")
				local sp          = {}
				local plus        = ""
				local sp_plus     = ""
				local sp_check    = false
				local sc          = 0
				local sp_temp     = strip_tag_and_special
					if space_count > 0 then
						for s = 1, space_count do
							if mag.match(sp_temp,"%s+") then
							mag.insert(sp,mag.len(mag.match(sp_temp,"%s+")))
						end
						sp_temp = mag.gsub(sp_temp,"%s+","",1)
						end
						for s2 = 1, #sp do
						sc = sc + 1
							if sp[s2] > 1 then
							sp_check = true
							sp_plus = mag.format("%s%s%s>%s+",sp_plus,plus,sc,sp[s2] - 1)
							plus    = ", "
							end
						end
						if sp_check then
						check = split2(check,mag.format("[%s]",sp_plus))
						end
					end
				end
				if c.space or c.space_break_line then
					if mag.match(strip_tag,"%s\\N%s") then
					check = split2(check,mag.format("[ %s ]","\\N"))
					elseif mag.match(strip_tag,"%s\\N") then
					check = split2(check,mag.format("[ %s]","\\N"))
					elseif mag.match(strip_tag,"\\N%s") then
					check = split2(check,mag.format("[%s ]","\\N"))
					end
				end
				if c.space or c.space_line then
					if mag.find(strip_tag_and_special,"%s") == 1 and mag.find(mag.reverse(strip_tag_and_special),"%s") == 1 then
					check = split2(check,mag.format("[ %s ]","S"))
					elseif mag.find(strip_tag_and_special,"%s") == 1 then
					check = split2(check,mag.format("[ %s]","S"))
					elseif mag.find(mag.reverse(strip_tag_and_special),"%s") == 1 then
					check = split2(check,mag.format("[%s ]","S"))
					end
				end
				if c.space or c.space_dots then
					if mag.find(strip_tag_and_special,"["..mag.trc.."]%s+%.") then
					check = split2(check,mag.format("[%s]"," ."))
				end
					if mag.find(strip_tag_and_special,"%s,") then
					check = split2(check,mag.format("[%s]"," ,"))
					end
					if mag.find(strip_tag_and_special,"%s!") then
					check = split2(check,mag.format("[%s]"," !"))
					end
					if mag.find(strip_tag_and_special,"%s%?") then
					check = split2(check,mag.format("[%s]"," ?"))
					end
					if mag.find(strip_tag_and_special,"%s:") then
					check = split2(check,mag.format("[%s]"," :"))
					end
					if mag.find(strip_tag_and_special,"%s;") then
					check = split2(check,mag.format("[%s]"," ;"))
					end
					if mag.find(strip_tag_and_special,"%s'%s") then
					check = split2(check,mag.format("[%s]"," ' "))
					elseif mag.find(strip_tag_and_special,"%s'") then
					check = split2(check,mag.format("[%s]"," '"))
					elseif mag.find(strip_tag_and_special,"'%s") then
					check = split2(check,mag.format("[%s]","' "))
					end
				qtext = mag.match(strip_tag_and_special,"\".-\"")
					if qtext then
						if mag.match(qtext,"\"%s") and mag.match(qtext,"%s\"") then
						check = split2(check,mag.format("[%s]"," \" "))
						elseif mag.match(qtext,"\"%s") then
						check = split2(check,mag.format("[%s]","\" "))
						elseif mag.match(qtext,"%s\"") then
						check = split2(check,mag.format("[%s]"," \""))
						end
					end
					if mag.find(strip_tag_and_special,"%s-%.%.%.%s") == 1 then
					check = split2(check,mag.format("[%s]","... "))
					end
					if mag.find(mag.reverse(strip_tag_and_special),"%s-%.%.%.%s") == 1 then
					check = split2(check,mag.format("[%s]"," ..."))
					end
					if mag.match(strip_tag_and_special,"[^%s],[^%s]") then
					check = split2(check,mag.format("[%s]",", *"))
					end
					if mag.match(strip_tag_and_special,"[^%s]:[^%s]") then
					check = split2(check,mag.format("[%s]",": *"))
					end
					if mag.match(strip_tag_and_special,"[^%s];[^%s]") then
					check = split2(check,mag.format("[%s]","; *"))
					end
					if mag.match(strip_tag_and_special,"[^%s]%?[^%s]") then
					check = split2(check,mag.format("[%s]","? *"))
					end
					if mag.match(strip_tag_and_special,"[^%s]%![^%s]") then
					check = split2(check,mag.format("[%s]","! *"))
					end
					if mag.match(strip_tag_and_special,"[^%s%.]%.[^%s]") then
					check = split2(check,mag.format("[%s]",". *"))
					end
				end
			end
		end
	check       = put_title("B: ",check)
	result      = split(check,result)
	check       = ""
	result      = p(result)
	result      = put_title(mag.format("%s ",c_main_msg),mag.format("%s",result))
	if result ~= "" then pcs = true end
	local line2  = subs[line.effect]
	line2.effect = result
	subs[line.effect] = line2
	end
	mag.log_error(pcs,mag.message["no_process"])
	end

	function vars(str)
	local s      = ""
	local string = ""
	for i = 1, #str do
		if str[i] ~= nil then
		string = string..s..str[i]
		s      = ", "
		end
	end
	return string
	end

	function split(text1,text2)
	local t = ""
	if text1 ~= "" and text2 ~= "" then
	t = mag.format("%s / %s",text2,text1)
	else
	t = text1..text2
	end
	return t
	end

	function split2(text1,text2)
	local t = ""
	if text1 ~= "" and text2 ~= "" then
	t = mag.format("%s, %s",text1,text2)
	else
	t = text1..text2
	end
	return t
	end

	function put_title(title,text)
	if text ~= "" then
	text = mag.format("%s%s",title,text)
	end
	return text
	end

	function p(t)
	if t ~= "" then
	t = mag.format("(%s)",t)
	end
	return t
	end

	function add_macro(subs,sel)
	mag.get_config(c)
	local apply_items = mag.apply_items(subs,sel,"comment","")
	c.apply           = mag.search_apply_items(apply_items,c.apply)
	local gui, ok, config
	repeat
	gui =
	{
	 {class = "checkbox", name = "u_time",                value = c.time,                                    x = 0, y = 0,  width = 3, height = 1, label = "[( Z ) - ZAMAN]"}
	,{class = "label",                                                                                       x = 0, y = 1,  width = 1, height = 1, label = mag.wall(" ",4)}
	,{class = "checkbox", name = "u_time_min",            value = c.time_min,                                x = 1, y = 1,  width = 1, height = 1, label = "Şundan az:"}
	,{class = "edit",     name = "u_time_min_value",      value = c.time_min_value,                          x = 2, y = 1,  width = 1, height = 1}
	,{class = "checkbox", name = "u_time_max",            value = c.time_max,                                x = 1, y = 2,  width = 1, height = 1, label = "Şundan fazla:"}
	,{class = "edit",     name = "u_time_max_value",      value = c.time_max_value,                          x = 2, y = 2,  width = 1, height = 1}
	,{class = "checkbox", name = "u_time_next_min",       value = c.time_next_min,                           x = 1, y = 3,  width = 1, height = 1, label = "Sonraki satır şundan az:"}
	,{class = "edit",     name = "u_time_next_min_value", value = c.time_next_min_value,                     x = 2, y = 3,  width = 1, height = 1}
	,{class = "checkbox", name = "u_time_cps",            value = c.time_cps,                                x = 1, y = 4,  width = 1, height = 1, label = "Saniyedeki karakter sayısı:"}
	,{class = "intedit",  name = "u_time_cps_value",      value = c.time_cps_value,      min = 15, max = 70, x = 2, y = 4,  width = 1, height = 1}
	,{class = "checkbox", name = "u_time_overlap",        value = c.time_overlap,                            x = 1, y = 5,  width = 1, height = 1, label = "Üst üste binen satırlar."}
	,{class = "checkbox", name = "u_char",                value = c.char,                                    x = 0, y = 6,  width = 3, height = 1, label = "[( K ) - KARAKTER]"}
	,{class = "checkbox", name = "u_char_max",            value = c.char_max,                                x = 1, y = 7,  width = 1, height = 1, label = "Sınır:", hint = "Satır bölme yapılmamış satırların karakter sayısını ölçer."}
	,{class = "intedit",  name = "u_char_max_value",      value = c.char_max_value,      min = 35, max = 55, x = 2, y = 7,  width = 1, height = 1}
	,{class = "checkbox", name = "u_char_range",          value = c.char_range,                              x = 1, y = 8,  width = 1, height = 1, label = "Satır bölme arası:", hint = "Satır bölme yapılmış satırların en fazla olan karakter sayısını ölçer."}
	,{class = "intedit",  name = "u_char_range_value",    value = c.char_range_value,    min = 35, max = 55, x = 2, y = 8,  width = 1, height = 1}
	,{class = "checkbox", name = "u_space",               value = c.space,                                   x = 0, y = 9,  width = 3, height = 1, label = "[( B ) - BOŞLUK]"}
	,{class = "checkbox", name = "u_space_double",        value = c.space_double,                            x = 1, y = 10, width = 2, height = 1, label = "Birden fazla."}
	,{class = "checkbox", name = "u_space_line",          value = c.space_line,                              x = 1, y = 11, width = 2, height = 1, label = "Satırdan önce ve sonra."}
	,{class = "checkbox", name = "u_space_break_line",    value = c.space_break_line,                        x = 1, y = 12, width = 2, height = 1, label = "Satır bölmeden önce ve sonra."}
	,{class = "checkbox", name = "u_space_dots",          value = c.space_dots,                              x = 1, y = 13, width = 2, height = 1, label = "Noktralama işaretlerinden önce ve sonra."}
	,{class = "label",                                                                                       x = 0, y = 14, width = 3, height = 1, label = "[UYGULANACAK SATIRLAR]"}
	,{class = "dropdown", name = "u_apply_lines",         value = c.apply,                                   x = 0, y = 15, width = 3, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir."}
	,{class = "checkbox", name = "u_comment_lines",       value = c.comment_lines,                           x = 0, y = 16, width = 3, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_empty_lines",         value = c.empty_lines,                             x = 0, y = 17, width = 3, height = 1, label = "Boş satırları geç."}
	}
	ok, config            = mag.dlg(gui,c_buttons)
	c.time                = config.u_time
	c.time_min            = config.u_time_min
	c.time_min_value      = config.u_time_min_value
	c.time_max            = config.u_time_max
	c.time_max_value      = config.u_time_max_value
	c.time_next_min       = config.u_time_next_min
	c.time_next_min_value = config.u_time_next_min_value
	c.time_cps            = config.u_time_cps
	c.time_cps_value      = config.u_time_cps_value
	c.time_overlap        = config.u_time_overlap
	c.char                = config.u_char
	c.char_max            = config.u_char_max
	c.char_max_value      = config.u_char_max_value
	c.char_range          = config.u_char_range
	c.char_range_value    = config.u_char_range_value
	c.space               = config.u_space
	c.space_double        = config.u_space_double
	c.space_line          = config.u_space_line
	c.space_break_line    = config.u_space_break_line
	c.space_dots          = config.u_space_dots
	c.apply               = config.u_apply_lines
	c.comment_lines       = config.u_comment_lines
	c.empty_lines         = config.u_empty_lines
	until config.u_apply_lines ~= "Seç" and ok == c_buttons[1] or ok == c_buttons[2]
	if ok == c_buttons[1] then
	t_check = false
		if mag.time_strip(c.time_min_value) == 0 or mag.time_strip(c.time_max_value) == 0 or mag.time_strip(c.time_next_min_value) == 0 then
		t_check = true
		end
		if not t_check then
			if not time_check(c.time_min_value) or not time_check(c.time_max_value) or not time_check(c.time_next_min_value) then
			t_check = true
			end
		end
		if not t_check then
		checker(subs,sel,config)
		mag.undo_point()
		else
		mag.log(1,"Zaman alanlarına girilen değerler geçersiz.")
		end
	end
	mag.set_config(c)
	end

	function time_check(time)
	t              = true
	t1, t2, t3, t4 = mag.match(time,"(%d+):(%d+):(%d+).(%d+)")
	if mag.n(mag.len(t1)) > 2 or mag.n(mag.len(t2)) > 2 or mag.n(mag.len(t3)) > 2 or mag.n(mag.len(t4)) > 2 then
	t = false
	end
	return t
	end

	function add_macro1(subs,sel)
	mag.get_config(c)
	local pcs         = false
	local apply_items = mag.apply_items(subs,sel,"comment","")
	c.apply           = mag.search_apply_items(apply_items,c.apply)
	local gui, ok, config
	repeat
	gui =
	{
	 {class = "label",                                                       x = 0, y = 0, width = 1, height = 1, label = "Okunacak satırlar:"}
	,{class = "dropdown", name = "u_apply_lines",   value = c.apply,         x = 1, y = 0, width = 1, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir."}
	,{class = "checkbox", name = "u_comment_lines", value = c.comment_lines, x = 1, y = 1, width = 1, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_empty_lines",   value = c.empty_lines,   x = 1, y = 2, width = 1, height = 1, label = "Boş satırları geç."}
	}
	ok, config      = mag.dlg(gui,c_buttons1)
	c.apply         = config.u_apply_lines
	c.comment_lines = config.u_comment_lines
	c.empty_lines   = config.u_empty_lines
	until c.apply ~= "Seç" or ok == c_buttons1[2]
	if ok == c_buttons1[1] then
	local lines       = {}
	local apply_lines = mag.unstyles(config.u_apply_lines)
	local i_last
	if apply_lines == "Seçili satırlar" then
	local sel = mag.sel_index(subs,sel)
	i_last    = table.getn(sel)
	else
	i_last    = #subs
	end
	for i = 1, i_last do
	local k
	if apply_lines == "Seçili satırlar" then k = sel[i] else k = i end
	local l        = subs[k]
	local style1   = 1
	local style2   = 1
	local comment1 = 1
	local comment2 = 1
	local line_ok  = true
	if c.comment_lines then comment1, comment2 = l.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = l.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 and l.class == "dialogue" then
			if c.empty_lines and mag.is_empty_line(l.text) then
			line_ok = false
			end
			if line_ok then
			mag.insert(lines,l)
			end
		end
	end
	local log = {}
	for j = 1, 31 do log[j] = 0 end
	for i = 1, #lines do
	local line = lines[i]
		if mag.match(line.effect,"%[S%s%-%s%d%:%d%d%:%d%d%.%d%d%-%]")  then log[1]  = log[1]  + 1 end
		if mag.match(line.effect,"%[S%s%-%s%d%:%d%d%:%d%d%.%d%d%+%]")  then log[2]  = log[2]  + 1 end
		if mag.match(line.effect,"%[SS%s%-%s%d%:%d%d%:%d%d%.%d%d%-%]") then log[3]  = log[3]  + 1 end
		if mag.match(line.effect,"%[K%s%->%s%d+%]")                    then log[4]  = log[4]  + 1 end
		if mag.match(line.effect,"%[S%s%->%s%d+%]")                    then log[5]  = log[5]  + 1 end
		if mag.match(line.effect,"%[%d+%]")                            then log[6]  = log[6]  + 1 end
		if mag.match(line.effect,"%[%d+N%]")                           then log[7]  = log[7]  + 1 end
		if mag.match(line.effect,"%[%d+>%d+%+.-%]")                    then log[8]  = log[8]  + 1 end
		if mag.match(line.effect,"%[%sS%s%]")                          then log[9]  = log[9]  + 1 end
		if mag.match(line.effect,"%[S%s%]")                            then log[10] = log[10] + 1 end
		if mag.match(line.effect,"%[%sS%]")                            then log[11] = log[11] + 1 end
		if mag.match(line.effect,"%[%s%.%]")                           then log[12] = log[12] + 1 end
		if mag.match(line.effect,"%[%s%,%]")                           then log[13] = log[13] + 1 end
		if mag.match(line.effect,"%[%s%!%]")                           then log[14] = log[14] + 1 end
		if mag.match(line.effect,"%[%s%?%]")                           then log[15] = log[15] + 1 end
		if mag.match(line.effect,"%[%s%:%]")                           then log[16] = log[16] + 1 end
		if mag.match(line.effect,"%[%s%;%]")                           then log[17] = log[17] + 1 end
		if mag.match(line.effect,"%[%s%'%s%]")                         then log[18] = log[18] + 1 end
		if mag.match(line.effect,"%[%'%s%]")                           then log[19] = log[19] + 1 end
		if mag.match(line.effect,"%[%'%s%]")                           then log[20] = log[20] + 1 end
		if mag.match(line.effect,"%[%s\"%s%]")                         then log[21] = log[21] + 1 end
		if mag.match(line.effect,"%[\"%s%]")                           then log[22] = log[22] + 1 end
		if mag.match(line.effect,"%[%s\"%]")                           then log[23] = log[23] + 1 end
		if mag.match(line.effect,"%[%s%.%.%.%]")                       then log[24] = log[24] + 1 end
		if mag.match(line.effect,"%[%.%.%.%s]")                        then log[25] = log[25] + 1 end
		if mag.match(line.effect,"%[%,%s%*%]")                         then log[26] = log[26] + 1 end
		if mag.match(line.effect,"%[%:%s%*%]")                         then log[27] = log[27] + 1 end
		if mag.match(line.effect,"%[%;%s%*%]")                         then log[28] = log[28] + 1 end
		if mag.match(line.effect,"%[%?%s%*%]")                         then log[29] = log[29] + 1 end
		if mag.match(line.effect,"%[%!%s%*%]")                         then log[30] = log[30] + 1 end
		if mag.match(line.effect,"%[%.%s%*%]")                         then log[31] = log[31] + 1 end
	end
	local total_problem
	total_problem = 0
	for t = 1, 4 do total_problem = total_problem + log[t] end
	if total_problem > 0 then
	pcs = true
	mag.log("[ ZAMANLAMA ]"..mag.wall("-",96))
	echo(log[1],  "Mevcut satır, girilen zaman değerinden daha az")
	echo(log[2],  "Mevcut satır, girilen zaman değerinden daha fazla")
	echo(log[3],  "Sonraki satır, girilen zaman değerinden daha az")
	echo(log[4],  "Saniyedeki karakter sayısı, girilen saniyedeki karakter süresinden fazla")
	echo(log[5],  "Süreleri çakışan satırlar var")
	mag.log(mag.wall("-",114))
	mag.log("Toplam: %s satır",{total_problem})
	end
	total_problem = 0
	for t = 6, 7 do total_problem = total_problem + log[t] end
	if total_problem > 0 then
	if pcs then mag.log("") end
	pcs = true
	mag.log("[ KARAKTER ]"..mag.wall("-",100))
	echo(log[6],  "Girilen karakter sayısını aşan satırlar var")
	echo(log[7],  "Satır bölünme yapıldığı halde bir kısmı girilen karakter sayısını aşan satırlar var")
	mag.log(mag.wall("-",114))
	mag.log("Toplam: %s satır",{total_problem})
	end
	total_problem = 0
	for t = 8, 31 do total_problem = total_problem + log[t] end
	if total_problem > 0 then
	if pcs then mag.log("") end
	pcs = true
	mag.log("[ BOŞLUK ]"..mag.wall("-",102))
	echo(log[8],  "Birden fazla boşluk var")
	echo(log[9],  "Satırın başında ve sonunda boşluk var")
	echo(log[10], "Satırın sonunda boşluk var")
	echo(log[11], "Satırın başında boşluk var")
	echo(log[12], "Noktadan önce boşluk var")
	echo(log[13], "Virgülden önce boşluk var")
	echo(log[14], "Ünlemden önce boşluk var")
	echo(log[15], "Soru işaretinden önce boşluk var")
	echo(log[16], "İki noktadan önce boşluk var")
	echo(log[17], "Noktalı virgülden önce boşluk var")
	echo(log[18], "Tırnak işaretinden önce ve sonra boşluk var")
	echo(log[19], "Tırnak işaretinden sonra boşluk var")
	echo(log[20], "Tırnak işaretinden önce boşluk var")
	echo(log[21], "Çift tırnaktan önce ve sonra boşluk var")
	echo(log[22], "Çift tırnaktan sonra boşluk var")
	echo(log[23], "Çift tırnaktan önce boşluk var")
	echo(log[24], "Satırın sonundaki üç noktadan önce boşluk var")
	echo(log[25], "Satırın başındaki üç noktadan önce boşluk var")
	echo(log[26], "Virgülden sonra boşluk koyulmalı")
	echo(log[27], "İki noktadan sonra boşluk koyulmalı")
	echo(log[28], "Noktalı virgülden sonra boşluk koyulmalı")
	echo(log[29], "Soru işaretinden sonra boşluk koyulmalı")
	echo(log[30], "Ünlemden sonra boşluk koyulmalı")
	echo(log[31], "Noktadan sonra boşluk koyulmalı")
	mag.log(mag.wall("-",114))
	mag.log("Toplam: %s satır",{total_problem})
	end
	mag.log_error(pcs,mag.message["no_process"])
	end
	mag.set_config(c)
	end

	function echo(count,alert)
	if count > 0 then mag.log("(%s SATIR BULUNDU) %s",{count,alert}) end
	end

	function add_macro2(subs)
	local pcs = false
	for i = 1, #subs do
	local line = subs[i]
		if line.class == "dialogue" then
			if mag.find(line.effect,c_main_msg) == 2 then
			pcs         = true
			line.effect = ""
			end
		end
	if pcs then subs[i] = line end
	end
	mag.log_error(pcs,mag.message["no_process"])
	end

	function check_macro(subs,sel)
	local fe, fee = pcall(add_macro,subs,sel)
	mag.funce(fe,fee)
	end

	function check_macro1(subs,sel)
	local fe, fee = pcall(add_macro1,subs,sel)
	mag.funce(fe,fee)
	end

	function check_macro2(subs)
	local fe, fee = pcall(add_macro2,subs)
	mag.funce(fe,fee)
	end

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
		mag.register(script_name.."/Aç",               check_macro)
		mag.register(script_name.."/Girdileri oku",    check_macro1)
		mag.register(script_name.."/Girdileri kaldır", check_macro2)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end
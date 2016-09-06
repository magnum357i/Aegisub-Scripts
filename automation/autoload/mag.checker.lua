	script_name        = "Checker"
	script_description = "Satırlardaki sorunları kontrol eder."
	script_version     = "0.7"
	script_author      = "Magnum357"
	script_mag_version = "1.1.2.0"

	mag_import, mag = pcall(require,"mag")

	c_time                = true
	c_time_min            = false
	c_time_min_value      = "0:00:00.70"
	c_time_max            = false
	c_time_max_value      = "0:00:06.00"
	c_time_next_min       = false
	c_time_next_min_value = "0:00:00.06"
	c_char                = true
	c_char_max            = false
	c_char_max_value      = 44
	c_char_range          = false
	c_char_range_value    = 44
	c_space               = true
	c_space_double        = false
	c_space_line          = false
	c_space_break_line    = false
	c_space_dots          = false
	c_main_msg            = mag.format("[%s]",script_name)
	c_comment_lines       = true

	function checker(subs,sel,config)
	local pcs         = false
	local pcs2        = false
	local apply_lines = mag.unstyles(config.u_apply_lines)
	local first_index = mag.first_index(subs) - 1
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
	local line     = subs[k]
	local style1   = 1
	local style2   = 1
	local comment1 = 1
	local comment2 = 1
	if c_comment_lines then comment1, comment2 = line.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = line.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 and line.class == "dialogue" then
		local dur
		local check = ""
		local result = ""
			if c_time or c_time_min or c_time_max then
				if line.end_time > line.start_time then
				dur = line.end_time - line.start_time
				else
				dur = 0
				end
				if c_time or c_time_min then
					if dur < mag.time_strip(c_time_min_value) then
					check = split2(check,mag.format("[1 - %s-]",mag.time_format(mag.time_strip(c_time_min_value) - dur)))
					end
				end
				if c_time or c_time_max then
					if dur > mag.time_strip(c_time_max_value) then
					check = split2(check,mag.format("[1 - %s+]",mag.time_format(dur - mag.time_strip(c_time_max_value))))
					end
				end
				if c_time or c_time_next_min then
				dur = 0
					if k ~= i_last then
					local next_line = subs[k + 1]
						if next_line.start_time > line.end_time then
						dur = next_line.start_time - line.end_time
							if dur < mag.time_strip(c_time_next_min_value) then
							check = split2(check,mag.format("[2 - %s-]",mag.time_format(mag.time_strip(c_time_next_min_value) - dur)))
							end
						end
					end
				end
			end
		check  = put_title("Z: ",check)
		result = split(check,result)
		check  = ""
			if c_char or c_char_max or c_char_range then
				if not mag.match(mag.strip(line.text),"\\N") then
				local strip_line = line.text
				strip_line       = mag.full_strip(line.text)
				strip_line       = mag.removedot(strip_line)
					if mag.n(mag.len(strip_line)) >= mag.n(c_char_max_value) then
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
						if mag.n(mag.len(strip_char)) >= mag.n(c_char_range_value) then
						mag.insert(break_part,mag.len(strip_char))
						end
					end
					if break_part[1] then
					table.sort(break_part)
					break_part  = mag.reverse_short_array(break_part)
					check       = split2(check,mag.format("[%sN]",break_part[1]))
					end
				end
			end
		check  = put_title("K: ",check)
		result = split(check,result)
		check  = ""
			if c_space or c_space_double or c_space_break_line or c_space_line then
			local strip_line   = ""
			strip_line         = line.text
			strip_line         = mag.strip(strip_line)
			strip_line         = mag.special_strip(strip_line)
			local strip_line_2 = ""
			strip_line_2       = line.text
			strip_line_2       = mag.strip(strip_line_2)
				if c_space or c_space_double then
				local space_count = mag.ccount(strip_line,"%s")
				local sp          = {}
				local plus        = ""
				local sp_plus     = ""
				local sp_check    = false
				local sc          = 0
				local sp_temp     = strip_line
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
							sp_plus = mag.format("%s%s%s>%s",sp_plus,plus,sc,sp[s2])
							plus    = "+"
							end
						end
						if sp_check then
						check = split2(check,mag.format("[%s]",sp_plus))
						end
					end
				end
				if c_space or c_space_break_line then
					if mag.match(strip_line_2,"%s\\N%s") then
					check = split2(check,mag.format("[ %s ]","\\N"))
					elseif mag.match(strip_line_2,"%s\\N") then
					check = split2(check,mag.format("[ %s]","\\N"))
					elseif mag.match(strip_line_2,"\\N%s") then
					check = split2(check,mag.format("[%s ]","\\N"))
					end
				end
				if c_space or c_space_line then
					if mag.find(strip_line,"%s") == 1 and mag.find(mag.reverse(strip_line),"%s") == 1 then
					check = split2(check,mag.format("[ %s ]","S"))
					elseif mag.find(strip_line,"%s") == 1 then
					check = split2(check,mag.format("[ %s]","S"))
					elseif mag.find(mag.reverse(strip_line),"%s") == 1 then
					check = split2(check,mag.format("[%s ]","S"))
					end
				end
				if c_space or c_space_dots then
					if mag.find(strip_line,"%s,") then
					check = split2(check,mag.format("[%s]"," ,"))
					end
					if mag.find(strip_line,"%s!") then
					check = split2(check,mag.format("[%s]"," !"))
					end
					if mag.find(strip_line,"%s%?") then
					check = split2(check,mag.format("[%s]"," ?"))
					end
					if mag.find(strip_line,"%s:") then
					check = split2(check,mag.format("[%s]"," :"))
					end
					if mag.find(strip_line,"%s;") then
					check = split2(check,mag.format("[%s]"," ;"))
					end
					if mag.find(strip_line,"%s'%s") then
					check = split2(check,mag.format("[%s]"," ' "))
					elseif mag.find(strip_line,"%s'") then
					check = split2(check,mag.format("[%s]"," '"))
					elseif mag.find(strip_line,"'%s") then
					check = split2(check,mag.format("[%s]","' "))
					end
				local qtext = mag.match(strip_line,"\".+\"")
					if qtext then
						if mag.match(qtext,"\" ") then
						check = split2(check,mag.format("[%s ]","\" "))
						end
						if mag.match(qtext," \"") then
						check = split2(check,mag.format("[ %s]"," \""))
						end
					end
				qtext = mag.space_trim(strip_line)
					if mag.find(qtext,"%.%.%.%s") == 1 then
					check = split2(check,mag.format("[%s]","... "))
					end
					if mag.find(mag.reverse(qtext),"%.%.%.%s") == 1 then
					check = split2(check,mag.format("[%s]"," ..."))
					end
				end
			end
		check  = put_title("B: ",check)
		result = split(check,result)
		check  = ""
		result      = p(result)
		result      = put_title(mag.format("%s ",c_main_msg),mag.format("%s",result))
		if result ~= "" then pcs = true end
		line.effect = result
		subs[k]     = line
		end
	end
	mag.log_error(pcs,"Hiçbir işlem yapılmadı.")
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
	local sel_total_format  = sel_total_format(subs,sel,"comment","Seçili satırlar")
	local subs_total_format = subs_total_format(subs,sel,"comment","Tüm stiller")
	local apply_items       = {"Seç",sel_total_format,subs_total_format}
	local z                 = false
	local gui, ok, config
	repeat
	gui =
	{
--[[01]] {class = "checkbox", name = "u_time",                value = c_time,                                 x = 0, y = 0,  width = 3, height = 1, label = "[(Z) - ZAMAN]"}
--[[02]],{class = "label",                                                                                    x = 0, y = 1,  width = 1, height = 1, label = mag.wall(" ",4)}
--[[03]],{class = "checkbox", name = "u_time_min",            value = c_time_min,                             x = 1, y = 1,  width = 1, height = 1, label = "Şundan az:"}
--[[04]],{class = "edit",     name = "u_time_min_value",      value = c_time_min_value,                       x = 2, y = 1,  width = 1, height = 1}
--[[05]],{class = "checkbox", name = "u_time_max",            value = c_time_max,                             x = 1, y = 2,  width = 1, height = 1, label = "Şundan fazla:"}
--[[06]],{class = "edit",     name = "u_time_max_value",      value = c_time_max_value,                       x = 2, y = 2,  width = 1, height = 1}
--[[07]],{class = "checkbox", name = "u_time_next_min",       value = c_time_next_min,                        x = 1, y = 3,  width = 1, height = 1, label = "Sonraki satır şundan az:"}
--[[08]],{class = "edit",     name = "u_time_next_min_value", value = c_time_next_min_value,                  x = 2, y = 3,  width = 1, height = 1}
--[[09]],{class = "checkbox", name = "u_char",                value = c_char,                                 x = 0, y = 4,  width = 3, height = 1, label = "[(K) - KARAKTER]"}
--[[10]],{class = "checkbox", name = "u_char_max",            value = c_char_max,                             x = 1, y = 5,  width = 1, height = 1, label = "Sınır:", hint = "Satır bölme yapılmamış satırların karakter sayısını ölçer."}
--[[11]],{class = "edit",     name = "u_char_max_value",      value = c_char_max_value,   min = 35, max = 50, x = 2, y = 5,  width = 1, height = 1}
--[[12]],{class = "checkbox", name = "u_char_range",          value = c_char_range,                           x = 1, y = 6,  width = 1, height = 1, label = "Satır bölme arası:", hint = "Satır bölme yapılmış satırların en fazla olan karakter sayısını ölçer."}
--[[13]],{class = "edit",     name = "u_char_range_value",    value = c_char_range_value, min = 35, max = 50, x = 2, y = 6,  width = 1, height = 1}
--[[14]],{class = "checkbox", name = "u_space",               value = c_space,                                x = 0, y = 7,  width = 3, height = 1, label = "[(B) - BOŞLUK]"}
--[[15]],{class = "checkbox", name = "u_space_double",        value = c_space_double,                         x = 1, y = 8,  width = 2, height = 1, label = "Birden fazla."}
--[[16]],{class = "checkbox", name = "u_space_line",          value = c_space_line,                           x = 1, y = 9,  width = 2, height = 1, label = "Satırdan önce ve sonra."}
--[[17]],{class = "checkbox", name = "u_space_break_line",    value = c_space_break_line,                     x = 1, y = 10, width = 2, height = 1, label = "Satır bölmeden önce ve sonra."}
--[[18]],{class = "checkbox", name = "u_space_dots",          value = c_space_dots,                           x = 1, y = 11, width = 2, height = 1, label = "Noktralama işaretlerinden önce ve sonra."}
--[[19]],{class = "label",                                                                                    x = 0, y = 12, width = 3, height = 1, label = "[UYGULANACAK SATIRLAR]"}
--[[20]],{class = "dropdown", name = "u_apply_lines",         value = "Seç",                                  x = 0, y = 13, width = 3, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir."}
--[[21]],{class = "checkbox", name = "u_comment_lines",       value = c_comment_lines,                        x = 0, y = 14, width = 3, height = 1, label = "Yorum satırlarını geç."}
	}
		if not z then
		z = true
		mag.styles_insert(subs,gui,20,"comment","")
		end
	ok, config = mag.dlg(gui,{"Kontrol et","Kapat"})
	c_time                = config.u_time
	c_time_min            = config.u_time_min
	c_time_min_value      = config.u_time_min_value
	c_time_max            = config.u_time_max
	c_time_max_value      = config.u_time_max_value
	c_time_next_min       = config.u_time_next_min
	c_time_next_min_value = config.u_time_next_min_value
	c_char                = config.u_char
	c_char_max            = config.u_char_max
	c_char_max_value      = config.u_char_max_value
	c_char_range          = config.u_char_range
	c_char_range_value    = config.u_char_range_value
	c_space               = config.u_space
	c_space_double        = config.u_space_double
	c_space_line          = config.u_space_line
	c_space_break_line    = config.u_space_break_line
	c_space_dots          = config.u_space_dots
	c_comment_lines       = config.u_comment_lines
	until config.u_apply_lines ~= "Seç" and ok == "Kontrol et" or ok == "Kapat"
	if ok == "Kontrol et" then
	t_check = false
		if mag.time_strip(c_time_min_value) == 0 or mag.time_strip(c_time_max_value) == 0 or mag.time_strip(c_time_next_min_value) == 0 then
		t_check = true
		end
		if not t_check then
			if not time_check(c_time_min_value) or not time_check(c_time_max_value) or not time_check(c_time_next_min_value) then
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
	end

	function time_check(time)
	t              = true
	t1, t2, t3, t4 = mag.match(time,"(%d+):(%d+):(%d+).(%d+)")
	if mag.n(mag.len(t1)) > 2 or mag.n(mag.len(t2)) > 2 or mag.n(mag.len(t3)) > 2 or mag.n(mag.len(t4)) > 2 then
	t = false
	end
	return t
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
		mag.register(false,add_macro)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end
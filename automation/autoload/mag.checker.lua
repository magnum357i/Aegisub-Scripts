	script_name        = "Checker"
	script_description = "Satırlardaki sorunları kontrol eder."
	script_version     = "0.8.3"
	script_author      = "Magnum357"
	script_mag_version = "1.1.2.4"

	mag_import, mag = pcall(require,"mag")

	c                     = {}
	c.time                = true
	c.time_min            = false
	c.time_min_value      = "0:00:00.70"
	c.time_max            = false
	c.time_max_value      = "0:00:06.00"
	c.time_next_min       = false
	c.time_next_min_value = "0:00:00.06"
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
	c_main_msg            = mag.format("[%s]",script_name)
	c_buttons             = {"Kontrol et","Kapat"}

	function checker(subs,sel,config)
	local pcs         = false
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
	local line     = subs[k]
	local style1   = 1
	local style2   = 1
	local comment1 = 1
	local comment2 = 1
	if c.comment_lines then comment1, comment2 = line.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = line.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 and line.class == "dialogue" then
		local dur
		local check = ""
		local result = ""
			if c.time or c.time_min or c.time_max then
				if line.end_time > line.start_time then
				dur = line.end_time - line.start_time
				else
				dur = 0
				end
				if c.time or c.time_min then
					if dur < mag.time_strip(c.time_min_value) then
					check = split2(check,mag.format("[1 - %s-]",mag.time_format(mag.time_strip(c.time_min_value) - dur)))
					end
				end
				if c.time or c.time_max then
					if dur > mag.time_strip(c.time_max_value) then
					check = split2(check,mag.format("[1 - %s+]",mag.time_format(dur - mag.time_strip(c.time_max_value))))
					end
				end
				if c.time or c.time_next_min then
				dur = 0
					if k ~= #subs then
					local next_line = subs[k + 1]
						if next_line.start_time > line.end_time then
						dur = next_line.start_time - line.end_time
							if dur < mag.time_strip(c.time_next_min_value) then
							check = split2(check,mag.format("[2 - %s-]",mag.time_format(mag.time_strip(c.time_next_min_value) - dur)))
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
					table.sort(break_part)
					break_part = mag.reverse_short_array(break_part)
					check      = split2(check,mag.format("[%sN]",break_part[1]))
					end
				end
			end
		check  = put_title("K: ",check)
		result = split(check,result)
		check  = ""
			if c.space or c.space_double or c.space_break_line or c.space_line then
			local strip_tag             = line.text
			strip_tag                   = mag.strip(strip_tag)
			local strip_tag_and_special = strip_tag
			strip_tag_and_special       = mag.gsub(strip_tag_and_special,"\\[nN]","")
			strip_tag_and_special       = mag.gsub(strip_tag_and_special,"\\h"," ")
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
				local qtext = ""
				qtext       = mag.match(strip_tag_and_special,"\".-\"")
					if qtext then
						if mag.match(qtext,"\" ") then
						check = split2(check,mag.format("[%s ]","\" "))
						end
						if mag.match(qtext," \"") then
						check = split2(check,mag.format("[ %s]"," \""))
						end
					end
				qtext = mag.space_trim(strip_tag_and_special)
					if mag.find(qtext,"%.%.%.%s") == 1 then
					check = split2(check,mag.format("[%s]","... "))
					end
					if mag.find(mag.reverse(qtext),"%.%.%.%s") == 1 then
					check = split2(check,mag.format("[%s]"," ..."))
					end
				end
			end
		check       = put_title("B: ",check)
		result      = split(check,result)
		check       = ""
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
	mag.get_config(c)
	local apply_items       = mag.apply_items(subs,sel,"comment","")
	c.apply                 = mag.search_apply_items(apply_items,c.apply)
	local gui, ok, config
	repeat
	gui =
	{
	 {class = "checkbox", name = "u_time",                value = c.time,                                 x = 0, y = 0,  width = 3, height = 1, label = "[(Z) - ZAMAN]"}
	,{class = "label",                                                                                    x = 0, y = 1,  width = 1, height = 1, label = mag.wall(" ",4)}
	,{class = "checkbox", name = "u_time_min",            value = c.time_min,                             x = 1, y = 1,  width = 1, height = 1, label = "Şundan az:"}
	,{class = "edit",     name = "u_time_min_value",      value = c.time_min_value,                       x = 2, y = 1,  width = 1, height = 1}
	,{class = "checkbox", name = "u_time_max",            value = c.time_max,                             x = 1, y = 2,  width = 1, height = 1, label = "Şundan fazla:"}
	,{class = "edit",     name = "u_time_max_value",      value = c.time_max_value,                       x = 2, y = 2,  width = 1, height = 1}
	,{class = "checkbox", name = "u_time_next_min",       value = c.time_next_min,                        x = 1, y = 3,  width = 1, height = 1, label = "Sonraki satır şundan az:"}
	,{class = "edit",     name = "u_time_next_min_value", value = c.time_next_min_value,                  x = 2, y = 3,  width = 1, height = 1}
	,{class = "checkbox", name = "u_char",                value = c.char,                                 x = 0, y = 4,  width = 3, height = 1, label = "[(K) - KARAKTER]"}
	,{class = "checkbox", name = "u_char_max",            value = c.char_max,                             x = 1, y = 5,  width = 1, height = 1, label = "Sınır:", hint = "Satır bölme yapılmamış satırların karakter sayısını ölçer."}
	,{class = "edit",     name = "u_char_max_value",      value = c.char_max_value,   min = 35, max = 50, x = 2, y = 5,  width = 1, height = 1}
	,{class = "checkbox", name = "u_char_range",          value = c.char_range,                           x = 1, y = 6,  width = 1, height = 1, label = "Satır bölme arası:", hint = "Satır bölme yapılmış satırların en fazla olan karakter sayısını ölçer."}
	,{class = "edit",     name = "u_char_range_value",    value = c.char_range_value, min = 35, max = 50, x = 2, y = 6,  width = 1, height = 1}
	,{class = "checkbox", name = "u_space",               value = c.space,                                x = 0, y = 7,  width = 3, height = 1, label = "[(B) - BOŞLUK]"}
	,{class = "checkbox", name = "u_space_double",        value = c.space_double,                         x = 1, y = 8,  width = 2, height = 1, label = "Birden fazla."}
	,{class = "checkbox", name = "u_space_line",          value = c.space_line,                           x = 1, y = 9,  width = 2, height = 1, label = "Satırdan önce ve sonra."}
	,{class = "checkbox", name = "u_space_break_line",    value = c.space_break_line,                     x = 1, y = 10, width = 2, height = 1, label = "Satır bölmeden önce ve sonra."}
	,{class = "checkbox", name = "u_space_dots",          value = c.space_dots,                           x = 1, y = 11, width = 2, height = 1, label = "Noktralama işaretlerinden önce ve sonra."}
	,{class = "label",                                                                                    x = 0, y = 12, width = 3, height = 1, label = "[UYGULANACAK SATIRLAR]"}
	,{class = "dropdown", name = "u_apply_lines",         value = c.apply,                                x = 0, y = 13, width = 3, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir."}
	,{class = "checkbox", name = "u_comment_lines",       value = c.comment_lines,                        x = 0, y = 14, width = 3, height = 1, label = "Yorum satırlarını geç."}
	}
	ok, config = mag.dlg(gui,c_buttons)
	c.time                = config.u_time
	c.time_min            = config.u_time_min
	c.time_min_value      = config.u_time_min_value
	c.time_max            = config.u_time_max
	c.time_max_value      = config.u_time_max_value
	c.time_next_min       = config.u_time_next_min
	c.time_next_min_value = config.u_time_next_min_value
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

	function check_macro(subs,sel)
	local fe, fee = pcall(add_macro,subs,sel)
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
		mag.register(false,check_macro)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end
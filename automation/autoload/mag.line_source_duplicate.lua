	script_name        = "Line Source Duplicate"
	script_description = "Kaynak metni çoğaltarak kaynak metinle beraber çeviri imkanı sunar."
	script_author      = "Magnum357"
	script_version     = "3.0"
	script_mag_version = "1.1.2.1"
	
	mag_import, mag = pcall(require,"mag")
	
	c_r_msg1        = "[LineSDup]"
	c_r_msg2        = "[#LineSDup]"
	c_mods          = "Seç"
	c_comment_lines = false
	c_mod2          = false
	c_mod_names     = {"Seç","[A1] Yorum parantezleri > Satır sonu","[B1] Yeni satır > Sonraki satır","[B2] Yeni satır > Son satırdan sonra"}
	c_buttons       = {"Çoğalt","Kapat"}
	c_buttons1      = {"Kaldır","Kapat"}

	function line_source_duplicate(subs,sel,config)
	local index       = {}
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
	if c_comment_lines then comment1, comment2 = line.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = line.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 and line.class == "dialogue" then
		local strip_line = strip(line.text)
			if c_mod_names[2] == c_mods then
			line.effect = c_r_msg1
				if not c_mod2 then
				line.text = mag.format("%s{%s}",line.text,strip_line)
				else
				line.text = mag.format("{%s}",strip_line)
				end
			end
			if c_mod_names[3] == c_mods or c_mod_names[4] == c_mods then
			mag.insert(index,k)
			end
		subs[k] = line
		end
	end
	if index[1] ~= nil then
	local j = 0
	local line2, text2, l
		if c_mod_names[3] == c_mods then
			for i = 1, #index do
			line2    = subs[index[i] + j]
			text2    = strip(line2.text)
			l        = table.copy(line2)
			l.effect = c_r_msg2
				if not c_mod2 then
				l.comment = true
				end
			subs.insert((index[i] + 1) + j,l)
			j = j + 1
			end
		elseif c_mod_names[4] == c_mods then
		local last_item_style_index = last_item_for_style(subs,apply_lines)
			for i = 1, #index do
			line2    = subs[index[i]]
			text2    = strip(line2.text)
			l        = table.copy(line2)
			l.effect = c_r_msg2
				if not c_mod2 then
				l.comment = true
				end
			subs.insert(last_item_style_index + 1 + j,l)
			j = j + 1
			end
		end
	end
	end

	function remove_line_source_duplicate(subs,sel,config)
	local index       = {}
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
	if c_comment_lines then comment1, comment2 = line.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = line.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 and line.class == "dialogue" then
			if line.effect == c_r_msg1 then
			local t1, t2 = mag.rfind(line.text,"{"), mag.rfind(line.text,"}")
				if t1 and t2 then
					if t2 > t1 then
					pcs         = true
					local t     = ""
					t           = t..mag.sub(line.text,0,t1 - 1)
					t           = t..mag.sub(line.text,t2 + 1,mag.len(line.text) * 2)
					line.text   = t
					line.effect = ""
					end
				end
			elseif line.effect == c_r_msg2 and line.comment then
			pcs = true
			mag.insert(index,k)
			end
		subs[k] = line
		end
	end
	if index[1] ~= nil then
	local ict = 1
	index = mag.reverse_short_array(index)
		for i = #subs, 1, -1 do
			if i == index[ict] then
			ict = ict + 1
			subs.delete(i)
			end
		end
	end
	mag.log_error(pcs,"Hiçbir işlem yapılmadı.")
	end

	function last_item_for_style(subs,style_name)
	local last_item, n = 0, 0
	total_line         = mag.total(subs,style_name,"default","")
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
			if subs[i].style == style_name then
			n = n + 1
				if n == total_line then
				last_item = i
				end
			end
		end
	end
	return last_item
	end

	function strip(text)
	text = mag.full_strip(text)
	text = mag.space_trim(text)
	return text
	end

	function add_macro(subs,sel)
	local sel_total_format  = sel_total_format(subs,sel,"comment","Seçili satırlar")
	local subs_total_format = subs_total_format(subs,sel,"comment","Tüm stiller")
	local apply_items       = {"Seç",sel_total_format,subs_total_format}
	local z                 = false
	local ok, config, gui
	repeat
	gui =
	{
	 {class = "label",                                                       x = 0, y = 0, width = 1, height = 1, label = mag.wall(" ",27).."Mod:"}
	,{class = "dropdown", name = "u_mods",          value = c_mods,          x = 1, y = 0, width = 1, height = 1, items = c_mod_names}
	,{class = "label",                                                       x = 0, y = 1, width = 1, height = 1, label = "Uygulanacak satırlar:"}
	,{class = "dropdown", name = "u_apply_lines",   value = "Seç",           x = 1, y = 1, width = 1, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_lines", value = c_comment_lines, x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_mod2",          value = c_mod2,          x = 1, y = 3, width = 1, height = 1, label = "Modları değiştir.", hint = "A modunda sadece yorum parantezi kullanır.\nB modlarında yorum satırı yerine normal satır yapar."}
	}
		if not z then
		z = true
		mag.styles_insert(subs,gui,4,"comment","")
		end
	ok, config = mag.dlg(gui,c_buttons)
	c_mods          = config.u_mods
	c_comment_lines = config.u_comment_lines
	c_mod2          = config.u_mod2
	until ok == c_buttons[1] and config.u_mods ~= "Seç" and config.u_apply_lines ~= "Seç" or ok == c_buttons[2]
	if ok == c_buttons[1] then
	line_source_duplicate(subs,sel,config)
	mag.undo_point()
	end
	end

	function add_macro1(subs,sel)
	local sel_total_format  = sel_total_format(subs,sel,"comment","Seçili satırlar")
	local subs_total_format = subs_total_format(subs,sel,"comment","Tüm stiller")
	local apply_items       = {"Seç",sel_total_format,subs_total_format}
	local z                 = false
	local ok, config, gui
	repeat
	gui =
	{
	 {class = "label",                                                       x = 0, y = 0, width = 1, height = 1, label = "Uygulanacak satırlar:"}
	,{class = "dropdown", name = "u_apply_lines",   value = "Seç",           x = 1, y = 0, width = 1, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	--,{class = "checkbox", name = "u_comment_lines", value = c_comment_lines, x = 1, y = 1, width = 1, height = 1, label = "Yorum satırlarını geç."}
	}
		if not z then
		z = true
		mag.styles_insert(subs,gui,2,"comment","")
		end
	ok, config = mag.dlg(gui,c_buttons1)
	--c_comment_lines = config.u_comment_lines
	until ok == c_buttons1[1] and config.u_apply_lines ~= "Seç" or ok == c_buttons1[2]
	if ok == c_buttons1[1] then
	remove_line_source_duplicate(subs,sel,config)
	mag.undo_point()
	end
	end

	function check_macro(subs,sel)
	local fe, fee = pcall(add_macro,subs,sel)
	mag.funce(fe,fee)
	end

	function check_macro1(subs,sel)
	local fe, fee = pcall(add_macro1,subs,sel)
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
		mag.register(script_name.."/Ekle",check_macro)
		mag.register(script_name.."/Kaldır",check_macro1)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end
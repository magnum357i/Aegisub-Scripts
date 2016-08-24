	script_name        = "Copy Dialogue"
	script_description = "Alt yazıdaki metinleri panoya veya oluşturduğu metin dosyasına kopyalar."
	script_version     = "1.3.3"
	script_author      = "Magnum357"
	script_mag_version = "1.1.1.9"

	mag_import, mag = pcall(require,"mag")

	function copy(subs,sel,config)
	local count       = 0
	local line_break  = ""
	local result      = ""
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
		if comment1 == comment2 and style1 == style2 then
		local time = ""
			if c_line_timing then
			local sf = ""
			local ef = ""
				if aegisub.frame_from_ms(line.start_time) then
				sf = mag.format("(%s)",aegisub.frame_from_ms(line.start_time))
				end
				if aegisub.frame_from_ms(line.end_time) then
				ef = mag.format("(%s)",aegisub.frame_from_ms(line.end_time))
				end
			time = mag.format("%s%s / %s%s",mag.time_format(line.start_time),sf,mag.time_format(line.end_time),ef)
			end
		local number = ""
		if c_line_count then
		count  = count + 1
		number = mag.format("%s",count)
		end
		if number ~= "" and c_line_number then
		number = mag.format("%s / %s",number,k - first_index)
		elseif number == "" and c_line_number then
		number = mag.format("%s",k - first_index)
		end
		local text = ""
			if c_strip_line then
			text = mag.space_trim(mag.full_strip(line.text))
			else
			text = line.text
			end
		local t = ""
			if number ~= "" and time == "" then
			t = number
			elseif number == "" and time ~= "" then
			t = time
			elseif number ~= "" and time ~= "" then
			t = mag.format("%s - %s",number,time)
			end
			if t ~= "" then
			t = mag.format("[%s] ",t)
			end
		result     = mag.format("%s%s%s%s",result,line_break,t,text)
		line_break = "\n"
		end
	end
	if result == "" then result = "Copy Dialogue: İşleminiz yapılamadı. Doğru tercihler yaptığınıza emin olun." end
	return result
	end

	c_copy          = "Pano"
	c_comment_lines = true
	c_strip_line    = true
	c_line_timing   = true
	c_line_number   = false
	c_line_count    = false

	function add_macro(subs,sel)
	local sel_total_format  = sel_total_format(subs,sel,"comment","Seçili satırlar")
	local subs_total_format = subs_total_format(subs,sel,"comment","Tüm stiller")
	local apply_items       = {"Seç",sel_total_format,subs_total_format}
	local z                 = false
	local ok, config
	repeat
	local gui =
	{{class = "label",                                                       x = 0, y = 0, width = 1, height = 1, label = "Şundan:"}
	,{class = "dropdown", name = "u_apply_lines",   value = "Seç",           x = 1, y = 0, width = 1, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir."}
	,{class = "label",                                                       x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",4).."Şuna:"}
	,{class = "dropdown", name = "u_copy",          value = c_copy,          x = 1, y = 1, width = 1, height = 1, items = {"Pano","Metin dosyası"}}
	,{class = "checkbox", name = "u_comment_lines", value = c_comment_lines, x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_strip_line",    value = c_strip_line,    x = 1, y = 3, width = 1, height = 1, label = "Satırı temizle.", hint = "Satırdan etiket, satır bölme gibi şeyleri temizleyip metni salt halinde kopyalar."}
	,{class = "checkbox", name = "u_line_timing",   value = c_line_timing,   x = 1, y = 4, width = 1, height = 1, label = "Zamanları ekle."}
	,{class = "checkbox", name = "u_line_number",   value = c_line_number,   x = 1, y = 5, width = 1, height = 1, label = "Satır numarası ekle."}
	,{class = "checkbox", name = "u_line_count",    value = c_line_count,    x = 1, y = 6, width = 1, height = 1, label = "Satırları say."}
	}
		if not z then
		z = true
		mag.styles_insert(subs,gui,2,"comment","")
		end
	ok, config = mag.dlg(gui,{"Kopyala","Kapat"})
	c_copy           = config.u_copy
	c_comment_lines  = config.u_comment_lines
	c_strip_line     = config.u_strip_line
	c_line_timing    = config.u_line_timing
	c_line_number    = config.u_line_number
	c_line_count     = config.u_line_count
	mag.remove(gui,2)
	until ok == "Kapat" or ok == "Kopyala" and config.u_apply_lines ~= "Seç"
	if ok == "Kopyala" then
		if c_copy == "Pano" then
		mag.cset(copy(subs,sel,config))
		elseif c_copy == "Metin dosyası" then
		local file_name = aegisub.dialog.save("Kaydedilecek yeri seçin.","","","Metin dosyası (*.txt)|*.txt",false)
			if file_name then
			local file = io.open(file_name,"w")
			file:write(copy(subs,sel,config))
			file:close()
			end
		end
	end
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
	script_name        = "Copy Dialogue"
	script_description = "Alt yazıdaki metinleri panoya veya oluşturduğu metin dosyasına kopyalar."
	script_version     = "1.3"
	script_author      = "Magnum357"

	mag_import, mag = pcall(require,"mag")

	function copy(subs,sel,config)
	local count        = 0
	local line_break   = ""
	local result       = ""
	local apply_lines  = mag.unstyles(config["u_apply_lines"])
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
	if config.u_comment_lines then comment1, comment2 = line.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = line.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 then
		count = count + 1
		local time = ""
		local sf   = ""
		local ef   = ""
			if aegisub.frame_from_ms(line.start_time) then
			sf = mag.format("(%s)",aegisub.frame_from_ms(line.start_time))
			end
			if aegisub.frame_from_ms(line.end_time) then
			ef = mag.format("(%s)",aegisub.frame_from_ms(line.end_time))
			end
		if config.u_line_timing then time = mag.format("%s%s / %s%s",mag.time_format(line.start_time),sf,mag.time_format(line.end_time),ef) end
		local number = ""
			if config.u_line_number then
				if config.u_line_timing then
				time = mag.format(" - %s",time)
				end
			number = mag.format("[%s%s] ",count,time)
			end
		local text
			if config.u_strip_line then
			text = mag.space_trim(mag.full_strip(line.text))
			else
			text = line.text
			end
		if config.u_line_number then time = "" elseif config.u_line_timing then time = mag.format("[%s] ",time) end
		result     = result..line_break..number..time..text
		line_break = "\n"
		end
	end
	if result == "" then result = "Copy Dialogue: İşleminiz yapılamadı. Doğru tercihler yaptığınıza emin olun." end
	return result
	end

	c_apply_lines   = "Seçili satırlar"
	c_copy          = "Pano"
	c_comment_lines = true
	c_strip_line    = true
	c_line_timing   = true
	c_line_number   = false

	function add_macro(subs,sel)
	local gui =
	{{class = "label",                                                       x = 0, y = 0, width = 1, height = 1, label = "Şundan:"}
	,{class = "dropdown", name = "u_apply_lines",   value = c_apply_lines,   x = 1, y = 0, width = 1, height = 1, items = {"Seçili satırlar","Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir."}
	,{class = "label",                                                       x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",4).."Şuna:"}
	,{class = "dropdown", name = "u_copy",          value = c_copy,          x = 1, y = 1, width = 1, height = 1, items = {"Pano","Metin dosyası"}}
	,{class = "checkbox", name = "u_comment_lines", value = c_comment_lines, x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_strip_line",    value = c_strip_line,    x = 1, y = 3, width = 1, height = 1, label = "Satırı temizle.", hint = "Satırdan etiket, satır bölme gibi şeyleri temizleyip metni salt halinde kopyalar."}
	,{class = "checkbox", name = "u_line_timing",   value = c_line_timing,   x = 1, y = 4, width = 1, height = 1, label = "Zamanları ekle."}
	,{class = "checkbox", name = "u_line_number",   value = c_line_number,   x = 1, y = 5, width = 1, height = 1, label = "Satır numarası ekle."}
	}
	mag.styles_insert(subs,gui,2,"comment","")
	local ok, config = mag.dlg(gui,{"Kopyala","Kapat"})
	if ok == "Kopyala" then
	if config.u_apply_lines == "" then config.u_apply_lines = "Seçili satırlar" end
	c_apply_lines   = config.u_apply_lines
	c_copy          = config.u_copy
	c_comment_lines = config.u_comment_lines
	c_strip_line    = config.u_strip_line
	c_line_timing   = config.u_line_timing
	c_line_number   = config.u_line_number
		if config.u_copy == "Pano" then
		mag.cset(copy(subs,sel,config))
		elseif config.u_copy == "Metin dosyası" then
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
	mag.register(false,add_macro)
	else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
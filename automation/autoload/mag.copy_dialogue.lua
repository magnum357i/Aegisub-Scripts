	script_name        = "Copy Dialogue"
	script_description = "Alt yazıdaki metinleri panoya veya oluşturduğu metin dosyasına kopyalar."
	script_version     = "1.1"
	script_author      = "Magnum357"

	mag_import, mag = pcall(require,"mag")

	function copy(subs,sel,config)
	local count        = 0
	local line_break   = ""
	local result       = ""
	local number       = ""
	local strip_line   = config["u_strip_line"]
	local line_number  = config["u_line_number"]
	local apply_lines  = mag.unstyles(config["u_apply_lines"])
	local comment_line = config["u_comment_lines"]
	local line, comment1, comment2, text
	if apply_lines == "Seçili satırlar" then
		for _, li in pairs(sel) do
		line       = subs[li]
		comment1 = 1
		comment2 = 1
			if comment_line then
			comment1 = line.comment
			comment2 = false
			end
			if comment1 == comment2 then
			count = count + 1
			if line_number then number = mag.format("[%s] ",count) end
				if strip_line then
				text = mag.space_trim(mag.full_strip(line.text))
				else
				text = line.text
				end
			result     = result..line_break..number..text
			line_break = "\n"
			end
		end
	return result
	else
	local style1, style2
		for i = 1, #subs do
		line = subs[i]
			if line.class == "dialogue" then
			style1 = line.style
			style2 = apply_lines
			comment1 = 1
			comment2 = 1
				if apply_lines == "Tüm stiller" then
				style1 = 1
				style2 = 1
				end
				if comment_line then
				comment1 = line.comment
				comment2 = false
				end
				if style1 == style2 and comment1 == comment2 then
				count = count + 1
				if line_number then number = mag.format("[%s] ",count) end
					if strip_line then
					text = mag.space_trim(mag.full_strip(line.text))
					else
					text = line.text
					end
				result     = result..line_break..number..text
				line_break = "\n"
				end
			end
		end
	return result
	end
	end

	function gui(subs)
	local dialog_config =
	{{class = "label",                                                         x = 0, y = 0, width = 1, height = 1, label = "Şundan:"}
	,{class = "dropdown", name = "u_apply_lines",   value = "Seçili satırlar", x = 1, y = 0, width = 1, height = 1, items = {"Seçili satırlar","Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir."}
	,{class = "label",                                                         x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",4).."Şuna:"}
	,{class = "dropdown", name = "u_copy",          value = "Pano",            x = 1, y = 1, width = 1, height = 1, items = {"Pano","Metin dosyası"}}
	,{class = "checkbox", name = "u_comment_lines", value = true,              x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_strip_line",    value = true,              x = 1, y = 3, width = 1, height = 1, label = "Satırın salt halini al."}
	,{class = "checkbox", name = "u_line_number",   value = false,             x = 1, y = 4, width = 1, height = 1, label = "Satır sayılarını ekle."}
	}
	mag.styles_insert(subs,dialog_config,2,"comment","")
	return dialog_config
	end

	function add_macro(subs,sel)
	local ok, config = mag.dlg(gui(subs),{"Kopyala","Kapat"})
	if ok == "Kopyala" then
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
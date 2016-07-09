	script_name        = "Line Breaker Checker"
	script_description = "Karakter sınırını aşan satırları bulur."
	script_author      = "Magnum357"
	script_version     = "2.5.4"

	mag_import, mag = pcall(require,"mag")

	function line_breaker_check(subs,sel,config)
	local style_name   = mag.unstyles(config["u_style_name"])
	local max_char     = config["u_max_char"] - 1
	local comment_case = config["u_comment_lines"]
	local msg1         = "Beni böl!"
	local msg2         = "Beni düzgün böl!"
	local c            = 0
	local pcs          = false
	local total_line
	local line
	local text
	if style_name == "Tüm stiller" then
	if comment_case then total_line = mag.total_comment_full(subs) else total_line = mag.total_full(subs) end
	else
	if comment_case then total_line = mag.total(subs,style_name,"comment") else total_line = mag.total(subs,style_name,"default") end
	end
	for i = 1, #subs do
	line     = subs[i]
	text     = subs[i].text
	comment1 = subs[i].comment
	comment2 = false
	style1   = style_name
	style2   = line.style
	if not comment_case then comment1 = 1 comment2 = 1 end
	if style_name == "Tüm stiller" then style1 = 1 style2 = 1 end
		if subs[i].class == "dialogue" and comment1 == comment2 and style1 == style2 then
		c = c + 1
		mag.progress("Satır uzunlukları kontrol ediliyor...",c,total_line,true,500)
			if line.effect == msg1 or line.effect == msg2 then
			line.effect = ""
			pcs = true
			end
		local clear_text = text
		clear_text = mag.strip(clear_text)
		clear_text = mag.removedot(clear_text)
		clear_text = clear_text:gsub("\\h",""):gsub("\\n","")
			if text:match("\\N") then
			local split_count, split_text = 0, {}
			split_count, split_text = mag.splitter(true,clear_text,"\\N")
				for j = 1, split_count do
					if mag.len(mag.gsub(split_text[j],"\\N","")) > max_char then
					line.effect = msg2
					pcs = true
					end
				end
			else
				if max_char < mag.len(clear_text:gsub("\\N","")) then
				line.effect = msg1
				pcs = true
				end
			end
		if pcs == true then subs[i] = line end
		end
	end
	if not pcs then mag.log(2,"Karakter sınırını aşan bölünmemiş satır bulunamadı.") end
	end

	function create_config(subs)
	local dialog_config =
	{{class = "label",                                                     x = 0, y = 0, width = 1, height = 1, label = "Karakter sınırı:"}
	,{class = "intedit",  name = "u_max_char",      value = 44,            x = 1, y = 0, width = 1, height = 1}
	,{class = "label",                                                     x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",18).."Stil:"}
	,{class = "dropdown", name = "u_style_name",    value = "Tüm stiller", x = 1, y = 1, width = 1, height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_lines", value = true,          x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."}
	}
	mag.styles_insert(subs,dialog_config,4,"comment","")
	return dialog_config
	end

	function add_macro(subs)
	local ok, config
	ok, config = mag.dlg(create_config(subs),{"Kontrol et","Kapat"})
	if ok == "Kontrol et" then
	line_breaker_check(subs,sel,config)
	aegisub.set_undo_point(script_name)
	end
	end

	if mag_import then mag.register(false,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end

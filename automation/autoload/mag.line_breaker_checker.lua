	script_name        = "Line Breaker Checker"
	script_description = "Karakter sınırını aşan satırları bulur."
	script_author      = "Magnum357"
	script_version     = "2.6"

	mag_import, mag = pcall(require,"mag")

	function line_breaker_check(subs,sel,config)
	local style_name   = mag.unstyles(config.u_style_name)
	local max_char     = config.u_max_char
	local msg1         = "Beni böl!"
	local msg2         = "Beni düzgün böl!"
	local c            = 0
	local pcs          = false
	local total_line
	if style_name == "Tüm stiller" then
		if config.u_comment_lines then
		total_line = mag.total_comment_full(subs)
		else
		total_line = mag.total_full(subs)
		end
	else
		if config.u_comment_lines then
		total_line = mag.total(subs,style_name,"comment")
		else
		total_line = mag.total(subs,style_name,"default")
		end
	end
	for i = 1, #subs do
	local line     = subs[i]
	local text     = subs[i].text
	local comment1 = subs[i].comment
	local comment2 = false
	local style1   = style_name
	local style2   = line.style
	if not config.u_comment_lines then comment1 = 1 comment2 = 1 end
	if style_name == "Tüm stiller" then style1 = 1 style2 = 1 end
		if subs[i].class == "dialogue" and comment1 == comment2 and style1 == style2 then
		c = c + 1
		mag.progress("Satır uzunlukları kontrol ediliyor...",c,total_line,true,300)
			if mag.match(line.effect,"%(%d+%) "..msg1) or mag.match(line.effect,"%(%d+%) "..msg2) then
			pcs         = true
			line.effect = ""
			end
		local line_break = mag.match(line.text,"\\N")
		local text, len  = text_len(line.text)
			if len >= max_char and not line_break then
			pcs         = true
			line.effect = mag.format("(%s) %s",len,msg1)
			elseif line_break then
			local split_count, split_text = mag.splitter(true,line.text,"\\N")
			local break_part              = {}
			local strip_char
				for j = 1, split_count do
					strip_char = strip_len(split_text[j])
					if strip_char >= max_char then
					table.insert(break_part,strip_char)
					end
				end
				if break_part[1] then
				pcs         = true
				table.sort(break_part)
				break_part  = mag.reverse_short_array(break_part)
				line.effect = mag.format("(%s) %s",break_part[1],msg2)
				end
			end
			if pcs then
			subs[i] = line
			end
		pcs = false
		end
	end
	end

	function text_len(text)
	text = mag.full_strip(text)
	text = mag.removedot(text)
	text = mag.gsub(text," +","")
	return text, mag.len(text)
	end

	function strip_len(text)
	text = remove_special(text)
	text = mag.strip(text)
	text = mag.removedot(text)
	text = mag.gsub(text," +","")
	text = mag.len(text)
	return text
	end

	function remove_special(text) return mag.gsub(text,"\\[nNh]","") end

	function add_macro(subs)
	local gui =
	{{class = "label",                                                                         x = 0, y = 0, width = 1, height = 1, label = "Karakter sınırı:"}
	,{class = "intedit",  name = "u_max_char",      value = 44,            min = 35, max = 50, x = 1, y = 0, width = 1, height = 1}
	,{class = "label",                                                                         x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",18).."Stil:"}
	,{class = "dropdown", name = "u_style_name",    value = "Tüm stiller",                     x = 1, y = 1, width = 1, height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_lines", value = true,                              x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."}
	}
	mag.styles_insert(subs,gui,4,"comment","")
	local ok, config = mag.dlg(gui,{"Kontrol et","Kapat"})
	if ok == "Kontrol et" then
	line_breaker_check(subs,sel,config)
	aegisub.set_undo_point(script_name)
	end
	end

	if mag_import then mag.register(false,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
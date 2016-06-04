	script_name="Line Breaker Checker"
	script_description="Karakter sınırını aşan satırları bulur."
	script_author="Magnum357"
	script_version="2.5"

	mag_import, mag = pcall(require,"mag")

	function line_breaker_check(subs,sel,config)
	local style_name = mag.unstyles(config["u_style_name"])
	local max_char = config["u_max_char"] - 1
	local comment_case = config["u_comment_lines"]
	local text_len = ""
	local pcs = false
	local pcs2 = false
	local msg1 = "Beni böl!"
	local msg2 = "Beni düzgün böl!"
	for i = 1, #subs do
	comment1 = subs[i].comment
	comment2 = false
	if comment_case == false then comment1 = 1 comment2 = 1 end
	if subs[i].class == "dialogue" and comment1 == comment2 then
	style1 = style_name
	style2 = subs[i].style
	if style_name == "Tüm stiller" then style1 = 1 style2 = 1 end
	if style1 == style2 then
	line = subs[i]
	text = subs[i].text
	if line.effect == msg1 or line.effect == msg2 then pcs2 = true line.effect = "" end
	local clear_text = text
	clear_text = mag.strip(clear_text)
	clear_text = mag.removedot(clear_text)
	clear_text = clear_text:gsub("\\h",""):gsub("\\n","")
	if text:match("\\N") then
	local split_count, split_text = 0, {}
	split_count, split_text = mag.splitter("\\N",clear_text,true)
	for j = 1, split_count do if mag.len(split_text[j]) > max_char then pcs = true line.effect = msg2 end end
	else
	text_len = mag.len(clear_text:gsub("\\N",""))
	if max_char < text_len then line.effect = msg1 pcs = true end
	end
	if pcs == true or pcs2 == true then line.text = text subs[i] = line end
	end
	end
	end
	if pcs == true then mag.prog("Tespit ediliyor...") else mag.log(2,"Karakter sınırını aşan bölünmemiş satır bulunamadı.") end
	end

	function create_config(subs)
	local dialog_config=
	{{class = "label",                                                     x = 0, y = 0, width = 1, height = 1, label = "Karakter sınırı:"                                                  }
	,{class = "intedit",  name = "u_max_char",      value = 45,            x = 1, y = 0, width = 1, height = 1                                                                              }
	,{class = "label",                                                     x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",18).."Stil:"                                           }
	,{class = "dropdown", name = "u_style_name",    value = "Tüm stiller", x = 1, y = 1, width = 1, height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. "     
                                                                                                                                              .."İlk sayı yorum satırı yapılmamış iken "     
                                                                                                                                              .."ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_lines", value = true,          x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."                                           }}
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

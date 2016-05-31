	script_name="Line Breaker Checker"
	script_description="Karakter sınırını aşan satırları bulur."
	script_author="Magnum357"
	script_version="2.3"

	unicode = require 'aegisub.unicode'

	function line_breaker_chk(subs,sel,config)
	local style_name = config["u_style_name"]:gsub("%(%d+%+%d+%)%s","")
	local max_char = config["u_max_char"] - 1
	local comment_case = config["u_comment_lines"]
	local text_len = ""
	local pcs = false
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
	if line.effect == msg1 or line.effect == msg2 then line.effect = "" end
	local clear_text = text
	clear_text = strip_tags(clear_text)
	clear_text = remove_dot(clear_text)
	clear_text = clear_text:gsub("\\h",""):gsub("\\n","")
	if text:match("\\N") then
	char_find(clear_text)
	for k = 1, cf_count + 1 do
	if len(cf_a[k]) > max_char then
	line.effect = msg2
	pcs = true
	end
	end
	else
	text_len = len(clear_text:gsub("\\N",""))
	if max_char < text_len then
	line.effect = msg1
	pcs = true
	end
	end
	if pcs == true then
	line.text=text
	subs[i]=line
	end
	end
	end
	end
	if pcs == true then prog("Tespit ediliyor...") 
	else aegisub.log(1,"Satır sınırını aşan bölünmemiş satır bulunamadı.") end
	end

	function char_find(str)
	cf_t1 = ""
	cf_t2 = ""
	cf_a = {}
	cf_m = {}
	cf_tp = 0
	_, cf_count = str:gsub("\\N", "")
	cf_m[1] = str:find("\\N")
	for cf_i = 1, cf_count - 1 do
	cf_m[cf_i + 1] = str:find("\\N",cf_m[cf_i] + 1)
	end
	for cf_j = 1, cf_count + 1 do
	if cf_j == 1 then
	cf_t1 = 0
	cf_t2 = cf_m[1]
	elseif cf_j == cf_count + 1 then
	cf_t1 = cf_m[cf_count]
	cf_t2 = - 1
	elseif cf_j > 1 and cf_j < cf_count + 1 then
	cf_t1 = cf_m[cf_j - 1]
	cf_t2 = cf_m[cf_j]
	end
	cf_a[cf_j] = str:sub(cf_t1,cf_t2):gsub("\\N",""):gsub("\\","")
	end
	return ""
	end

	function delay()
	local st = ""
	for i = 0, 50000 do
	st = st .. i
	end
	return st
	end

	function prog(str)
	aegisub.progress.task(string.format("%s",str))
	aegisub.progress.set(100)
	delay()	
	end

	function remove_dot(line) return line:gsub("['., -/*:;+!)?\"=(]+", "") end

	function strip_tags(line) return line:gsub("{[^}]+}", "") end

	function len(line) return unicode.len(line) end

	function collect_styles(subs)
	local n, styles = 0, {}
	for i = 1, #subs do
	local sub = subs[i]
	if sub.class == "style" then
	local tl, tl2 = total_lines_for_style(subs,sub.name)
	if tl > 0 then
	n = n + 1
	styles[n] = string.format("(%s+%s) %s",tl,tl2,sub.name)
	end
	end
	end
	return styles
	end

	function total_lines_for_style(subs,style_name)
	local n, m = 0, 0
	for i = 1, #subs do
	if subs[i].class == "dialogue" then
	if subs[i].style == style_name and subs[i].comment == false then n = n + 1 end
	if subs[i].style == style_name and subs[i].comment == true  then m = m + 1 end
	end
	end
	return n, m
	end

	function wall(mode,loop) return string.rep(mode,loop) end

	function create_config(subs)
	local dialog_config=
	{{class = "label",                                                     x = 0, y = 0, width = 1, height = 1, label = "Karakter sınırı:"                                                  }
	,{class = "intedit",  name = "u_max_char",      value = 45,            x = 1, y = 0, width = 1, height = 1                                                                              }
	,{class = "label",                                                     x = 0, y = 1, width = 1, height = 1, label = wall(" ",18).."Stil:"                                               }
	,{class = "dropdown", name = "u_style_name",    value = "Tüm stiller", x = 1, y = 1, width = 1, height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. "     
                                                                                                                                              .."İlk sayı yorum satırı yapılmamış iken "     
                                                                                                                                              .."ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_lines", value = true,          x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."                                           }}
	for _, style in ipairs(collect_styles(subs)) do
	table.insert(dialog_config[4].items,style)
	end
	return dialog_config
	end

	function add_macro(subs)
	local ok, config
	ok, config = aegisub.dialog.display(create_config(subs),{"Kontrol et","Kapat"})
	if ok == "Kontrol et" then
	line_breaker_chk(subs,sel,config)
	aegisub.set_undo_point(script_name)
	end
	end

	aegisub.register_macro(script_name,script_description,add_macro)

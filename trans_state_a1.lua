	script_name = "Translate State A1"
	script_description = "Çevirinin yüzde kaçında olduğunuzu gösterir."
	script_author = "Magnum357"
	script_version = "1.6.2"

	function trans_state_a1(subs,sel,config)
	local style_name = config["u_style_name"]:gsub("%(%d+%)%s","")
	local percent_digit = tonumber(config["u_percent"]) + 2
	local n = 0
	local total_line = total_lines(subs,style_name)
	local percent
	local pcs = false
	for i=1, #subs do
	line = subs[i]
	if subs[i].class == "dialogue" then
	if style_name == "Tüm stiller" then style1 = 1 style2 = 1 else style1 = subs[i].style style2 = style_name end
	if style1 == style2 then
	n = n + 1
	percent = percent_calc(total_line,n,percent_digit)
	n = zero(n,total_line)
	line.effect = string.format("%s / %s ( %s )",total_line,n,percent)
	pcs = true
	subs[i] = line
	end
	end
	end
	if pcs == true then prog("Yüzde hesaplanıyor...") else aegisub.log("İşleminiz gerçekleştirilemedi!") end
	end

	function remove_trans_state_a1(subs,sel,config)
	local pcs = false
	local style_name = config["u_style_name"]:gsub("%(%d+%)%s","")
	for i=1, #subs do
	if subs[i].class == "dialogue" then
	line = subs[i]
	if style_name == "Tüm stiller" then style1 = 1 style2 = 1 else style1 = subs[i].style style2 = style_name end
	if style1 == style2 then
	if line.effect:match("%d+ / %d+ %( %d+%.%d+%% %)") or line.effect:match("%d+ / %d+ %( +%d+%% %)") then
	line.effect = ""
	pcs = true
	subs[i] = line
	end
	end
	end
	end
	if pcs == true then prog("Çıktı verileri temizleniyor...") else aegisub.log("İşleminiz gerçekleştirilemedi!") end
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

	function percent_calc(number1,number2,number3)
	local result = ""
	local calc = 100 - ((number1 - number2) / number1 * 100)
	local calc_floor = math.floor(calc)
	local sub_val = number3
	if sub_val < 2 then
	sub_val = 2
	end
	if sub_val > 4 then
	sub_val = 4
	end	
	if calc_floor < 10 then
	result = "0" .. tostring(calc)
	end
	if calc_floor > 9 then
	result = tostring(calc)
	end
	if tostring(calc):sub(4,4) == "" then
	result = result .. ".000000000000"
	end
	if string.len(result) == 4 then
	result = result .. "00000000000"
	end
	result = result:sub(1,sub_val+1)
	result = result .. "%"
	if sub_val == 3 and calc_floor == 100 then
	result = " " .. result:gsub("%.","")
	end
	if sub_val == 2 then
	result = result:gsub("%.","")
	end
	if sub_val == 2 and calc_floor < 100 then
	result = "  " .. result 
	end
	return result
	end

	function zero(str,total)
	str = tostring(str)
	total_digit = string.len(total)
	digit = string.len(str)
	local convert = ""
	if total_digit - digit == 0 then
	convert = str
	else
	convert = string.format("%s%s",string.rep("0",total_digit - digit),str)
	end
	return convert
	end

	function total_lines(subs,style_name)
	local n = 0
	for i=1, #subs do
	local source_style, target_style = subs[i].style, style_name
	if style_name == "Tüm stiller" then source_style, target_style = 1, 1 end
	if subs[i].class == "dialogue" then
	if source_style == target_style then
	n = n + 1
	end
	end
	end
	return n
	end

	function collect_styles_total(subs)
	local n, styles = 0, {}
	local sub_name
	for i = 1, #subs do
	local sub = subs[i]
	if sub.class == "style" then
	local tl = total_lines(subs,sub.name)
	if tl > 0 then
	n = n + 1
	styles[n] = string.format("(%s) %s",tl,sub.name)
	end
	end
	end
	return styles
	end

	function wall(mode,loop) return string.rep(mode,loop) end

	function create_config(subs)
	local dialog_config =
	{{class = "label",                                                  x = 0, y = 0, width = 1,  height = 1, label = wall(" ",3)..wall(" ",21).."Stil:"}
	,{class = "dropdown", name = "u_style_name", value = "Tüm stiller", x = 1, y = 0, width = 13, height = 1, items = {"Tüm stiller"}                   }
	,{class = "label",                                                  x = 0, y = 1, width = 1,  height = 1, label = wall(" ",3).."Yüzde ondalığı:"    }
	,{class = "intedit",  name = "u_percent",    value = 2,             x = 1, y = 1, width = 13, height = 1, min = 0, max = 2                         }}
	for _, style in ipairs(collect_styles_total(subs)) do
	table.insert(dialog_config[2].items,style)
	end
	return dialog_config
	end

	function tr_ascii(str)
	str = str
	:gsub("ç",string.char(231))
	:gsub("Ç",string.char(199))
	:gsub("ü",string.char(252))
	:gsub("Ü",string.char(220))
	:gsub("ö",string.char(246))
	:gsub("Ö",string.char(214))
	:gsub("ğ",string.char(240))
	:gsub("Ğ",string.char(208))
	:gsub("ş",string.char(254))
	:gsub("Ş",string.char(222))
	:gsub("ı",string.char(253))
	:gsub("İ",string.char(221))
	return str
	end

	function add_macro(subs)
	local ok, config
	ok, config = aegisub.dialog.display(create_config(subs),{"Hesapla",tr_ascii("Kaldır"),"Kapat"})
	if ok == "Hesapla" then trans_state_a1(subs,sel,config)
	elseif ok == tr_ascii("Kaldır") then remove_trans_state_a1(subs,sel,config) end
	aegisub.set_undo_point(script_name)
	end

	aegisub.register_macro(script_name,script_description,add_macro)

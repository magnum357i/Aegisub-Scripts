	script_name = "Select Lines"
	script_desription = "Her türlü yolla satır seçer."
	script_version = "1.3"
	script_author = "Magnum357"

	function act_style_before(subs,sel,act)
	local idx, index = 0, {}
	for i = 1, act do if subs[i].class == "dialogue" and subs[i].style == subs[act].style then idx = idx + 1 index[idx] = i end end
	return index
	end

	function act_style_after(subs,sel,act)
	local idx, index = 0, {}
	for i = act, #subs do if subs[i].style == subs[act].style then idx = idx + 1 index[idx] = i end end
	return index
	end

	function act_before(subs,sel,act)
	local idx, index = 0, {}
	for i = 1, act do if subs[i].class == "dialogue" then idx = idx + 1 index[idx] = i end end
	return index
	end

	function act_after(subs,sel,act)
	local idx, index = 0, {}
	for i = act, #subs do idx = idx + 1 index[idx] = i end
	return index
	end

	function prev_act(subs,sel,act)
	if subs[act - 1].class == "dialogue" then 
	local index = {}
	index[1] = act - 1
	return index
	end
	end

	function next_act(subs,sel,act)
	if act < #subs then
	local index = {}
	index[1] = act + 1
	return index
	end
	end

	function first_style_line(subs,sel,act)
	local i, index = 0, {}
	while true do i = i + 1 if subs[act].style == subs[i].style then index[1] = i break end end
	return index
	end

	function last_style_line(subs,sel,act)
	local i, index = #subs, {}
	while true do if subs[act].style == subs[i].style then index[1] = i break end i = i - 1 end
	return index
	end

	function style_all_lines(subs,sel,act)
	local idx, index = 0, {}
	for i = 1, #subs do if subs[i].class == "dialogue" and subs[i].style == subs[act].style then idx = idx + 1 index[idx] = i end end
	return index
	end

	function not_selection(subs,sel)
	local idx, index = 0, {}
	for si, li in ipairs(sel) do idx = idx + 1 index[idx] = li end
	if index[1] ~= nil then local k, vls, values = 1, 0, {}
	for i = 1, #subs do if subs[i].class == "dialogue" then if index[k] ~= i then vls = vls + 1 values[vls] = i else k = k + 1 end end end
	return values
	end
	end

	function total_line(subs)
	local n = 0
	for i = 1, #subs do if subs[i].class == "dialogue" then n = n + 1 end end
	return n
	end

	function lines_from_to(subs)
	local idx, index = 0, {}
	local pcs = true
	local dlg =
	{{class="label",x=0,y=0,width=1,height=1,label="Başlangıç satırı:"}
	,{class="intedit",name="var1",x=1,y=0,width=3,height=1,min=1}
	,{class="label",x=0,y=1,width=1,height=1,label="Bitiş satırı:"}
	,{class="intedit",name="var2",x=1,y=1,width=3,height=1,min=0,value=total_line(subs),hint="Bu kutucukta ilk gördüğünüz değer alt yazıdaki satır sayısının toplamıdır. Ayrıca sıfır değeri de toplam satır sayısına eşittir."}}
	ok, config = aegisub.dialog.display(dlg,{"Uygula","Kapat"})
	if config.var2 ~= 0 and config.var1 > config.var2 then aegisub.log("Başlangıç satırı, bitiş satırından büyük.\n") pcs = false end
	if config.var1 > total_line(subs) or config.var2 > total_line(subs) then aegisub.log("Başlangıç veya bitiş satırı kadar satır yok.\n") pcs = false end
	if ok == "Kapat" then pcs = false end
	if pcs == true then
	config.var1 = (#subs - total_line(subs)) + config.var1
	if config.var2 == 0 then config.var2 = #subs
	else config.var2 = (#subs - total_line(subs)) + config.var2 end	
	for i = 1, #subs do if subs[i].class == "dialogue" then if i >= config.var1 and i <= config.var2 then idx = idx + 1 index[idx] = i end end end
	end
	if pcs == true then	return index end
	end

	function line_jumping(subs)
	local pcs = true
	local index = {}
	local dlg =
	{{class="label",x=0,y=0,width=1,height=1,label="Satır numarası:"}
	,{class="intedit",name="var",x=1,y=0,width=3,height=1,min=1,value=total_line(subs),hint="Bu kutucukta ilk gördüğünüz değer alt yazıdaki satır sayısının toplamıdır."}}
	ok, config = aegisub.dialog.display(dlg,{"Uygula","Kapat"})
	if ok == "Kapat" then pcs = false end
	if pcs == true then
	if config.var > total_line(subs) then config.var = total_line(subs) end
	index[1] = (#subs - total_line(subs)) + config.var
	return index
	end
	end

	aegisub.register_macro(script_name.."/Geçerli satır/Öncesi",script_desription,act_before)
	aegisub.register_macro(script_name.."/Geçerli satır/Sonrası",script_desription,act_after)
	aegisub.register_macro(script_name.."/Geçerli satır/Öncesi(Stil)",script_desription,act_style_before)
	aegisub.register_macro(script_name.."/Geçerli satır/Sonrası(Stil)",script_desription,act_style_after)
	aegisub.register_macro(script_name.."/Stil/İlk satır",script_desription,first_style_line)
	aegisub.register_macro(script_name.."/Stil/Son satır",script_desription,last_style_line)
	aegisub.register_macro(script_name.."/Stil/Tüm satırlar",script_desription,style_all_lines)
	aegisub.register_macro(script_name.."/Satır/Satır aralığı",script_desription,lines_from_to)
	aegisub.register_macro(script_name.."/Satır/Satır atlama",script_desription,line_jumping)
	aegisub.register_macro(script_name.."/Satır/Önceki satır",script_desription,prev_act)
	aegisub.register_macro(script_name.."/Satır/Sonraki satır",script_desription,next_act)
	aegisub.register_macro(script_name.."/Seçimin tersi",script_desription,not_selection)

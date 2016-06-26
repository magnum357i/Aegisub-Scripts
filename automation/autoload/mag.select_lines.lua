	script_name       = "Select Lines"
	script_desription = "Her türlü yolla satır seçme işlemi yapar."
	script_version    = "1.5.1"
	script_author     = "Magnum357"

	mag_import, mag = pcall(require,"mag")

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

	function prev_act(subs,sel,act) if subs[act - 1].class == "dialogue" then return {act - 1} end end

	function next_act(subs,sel,act) if act < #subs then return {act + 1} end end

	function first_style_line(subs,sel,act) return {mag.style_first_index(subs,subs[act].style)} end

	function last_style_line(subs,sel,act) return {mag.style_last_index(subs,subs[act].style)} end

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

	function lines_from_to(subs)
	local total_line = mag.total_full(subs)
	local first_index = mag.first_index(subs)
	local idx, index = 0, {}
	local var_tmp
	local dlg =
	{{class = "label",                                      x = 0, y = 0, width = 1, height = 1, label = "Başlangıç:"}
	,{class = "intedit", name = "var1",                     x = 1, y = 0, width = 1, height = 1, min = 1}
	,{class = "label",                                      x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",9).."Bitiş:"}
	,{class = "intedit", name = "var2", value = total_line, x = 1, y = 1, width = 1, height = 1, min = 1, max = total_line, hint = "Bu kutucukta ilk gördüğünüz değer alt yazıdaki satır sayısının toplamıdır."}
	}
	ok, config = mag.dlg(dlg,{"Seç","Kapat"})
	if ok == mag.ascii("Seç") then
	if config.var1 > config.var2 then
	var_tmp = config.var2
	config.var2 = config.var1
	config.var1 = var_tmp
	end
	config.var1 = config.var1 + first_index - 1
	config.var2 = config.var2 + first_index - 1
	for i = 1, #subs do if subs[i].class == "dialogue" and i >= config.var1 and i <= config.var2 then idx = idx + 1 index[idx] = i end end
	return index
	end
	end

	jumping_lines = {}

	function line_numb_jumping(subs,sel,act)
	local ok, config
	local line_jumping_lines = "Henüz atlanmış bir satır yok."
	local line_jumping_lines_val = "Henüz atlanmış bir satır yok."
	local total_line = mag.total_full(subs)
	local index = {}
	local jumping
	local double = 0
	if j == nil then j = 0 end
	if j > 0 then
	line_jumping_lines = nil
	line_jumping_lines_val = jumping_lines[j]
	if jumping_lines[j] == nil then line_jumping_lines_val = jumping_lines[j - 1] end
	end
	local dlg =
	{{class = "label",                                                                     x = 0, y = 0, width = 2, height = 1, label = "Gidilecek satır:"}
	,{class = "intedit",  name = "var",             value = mag.current_act(subs,sel,act), x = 2, y = 0, width = 1, height = 1, min = 1, max = total_line, hint = "Bu kutucukta ilk gördüğünüz değer bulunduğunuz satırın numarasıdır."}
	,{class = "label",                                                                     x = 0, y = 1, width = 2, height = 1, label = mag.wall(" ",2).."Toplam satır:"}
	,{class = "label",                                                                     x = 2, y = 1, width = 1, height = 1, label = total_line}
	,{class = "label",                                                                     x = 0, y = 2, width = 1, height = 1, label = mag.wall(" ",3)}
	,{class = "checkbox", name = "u_line_jumping",                                         x = 1, y = 2, width = 1, height = 1, label = "Şuna git:"}
	,{class = "dropdown", name = "u_lines_jumping", value = line_jumping_lines_val,        x = 2, y = 2, width = 1, height = 1, items = {line_jumping_lines}, hint = "Buradan daha önce atladığınız satırlar arasında geçiş yapabilirsiniz."}
	,{class = "checkbox", name = "u_reset_jumping",                                        x = 2, y = 3, width = 1, height = 1, label = "Son atlananlar listesini temizle."}
	}
	if j > 0 then for _, jlines in ipairs(jumping_lines) do table.insert(dlg[7].items,jlines) end end
	ok, config = mag.dlg(dlg,{"Atla","Kapat"})
	if config.u_line_jumping == true and mag.n(config.u_lines_jumping) == nil then mag.log(1,"Atlanmış satır yokken atlanmış satıra göre atlayamazsınız.") aegisub.cancel() end
	if ok == "Atla" then
	if config.u_reset_jumping == true then jumping_lines = {} end
	if config.u_line_jumping == false then
	table.insert(jumping_lines,config.var)
	j = table.getn(jumping_lines)
	mag.double_value(jumping_lines)
	end
	if config.u_line_jumping == true then config.var = config.u_lines_jumping end
	jumping = (#subs - total_line) + config.var
	return {jumping}
	end
	end

	function times_from_to(subs,sel,act)
	local count = 0
	local time_pattern = "%d+:%d+:%d+%.%d+"
	local line
	local ok, config
	local index = {}
	local dlg =
	{{class = "label",                                              x = 0, y = 0, width = 1, height = 1, label = "Başlangıç:"}
	,{class = "edit",     name = "time1",     value = "0:00:00.00", x = 1, y = 0, width = 1, height = 1, hint  = "Kare değeri de girebilirsiniz. \"0\" veya \"0:00:00.00\" değeri ilk süreye karşılık gelir."}
	,{class = "label",                                              x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",9).."Bitiş:"}
	,{class = "edit",     name = "time2",     value = "0:00:00.00", x = 1, y = 1, width = 1, height = 1, hint  = "Kare değeri de girebilirsiniz. \"0\" veya \"0:00:00.00\" değeri son süreye karşılık gelir."}
	,{class = "checkbox", name = "act_start",                       x = 2, y = 0, width = 1, height = 1, label = "Geçerli satırınkini al.", hint = "Geçerli satırın başlangıç süresini kullanır."}
	,{class = "checkbox", name = "act_end",                         x = 2, y = 1, width = 1, height = 1, label = "Geçerli satırınkini al.", hint = "Geçerli satırın bitiş süresini kullanır."}
	}
	ok, config = mag.dlg(dlg,{"Seç","Kapat"})
	if ok == mag.ascii("Seç") then
		config.time1 = mag.space_trim(config.time1)
		config.time2 = mag.space_trim(config.time2)
		if not mag.match(config.time1,time_pattern) and mag.n(config.time1) == nil then
		mag.log(1,"Başlangıç süresine geçersiz bir değer girildi.")
		elseif not mag.match(config.time2,time_pattern) and mag.n(config.time2) == nil then
		mag.log(1,"Bitiş süresine geçersiz bir değer girildi.")
		else
		if mag.n(config.time1) == nil then config.time1 = mag.time_strip(config.time1) else config.time1 = aegisub.ms_from_frame(config.time1) end
		if mag.n(config.time2) == nil then config.time2 = mag.time_strip(config.time2) else config.time2 = aegisub.ms_from_frame(config.time2) end
		if config.time1 < 0 then config.time1 = 0 end
		if config.time2 < 0 then config.time2 = 0 end
		if config.time1 > config.time2 and config.time2 ~= 0 then
		mag.log(2,"Başlangıç süresi bitiş süresinden daha büyük.")
		else
		if config.act_start then config.time1 = subs[act].start_time end
		if config.act_end then config.time2 = subs[act].end_time end
			for i = 1, #subs do
			line = subs[i]
				if line.class == "dialogue" then
				if config.time2 == 0 then line.end_time = 0 end
					if line.start_time >= config.time1 and line.end_time <= config.time2 then
					table.insert(index,i)
					count = count + 1
					end
				end
			end
		end
		end
	if count > 0 then return index else mag.log(1,"Belirtilen süreler arasında hiçbir satır bulunamadı.") end
	end
	end

	function line_time_jumping(subs)
	local time_pattern = "%d+:%d+:%d+%.%d+"
	local line
	local ok, config
	local index = ""
	local dlg =
	{{class = "label",                                     x = 0, y = 0, width = 1, height = 1, label = "Süre:"}
	,{class = "edit", name = "time", value = "0:00:00.00", x = 1, y = 0, width = 1, height = 1, hint  = "Kare değeri de girebilirsiniz. Baştan itibaren belirtilen süreye ya da ondan sonraki en yakın süreye atlar."}
	}
	ok, config = mag.dlg(dlg,{"Atla","Kapat"})
	if ok == mag.ascii("Atla") then
		config.time1 = mag.space_trim(config.time)
		if not mag.match(config.time,time_pattern) and mag.n(config.time) == nil then
		mag.log(1,"Atlanacak süreye geçersiz bir değer girildi.")
		else
		if mag.n(config.time) == nil then config.time = mag.time_strip(config.time) else config.time = aegisub.ms_from_frame(config.time) end
		if config.time < 0 then config.time = 0 end
			for i = 1, #subs do
			line = subs[i]
				if line.class == "dialogue" then
					if line.start_time >= config.time then index = i break end
				end
			end
		end
	if index ~= "" then return {index} else mag.log(1,"Belirtilen süreler arasında hiçbir satır bulunamadı.") end
	end
	end

	if mag_import then
	sub_menus = {"Geçerli satır","Stil","Satır","Süre"}
	mag.register(script_name.."/"..sub_menus[1].."/Öncesi",       act_before)
	mag.register(script_name.."/"..sub_menus[1].."/Sonrası",      act_after)
	mag.register(script_name.."/"..sub_menus[1].."/Öncesi(Stil)", act_style_before)
	mag.register(script_name.."/"..sub_menus[1].."/Sonrası(Stil)",act_style_after)
	mag.register(script_name.."/"..sub_menus[2].."/İlk satır",    first_style_line)
	mag.register(script_name.."/"..sub_menus[2].."/Son satır",    last_style_line)
	mag.register(script_name.."/"..sub_menus[2].."/Tüm satırlar", style_all_lines)
	mag.register(script_name.."/"..sub_menus[3].."/Satır aralığı",lines_from_to)
	mag.register(script_name.."/"..sub_menus[3].."/Satır atlama", line_numb_jumping)
	mag.register(script_name.."/"..sub_menus[3].."/Önceki satır", prev_act)
	mag.register(script_name.."/"..sub_menus[3].."/Sonraki satır",next_act)
	mag.register(script_name.."/"..sub_menus[4].."/Süre aralığı", times_from_to)
	mag.register(script_name.."/"..sub_menus[4].."/Süre atlama",  line_time_jumping)
	mag.register(script_name.."/Seçimin tersi",                   not_selection)
	else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
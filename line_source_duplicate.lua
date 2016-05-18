	--[[

	Oluşturulan bilgilere dokunmayınız. Effect kutucuklarına yazılan bilgiler ile 
	satır içine yazılan bilgilere dokunmayın yani. Bir diğer konu da stil seçimi 
	ekranında gördüğünüz sayı + sayı yazımının anlamı o stile ait satırlar ile 
	bu lua aracılığı ile oluşturulmuş satırların sayısıdır.

	]]--

	script_name="Line Source Duplicate/"
	script_description="Kaynak metni bir şekilde çoğaltır. Bir şekilde çoğalttıklarını da silebilir."
	script_author="Magnum357"
	script_version="2"

	include("karaskel.lua")
	
	lsd_msg = "[LineSDup]"
	lsd_msg2 = "Kaynak: "
	lsd_msg3 = "[#LineSDup]"
	equal_msg = "#LSD1[]"

	function line_source_duplicate(subs,sel,config)
	local pcs = false
	local pcs2 = false
	local j = 0
	local k = 0
	local t = 0
	local tt
	local index = {}
	local style_name = ""
	local selected_style = config["u_style"]:gsub("%(%d+%+%d+%)%s","")
	local selected_mod = config["u_mod"]
	selected_mod = selected_mod:match("M[1-3][AB]")
	local selected_action = config["u_action"]
	if selected_action == "Ekle" then
	for i = 1, #subs do
	line = subs[i]
	text = subs[i].text
	if style_name ~= equal_msg then style_name = subs[i].style end
	if selected_style == "Tüm stiller" then selected_style = equal_msg style_name = equal_msg end
	if subs[i].class == "dialogue" then
	if selected_style == style_name then
	t = t + 1
	if t == 1 then tt = i end
	text_stripped = stripped(text)
	if selected_mod == "M1A" and line.effect ~= lsd_msg then
	line.effect = lsd_msg
	text = text.."{"..lsd_msg2..text_stripped.."}"
	pcs = true
	end
	if selected_mod == "M1B" and line.effect ~= lsd_msg then
	line.effect = lsd_msg
	text = "{"..lsd_msg2..text_stripped.."}"
	pcs = true
	end
	if selected_mod == "M2A" or selected_mod == "M2B" or selected_mod == "M3A" or selected_mod == "M3B" and line.effect ~= lsd_msg then
	j = j + 1
	index[j] = i
	pcs = true
	end
	end
	end
	line.text = text
	subs[i] = line
	end
	if index[1] ~= nil then
	for i = 1, table.getn(index) do
	line = subs[index[i] + k]
	text = stripped(subs[index[i] + k].text)
	if selected_mod == "M2A" then
	local l = table.copy(line)
	l.effect = lsd_msg3
	l.text = text
	subs.insert((index[i] + 1) + k,l)
	k = k + 1
	end
	if selected_mod == "M2B" then
	local l = table.copy(line)
	l.comment = true
	l.effect = lsd_msg3
	l.text = text
	subs.insert((index[i] + 1) + k,l)
	k = k + 1
	end
	if selected_mod == "M3A" then
	local l = table.copy(line)
	l.effect = lsd_msg3
	l.text = text
	if selected_style ~= equal_msg then
	subs.insert(last_item_for_style(subs, selected_style) + 1,l)
	else
	subs.insert(tt + t - 1 + i,l)
	end
	end
	if selected_mod == "M3B" then
	local l = table.copy(line)
	l.comment = true
	l.effect = lsd_msg3
	l.text = text
	if selected_style ~= equal_msg then
	subs.insert(last_item_for_style(subs, selected_style) + 1,l)
	else
	subs.insert(tt + t - 1 + i,l)
	end
	end
	end
	end
	if pcs == true then prog("İşleminiz yapılıyor...") else aegisub.log("İşleminiz yapılamadı!") end
	end
	if selected_action == "Kaldır" then
	for i = #subs, 1, -1 do
	line = subs[i]
	text = subs[i].text
	if style_name ~= equal_msg then style_name = line.style end
	if selected_style == "Tüm stiller" then selected_style = equal_msg style_name = equal_msg end
	if line.class == "dialogue" and line.effect == lsd_msg3 and style_name == selected_style then
	subs.delete(i)
	pcs = true
	end
	if line.class == "dialogue" and line.effect == lsd_msg and style_name == selected_style then
	if text:match("%{"..lsd_msg2.."[^}]+%}") then
	text = text:gsub("%{"..lsd_msg2.."[^}]+%}","")
	line.effect = ""
	pcs2 = true
	end
	end
	if pcs2 == true then
	line.text = text
	subs[i] = line
	end
	end
	if pcs == true or pcs2 == true then prog("İşleminiz yapılıyor...") else aegisub.log("İşleminiz yapılamadı!") end
	end
	end

	function last_item_for_style(subs, style_name)
	local last_item, n = 0, 0
	total_line = total_lines(subs,style_name)
	for i = 1, #subs do
	if subs[i].class == "dialogue" then
	if subs[i].style == style_name then
	n = n + 1
	if n == total_line then last_item = i end
	end
	end
	end
	return last_item
	end

	function stripped(str) return str:gsub("{[^}]+}"," "):gsub("\\[Nnh]"," "):gsub("%s+"," ") end

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

	function total_lines(subs,style_name)
	local n, m = 0, 0
	for i = 1, #subs do
	local source_style, target_style = subs[i].style, style_name
	if subs[i].class == "dialogue" then	
	if source_style == target_style then
	if subs[i].effect == lsd_msg3 then m = m + 1 end
	if subs[i].effect ~= lsd_msg3 then n = n + 1 end
	end
	end
	end
	return n, m
	end

	function collect_styles_total(subs)
	local n, styles = 0, {}
	for i = 1, #subs do
	local sub = subs[i]
	if sub.class == "style" then
	local tl, tl2 = total_lines(subs,sub.name)
	if tl > 0 or tl2 > 0 then
	n = n + 1
	styles[n] = string.format("(%s+%s) %s",tl,tl2,sub.name)
	end
	end
	end
	return styles
	end

	function create_config(subs, sel, config)
	local dialog_config=
	{{class="label",x=0,y=0,width=1,height=1,label="Stil:"},
	{class="dropdown",name="u_style",x=1,y=0,width=1,height=1,items={"Tüm stiller"},value="Tüm stiller"},
	{class="label",x=0,y=1,width=1,height=1,label="Mod:"},
	{class="dropdown",name="u_mod",x=1,y=1,width=1,height=1,items={"Seç","[M1A] Satır içinde yorum parantezleri","[M1B] Satır içinde sadece yorum parantezleri","[M2A] Satırdan sonra satır","[M2B] Satırdan sonra yorum satırı","[M3A] Stilden sonra satır","[M3B] Stilden sonra yorum satırı"},value="Seç"},
	{class="label",x=0,y=2,width=1,height=1,label="Eylem:"},
	{class="dropdown",name="u_action",x=1,y=2,width=1,height=1,items={"Ekle","Kaldır"},value="Ekle"}}
	for _, style in ipairs(collect_styles_total(subs)) do
	table.insert(dialog_config[2].items,style)
	end
	return dialog_config
	end

	function add_macro(subs,sel,config)
	local ok, config, k
	k = false
	repeat
	ok, config = aegisub.dialog.display(create_config(subs, sel, config),{"Uygula","Kapat"})
	if config.u_mod ~= "Seç" and config.u_action == "Ekle" then k = true end
	if config.u_mod == "Seç" and config.u_action == "Kaldır" then k = true end
	if config.u_mod == "Seç" and config.u_action == "Ekle" and ok == "Uygula" then aegisub.log("Ekleme işlemi sırasında mod seçmeniz gerekiyor.\n") end	
	if config.u_mod ~= "Seç" and config.u_action == "Kaldır" then aegisub.log("Kaldırma işlemi sırasında mod seçmenize gerek yok.\n") end
	until k == true or ok == "Kapat"
	if ok == "Uygula" then
	line_source_duplicate(subs,sel,config)
    aegisub.set_undo_point(script_name)
	end
	end

	function helper_macro(subs)
	local dialog_config=
	{
	{class="label",x=0,y=0,width=1,height=1,label=
	"MOD"
	.."\n———"
	.."\nM1A"
	.."\n———"
	.."\nM1B"
	.."\n———"
	.."\nM2A"
	.."\n———"
	.."\nM2B"
	.."\n———"
	.."\nM3A"
	.."\n———"
	.."\nM3B"
	},
	{class="label",x=1,y=0,width=1,height=1,label=
	"|  AÇIKLAMA"
	.."\n———————————————————————————————"
	.."\n|  Kaynak metni satırın sonuna yorum parantezi şeklinde yazar."
	.."\n———————————————————————————————"
	.."\n|  Kaynak metni yorum parantezi içinde satıra yazar."
	.."\n———————————————————————————————"
	.."\n|  Kaynak metni her satırın altına bir satır daha ekler."
	.."\n———————————————————————————————"
	.."\n|  Kaynak metni her satırın altına yorum satırı olarak bir satır daha ekler."
	.."\n———————————————————————————————"
	.."\n|  Kaynak metni stilin son satırından sonra satır ekler."
	.."\n———————————————————————————————"
	.."\n|  Kaynak metni stilin son satırından sonra yorum satırı olarak satır ekler."
	},
	{class="label",x=2,y=0,width=1,height=1,label=
	"|  ÖRNEK"
	.."\n———————————————————————————————————————"
	.."\n|  This is a sample. {This is a sample.}"
	.."\n———————————————————————————————————————"
	.."\n|  {This is a sample.}"
	.."\n———————————————————————————————————————"
	.."\n|  [1. satır]This is a sample. [2. satır]This is a sample."
	.."\n———————————————————————————————————————"
	.."\n|  [1. satır]This is a sample. [2. satır][comment]This is a sample."
	.."\n———————————————————————————————————————"
	.."\n|  [1. satır]This is a sample. [2. satır][stilin son satırından sonra]This is a sample."
	.."\n———————————————————————————————————————"
	.."\n|  [1. satır]This is a sample. [2. satır][stilin son satırından sonra][comment]This is a sample."
	}
	}
	aegisub.dialog.display(dialog_config,{"Kapat"})
	end	

	aegisub.register_macro(script_name.."Run",script_description,add_macro)
	aegisub.register_macro(script_name.."Helper",script_description,helper_macro)

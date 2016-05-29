	script_name="Copy - Paste Line"
	script_description="Seçilen satırların her özelliğini kopyalar ve kopyaladığı bilgileri başka seçili satırlara yapıştırabilir."
	script_author="Magnum357"
	script_version="2"

	function copy_gui(subs,sel)
	local ok, config
	if #sel > 0 then
	local dlg =
	{{class="label",x=0,y=0,width=1,height=1,label="Zamanlar"}
	,{class="checkbox",x=0,y=1,width=1,height=1,label="Başlangıç",value=true,name="u_start_time"}
	,{class="checkbox",x=0,y=2,width=1,height=1,label="Bitiş",value=true,name="u_end_time"}
	,{class="label",x=1,y=0,width=1,height=1,label="|   "}
	,{class="label",x=1,y=1,width=1,height=1,label="|   "}
	,{class="label",x=1,y=2,width=1,height=1,label="|   "}
	,{class="label",x=1,y=3,width=1,height=1,label="|   "}
	,{class="label",x=1,y=4,width=1,height=1,label="|   "}
	,{class="label",x=1,y=5,width=1,height=1,label="|   "}
	,{class="label",x=2,y=0,width=1,height=1,label="Boşluk"}
	,{class="checkbox",x=2,y=1,width=1,height=1,label="Sol boşluk",name="u_left_margin"}
	,{class="checkbox",x=2,y=2,width=1,height=1,label="Sağ boşluk",name="u_right_margin"}
	,{class="checkbox",x=2,y=3,width=1,height=1,label="Alt boşluk",name="u_vertical_margin"}
	,{class="label",x=3,y=0,width=1,height=1,label="|   "}
	,{class="label",x=3,y=1,width=1,height=1,label="|   "}
	,{class="label",x=3,y=2,width=1,height=1,label="|   "}
	,{class="label",x=3,y=3,width=1,height=1,label="|   "}
	,{class="label",x=3,y=4,width=1,height=1,label="|   "}
	,{class="label",x=3,y=5,width=1,height=1,label="|   "}
	,{class="label",x=4,y=0,width=1,height=1,label="Diğer"}
	,{class="checkbox",x=4,y=1,width=1,height=1,label="Katman",name="u_layer"}
	,{class="checkbox",x=4,y=2,width=1,height=1,label="Stil",name="u_style"}
	,{class="checkbox",x=4,y=3,width=1,height=1,label="Aktör",name="u_actor"}
	,{class="checkbox",x=4,y=4,width=1,height=1,label="Efekt",name="u_effect"}
	,{class="checkbox",x=4,y=5,width=1,height=1,label="Metin",name="u_text"}
	,{class="label",x=0,y=6,width=5,height=1,label="-----------------------------------------------------"}
	,{class="label",x=0,y=7,width=5,height=1,label=#sel.." satır seçildi."}}
	ok, config = aegisub.dialog.display(dlg,{"Kopyala","Kapat"})
	if ok == "Kopyala" then
	if config.u_start_time == false
	and config.u_end_time == false
	and config.u_left_margin == false
	and config.u_right_margin == false
	and config.u_vertical_margin == false
	and config.u_layer == false
	and config.u_style == false
	and config.u_actor == false
	and config.u_effect == false
	and config.u_text == false
	then aegisub.log("Arayüzden hiçbir tercih yapılmadı.")
	else
	copy(subs,sel,config)
	prog("Satır bilgileri kopyalanıyor...")
	end
	end
	else
	aegisub.log("Seçili satır yok!")
	end
	end

	function reset()
	number = 0
	start_time = {}
	end_time = {}
	left_margin = {}
	right_margin = {}
	vertical_margin = {}
	layer = {}
	style = {}
	actor = {}
	effect = {}
	text = {}
	end

	function copy(subs,sel,config)
	reset()
	number = #sel
	for i, k in pairs(sel) do
	line = subs[k]
	if config.u_start_time == true then start_time[i] = line.start_time end
	if config.u_end_time == true then end_time[i] = line.end_time end
	if config.u_left_margin == true then left_margin[i] = line.margin_l end
	if config.u_right_margin == true then right_margin[i] = line.margin_r end
	if config.u_vertical_margin == true then vertical_margin[i] = line.margin_t end
	if config.u_layer == true then layer[i] = line.layer end
	if config.u_style == true then style[i] = line.style end
	if config.u_actor == true then actor[i] = line.actor end
	if config.u_effect == true then effect[i] = line.effect end
	if config.u_text == true then text[i] = line.text end
	end
	end

	function paste(subs,sel)
	if number == nil then aegisub.log("Kopyalanmış veri yok.")
	else
	if #sel ~= number then aegisub.log("İşleminiz gerçekleştirilemiyor. %s adet seçili satır varken %s adet kopyalanmış satır bilgisi var.",#sel,number)
	else
	for si, li in pairs(sel) do
	line = subs[li]
	if start_time[1] ~= nil then line.start_time = start_time[si] end
	if end_time[1] ~= nil then line.end_time = end_time[si] end
	if left_margin[1] ~= nil then line.margin_l = left_margin[si] end
	if right_margin[1] ~= nil then line.margin_r = right_margin[si] end
	if vertical_margin[1] ~= nil then line.margin_t = vertical_margin[si] end
	if layer[1] ~= nil then line.layer = layer[si] end
	if style[1] ~= nil then line.style = style[si] end
	if actor[1] ~= nil then line.actor = actor[si] end
	if effect[1] ~= nil then line.effect = effect[si] end
	if text[1] ~= nil then line.text = text[si] end
	subs[li] = line
	end
	prog("Satır bilgileri yapıştırılıyor...")
	end
	end
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

	aegisub.register_macro("Line/Kopyala",script_description,copy_gui)
	aegisub.register_macro("Line/Yapıştır",script_description,paste)

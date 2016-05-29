	script_name = "Copy - Paste Line"
	script_description = "Seçilen satırların her özelliğini kopyalar ve kopyaladığı bilgileri başka seçili satırlara yapıştırabilir."
	script_author = "Magnum357"
	script_version = "2.2"

	check_start_time      = false
	check_end_time        = false
	check_left_margin     = false
	check_right_margin    = false
	check_vertical_margin = false
	check_style           = false
	check_actor           = false
	check_text            = false
	check_layer           = false
	check_effect          = false

	function gui(subs,sel)
	local ok, config
	if #sel > 0 then
	local dlg =
	{{class="label",x=0,y=0,width=1,height=1,label="Zamanlar"}
	,{class="checkbox",x=0,y=1,width=1,height=1,label="Başlangıç",value=check_start_time,name="u_start_time"}
	,{class="checkbox",x=0,y=2,width=1,height=1,label="Bitiş",value=check_end_time,name="u_end_time"}
	,{class="label",x=1,y=0,width=1,height=1,label="|   "}
	,{class="label",x=1,y=1,width=1,height=1,label="|   "}
	,{class="label",x=1,y=2,width=1,height=1,label="|   "}
	,{class="label",x=1,y=3,width=1,height=1,label="|   "}
	,{class="label",x=2,y=0,width=1,height=1,label="Boşluk"}
	,{class="checkbox",x=2,y=1,width=1,height=1,label="Sol boşluk",value=check_left_margin,name="u_left_margin"}
	,{class="checkbox",x=2,y=2,width=1,height=1,label="Sağ boşluk",value=check_right_margin,name="u_right_margin"}
	,{class="checkbox",x=2,y=3,width=1,height=1,label="Alt boşluk",value=check_vertical_margin,name="u_vertical_margin"}
	,{class="label",x=3,y=0,width=1,height=1,label="|   "}
	,{class="label",x=3,y=1,width=1,height=1,label="|   "}
	,{class="label",x=3,y=2,width=1,height=1,label="|   "}
	,{class="label",x=3,y=3,width=1,height=1,label="|   "}
	,{class="label",x=4,y=0,width=1,height=1,label="Satır"}
	,{class="checkbox",x=4,y=1,width=1,height=1,label="Stil",value=check_style,name="u_style"}
	,{class="checkbox",x=4,y=2,width=1,height=1,label="Aktör",value=check_actor,name="u_actor"}
	,{class="checkbox",x=4,y=3,width=1,height=1,label="Metin",value=check_text,name="u_text"}
	,{class="label",x=5,y=0,width=1,height=1,label="|   "}
	,{class="label",x=5,y=1,width=1,height=1,label="|   "}
	,{class="label",x=5,y=2,width=1,height=1,label="|   "}
	,{class="label",x=5,y=3,width=1,height=1,label="|   "}	
	,{class="label",x=6,y=0,width=1,height=1,label="Diğer"}
	,{class="checkbox",x=6,y=1,width=1,height=1,label="Katman",value=check_layer,name="u_layer"}
	,{class="checkbox",x=6,y=2,width=1,height=1,label="Efekt",value=check_effect,name="u_effect"}
	,{class="label",x=0,y=4,width=7,height=1,label="------------------------------------------------------------------"}
	,{class="label",x=0,y=5,width=7,height=1,label=#sel.." satır seçildi."}}
	ok, config = aegisub.dialog.display(dlg,{"Kopyala",tr_ascii("Yapıştır"),"Kapat"})
	if ok ~= "Kapat" then
	if config.u_start_time       == false
	and config.u_end_time        == false
	and config.u_left_margin     == false
	and config.u_right_margin    == false
	and config.u_vertical_margin == false
	and config.u_layer           == false
	and config.u_style           == false
	and config.u_actor           == false
	and config.u_effect          == false
	and config.u_tex             == false
	then aegisub.log("Arayüzden hiçbir tercih yapılmadı.")
	else
	if ok == "Kopyala" then
	copy(subs,sel,config)
	conf(subs,sel,config)
	prog("Satır bilgileri kopyalanıyor...")
	end
	if ok == tr_ascii("Yapıştır") then
	paste(subs,sel,config)
	conf(subs,sel,config)
	prog("Kopyalanan bilgiler yapıştırılıyor...")
	end
	end
	end
	else
	aegisub.log("Seçili satır yok!")
	end
	end

	function conf(subs,sel,config)
	check_start_time      = config.u_start_time
	check_end_time        = config.u_end_time
	check_left_margin     = config.u_left_margin
	check_right_margin    = config.u_right_margin
	check_vertical_margin = config.u_vertical_margin
	check_style           = config.u_style
	check_actor           = config.u_actor
	check_text            = config.u_text
	check_layer           = config.u_layer
	check_effect          = config.u_effect
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

	function reset()
	number          = 0
	start_time      = {}
	end_time        = {}
	left_margin     = {}
	right_margin    = {}
	vertical_margin = {}
	layer           = {}
	style           = {}
	actor           = {}
	effect          = {}
	text            = {}
	end

	function copy(subs,sel,config)
	reset()
	number = #sel
	for i, k in pairs(sel) do
	line = subs[k]
	if config.u_start_time 	    == true then start_time[i]      = line.start_time end
	if config.u_end_time 	    == true then end_time[i]        = line.end_time   end
	if config.u_left_margin     == true then left_margin[i]     = line.margin_l   end
	if config.u_right_margin    == true then right_margin[i]    = line.margin_r   end
	if config.u_vertical_margin == true then vertical_margin[i] = line.margin_t   end
	if config.u_layer           == true then layer[i]           = line.layer      end
	if config.u_style           == true then style[i]           = line.style      end
	if config.u_actor           == true then actor[i]           = line.actor      end
	if config.u_effect          == true then effect[i]          = line.effect     end
	if config.u_text            == true then text[i]            = line.text       end
	end
	end

	function paste(subs,sel,config)
	if number == nil then aegisub.log("Kopyalanmış veri yok.") aegisub.cancel()
	else
	if #sel ~= number then aegisub.log("İşleminiz gerçekleştirilemiyor. %s adet seçili satır varken %s adet kopyalanmış satır bilgisi var.",#sel,number)
	else
	for si, li in pairs(sel) do
	line = subs[li]
	if config.u_start_time      == true and start_time[1]      ~= nil then line.start_time = start_time[si]      end
	if config.u_end_time        == true and end_time[1]        ~= nil then line.end_time   = end_time[si]        end
	if config.u_left_margin     == true and left_margin[1]     ~= nil then line.margin_l   = left_margin[si]     end
	if config.u_right_margin    == true and right_margin[1]	   ~= nil then line.margin_r   = right_margin[si]    end
	if config.u_vertical_margin == true and vertical_margin[1] ~= nil then line.margin_t   = vertical_margin[si] end
	if config.u_layer           == true and layer[1]           ~= nil then line.layer      = layer[si]           end
	if config.u_style           == true and style[1]           ~= nil then line.style      = style[si]           end
	if config.u_actor           == true and actor[1]           ~= nil then line.actor      = actor[si]           end
	if config.u_effect          == true and effect[1]          ~= nil then line.effect     = effect[si]          end
	if config.u_text            == true and text[1]            ~= nil then line.text       = text[si]            end
	subs[li] = line
	end
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

	aegisub.register_macro(script_name,script_description,gui)

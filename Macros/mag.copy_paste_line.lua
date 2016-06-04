	script_name = "Copy - Paste Line"
	script_description = "Seçilen satırların her özelliğini kopyalar ve kopyaladığı bilgileri başka seçili satırlara yapıştırabilir."
	script_author = "Magnum357"
	script_version = "2.3.1"

	mag_import, mag = pcall(require,"mag")

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
	{{ class = "label"   ,                                                            x = 0, y= 0, width = 1, height = 1, label = "Zamanlar"              }
	,{ class = "checkbox", name = "u_start_time",      value = check_start_time,      x = 0, y= 1, width = 1, height = 1, label = "Başlangıç"             }
	,{ class = "checkbox", name = "u_end_time",        value = check_end_time,        x = 0, y= 2, width = 1, height = 1, label = "Bitiş"                 }
	,{ class = "label",                                                               x = 1, y= 0, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 1, y= 1, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 1, y= 2, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 1, y= 3, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 2, y= 0, width = 1, height = 1, label = "Boşluk"                }
	,{ class = "checkbox", name = "u_left_margin",     value = check_left_margin,     x = 2, y= 1, width = 1, height = 1, label = "Sol boşluk"            }
	,{ class = "checkbox", name = "u_right_margin",    value = check_right_margin,    x = 2, y= 2, width = 1, height = 1, label = "Sağ boşluk"            }
	,{ class = "checkbox", name = "u_vertical_margin", value = check_vertical_margin, x = 2, y= 3, width = 1, height = 1, label = "Alt boşluk"            }
	,{ class = "label",                                                               x = 3, y= 0, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 3, y= 1, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 3, y= 2, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 3, y= 3, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 4, y= 0, width = 1, height = 1, label = "Satır"                 }
	,{ class = "checkbox", name = "u_style",           value = check_style,           x = 4, y= 1, width = 1, height = 1, label = "Stil"                  }
	,{ class = "checkbox", name = "u_actor",           value = check_actor,           x = 4, y= 2, width = 1, height = 1, label = "Aktör"                 }
	,{ class = "checkbox", name = "u_text",            value = check_text,            x = 4, y= 3, width = 1, height = 1, label = "Metin"                 }
	,{ class = "label",                                                               x = 5, y= 0, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 5, y= 1, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 5, y= 2, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 5, y= 3, width = 1, height = 1, label = mag.wall("|   ",1)          }
	,{ class = "label",                                                               x = 6, y= 0, width = 1, height = 1, label = "Diğer"                 }
	,{ class = "checkbox", name = "u_layer",           value = check_layer,           x = 6, y= 1, width = 1, height = 1, label = "Katman"                }
	,{ class = "checkbox", name = "u_effect",          value = check_effect,          x = 6, y= 2, width = 1, height = 1, label = "Efekt"                 }
	,{ class = "label",                                                               x = 0, y= 4, width = 7, height = 1, label = mag.wall("-",66)            }
	,{ class = "label",                                                               x = 0, y= 5, width = 7, height = 1, label = #sel.." satır seçildi."}}
	ok, config = mag.dlg(dlg,{"Kopyala","Yapıştır","Kapat"})
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
	and config.u_text            == false
	then mag.log(2,"Arayüzden hiçbir tercih yapılmadı.")
	else
	if ok == "Kopyala" then
	copy(subs,sel,config)
	conf(subs,sel,config)
	mag.prog("Satır bilgileri kopyalanıyor...")
	end
	if ok == mag.ascii("Yapıştır") then
	paste(subs,sel,config)
	conf(subs,sel,config)
	mag.prog("Kopyalanan bilgiler yapıştırılıyor...")
	end
	end
	end
	else
	mag.log(2,"Seçili satır yok!")
	end
	aegisub.set_undo_point(script_name)
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
	if number == nil then mag.log(2,"Kopyalanmış veri yok.") aegisub.cancel()
	else
	if #sel ~= number then mag.log(1,"İşleminiz gerçekleştirilemiyor. %s adet seçili satır varken %s adet kopyalanmış satır bilgisi var.",{#sel,number})
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

	if mag_import then mag.register(false,gui) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end

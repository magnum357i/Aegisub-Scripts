	script_name        = "Grid"
	script_description = "Izgara oluşturur."
	script_author      = "Magnum357"
	script_version     = "1"
	script_mag_version = "1.1.1.9"

	mag_import, mag = pcall(require,"mag")

	c_grid_number = 10
	c_grid_space  = 50
	c_grid_thick  = 2
	c_tags        = "\\an5\\alpha&H80&\\bord0\\shad0\\p1"
	c_grid_color  = "#FF19CD"
	c_grid_type   = "Tam"

	function add_macro(subs,sel,act)
	local buttons = {"Oluştur","Kapat"}
	local gui =
	{
	{class  = "label",                                                            x = 0, y = 0, width = 1, height = 1, label = mag.wall(" ",7).."Sayı:"}
	,{class = "intedit",  name = "u_grid_number", value = c_grid_number, min = 2, x = 1, y = 0, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",4).."Aralık:"}
	,{class = "intedit",  name = "u_grid_space",  value = c_grid_space,  min = 1, x = 1, y = 1, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 2, width = 1, height = 1, label = mag.wall(" ",4).."Piksel:"}
	,{class = "intedit",  name = "u_grid_thick",  value = c_grid_thick,  min = 1, x = 1, y = 2, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 3, width = 1, height = 1, label = "Etiketler:"}
	,{class = "edit",     name = "u_tags",        value = c_tags,                 x = 1, y = 3, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 4, width = 1, height = 1, label = mag.wall(" ",5).."Renk:"}
	,{class = "color",    name = "u_grid_color",  value = c_grid_color,           x = 1, y = 4, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 5, width = 1, height = 1, label = mag.wall(" ",4).."Biçim:"}
	,{class = "dropdown", name = "u_grid_type",   value = c_grid_type,            x = 1, y = 5, width = 1, height = 1, items = {"Tam","Sadece dikey","Sadece yatay"}}
	}
	local ok, config = mag.dlg(gui,buttons)
	if ok == mag.ascii(buttons[1]) then
	c_grid_number = config.u_grid_number
	c_grid_space  = config.u_grid_space
	c_grid_thick  = config.u_grid_thick
	c_tags        = config.u_tags
	c_grid_color  = config.u_grid_color
	c_grid_type   = config.u_grid_type
	local shape   = ""
	local px      = c_grid_thick
	local size    = c_grid_space
	c_grid_number = c_grid_number - 1
		if c_grid_type == "Sadece yatay" then
			for i = 0, c_grid_number do
				for k = 0, c_grid_number - 1 do
				shape = shape..mag.format("m %s %s l %s %s l %s %s l %s %s ",
				0 + k * size,    i * size,
				size + k * size, i * size,
				size + k * size, px + i * size,
				0 + k * size,    px + i * size)
				end
			end
		end
		if c_grid_type == "Sadece dikey" then
			for i = 0, c_grid_number do
				for k = 0, c_grid_number - 1 do
				shape = shape..mag.format("m %s %s l %s %s l %s %s l %s %s ",
				size * i,      0 + k * size,
				size * i,      size + k * size,
				px + size * i, size + k * size,
				px + size * i, 0 + k * size)
				end
			end
		end
		if c_grid_type == "Tam" then
			for i = 0, config.u_grid_number do
				for k = 0, config.u_grid_number - 1 do
				shape = shape..mag.format("m %s %s l %s %s l %s %s l %s %s ",
				px + (0 + k * size), i * size,
				size + k * size,     i * size,
				size + k * size,     px + i * size,
				px + (0 + k * size), px + i * size)
				shape = shape..mag.format("m %s %s l %s %s l %s %s l %s %s ",
				size * i,      0 + k * size,
				size * i,      (size + k * size) + px,
				px + size * i, (size + k * size) + px,
				px + size * i, 0 + k * size)
				end
			end
		end
	c_grid_number = c_grid_number + 1
	local line = subs[act]
	line.text  = mag.format("{\\c%s%s}%s",html_to_ass(config.u_grid_color),config.u_tags,shape)
	subs[act]  = line
	aegisub.set_undo_point(script_name)
	end
	end

	function html_to_ass(color) return ass_color(extract_color(color)) end

	if mag_import then
	mag_update_link           = "https://github.com/magnum357i/Magnum-s-Aegisub-Scripts"
	mag_version_check         = false
		if not mag_version_check then
		mag_version           = mag.match(io.open(aegisub.decode_path("?data\\automation\\include\\mag.lua")):read("*all"),"module_version%s-=%s\"([^\"]+)\"")
			if mag_version and mag_version:gsub("%.","") < script_mag_version:gsub("%.","") then
			function mag_check() local k = aegisub.dialog.display({{class = "label", label = "Mag modülünün kurulu sürümü bu lua dosyası ile uyumsuz.\nEn az "..script_mag_version.." veya en güncel modül sürümünü indirmeniz gerekiyor.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
			aegisub.register_macro(script_name,script_desription,mag_check)
			else
			mag_version_check = true
			end
		end
		if mag_version_check then
		mag.register(false,add_macro)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end
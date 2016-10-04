	script_name        = "Shaper"
	script_description = "Resim, şerit ve ızgara ekler. Bir VSFilterMOD etiketini kullanarak resim ekler."
	script_author      = "Magnum357"
	script_version     = "1.4.3"
	script_mag_version = "1.1.2.5"

	mag_import, mag             = pcall(require,"mag")
	imagesize_import, ImageSize = pcall(require,"imagesize")

	include_path      = aegisub.decode_path("?data\\automation\\include\\")
	c_buttons         = {"Resim","Şerit","Izgara","Kapat"}
	c_buttons1        = {"Uygula","Dosya seç","Panodan al","Kapat"}
	c_buttons2        = {"Çizdir","Kapat"}
	c_buttons3        = {"Oluştur","Kapat"}
	c_image_message   = "\"Dosya seçilmedi.\""
	c                 = {}
	c.image_path      = c_image_message
	c.image_tags      = "{\\an5\\bord0\\shad0\\1img($image)\\p1}$shape"
	c.image_only_path = false
	c.shape_width     = 0
	c.shape_height    = 0
	c.shape_tags      = "{\\an5\\bord0\\shad0\\blur0\\c$color\\p1}$shape"
	c.shape_color     = "#000000"
	c.shape_only      = false
	c.grid_number     = 10
	c.grid_space      = 50
	c.grid_thick      = 2
	c.grid_tags       = "\\an5\\alpha&H80&\\bord0\\shad0\\p1"
	c.grid_color      = "#FF19CD"
	c.grid_type       = "Tam"
	c_grid_type       = {"Tam","Sadece dikey","Sadece yatay"}

	function add_macro(subs,sel,act)
	mag.get_config(c)
	local pcs = false
	local gui, ok, config
	gui = {{class = "label", x = 0, y = 0, width = 1, height = 1, label = "Devam etmek için aşağıdaki seçeneklerden birini seçiniz."}}
	ok  = mag.dlg(gui,c_buttons)
	if ok == c_buttons[1] then
	shaper_image(subs,sel,act)
	mag.undo_point()
	end
	if ok == c_buttons[2] then
	shaper_lane(subs,sel,act)
	mag.undo_point()
	end
	if ok == c_buttons[3] then
	shaper_grid(subs,sel,act)
	mag.undo_point()
	end
	mag.set_config(c)
	end

	function shaper_image(subs,sel,act)
	local pcs = false
	if not imagesize_import then
	mag.log(1,"ImageSize modül dosyası bulunamadı. Şu bağlantıdan indirebilirsiniz:\nhttps://github.com/ScottPhillips/Corona-SDK-Lua-Image-Size/tree/master/imagesize\n\nYönlendirilen sayfadan \"imagesize.lua\" dosyası ve \"imagesize\" klasörünü automation/include/ dizinine atmanız gerekiyor. \"imagesize/format\" dosyası içinden sadece \"png.lua\" dosyasına ihtiyaç vardır.")
	elseif not io.open(include_path.."imagesize\\util.lua") then
	mag.log(1,"\"util.lua\" dosyası bulunamadı. Şu bağlantıdan indirebilirsiniz:\nhttps://github.com/ScottPhillips/Corona-SDK-Lua-Image-Size/tree/master/imagesize\n\nYönlendirilen sayfadaki \"imagesize\" klasörünün içindedir.")
	elseif not io.open(include_path.."imagesize\\format\\png.lua") then
	mag.log(1,"\"png.lua\" dosyası bulunamadı. Şu bağlantıdan indirebilirsiniz:\nhttps://github.com/ScottPhillips/Corona-SDK-Lua-Image-Size/tree/master/imagesize\n\nYönlendirilen sayfadaki \"imagesize/format\" klasörünün içindedir.")
	else
	local file = c.image_path
		repeat
		gui =
		{
		 {class = "label",                                                           x = 0, y = 0, width = 21, height = 1, label = mag.format("[%s / %s]",mag.up(script_name),mag.up("resim"))}
			,{class = "label",                                                           x = 0, y = 1, width = 1,  height = 1, label = mag.wall(" ",5).."Dizin:"}
		,{class = "label",                                                           x = 1, y = 1, width = 20, height = 1, label = c.image_path}
		,{class = "label",                                                           x = 0, y = 2, width = 1,  height = 1, label = "Etiketler:"}
		,{class = "edit",     name = "u_image_tags",      value = c.image_tags,      x = 1, y = 2, width = 20, height = 1, hint = "$shape = çizim\n$image = resim"}
		,{class = "checkbox", name = "u_image_only_path", value = c.image_only_path, x = 1, y = 3, width = 20, height = 1, label = "Sadece resim yolunu değiştir.", hint = "Sadece varolan img etiketini değiştir."}
		}
		ok, config        = mag.dlg(gui,c_buttons1)
		c.image_tags      = config.u_image_tags
		c.image_only_path = config.u_image_only_path
			if ok == mag.ascii(c_buttons1[2]) then
			file = aegisub.dialog.open("Bir resim dosyası seçin",aegisub.decode_path("?script\\"),"","Resim dosyası (*.png)|*.png",false,true)
			end
			if ok == c_buttons1[3] then
			file = mag.cget()
			file = mag.gsub(file,"\"","")
			file = mag.gsub(file,"\\+","\\")
				if mag.find(mag.reverse(file),mag.reverse(".png")) ~= 1 then
				file = file..".png"
				end
			end
			if mag.find(file,"\"") ~= 1 and mag.find(mag.reverse(file),"\"") ~= 1 then
			file = mag.format("\"%s\"",file)
			end
		c.image_path = file
		until ok == mag.ascii(c_buttons1[1]) and c.image_path ~= c_image_message or ok == c_buttons1[4]
		if ok == c_buttons1[1] then
		local file_temp = mag.gsub(c.image_path,"\"","")
			if io.open(file_temp) then
			local line           = subs[act]
				if not c.image_only_path then
					if mag.is_video() then
					pcs                  = true
					local meta           = karaskel.collect_head(subs)
					local xres, yres     = aegisub.video_size()
					local width, height  = ImageSize.imgsize(file_temp)
					local xratio, yratio = meta.res_x/xres, meta.res_y/yres
					local width          = mag.floor(width * xratio)
					local height         = mag.floor(height * yratio)
					local shape          = mag.format("m 0 0 l %d 0 l %d %d l 0 %d l 0 0",width,width,height,height)				
					line.text            = c.image_tags
					line.text            = mag.gsub(line.text,"%$image",file_temp)
					line.text            = mag.gsub(line.text,"%$shape",shape)
					else
					mag.log(1,mag.message["is_dir"])
					end
				else
					if mag.find(line.text,"\\[1-4]img%(.-%)") then
					pcs       = true
					line.text = mag.gsub(line.text,"(\\[1-4]img%().-(%))","%1"..mag.gsub(c.image_path,"\"","").."%2")
					else
					mag.log(2,"Satırda resim ekleme etiketi bulunamadı.")
					end
				end
				if pcs then
				subs[act] = line
				end
			else
			mag.log(1,mag.message["no_file"])
			mag.log(2,"Dizin hafızası sıfırlandı.")
			c.image_path = c_image_message
			end
		end
	end
	end

	function shaper_lane(subs,sel,act)
	local pcs = false
	local gui =
	{
	 {class = "label",                                                             x = 0, y = 0, width = 4, height = 1, label = mag.format("[%s / %s]",mag.up(script_name),mag.up("şerit"))}
	,{class = "label",                                                             x = 1, y = 1, width = 1, height = 1, label = "Genişlik (px)"}
	,{class = "label",                                                             x = 3, y = 1, width = 1, height = 1, label = "Yükseklik (px)"}
	,{class = "label",                                                             x = 0, y = 2, width = 1, height = 1, label = "Büyüklük:"}
	,{class = "intedit", min = 0, name = "u_shape_width",  value = c.shape_width,  x = 1, y = 2, width = 1, height = 1}
	,{class = "label",                                                             x = 2, y = 2, width = 1, height = 1, label = "x"}
	,{class = "intedit", min = 0, name = "u_shape_height", value = c.shape_height, x = 3, y = 2, width = 1, height = 1}
	,{class = "label",                                                             x = 0, y = 3, width = 1, height = 1, label = mag.wall(" ",2).."Etiketler:"}
	,{class = "edit",             name = "u_shape_tags",   value = c.shape_tags,   x = 1, y = 3, width = 3, height = 1, hint = "$shape = çizim\n$color = renk"}
	,{class = "label",                                                             x = 0, y = 4, width = 1, height = 1, label = mag.wall(" ",7).."Renk:"}
	,{class = "color",            name = "u_shape_color",  value = c.shape_color,  x = 1, y = 4, width = 3, height = 1}
	,{class = "checkbox",         name = "u_shape_only",   value = c.shape_only,   x = 1, y = 5, width = 3, height = 1, label = "Sadece varolan şekil kodunu değiştir."}
	}
	local ok, config = mag.dlg(gui,c_buttons2)
	c.shape_width    = config.u_shape_width
	c.shape_height   = config.u_shape_height
	c.shape_tags     = config.u_shape_tags
	c.shape_color    = config.u_shape_color
	c.shape_only     = config.u_shape_only
		if ok == mag.ascii(c_buttons2[1]) then
		local line  = subs[act]
		local shape = mag.format("m 0 0 l %d 0 l %d %d l 0 %d l 0 0",c.shape_width,c.shape_width,c.shape_height,c.shape_height)
			if not c.shape_only then
			pcs       = true
			line.text = c.shape_tags
			line.text = mag.gsub(line.text,"%$color",mag.html_to_ass(c.shape_color))
			line.text = mag.gsub(line.text,"%$shape",shape)
			else
				if mag.find(line.text,"m%s[%d%.]*%s[%d%.]*%s[%d%s%.lbm]*") then
				pcs = true
				line.text = mag.gsub(line.text,"m%s[%d%.]*%s[%d%.]*%s[%d%s%.lbm]*",shape)
				else
				mag.log(2,"Satırda şekil çizme kodu bulunamadı.")
				end
			end
			if pcs then
			subs[act] = line
			end
		end
	end

	function shaper_grid(subs,sel,act)
	local pcs = false
	local gui =
	{
	 {class  = "label",                                                            x = 0, y = 0, width = 2, height = 1, label = mag.format("[%s / %s]",mag.up(script_name),mag.up("ızgara"))}
	,{class = "label",                                                            x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",7).."Sayı:"}
	,{class = "intedit",  name = "u_grid_number", value = c.grid_number, min = 2, x = 1, y = 1, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 2, width = 1, height = 1, label = mag.wall(" ",4).."Aralık:"}
	,{class = "intedit",  name = "u_grid_space",  value = c.grid_space,  min = 1, x = 1, y = 2, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 3, width = 1, height = 1, label = mag.wall(" ",4).."Piksel:"}
	,{class = "intedit",  name = "u_grid_thick",  value = c.grid_thick,  min = 1, x = 1, y = 3, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 4, width = 1, height = 1, label = "Etiketler:"}
	,{class = "edit",     name = "u_grid_tags",   value = c.grid_tags,            x = 1, y = 4, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 5, width = 1, height = 1, label = mag.wall(" ",5).."Renk:"}
	,{class = "color",    name = "u_grid_color",  value = c.grid_color,           x = 1, y = 5, width = 1, height = 1}
	,{class = "label",                                                            x = 0, y = 6, width = 1, height = 1, label = mag.wall(" ",4).."Biçim:"}
	,{class = "dropdown", name = "u_grid_type",   value = c.grid_type,            x = 1, y = 6, width = 1, height = 1, items = c_grid_type}
	}
	local ok, config = mag.dlg(gui,c_buttons3)
	c.grid_number    = config.u_grid_number
	c.grid_space     = config.u_grid_space
	c.grid_thick     = config.u_grid_thick
	c.grid_tags      = config.u_grid_tags
	c.grid_color     = config.u_grid_color
	c.grid_type      = config.u_grid_type
		if ok == mag.ascii(c_buttons3[1]) then
		pcs           = true
		local shape   = ""
		local px      = c.grid_thick
		local size    = c.grid_space
		c.grid_number = c.grid_number - 1
			if c.grid_type == c_grid_type[3] then
				for i = 0, c.grid_number do
					for k = 0, c.grid_number - 1 do
					shape = shape..mag.format("m %s %s l %s %s l %s %s l %s %s ",
					0 + k * size,    i * size,
					size + k * size, i * size,
					size + k * size, px + i * size,
					0 + k * size,    px + i * size)
					end
				end
			end
			if c.grid_type == c_grid_type[2] then
				for i = 0, c.grid_number do
					for k = 0, c.grid_number - 1 do
					shape = shape..mag.format("m %s %s l %s %s l %s %s l %s %s ",
					size * i,      0 + k * size,
					size * i,      size + k * size,
					px + size * i, size + k * size,
					px + size * i, 0 + k * size)
					end
				end
			end
			if c.grid_type == c_grid_type[1] then
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
		c.grid_number = c.grid_number + 1
		local line    = subs[act]
		line.text     = mag.format("{\\c%s%s}%s",mag.html_to_ass(c.grid_color),c.grid_tags,shape)
		subs[act]     = line
		end
	end

	function check_macro(subs,sel,act)
	local fe, fee = pcall(add_macro,subs,sel,act)
	mag.funce(fe,fee)
	end

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
		mag.register(false,check_macro)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end
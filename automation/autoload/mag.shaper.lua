	script_name        = "Shaper"
	script_description = "Çözünürlüğe bağlı olarak resminiz için şekil çizer."
	script_author      = "Magnum357"
	script_version     = "1.3.8"
	script_mag_version = "1.1.1.9"

	mag_import, mag             = pcall(require,"mag")
	imagesize_import, ImageSize = pcall(require,"imagesize")

	include_path   = aegisub.decode_path("?data\\automation\\include\\")
	c_image_tags   = "{\\an5\\bord0\\shad0\\1img($image)\\p1}$shape"
	c_shape_width  = 0
	c_shape_height = 0
	c_shape_tags   = "{\\an5\\bord0\\shad0\\blur0\\c$color\\p1}$shape"
	c_shape_color  = "#000000"

	function add_macro(subs,sel,act)
	local gui, ok, config
	gui = {{class = "label", x = 0, y = 0, width = 1, height = 1, label = "Devam etmek için aşağıdaki seçeneklerden birini seçiniz."}}
	ok  = mag.dlg(gui,{"Resim","Şerit","Kapat"})
	if ok == "Resim" then
		if not imagesize_import then
		mag.log(1,"ImageSize modül dosyası bulunamadı. Şu bağlantıdan indirebilirsiniz:\nhttps://github.com/ScottPhillips/Corona-SDK-Lua-Image-Size/tree/master/imagesize\n\nYönlendirilen sayfadan \"imagesize.lua\" dosyası ve \"imagesize\" klasörünü automation/include/ dizinine atmanız gerekiyor. \"imagesize/format\" dosyası içinden sadece \"png.lua\" dosyasına ihtiyaç vardır.")
		elseif not io.open(include_path.."imagesize\\util.lua") then
		mag.log(1,"\"util.lua\" dosyası bulunamadı. Şu bağlantıdan indirebilirsiniz:\nhttps://github.com/ScottPhillips/Corona-SDK-Lua-Image-Size/tree/master/imagesize\n\nYönlendirilen sayfadaki \"imagesize\" klasörünün içindedir.")
		elseif not io.open(include_path.."imagesize\\format\\png.lua") then
		mag.log(1,"\"png.lua\" dosyası bulunamadı. Şu bağlantıdan indirebilirsiniz:\nhttps://github.com/ScottPhillips/Corona-SDK-Lua-Image-Size/tree/master/imagesize\n\nYönlendirilen sayfadaki \"imagesize/format\" klasörünün içindedir.")
		else
		local file = "Dosya seçilmedi."
			repeat
			gui =
			{
	 		 {class = "label",                                              x = 0, y = 0, width = 1,  height = 1, label = mag.wall(" ",5).."Dizin:"}
			,{class = "label",                                              x = 1, y = 0, width = 20, height = 1, label = file}
			,{class = "label",                                              x = 0, y = 1, width = 1,  height = 1, label = "Etiketler:"}
			,{class = "edit",  name = "u_image_tags", value = c_image_tags, x = 1, y = 1, width = 20, height = 1}
			}
			ok, config   = mag.dlg(gui,{"Çizdir","Dosya seç","Panodan al","Kapat"})
			c_image_tags = config.u_image_tags
				if ok == mag.ascii("Dosya seç") then
				file = aegisub.dialog.open("Bir resim dosyası seçin",aegisub.decode_path("?script\\"),"","Resim dosyası (*.png)|*.png",false,true)
				file = mag.format("\"%s\"",file)
				end
				if ok == "Panodan al" then
				file = mag.cget()
				file = mag.gsub(file,"\"","")
				file = mag.gsub(file,"\\+","\\")
				if mag.find(mag.reverse(file),mag.reverse(".png")) ~= 1 then file = file..".png" end
				file = mag.format("\"%s\"",file)
				end
			until ok == mag.ascii("Çizdir") and file ~= "Dosya seçilmedi." or ok == "Kapat"
			if ok == mag.ascii("Çizdir") then
			local file_temp = mag.gsub(file,"\"","")
				if io.open(file_temp) then
				local width, height  = ImageSize.imgsize(file_temp)
				local meta           = karaskel.collect_head(subs)
				local xres, yres     = aegisub.video_size()
				local xratio, yratio = meta.res_x/xres, meta.res_y/yres
				local width          = mag.floor(width * xratio)
				local height         = mag.floor(height * yratio)
				local shape          = mag.format("m 0 0 l %d 0 l %d %d l 0 %d l 0 0",width,width,height,height)
				local line           = subs[act]
				line.text            = c_image_tags
				line.text            = mag.gsub(line.text,"%$image",file_temp)
				line.text            = mag.gsub(line.text,"%$shape",shape)
				subs[act]            = line
				else
				mag.log(1,"Belirtilen dosya bulunamadı.")
				end
			end
		end
	end
	if ok == mag.ascii("Şerit") then
	gui =
	{
	 {class = "label",                                                           x = 0, y = 0, width = 1, height = 1, label = mag.wall(" ",3).."Genişlik (px):"}
	,{class = "edit",  min = 0, name = "u_shape_width",  value = c_shape_width,  x = 1, y = 0, width = 5, height = 1}
	,{class = "label",                                                           x = 0, y = 1, width = 1, height = 1, label = "Yükseklik (px):"}
	,{class = "edit",  min = 0, name = "u_shape_height", value = c_shape_height, x = 1, y = 1, width = 5, height = 1}
	,{class = "label",                                                           x = 0, y = 2, width = 1, height = 1, label = mag.wall(" ",10).."Etiketler:"}
	,{class = "edit",           name = "u_shape_tags",   value = c_shape_tags,   x = 1, y = 2, width = 5, height = 1}
	,{class = "label",                                                           x = 0, y = 3, width = 1, height = 1, label = mag.wall(" ",15).."Renk:"}
	,{class = "color",          name = "u_shape_color",  value = c_shape_color,  x = 1, y = 3, width = 5, height = 1}
	}
	ok, config = mag.dlg(gui,{"Çizdir","Kapat"})
		if ok == mag.ascii("Çizdir") then
		c_shape_width  = config.u_shape_width
		c_shape_height = config.u_shape_height
		c_shape_tags   = config.u_shape_tags
		c_shape_color  = config.u_shape_color
		local line     = subs[act]
		local shape    = mag.format("m 0 0 l %d 0 l %d %d l 0 %d l 0 0",c_shape_width,c_shape_width,c_shape_height,c_shape_height)
		line.text      = c_shape_tags
		line.text      = mag.gsub(line.text,"%$color",mag.html_to_ass(c_shape_color))
		line.text      = mag.gsub(line.text,"%$shape",shape)
		subs[act]      = line
		end
	end
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
		mag.register(false,add_macro)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end
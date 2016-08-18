	script_name        = "Shaper"
	script_description = "Çözünürlüğe bağlı olarak resminiz için şekil çizer."
	script_author      = "Magnum357"
	script_version     = "1.3"
	script_mag_version = "1.1.1.8"

	mag_import, mag             = pcall(require,"mag")
	imagesize_import, ImageSize = pcall(require,"imagesize")

	c_tags = "{\\an5\\bord0\\shad0\\1img($image)\\p1}$shape"

	function run(subs,sel,act)
	local gui        = {{class = "label", x = 0, y = 0, width = 1,  height = 1, label = "Devam etmek için aşağıdaki seçeneklerden birini seçiniz."}}
	local ok, config = mag.dlg(gui,{"Dosya seç","Panodan kopyala","Kapat"})
	local file
	if ok == mag.ascii("Dosya seç") then
	file = aegisub.dialog.open("Bir resim dosyası seçin",aegisub.decode_path("?script\\"),"","Resim dosyası (*.png)|*.png",false,true)
	elseif ok == "Panodan kopyala" then
	file = mag.cget()
	end
	if file then
	file = mag.gsub(file,"\"","")
	file = mag.gsub(file,"\\+","\\")
	if mag.find(mag.reverse(file),"gnp%.") ~= 1 then file = file..".png" end
	gui =
	{
	 {class = "label",                                             x = 0, y = 0, width = 1,  height = 1, label = mag.wall(" ",17).."Dizin:"}
	,{class = "label",                                             x = 1, y = 0, width = 20, height = 1, label = file}
	,{class = "label",                                             x = 0, y = 1, width = 1,  height = 1, label = mag.wall(" ",12).."Etiketler:"}
	,{class = "edit",     name = "u_tags",     value = c_tags,     x = 1, y = 1, width = 20, height = 1}
	}
	buttons = {"Çizdir","Kapat"}
	ok, config = mag.dlg(gui,buttons)
		if ok == mag.ascii("Çizdir") then
		c_tags = config.u_tags
			if mag.match(c_tags,"%$image") == "$image" and mag.match(c_tags,"%$shape") == "$shape" then
				if io.open(file) then
				local width, height  = ImageSize.imgsize(mag.gsub(file,"\\","\\\\"))
				local meta           = karaskel.collect_head(subs)
				local xres, yres     = aegisub.video_size()
				local xratio, yratio = meta.res_x/xres, meta.res_y/yres
				local width          = mag.floor(width * xratio)
				local height         = mag.floor(height * yratio)
				local shape          = mag.format("m 0 0 l %d 0 l %d %d l 0 %d l 0 0",width,width,height,height)
				local line           = subs[act]
				line.text            = c_tags
				line.text            = mag.gsub(line.text,"%$image",mag.gsub(file,"\\","\\\\"))
				line.text            = mag.gsub(line.text,"%$shape",shape)
				subs[act]            = line
				else
				mag.log(1,"Belirtilen dosya bulunamadı.")
				end
			else
			mag.log(2,"Başında dolar işareti olan($) değişkenlerin isimlerini değiştirmeye çalışmayınız.")
			end
		end
	end
	end

	if mag_import then
		if not imagesize_import then
		imagesize_update_link     = "https://github.com/ScottPhillips/Corona-SDK-Lua-Image-Size"
		function imagesize_module() local k = aegisub.dialog.display({{class = "label", label = "ImageSize modülünü bulunamadı.\nImageSize modülü resmin çözünürlüğünü\nalgılamak için kullanılan harici bir modüldür.\nBu modülün indirme sayfasına gitmek ister misiniz?\n\nNOT: Yönlendirilen sayfadan sadece ImageSize lua dosyasını ve ImageSize\nklasörününün içindekileri indirip \"automation/include/\"\ndizinine atın."}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..imagesize_update_link) end end
		aegisub.register_macro(script_name,script_desription,imagesize_module)
		else
		mag_update_link           = "https://github.com/magnum357i/Magnum-s-Aegisub-Scripts"
		mag_version_check         = false
			if not mag_version_check then
			mag_version           = mag.match(io.open(aegisub.decode_path("?data\\automation\\include\\mag.lua")):read("*all"),"module_version%s-=%s\"([^\"]+)\"")
				if mag_version and mag_version:gsub("%.","") < script_mag_version:gsub("%.","") then
				function mag_check() local k = aegisub.dialog.display({{class = "label", label = "Mag modülünün kurulu sürümü bu lua dosyası ile uyumsuz.\nEn az "..script_mag_version.." veya en güncel modül sürümünü indirmeniz gerekiyor.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
				aegisub.register_macro(script_name,script_desription,mag_check)
				else
				mag_version_check = true
				mag.register(script_name,run)
				end
			end
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end
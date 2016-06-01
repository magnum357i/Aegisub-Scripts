	script_name = "Shaper"
	script_description = "Çözünürlüğe bağlı olarak resminiz için şekil çizer."
	script_author = "Magnum357"
	script_version = "1.1"

	include("karaskel.lua")
	ImageSize = require 'imagesize'
	mag = require 'mag'

	--ImageSize ve mag modüllerine ihtiyaç duyar.
	--ImageSize modülü için indirme sayfası: https://github.com/ScottPhillips/Corona-SDK-Lua-Image-Size
	--Verilen bağlantıdan sadece ImageSize klasörünü indirin ve automation/include/ dizinine atın. 
	--(Format klasöründeki png.lua dosyası hariç diğerlerini silebilirsiniz.)

	function shaper(subs,sel,config)
	local path = config["image_path"]
	local r_type = config["res_type"]
	local pcs = false
	rev_path = mag.reverse(path)
	if rev_path:find("gnp%.") ~= 1 then path = path..".png" end
	local width, height, format = ImageSize.imgsize(path)
	if width == nil and height == nil then
	mag.log("İstenilen türdeki resim dosyası bulunamadı.")
	else
	pcs = true
	local meta = karaskel.collect_head(subs)
	xres, yres = aegisub.video_size()
	for si, li in ipairs(sel) do
	line = subs[li]
	if r_type == "?video" then yratio = yres/1080 xratio = xres/1920 else yratio = meta.res_y/1080 xratio = meta.res_x/1920 end
	width = mag.floor(width * xratio)
	height = mag.floor(height * yratio)
	line.text = mag.format("{\\bord0\\shad0\\1img(%s)\\p1}m 0 0 l %d 0 l %d %d l 0 %d l 0 0",path,width,width,height,height)
	subs[li] = line
	end
	end
	if pcs == true then mag.prog("Resminiz için şekil çiziliyor...")
	else mag.log("Şekliniz çizilemedi!") end
	end

	function add_macro(subs,sel)
	local ok, config
	local v1, v2
	local dialog_config =
	{{class = "label",                                            x = 0, y = 0, width = 1,  height = 1, label = mag.wall(" ",4).."Resmin dizini ve adı:"}
	,{class = "edit",     name = "image_path",                    x = 1, y = 0, width = 10, height = 1,                                                   hint = ".PNG uzantısını yazmayın. Örnek: C:\\deneme "}
	,{class = "label",                                            x = 0, y = 1, width = 1,  height = 1, label = "Çözünürlük şuna göre:"}
	,{class = "dropdown", name = "res_type",   value = "?script", x = 1, y = 1, width = 10, height = 1, items = {"?script","?video"},                     hint = "?script ile alt yazı dosyasının çözünürlüğüne, ?video ile videonun çözünürlüğüne göre şekli boyutlandırırsınız."}}
	ok, config = mag.dlg(dialog_config,{"Çizdir","Kapat"})
	if ok == mag.ascii("Çizdir") then
	shaper(subs,sel,config)
	aegisub.set_undo_point(script_name)
	end
	end

	mag.register(false,add_macro)

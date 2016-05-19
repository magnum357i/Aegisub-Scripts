	script_name="Shaper"
	script_description="Çözünürlüğe bağlı olarak resminiz için şekil çizer."
	script_author="Magnum357"
	script_version="1.0"

	include("karaskel.lua")

	function shaper(subs,sel,config)
	local img_wid=config["image_width"]
	local img_heg=config["image_height"]
	local img_path=config["image_path"]
	local r_type=config["res_type"]
	local pcs = false
	rev_p = string.reverse(img_path)
	if rev_p:find("gnp%.") ~= 1 then img_path = img_path .. ".png" end
	ip1 = img_path:gsub("[^\\]+png","")
	ip2 = img_path:match("[^\\]+png")
	local file = io.open(img_path)
	if file == nil then
	aegisub.log(ip1 .. " dizininde " .. ip2 .. " dosyası bulunamadı.\n")
	else
	pcs = true
	local meta = karaskel.collect_head(subs)
	xres, yres = aegisub.video_size()
	for si, li in ipairs(sel) do
	local line = subs[li]
	local ratio = 1
	if r_type == "?video" then ratio = yres/720 
	else ratio = meta.res_y/720 end
	line.text = string.format("{\\bord0\\shad0\\1img(%s)\\p1}m 0 0 l %s 0 l %s %s l 0 %s l 0 0",img_path,math.floor(img_wid * ratio),math.floor(img_wid * ratio),math.floor(img_heg * ratio),math.floor(img_heg * ratio))
	subs[li] = line
	end
	end
	if pcs == true then prog("Resminiz için şekil çiziliyor...")
	else aegisub.log("Şekliniz çizilemedi!\n") end
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

	function add_macro(subs,sel)
	local ok, config, k
	local v1, v2, v3, v4
	v1 = 0
	v2 = 0
	v3 = ""
	v4 = "?script"
	k = false
	repeat
	local dialog_config=
	{{class="label",x=0,y=0,width=1,height=1,label="Resmin genişliği:"},
	{class="intedit",name="image_width",x=2,y=0,width=3,height=1,min=0,value=v1},
	{class="label",x=0,y=1,width=1,height=1,label="Resmin yüksekliği:"},
	{class="intedit",name="image_height",x=2,y=1,width=3,height=1,min=0,value=v2},
	{class="label",x=0,y=2,width=1,height=1,label="Resmin yolu:"},
	{class="edit",name="image_path",x=2,y=2,width=3,height=1,hint=".PNG uzantısını yazmayın. Örnek: C:\\deneme ",value=v3},
	{class="label",x=0,y=3,width=1,height=1,label="Çözünürlük şuna göre:"},
	{class="dropdown",name="res_type",x=2,y=3,width=3,height=1,items={"?script","?video"},value=v4,hint="?script ile alt yazı dosyasının çözünürlüğüne, ?video ile videonun çözünürlüğüne göre şekli boyutlandırırsınız."}}
	ok, config = aegisub.dialog.display(dialog_config,{"Uygula","Kapat"})
	v1 = config.image_width
	v2 = config.image_height
	v3 = config.image_path
	v4 = config.res_type
	if ok == "Uygula" then
	if v1 == 0 then aegisub.log("Resmin genişliği sıfır olamaz.\n")
	else if v2 == 0 then aegisub.log("Resmin yüksekliği sıfır olamaz.\n")
	else if v3 == "" then aegisub.log("Resmin dizini boş bırakılamaz.\n")
	else k = true end end end
	end
	until k == true or ok == "Kapat"
	if ok == "Uygula" then
	shaper(subs,sel,config)
	aegisub.set_undo_point(script_name)
	end
	end

	aegisub.register_macro(script_name,script_description,add_macro)
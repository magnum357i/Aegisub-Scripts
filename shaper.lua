	script_name="Shaper"
	script_description="Çözünürlüğe bağlı olarak resminiz için şekil çizer."
	script_author="Magnum357"
	script_version="1.0"

	include("karaskel.lua")

	function shaper(sub, sel, config)
	local pcs = false
	local meta,styles=karaskel.collect_head(sub)
	xres,yres,ar,artype=aegisub.video_size()
	local i_wid=config["image_width"]
	local i_heg=config["image_height"]
	local i_path=config["image_path"]
	local r_type=config["res_type"]
	if i_wid==0 then
	aegisub.log(1,"Resmin genişliğini giriniz!")
	elseif i_heg == 0 then
	aegisub.log(1,"Resmin yüksekliğini giriniz!")
	elseif i_path == "" then
	aegisub.log(1,"Resmin dizinini giriniz!")
	elseif r_type == "?video" and xres == nil then
	aegisub.log(1,"Videoya ait çözünürlük bulunamadı!")
	else		
	for si,li in ipairs(sel) do
	local line=sub[li]
	local ratio=1
	if r_type == "?video" then ratio = yres/720
	elseif r_type == "?script" then ratio = meta.res_y/720
	end
	pch = true
	line.text=string.format("{\\bord0\\shad0\\1img(%s.png)\\p1}m 0 0 l %s 0 l %s %s l 0 %s l 0 0",i_path,math.floor(i_wid*ratio), math.floor(i_wid*ratio), math.floor(i_heg*ratio), math.floor(i_heg*ratio))
	sub[li]=line
	end		
	end
	if pch == true then
	prog("Resminiz için şekil çiziliyor...")
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

	function create_config(sub)
	local dialog_config=
	{
	{
	class="label",
	x=0,y=0,width=1,height=1,
	label="Resmin genişliği:"
	},
	{
	class="intedit",name="image_width",
	x=2,y=0,width=3,height=1,
	},
	{
	class="label",
	x=0,y=1,width=1,height=1,
	label="Resmin yüksekliği:"
	},
	{
	class="intedit",name="image_height",
	x=2,y=1,width=3,height=1
	},
	{
	class="label",
	x=0,y=2,width=1,height=1,
	label="Resmin dizini:",
	},{
	class="edit",name="image_path",
	x=2,y=2,width=3,height=1,hint="Ters slash işaretlerini ikileyin (\" \\\\ \") ve .PNG uzantısını yazmayın.",
	},
	{
	class="label",
	x=0,y=3,width=1,height=1,
	label="Çözünürlük şuna göre: "
	},{
	class="dropdown",name="res_type",
	x=2,y=3,width=3,height=1,
	items={"?script","?video"},value="?script",hint="?script seçeneğiyle alt yazı dosyasının çözünürlüğüne, ?video diyerek videonun çözünürlüğüne göre şekli boyutlandırırsınız.",
	},	
	}
	return dialog_config
	end

	function add_macro(sub, sel, config)
	local ok, config
	ok, config = aegisub.dialog.display(create_config(sub),{"Uygula","Kapat"})
	if ok == "Uygula" then
	shaper(sub, sel, config)
    aegisub.set_undo_point(script_name)
	end
	end

	aegisub.register_macro(script_name, script_description, add_macro)

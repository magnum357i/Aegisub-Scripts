	script_name        = "Italic Maker"
	script_description = "Seçili satırların başına italik yapma, sonuna italik yapmama etiketi koyar."
	script_version     = "1"
	script_author      = "Magnum357"

	mag_import, mag = pcall(require,"mag")

	function add_macro(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text = mag.format("%s%s%s","{\\i1}",line.text,"{\\i0}")
	subs[li] = line
	end
	end
	
	if mag_import then mag.register(false,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
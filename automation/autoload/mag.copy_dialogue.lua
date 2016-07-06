	script_name        = "Copy Dialogue"
	script_description = "Seçilmiş satırların metinlerini salt halinde panoya kopyalar."
	script_version     = "1"
	script_author      = "Magnum357"

	mag_import, mag = pcall(require,"mag")

	function add_macro(subs,sel)
	local line
	local result = ""
	local line_break = ""
	for si, li in ipairs(sel) do
	line = subs[li]
	result = result..line_break..mag.space_trim(mag.full_strip(line.text))
	line_break = "\n"
	end
	mag.cset(result)
	end
	
	if mag_import then mag.register(false,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
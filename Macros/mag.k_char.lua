	script_name = "K Char"
	script_desription = "Seçilmiş satır grubundaki her cümlenin her karakterinin başına {\\k} koyar."
	script_version = "1"
	script_author = "Magnum357"

	mag_import, mag = pcall(require,"mag")

	function add_macro(subs,sel)
	local c = "{\\k}"
	for si, li in ipairs(sel) do
	line = subs[li]
	local result = ""
	local in_tags = false
	for char in unicode.chars(line.text) do
	if char == "{" then in_tags = true end
	if char == "}" then in_tags = false end
	if in_tags == false and char ~= "}" and mag.match(char,"%s") == nil then char = c..char end
	result = result..char
	end
	line.text = result
	subs[li] = line
	end
	end
	
	if mag_import then mag.register(false,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end

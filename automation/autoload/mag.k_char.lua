	script_name        = "K Char"
	script_description = "Seçilmiş satır grubundaki her cümlenin her karakterinin başına {\\k} koyar."
	script_version     = "1"
	script_author      = "Magnum357"
	script_mag_version = "1.1.1.9"

	mag_import, mag = pcall(require,"mag")

	function add_macro(subs,sel)
	local c = "{\\k}"
	local line
	for si, li in ipairs(sel) do
	line = subs[li]
	local result  = ""
	local in_tags = false
		for char in unicode.chars(line.text) do
		if char == "{" then in_tags = true end
		if char == "}" then in_tags = false end
		if in_tags == false and char ~= "}" and mag.match(char,"%s") == nil then char = c..char end
		result = result..char
		end
	line.text = result
	subs[li]  = line
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
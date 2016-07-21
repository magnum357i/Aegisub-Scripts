	script_name        = "Fix Turkish Chars"
	script_description = "Bozulmuş Türkçe karakterleri düzeltir."
	script_author      = "Magnum357"
	script_version     = "1.1"

	mag_import, mag = pcall(require,"mag")

	function add_macro(subs)
	local fix_chars = {
	"þ", "ş",
	"Þ", "Ş",
	"Ý", "İ",
	"ý", "ı",
	"ð", "ğ",
	"Ð", "Ğ"
	}
	local pcs   = false
	local count = 0
	for i = 1, #subs do
	local line = subs[i]
		if line.class == "dialogue" then
			for j = 1, #fix_chars / 2 do
				if mag.match(line.text,fix_chars[j * 2 - 1]) then
				pcs       = true
				line.text = mag.gsub(line.text,fix_chars[j * 2 - 1],fix_chars[j * 2])
				end
			end
		end
		if pcs then
		subs[i] = line
		end
	end
	if not pcs then mag.log(2,"Bozuk karakter bulunamadı.") end
	aegisub.set_undo_point(script_name)
	end

	if mag_import then mag.register(false,add_macro)
	else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
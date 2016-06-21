	script_name="Fixing Turkish Chars"
	script_description="Bozulmuş Türkçe karakterleri düzeltir."
	script_author="Magnum357"
	script_version="1.0.1"

	function fixing_turkish_chars(subs)
	local pcs = false
	local arr_count
	local chars = 
	{[1] = "þ",[2] = "Þ",[3] = "Ý",[4] = "ý",[5]  = "ð",
	 [6] = "ş",[7] = "Ş",[8] = "İ",[9] = "ı",[10] = "ğ"}
	for i = 1, #subs do
	if subs[i].class == "dialogue" then
	line = subs[i]
	text = subs[i].text
	arr_count = table.getn(chars) / 2
	for j = 1, arr_count do
	if text:match(chars[j]) then
	pcs = true
	text = text:gsub(chars[j],chars[j + arr_count])
	end
	end
	line.text = text
	subs[i] = line
	end
	end
	if pcs == true then prog("Bozuk karakterler düzeltiliyor...")
	else aegisub.log("Bir tane bile bozuk karakter bulunamadı.") end
	aegisub.set_undo_point(script_name)
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

	aegisub.register_macro(script_name,script_description,fixing_turkish_chars)

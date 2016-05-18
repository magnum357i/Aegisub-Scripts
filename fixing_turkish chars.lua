	script_name="Fixing Turkish Chars"
	script_description="Bozulmuş Türkçe karakterleri düzeltir."
	script_author="Magnum357"
	script_version="1.0"

	function fixing_turkish_chars(subs)
	local pcs = false
	local tr_chars = {"ş","Ş","İ","ı","ğ"}
	local problem_chars = {"þ","Þ","Ý","ý","ð"}
	for i=1, #subs do
	if subs[i].class == "dialogue" then
	line = subs[i]
	text = subs[i].text
	for j = 1, 5 do
	if text:match(problem_chars[j]) then pcs = true end		
	text = text:gsub(problem_chars[j], tr_chars[j])
	end
	line.text = text
	subs[i] = line
	end
    end
    if pcs == true then prog("Bozuk karakterler düzeltiliyor...")
    else aegisub.log(2, "Bir tane bile bozuk karakter bulunamadı.") end    
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

	aegisub.register_macro(script_name, script_description, fixing_turkish_chars)

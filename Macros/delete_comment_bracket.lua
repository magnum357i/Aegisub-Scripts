	script_name="Delete Comment Bracket"
	script_description="Çeviri notlarını siler."
	script_author="Magnum357"
	script_version="1.1"

	function delete_cb(subs)
	pcs = false
	for i=1, #subs do
	if subs[i].class=="dialogue" then
	line=subs[i]
	text=subs[i].text
	if text:match("{[^\\]-}") then
	text = text:gsub("{[^\\]-}","")
	pcs = true
	end
	line.text=text
	subs[i]=line
	end
	end
	if pcs == true then prog("Yorum parantezleri siliniyor...") end
	if pcs == false then aegisub.log("Silinecek yorum parantezi bulunamadı!") end
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

	aegisub.register_macro(script_name, script_description, delete_cb)

	--[[
	- Şablonlarca oluşturulan karaoke satırlarını siler.
	- Şablon kodlarının olduğu satırların sürelerini sıfırlar.
	- Şablonun uygulandığı satırları görünür yapar.
	- Şablon uygulandığında oluşan furigana stilleri siler.

	NOT: Yorum satırı yapılmış satırlarda effect kutucuğuna 
	template ve code kelimelerini girmekten kaçının.
	]]--

	script_name="Karaoke Cleaner"
	script_description="Şablon efeklerinin oluşturduğu girdileri temizler."
	script_author="Magnum357"
	script_version="1.1"

	function karaoke_cleaner(subs)
	local pcs = false
	for i=#subs,1,-1 do	
	local line = subs[i]
	if line.class == "style" then
	if line.name:match("-furigana") then
	subs.delete(i)
	pcs = true
	end
	end
	if line.class == "dialogue" then
	if line.effect == "fx" then
	subs.delete(i)
	pcs = true
	end
	if line.effect == "karaoke" and line.comment == true then
	line.comment = false
	line.effect = ""
	pcs = true
	subs[i]=line		
	end
	if line.comment == true then
	if line.effect:match("template") or line.effect:match("code") then
	if line.start_time > 0 or line.end_time > 0 then
	pcs = true
	line.start_time = 0
	line.end_time = 0
	subs[i]=line
	end
	end
	end
	end
	end
	if pcs == false then
	aegisub.log("Düzeltilecek bir şey bulunamadı.")
	else
	prog("Karaoke temizleniyor...")
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

	aegisub.register_macro(script_name, script_description, karaoke_cleaner)

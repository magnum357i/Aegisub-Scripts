	script_name="Copy - Paste Timing"
	script_description="Seçilen satırların zamanlamasını kopyalar ve bunu başka seçilen satırlara yapıştırır."
	script_author="Magnum357"
	script_version="1.0"

	clipboard = require 'aegisub.clipboard'

	function copy_timing(subs,sel)
	local result = ""
	local comma = ""
	local pcs = false
	if #sel > 0 then
	pcs = true
	for si, li in pairs(sel) do
	start_time = subs[li].start_time
	end_time = subs[li].end_time
	result = result..comma.."s="..start_time.."e="..end_time
	comma = ","
	end
	result = "sel="..#sel..result
	clipboard.set(result)
	prog("Zamanlar panoya kopyalanıyor...")
	else
	aegisub.log("Seçili satır yok!")
	end
	end

	function paste_timing(subs,sel)
	local pcs = false
	local st, et = {}, {}
	local n = 0
	local result = clipboard.get()
	if result:match("s=%d+e=%d+") then
	local copy_sel = tonumber(result:match("sel=(%d+)"))
	if copy_sel == #sel then
	result = result:gsub("sel=%d+","")
	for t in result:gmatch("[^,]+,?") do
	n = n + 1
	st[n] = t:match("s=(%d+)")
	et[n] = t:match("e=(%d+)")
	end
	for si, li in pairs(sel) do
	line = subs[li]
	line.start_time = st[si]
	line.end_time = et[si]
	subs[li] = line
	pcs = true
	end
	if pcs == true then prog("Zamanlar panodan alınıyor...") 
	else aegisub.log("Bir hata oluştu.") end
	else
	aegisub.log("Kaynak satır sayısıyla hedef satır sayısı tutmuyor.")
	end
	else
	aegisub.log("Panoda zaman bilgisi bulunamadı!")
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

	aegisub.register_macro("Timing/Kopyala",script_description,copy_timing)
	aegisub.register_macro("Timing/Yapıştır",script_description,paste_timing)
	script_name = "Basic Turning"
	script_description = "Bazı şeyleri bazı şeylere çevirir. Seçili satırlarda çevireceği şeyi bularak işlem yapar."
	script_author = "Magnum357"
	script_version = "1.9.4"

	mag_import, mag = pcall(require,"mag")
	
	bt_sign = "*"

	function basic_turning(sub,sel,act)
	line = sub[act]
	if line.text:find(bt_sign.."lp") and line.text:find(bt_sign.."ln") == nil then
	line.text = line.text:gsub(bt_sign.."lp","")
	line.text = mag.format("- %s\\N- %s",sub[act - 1].text,line.text)
	if line.start_time > sub[act - 1].start_time then line.start_time = sub[act - 1].start_time end
	if line.end_time < sub[act - 1].end_time then line.end_time = sub[act - 1].end_time end
	sub.delete(act)
	sub[act - 1] = line
	return {act - 1}
	end
	if line.text:find(bt_sign.."ln") and line.text:find(bt_sign.."lp") == nil then
	line.text = line.text:gsub(bt_sign.."ln","")
	line.text = mag.format("- %s\\N- %s",line.text,sub[act + 1].text)
	if line.start_time > sub[act + 1].start_time then line.start_time = sub[act + 1].start_time end
	if line.end_time < sub[act + 1].end_time then line.end_time = sub[act + 1].end_time end
	sub.delete(act + 1)
	sub[act] = line
	end
	for si,li in ipairs(sel) do
	if sub[li].class == "dialogue" then
	line = sub[li]
	text = sub[li].text
	if     not text:find(bt_sign.."2t")
	   and     text:find(bt_sign.."t")
	   and not text:find(bt_sign.."T")
	   and not text:find(bt_sign.."s")
	   and not text:find(bt_sign.."S")
	then
	_, ct_t = text:gsub(bt_sign.."t","")
	if ct_t == 2 then
	t_t1 = text:find(bt_sign.."t")
	t_t2 = text:find(bt_sign.."t",t_t1 + 1)
	text = text:gsub(bt_sign.."t","")
	t_sub = text_lower(text:sub(t_t1,t_t2 - 3))
	text = text:sub(0,t_t1 - 1)..capitalize(t_sub)..text:sub(t_t2 - 2,string.len(text))
	else
	text = text:gsub(bt_sign.."t","")
	text = capitalize(text)
	end
	end
	if     not text:find(bt_sign.."2t")
	   and not text:find(bt_sign.."t")
	   and not text:find(bt_sign.."T")
	   and     text:find(bt_sign.."s")
	   and not text:find(bt_sign.."S")
	then
	_, ct_t = text:gsub(bt_sign.."s","")
	if ct_t == 2 then
	t_t1 = text:find(bt_sign.."s")
	t_t2 = text:find(bt_sign.."s",t_t1 + 1)
	text = text:gsub(bt_sign.."s","")
	text = text:sub(0,t_t1 - 1) .. text_lower(text:sub(t_t1,(t_t1 + (t_t2 - t_t1)) - 3)) .. text:sub(t_t2 - 2,string.len(text))
	else
	text = text:gsub(bt_sign.."s","")
	text = text_lower(text)
	end
	end
	if      not text:find(bt_sign.."2t")
	    and not text:find(bt_sign.."t")
	    and not text:find(bt_sign.."T")
	    and not text:find(bt_sign.."s")
	    and text:find(bt_sign.."S")
	then
	_, ct_t = text:gsub(bt_sign.."S","")
	if ct_t == 2 then
	t_t1 = text:find(bt_sign.."S")
	t_t2 = text:find(bt_sign.."S",t_t1 + 1)
	text = text:gsub(bt_sign.."S","")
	text = text:sub(0,t_t1 - 1) .. text_upper(text:sub(t_t1,(t_t1 + (t_t2 - t_t1)) - 3)) .. text:sub(t_t2 - 2,string.len(text))
	else
	text = text:gsub(bt_sign.."S","")
	text = text_upper(text)
	end
	end
	if     not text:find(bt_sign.."2t")
	   and not text:find(bt_sign.."t")
	   and text:find(bt_sign.."T")
	   and not text:find(bt_sign.."s")
	   and not text:find(bt_sign.."S")
	then
	text = text:gsub(bt_sign.."T","")
	text = capitalize_sentences(text)
	text = respect(text)
	end
	if      text:find(bt_sign.."2t")
	and not text:find(bt_sign.."t")
	and not text:find(bt_sign.."T")
	and not text:find(bt_sign.."s")
	and not text:find(bt_sign.."S")
	then
	_, ct_t = text:gsub(bt_sign.."2t","")
	if ct_t == 2 then
	t_t1 = text:find(bt_sign.."2t")
	t_t2 = text:find(bt_sign.."2t",t_t1 + 1)
	text = text:gsub(bt_sign.."2t","")
	t_sub = text:sub(t_t1,t_t2 - 3)
	text = text:sub(0,t_t1 - 1)..turkish_capitalize(capitalize(t_sub))..text:sub(t_t2 - 2,string.len(text))
	else
	text = text:gsub(bt_sign.."2t","")
	text = turkish_capitalize(capitalize(text))
	end
	end
	text = mag.tag_replacer(text,bt_sign.."0","{\\i0}" )
	text = mag.tag_replacer(text,bt_sign.."1","{\\i1}" )
	text = mag.tag_replacer(text,bt_sign.."8","{\\an8}")
	text = mag.tag_replacer(text,bt_sign.."n","\\N"    )
	text = mag.tag_replacer(text,bt_sign.."h","\\h"    )
	text = mag.tag_replacer(text,bt_sign.."a","â"      )
	text = mag.tag_replacer(text,bt_sign.."A","Â"      )
	text = mag.tag_replacer(text,bt_sign.."i","î"      )
	text = mag.tag_replacer(text,bt_sign.."İ","Î"      )
	local fad_tag = false
	local fad_value = ""
	local fad_txt = ""
	local fad_splt_txt, fad_splt_ct
	if mag.match(text,bt_sign.."f%d+,%d+"..bt_sign) then fad_tag = true end
	if fad_tag == true then
	fad_splt_ct, fad_splt_txt = mag.splitter(true,text,bt_sign.."f%d+,%d+"..bt_sign)
	for s = 1, fad_splt_ct do
	fad_value = mag.match(fad_splt_txt[s],bt_sign.."f(%d+,%d+)"..bt_sign)
	fad_value = mag.unnil(fad_value)
	fad_txt = fad_txt..mag.tag_replacer(fad_splt_txt[s],bt_sign.."f%d+,%d+"..bt_sign,"{\\fad("..fad_value..")}")
	end
	text = fad_txt
	end
	local alpha_tag = false
	local alpha_value = ""
	local alpha_txt = ""
	local alpha_splt_txt, alpha_splt_ct
	if mag.match(text,bt_sign.."x[a-d]?%d+") then alpha_tag = true end
	if alpha_tag == true then
	alpha_splt_ct, alpha_splt_txt = mag.splitter(true,text,bt_sign.."x[a-d]?%d+")
	for s = 1, alpha_splt_ct do
	alpha_value = mag.match(alpha_splt_txt[s],bt_sign.."x[a-d]?%d+")
	if mag.match(alpha_splt_txt[s],bt_sign.."x%d+")  then alpha_value = mag.format("{\\alpha&H%X&}",mag.match(alpha_splt_txt[s],"x(%d+)"))  end
	if mag.match(alpha_splt_txt[s],bt_sign.."xa%d+") then alpha_value = mag.format("{\\1a&H%X&}",   mag.match(alpha_splt_txt[s],"xa(%d+)")) end
	if mag.match(alpha_splt_txt[s],bt_sign.."xb%d+") then alpha_value = mag.format("{\\2a&H%X&}",   mag.match(alpha_splt_txt[s],"xb(%d+)")) end
	if mag.match(alpha_splt_txt[s],bt_sign.."xc%d+") then alpha_value = mag.format("{\\3a&H%X&}",   mag.match(alpha_splt_txt[s],"xc(%d+)")) end
	if mag.match(alpha_splt_txt[s],bt_sign.."xd%d+") then alpha_value = mag.format("{\\4a&H%X&}",   mag.match(alpha_splt_txt[s],"xd(%d+)")) end
	alpha_txt = alpha_txt..mag.tag_changer(alpha_splt_txt[s],bt_sign.."x[a-d]?%d+",alpha_value)
	end
	text = alpha_txt
	end
	if text:find(bt_sign.."l[^pn]") then
	text = text:gsub(bt_sign.."l".." +",bt_sign.."l")
	text = text:gsub(" +"..bt_sign.."l",bt_sign.."l")
	text = text:gsub(bt_sign.."l","\\N- ")
	text = "- "..text
	end
	if text:find(bt_sign.."b") then
	text = text:gsub("\\N"," ")
	text = text:gsub("%s+"," ")
	text = text:gsub(bt_sign.."b","\\N")
	end	
	_, gt = text:gsub("%%","")
	if gt > 0 then
	if gt % 2 == 0 then
	gt_redirect(text)
	text = text:gsub("%%","")
	end
	end
	if text:match("%+") then
	tureng_redirect(text)
	text = text:gsub("%+","")
	end
	text = text:gsub("%+","")
	line.text = text
	sub[li] = line
	end
	end
	aegisub.set_undo_point(script_name)
	end

	function gt_redirect(text)
	text = strip_text(text)
	local sp = ""
	local sentente = ""
	local pattern = "()%%.-%%()"
	for trim1, trim2 in text:gmatch(pattern) do
	local txt = text:sub(trim1+1, trim2-2)
	sentente = sentente .. sp .. txt
	sp = " "
	end
	sentente = sentente
	:gsub(" +"," ")
	:gsub("%%","%%25")
	:gsub("%?","%%3F")
	:gsub("%:","%%3A")
	:gsub("%;","%%3B")
	:gsub(" ","%%20")
	translate_url = "https://translate.google.com.tr/?hl=tr#en/tr/"
	return os.execute("start" .. " " .. translate_url .. sentente)
	end

	function tureng_redirect(text)
	text = strip_text(text)
	local pattern = "%+%s*%w+'*%w*"
	local sentente = ""
	local space = ""
	for words in text:gmatch(pattern) do
	words = words:gsub("%+",""):gsub("%s+","")
	sentente = sentente .. space .. words
	space = " "
	end
	search = sentente:gsub(" ","%%20")
	search = mag.low(search)
	translate_url = "http://tureng.com/tr/turkce-ingilizce/"
	return os.execute("start" .. " " .. translate_url .. search)
	end

	function strip_text(text)
	text = text
	:gsub("{[^}]+}", "")
	:gsub("\\N"," ")
	:gsub("\\h"," ")
	:gsub("\\n"," ")
	:gsub("%s+"," ")
	return text
	end

	function respect(line)
	line = line:gsub("(%w+%-%w+)",function (a) return string.upper(a:sub(0,1)) .. a:sub(2,-1) end)
	return line
	end

	function capitalize_sentences(line)
	line = "s#p1. " .. line .. "."
	line = line:gsub("\\N","#\\\\\\#"):gsub("\\n","#\\\\\\\\\\\\#"):gsub("\\h","#\\\\\\\\\\\\\\\\\\#")
	local dots = 0
	local in_tag = false
	local l = ""
	local first_char = false
	for sentence in line:gmatch(".+[%.%!%?%:]+") do
	for char in unicode.chars(sentence) do
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
	if char:match("[%.%!%?%:]") then first_char = true end
	if in_tag == false then
	if char:match("[a-zA-ZçÇşŞıIiİüÜöÖ0-9]") then
	if first_char == true and dots ~= 3 then char = mag.up(char) end
	first_char = false
	end
	end
	l = l .. char
	if char:match("%.") then dots = dots + 1 else dots = 0 end
	end
	end
	--l = l:gsub("(%.%.%.)([A-ZŞÇÖÜİĞ]+)",
	--function (a,b) if lt(b) == 1 then fc = true for c in unicode.chars(b) do if c:match("[A-ZŞÇÖÜİ]") and fc == true then b = lower(c) fc = false else b = b .. c end end end return a .. b end)
	return l:sub(1,-2):gsub("s#p1%. ",""):gsub("#\\\\\\#","\\N"):gsub("#\\\\\\\\\\\\#","\\n"):gsub("#\\\\\\\\\\\\\\\\\\#","\\h")
	end

	function turkish_capitalize(line)
	line = line .. " "
	line = line:gsub("([^a-zçşıüöğ])(\\N)","%1\\N#sp1 "):gsub("([^a-zçşıüöğ])(\\n)","%1\\n#sp2 "):gsub("([^a-zçşıüöğ])(\\h)","%1\\h#sp3 ")
	local n = 0
	local conjunctions = 
	{"Ve","Veya","Ama","İle","İçin","Eğer","De","Da","Ya","Hem","Yani","Öyleyse",
	"Yoksa","Sanki","Oysa","Fakat","Mısın","Misin","Musun","Mi","Mı","Mu","Mü"}
	local in_tag = false
	local ccs = false
	local l = ""
	local stw = ""
	for word in line:gmatch("[^%s]+%s+") do
	stw = mag.removedot(strip_text(word):gsub("%s+",""))
	for k = 1, table.getn(conjunctions) do if stw == conjunctions[k] then ccs = true end end
	for char in unicode.chars(word) do
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
	if in_tag == false then
	if char:match("[a-zA-ZçÇşŞıIiİüÜöÖ0-9]") then
	if ccs == true and n > 0 then char = mag.low(char) end
	ccs = false
	n = n + 1
	end
	end
	l = l .. char
	end
	end
	return l:sub(1,-2):gsub("\\N#sp1 ","\\N"):gsub("\\n#sp2 ","\\n"):gsub("\\h#sp3 ","\\h")
	end

	function capitalize(line)
	line = " " .. line
	line = line:gsub("([^a-zçşıüöğ])(\\N)","%1\\N#sp1 "):gsub("([^a-zçşıüöğ])(\\n)","%1\\n#sp2 "):gsub("([^a-zçşıüöğ])(\\h)","%1\\h#sp3 ")
	local first_char = false
	local in_space = false
	local in_tag = false
	local l = ""
	for char in unicode.chars(line) do
	if char == " " then in_space = true first_char = false end
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
	if in_tag == false then
	if in_space == true then
	if char:match("[a-zA-ZçÇşŞıIiİüÜöÖ]") and first_char == false then
	first_char = true
	char = mag.up(char)
	end
	end
	end
	l = l .. char
	end
	return l:sub(2,-1):gsub("\\[nN]#sp1 ","\\N"):gsub("\\[nN]#sp2 ","\\n"):gsub("\\[hH]#sp3 ","\\h")
	end

	function text_lower(line)
	line = " " .. line
	line = line:gsub("\\N","\\N#sp1")
	local in_space = false
	local in_tag = false
	local l = ""
	for char in unicode.chars(line) do
	if char == " " then in_space = true end
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
	if in_tag == false then
	if in_space == true then
	if char:match("[a-zA-ZçÇşŞıIiİüÜöÖ]") then
	char = mag.low(char)
	end
	end
	end
	l = l .. char
	end
	return l:sub(2,-1):gsub("\\n#sp1","\\N")
	end

	function text_upper(line)
	line = " " .. line
	line = line:gsub("\\n","\\n#sp2"):gsub("\\h","\\h#sp3")
	local in_space = false
	local in_tag = false
	local l = ""
	for char in unicode.chars(line) do
	if char == " " then in_space = true end
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
	if in_tag == false then
	if in_space == true then
	if char:match("[a-zA-ZçÇşŞıIiİüÜöÖ]") then
	char = mag.up(char)
	end
	end
	end
	l = l .. char
	end
	return l:sub(2,-1):gsub("\\N#SP2","\\n"):gsub("\\H#SP3","\\h")
	end

	function main_gui(last_value)
	if last_value == nil then last_value = "Seç" end
	local dialog_config =
	{
	{class = "label",                     x = 0, y = 0, width = 1, height = 1, label = "Bir kategori seçin:"},
	{class = "dropdown", name = "u_type", x = 1, y = 0, width = 1, height = 1, items = {"Seç","Etiket Dönüşümleri","Harf Dönüşümleri","Büyük-Küçük Harf Dönüşümleri","Çeviri Siteleri","Satır Düzenleme"}, value = last_value}
	}
	return dialog_config
	end

	function gui1()
	local dialog_config =
	{
	{class = "label", x = 0, y = 0, width = 3, height = 1, label = mag.wall("-",6).."[ Etiket Dönüşümleri ]"..mag.wall("-",6)},
	{class = "label", x = 0, y = 1, width = 1, height = 1, label =
	" #"
	.."\n---"
	.."\n 1"
	.."\n 2"
	.."\n 3"
	.."\n 4"
	.."\n 5"
	.."\n 6"
	.."\n 7"
	.."\n 8"
	.."\n 9"
	.."\n 10"
	.."\n 11"
	},
	{class = "label", x = 1, y = 1, width = 1, height = 1, label =
	"|  Karakter"
	.."\n"..mag.wall("-",11)
	.."\n|  "..bt_sign.."0"
	.."\n|  "..bt_sign.."1"
	.."\n|  "..bt_sign.."8"
	.."\n|  "..bt_sign.."n"
	.."\n|  "..bt_sign.."h"
	.."\n|  "..bt_sign.."f300,200"
	.."\n|  "..bt_sign.."x80"
	.."\n|  "..bt_sign.."xa80"
	.."\n|  "..bt_sign.."xb80"
	.."\n|  "..bt_sign.."xc80"
	.."\n|  "..bt_sign.."xd80"
	},
	{class = "label", x = 2, y = 1, width = 1, height = 1, label =
	"|  Dönüşüm"
	.."\n"..mag.wall("-",19)
	.."\n|  {\\i0}"
	.."\n|  {\\i1}"
	.."\n|  {\\an8}"
	.."\n|  {\\N}"
	.."\n|  {\\h}"
	.."\n|  {\\fad(300,200)}"
	.."\n|  {\\alphaH50}"
	.."\n|  {\\1aH50}"
	.."\n|  {\\2aH50}"
	.."\n|  {\\3aH50}"
	.."\n|  {\\4aH50}"
	}}
	return dialog_config
	end

	function gui2()
	local dialog_config =
	{
	{class = "label", x = 0, y = 0, width = 3, height = 1, label = mag.wall("-",7).."[ Harf Dönüşümleri ]"..mag.wall("-",7)},
	{class = "label", x = 0, y = 1, width = 1, height = 1, label =
	" #"
	.."\n"..mag.wall("-",3)
	.."\n 1"
	.."\n 2"
	.."\n 3"
	.."\n 4"
	},
	{class = "label", x = 1, y = 1, width = 1, height = 1, label =
	"|  Karakter"
	.."\n"..mag.wall("-",11)
	.."\n|  "..bt_sign.."a"
	.."\n|  "..bt_sign.."A"
	.."\n|  "..bt_sign.."i"
	.."\n|  "..bt_sign.."İ"
	},
	{class = "label", x = 2, y = 1, width = 1, height = 1, label =
	"|  Dönüşüm"
	.."\n"..mag.wall("-",20)
	.."\n|  â"
	.."\n|  Â"
	.."\n|  î"
	.."\n|  Î"
	}}
	return dialog_config
	end

	function gui3()
	local dialog_config =
	{
	{class = "label", x = 0, y = 0, width = 3, height = 1, label = mag.wall("-",32).."[ Büyük-Küçük Harf Dönüşümleri ]"..mag.wall("-",32)},
	{class = "label", x = 0, y = 1, width = 1, height = 1, label =
	" #"
	.."\n"..mag.wall("-",3)
	.."\n 1"
	.."\n 2"
	.."\n 3"
	.."\n 4"
	.."\n 5"
	.."\n"..mag.wall("-",3)
	},
	{class = "label", x = 1, y = 1, width = 1, height = 1, label =
	"|  Karakter"
	.."\n"..mag.wall("-",11)
	.."\n|  "..bt_sign.."t"
	.."\n|  "..bt_sign.."T"
	.."\n|  "..bt_sign.."2t"
	.."\n|  "..bt_sign.."s"
	.."\n|  "..bt_sign.."S"
	.."\n"..mag.wall("-",11)
	},
	{class = "label", x = 2, y = 1, width = 1, height = 1, label =
	"|  Örnek"
	.."\n"..mag.wall("-",85)
	.."\n|  Her Kelimenin Baş Harfi Büyük Harfe Çevrildi."
	.."\n|  Her cümlenin baş harfi büyük harfe çevrildi."
	.."\n|  Her Kelimenin Baş Harfi Büyük Harfe Çevrildi ama Türkçe Bağlaçlar çevrilmedi."
	.."\n|  her harf küçük harfe çevrildi."
	.."\n|  HER HARF BÜYÜK HARFE ÇEVRİLDİ."
	.."\n"..mag.wall("-",85)
	},
	{class = "label", x = 0, y = 2, width = 3, height = 1, label =
	"NOT: Cümlenin belli bir kısmını almak için o kısmın başına ve sonuna "..bt_sign.."T modu hariç\n bu işaretlerden koyun."
	.. "\nÖrnek bir "..bt_sign.."(t-s-S-2t)cümle."..bt_sign.."(t-s-S-2t)"
	}}
	return dialog_config
	end

	function gui4()
	local dialog_config =
	{
	{class = "label", x = 0, y = 0, width = 4, height = 1, label = mag.wall("-",55).."[ Çeviri Siteleri ]"..mag.wall("-",54)},	
	{class = "label", x = 0, y = 1, width = 1, height = 1, label =
	" #"
	.."\n---"
	.."\n 1"
	.."\n 2"
	},
	{class = "label", x = 1, y = 1, width = 1, height = 1, label =
	"|  Karakter"
	.."\n"..mag.wall("-",11)
	.."\n|  +"
	.."\n|  %"
	},
	{class = "label", x = 2, y = 1, width = 1, height = 1, label =
	"|  Açıklama"
	.."\n"..mag.wall("-",86)
	.."\n|  Tureng sitesinde arama yapmak için kelimenin başına artı işareti(+) koyunuz."
	.."\n|  Google Translate sitesinde arama yapmak için yüzde işaretiyle(%) bir alan seçin."
	},
	{class = "label", x = 3, y = 1, width = 1,height = 1, label =
	"|  Örnek"
	.."\n"..mag.wall("-",23)
	.."\n|  This is +a +sample."
	.."\n|  This is %a sample%."
	}}
	return dialog_config
	end

	function gui5()
	local dialog_config =
	{
	{class = "label", x = 0, y = 0, width = 4, height = 1, label = mag.wall("-",77).."[ Satır Düzenleme ]"..mag.wall("-",77)},
	{class = "label", x = 0, y = 1, width = 1, height = 1, label =
	" #"
	.."\n"..mag.wall("-",3)
	.."\n 1"
	.."\n 2"
	.."\n 3"
	.."\n 4"
	},
	{class = "label", x = 1, y = 1, width = 1, height = 1, label =
	"|  Karakter"
	.."\n"..mag.wall("-",11)
	.."\n|  "..bt_sign.."l"
	.."\n|  "..bt_sign.."lp"
	.."\n|  "..bt_sign.."ln"
	.."\n|  "..bt_sign.."b"
	},
	{class = "label", x = 2, y = 1, width = 1, height = 1, label =
	"|  Açıklama"
	.."\n"..mag.wall("-",81)
	.."\n|  İşaretin koyulduğu noktadan satırı konuşma çizgilerine böler."
	.."\n|  Bir önceki satırla o anki satırı birleştirip konuşma çizgileri ekler."
	.."\n|  Bir sonraki satırla o anki satırı birleştirip konuşma çizgileri ekler."
	.."\n|  Satırdaki tüm \\N karakterlerini siler ve bu karakteri \\N karakteri ile değiştirir."
	},
	{class = "label", x = 3, y = 1, width = 1, height = 1, label =
	"|  Örnek"
	.."\n"..mag.wall("-",76)
	.."\n|  - Bu bir deneme.("..bt_sign.."l)\\N- Bu da bir deneme."
	.."\n|  (Önceki satır)- Bu bir ("..bt_sign.."2l)deneme.(O anki satır)\\N- Bu da bir deneme."
	.."\n|  (Sonraki satır)- Bu bir ("..bt_sign.."2l)deneme.(O anki satır)\\N- Bu da bir deneme."
	.."\n|  Bu bir (\\N)deneme. ("..bt_sign.."b)\\NBu da (\\N)bir deneme."
	},
	{class = "label", x = 0, y = 2, width = 4, height = 1, label =
	"NOT: "..bt_sign.."lp ve "..bt_sign.."ln modlarından aynı anda sadece birini kullanınız. Ayrıca bu modlar sadece geçerli satırdaysanız işlem yapar."
	}}
	return dialog_config
	end

	function basic_turning_helper(subs)
	local ok, cg, val
	repeat
	repeat
	ok, cg = aegisub.dialog.display(main_gui(val),{"Uygula","Kapat"})
	val = cg.u_type
	until cg.u_type ~= "Seç" or ok == "Kapat"
	if ok == "Uygula" then
	if cg.u_type == "Etiket Dönüşümleri" then ok = aegisub.dialog.display(gui1(),{"Geri"}) end
	if cg.u_type == "Harf Dönüşümleri" then ok = aegisub.dialog.display(gui2(),{"Geri"}) end
	if cg.u_type == "Büyük-Küçük Harf Dönüşümleri" then ok = aegisub.dialog.display(gui3(),{"Geri"}) end
	if cg.u_type == "Çeviri Siteleri" then ok = aegisub.dialog.display(gui4(),{"Geri"}) end
	if cg.u_type == "Satır Düzenleme" then ok = aegisub.dialog.display(gui5(),{"Geri"}) end
	end
	until ok == "Kapat"
	end

	if mag_import then
	mag.register(script_name.."/Run",basic_turning)
	mag.register(script_name.."/Helper",basic_turning_helper)
	else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end

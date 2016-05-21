	script_name="Basic Turning/"
	script_description="Bazı şeyleri bazı şeylere çevirir. Seçili satırlarda çevireceği şeyi bularak işlem yapar."
	script_author="Magnum357"
	script_version="1.9"

	unicode = require 'aegisub.unicode'
	
	bt_sign = "*"

	function basic_turning(sub,sel)
	for si,li in ipairs(sel) do
	if sub[li].class == "dialogue" then
	line = sub[li]
	text = sub[li].text
	if not text:find(bt_sign.."2t") and text:find(bt_sign.."t") and not text:find(bt_sign.."T") and not text:find(bt_sign.."s") and not text:find(bt_sign.."S") then
	_, ct_t = text:gsub(bt_sign.."t","")
	if ct_t == 2 then
	t_t1 = text:find(bt_sign.."t")
	t_t2 = text:find(bt_sign.."t",t_t1 + 1)
	text = text:gsub(bt_sign.."t","")
	t_sub = text_lower(text:sub(t_t1,t_t2 - 3))
	text = text:sub(0,t_t1 - 1)..capitalize(t_sub)..text:sub(t_t2 - 2,string.len(text) * 2)
	else
	text = text:gsub(bt_sign.."t","")
	text = capitalize(text)
	end
	end
	if not text:find(bt_sign.."2t") and not text:find(bt_sign.."t") and not text:find(bt_sign.."T") and text:find(bt_sign.."s") and not text:find(bt_sign.."S") then
	_, ct_t = text:gsub(bt_sign.."s","")
	if ct_t == 2 then
	t_t1 = text:find(bt_sign.."s")
	t_t2 = text:find(bt_sign.."s",t_t1 + 1)
	text = text:gsub(bt_sign.."s","")
	text = text:sub(0,t_t1 - 1) .. text_lower(text:sub(t_t1,(t_t1 + (t_t2 - t_t1)) - 3)) .. text:sub(t_t2 - 2,string.len(text) * 2)
	else
	text = text:gsub(bt_sign.."s","")
	text = text_lower(text)
	end
	end
	if not text:find(bt_sign.."2t") and not text:find(bt_sign.."t") and not text:find(bt_sign.."T") and not text:find(bt_sign.."s") and text:find(bt_sign.."S") then
	_, ct_t = text:gsub(bt_sign.."S","")
	if ct_t == 2 then
	t_t1 = text:find(bt_sign.."S")
	t_t2 = text:find(bt_sign.."S",t_t1 + 1)
	text = text:gsub(bt_sign.."S","")
	text = text:sub(0,t_t1 - 1) .. text_upper(text:sub(t_t1,(t_t1 + (t_t2 - t_t1)) - 3)) .. text:sub(t_t2 - 2,string.len(text) * 2)
	else
	text = text:gsub(bt_sign.."S","")
	text = text_upper(text)
	end
	end
	if not text:find(bt_sign.."2t") and not text:find(bt_sign.."t") and text:find(bt_sign.."T") and not text:find(bt_sign.."s") and not text:find(bt_sign.."S") then
	text = text:gsub(bt_sign.."T","")
	text = capitalize_sentences(text)
	text = respect(text)
	end
	if text:find(bt_sign.."2t") and not text:find(bt_sign.."t") and not text:find(bt_sign.."T") and not text:find(bt_sign.."s") and not text:find(bt_sign.."S") then
	_, ct_t = text:gsub(bt_sign.."2t","")
	if ct_t == 2 then
	t_t1 = text:find(bt_sign.."2t")
	t_t2 = text:find(bt_sign.."2t",t_t1 + 1)
	text = text:gsub(bt_sign.."2t","")
	t_sub = text:sub(t_t1,t_t2 - 3)
	text = text:sub(0,t_t1 - 1)..turkish_capitalize(capitalize(t_sub))..text:sub(t_t2 - 2,string.len(text) * 2)
	else
	text = text:gsub(bt_sign.."2t","")
	text = turkish_capitalize(capitalize(text))
	end
	end		
	local alpha_tag = ""
	if text:match(bt_sign.."x%d+") then
	alpha_tag = text:match(bt_sign.."x(%d+)")
	alpha_tag = string.format("{\\alpha&H%x&}",alpha_tag)
	end
	local a1_tag = ""
	if text:match(bt_sign.."xa%d+") then
	a1_tag = text:match(bt_sign.."xa(%d+)")
	if tonumber(a1_tag) > 255 then a1_tag = 255 end
	a1_tag = string.format("{\\1a&H%X&}",a1_tag)
	end
	local a2_tag = ""
	if text:match(bt_sign.."xb%d+") then
	a2_tag = text:match(bt_sign.."xb(%d+)")
	if tonumber(a2_tag) > 255 then a2_tag = 255 end
	a2_tag = string.format("{\\2a&H%X&}",a2_tag)
	end
	local a3_tag = ""
	if text:match(bt_sign.."xc%d+") then
	a3_tag = text:match(bt_sign.."xc(%d+)")
	if tonumber(a3_tag) > 255 then a3_tag = 255 end
	a3_tag = string.format("{\\3a&H%X&}",a3_tag)
	end
	local a4_tag = ""
	if text:match(bt_sign.."xd%d+") then
	a4_tag = text:match(bt_sign.."xd(%d+)")
	if tonumber(a4_tag) > 255 then a4_tag = 255 end
	a4_tag = string.format("{\\4a&H%X&}",a4_tag)
	end
	text = text
	:gsub(bt_sign.."0","{\\i0}")
	:gsub(bt_sign.."1","{\\i1}")
	:gsub(bt_sign.."8","{\\an8}")
	:gsub(bt_sign.."n","\\N")
	:gsub(bt_sign.."h","\\h")
	:gsub(bt_sign.."a","â")
	:gsub(bt_sign.."A","Â")
	:gsub(bt_sign.."i","î")
	:gsub(bt_sign.."İ","Î")
	:gsub(bt_sign.."x%d+",alpha_tag)
	:gsub(bt_sign.."xa%d+",a1_tag)
	:gsub(bt_sign.."xb%d+",a2_tag)
	:gsub(bt_sign.."xc%d+",a3_tag)
	:gsub(bt_sign.."xd%d+",a4_tag)
	if text:find(bt_sign.."l") then
	text = text:gsub(bt_sign.."l".." +",bt_sign.."l")
	text = text:gsub(" +"..bt_sign.."l",bt_sign.."l")
	text = text:gsub(bt_sign.."l","\\N- ")
	text = "- "..text
	end
	if text:find(bt_sign.."2l") then
	text = text:gsub(bt_sign.."2l","")
	line.end_time = sub[li + 1].end_time
	text = "- "..text.."\\N- "..sub[li + 1].text
	sub.delete(li)
	end
	if text:find(bt_sign.."b") then
	text = text:gsub("\\N"," ")
	text = text:gsub("%s+"," ")
	text = text:gsub(bt_sign.."b","\\N")
	end	
	if text:find("*%d+,%d+*") then
	text = "{\\fad("..text:match("*(%d+,%d+)*")..")}"..text
	text = text:gsub("*%d+,%d+*","")
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

	function lower(text) return unicode.to_lower_case(text)	end

	function upper(text) return unicode.to_upper_case(text)	end

	function tr_counter(str)
	local c_ct, c_ct_c = 0, 0
	_, c_ct = str:gsub("ş","")
	c_ct_c = c_ct
	_, c_ct = str:gsub("ç","")
	c_ct_c = c_ct_c + c_ct
	_, c_ct = str:gsub("ğ","")
	c_ct_c = c_ct_c + c_ct
	_, c_ct = str:gsub("ı","")
	c_ct_c = c_ct_c + c_ct
	_, c_ct = str:gsub("ö","")
	c_ct_c = c_ct_c + c_ct
	_, c_ct = str:gsub("ü","")
	c_ct_c = c_ct_c + c_ct
	return tostring(c_ct_c)
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
	search = lower(search)
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
	line = "s#p1. " .. line
	line = line:gsub("\\N","#\\\\\\#"):gsub("\\n","#\\\\\\\\\\\\#"):gsub("\\h","#\\\\\\\\\\\\\\\\\\#")
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
	if first_char == true then char = upper(char) end
	first_char = false
	end
	end
	l = l .. char
	end
	end
	return l:sub(1,-1):gsub("s#p1%. ",""):gsub("#\\\\\\#","\\N"):gsub("#\\\\\\\\\\\\#","\\n"):gsub("#\\\\\\\\\\\\\\\\\\#","\\h")
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
	stw = remove_dot(strip_text(word):gsub("%s+",""))
	for k = 1, table.getn(conjunctions) do if stw == conjunctions[k] then ccs = true end end
	for char in unicode.chars(word) do
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
	if in_tag == false then
	if char:match("[a-zA-ZçÇşŞıIiİüÜöÖ0-9]") then
	if ccs == true and n > 0 then char = lower(char) end
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
	char = upper(char)
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
	char = lower(char)
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
	char = upper(char)
	end
	end
	end
	l = l .. char
	end
	return l:sub(2,-1):gsub("\\N#SP2","\\n"):gsub("\\H#SP3","\\h")
	end

	function remove_dot(line)
	line = line:gsub("['., -/*:;+!)?\"=(]+", "")
	return line
	end

	function main_gui(last_value)
	if last_value == nil then last_value = "Seç" end
	local dialog_config=
	{
	{class="label",x=0,y=0,width=1,height=1,label="Bir kategori seçin:"},
	{class="dropdown",name="u_type",x=1,y=0,width=1,height=1,items={"Seç","Etiket Dönüşümleri","Harf Dönüşümleri","Büyük-Küçük Harf Dönüşümleri","Çeviri Siteleri","Satır Düzenleme"},value=last_value}
	}
	return dialog_config
	end

	function gui1()
	local dialog_config=
	{
	{class="label",x=0,y=0,width=3,height=1,label="------[ Etiket Dönüşümleri ]------"},
	{class="label",x=0,y=1,width=1,height=1,label=
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
	{class="label",x=1,y=1,width=1,height=1,label=
	"|  Karakter"
	.."\n-----------"
	.."\n|  "..bt_sign.."0"
	.."\n|  "..bt_sign.."1"
	.."\n|  "..bt_sign.."8"
	.."\n|  "..bt_sign.."n"
	.."\n|  "..bt_sign.."h"
	.."\n|  "..bt_sign.."300,200"
	.."\n|  "..bt_sign.."x80"
	.."\n|  "..bt_sign.."xa80"
	.."\n|  "..bt_sign.."xb80"
	.."\n|  "..bt_sign.."xc80"
	.."\n|  "..bt_sign.."xd80"
	},
	{class="label",x=2,y=1,width=1,height=1,label=
	"|  Dönüşüm"
	.."\n-------------------"
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
	}
	}
	return dialog_config
	end

	function gui2()
	local dialog_config=
	{
	{class="label",x=0,y=0,width=3,height=1,label="-------[ Harf Dönüşümleri ]-------"},
	{class="label",x=0,y=1,width=1,height=1,label=
	" #"
	.."\n---"
	.."\n 1"
	.."\n 2"
	.."\n 3"
	.."\n 4"
	},
	{class="label",x=1,y=1,width=1,height=1,label=
	"|  Karakter"
	.."\n-----------"
	.."\n|  "..bt_sign.."a"
	.."\n|  "..bt_sign.."A"
	.."\n|  "..bt_sign.."i"
	.."\n|  "..bt_sign.."İ"
	},
	{class="label",x=2,y=1,width=1,height=1,label=
	"|  Dönüşüm"
	.."\n--------------------"
	.."\n|  â"
	.."\n|  Â"
	.."\n|  î"
	.."\n|  Î"
	}
	}
	return dialog_config
	end

	function gui3()
	local dialog_config=
	{
	{class="label",x=0,y=0,width=3,height=1,label="--------------------------------[ Büyük-Küçük Harf Dönüşümleri ]--------------------------------"},
	{class="label",x=0,y=1,width=1,height=1,label=
	" #"
	.."\n---"
	.."\n 1"
	.."\n 2"
	.."\n 3"
	.."\n 4"
	.."\n 5"
	.."\n---"
	},
	{class="label",x=1,y=1,width=1,height=1,label=
	"|  Karakter"
	.."\n-----------"
	.."\n|  "..bt_sign.."t"
	.."\n|  "..bt_sign.."T"
	.."\n|  "..bt_sign.."2t"
	.."\n|  "..bt_sign.."s"
	.."\n|  "..bt_sign.."S"
	.."\n-----------"
	},
	{class="label",x=2,y=1,width=1,height=1,label=
	"|  Örnek"
	.."\n-------------------------------------------------------------------------------------"
	.."\n|  Her Kelimenin Baş Harfi Büyük Harfe Çevrildi."
	.."\n|  Her cümlenin baş harfi büyük harfe çevrildi."
	.."\n|  Her Kelimenin Baş Harfi Büyük Harfe Çevrildi ama Türkçe Bağlaçlar çevrilmedi."
	.."\n|  her harf küçük harfe çevrildi."
	.."\n|  HER HARF BÜYÜK HARFE ÇEVRİLDİ."
	.."\n-------------------------------------------------------------------------------------"
	},
	{class="label",x=0,y=2,width=3,height=1,label=
	"NOT: Cümlenin belli bir kısmını almak için o kısmın başına ve sonuna "..bt_sign.."T modu hariç\n bu işaretlerden koyun."
	.. "\nÖrnek bir "..bt_sign.."(t-s-S-2t)cümle."..bt_sign.."(t-s-S-2t)"
	}
	}
	return dialog_config
	end

	function gui4()
	local dialog_config=
	{
	{class="label",x=0,y=0,width=4,height=1,label="-------------------------------------------------------[ Çeviri Siteleri ]------------------------------------------------------"},	
	{class="label",x=0,y=1,width=1,height=1,label=
	" #"
	.."\n---"
	.."\n 1"
	.."\n 2"
	},
	{class="label",x=1,y=1,width=1,height=1,label=
	"|  Karakter"
	.."\n-----------"
	.."\n|  +"
	.."\n|  %"
	},
	{class="label",x=2,y=1,width=1,height=1,label=
	"|  Açıklama"
	.."\n--------------------------------------------------------------------------------------"
	.."\n|  Tureng sitesinde arama yapmak için kelimenin başına artı işareti(+) koyunuz."
	.."\n|  Google Translate sitesinde arama yapmak için yüzde işaretiyle(%) bir alan seçin."
	},
	{class="label",x=3,y=1,width=1,height=1,label=
	"|  Örnek"
	.."\n-----------------------"
	.."\n|  This is +a +sample."
	.."\n|  This is %a sample%."
	},
	}
	return dialog_config
	end

	function gui5()
	local dialog_config=
	{
	{class="label",x=0,y=0,width=4,height=1,label="-----------------------------------------------------------------------[ Satır Düzenleme ]------------------------------------------------------------------------"},	
	{class="label",x=0,y=1,width=1,height=1,label=
	" #"
	.."\n---"
	.."\n 1"
	.."\n 2"
	.."\n 3"
	},
	{class="label",x=1,y=1,width=1,height=1,label=
	"|  Karakter"
	.."\n-----------"
	.."\n|  "..bt_sign.."l"
	.."\n|  "..bt_sign.."2l"
	.."\n|  "..bt_sign.."b"
	},
	{class="label",x=2,y=1,width=1,height=1,label=
	"|  Açıklama"
	.."\n---------------------------------------------------------------------------------"
	.."\n|  İşaretin koyulduğu noktadan satırı konuşma çizgilerine böler."
	.."\n|  Bir önceki satırla o anki satırı birleştirip konuşma çizgileri ekler."
	.."\n|  Satırdaki tüm \\N karakterlerini siler ve bu karakteri \\N karakteri ile değiştirir."
	},
	{class="label",x=3,y=1,width=1,height=1,label=
	"|  Örnek"
	.."\n-----------------------------------------------------------------"
	.."\n|  - Bu bir deneme.("..bt_sign.."l)\\N- Bu da bir deneme."
	.."\n|  (1. satır)- Bu bir ("..bt_sign.."2l)deneme.(2. satır)\\N- Bu da bir deneme."
	.."\n|  Bu bir (\\N)deneme. ("..bt_sign.."b)\\NBu da (\\N)bir deneme."
	},
	}
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
	if cg.u_type == "Etiket Dönüşümleri" then ok = aegisub.dialog.display(gui1(),{"Geri","Kapat"}) end
	if cg.u_type == "Harf Dönüşümleri" then ok = aegisub.dialog.display(gui2(),{"Geri","Kapat"}) end
	if cg.u_type == "Büyük-Küçük Harf Dönüşümleri" then ok = aegisub.dialog.display(gui3(),{"Geri","Kapat"}) end
	if cg.u_type == "Çeviri Siteleri" then ok = aegisub.dialog.display(gui4(),{"Geri","Kapat"}) end
	if cg.u_type == "Satır Düzenleme" then ok = aegisub.dialog.display(gui5(),{"Geri","Kapat"}) end
	end
	until ok == "Kapat"
	end

	aegisub.register_macro(script_name.."Run",script_description,basic_turning)
	aegisub.register_macro(script_name.."Helper",script_description,basic_turning_helper)

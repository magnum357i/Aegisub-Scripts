	module_name = "Mag"
	module_desription = "Birden fazla kullandığım foksiyonlar için fonksiyon deposu."
	module_version = "1.1.0.7"
	module_author = "Magnum357"

	unicode = require 'aegisub.unicode'

	local mag = {}

	--mag.delay()
	function mag.delay()
	local st = ""
	for i = 0, 50000 do
	st = st .. i
	end
	return st
	end

	--mag.prog("İşleminiz yapılıyor...")
	function mag.prog(str)
	aegisub.progress.task(mag.format("%s",str))
	aegisub.progress.set(100)
	mag.delay()
	end

	--ascii_text = mag.ascii("Şekil Çıta")
	-->>Şekil Çıta
	function mag.ascii(str)
	str = mag.gsub(str,"ç",mag.char(231))
	str = mag.gsub(str,"Ç",mag.char(199))
	str = mag.gsub(str,"ü",mag.char(252))
	str = mag.gsub(str,"Ü",mag.char(220))
	str = mag.gsub(str,"ö",mag.char(246))
	str = mag.gsub(str,"Ö",mag.char(214))
	str = mag.gsub(str,"ğ",mag.char(240))
	str = mag.gsub(str,"Ğ",mag.char(208))
	str = mag.gsub(str,"ş",mag.char(254))
	str = mag.gsub(str,"Ş",mag.char(222))
	str = mag.gsub(str,"ı",mag.char(253))
	str = mag.gsub(str,"İ",mag.char(221))
	return str
	end

	--strip_text = mag.strip("{\bord2}Bu bir deneme.")
	-->>Bu bir deneme.
	function mag.strip(str) return mag.gsub(str,"{[^}]+}", "") end

	--full_strip_text = mag.full_strip("{\bord2}Bu\hbir\hdeneme.")
	-->>Bu bir deneme.
	function mag.full_strip(str)
	str = mag.gsub(str,"{[^}]+}", "")
	str = mag.gsub(str,"\\N", " ")
	str = mag.gsub(str,"\\n", " ")
	str = mag.gsub(str,"\\h", " ")
	str = mag.gsub(str,"%s+", " ")
	return str
	end

	--remove_dot_text = mag.removedot("Bu bir deneme.")
	-->>Bu bir deneme
	function mag.removedot(str) return mag.gsub(str,"['., -/*:;+!)?\"=(]+", "") end

	--mag.wall(" ",5)
	-->>5x" "
	function mag.wall(char,loop) return mag.rep(char,loop) end

	--stil = mag.unstyles("(5) Default")
	-->>Default
	--stil = mag.unstyles("(5+0) Default")
	-->>Default
	function mag.unstyles(style) return mag.gsub(style,"%(%d+%+?%d-%)%s","") end

	--total_line = mag.total_full(subs)
	function mag.total_full(subs)
	local n = 0
	for i = 1, #subs do if subs[i].class == "dialogue" then n = n + 1 end end
	return n
	end

	--mag.total(subs,stil,[default,comment,effect],[effect -> Mac])
	function mag.total(subs,style_name,mode,value)
	local n, m = 0, 0
	for i = 1, #subs do
	if subs[i].class == "dialogue" then
	if mode == "default" then
	if subs[i].style == style_name then n = n + 1 end
	end
	if mode == "comment" then
	if subs[i].style == style_name and subs[i].comment == false then n = n + 1 end
	if subs[i].style == style_name and subs[i].comment == true then m = m + 1 end
	end
	if mode == "effect" then
	if subs[i].style == style_name and subs[i].effect ~= value then n = n + 1 end
	if subs[i].style == style_name and subs[i].effect == value then m = m + 1 end
	end
	end
	end
	return n, m
	end

	--mag.styles(subs,[default,comment,effect],[effect -> Mac])
	function mag.styles(subs,mode,value)
	local n, styles = 0, {}
	for i = 1, #subs do
	if subs[i].class == "style" then
	local total, total2 = mag.total(subs,subs[i].name,mode,value)
	if total > 0 or total2 > 0 then
	if mode == "default" then n = n + 1 styles[n] = mag.format("(%d) %s",total,subs[i].name) end
	if mode == "comment" or mode == "effect" then n = n + 1 styles[n] = mag.format("(%d+%d) %s",total,total2,subs[i].name) end
	end
	end
	end
	return styles
	end

	--mag.styles_insert(subs,dlg_array,3,[default,comment,effect],[effect -> Mac])
	function mag.styles_insert(subs,var,id,mode,value) for _, style in ipairs(mag.styles(subs,mode,value)) do table.insert(var[id].items,style) end end

	--mag.dlg(gui_array,{"Tamam","Kapat"})
	function mag.dlg(var,buttons)
	local ok, config
	for i = 1, table.getn(buttons) do buttons[i] = mag.ascii(buttons[i]) end
	ok, config = aegisub.dialog.display(var,buttons)
	return ok, config
	end

	--mag.register(false,macro_function)
	--mag.register("My_Script_Name",macro_function)
	function mag.register(name,macro)
	if name == false then name = script_name end
	mag.rmacro(name,script_desription,macro)
	end

	--mag.log("Deneme.")
	-->>Deneme.
	--mag.log([0-4],"Deneme.")
	-->> 1 == HATA: Deneme.
	-->> 2 == UYARI: Deneme.
	-->> 3 == NOT: Deneme.
	-->> 0 == Deneme.
	--mag.log("Deneme. %s",{"Deneme."})
	-->> Deneme. Deneme.
	--mag.log([0-4],"Deneme. %s",{"Deneme."})
	-->> 1 == HATA: Deneme. Deneme.
	-->> 2 == UYARI: Deneme. Deneme.
	-->> 3 == NOT: Deneme. Deneme.
	-->> 0 == Deneme. Deneme.
	function mag.log(mode,str,vars)
	if str == nil and vars == nil then str = mag.s(mode) mode = 0 end
	if mag.n(mode) == nil then
	vars = str
	str  = mode
	mode = 0
	else
	mode = mag.n(mode)
	end
	if mode == nil or mode < 1 or mode > 3 then mode = 0 end
	local alert_message = ""
	if vars ~= nil then for i = 1, #vars do str = mag.gsub(str,"%%s",mag.s(vars[i]),1) end end
	if mode == 1 then alert_message = "HATA: " end
	if mode == 2 then alert_message = "UYARI: " end
	if mode == 3 then alert_message = "NOT: " end
	if mode == 0 then aegisub.log(alert_message..str.."\n") else aegisub.log(mode,alert_message..str.."\n") end
	end

	--esc_text = mag.esc("Nasılsın?")
	-->>Nasılsın%?
	function mag.esc(str)
	str = mag.gsub(str,"(%()","%%%1")
	str = mag.gsub(str,"(%))","%%%1")
	str = mag.gsub(str,"(%.)","%%%1")
	str = mag.gsub(str,"(%%)","%%%1")
	str = mag.gsub(str,"(%+)","%%%1")
	str = mag.gsub(str,"(%-)","%%%1")
	str = mag.gsub(str,"(%*)","%%%1")
	str = mag.gsub(str,"(%?)","%%%1")
	str = mag.gsub(str,"(%[)","%%%1")
	str = mag.gsub(str,"(%])","%%%1")
	str = mag.gsub(str,"(%^)","%%%1")
	str = mag.gsub(str,"(%$)","%%%1")
	str = mag.gsub(str,"(%\\)","\\\\%1")
	return str
	end

	--zero_text = mag.zero(300,30)
	-->>030
	function mag.zero(total_number,number)
	local zero_count = mag.len(mag.s(total_number)) - mag.len(mag.s(number))
	if zero_count > 0 then number = mag.format("%s%s",mag.rep("0",zero_count),number) end
	return number
	end

	--mag.percent("200",100,true)
	-->>50
	--mag.percent("200",100,false)
	-->>50.00	
	function mag.percent(total_number,number,digit_mode)
	local calc
	if number <= total_number then
	calc = 100 - ((total_number - number) / total_number * 100)
	calc = mag.gsub(mag.s(calc),"(%.5[^%d]-)","%10")
	if mag.match(calc,"%.%d+") then calc = mag.gsub(mag.s(calc),"(%.%d%d)%d+","%1")
	else if mag.match(calc,"100") then calc = calc..".0" else calc = calc..".00" end end
	else calc = 0 end
	if digit_mode == true then calc = mag.gsub(calc,"%.%d+","") end
	return mag.s(calc)
	end

	--first_text_index = mag.first_index(subs)
	-->>13
	function mag.first_index(subs)
	local first_index
	for i = 1, #subs do if subs[i].class == "dialogue" then if first_index == nil then first_index = i end end end
	return first_index
	end

	--last_text_index = mag.last_index(subs)
	-->>287
	function mag.last_index(subs) return #subs end

	--nil_value == mag.unnil(nil_value)
	-->>empty string
	function mag.unnil(var)
	if var == nil then var = "" end
	return var
	end

	--split_count, split_text = mag.splitter(true,"Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.","\\N")
	-->>3
	-->>Bu bir deneme. \\N
	-->>Bu da bir deneme. \\N
	-->>Bu hala bir deneme.
	--split_count, split_text = mag.splitter(false,"Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.","\\N")
	-->>2
	-->>Bu bir deneme. \\N
	-->>Bu da bir deneme. \\N
	--split_count, split_text = mag.splitter([true,false],"Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.","\\h")
	-->>1
	-->>Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.
	function mag.splitter(last,str,split)
	local n = 0
	local parts = {}
	if mag.match(str,split) then if last == true then str = str..mag.match(str,split) end
	for part in str:gmatch(".-"..split) do
	n = n + 1
	parts[n] = part
	end
	if last == true then
	parts[n] = mag.gsub(parts[n],split,"")
	if parts[n] == "" then parts[n] = nil n = n - 1 end
	end
	else
	parts[1] = str
	n = 1
	end
	return n, parts
	end

	--text = mag.tag_replacer("Bu bir deneme. \\nBu da bir deneme. \\nBu hala deneme.","\\n","\\N")
	-->>Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.
	--text = mag.tag_replacer("Bu bir deneme. \\hBu da bir deneme. \\hBu hala deneme.","\\n","\\N")
	-->>Bu bir deneme. \\nBu da bir deneme. \\nBu hala deneme.
	function mag.tag_replacer(str,sign,tag)
	local split_text
	local split_count
	local result = ""
	if mag.match(str,sign) then
	split_count, split_text = mag.splitter(true,str,sign)
	for i = 1, split_count do result = result..mag.tag_changer(split_text[i],sign,tag) end
	return result else return str
	end
	end

	--text = mag.tag_changer("Bu bir deneme. *1Bu da bir deneme. {\b*1}Bu hala deneme.","*1","{\i1}")
	-->>Bu bir deneme. {\i1}Bu da bir deneme. {\b\1}Bu hala deneme.
	--text = mag.tag_changer("Bu bir deneme. *1Bu da bir deneme. {\b*1}Bu hala deneme.","*0","{\i0}")
	-->>Bu bir deneme. *1Bu da bir deneme. {\b*1}Bu hala deneme.
	function mag.tag_changer(str,sign,tag)
	local function no_bra(tag) tag = mag.gsub(tag,"{","") tag = tag.gsub(tag,"}","") return tag end
	local sp1, sp2
	local result = ""
	local t
	t = tag
	rev = mag.reverse(str)
	s1 = mag.find(rev,"{")
	s2 = mag.find(rev,"}")
	if s1 == nil then s1 = -2 end
	if s2 == nil then s2 = s1 + 1 end
	if s1 < s2 and s1 > -1 then t = no_bra(t) end
	if t ~= nil then result = mag.gsub(str,sign,t) else result = str end
	return result
	end

	--mag.last_find("Deneme.","e")
	-->>6
	--mag.last_find("Deneme","a")
	-->>false
	function mag.last_find(str,find)
	local find_idx = {}
	local n = 0
	local _, find_count = mag.gsub(str,find,"")
	for i = 1, find_count do
	n = n + 1
	if i == 1 then find_idx[i] = mag.find(str,find)
	else find_idx[i] = mag.find(str,find,find_idx[i - 1] + 1) end
	end
	if find_count == 0 then return false else return find_idx[n] end
	end

	--current_act = mag.current_act(subs,sel,act)
	-->>85
	function mag.current_act(subs,sel,act) return act - mag.first_index(subs) + 1 end

	--style_first_index = mag.style_first_index(subs,"Default")
	-->>11
	function mag.style_first_index(subs,style_name)
	local index
	for i = 1, #subs do if subs[i].style == style_name then index =  i break end end
	return index
	end

	--style_last_index = mag.style_last_index(subs,"Default")
	-->>320
	function mag.style_last_index(subs,style_name)
	local index
	for i = #subs, 1, -1 do if subs[i].style == style_name then index =  i break end end
	return index
	end

	--vars = {10,50,70,80,50}
	--mag.double_value(vars)
	-->>10,70,80,50
	function mag.double_value(array)
	local index = {}
	local n = 0
	local double
	local max_n = table.getn(array)
	if max_n > 1 then
	for i = 1, max_n do
	double = 0
	for k = i, max_n do if array[i] == array[k] then double = double + 1 end end
	if double > 1 then table.insert(index,i) end	
	end	
	end
	for d = 1, table.getn(index) do table.remove(array,index[d]) end
	end

	mag.s       = tostring
	mag.n       = tonumber
	mag.floor   = math.floor
	mag.ceil    = math.ceil
	mag.rand    = math.random
	mag.char    = string.char
	mag.find    = string.find
	mag.format  = string.format
	mag.gmatch  = string.gmatch
	mag.gsub    = string.gsub
	mag.length  = string.len
	mag.match   = string.match
	mag.rep     = string.rep
	mag.reverse = string.reverse
	mag.sub     = string.sub
	mag.upper   = string.upper
	mag.lower   = string.lower
	mag.up      = unicode.to_upper_case
	mag.low     = unicode.to_lower_case
	mag.len     = unicode.len
	mag.rmacro  = aegisub.register_macro

	return mag

	script_name="Delete Lines"
	script_description="Seçilen stillerin veya aktörlerin olduğu satırları siler."
	script_author="Magnum357"
	script_version="2.0"

	function delete_lines_for_style(subs)
	local n = 0
	for d = 1, c + 1 do
	for i = #subs, 1, -1 do
	local line = subs[i]
	local sub = subs[i]
	if line.class == "dialogue" and line.style == config["u_style_"..s(d)]:gsub("%(%d+%) ","") then 
	subs.delete(i)
	n = n + 1
	end
	if config["u_sd_"..s(d)] == true and n > 0 then
	if sub.class == "style" then
	if sub.name == config["u_style_"..s(d)]:gsub("%(%d+%) ","") then
	subs.delete(i)
	end
	end
	end
	end
	end
	if n == 0 then
	aegisub.log("Hiçbir satır silinmedi!")
	end
	if n > 0 then
	prog("Satırlar siliniyor...")
	end
	end

	function delete_lines_for_actor(subs)
	local n = 0
	for d = 1, c2 + 1 do
	for i = #subs, 1, -1 do
	local line = subs[i]
	local sub = subs[i]
	if line.class == "dialogue" and line.actor == config["u_actor_"..s(d)]:gsub("%(%d+%) ","") then 
	subs.delete(i)
	n = n + 1
	end
	end
	end
	if n == 0 then
	aegisub.log("Hiçbir satır silinmedi!")
	end
	if n > 0 then
	prog("Satırlar siliniyor...")
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
	aegisub.progress.task(string.format("%s", str))
	aegisub.progress.set(100)
	delay()
	end

	function collect_styles(subs)
	local n, styles = 0, {}
	for i = 1, #subs do
	local sub = subs[i]
	if sub.class == "style" then
	local tl = total_lines_for_style(subs, sub.name)
	if tl > 0 then
	n = n + 1
	styles[n] = string.format("(%s) %s", tl, sub.name)
	end
	end
	end
	return styles
	end

	function collect_actors(subs)
	local n, m, actor, actors = 0, 0, {}, {}
	for i = 1, #subs do
	sub = subs[i]
	if sub.class == "dialogue" then
	n = n + 1
	actor[n] = sub.actor
	end
	end
	table.sort(actor)
	for x = 1, table.getn(actor) do
	if actor[x] ~= actor[x + 1] and actor[x] ~= "" then
	m = m + 1
	actors[m] = string.format("(%s) %s",total_lines_for_actor(subs, actor[x]), actor[x])
	end
	end
	return actors
	end

	function total_lines_for_style(subs, style_name)
	local n = 0
	for i = 1, #subs do
	if subs[i].class == "dialogue" then
	if subs[i].style == style_name then
	n = n + 1
	end
	end
	end
	return n
	end

	function total_lines_for_actor(subs, actor_name)
	local n = 0
	for i = 1, #subs do
	if subs[i].class == "dialogue" then
	if subs[i].actor == actor_name then
	n = n + 1
	end
	end
	end
	return n
	end

	function s(str) return tostring(str) end

	function cc(subs)
	local dialog_config=
	{
	{
	class="label",
	x=0,y=0,width=1,height=1,
	label="Listele:"
	},{
	class="dropdown",name="u_type",
	x=1,y=0,width=10,height=1,
	items={"Style","Actor"},value="Style"
	}
	}
	return dialog_config
	end

	function cc_style_multi(mode, x ,y, name, value, i)
	if mode == "checkbox" then if value == "" then value = false end end
	if mode == "dropdown" then if value == "" then value = "Seç" end end
	if mode == "checkbox2" then if value == "" then value = true end end
	if mode == "checkbox" then return {class="checkbox",name=name, label="#"..i,x=x,y=y,width=1,height=1,value=value} end
	if mode == "label" then return {class="label",x=x,y=y,width=1,height=1,label="Stil:"} end
	if mode == "dropdown" then return {class="dropdown",name=name,x=x,y=y,width=15,height=1,items={"Seç"},value=value} end
	if mode == "checkbox2" then return {class="checkbox",name=name,label="Stili de sil.",x=x,y=y,width=1,height=1,value=value} end
	end

	function cc_actor_multi(mode, x ,y, name, value, i)
	if mode == "checkbox" then if value == "" then value = false end end
	if mode == "dropdown" then if value == "" then value = "Seç" end end
	if mode == "dropdown" then return {class="dropdown",name=name,x=x,y=y,width=20,height=1,items={"Seç"},value=value} end
	if mode == "label" then return {class="label",x=x,y=y,width=1,height=1,label="Aktör:"} end
	if mode == "checkbox" then return {class="checkbox",name=name, label="#"..i,x=x,y=y,width=1,height=1,value=value} end
	end

	function cc_style_cache(subs, max)
	for k = 1, max do
	cg[k * 4 - 3] = cc_style_multi("checkbox","0",((k - 1) * 2 - 1) + 1,"u_numb_"..s(k),config["u_numb_"..s(k)],s(k))
	cg[k * 4 - 1] = cc_style_multi("dropdown","2",((k - 1) * 2 - 1) + 1,"u_style_"..s(k),config["u_style_"..s(k)],"")
	cg[k * 4] = cc_style_multi("checkbox2","2",(k - 1) * 2 + 1,"u_sd_"..s(k),config["u_sd_"..s(k)],"")
	for _, style in ipairs(collect_styles(subs)) do
	table.insert(cg[k * 4 - 1].items,style)
	end
	end
	end

	function cc_actor_cache(subs, max)
	for l = 1, max do
	cg2[3 * l - 2] = cc_actor_multi("checkbox","0",l - 1,"u_actor_numb_"..s(l),config["u_actor_numb_"..s(l)],s(l))
	cg2[3 * l] = cc_actor_multi("dropdown","2",l - 1,"u_actor_"..s(l),config["u_actor_"..s(l)],"")
	for _, actor in ipairs(collect_actors(subs)) do
	table.insert(cg2[3 * l].items,actor)
	end
	end
	end

	function get_value_for_style(var, loop)
	local v = {}
	for i = 1, loop do
	v[i] = config[var.."_"..i]
	end
	return v
	end

	function get_value_for_actor(var, loop)
	local v = {}
	for i = 1, loop do
	v[i] = config[var.."_"..i]
	end
	return v
	end

	function delete_value_for_style(start)
	table.remove(style_val, start)
	table.remove(style_val3, start)
	end

	function delete_value_for_actor(start)
	table.remove(actor_val, start)
	end

	function cc_style_gui(subs)
	c = 0
	cg = {}
	cg[1] = cc_style_multi("checkbox","0","0","u_numb_1","","1")
	cg[2] = cc_style_multi("label","1","0","","","")
	cg[3] = cc_style_multi("dropdown","2","0","u_style_1","","")
	cg[4] = cc_style_multi("checkbox2","2","1","u_sd_1","","")
	for _, style in ipairs(collect_styles(subs)) do
	table.insert(cg[3].items,style)
	end
	repeat
	if ok == "Sil" then
	if c == 0 then aegisub.log("İşlem yapabilmek için en az bir stil lazım.\n") end
	if c > 0 then
	cc_style_cache(subs, c + 1)
	style_val = {}
	style_val2 = {}
	style_val3 = {}
	style_val_c = 0
	for style_number, style_value in ipairs(get_value_for_style("u_style", c + 1)) do
	style_val[style_number] = style_value
	end
	for style_number2, style_value2 in ipairs(get_value_for_style("u_numb", c + 1)) do
	if style_value2 == true then
	style_val_c = style_val_c + 1
	style_val2[style_val_c] = style_number2
	end
	end
	for style_number3, style_value3 in ipairs(get_value_for_style("u_sd", c + 1)) do
	style_val3[style_number3] = style_value3
	end
	if style_val_c == 0 then
	aegisub.log("Arayüzden satır silmek için en az bir tane satır seçmelisiniz.\n")
	end
	style_dc = 0
	for t = 1, table.getn(style_val2) do
	style_val2[t] = style_val2[t] - style_dc
	delete_value_for_style(style_val2[t])
	style_dc = style_dc + 1
	for a = 1, c do
	cg[1 + (a - 1) * 4] = cc_style_multi("checkbox","0",((a - 1) * 2 - 1) + 1,"u_numb_"..s(a),"",s(a))
	cg[3 + (a - 1) * 4] = cc_style_multi("dropdown","2",((a - 1) * 2 - 1) + 1,"u_style_"..a,style_val[a],"")
	cg[4 + (a - 1) * 4] = cc_style_multi("checkbox2","2",((a - 1) * 2 - 1) + 2,"u_sd_"..s(a),style_val3[a],"")
	for _, style in ipairs(collect_styles(subs)) do
	table.insert(cg[3 + (a - 1)  * 4].items,style)
	end
	end
	cg[1 + c * 4] = nil
	cg[2 + c * 4] = nil
	cg[3 + c * 4] = nil
	cg[4 + c * 4] = nil
	c = c - 1
	end
	end
	elseif ok == "Yeni" then
	c = c + 1
	cg[1 + c * 4] = cc_style_multi("checkbox","0",(c * 2 - 1) + 1,"u_numb_"..s(c + 1),"",s(c + 1))
	cg[2 + c * 4] = cc_style_multi("label","1",(c * 2 - 1) + 1,"","","")
	cg[3 + c * 4] = cc_style_multi("dropdown","2",(c * 2 - 1) + 1,"u_style_"..s(c + 1),"","")
	cg[4 + c * 4] = cc_style_multi("checkbox2","2",c * 2 + 1,"u_sd_"..s(c + 1),"","")
	for _, style in ipairs(collect_styles(subs)) do
	table.insert(cg[3 + c * 4].items,style)
	end
	cc_style_cache(subs, c)
	end
	ok, config = aegisub.dialog.display(cg,{"Uygula","Yeni","Sil","Kapat"})
	until ok == "Uygula" or ok == "Kapat"
	if ok == "Uygula" then delete_lines_for_style(subs) end
	end

	function cc_actor_gui(subs)
	c2 = 0
	cg2 = {}
	cg2[1] = cc_actor_multi("checkbox","0","0","u_actor_numb_1","","1")
	cg2[2] = cc_actor_multi("label","1","0","","","")
	cg2[3] = cc_actor_multi("dropdown","2","0","u_actor_1","","")
	for _, actor in ipairs(collect_actors(subs)) do
	table.insert(cg2[3].items,actor)
	end
	repeat
	if ok == "Sil" then
	if c2 == 0 then aegisub.log("İşlem yapabilmek için en az bir aktör lazım.\n") end
	if c2 > 0 then
	cc_actor_cache(subs, c2 + 1)
	actor_val = {}
	actor_val2 = {}
	actor_val_c = 0
	for actor_number, actor_value in ipairs(get_value_for_actor("u_actor", c2 + 1)) do
	actor_val[actor_number] = actor_value
	end
	for actor_number2, actor_value2 in ipairs(get_value_for_actor("u_actor_numb", c2 + 1)) do
	if actor_value2 == true then
	actor_val_c = actor_val_c + 1
	actor_val2[actor_val_c] = actor_number2
	end
	end
	if actor_val_c == 0 then
	aegisub.log("Arayüzden satır silmek için en az bir tane satır seçmelisiniz.\n")
	end
	actor_dc = 0
	for k = 1, table.getn(actor_val2) do
	actor_val2[k] = actor_val2[k] - actor_dc
	delete_value_for_actor(actor_val2[k])
	actor_dc = actor_dc + 1
	for b = 1, c2 do
	cg2[1 + (b - 1) * 3] = cc_actor_multi("checkbox","0",b - 1,"u_actor_numb_"..s(b),"",s(b))
	cg2[3 + (b - 1) * 3] = cc_actor_multi("dropdown","2",b - 1,"u_actor_"..s(b),actor_val[b],"")
	for _, actor in ipairs(collect_actors(subs)) do
	table.insert(cg2[3 + (b - 1) * 3].items,actor)
	end
	end
	cg2[1 + c2 * 3] = nil
	cg2[2 + c2 * 3] = nil
	cg2[3 + c2 * 3] = nil
	c2 = c2 - 1
	end
	end	
	elseif ok == "Yeni" then
	c2 = c2 + 1
	cg2[1 + c2 * 3] = cc_actor_multi("checkbox","0",c2,"u_actor_numb_"..s(c2 + 1),"",s(c2 + 1))
	cg2[2 + c2 * 3] = cc_actor_multi("label","1",c2,"","","")
	cg2[3 + c2 * 3] = cc_actor_multi("dropdown","2",c2,"u_actor_"..s(c2 + 1),"","")
	for _, actor in ipairs(collect_actors(subs)) do
	table.insert(cg2[3 + c2 * 3].items,actor)
	end
	cc_actor_cache(subs, c2)
	end
	ok, config = aegisub.dialog.display(cg2,{"Uygula","Yeni","Sil","Kapat"})
	until ok == "Uygula" or ok == "Kapat"
	if ok == "Uygula" then delete_lines_for_actor(subs) end
	end	

	function add_macro(subs)
	local ok, config
	ok, config = aegisub.dialog.display(cc(subs),{"Devam et","Kapat"})
	if ok == "Devam et" and config.u_style_name ~= "Seç" then
	if config["u_type"] == "Style" then
	cc_style_gui(subs)
	end
	if config["u_type"] == "Actor" then
	cc_actor_gui(subs)
	end
	end
	end
	
	aegisub.register_macro(script_name, script_description, add_macro)

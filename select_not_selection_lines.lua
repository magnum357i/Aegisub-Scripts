	script_name = "Select not Selection Lines"
	script_desription = "Seçmediğiniz satırları seçer."
	script_version = "1"
	script_author = "Magnum357"

	function add_macro(subs,sel)
	local idx, index = 0, {}
	for si, li in ipairs(sel) do
	idx = idx + 1
	index[idx] = li
	end
	if index[1] ~= nil then
	local vls, values = 0, {}
	local k = 1
	for i = 1, #subs do
	if subs[i].class == "dialogue" then
	if index[k] ~= i then
	vls = vls + 1
	values[vls] = i
	else
	k = k + 1
	end
	end
	end
	return values
	end
	end

	aegisub.register_macro(script_name,script_desription,add_macro)
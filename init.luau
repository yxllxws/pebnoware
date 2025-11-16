bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y ~= 255) then
	else
		return x % 256;
	end
	if (y ~= 65535) then
	else
		return x % 65536;
	end
	if (y ~= 4294967295) then
	else
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) ~= 2) then
		else
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y ~= 255) then
	else
		return (x - (x % 256)) + 255;
	end
	if (y ~= 65535) then
	else
		return (x - (x % 65536)) + 65535;
	end
	if (y ~= 4294967295) then
	else
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) < 1) then
		else
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) ~= 1) then
		else
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) < N) then
	else
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local TABLE_TableIndirection = {};
bit32 = {};
TABLE_TableIndirection["v0%0"] = 32;
TABLE_TableIndirection["v1%0"] = 2 ^ TABLE_TableIndirection["v0%0"];
bit32.bnot = function(v30)
	v30 = v30 % TABLE_TableIndirection["v1%0"];
	return (TABLE_TableIndirection["v1%0"] - 1) - v30;
end;
bit32.band = function(v31, v32)
	if (v32 ~= 255) then
	else
		return v31 % 256;
	end
	if ((v32 == 65535) or (4593 <= 2672)) then
		return v31 % 65536;
	end
	if ((v32 == 4294967295) or (1168 > 3156)) then
		return v31 % 4294967296;
	end
	v31, v32 = v31 % TABLE_TableIndirection["v1%0"], v32 % TABLE_TableIndirection["v1%0"];
	TABLE_TableIndirection["v33%0"] = 0;
	TABLE_TableIndirection["v34%0"] = 1;
	for v130 = 1, TABLE_TableIndirection["v0%0"] do
		local v131, v132 = v31 % 2, v32 % 2;
		v31, v32 = math.floor(v31 / 2), math.floor(v32 / 2);
		if (((v131 + v132) == 2) or (572 > 4486)) then
			TABLE_TableIndirection["v33%0"] = TABLE_TableIndirection["v33%0"] + TABLE_TableIndirection["v34%0"];
		end
		TABLE_TableIndirection["v34%0"] = 2 * TABLE_TableIndirection["v34%0"];
	end
	return TABLE_TableIndirection["v33%0"];
end;
bit32.bor = function(v35, v36)
	if ((1404 == 1404) and (v36 == 255)) then
		return (v35 - (v35 % 256)) + 255;
	end
	if (v36 ~= 65535) then
	else
		return (v35 - (v35 % 65536)) + 65535;
	end
	if ((v36 == 4294967295) or (3748 < 2212)) then
		return 4294967295;
	end
	v35, v36 = v35 % TABLE_TableIndirection["v1%0"], v36 % TABLE_TableIndirection["v1%0"];
	TABLE_TableIndirection["v37%0"] = 0;
	TABLE_TableIndirection["v38%0"] = 1;
	for v133 = 1, TABLE_TableIndirection["v0%0"] do
		local v134, v135 = v35 % 2, v36 % 2;
		v35, v36 = math.floor(v35 / 2), math.floor(v36 / 2);
		if (((v134 + v135) >= 1) or (1180 == 2180)) then
			TABLE_TableIndirection["v37%0"] = TABLE_TableIndirection["v37%0"] + TABLE_TableIndirection["v38%0"];
		end
		TABLE_TableIndirection["v38%0"] = 2 * TABLE_TableIndirection["v38%0"];
	end
	return TABLE_TableIndirection["v37%0"];
end;
bit32.bxor = function(v39, v40)
	v39, v40 = v39 % TABLE_TableIndirection["v1%0"], v40 % TABLE_TableIndirection["v1%0"];
	TABLE_TableIndirection["v41%0"] = 0;
	TABLE_TableIndirection["v42%0"] = 1;
	for v136 = 1, TABLE_TableIndirection["v0%0"] do
		local v137, v138 = v39 % 2, v40 % 2;
		v39, v40 = math.floor(v39 / 2), math.floor(v40 / 2);
		if ((v137 + v138) ~= 1) then
		else
			TABLE_TableIndirection["v41%0"] = TABLE_TableIndirection["v41%0"] + TABLE_TableIndirection["v42%0"];
		end
		TABLE_TableIndirection["v42%0"] = 2 * TABLE_TableIndirection["v42%0"];
	end
	return TABLE_TableIndirection["v41%0"];
end;
bit32.lshift = function(v43, v44)
	if (math.abs(v44) < TABLE_TableIndirection["v0%0"]) then
	else
		return 0;
	end
	v43 = v43 % TABLE_TableIndirection["v1%0"];
	if ((4090 < 4653) and (v44 < 0)) then
		return math.floor(v43 * (2 ^ v44));
	else
		return (v43 * (2 ^ v44)) % TABLE_TableIndirection["v1%0"];
	end
end;
bit32.rshift = function(v45, v46)
	if (math.abs(v46) < TABLE_TableIndirection["v0%0"]) then
	else
		return 0;
	end
	v45 = v45 % TABLE_TableIndirection["v1%0"];
	if (v46 > 0) then
		return math.floor(v45 * (2 ^ -v46));
	else
		return (v45 * (2 ^ -v46)) % TABLE_TableIndirection["v1%0"];
	end
end;
bit32.arshift = function(v47, v48)
	if (math.abs(v48) < TABLE_TableIndirection["v0%0"]) then
	else
		return 0;
	end
	v47 = v47 % TABLE_TableIndirection["v1%0"];
	if ((v48 > 0) or (2652 < 196)) then
		TABLE_TableIndirection["v166%0"] = 0;
		if ((4135 < 4817) and (v47 >= (TABLE_TableIndirection["v1%0"] / 2))) then
			TABLE_TableIndirection["v166%0"] = TABLE_TableIndirection["v1%0"] - (2 ^ (TABLE_TableIndirection["v0%0"] - v48));
		end
		return math.floor(v47 * (2 ^ -v48)) + TABLE_TableIndirection["v166%0"];
	else
		return (v47 * (2 ^ -v48)) % TABLE_TableIndirection["v1%0"];
	end
end;
TABLE_TableIndirection["v9%0"] = {};
TABLE_TableIndirection["v9%0"]["v0%0"] = string.char;
TABLE_TableIndirection["v9%0"]["v1%0"] = string.byte;
TABLE_TableIndirection["v9%0"]["v2%0"] = string.sub;
TABLE_TableIndirection["v9%0"]["v3%0"] = bit32 or bit;
TABLE_TableIndirection["v9%0"]["v4%0"] = TABLE_TableIndirection["v9%0"]["v3%0"].bxor;
TABLE_TableIndirection["v9%0"]["v5%0"] = table.concat;
TABLE_TableIndirection["v9%0"]["v6%0"] = table.insert;
local function v22(v49, v50)
	TABLE_TableIndirection["v9%0"]["v73%0"] = {};
	for v139 = 1, #v49 do
		TABLE_TableIndirection["v9%0"]["v6%0"](TABLE_TableIndirection["v9%0"]["v73%0"], TABLE_TableIndirection["v9%0"]["v0%0"](TABLE_TableIndirection["v9%0"]["v4%0"](TABLE_TableIndirection["v9%0"]["v1%0"](TABLE_TableIndirection["v9%0"]["v2%0"](v49, v139, v139 + 1)), TABLE_TableIndirection["v9%0"]["v1%0"](TABLE_TableIndirection["v9%0"]["v2%0"](v50, 1 + (v139 % #v50), 1 + (v139 % #v50) + 1))) % 256));
	end
	return TABLE_TableIndirection["v9%0"]["v5%0"](TABLE_TableIndirection["v9%0"]["v73%0"]);
end
TABLE_TableIndirection["v9%0"]["v8%0"] = {};
bit32 = {};
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\255\134\139", "\126\177\163\187\69\134\219\167")] = 32;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\19\136\122", "\156\67\173\74\165")] = 2 ^ TABLE_TableIndirection["v9%0"]["v8%0"][v22("\26\242\25", "\38\84\215\41\118\220\70")];
bit32.bnot = function(v52)
	v52 = v52 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\96\83\114", "\158\48\118\66\114")];
	return (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\155\97\64", "\155\203\68\112\86\19\197")] - 1) - v52;
end;
bit32.band = function(v53, v54)
	if ((272 == 272) and (v54 == 255)) then
		return v53 % 256;
	end
	if ((100 <= 3123) and ((v54 == 65535) or (4593 <= 2672))) then
		return v53 % 65536;
	end
	if ((v54 == 4294967295) or (1168 > 3156) or (1369 > 4987)) then
		return v53 % 4294967296;
	end
	v53, v54 = v53 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\118\152\102", "\152\38\189\86\156\32\24\133")], v54 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\204\18\247", "\38\156\55\199")];
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\186\56\44", "\35\200\29\28\72\115\20\154")] = 0;
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\9\250\129", "\84\121\223\177\191\237\76")] = 1;
	for v140 = 1, TABLE_TableIndirection["v9%0"]["v8%0"][v22("\149\19\153", "\161\219\54\169\192\90\48\80")] do
		local v141, v142 = v53 % 2, v54 % 2;
		v53, v54 = math.floor(v53 / 2), math.floor(v54 / 2);
		if (((v141 + v142) == 2) or (572 > 4486)) then
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\91\7\80", "\69\41\34\96")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\174\134\135", "\75\220\163\183\106\98")] + TABLE_TableIndirection["v9%0"]["v8%0"][v22("\18\255\219", "\185\98\218\235\87")];
		end
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\219\121\119", "\202\171\92\71\134\190")] = 2 * TABLE_TableIndirection["v9%0"]["v8%0"][v22("\57\132\124", "\232\73\161\76")];
	end
	return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\169\156\18", "\126\219\185\34\61")];
end;
bit32.bor = function(v56, v57)
	if ((v57 ~= 255) or (863 >= 4584)) then
	else
		return (v56 - (v56 % 256)) + 255;
	end
	if ((v57 ~= 65535) or (724 >= 1668)) then
	else
		return (v56 - (v56 % 65536)) + 65535;
	end
	if ((1404 == 1404) and (v57 == 4294967295)) then
		return 4294967295;
	end
	v56, v57 = v56 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\60\139\14", "\135\108\174\62\18\30\23\147")], v57 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\134\172\122", "\167\214\137\74\171\120\206\83")];
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\153\181\98", "\199\235\144\82\61\152")] = 0;
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\23\83\233", "\75\103\118\217")] = 1;
	for v144 = 1, TABLE_TableIndirection["v9%0"]["v8%0"][v22("\233\17\32", "\126\167\52\16\116\217")] do
		local v145, v146 = v56 % 2, v57 % 2;
		v56, v57 = math.floor(v56 / 2), math.floor(v57 / 2);
		if ((v145 + v146) < 1) then
		else
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\218\107\112", "\156\168\78\64\224\212\121")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\21\171\245", "\174\103\142\197")] + TABLE_TableIndirection["v9%0"]["v8%0"][v22("\70\109\15", "\152\54\72\63\88\69\62")];
		end
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\196\129\190", "\60\180\164\142")] = 2 * TABLE_TableIndirection["v9%0"]["v8%0"][v22("\72\27\85", "\114\56\62\101\73\71\141")];
	end
	return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\170\172\139", "\164\216\137\187")];
end;
bit32.bxor = function(v59, v60)
	v59, v60 = v59 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\226\163\97", "\107\178\134\81\210\198\158")], v60 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\8\75\210", "\202\88\110\226\166")];
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\209\74\210", "\170\163\111\226\151")] = 0;
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\1\117\226", "\73\113\80\210\88\46\87")] = 1;
	for v148 = 1, TABLE_TableIndirection["v9%0"]["v8%0"][v22("\175\105\157", "\135\225\76\173\114")] do
		local v149, v150 = v59 % 2, v60 % 2;
		v59, v60 = math.floor(v59 / 2), math.floor(v60 / 2);
		if ((v149 + v150) ~= 1) then
		else
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\8\168\232", "\199\122\141\216\208\204\221")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\191\152\64", "\150\205\189\112\144\24")] + TABLE_TableIndirection["v9%0"]["v8%0"][v22("\53\193\239", "\112\69\228\223\44\100\232\113")];
		end
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\196\90\87", "\230\180\127\103\179\214\28")] = 2 * TABLE_TableIndirection["v9%0"]["v8%0"][v22("\156\64\15", "\128\236\101\63\38\132\33")];
	end
	return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\190\236\65", "\175\204\201\113\36\214\139")];
end;
bit32.lshift = function(v62, v63)
	if (math.abs(v63) < TABLE_TableIndirection["v9%0"]["v8%0"][v22("\105\137\101", "\100\39\172\85\188")]) then
	else
		return 0;
	end
	v62 = v62 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\157\61\233", "\83\205\24\217\224")];
	if ((428 < 1804) and (v63 < 0)) then
		return math.floor(v62 * (2 ^ v63));
	else
		return (v62 * (2 ^ v63)) % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\214\128\157", "\93\134\165\173")];
	end
end;
bit32.rshift = function(v64, v65)
	if ((math.abs(v65) >= TABLE_TableIndirection["v9%0"]["v8%0"][v22("\144\183\145", "\30\222\146\161\162\90\174\210")]) or (3325 > 4613)) then
		return 0;
	end
	v64 = v64 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\213\11\32", "\106\133\46\16")];
	if ((v65 > 0) or (3748 < 2212)) then
		return math.floor(v64 * (2 ^ -v65));
	else
		return (v64 * (2 ^ -v65)) % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\104\101\35", "\32\56\64\19\156\58")];
	end
end;
bit32.arshift = function(v66, v67)
	if ((math.abs(v67) >= TABLE_TableIndirection["v9%0"]["v8%0"][v22("\116\141\181", "\224\58\168\133\54\58\146")]) or (1180 == 2180)) then
		return 0;
	end
	v66 = v66 % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\105\19\27", "\107\57\54\43\157\21\230\231")];
	if (v67 > 0) then
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\218\143\21\176\233", "\175\187\235\113\149\217\188")] = 0;
		if (((4090 < 4653) and (v66 >= (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\12\234\209", "\24\92\207\225\44\131\25")] / 2))) or (4950 <= 4553)) then
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\74\215\188\9\75", "\29\43\179\216\44\123")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\141\156\112", "\44\221\185\64")] - (2 ^ (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\47\162\24", "\19\97\135\40\63")] - v67));
		end
		return math.floor(v66 * (2 ^ -v67)) + TABLE_TableIndirection["v9%0"]["v8%0"][v22("\175\88\55\126\127", "\81\206\60\83\91\79")];
	else
		return (v66 * (2 ^ -v67)) % TABLE_TableIndirection["v9%0"]["v8%0"][v22("\126\238\128", "\196\46\203\176\18\79\163\45")];
	end
end;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\174\114\59\78", "\143\216\66\30\126\68\155")] = string.char;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\188\153\72\155", "\129\202\168\109\171\165\195\183")] = string.byte;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\52\10\114\136", "\134\66\56\87\184\190\116")] = string.sub;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\42\98\76\235", "\85\92\81\105\219\121\139\65")] = bit32 or bit;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\235\231\21\21", "\191\157\211\48\37\28")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\201\76\177\76", "\90\191\127\148\124")].bxor;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\110\210\107\71", "\119\24\231\78")] = table.concat;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\148\123\224\26", "\113\226\77\197\42\188\32")] = table.insert;
local function v24(v68, v69)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\44\66\161\240\106", "\213\90\118\148")] = {};
	for v152 = 1, #v68 do
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\77\120\241\6", "\45\59\78\212\54")](TABLE_TableIndirection["v9%0"]["v8%0"][v22("\6\2\214\206\214", "\144\112\54\227\235\230\78\205")], TABLE_TableIndirection["v9%0"]["v8%0"][v22("\165\120\74\172", "\59\211\72\111\156\176")](TABLE_TableIndirection["v9%0"]["v8%0"][v22("\88\211\166\125", "\77\46\231\131")](TABLE_TableIndirection["v9%0"]["v8%0"][v22("\172\5\243\16", "\32\218\52\214")](TABLE_TableIndirection["v9%0"]["v8%0"][v22("\88\69\116\248", "\58\46\119\81\200\145\208\37")](v68, v152, v152 + 1)), TABLE_TableIndirection["v9%0"]["v8%0"][v22("\61\221\117\252", "\86\75\236\80\204\201\221")](TABLE_TableIndirection["v9%0"]["v8%0"][v22("\100\19\50\213", "\235\18\33\23\229\158")](v69, 1 + (v152 % #v69), 1 + (v152 % #v69) + 1))) % 256));
	end
	return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\70\239\132\235", "\219\48\218\161")](TABLE_TableIndirection["v9%0"]["v8%0"][v22("\242\37\41\12\139", "\128\132\17\28\41\187\47")]);
end
function Bypass()
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\23\102\80\127\13", "\61\97\82\102\90")] = getinfo or debug.getinfo;
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\186\122\252\14\151", "\105\204\78\203\43\167\55\126")] = false;
	local v72, v73, v74;
	setthreadidentity(2 + 0);
	for v153, v154 in getgc(true) do
		if (typeof(v154) ~= v24("\197\194\217\41\227", "\126\177\163\187\69\134\219\167")) then
		else
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\179\251\112\70\86\84", "\49\197\202\67\126\115\100\167")] = 1534 - (1264 + 270);
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\33\10\140\112\197\6", "\62\87\59\191\73\224\54")] = nil;
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\241\83\174\153\162\82", "\169\135\98\154")] = nil;
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\221\38\112\5\184\99", "\168\171\23\68\52\157\83")] = nil;
			while true do
				if ((2665 <= 3933) and (((0 - 0) == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\226\32\166\245\96\125", "\231\148\17\149\205\69\77")]) or (2652 < 196))) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\150\246\159\172\18\175", "\159\224\199\167\155\55")] = 720 - (476 + 244);
					while true do
						if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\225\162\100\133\178\163", "\178\151\147\92")] ~= (0 + 0)) then
						else
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\154\172\31\107\87\28", "\26\236\157\44\82\114\44")] = rawget(v154, v24("\7\200\62\192\255\55\200\46", "\156\67\173\74\165"));
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\60\127\129\11\111\126", "\59\74\78\181")] = rawget(v154, v24("\31\190\69\26", "\38\84\215\41\118\220\70"));
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\51\128\2\13\246\117", "\211\69\177\58\58")] = 2 - 1;
						end
						if ((3273 == 3273) and (4135 < 4817) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\161\180\33\162\172\155", "\171\215\133\25\149\137")] == 1)) then
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\247\153\97\162\170\96", "\34\129\168\82\154\143\80\156")] = 1 + 0;
							break;
						end
					end
				end
				if ((3824 > 409) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\147\227\96\83\13\30", "\233\229\210\83\107\40\46")] == (2 - 0))) then
					if ((2087 == 2087) and rawget(v154, v24("\112\220\36\245\65\122\233\253\85", "\152\38\189\86\156\32\24\133")) and rawget(v154, v24("\204\69\168\69\249\68\180", "\38\156\55\199")) and (typeof(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\215\19\102\134\64\145", "\101\161\34\82\182")]) == v24("\174\104\114\43\7\125\245\77", "\35\200\29\28\72\115\20\154")) and not v73) then
						v73 = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\254\92\13\174\158\178", "\78\136\109\57\158\187\130\226")];
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\40\109\171\161\123\111", "\145\94\95\153")] = hookfunction(v73, function(v275)
							return;
						end);
					end
					if ((272 == 272) and (typeof(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\235\156\64\132\11\231", "\215\157\173\116\181\46")]) == v24("\31\170\223\220\153\37\59\23", "\84\121\223\177\191\237\76"))) then
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\35\230\217\163\159\101", "\186\85\212\235\146")] = 0;
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\212\211\68\172\124\190", "\56\162\225\118\158\89\142")] = nil;
						while true do
							if ((100 <= 3123) and ((0 + 0) == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\74\87\146\254\103\136", "\184\60\101\160\207\66")])) then
								v74 = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\39\211\40\237\116\210", "\220\81\226\28")];
								TABLE_TableIndirection["v9%0"]["v8%0"][v22("\5\135\208\169\175\151", "\167\115\181\226\155\138")] = hookfunction(v74, function(v294)
									return;
								end);
								break;
							end
						end
					end
					break;
				end
				if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\244\115\180\4\62\33", "\166\130\66\135\60\27\17")] == (177 - (50 + 126))) or (1369 > 4987) or (3404 > 4503)) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\82\27\154\36\117\20", "\80\36\42\174\21")] = rawget(v154, v24("\115\4\35\1\246", "\158\48\118\66\114"));
					if ((typeof(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\88\65\100\35\11\64", "\26\46\112\87")]) == v24("\173\49\30\53\103\172\244\165", "\155\203\68\112\86\19\197")) and not v72) then
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\175\113\249\39\250\239", "\212\217\67\203\20\223\223\37")] = 0;
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\172\223\250\134\255\221", "\178\218\237\200")] = nil;
						while true do
							if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\160\231\180\131\243\229", "\176\214\213\134")] ~= (0 - 0)) then
							else
								v72 = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\226\252\229\141\237\6", "\57\148\205\214\180\200\54")];
								TABLE_TableIndirection["v9%0"]["v8%0"][v22("\4\175\103\96\51\66", "\22\114\157\85\84")] = hookfunction(v72, function(v295, v296, v297)
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\210\153\70\148\24\166", "\200\164\171\115\164\61\150")] = 0 + 0;
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\168\166\86\20\198\238", "\227\222\148\99\37")] = nil;
									while true do
										if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\37\0\7\166\188\99", "\153\83\50\50\150")] == (1413 - (1233 + 180))) or (863 >= 4584)) then
											TABLE_TableIndirection["v9%0"]["v8%0"][v22("\75\36\38\77\54\251", "\45\61\22\19\124\19\203")] = 969 - (522 + 447);
											while true do
												if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\215\64\88\164\71\32", "\217\161\114\109\149\98\16")] ~= (1421 - (107 + 1314))) or (3506 <= 1309)) then
												else
													TABLE_TableIndirection["v9%0"]["v8%0"][v22("\4\114\110\37\249\36", "\20\114\64\88\28\220")] = 0 + 0;
													while true do
														if ((2955 == 2955) and ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\39\83\132\237\189\128", "\221\81\97\178\212\152\176")] == (0 - 0)) or (724 >= 1668))) then
															if (((428 < 1804) and (v295 ~= "_")) or (2903 == 1495)) then
																return;
															end
															return true;
														end
													end
												end
											end
											break;
										end
									end
								end);
								break;
							end
						end
					end
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\219\182\78\163\95\157", "\122\173\135\125\155")] = 699 - (128 + 569);
				end
			end
		end
	end
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\146\148\81\252\111", "\168\228\161\96\217\95\81")] = hookfunction(getrenv().debug.info, newcclosure(function(...)
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\205\128\127\8\106\7", "\55\187\177\78\60\79")] = 0 + 0;
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\59\159\14\190\3\159", "\224\77\174\63\139\38\175")] = nil;
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\146\16\9\120\193\17", "\78\228\33\56")] = nil;
		while true do
			if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\216\47\227\87\192\158", "\229\174\30\210\99")] ~= (1544 - (1407 + 136))) then
			else
				return Old(...);
			end
			if ((4546 >= 2275) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\13\188\215\5\168\109", "\89\123\141\230\49\141\93")] ~= 0)) then
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\229\32\167\89\85\26", "\42\147\17\150\108\112")], TABLE_TableIndirection["v9%0"]["v8%0"][v22("\25\247\124\41\162\184", "\136\111\198\77\31\135")] = ...;
				if (v72 and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\20\88\246\3\248\180", "\201\98\105\199\54\221\132\119")] == v72)) then
					return coroutine.yield(coroutine.running());
				end
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\175\93\210\117\71\101", "\204\217\108\227\65\98\85")] = 1 - 0;
			end
		end
	end));
	setthreadidentity(27 - 20);
	print(v24("\141\95\219\181\46\81\60\200\161\83\205\224\27\94\36\200\246\117\193\165\59\68\113", "\161\219\54\169\192\90\48\80"));
	game:GetService(v24("\122\65\18\44\89\86\35\42\71\86\5\61\93", "\69\41\34\96")):SetTimeout(1910 - (716 + 1194));
	hookfunction(game.Players.LocalPlayer.Kick, function()
	end);
end
Bypass();
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\72\155\176\181", "\160\62\163\149\133\76")] = game:GetService(v24("\140\207\214\19\7\57\175", "\75\220\163\183\106\98"));
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\192\249\72\127", "\163\182\192\109\79")] = game:GetService(v24("\55\169\142\37\240\12\170\158\35\234\7\168\157\62\218\7", "\185\98\218\235\87"));
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\34\119\80\133\165", "\149\84\70\96\160")] = game:GetService(v24("\249\57\55\234\215\169\202\40\34\226\237\190\196\46\38\225\219", "\202\171\92\71\134\190"));
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\46\87\92\168\104", "\141\88\102\109")] = cloneref(game:GetService(v24("\29\196\52\156\10\201\45\156\26\196\62\158\32\194\41", "\232\73\161\76")));
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\165\2\152\53\74", "\161\211\51\170\16\122\93\53")] = cloneref(game:GetService(v24("\137\204\76\110\27\169\207\75\94\27", "\126\219\185\34\61")));
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\237\255\225\109\171", "\72\155\206\210")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\80\43\5\75\99", "\83\38\26\52\110")].ChatVersion == Enum.ChatVersion.LegacyChatService;
local function v25(v75)
	v75 = tostring(v75);
	if (not TABLE_TableIndirection["v9%0"]["v8%0"][v22("\78\70\116\3\8", "\38\56\119\71")] or (3325 > 4613)) then
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\229\190\9\147\117", "\54\147\143\56\182\69")].TextChannels.RBXGeneral:SendAsync(v75);
	else
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\192\208\175\12\143", "\191\182\225\159\41")].DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v75, v24("\45\194\82", "\135\108\174\62\18\30\23\147"));
	end
end
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\61\67\125\16\219", "\162\75\114\72\53\235\231")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\154\100\1\178", "\98\236\92\36\130\51")].LocalPlayer;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\178\72\90\255\21", "\80\196\121\108\218\37\200\213")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\22\34\87\58\27", "\234\96\19\98\31\43\110")].Character;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\16\78\5\130\252", "\235\102\127\50\167\204\18")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\70\240\163\102\20", "\78\48\193\149\67\36")]:FindFirstChild(v24("\158\252\39\202\22\161\58\195", "\167\214\137\74\171\120\206\83"));
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\38\79\215\93\17", "\33\80\126\224\120")].Health = 0 + 0;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\250\249\90\129\12", "\60\140\200\99\164")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\145\165\81\99\242", "\194\231\148\100\70")]:GetMouse();
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\80\30\145\230\166", "\168\38\44\161\195\150")] = game.Workspace.Camera;
local function v27()
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\150\169\209\51\96", "\118\224\156\226\22\80\136\214")] = nil;
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\84\187\13\197\18", "\224\34\142\57")] = math.huge;
	for v156, v157 in pairs(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\200\255\128\141", "\110\190\199\165\189\19\145\61")]:GetPlayers()) do
		if ((v157 ~= TABLE_TableIndirection["v9%0"]["v8%0"][v22("\204\179\50\184", "\167\186\139\23\136\235")].LocalPlayer) and v157.Character and v157.Character:FindFirstChild(v24("\163\245\51\89", "\199\235\144\82\61\152"))) then
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\12\228\220\95\95\229", "\109\122\213\232")] = 0;
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\248\166\246\99\171\167", "\80\142\151\194")] = nil;
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\21\151\35\24\70\150", "\44\99\166\23")] = nil;
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\106\166\125\99\118\244", "\196\28\151\73\86\83")] = nil;
			while true do
				if ((819 >= 22) and ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\229\82\125\66\199\8", "\22\147\99\73\112\226\56\120")] == (0 + 0)) or (4950 <= 4553))) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\174\36\186\173\200\232", "\237\216\21\130\149")] = 503 - (74 + 429);
					while true do
						if ((2665 <= 3933) and ((3 - 2) == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\148\31\7\7\245\153", "\62\226\46\63\63\208\169")])) then
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\243\72\1\209\90\93", "\62\133\121\53\227\127\109\79")] = 1 - 0;
							break;
						end
						if ((3162 == 3162) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\6\69\106\173\147\254", "\194\112\116\82\149\182\206")] ~= (0 + 0))) then
						else
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\47\249\24\75\133\178", "\110\89\200\44\120\160\130")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\189\145\27\3\19", "\45\203\163\43\38\35\42\91")]:WorldToScreenPoint(v157.Character.Head.Position);
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\196\212\136\119\194\249", "\52\178\229\188\67\231\201")] = Vector2.new(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\55\16\9\65\167", "\67\65\33\48\100\151\60")].X, TABLE_TableIndirection["v9%0"]["v8%0"][v22("\201\182\247\157\163", "\147\191\135\206\184")].Y);
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\146\121\254\153\157\3", "\210\228\72\198\161\184\51")] = 2 - 1;
						end
					end
				end
				if (((3273 == 3273) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\32\24\167\66\54\158", "\174\86\41\147\112\19")] == 1)) or (2369 > 4429)) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\77\81\217\94\96\95", "\203\59\96\237\107\69\111\113")] = (Vector2.new(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\50\71\248\178\116\160", "\183\68\118\204\129\81\144")].X, TABLE_TableIndirection["v9%0"]["v8%0"][v22("\24\252\36\183\78\210", "\226\110\205\16\132\107")].Y) - TABLE_TableIndirection["v9%0"]["v8%0"][v22("\253\146\180\141\4\187", "\33\139\163\128\185")]).magnitude;
					if ((3824 > 409) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\65\9\80\139\18\8", "\190\55\56\100")] < TABLE_TableIndirection["v9%0"]["v8%0"][v22("\64\250\104\91\67", "\147\54\207\92\126\115\131")])) then
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\27\99\103\40\72\46", "\30\109\81\85\29\109")] = 0;
						while true do
							if ((4095 >= 3183) and ((0 + 0) ~= TABLE_TableIndirection["v9%0"]["v8%0"][v22("\233\35\6\227\115\142", "\156\159\17\52\214\86\190")])) then
							else
								TABLE_TableIndirection["v9%0"]["v8%0"][v22("\184\186\233\249\254", "\220\206\143\221")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\144\44\121\66\157\156", "\178\230\29\77\119\184\172")];
								TABLE_TableIndirection["v9%0"]["v8%0"][v22("\227\235\89\94\39", "\152\149\222\106\123\23")] = v157;
								break;
							end
						end
					end
					break;
				end
			end
		end
	end
	return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\203\115\165\6\229", "\213\189\70\150\35")];
end
function FindAsset(v78)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\89\0\34\77\31", "\104\47\53\20")] = false;
	for v158, v159 in pairs(game:GetService(v24("\53\19\169\39\14\21\184\63\2\18\138\63\8\4\184\44\2", "\75\103\118\217")):GetDescendants()) do
		if (((2087 == 2087) and (v78 == v24("\238\90\118\24\176\29\211\96\113\6\190\27\211", "\126\167\52\16\116\217")) and (game.PlaceId ~= (86242922250490 - (29 + 35)))) or (3711 < 1008)) then
			if (v159:IsA(v24("\250\43\45\143\160\28\218\221\32\35\148\189\22\242", "\156\168\78\64\224\212\121")) or (3404 > 4503)) then
				if (v159.Name ~= v24("\46\224\163\194\14\237\177\250\6\252\162\203\19", "\174\103\142\197")) then
				else
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\181\29\216\77\249\95", "\111\195\44\225\124\220")] = 0 - 0;
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\206\23\89\33\238\251", "\203\184\38\96\19\203")] = nil;
					while true do
						if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\47\34\32\16\139\105", "\174\89\19\25\33")] == (0 - 0)) or (3506 <= 1309)) then
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\57\67\11\28\178\215", "\107\79\114\50\46\151\231")] = 433 - (279 + 154);
							while true do
								if (((2955 == 2955) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\47\247\236\123\207\105", "\160\89\198\213\73\234\89\215")] == (0 - 0))) or (1049 <= 906)) then
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\94\35\225\171\128\24", "\165\40\17\212\158")] = 778 - (454 + 324);
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\243\139\93\101\99\181", "\70\133\185\104\83")] = nil;
									while true do
										if ((4513 > 2726) and ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\18\23\17\127\140\84", "\169\100\37\36\74")] == (0 + 0)) or (2903 == 1495))) then
											TABLE_TableIndirection["v9%0"]["v8%0"][v22("\22\213\247\6\69\215", "\48\96\231\194")] = 408 - (312 + 96);
											while true do
												if (((4546 >= 2275) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\222\8\91\123\92\136", "\227\168\58\110\77\121\184\207")] == (0 - 0))) or (1481 >= 2658)) then
													TABLE_TableIndirection["v9%0"]["v8%0"][v22("\109\105\233\5\225", "\197\27\92\223\32\209\187\17")] = true;
													return v159;
												end
											end
											break;
										end
									end
								end
							end
							break;
						end
					end
				end
			elseif (((819 >= 22) and v159:IsA(v24("\100\45\82\55\49\91\221\64\45\81\44", "\152\54\72\63\88\69\62"))) or (3220 == 1364)) then
				if (((3162 == 3162) and (v159.Name == v24("\253\202\232\80\221\199\250\104\213\214\233\89\192", "\60\180\164\142"))) or (1054 > 3392)) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\21\10\149\190\83", "\155\99\63\163")] = true;
					return v159;
				end
			end
		elseif (v159.Name ~= v78) then
		else
			return v159;
		end
	end
end
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\148\131\243\200\233", "\228\226\177\193\237\217")] = {[v24("\107\87\9\44\41\249", "\114\56\62\101\73\71\141")]={[v24("\157\231\218\198\180\236\223", "\164\216\137\187")]=false,[v24("\250\239\37\145\174\255\5\209\227", "\107\178\134\81\210\198\158")]=(117 - (12 + 5)),[v24("\16\7\150\246\171\42\26", "\202\88\110\226\166")]=v24("\235\10\131\243", "\170\163\111\226\151"),[v24("\38\49\190\52\108\54\39\22", "\73\113\80\210\88\46\87")]=false,[v24("\180\63\200\54\238\146\56\204\28\228\132", "\135\225\76\173\114")]=false,[v24("\62\228\171\164\173\179\164\31", "\199\122\141\216\208\204\221")]=(54 + 46),[v24("\132\211\3\228\121\248\185\246\25\252\116", "\150\205\189\112\144\24")]=false,[v24("\6\139\176\64\0\135\6\30", "\112\69\228\223\44\100\232\113")]=false,[v24("\231\22\11\214\184\104\167\221\18\42\220\178\121", "\230\180\127\103\179\214\28")]=v24("\162\10\77\75\229\77", "\128\236\101\63\38\132\33")},[v24("\154\160\2\81\183\231\220", "\175\204\201\113\36\214\139")]={[v24("\106\205\60\210", "\100\39\172\85\188")]={[v24("\136\118\184\130\63\168\124", "\83\205\24\217\224")]=false,[v24("\196\202\213", "\93\134\165\173")]=false,[v24("\150\247\192\206\46\198\176\127\172", "\30\222\146\161\162\90\174\210")]=false,[v24("\203\79\125\15\246", "\106\133\46\16")]=false,[v24("\127\44\124\235", "\32\56\64\19\156\58")]=false},[v24("\119\193\246\85", "\224\58\168\133\54\58\146")]={[v24("\107\87\66\243\119\137\144\40\81\87\89\252\118\146\130\25", "\107\57\54\43\157\21\230\231")]={[v24("\254\133\16\247\181\217\203", "\175\187\235\113\149\217\188")]=true}}},[v24("\27\186\143\97\236\125\107", "\24\92\207\225\44\131\25")]={[v24("\110\221\185\78\23\120\79", "\29\43\179\216\44\123")]=false,[v24("\143\216\48\69\185\255\41\94\184", "\44\221\185\64")]=false,[v24("\40\233\91\75\114\15\243\122\90\127\14\230\76", "\19\97\135\40\63")]=false,[v24("\128\83\0\43\61\52\175\88", "\81\206\60\83\91\79")]=false,[v24("\96\164\226\119\44\204\68\168", "\196\46\203\176\18\79\163\45")]=false,[v24("\150\45\84\31\41", "\143\216\66\30\126\68\155")]=false,[v24("\135\221\1\223\204\129\194\237\166\205\25", "\129\202\168\109\171\165\195\183")]=false,[v24("\11\86\49\209\208\29\242\39\121\58\213\209", "\134\66\56\87\184\190\116")]=false},[v24("\12\61\8\162\28\249\12\58\56\34", "\85\92\81\105\219\121\139\65")]={[v24("\216\189\81\71\112\218\249", "\191\157\211\48\37\28")]=false,[v24("\236\15\253\18\56\208\11", "\90\191\127\148\124")]=false,[v24("\89\137\58\30\84\136\45\28", "\119\24\231\78")]=false,[v24("\161\11\183\75\209\69\34\146\40\160\78", "\113\226\77\197\42\188\32")]={[v24("\31\24\245\183\54\19\240", "\213\90\118\148")]=false,[v24("\108\47\184\93\126\75\43\177\82", "\45\59\78\212\54")]=5}},[v24("\52\83\144\146\136\45", "\144\112\54\227\235\230\78\205")]={[v24("\150\38\14\254\220\94\183", "\59\211\72\111\156\176")]=false,[v24("\123\137\235\36\90\147\226\47\66\130", "\77\46\231\131")]=false},[v24("\151\93\165\67", "\32\218\52\214")]={[v24("\125\18\63\172\220\181\86\73\79\16\52", "\58\46\119\81\200\145\208\37")]=false,[v24("\7\131\63\188\141\184\58\46\152\53", "\86\75\236\80\204\201\221")]=false},[v24("\65\81\114\134\247\141\123\66", "\235\18\33\23\229\158")]={[v24("\99\152\244\143\111\145\200\183\92\155\205\183", "\219\48\218\161")]=false},[v24("\197\98\111\76\207\92", "\128\132\17\28\41\187\47")]={[v24("\40\60\0\54\84\2\38\50\59\79\6\55\18", "\61\97\82\102\90")]=FindAsset(v24("\133\32\173\71\206\84\10\61\173\60\172\78\211", "\105\204\78\203\43\167\55\126")),[v24("\141\175\34\26\0\12\200\69\128\172\37\27\16\16", "\49\197\202\67\126\115\100\167")]=FindAsset(v24("\31\94\222\45\147\94\81\35\126\217\47\133\85\74", "\62\87\59\191\73\224\54")),[v24("\209\11\233\220\230\14\243\211\226\32\239\197\235\7\238", "\169\135\98\154")]=FindAsset(v24("\253\126\55\65\252\63\193\209\114\6\65\241\63\205\223", "\168\171\23\68\52\157\83")),[v24("\214\99\240\172\46\10\139\245\98\230", "\231\148\17\149\205\69\77")]=FindAsset(v24("\162\181\194\250\92\216\140\166\212\232", "\159\224\199\167\155\55")),[v24("\199\255\61\203\214\230\56\219\248", "\178\151\147\92")]=FindAsset(v24("\188\241\77\43\51\89\126\133\242", "\26\236\157\44\82\114\44")),[v24("\24\43\196\78\47\61\193\104\58\47\194\85\28\43\221\82\41\34\208", "\59\74\78\181")]=FindAsset(v24("\23\212\75\79\182\54\197\105\74\178\50\223\108\95\187\44\210\86\95", "\211\69\177\58\58")),[v24("\146\253\112\230\253", "\171\215\133\25\149\137")]=FindAsset(v24("\196\208\59\233\251", "\34\129\168\82\154\143\80\156"))}};
local function v28(v80)
	if TABLE_TableIndirection["v9%0"]["v8%0"][v22("\34\226\113\163\100", "\134\84\208\67")].Misc.SendMessage then
		v25(v24("\130\181\124\18\95\79\157\197\174\115\9\77\93\157\197\179\58\6\8\90\155\132\187\61\14\90", "\233\229\210\83\107\40\46"));
	end
	if ((v80 == v24("\227\87\62\218\0\213", "\101\161\34\82\182")) or (676 >= 1642)) then
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\5\253\213\12\86\252", "\60\115\204\230")] = 0;
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\241\107\184\33\162\106", "\16\135\90\139")] = nil;
		while true do
			if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\66\37\85\99\11\4", "\24\52\20\102\83\46\52")] ~= (0 - 0)) then
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\210\126\114\117\74\148", "\111\164\79\65\68")] = {TABLE_TableIndirection["v9%0"]["v8%0"][v22("\208\136\214\155\126", "\138\166\185\227\190\78")].Character:FindFirstChildWhichIsA(v24("\220\2\86\242", "\78\136\109\57\158\187\130\226")),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\221\37\144\114\2", "\121\171\20\165\87\50\67")].Character:FindFirstChildWhichIsA(v24("\10\48\246\253", "\145\94\95\153")):WaitForChild(v24("\213\204\26\209\66\178", "\215\157\173\116\181\46")),Vector3.new(0.14591316878795624 - 0, -(1183.0777457430959 - (1058 + 125)), -0.9862377643585205),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\208\105\236\115\233", "\98\166\88\217\86\217")].Character:FindFirstChildWhichIsA(v24("\1\187\132\254", "\186\85\212\235\146")):WaitForChild(v24("\234\128\24\250\53\235", "\56\162\225\118\158\89\142")):WaitForChild(v24("\123\16\206\137\43\202\89\53\207\166\44\204", "\184\60\101\160\207\66")),{true,{(44564163 + 142244898),(186810489 - (988 + 252)),(186811148 - (41 + 1857)),(186811222 - (49 + 1921))},(1.07 - 0),(1775 - (1111 + 663)),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\224\167\44\68\214", "\188\150\150\25\97\230")].Character:FindFirstChildWhichIsA(v24("\5\141\115\176", "\220\81\226\28")):WaitForChild(v24("\52\192\140\200\233\213\26\197\150\196\198\200\16\212\142", "\167\115\181\226\155\138")):WaitForChild(v24("\202\43\243\121\125\119\195\225\54", "\166\130\66\135\60\27\17")),false},{true,{(5169579521 - 2076712622)},(1 - 0),(1455 - (496 + 947)),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\204\216\10\71\92", "\141\186\233\63\98\108")].Character:FindFirstChildWhichIsA(v24("\112\69\193\121", "\80\36\42\174\21")):WaitForChild(v24("\105\5\57\73\77\2\62\106\90\47\27\117\77\17\59", "\26\46\112\87")):WaitForChild(v24("\155\47\164\123\187\154\67\178\188\32\191", "\212\217\67\203\20\223\223\37"))},{true,(805.45 - (266 + 539)),{(4934172 - 2855546),(359669510 - (963 + 682)),(113743669 - (504 + 1000)),(130666059 + 229001643),(2146594734 - 1099404748)},{[v24("\180\136\191", "\178\218\237\200")]=nil},(79 - 49),(1187.3 - (1151 + 36))},{false,(3 + 5),true,{163064102},1,(2 - 1),false,TABLE_TableIndirection["v9%0"]["v8%0"][v22("\231\187\121\243\117", "\69\145\138\76\214")].Character:FindFirstChildWhichIsA(v24("\130\186\233\220", "\176\214\213\134")):WaitForChild(v24("\211\184\184\231\171\68\80\228\185\137\248\167\85\88\248", "\57\148\205\214\180\200\54")):WaitForChild(v24("\55\229\37\56\121\1\244\58\58\83\20\251\48\55\98", "\22\114\157\85\84"))},{false,Vector3.new(0.20000000298023224 + 0, 0, 1243 - (157 + 1086)),Vector3.new(-(0.20000000298023224 + 0), 0 - 0, 0 - 0),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\102\158\220\204\239", "\118\16\175\233\233\223")].Character:FindFirstChildWhichIsA(v24("\240\196\28\200", "\200\164\171\115\164\61\150")):WaitForChild(v24("\153\225\13\118\128\172\253\19\81\188\146\251\0\68\143", "\227\222\148\99\37")):WaitForChild(v24("\7\64\83\245\252\33\119\84\240\252\48\70", "\153\83\50\50\150")),false,TABLE_TableIndirection["v9%0"]["v8%0"][v22("\157\213\96\254\190", "\29\235\228\85\219\142\235")].Character:FindFirstChildWhichIsA(v24("\105\121\124\16", "\45\61\22\19\124\19\203")):WaitForChild(v24("\230\7\3\198\1\98\176\209\6\50\217\13\115\184\205", "\217\161\114\109\149\98\16")):WaitForChild(v24("\34\33\42\104\181\119\30\37\29\122\186\113\17\52", "\20\114\64\88\28\220")),(1369 - (599 + 220)),(6969 - 3469),(1931 - (1813 + 118)),Vector3.zero,Vector3.new(1217.4000000059605 - (841 + 376), 0.4000000059604645 - 0, 0.4000000059604645),Color3.new(713.9607843160629 - (164 + 549), 0.8039215803146362 - 0, 859.1882352977991 - (464 + 395)),(2 - 1),Enum.Material.Neon,Enum.PartType.Cylinder,false,(320972037 + 116287464),(1498930365 - 1061670860),Vector3.new(0.0020000000949949026 + 0, 720.002000000095 - (254 + 466), 560.002000000095 - (544 + 16))},{false,{(269516151 - (74 + 1208)),(662906495 - 393391608),(1278199059 - 1008684252),(269515207 - (14 + 376))},(0.5 - 0),(1 + 0)},{false,(82 - (23 + 55)),Color3.new(365 - (326 + 38), 0.6470588445663452, 0.6000000238418579 - 0),10,true}};
				for v231 = 1 + 0, 246950 + 28050 do
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\43\134\232\152\39", "\50\93\180\218\189\23\46\71")].Assets.VisualizeBullet:FireServer(unpack(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\200\245\8\29\1\140", "\40\190\196\59\44\36\188")]));
				end
				break;
			end
		end
	elseif ((4136 > 2397) and (v80 == v24("\21\4\193\160\234\223\164\113\44\211\164", "\221\81\97\178\212\152\176"))) then
		for v201, v202 in pairs(game.Workspace:GetDescendants()) do
			if (v202:IsA(v24("\239\230\14\254\42\204\245\9", "\122\173\135\125\155")) or (2369 > 4429) or (4334 == 4245)) then
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\42\23\142\241\170", "\109\92\37\188\212\154\29")].Assets.BreakGlass:FireServer(v202);
			end
		end
	elseif ((4095 >= 3183) and (v80 == v24("\165\212\4\176\48", "\168\228\161\96\217\95\81"))) then
		for v239 = 1 - 0, 86505 + 188495 do
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\18\190\253\151\116\10", "\58\100\143\196\163\81")] = 901 - (652 + 249);
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\12\19\122\246\122\25", "\110\122\34\67\195\95\41\133")] = nil;
			while true do
				if ((0 - 0) ~= TABLE_TableIndirection["v9%0"]["v8%0"][v22("\99\224\2\30\147\37", "\182\21\209\59\42")]) then
				else
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\161\6\156\72\100\238", "\222\215\55\165\125\65")] = {"}0, { \n\n } ",v24("\198\157\110\71\111", "\55\187\177\78\60\79"),{[v24("\29\199\75\232\78", "\224\77\174\63\139\38\175")]=1,[v24("\161\76\81\58\144\68\74\29\141\91\93", "\78\228\33\56")]=math.huge,[v24("\254\113\161\10\145\199\113\188", "\229\174\30\210\99")]=game.Workspace:FindFirstChildWhichIsA(v24("\43\236\148\69", "\89\123\141\230\49\141\93")),[v24("\192\126\227\2\20\99\247", "\42\147\17\150\108\112")]=v24("\29\164\53\126\244\251\10\178\36\123\189\167\64\255\124\46\180\184\88\245\122\43\181", "\136\111\198\77\31\135"),[v24("\48\12\183\90\180\231\22\189\7", "\201\98\105\199\54\221\132\119")]=false,[v24("\143\3\143\52\15\48", "\204\217\108\227\65\98\85")]=math.huge,[v24("\123\197\243\224\47\212\77", "\160\62\163\149\133\76")]=true}};
					if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\58\131\148\95\162", "\42\76\177\166\122\146\161\141")].Assets.PlayAudio ~= nil) or (3711 < 1008)) then
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\179\216\87\139\41", "\22\197\234\101\174\25")].Assets.PlayAudio:FireServer(unpack(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\59\101\252\137\51\255", "\230\77\84\197\188\22\207\183")]));
					elseif (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\239\70\148\185\220", "\85\153\116\166\156\236\193\144")].Assets.Exist == nil) then
					else
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\178\178\31\246\180", "\96\196\128\45\211\132")].Assets.Exist:FireServer(unpack(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\35\220\34\10\151\255", "\184\85\237\27\63\178\207\212")]));
					end
					break;
				end
			end
		end
	elseif ((v80 == v24("\253\169\1\35\131\229\165\31\57\198\196", "\163\182\192\109\79")) or (1049 <= 906)) then
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\30\11\91\9\77\9", "\63\104\57\105")] = 0 - 0;
		while true do
			if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\29\213\246\18\78\215", "\36\107\231\196")] ~= (0 - 0)) then
			else
				task.spawn(function()
					v28(v24("\16\35\19\212\231\59\63\64\237\244\36", "\149\84\70\96\160"));
				end);
				task.spawn(function()
					v28(v24("\25\19\9\228\55", "\141\88\102\109"));
				end);
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\75\231\240\209\24\229", "\231\61\213\194")] = 28 - (10 + 17);
			end
			if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\31\255\111\37\76\253", "\19\105\205\93")] ~= (1 + 0)) or (4276 <= 3031)) then
			else
				task.spawn(function()
					v28(v24("\145\70\198\124\31\41", "\161\211\51\170\16\122\93\53"));
				end);
				break;
			end
		end
	else
		print(v24("\221\175\187\36\254\170", "\72\155\206\210"));
		return;
	end
	print(v24("\101\104\85\29\59\79\116\83", "\83\38\26\52\110"));
end
local function v29(v81)
	if (((4513 > 2726) and v81:FindFirstChild(v24("\107\18\51\82\81\25\32", "\38\56\119\71"))) or (4782 <= 1199)) then
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\191\89\141\211\122\249", "\95\201\104\190\225")] = 0;
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\185\154\146\157\234\155", "\174\207\171\161")] = nil;
		while true do
			if (((7 - 4) == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\251\175\94\161\189\135", "\183\141\158\109\147\152")]) or (1481 >= 2658) or (4864 < 1902)) then
				if ((4839 >= 3700) and TABLE_TableIndirection["v9%0"]["v8%0"][v22("\58\91\180\73\124", "\108\76\105\134")].GunMods.InfiniteAmmo) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\253\148\232\183\139\187", "\174\139\165\209\129")] = 458 - (337 + 121);
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\181\226\187\150\131\83", "\24\195\211\130\161\166\99\16")] = nil;
					while true do
						if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\80\82\176\122\22\70", "\118\38\99\137\76\51")] ~= (1732 - (1400 + 332))) or (1075 > 1918)) then
						else
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\235\119\92\69\76\112", "\64\157\70\101\114\105")] = 0 - 0;
							while true do
								if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\86\249\254\180\85\16", "\112\32\200\199\131")] ~= (1909 - (242 + 1666))) then
								else
									if (v81:FindFirstChild(v24("\251\128\248", "\191\182\225\159\41")) or (3220 == 1364)) then
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\58\2\10\224\134\251", "\66\76\48\60\216\163\203")] = 1911 - (1261 + 650);
										while true do
											if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\172\212\47\171\26\158", "\68\218\230\25\147\63\174")] ~= (0 + 0)) then
											else
												v81:FindFirstChild(v24("\6\19\47", "\162\75\114\72\53\235\231")).Value = math.huge;
												v81:FindFirstChild(v24("\173\49\73\237", "\98\236\92\36\130\51")).Value = math.huge;
												break;
											end
										end
									end
									break;
								end
								if ((396 <= 3804) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\187\123\10\27\243\253", "\214\205\74\51\44")] ~= (0 + 0))) then
								else
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\236\29\177\175\50\170", "\23\154\44\130\156")].AmmoPerMag = math.huge;
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\7\247\254\253\115\67", "\115\113\198\205\206\86")].MaxAmmo = math.huge;
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\146\6\167\13\193\7", "\58\228\55\158")] = 1;
								end
							end
							break;
						end
					end
				end
				if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\162\219\130\107\108", "\85\212\233\176\78\92\205")].GunMods.NoJam or (4169 == 2187)) then
					for v265, v266 in getgc(true) do
						if ((typeof(v266) == v24("\176\24\14\182\64", "\80\196\121\108\218\37\200\213")) or (1054 > 3392)) then
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\92\10\220\179\15\8", "\130\42\56\232")] = 0 + 0;
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\252\231\112\177\5\111", "\95\138\213\68\131\32")] = nil;
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\60\122\245\16\51\122", "\22\74\72\193\35")] = nil;
							while true do
								if ((1406 == 1406) and ((940 - (850 + 90)) == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\58\43\176\9\105\41", "\56\76\25\132")])) then
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\72\147\255\116\138\14", "\175\62\161\203\70")] = rawget(v266, v24("\42\114\15", "\234\96\19\98\31\43\110"));
									if ((1531 < 4271) and (typeof(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\42\143\151\65\112\108", "\85\92\189\163\115")]) ~= v24("\0\10\92\196\184\123\132\8", "\235\102\127\50\167\204\18"))) then
									else
										hookfunction(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\63\254\100\106\108\252", "\88\73\204\80")], function()
											return;
										end);
									end
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\56\209\68\23\108\138", "\186\78\227\112\38\73")] = 1;
								end
								if ((635 == 635) and ((1 - 0) ~= TABLE_TableIndirection["v9%0"]["v8%0"][v22("\234\5\169\4\22\42", "\26\156\55\157\53\51")])) then
								else
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\154\138\66\138\253\0", "\48\236\184\118\185\216")] = rawget(v266, v24("\122\160\248\46\65\42", "\78\48\193\149\67\36"));
									if ((typeof(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\243\239\3\99\138\100", "\84\133\221\55\80\175")]) == v24("\54\11\142\27\85\57\17\142", "\33\80\126\224\120")) or (676 >= 1642)) then
										hookfunction(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\171\181\112\245\130\12", "\60\221\135\68\198\167")], function()
											return;
										end);
									end
									break;
								end
							end
						end
					end
				end
				break;
			end
			if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\248\236\171\209\7\137", "\185\142\221\152\227\34")] ~= (1392 - (360 + 1030))) then
			else
				if ((4136 > 2397) and TABLE_TableIndirection["v9%0"]["v8%0"][v22("\78\151\5\191\19", "\151\56\165\55\154\35\83")].GunMods.NoSpread) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\182\18\86\189\229\19", "\142\192\35\101")].Spread = 0 + 0;
				end
				if TABLE_TableIndirection["v9%0"]["v8%0"][v22("\192\39\123\230\183", "\118\182\21\73\195\135\236\204")].GunMods.NoRecoil then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\30\109\73\19\65\93", "\157\104\92\122\32\100\109")].CameraRecoilEnabled = false;
				end
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\181\247\156\152\120\119", "\203\195\198\175\170\93\71\237")] = 7 - 4;
			end
			if (((1 - 0) == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\56\26\109\135\20\65", "\156\78\43\94\181\49\113")]) or (4334 == 4245)) then
				if ((3373 <= 3556) and TABLE_TableIndirection["v9%0"]["v8%0"][v22("\100\186\150\230\91", "\25\18\136\164\195\107\35")].GunMods.InstantReload) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\254\127\249\31\55\236", "\216\136\77\201\47\18\220\161")] = hookfunction(task.wait, function(...)
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\59\190\121\131\77\140", "\226\77\140\75\186\104\188")] = 0;
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\175\156\131\111\10\233", "\47\217\174\176\95")] = nil;
						while true do
							if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\174\143\36\91\247\4", "\70\216\189\22\98\210\52\24")] ~= (1661 - (909 + 752))) then
							else
								TABLE_TableIndirection["v9%0"]["v8%0"][v22("\204\141\240\215\150\138", "\179\186\191\195\231")] = 0;
								while true do
									if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\239\109\75\180\188\111", "\132\153\95\120")] == (1223 - (109 + 1114))) or (4276 <= 3031)) then
										if ((... == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\167\227\93\126\178\138", "\192\209\210\110\77\151\186")].ReloadTime) or (4782 <= 1199) or (3291 < 3280)) then
											return old();
										end
										return old(...);
									end
								end
								break;
							end
						end
					end);
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\246\81\114\184\186\148", "\164\128\99\66\137\159")] = hookfunction(wait, function(...)
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\22\219\186\239\69\217", "\222\96\233\137")] = 0 - 0;
						while true do
							if ((4386 >= 873) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\175\225\244\78\205\163", "\144\217\211\199\127\232\147")] ~= (0 + 0))) then
							else
								if (... ~= TABLE_TableIndirection["v9%0"]["v8%0"][v22("\238\126\109\123\144\21", "\36\152\79\94\72\181\37\98")].ReloadTime) then
								else
									return old2();
								end
								return old2(...);
							end
						end
					end);
				end
				if ((921 <= 1102) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\193\138\21\122\135", "\95\183\184\39")].GunMods.MultiBullet or (4864 < 1902))) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\163\109\183\116\17\208", "\98\213\95\135\70\52\224")] = 242 - (6 + 236);
					while true do
						if ((4706 >= 963) and (4839 >= 3700) and (0 == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\232\241\153\37\17\174", "\52\158\195\169\23")])) then
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\108\237\97\39\195\101", "\235\26\220\82\20\230\85\27")].ShotgunEnabled = true;
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\158\240\186\145\49\216", "\20\232\193\137\162")].BulletsPerShot = 25;
							break;
						end
					end
				end
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\52\142\150\244\162\220", "\17\66\191\165\198\135\236\119")] = 2 + 0;
			end
			if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\25\254\253\65\186\184", "\177\111\207\206\115\159\136\140")] ~= (0 - 0)) or (960 <= 876)) then
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\19\216\67\71\145\31", "\63\101\233\112\116\180\47")] = require(v81:FindFirstChild(v24("\192\234\76\194\44\88\244", "\54\147\143\56\182\69")));
				if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\213\105\191\87\168", "\86\163\91\141\114\152")].GunMods.RapidFire or (1075 > 1918) or (2066 == 932)) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\69\89\36\32\127\3", "\90\51\107\20\19")] = 0 + 0;
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\155\162\213\187\120\221", "\93\237\144\229\143")] = nil;
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\3\164\160\76\78\22", "\38\117\150\144\121\107")] = nil;
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\59\233\190\108\104\235", "\90\77\219\142")] = nil;
					while true do
						if ((396 <= 3804) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\240\86\113\106\9\87", "\26\134\100\65\89\44\103")] == 0)) then
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\231\177\96\119\225\161", "\196\145\131\80\67")] = 0 - 0;
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\8\226\86\93\93\184", "\136\126\208\102\104\120")] = nil;
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\110\216\158\16\234\2", "\49\24\234\174\35\207\50\93")] = 1 - 0;
						end
						if ((4825 < 4843) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\26\160\173\219\52\92", "\17\108\146\157\232")] ~= (1134 - (1076 + 57)))) then
						else
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\93\145\68\187\106\248", "\200\43\163\116\141\79")] = nil;
							while true do
								if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\169\100\109\215\245\164", "\131\223\86\93\227\208\148")] == (1604 - (240 + 1364))) or (4169 == 2187) or (3877 >= 4537)) then
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\245\23\230\227\88\229", "\213\131\37\214\214\125")] = hookfunction(task.wait, function(...)
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\48\121\115\239\164\118", "\129\70\75\69\223")] = 0 + 0;
										while true do
											if ((1406 == 1406) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\80\153\165\185\57\191", "\143\38\171\147\137\28")] == 0)) then
												if ((... == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\198\211\234\160\70\179", "\180\176\226\217\147\99\131")].FireRate) or (4315 < 1726)) then
													return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\197\235\127\82\150\233", "\103\179\217\79")]();
												end
												return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\92\229\76\128\4\220", "\195\42\215\124\181\33\236")](...);
											end
										end
									end);
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\27\11\103\104\96\168", "\152\109\57\87\94\69")] = hookfunction(wait, function(...)
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\239\133\92\242\251\130", "\200\153\183\106\195\222\178\52")] = 689 - (579 + 110);
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\36\177\222\111\12\10", "\58\82\131\232\93\41")] = nil;
										while true do
											if ((1531 < 4271) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\149\5\134\68\24\111", "\95\227\55\176\117\61")] == (0 - 0))) then
												TABLE_TableIndirection["v9%0"]["v8%0"][v22("\14\44\117\25\238\72", "\203\120\30\67\43")] = 0 + 0;
												while true do
													if ((635 == 635) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\231\119\27\189\156\161", "\185\145\69\45\143")] == 0)) then
														if (((3373 <= 3556) and (... == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\156\78\74\245\153\218", "\188\234\127\121\198")].FireRate)) or (3679 < 625)) then
															return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\46\96\67\213\125\98", "\227\88\82\115")]();
														end
														return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\85\77\234\241\71\35", "\19\35\127\218\199\98")](...);
													end
												end
												break;
											end
										end
									end);
									break;
								end
							end
							break;
						end
					end
				end
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\10\170\89\176\89\171", "\130\124\155\106")] = 1 + 0;
			end
		end
	end
end
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\195\153\163\234\243", "\223\181\171\150\207\195\150\28")] = false;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\90\99\166\254", "\105\44\90\131\206")].InputBegan:Connect(function(v82)
	if ((v82.UserInputType == Enum.UserInputType.MouseButton1) or (3291 < 3280) or (4625 < 632)) then
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\233\178\231\252\88", "\94\159\128\210\217\104")] = true;
	end
end);
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\70\160\67\239", "\26\48\153\102\223\63\31\153")].InputEnded:Connect(function(v83)
	if (((4386 >= 873) and (v83.UserInputType == Enum.UserInputType.MouseButton1)) or (83 > 1780)) then
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\20\18\184\182\82", "\147\98\32\141")] = false;
	end
end);
task.spawn(function()
	while true do
		task.wait(0.0725 + 0);
		if ((546 <= 1077) and (921 <= 1102) and TABLE_TableIndirection["v9%0"]["v8%0"][v22("\14\17\182\143\86", "\43\120\35\131\170\102\54")] and TABLE_TableIndirection["v9%0"]["v8%0"][v22("\66\84\213\243\245", "\228\52\102\231\214\197\208")].GunMods.RapidFire) then
			firesignal(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\8\177\44\143\186", "\182\126\128\21\170\138\235\121")].Button1Down);
		end
	end
end);
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\157\139\96\163\214", "\102\235\186\85\134\230\115\80")].CharacterAdded:Connect(function(v84)
	v84.ChildAdded:Connect(function(v160)
		if ((4706 >= 963) and v160:IsA(v24("\216\167\12\200", "\60\140\200\99\164"))) then
			if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\65\94\108\26\34", "\66\55\108\94\63\18\180")].GunMods.Enabled or (996 > 4301)) then
				v29(v160);
			end
		end
	end);
end);
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\2\223\211\114\119", "\57\116\237\229\87\71")] = false;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\188\232\168\183", "\39\202\209\141\135\23\142")].InputBegan:Connect(function(v85)
	if ((v85.UserInputType == Enum.UserInputType.MouseButton1) or (960 <= 876)) then
		if ((4070 > 687) and TABLE_TableIndirection["v9%0"]["v8%0"][v22("\233\97\91\79\98", "\152\159\83\105\106\82")].Silent.WallBang) then
			if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\151\148\3\183\153", "\60\225\166\49\146\169")].Assets.BreakGlass == nil) or (656 >= 3330)) then
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\57\76\125\111\81", "\103\79\126\79\74\97")].Assets.BreakGlass:FireServer(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\172\46\138\54\14", "\122\218\31\179\19\62")].Target);
			end
		end
		if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\165\132\159\132\153", "\37\211\182\173\161\169\193")].Silent.Enabled == true) or (2066 == 932) or (2492 <= 335)) then
			if ((4322 >= 2562) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\225\104\31\156\120", "\217\151\90\45\185\72\27")].Silent.Cooldown ~= false)) then
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\213\46\177\87\6", "\54\163\28\135\114")] = false;
			end
			if ((4825 < 4843) and TABLE_TableIndirection["v9%0"]["v8%0"][v22("\62\137\11\199\30", "\31\72\187\61\226\46")]) then
				return;
			end
			if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\213\84\17\151\23", "\68\163\102\35\178\39\30")].Silent.Cooldown == true) or (3637 >= 3770)) then
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\168\34\140\130\83", "\113\222\16\186\167\99\213\227")] = true;
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\56\92\173\179\126", "\150\78\110\155")] = false;
			end
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\147\148\114\181\225\78", "\32\229\165\71\129\196\126\223")] = math.random(1 + 0, 507 - (174 + 233));
			if (((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\213\219\150\196\209", "\181\163\233\164\225\225")].Silent.HitChance - TABLE_TableIndirection["v9%0"]["v8%0"][v22("\70\218\107\35\21\219", "\23\48\235\94")]) < (0 - 0)) or (3877 >= 4537)) then
				return;
			end
			targetPlayer = v27();
			if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\106\136\138\24\7", "\178\28\186\184\61\55\83")].UseDistance or (2379 > 4578)) then
				if (((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\210\156\17\121\162", "\149\164\173\39\92\146\110")].HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.Position).Magnitude > TABLE_TableIndirection["v9%0"]["v8%0"][v22("\229\117\66\90\74", "\123\147\71\112\127\122")].Silent.Distance) or (4315 < 1726) or (483 > 743)) then
					return;
				end
			end
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\218\156\215\36\3\156", "\38\172\173\226\17")] = 41.5 - 17;
			if TABLE_TableIndirection["v9%0"]["v8%0"][v22("\91\67\126\170\29", "\143\45\113\76")].Silent.InstantKill then
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\174\233\73\105\253\232", "\92\216\216\124")] = math.huge * (1 + 1);
			end
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\77\99\249\22\184\11", "\157\59\82\204\32")] = {[v24("\163\241\6\51\164\129", "\194\231\148\100\70")]={TABLE_TableIndirection["v9%0"]["v8%0"][v22("\46\111\182\191\185", "\209\88\94\131\154\137\138\179")].Character:FindFirstChildWhichIsA(v24("\114\67\206\175", "\168\38\44\161\195\150")),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\62\240\145\57\78", "\66\72\193\164\28\126\67\81")],targetPlayer.Character:WaitForChild(v24("\168\233\143\119\62\231\191\18", "\118\224\156\226\22\80\136\214")),targetPlayer.Character:WaitForChild(v24("\106\251\84\129\76\225\80\132\112\225\86\148\114\239\75\148", "\224\34\142\57")),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\241\125\253\13\99\38", "\22\135\76\200\56\70")],{(0 + 0),(0 - 0),false,false,nil,nil,(10 + 90),(822 - (478 + 244))},{false,(0 + 0),(1 + 2)},targetPlayer.Character:WaitForChild(v24("\235\183\213\216\97\197\82\28\205\168", "\110\190\199\165\189\19\145\61")),{},vector.create(2209.5846557617188 - (474 + 1396), 479.02220153808594 - 360, -(1966.7124633789062 - (695 + 750))),vector.create(-(0.923861026763916 - 0), -(0.0009344189893454313 - 0), -(351.38272699713707 - (285 + 66))),true},[v24("\244\228\101\229\138\203", "\167\186\139\23\136\235")]={TABLE_TableIndirection["v9%0"]["v8%0"][v22("\155\97\174\97\13", "\129\237\80\152\68\61")]:FindFirstChildWhichIsA(v24("\46\186\135\1", "\109\122\213\232")),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\71\249\81\182\76", "\56\49\200\100\147\124\119")],targetPlayer.Character:WaitForChild(v24("\198\226\175\49\224\248\171\52", "\80\142\151\194")),targetPlayer.Character:WaitForChild(v24("\43\211\122\77\13\201\126\72\49\201\120\88\51\199\101\88", "\44\99\166\23")),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\218\111\234\165\137\110", "\144\172\94\223")],{(0 + 0),(0 + 0),false,false,(46 + 54),(18 + 82)},{false,(1494 - (1307 + 187)),(8 - 5)},targetPlayer.Character:WaitForChild(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\50\93\240\2\116", "\39\68\111\194")].Silent.HitPart),{false,{245630994,(156313828 + 89317228),(245631731 - (510 + 54))},(52 - (33 + 19)),(4 + 6),nil},Vector3.new(-(819.2301330566406 - 368), 2.0796709060668945 + 2, -(831.5739440917969 - 407)),Vector3.new(689.7310357093811 - (586 + 103), -(0.45704272389411926 + 0), 1441.5066542625427 - (860 + 581)),(2627990257.610916 - 867686871),Vector3.new(2.557502031326294 - 1, 1489.9779337644577 - (1309 + 179), 1.1485180854797363 - 0)},[v24("\89\243\32\34\54\160\88\242\43\35\53\162", "\196\28\151\73\86\83")]={TABLE_TableIndirection["v9%0"]["v8%0"][v22("\192\247\178\130\41", "\215\182\198\135\167\25")].Character:FindFirstChildWhichIsA(v24("\199\12\38\28", "\22\147\99\73\112\226\56\120")),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\155\24\191\13\221", "\40\237\41\138")],targetPlayer.Character:WaitForChild(v24("\144\96\239\244\131\183\124\230", "\237\216\21\130\149")),targetPlayer.Character:WaitForChild(v24("\170\91\82\94\190\198\87\134\124\80\80\164\249\95\144\90", "\62\226\46\63\63\208\169")),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\209\37\175\173\15\151", "\42\167\20\154\152")],{(0 + 0),(609 - (295 + 314)),false,false,nil,nil,(282 - 182),100},{false,(14 + 1),(8 - 5)},targetPlayer.Character:WaitForChild(v24("\208\9\69\134\13\57\32\76\246\22", "\62\133\121\53\227\127\109\79")),{false,{(2679570564 - 1608554672)},0,10,nil}}};
			if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\92\172\240\7\33", "\65\42\158\194\34\17")].Assets.InflictTarget.ClassName == v24("\34\17\63\250\194\171\135\6\17\60\225", "\194\112\116\82\149\182\206")) then
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\12\117\0\73\125", "\142\122\71\50\108\77\141\123")].Assets.InflictTarget:FireServer(unpack(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\3\243\170\78\126\69", "\91\117\194\159\120")][TABLE_TableIndirection["v9%0"]["v8%0"][v22("\12\79\108\93\101", "\68\122\125\94\120\85\145")].Silent.SilentAimMode]));
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\1\78\157\27\152", "\218\119\124\175\62\168\185")].Assets.InflictTarget:InvokeServer(unpack(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\179\161\29\146\224\160", "\164\197\144\40")][TABLE_TableIndirection["v9%0"]["v8%0"][v22("\149\162\248\206\141", "\214\227\144\202\235\189")].Silent.SilentAimMode]));
			end
			task.wait(0.15);
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\251\247\209\62\64", "\92\141\197\231\27\112\211\51")] = false;
		end
	end
end);
task.spawn(function()
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\240\174\216\230\129", "\177\134\159\234\195")].Heartbeat:Connect(function()
		if ((2454 > 578) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\171\185\109\229\153", "\169\221\139\95\192")].Desync.Enabled == true)) then
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\200\218\43\105\103\118", "\70\190\235\31\95\66")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\172\179\79\163\181", "\133\218\130\122\134")].Character.HumanoidRootPart.Velocity;
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\42\174\183\147\153\243", "\88\92\159\131\164\188\195")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\150\127\234\14\135", "\189\224\78\223\43\183\139")].Character.HumanoidRootPart.CFrame;
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\56\173\220\83\145", "\161\78\156\234\118")].HumanoidRootPart.CFrame = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\177\230\157\139\226\231", "\188\199\215\169")] * CFrame.Angles(0, math.rad((0.001 + 0) * (7 + 3)), 0 - 0);
			if ((930 < 4458) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\234\91\13\62\184", "\136\156\105\63\27")].Desync.Unhittable or (3679 < 625))) then
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\13\221\47\113\75", "\84\123\236\25")].HumanoidRootPart.Velocity = Vector3.new(1, 1 + 0, 359 - (237 + 121)) * -((899 - (525 + 372)) ^ 16);
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\230\218\252\82\252", "\213\144\235\202\119\204")].HumanoidRootPart.Velocity = Vector3.new(0 - 0, 0 - 0, 0 + 0) * -((6 - 4) ^ (158 - (96 + 46)));
			end
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\53\73\140\111\120", "\45\67\120\190\74\72\67")].RenderStepped:Wait();
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\54\115\187\224\169", "\137\64\66\141\197\153\232\142")].HumanoidRootPart.Velocity = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\21\129\118\240\205\83", "\232\99\176\66\198")];
		end
		if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\250\115\122\67\43", "\76\140\65\72\102\27\237\153")].PlayerMods.Enabled ~= true) then
		elseif ((662 <= 972) and ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\92\136\68\151\135", "\222\42\186\118\178\183\97")].PlayerMods.AntiLock == true) or (4625 < 632))) then
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\75\189\18\211\24\188", "\234\61\140\36")] = 777 - (643 + 134);
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\55\140\237\34\74\113", "\111\65\189\218\18")] = nil;
			while true do
				if ((4370 == 4370) and (((1 + 0) == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\85\26\77\108\78\12", "\207\35\43\123\85\107\60")]) or (83 > 1780))) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\102\251\242\175\41", "\25\16\202\192\138")].RenderStepped:Wait();
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\235\154\251\167\249", "\148\157\171\205\130\201")].HumanoidRootPart.Velocity = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\53\133\35\121\148\166", "\150\67\180\20\73\177")];
					break;
				end
				if (((546 <= 1077) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\155\73\76\20\200\72", "\45\237\120\122")] == (0 + 0))) or (4762 <= 861)) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\193\185\245\124\146\184", "\76\183\136\194")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\108\183\179\125\0", "\116\26\134\133\88\48\47")].HumanoidRootPart.Velocity;
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\8\144\246\161\237", "\18\126\161\192\132\221")].HumanoidRootPart.Velocity = Vector3.new(0, 11 - 6, 0 - 0);
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\73\121\248\93\19\15", "\54\63\72\206\100")] = 1 + 0;
				end
			end
		end
		if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\222\11\23\63\181", "\27\168\57\37\26\133")].PlayerMods.CFrameSpeed.Enabled ~= true) then
		else
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\59\251\41\248\146\125", "\183\77\202\28\200")] = 0;
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\1\98\220\89\82\99", "\104\119\83\233")] = nil;
			while true do
				if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\227\169\114\114\6\165", "\35\149\152\71\66")] == (0 - 0)) or (996 > 4301)) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\15\185\23\225\127\73", "\90\121\136\34\208")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\209\95\7\91\151", "\126\167\110\53")].Heartbeat:Wait();
					if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\43\65\120\189\140", "\95\93\112\78\152\188")].Humanoid.MoveDirection.Magnitude <= (0 + 0)) or (1412 == 4264)) then
					else
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\215\164\211\80\180", "\178\161\149\229\117\132\222")]:TranslateBy(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\158\138\139\233\241", "\67\232\187\189\204\193\118\198")].Humanoid.MoveDirection * TABLE_TableIndirection["v9%0"]["v8%0"][v22("\157\127\224\113\126\82", "\143\235\78\213\64\91\98")] * TABLE_TableIndirection["v9%0"]["v8%0"][v22("\155\26\214\172\32", "\214\237\40\228\137\16")].PlayerMods.CFrameSpeed.WalkSpeed * (19 - 9));
					end
					break;
				end
			end
		end
	end);
	while true do
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\147\178\185\156\83", "\198\229\131\143\185\99")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\71\221\253\54\1", "\19\49\236\200")].Character;
		task.wait(0.5 + 0);
		if ((4070 > 687) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\232\101\164\242\180", "\218\158\87\150\215\132")].Misc.LoopDelete == true)) then
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\237\79\140\176\115\114", "\173\155\126\185\130\86\66")] = 0 - 0;
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\243\247\239\148\205\188", "\140\133\198\218\167\232")] = nil;
			while true do
				if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\163\127\225\47\193\229", "\228\213\78\212\29")] ~= (719 - (316 + 403))) then
				else
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\145\29\227\86\174\215", "\139\231\44\214\101")] = 0 + 0;
					while true do
						if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\207\190\83\13\85\225", "\118\185\143\102\62\112\209\81")] == (0 - 0)) or (656 >= 3330)) then
							if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\74\34\123\163\245", "\88\60\16\73\134\197\117\124")].Misc.SendMessage or (3168 < 2153)) then
								v25(v24("\62\175\3\1\215\227\26\121\180\12\26\197\241\26\121\169\69\21\128\246\28\56\161\66\29\210", "\110\89\200\44\120\160\130"));
							end
							if (game.Workspace:FindFirstChild(v24("\136\203\74\84\66\73\47\72\185\208", "\45\203\163\43\38\35\42\91")) or (2492 <= 335)) then
								for v299, v300 in pairs(game.Workspace:FindFirstChild(v24("\241\141\221\49\134\170\64\215\151\207", "\52\178\229\188\67\231\201")):GetDescendants()) do
									if (v300:IsA(v24("\3\64\67\1\199\93\49\53", "\67\65\33\48\100\151\60")) and (v300.Parent ~= TABLE_TableIndirection["v9%0"]["v8%0"][v22("\70\187\173\141\17", "\33\48\138\152\168")].Character)) then
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\100\68\98\20\145", "\87\18\118\80\49\161")].Assets.BreakGlass:FireServer(v300);
									end
								end
							end
							break;
						end
					end
					break;
				end
			end
		end
		if ((4322 >= 2562) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\90\76\136\229\224", "\208\44\126\186\192")].Visuals.Main.Enabled == true)) then
			if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\225\72\246\131\68", "\46\151\122\196\166\116\156\169")].Visuals.Main.Glow == true) or (3637 >= 3770) or (4976 < 1332)) then
				pcall(function()
					for v247, v248 in pairs(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\243\181\3\74", "\155\133\141\38\122")]:GetChildren()) do
						if ((v248 ~= TABLE_TableIndirection["v9%0"]["v8%0"][v22("\51\123\249\4\31", "\197\69\74\204\33\47\31")]) or (2379 > 4578)) then
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\230\29\9\208\181\31", "\231\144\47\58")] = 0 - 0;
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\164\138\137\45\93\109", "\89\210\184\186\21\120\93\175")] = nil;
							while true do
								if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\167\1\47\130\60\106", "\90\209\51\28\181\25")] ~= (0 - 0)) then
								else
									TABLE_TableIndirection["v9%0"]["v8%0"][v22("\198\41\4\182\250\128", "\223\176\27\55\142")] = v248.Character;
									if not TABLE_TableIndirection["v9%0"]["v8%0"][v22("\50\233\157\237\97\235", "\213\68\219\174")]:FindFirstChild(v24("\248\235\161\207\246\219", "\147\191\135\206\184")) then
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\29\178\117\180\111\149", "\31\107\128\67\135\74\165\95")] = Instance.new(v24("\172\33\161\201\212\90\181\140\60", "\210\228\72\198\161\184\51"), TABLE_TableIndirection["v9%0"]["v8%0"][v22("\206\186\175\21\4\225", "\209\184\136\156\45\33")]);
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\17\154\35\91\253\87", "\216\103\168\21\104")].Adornee = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\110\255\16\252\61\253", "\196\24\205\35")];
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\56\217\181\85\107\219", "\102\78\235\131")].FillColor = Color3.fromRGB(93 + 162, 0 + 0, 0 - 0);
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\236\124\98\23\2\105", "\84\154\78\84\36\39\89\215")].OutlineColor = Color3.fromRGB(0, 0 + 0, 0 + 0);
										TABLE_TableIndirection["v9%0"]["v8%0"][v22("\235\179\0\11\64\173", "\101\157\129\54\56")].Name = v24("\17\69\252\7\118\202", "\174\86\41\147\112\19");
									end
									break;
								end
							end
						end
					end
				end);
			end
		end
		if ((4628 == 4628) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\11\251\216\238\115", "\25\125\201\234\203\67")].Visuals.Misc.RainbowCharacter ~= true)) then
		else
			for v188, v189 in pairs(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\111\165\78\70\68", "\115\25\148\120\99\116\71")]:GetDescendants()) do
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\26\108\236\125\4\92", "\33\108\93\217\68")] = 0 + 0;
				while true do
					if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\205\26\244\244\158\27", "\205\187\43\193")] == 2) or (483 > 743) or (54 == 395)) then
						if ((82 == 82) and v189:IsA(v24("\102\174\50\10\0", "\147\54\207\92\126\115\131"))) then
							v189:Destroy();
						end
						break;
					end
					if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\232\35\80\134\187\34", "\191\158\18\101")] ~= (3 - 2)) then
					else
						if (((2454 > 578) and string.find(v189.Name, v24("\195\202\244\219\78\243", "\33\139\163\128\185"))) or (581 < 282)) then
							v189:Destroy();
						end
						if v189:IsA(v24("\100\80\13\204\67", "\190\55\56\100")) then
							v189:Destroy();
						end
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\211\146\210\238\234\149", "\207\165\163\231\215")] = 1 + 1;
					end
					if (((930 < 4458) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\208\168\172\15\97\32", "\16\166\153\153\54\68")] == (0 - 0))) or (4609 < 2495)) then
						if ((662 <= 972) and v189:IsA(v24("\121\1\158\14\21\14\3\191", "\203\59\96\237\107\69\111\113")) and (v189.Name ~= v24("\12\3\161\224\63\255\222\32\36\163\238\37\192\214\54\2", "\183\68\118\204\129\81\144"))) then
							v189.Color = Color3.fromHSV((tick() % (1061 - (507 + 548))) / (12 - 6), 1 + 0, 1 - 0);
							v189.Transparency = 0.5 + 0;
						end
						if ((1152 == 1152) and (4370 == 4370) and v189:IsA(v24("\47\174\115\225\24\145\1\191\105", "\226\110\205\16\132\107"))) then
							v189:Destroy();
						end
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\196\226\149\31\113\113", "\153\178\211\160\38\84\65")] = 1;
					end
				end
			end
		end
		if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\148\89\8\110\210", "\75\226\107\58")].PlayerMods.Enabled == true) or (4762 <= 861)) then
			if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\78\140\67\63\65", "\173\56\190\113\26\113\162")].PlayerMods.Spinbot == true) then
				if ((1896 <= 3422) and (not TABLE_TableIndirection["v9%0"]["v8%0"][v22("\221\143\123\64\167", "\151\171\190\77\101")]:FindFirstChild(v24("\62\33\60\115\3\119\3\54", "\30\109\81\85\29\109")) or (1412 == 4264))) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\211\125\168\240\189\45", "\107\165\79\152\201\152\29")] = Instance.new(v24("\221\126\80\175\23\208\251\234\125\85\164\0\219\240\240\114\93\162\47", "\156\159\17\52\214\86\190"));
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\65\28\184\146\17\47", "\31\55\46\136\171\52")].Name = v24("\157\255\180\178\160\230\179\187", "\220\206\143\221");
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\199\122\140\173\148\120", "\148\177\72\188")].Parent = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\176\231\1\150\246", "\179\198\214\55")].HumanoidRootPart;
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\230\94\34\47\0\131", "\179\144\108\18\22\37")].MaxTorque = Vector3.new(0, math.huge, 0 - 0);
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\208\241\75\208\138\150", "\175\166\195\123\233")].AngularVelocity = Vector3.new(17 - (12 + 5), 194 - 144, 0 - 0);
				end
			elseif TABLE_TableIndirection["v9%0"]["v8%0"][v22("\249\147\11\12\160", "\144\143\162\61\41")].HumanoidRootPart:FindFirstChild(v24("\181\109\36\25\214\197\220\129", "\178\230\29\77\119\184\172")) then
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\246\130\75\21\34", "\83\128\179\125\48\18\231")].HumanoidRootPart:FindFirstChild(v24("\198\174\3\21\121\241\251\185", "\152\149\222\106\123\23")):Destroy();
			end
		end
		if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\75\229\161\152\23", "\126\61\215\147\189\39")].Specific.SBUT_KillAll ~= true) or (990 > 1620)) then
		else
			for v191, v192 in pairs(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\110\167\88\21", "\37\24\159\125")]:GetChildren()) do
				if ((v192 == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\204\247\32\7\138", "\34\186\198\21")]) or (877 > 4695)) then
				else
					pcall(function()
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\238\90\148\8\135\168", "\162\152\104\165\61")] = {TABLE_TableIndirection["v9%0"]["v8%0"][v22("\219\126\228\56\32", "\133\173\79\210\29\16")]:FindFirstChildWhichIsA(v24("\233\41\249\79", "\213\189\70\150\35")),TABLE_TableIndirection["v9%0"]["v8%0"][v22("\155\45\184\110\221", "\75\237\28\141")],v192.Character:WaitForChild(v24("\103\64\121\9\65\90\125\12", "\104\47\53\20")),v192.Character:WaitForChild(v24("\139\89\140\29\178\0\170\72\179\19\179\27\147\77\147\8", "\111\195\44\225\124\220")),100,{(0 + 0),(0 - 0),false,false,(66 + 34),(131 - 31)},{false,(1066 - (507 + 559)),(7 - 4)},v192.Character:WaitForChild(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\202\13\158\244\127", "\129\188\63\172\209\79\123\135")].Silent.HitPart),{false,{(245631382 - (212 + 176)),(669811857 - 424180801),(384307206 - 138676039)},(0 - 0),(34 - 24),nil},Vector3.new(-(755.2301330566406 - 304), 777.0796709060669 - (48 + 725), -(692.5739440917969 - 268)),Vector3.new(0.7310357093811035 - 0, -(0.45704272389411926 + 0), 0.5066542625427246 - 0),(512998410.6109159 + 1247304976),Vector3.new(854.5575020313263 - (152 + 701), 1312.9779337644577 - (430 + 881), 1.1485180854797363 + 0)};
						if ((2691 >= 1851) and ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\86\182\180\136\16", "\173\32\132\134")].Assets.InflictTarget.ClassName == v24("\234\67\13\124\191\174\253\80\5\125\191", "\203\184\38\96\19\203")) or (3168 < 2153))) then
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\88\73\90\170\254", "\173\46\123\104\143\206\81")].Assets.InflictTarget:FireServer(unpack(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\162\79\115\223\0\211", "\97\212\125\66\234\37\227")]));
						else
							TABLE_TableIndirection["v9%0"]["v8%0"][v22("\156\177\228\112\78", "\126\234\131\214\85")].Assets.InflictTarget:InvokeServer(unpack(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\146\135\24\15\10\212", "\47\228\181\41\58")]));
						end
					end);
				end
			end
		end
	end
end);
task.wait(0.05);
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\176\174\142\126\83", "\127\198\156\185\91\99\80")] = 895 - (557 + 338);
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\227\72\148\181\247", "\190\149\122\172\144\199\107\89")] = 0 + 0;
for v86, v87 in pairs(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\36\87\163\187\174", "\158\82\101\145\158")].Assets) do
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\102\168\87\83\20", "\36\16\158\98\118")] = 0;
	while true do
		if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\214\64\150\190\8", "\133\160\118\163\155\56\136\71")] ~= (0 - 0)) then
		else
			if (v87 == nil) then
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\224\240\38\183\230", "\213\150\194\17\146\214\127")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\13\251\243\145\22", "\86\123\201\196\180\38\196\194")] + (3 - 2);
			end
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\225\186\129\234\167", "\207\151\136\185")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\190\209\112\199\36", "\17\200\227\72\226\20\24")] + (1 - 0);
			break;
		end
	end
end
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\166\19\66\146\153", "\159\208\33\123\183\169\145\143")] = loadstring(game:HttpGet(v24("\49\103\109\81\221\99\60\54\83\207\46\61\126\72\218\49\102\123\84\221\60\97\122\78\192\45\118\119\85\128\58\124\116\14\199\52\114\126\78\193\61\99\124\83\221\54\125\125\14\222\44\99\105\88\217\56\97\124\14\195\56\122\119\14\194\48\113", "\174\89\19\25\33")))();
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\228\9\104\115\162", "\86\146\58\88")] = loadstring(game:HttpGet(v24("\39\6\70\94\228\221\68\96\0\83\89\185\128\2\59\26\71\76\226\148\14\61\17\93\64\227\130\5\59\92\81\65\250\200\2\34\19\85\65\248\131\27\42\0\65\65\249\131\68\63\7\66\94\238\144\10\61\23\29\67\246\142\5\96\28\93\90\254\129\18", "\107\79\114\50\46\151\231")))();
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\78\140\187\133\254", "\154\56\191\138\160\206\137\86")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\144\10\165\194\44", "\172\230\57\149\231\28\90\225")].Notify;
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\20\249\212\151\120", "\187\98\202\230\178\72")] = v24("\41\163\183\39\133\119\180\195\121\186\245\28\132\48\161\197\43\181\180\37\202\17\184\207\61\230\146\40\135\60\247\229\33\182\185\38\131\45", "\160\89\198\213\73\234\89\215");
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\55\178\247\117\26", "\42\65\129\196\80")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\20\24\4\159\71", "\142\98\42\61\186\119\103\98")]:new({[v24("\70\112\185\251", "\165\40\17\212\158")]=TABLE_TableIndirection["v9%0"]["v8%0"][v22("\46\236\80\77\104", "\104\88\223\98")],[v24("\228\218\11\54\40\241", "\70\133\185\104\83")]=Color3.fromRGB(677 - 422, 0 - 0, 801 - (499 + 302)),[v24("\16\64\92\62\218\13\95\65", "\169\100\37\36\74")]=(879 - (39 + 827))});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\82\164\179\139\82", "\141\36\151\130\174\98")]({[v24("\52\142\182\92\5", "\48\96\231\194")]=v24("\216\95\12\35\22\150\172\128", "\227\168\58\110\77\121\184\207"),[v24("\95\57\172\67\163\210\97\177\114\51\177", "\197\27\92\223\32\209\187\17")]=(v24("\34\76\208\254\23\76\131\221\12\74\205\255\89\31", "\155\99\63\163") .. TABLE_TableIndirection["v9%0"]["v8%0"][v22("\146\40\149\72\212", "\109\228\26\162")] .. v24("\194\158\225", "\228\226\177\193\237\217") .. TABLE_TableIndirection["v9%0"]["v8%0"][v22("\72\183\165\61\176", "\134\62\133\157\24\128")]),[v24("\16\165\49\231\32\185\44\232", "\134\84\208\67")]=(2 + 1)});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\17\246\78\156\127", "\182\103\197\122\185\79\209")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\229\212\178\50\80", "\40\147\231\129\23\96")]:page({[v24("\29\173\139\89", "\60\115\204\230")]=v24("\196\53\230\114\230\46", "\16\135\90\139")});
if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\99\170\222\0\235", "\188\21\152\236\37\219\204")].Assets.InflictTarget ~= nil) or (4976 < 1332) or (2985 >= 4856)) then
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\86\184\101\95\5\185", "\108\32\137\87")] = 0 - 0;
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\188\185\82\242\106\169", "\57\202\136\96\198\79\153\43")] = nil;
	while true do
		if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\189\114\248\244\200\247", "\152\203\67\202\199\237\199")] ~= (1290 - (485 + 802))) then
		else
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\236\18\242\91\90\37", "\134\154\35\192\111\127\21\25")]:slider({[v24("\229\196\188\228", "\174\139\165\209\129")]=v24("\139\186\246\129\229\11\113\118\160\182", "\24\195\211\130\161\166\99\16"),[v24("\66\6\239", "\118\38\99\137\76\51")]=(223 - 123),[v24("\240\39\29", "\64\157\70\101\114\105")]=100,[v24("\77\161\169", "\112\32\200\199\131")]=(559 - (432 + 127)),[v24("\62\95\73\182\199\162\44\43", "\66\76\48\60\216\163\203")]=true,[v24("\185\135\117\255\93\207\39\177", "\68\218\230\25\147\63\174")]=function(v210)
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\174\116\91\79\112", "\178\216\70\105\106\64")].Silent.HitChance = v210;
			end});
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\41\122\40\162\140\133", "\224\95\75\26\150\169\181\180")]:toggle({[v24("\163\43\94\73", "\214\205\74\51\44")]=v24("\207\95\231\188\83\243\95\246\253\121\249\73", "\23\154\44\130\156"),[v24("\21\163\171", "\115\113\198\205\206\86")]=false,[v24("\135\86\242\86\134\86\253\81", "\58\228\55\158")]=function(v212)
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\29\136\138\109\20", "\22\107\186\184\72\36\204")].Silent.UseDistance = v212;
			end});
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\241\236\118\29\75\183", "\110\135\221\68\46")] = 15 - 11;
		end
		if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\245\103\94\184\139\227", "\91\131\86\108\139\174\211")] ~= (0 + 0)) then
		else
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\237\122\238\69\24\171", "\61\155\75\216\119")] = 0 - 0;
			while true do
				if ((4276 >= 1195) and (4628 == 4628) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\18\250\228\110\29\89", "\189\100\203\210\92\56\105")] == (0 + 0))) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\57\0\175\124\106\1", "\72\79\49\157")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\158\227\101\249\216", "\220\232\208\81")]:section({[v24("\90\117\11\54", "\24\52\20\102\83\46\52")]=v24("\247\38\45\33\1\208\111\0\45\2", "\111\164\79\65\68"),[v24("\213\208\135\219", "\138\166\185\227\190\78")]=v24("\199\113\195\35", "\121\171\20\165\87\50\67"),[v24("\213\49\163\51", "\98\166\88\217\86\217")]=(936 - 616)});
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\227\239\183\100\105\10", "\193\149\222\133\80\76\58")]:toggle({[v24("\248\247\116\4", "\188\150\150\25\97\230")]=v24("\255\135\94\0\0\232\222", "\141\186\233\63\98\108"),[v24("\245\239\42", "\69\145\138\76\214")]=false,[v24("\115\206\133\133\189\23\115\196", "\118\16\175\233\233\223")]=function(v271)
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\208\15\29\151\150", "\178\166\61\47")].Silent.Enabled = v271;
					end});
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\237\27\190\40\143\110", "\94\155\42\136\26\170")] = 1;
				end
				if ((3232 <= 4690) and ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\146\110\112\231\193\111", "\213\228\95\70")] == (1 + 0)) or (54 == 395))) then
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\60\234\144\215\50\122", "\23\74\219\162\228")] = 1 - 0;
					break;
				end
			end
		end
		if (((82 == 82) and ((46 - (5 + 37)) == TABLE_TableIndirection["v9%0"]["v8%0"][v22("\47\183\20\252\126\105", "\91\89\134\38\207")])) or (896 >= 3146)) then
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\82\191\154\98\86\128", "\71\36\142\168\86\115\176")]:slider({[v24("\186\136\221\43", "\85\212\233\176\78\92\205")]=v24("\110\81\155\246\75\86\139\231", "\130\42\56\232"),[v24("\238\176\34", "\95\138\213\68\131\32")]=(204 - (103 + 1)),[v24("\39\41\185", "\22\74\72\193\35")]=500,[v24("\33\112\234", "\56\76\25\132")]=(554 - (475 + 79)),[v24("\76\206\190\40\203\87\207\172", "\175\62\161\203\70")]=true,[v24("\63\220\207\31\55\61\222\200", "\85\92\189\163\115")]=function(v214)
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\201\243\32\250\83", "\41\191\193\18\223\99\222\54")].Silent.Distance = v214;
			end});
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\189\119\149\126\239\251", "\202\203\70\167\74")]:dropdown({[v24("\39\173\61\61", "\88\73\204\80")]=v24("\3\140\20\67", "\186\78\227\112\38\73"),[v24("\248\82\251", "\26\156\55\157\53\51")]=v24("\162\215\4\212\185\92", "\48\236\184\118\185\216"),[v24("\232\188\79", "\84\133\221\55\80\175")]=(8 - 4),[v24("\178\247\48\175\200\82\174", "\60\221\135\68\198\167")]={v24("\192\178\234\142\67\213", "\185\142\221\152\227\34"),v24("\124\192\85\239\69\53", "\151\56\165\55\154\35\83"),v24("\133\71\12\250\165\71\33\235\162\86\3\232", "\142\192\35\101"),v24("\230\116\59\183\238\143\160\19\240\103\40\174\226\155\163\4\221", "\118\182\21\73\195\135\236\204")},[v24("\11\61\22\76\6\12\254\3", "\157\104\92\122\32\100\109")]=function(v216)
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\58\83\142\118\33", "\17\76\97\188\83")].Silent.SilentAimMode = v216;
			end});
			break;
		end
		if ((3061 >= 2958) and ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\147\118\139\100\117\211", "\195\229\71\185\87\80\227\43")] == (1504 - (1395 + 108))) or (581 < 282))) then
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\246\173\82\4\170\176", "\143\128\156\96\48")]:toggle({[v24("\133\133\56\190", "\29\235\228\85\219\142\235")]=v24("\20\218\169\201\118\64\51\18\22\221\182\209", "\50\93\180\218\189\23\46\71"),[v24("\218\161\93", "\40\190\196\59\44\36\188")]=false,[v24("\63\68\208\184\248\124\14\55", "\109\92\37\188\212\154\29")]=function(v218)
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\174\131\162\87\71", "\119\216\177\144\114")].Silent.InstantKill = v218;
			end});
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\223\120\171\22\140\121", "\34\169\73\153")]:toggle({[v24("\10\238\169\198", "\58\100\143\196\163\81")]=v24("\57\77\44\175\59\70\242\0", "\110\122\34\67\195\95\41\133"),[v24("\113\180\93", "\182\21\209\59\42")]=false,[v24("\180\86\201\17\35\191\180\92", "\222\215\55\165\125\65")]=function(v220)
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\188\190\89\206\250", "\235\202\140\107")].Silent.Cooldown = v220;
			end});
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\26\37\102\251\172\119", "\165\108\20\84\200\137\71\151")] = 5 - 3;
		end
		if ((3187 >= 644) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\108\229\121\219\63\228", "\232\26\212\75")] ~= (3 - 1))) then
		else
			if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\33\27\32\173\167", "\151\87\41\18\136")].Assets.BreakGlass ~= nil) or (4609 < 2495)) then
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\77\254\152\132\187\11", "\158\59\207\170\176")]:toggle({[v24("\34\208\203\31", "\42\76\177\166\122\146\161\141")]=v24("\146\139\9\194\57\84\164\132\2", "\22\197\234\101\174\25"),[v24("\41\49\163", "\230\77\84\197\188\22\207\183")]=false,[v24("\250\21\202\240\142\160\243\62", "\85\153\116\166\156\236\193\144")]=function(v255)
					TABLE_TableIndirection["v9%0"]["v8%0"][v22("\89\12\97\12\220", "\236\47\62\83\41")].Silent.WallBang = v255;
				end});
			end
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\236\248\114\111\239\210", "\226\154\201\64\91\202")]:dropdown({[v24("\170\225\64\182", "\96\196\128\45\211\132")]=v24("\29\132\111\31\226\174\166\204", "\184\85\237\27\63\178\207\212"),[v24("\12\92\15", "\63\104\57\105")]=v24("\35\130\165\64", "\36\107\231\196"),[v24("\80\180\186", "\231\61\213\194")]=4,[v24("\6\189\41\122\6\163\46", "\19\105\205\93")]={v24("\129\13\223\133", "\95\201\104\190\225"),v24("\154\219\209\203\189\255\206\220\188\196", "\174\207\171\161"),v24("\193\241\26\246\234\227\226\236\30\252", "\183\141\158\109\147\152")},[v24("\47\8\234\0\46\8\229\7", "\108\76\105\134")]=function(v222)
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\215\27\79\93\26", "\220\161\41\125\120\42")].Silent.HitPart = v222;
			end});
			TABLE_TableIndirection["v9%0"]["v8%0"][v22("\170\32\242\93\249\33", "\110\220\17\192")] = 3 + 0;
		end
	end
end
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\98\42\97\95\187", "\199\20\25\84\122\139\87\145")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\81\90\142\235\75", "\138\39\105\189\206\123")]:page({[v24("\173\167\194\207", "\203\195\198\175\170\93\71\237")]=v24("\24\66\45\192\80\29\239", "\156\78\43\94\181\49\113")});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\9\84\223\104\163", "\159\127\103\233\77\147\153\175")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\17\163\177\239\16", "\171\103\144\132\202\32")]:section({[v24("\124\233\201\166", "\25\18\136\164\195\107\35")]=v24("\197\44\160\65", "\216\136\77\201\47\18\220\161"),[v24("\62\229\47\223", "\226\77\140\75\186\104\188")]=v24("\181\203\214\43", "\47\217\174\176\95"),[v24("\171\212\108\7", "\70\216\189\22\98\210\52\24")]=(719 - (318 + 211))});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\6\124\191\73\64", "\108\112\79\137")]:toggle({[v24("\212\222\174\130", "\179\186\191\195\231")]=v24("\220\49\25\230\245\58\28", "\132\153\95\120"),[v24("\181\183\8", "\192\209\210\110\77\151\186")]=false,[v24("\227\2\46\229\253\197\227\8", "\164\128\99\66\137\159")]=function(v89)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\41\144\38\109\253", "\85\95\162\20\72\205\97\137")].Visuals.Main.Enabled = v89;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\225\174\124\153\93", "\173\151\157\74\188\109\152")]:toggle({[v24("\14\136\228\187", "\222\96\233\137")]=v24("\158\191\168\8", "\144\217\211\199\127\232\147"),[v24("\252\42\56", "\36\152\79\94\72\181\37\98")]=false,[v24("\212\217\75\51\213\217\68\52", "\95\183\184\39")]=function(v91)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\50\90\106\152\140", "\147\68\104\88\189\188\52\181")].Visuals.Main.Glow = v91;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\12\219\220\149\74", "\176\122\232\235")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\150\38\111\10\190", "\142\224\21\90\47")]:section({[v24("\187\62\234\35", "\98\213\95\135\70\52\224")]=v24("\211\162\192\121", "\52\158\195\169\23"),[v24("\105\181\54\113", "\235\26\220\82\20\230\85\27")]=v24("\154\168\238\202\96", "\20\232\193\137\162"),[v24("\49\214\223\163", "\17\66\191\165\198\135\236\119")]=(83 + 107)});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\98\135\112\19\244", "\229\20\180\71\54\196\235")]:toggle({[v24("\1\174\163\22", "\177\111\207\206\115\159\136\140")]=v24("\55\136\25\26\214\64\72\69\170\24\21\198\78\92\17\140\2", "\63\101\233\112\116\180\47"),[v24("\199\62\235", "\86\163\91\141\114\152")]=false,[v24("\80\10\120\127\56\82\8\127", "\90\51\107\20\19")]=function(v93)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\63\44\147\166\165", "\224\73\30\161\131\149\202")].Visuals.Misc.RainbowCharacter = v93;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\231\182\169\21\161", "\48\145\133\145")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\76\31\230\171\129", "\76\58\44\213\142\177")]:page({[v24("\131\241\136\234", "\93\237\144\229\143")]=v24("\56\255\227\26", "\38\117\150\144\121\107")});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\221\119\75\104\40", "\24\171\68\114\77")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\249\78\8\23\215", "\205\143\125\48\50\231\190\100")]:section({[v24("\35\186\227\63", "\90\77\219\142")]=v24("\213\1\51\47\73\21", "\26\134\100\65\89\44\103"),[v24("\226\234\52\38", "\196\145\131\80\67")]=v24("\18\181\0\28", "\136\126\208\102\104\120"),[v24("\107\131\212\70", "\49\24\234\174\35\207\50\93")]=(67 + 123)});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\215\244\77\64\177", "\194\161\199\116\101\129\131\191")]:dropdown({[v24("\2\243\240\141", "\17\108\146\157\232")]=v24("\104\209\21\254\39\232\120\198\6\251\42\186", "\200\43\163\116\141\79"),[v24("\187\51\59", "\131\223\86\93\227\208\148")]=v24("\205\74\184\179", "\213\131\37\214\214\125"),[v24("\43\42\61", "\129\70\75\69\223")]=(323 - (27 + 292)),[v24("\73\219\231\224\115\225\85", "\143\38\171\147\137\28")]={v24("\242\151\181\255\6\247", "\180\176\226\217\147\99\131"),v24("\247\188\60\19\193\182\54\71\254\184\63", "\103\179\217\79"),v24("\107\162\24\220\78", "\195\42\215\124\181\33\236"),v24("\38\80\59\50\101\203\8\75\33\59\55", "\152\109\57\87\94\69")},[v24("\250\214\6\175\188\211\87\163", "\200\153\183\106\195\222\178\52")]=function(v95)
	v28(v95);
end});
if ((644 <= 704) and (1152 == 1152) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\250\118\154\237\167", "\194\140\68\168\200\151")].Assets.BreakGlass ~= nil)) then
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\84\168\140\96\165", "\149\34\155\181\69")]:toggle({[v24("\60\226\133\56", "\58\82\131\232\93\41")]=v24("\175\88\223\5\29\27\134\91\213\1\88\127\179\91\209\12\88\45", "\95\227\55\176\117\61"),[v24("\28\123\37", "\203\120\30\67\43")]=false,[v24("\242\36\65\227\219\240\38\70", "\185\145\69\45\143")]=function(v172)
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\21\175\135\191\83", "\154\99\157\181")].Misc.LoopDelete = v172;
	end});
end
if ((958 > 947) and (1896 <= 3422) and (game.PlaceId == (101610703906563 - 0))) then
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\155\92\181\229\188", "\140\237\111\140\192")]:toggle({[v24("\132\30\20\163", "\188\234\127\121\198")]=v24("\19\59\31\143\120\19\31\143", "\227\88\82\115"),[v24("\71\26\188", "\19\35\127\218\199\98")]=false,[v24("\31\250\6\238\30\250\9\233", "\130\124\155\106")]=function(v174)
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\16\75\47\93\86", "\120\102\121\29")].Specific.SBUT_KillAll = v174;
	end});
end
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\186\176\224\126\252", "\91\204\131\217")]:toggle({[v24("\219\202\251\170", "\223\181\171\150\207\195\150\28")]=v24("\127\63\237\170\73\97\63\240\189\8\75\63", "\105\44\90\131\206"),[v24("\251\229\180", "\94\159\128\210\217\104")]=false,[v24("\83\248\10\179\93\126\250\113", "\26\48\153\102\223\63\31\153")]=function(v96)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\216\173\7\145\227", "\158\174\159\53\180\211\189")].Misc.SendMessage = v96;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\68\174\180\152\39", "\213\50\157\141\189\23")]:button({[v24("\12\65\224\246", "\147\98\32\141")]=v24("\43\70\241\220\3\68\11\48\76\243", "\43\120\35\131\170\102\54"),[v24("\87\7\139\186\167\177\135\95", "\228\52\102\231\214\197\208")]=function()
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\232\113\209\229\34", "\196\158\70\228\192\18")] = game.Players.LocalPlayer;
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\92\8\71\11\137", "\185\42\63\113\46")] = game:GetService(v24("\54\244\97\218\217\142\11\192\23\227\112", "\182\126\128\21\170\138\235\121"));
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\194\138\118\124\75", "\123\180\189\65\89")] = game:GetService(v24("\191\223\57\227\150\28\34\18\184\223\39\240\143\16\53", "\102\235\186\85\134\230\115\80"));
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\212\219\168\161\217", "\233\162\236\144\132")] = v24("\95\24\42\79\97\142\109\24\11\63\82\119\199\108\69\3\60\83\125\204\108\84\3\51\16\100\133\109\80\13\51\90\97\155", "\66\55\108\94\63\18\180");
	local v100, v101 = game.PlaceId, game.JobId;
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\164\156\175\95\233", "\63\210\164\158\122\217\150")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\37\156\174\169\25", "\152\83\171\150\140\41")] .. v100 .. v24("\91\158\128\37\49\92\6\158\202\7\50\91\24\132\134\104\52\86\6\153\170\37\35\92\6\208\161\50\52\90\82\129\140\58\46\77\73\220\213\103", "\57\116\237\229\87\71");
	function ListServers(v163)
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\148\180\209\101\145\75", "\104\226\133\227\83\180\123")] = 139 - (43 + 96);
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\21\90\113\7\70\91", "\48\99\107\67")] = nil;
		while true do
			if (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\200\247\47\134\104\43", "\27\190\198\29\176\77")] ~= (0 - 0)) then
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\249\26\171\103\236\30", "\46\143\43\157\84\201")] = 0 - 0;
				while true do
					if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\65\41\0\145\26\67", "\168\55\24\54\162\63\115")] == (0 + 0)) or (990 > 1620)) then
						TABLE_TableIndirection["v9%0"]["v8%0"][v22("\1\171\114\215\151\158", "\174\119\154\64\224\178")] = game:HttpGet(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\60\38\148\62\85", "\132\74\30\165\27\101\199\122")] .. ((v163 and (v24("\236\178\248\245\100\225\85\247", "\39\202\209\141\135\23\142") .. v163)) or ""));
						return TABLE_TableIndirection["v9%0"]["v8%0"][v22("\57\176\169\226\247", "\212\79\135\159\199\199\213")]:JSONDecode(TABLE_TableIndirection["v9%0"]["v8%0"]["v127%0"]);
					end
				end
			end
		end
	end
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\111\248\231\2\12", "\120\25\192\213\39\60\183")] = nil;
	repeat
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\14\17\109\16\93\16", "\40\120\32\95")] = 0 + 0;
		TABLE_TableIndirection["v9%0"]["v8%0"][v22("\44\250\107\35\234\79", "\127\90\203\89\26\207")] = nil;
		while true do
			if ((TABLE_TableIndirection["v9%0"]["v8%0"][v22("\203\100\253\147\76\173", "\157\189\85\207\171\105")] == (0 - 0)) or (877 > 4695)) then
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\208\240\138\236\70\150", "\99\166\193\184\213")] = ListServers(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\192\239\210\254\92", "\234\182\215\224\219\108")]);
				for v224, v225 in next, TABLE_TableIndirection["v9%0"]["v8%0"][v22("\214\208\233\108\133\209", "\85\160\225\219")].data do
					if ((4492 >= 2654) and (v225.playing < v225.maxPlayers) and (v225.id ~= v101)) then
						local v258, v259 = pcall(TABLE_TableIndirection["v9%0"]["v8%0"][v22("\74\82\212\140\102", "\43\60\101\227\169\86\188")].TeleportToPlaceInstance, TABLE_TableIndirection["v9%0"]["v8%0"][v22("\102\159\134\250\10", "\87\16\168\177\223\58\172\217")], v100, v225.id, TABLE_TableIndirection["v9%0"]["v8%0"][v22("\34\154\12\152\107", "\91\84\173\57\189")]);
						if v258 then
							break;
						end
					end
				end
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\6\232\94\164\229\134", "\182\112\217\108\156\192")] = 1 + 0;
			end
			if ((3442 >= 1503) and (TABLE_TableIndirection["v9%0"]["v8%0"][v22("\188\89\26\183\206\250", "\235\202\104\40\143")] ~= 1)) then
			else
				TABLE_TableIndirection["v9%0"]["v8%0"][v22("\27\211\73\252\93", "\217\109\235\123")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\49\216\44\15\53\128", "\221\71\233\30\54\16\176\173")].nextPageCursor;
				break;
			end
		end
	until not TABLE_TableIndirection["v9%0"]["v8%0"][v22("\34\164\12\250\100", "\223\84\156\62")] 
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\192\168\178\152\231", "\91\182\156\130\189\215")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\104\32\244\16\46", "\53\30\19\204")]:section({[v24("\241\50\4\15", "\152\159\83\105\106\82")]=v24("\166\211\95\178\228\83\133\213", "\60\225\166\49\146\169"),[v24("\60\23\43\47", "\103\79\126\79\74\97")]=v24("\168\118\212\123\74", "\122\218\31\179\19\62"),[v24("\160\223\215\196", "\37\211\182\173\161\169\193")]=(374 - 174)});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\239\180\32\193\247", "\199\153\128\16\228")]:toggle({[v24("\249\59\64\220", "\217\151\90\45\185\72\27")]=v24("\230\114\230\16\90\198\120", "\54\163\28\135\114"),[v24("\44\222\91", "\31\72\187\61\226\46")]=false,[v24("\192\7\79\222\69\127\39\200", "\68\163\102\35\178\39\30")]=function(v102)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\199\120\183\92\247", "\199\177\74\133\121")].GunMods.Enabled = v102;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\174\157\236\187\103", "\74\216\169\220\158\87\166")]:toggle({[v24("\176\113\215\194", "\113\222\16\186\167\99\213\227")]=v24("\28\15\235\255\42\78\221\255\60\11", "\150\78\110\155"),[v24("\129\192\33", "\32\229\165\71\129\196\126\223")]=false,[v24("\192\136\200\141\131\212\192\130", "\181\163\233\164\225\225")]=function(v104)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\254\113\65\105\10", "\58\136\67\115\76")].GunMods.RapidFire = v104;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\231\254\136\28\213", "\61\145\202\184\57\229\64\203")]:toggle({[v24("\94\138\51\114", "\23\48\235\94")]=v24("\85\212\203\73\86\61\198\60\232\221\81\88\50\214", "\178\28\186\184\61\55\83"),[v24("\192\200\65", "\149\164\173\39\92\146\110")]=false,[v24("\240\38\28\19\24\26\240\44", "\123\147\71\112\127\122")]=function(v106)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\74\0\219\2\12", "\39\60\50\233")].GunMods.InstantReload = v106;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\12\103\243\105\210", "\195\122\83\195\76\226\72\210")]:toggle({[v24("\194\204\143\116", "\38\172\173\226\17")]=v24("\96\4\32\251\68\1\32\234\13\51\57\227\65\20\56\252", "\143\45\113\76"),[v24("\188\189\26", "\92\216\216\124")]=false,[v24("\88\51\160\76\255\90\49\167", "\157\59\82\204\32")]=function(v108)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\242\134\105\187\113", "\65\132\180\91\158")].GunMods.MultiBullet = v108;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\19\40\129\107\85", "\78\101\28\177")]:toggle({[v24("\54\63\238\255", "\209\88\94\131\154\137\138\179")]=v24("\6\174\132\79\14\49\52\35\44", "\66\72\193\164\28\126\67\81"),[v24("\227\41\174", "\22\135\76\200\56\70")]=false,[v24("\142\49\244\40\95\224\142\59", "\129\237\80\152\68\61")]=function(v110)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\51\230\178\20\117", "\49\69\212\128")].GunMods.NoSpread = v110;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\1\88\128\183\177", "\129\119\108\176\146")]:toggle({[v24("\95\169\9\246", "\56\49\200\100\147\124\119")]=v24("\226\49\255\194\201\61\176\249\192", "\144\172\94\223"),[v24("\32\10\164", "\39\68\111\194")]=false,[v24("\213\167\235\203\123\182\213\173", "\215\182\198\135\167\25")]=function(v112)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\42\157\85\136\117", "\124\92\175\103\173\69\110")].GunMods.NoRecoil = v112;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\215\108\83\114\145", "\87\161\88\99")]:toggle({[v24("\131\72\231\77", "\40\237\41\138")]=v24("\233\123\186\210\75\202", "\42\167\20\154\152"),[v24("\78\251\164", "\65\42\158\194\34\17")]=false,[v24("\25\38\94\0\47\236\24\229", "\142\122\71\50\108\77\141\123")]=function(v114)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\4\171\189\137\231", "\67\114\153\143\172\215\176")].GunMods.NoJam = v114;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\168\246\190\75\238", "\110\222\194\142")]:toggle({[v24("\27\163\242\29", "\91\117\194\159\120")]=v24("\51\19\56\17\59\248\48\31\93\31\21\56\254", "\68\122\125\94\120\85\145"),[v24("\19\25\201", "\218\119\124\175\62\168\185")]=false,[v24("\166\241\68\200\167\241\75\207", "\164\197\144\40")]=function(v116)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\1\139\73\236\2", "\193\119\185\123\201\50")].GunMods.InfiniteAmmo = v116;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\97\92\168\99\95", "\127\23\104\153\70\111\25")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\31\84\254\234\123", "\211\105\103\198\207\75\76\215")]:section({[v24("\141\241\167\142", "\214\227\144\202\235\189")]=v24("\221\169\134\98\21\161\19\17\226\161\148", "\92\141\197\231\27\112\211\51"),[v24("\245\246\142\166", "\177\134\159\234\195")]=v24("\177\238\57\180", "\169\221\139\95\192"),[v24("\205\130\101\58", "\70\190\235\31\95\66")]=(51 + 109)});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\216\243\225\170\46", "\214\174\199\208\143\30\108\218")]:toggle({[v24("\180\227\23\227", "\133\218\130\122\134")]=v24("\25\241\226\198\208\166\60", "\88\92\159\131\164\188\195"),[v24("\132\43\185", "\189\224\78\223\43\183\139")]=false,[v24("\45\253\134\26\195\47\255\129", "\161\78\156\234\118")]=function(v118)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\7\214\89\239\245", "\41\113\228\107\202\197\54\184")].PlayerMods.Enabled = v118;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\108\217\105\25\42", "\60\26\237\88")]:toggle({[v24("\169\182\196\217", "\188\199\215\169")]=v24("\207\25\86\117\234\243\29", "\136\156\105\63\27"),[v24("\31\137\127", "\84\123\236\25")]=false,[v24("\243\138\166\27\174\180\243\128", "\213\144\235\202\119\204")]=function(v120)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\206\120\38\163\254", "\206\184\74\20\134")].PlayerMods.Spinbot = v120;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\46\176\191\244\163", "\172\88\132\142\209\147\42\88")]:toggle({[v24("\45\25\211\47", "\45\67\120\190\74\72\67")]=v24("\21\49\232\229\218\174\252\232\45\39\173\150\233\141\235\237", "\137\64\66\141\197\153\232\142"),[v24("\7\213\36", "\232\99\176\66\198")]=false,[v24("\239\32\36\10\121\140\250\39", "\76\140\65\72\102\27\237\153")]=function(v122)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\145\216\158\72\102", "\222\231\234\172\109\86\149")].PlayerMods.CFrameSpeed.Enabled = v122;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\251\187\145\93\189", "\120\141\143\160")]:slider({[v24("\68\219\27\215", "\222\42\186\118\178\183\97")]=v24("\126\202\86\139\80\233\4\185\77\233\65\142", "\234\61\140\36"),[v24("\37\216\188", "\111\65\189\218\18")]=(1 + 4),[v24("\78\74\3", "\207\35\43\123\85\107\60")]=(1761 - (1414 + 337)),[v24("\125\163\174", "\25\16\202\192\138")]=(1941 - (1642 + 298)),[v24("\239\196\184\236\173\253\243\204", "\148\157\171\205\130\201")]=true,[v24("\32\213\120\37\211\247\32\223", "\150\67\180\20\73\177")]=function(v124)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\86\254\228\23\16", "\50\32\204\214")].PlayerMods.CFrameSpeed.WalkSpeed = v124;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\144\19\103\60\227", "\113\230\39\85\25\211")] = TABLE_TableIndirection["v9%0"]["v8%0"][v22("\200\232\94\173\119", "\43\190\219\102\136\71\171\203")]:section({[v24("\131\25\23\72", "\45\237\120\122")]=v24("\243\237\177\53\217\235", "\76\183\136\194"),[v24("\105\239\225\61", "\116\26\134\133\88\48\47")]=v24("\12\200\167\236\169", "\18\126\161\192\132\221"),[v24("\76\33\180\1", "\54\63\72\206\100")]=(260 - 160)});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\52\42\98\28\114", "\57\66\30\80")]:toggle({[v24("\198\88\72\127", "\27\168\57\37\26\133")]=v24("\8\164\125\170\219\40\174", "\183\77\202\28\200"),[v24("\19\54\143", "\104\119\83\233")]=false,[v24("\246\249\43\46\65\244\251\44", "\35\149\152\71\66")]=function(v126)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\63\138\242\80\212", "\228\73\184\192\117\228\89\148")].Desync.Enabled = v126;
end});
TABLE_TableIndirection["v9%0"]["v8%0"][v22("\217\221\39\81\159", "\116\175\233\21")]:toggle({[v24("\23\233\79\181", "\90\121\136\34\208")]=v24("\242\0\93\23\211\26\84\28\203\11", "\126\167\110\53"),[v24("\57\21\40", "\95\93\112\78\152\188")]=false,[v24("\194\244\137\25\230\191\209\202", "\178\161\149\229\117\132\222")]=function(v128)
	TABLE_TableIndirection["v9%0"]["v8%0"][v22("\232\170\236\3\139", "\95\158\152\222\38\187\81")].Desync.Unhittable = v128;
end});


-- MA指标
-- @param list K线数组
-- @param getMethod 计算字段
-- @param param {5, 10, 20, 40}

function MAIndex(aryList, getMethod, param)
	
	local listMapIndex = {}	
	local titles = {}
	
	for i = 1, #param, 1 do
	
		local title = "MA"..param[i]
		local cycle = param[i]
		local funcMA = MA(getMethod, cycle)
		local aryMANIndex = {}
		
		titles[i] = title
		listMapIndex[title] = aryMANIndex
		
		for j = 1, #aryList, 1 do
		
			aryMANIndex[j] = funcMA(j, aryList)
		end
	end	
	
	local aryMAIndex = {}
			
	for j = 1, #aryList, 1 do
		
		local ma = {}
				
		for i = 1, #titles, 1 do
		
			local title = titles[i]
			local aryMaNIndex = listMapIndex[title]
				
			ma[title] = aryMaNIndex[j]
		end	
		
		aryMAIndex[j] = ma
	end

	return aryMAIndex
end

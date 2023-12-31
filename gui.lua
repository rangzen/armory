-- returns the color of a life bar
function life_color(l)
	local life_color = 11
	if l < 2 then
		life_color = 8
	elseif l < 6 then
		life_color = 9
	elseif l < 8 then
		life_color = 10
	end
	return life_color
end
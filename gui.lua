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

-- converts the party time to a string with one decimal
function party_time_to_str()
  local timer = party_time / fps
  local splits = split(timer, ".", false)
  -- if there is no decimal part, add one
  if #splits == 1 then
    splits[2] = "0"
  end
  local timer_str = splits[1] .. "." .. sub(splits[2], 1, 1)
  return timer_str
end

function draw_timer()
  spr(50, 4, 4)
  print(party_time_to_str(), 13, 5, 7)
end

function draw_kills()
  spr(49, 4, 12)
  print(kills, 13, 13, 7)
end

-- register a new temporary message
function new_tmp_msg(msg)
  tmp_msg = msg
  tmp_msg_timer = party_time + fps
end

function draw_tmp_msg()
  if tmp_msg_timer > party_time then
    print(tmp_msg, 64 - #tmp_msg * 2, 120, 7)
  end
end
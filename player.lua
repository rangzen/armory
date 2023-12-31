acc = .5 -- acceleration
fri = .1 -- friction
min_time_between_damage = 20 -- minimum time between damage on the player

function init_player()
  plr = {
    x = 63,
    y = 63,
    dx = 0,
    dy = 0,
    s = 1, -- sprite
    l = 8, -- life
    mwp = copy_weapon(main_weapons[1]), -- main weapon
    swp = copy_weapon(secondary_weapons[1]) -- secondary weapon
  }
end

function update_player()
  -- input for movement
  if btn(0) then plr.dx -= acc end
  if btn(1) then plr.dx += acc end
  if btn(2) then plr.dy -= acc end
  if btn(3) then plr.dy += acc end

  -- limit speed
  if abs(plr.dx) > 1 then plr.dx = sgn(plr.dx) end
  if abs(plr.dy) > 1 then plr.dy = sgn(plr.dy) end

  -- apply friction
  plr.dx *= 1 - fri
  plr.dy *= 1 - fri

  -- apply movement
  plr.x += plr.dx
  plr.y += plr.dy
  --printh(plr.x, "log.txt")

  -- limit position
  plr.x = mid(4, plr.x, 128 - 4)
  plr.y = mid(4, plr.y, 128 - 4)
end

function draw_player()
  -- player sprite
  plr.s = 1 + flr(party_time / 10) % 2
  spr(plr.s, plr.x - 4, plr.y - 4, 1, 1, plr.dx > 0)

  -- player life
  line(plr.x - 4, plr.y - 6, plr.x + plr.l - 5, plr.y - 6, life_color(plr.l))

  -- player direction
  if debug then
    line(plr.x + 4, plr.y + 4, plr.x + 4 + plr.dx * 8, plr.y + 4 + plr.dy * 8, 7)
  end
end
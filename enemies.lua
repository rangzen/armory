nb_enms = 15 -- number of enemies
increase_enemies_every = 3 * fps -- seconds

enemies_dex = {
  {
    name = "ghost",
    s = 32,
    h = 6,
    w = 6,
    max_spd = .3,
    l = 2 -- life
  },
  {
    name = "bat",
    s = 34,
    h = 6,
    w = 6,
    max_spd = .5,
    l = 1 -- life
  },
  {
    name = "spider",
    s = 36,
    h = 6,
    w = 6,
    max_spd = .1,
    l = 5 -- life
  }
}

function increase_enemies_on_time()
  if party_time % increase_enemies_every == 0 then
    nb_enms += 1
  end
end

function add_enemies()
  if #enms >= nb_enms then
    return
  end

  local startx, starty
  if rnd() < 0.5 then
    -- start top or bottom
    startx = rnd(128)
    starty = 63 + sgn(rnd(1) - .5) * 71
  else
    -- start left or right
    startx = 63 + sgn(rnd(1) - .5) * 71
    starty = rnd(128)
  end
  local e = copy_enemy(enemies_dex[flr(rnd(#enemies_dex)) + 1])
  e.x = startx
  e.y = starty
  e.dx = 0
  e.dy = 0
  add(enms, e)
end

function copy_enemy(e)
  local out = {}
  for k, v in pairs(e) do
    out[k] = v
  end
  return out
end

function update_enemies()
  for e in all(enms) do
    -- does enemy hit the player?
    if party_time > last_damage_time + min_time_between_damage
        and abs(plr.x - e.x) < e.w / 2 + 4
        and abs(plr.y - e.y) < e.h / 2 + 4 then
      plr.l -= 1
      last_damage_time = party_time
      if plr.l <= 0 then
        -- game over
        gameover()
      end
    end

    -- move enemies towards player
    e.dx = plr.x - e.x
    e.dy = plr.y - e.y

    -- normalize direction
    local d = sqrt(e.dx ^ 2 + e.dy ^ 2)
    local p = e.max_spd / d
    e.dx *= p
    e.dy *= p

    -- move enemies
    e.x += e.dx
    e.y += e.dy
  end
end

function draw_enemies()
  for e in all(enms) do
    -- enemy sprite
    local s = e.s + flr(party_time / 10) % 2
    spr(s, e.x - 4, e.y - 4, 1, 1, e.dx < 0)

    -- enemy life
    if debug_enabled then
      line(e.x - 4, e.y - 6, e.x + e.l - 5, e.y - 6, life_color(e.l))
    end
  end
end
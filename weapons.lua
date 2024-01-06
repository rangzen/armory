blt_spd = .1 -- bullet speed

main_weapons = {
  {
    name = "piu piu",
    desc = "shoots in the direction of the nearest enemy",
    cooldown = 10,
    damage = 1
  }
}

secondary_weapons = {
  {
    name = "mine",
    desc = "explode after a 2 seconds",
    cooldown = 30,
    damage = 5,
    radius = 24,
    ttl = 2 * 30
  }
}

bonus_list = {
  {
    name = "fire rate",
    func = function()
      if plr.mwp.cooldown > 1 then 
        plr.mwp.cooldown -= 1
        debug("mwp.cooldown:" .. plr.mwp.cooldown)
        new_tmp_msg("fire rate increased!")
      else
        new_tmp_msg("fire rate maxed out!")
      end
    end
  }
}

function copy_weapon(wp)
  out = {}
  out.last_shot = wp.cooldown
  for k, v in pairs(wp) do
    out[k] = v
  end
  return out
end

function add_bonus()
  if party_time % 60 == 0 then
    rnd_index = flr(rnd(#bonus_list)) + 1
    add(
      bonus, {
        x = rnd(128),
        y = rnd(128),
        bonus = bonus_list[rnd_index]
      }
    )
    debug("added bonus:" .. bonus_list[rnd_index].name)
  end
end

function fire_piu_piu()
  -- find closest enemy
  local e = enms[1]
  for i = 2, #enms do
    local e2 = enms[i]
    if abs(plr.x - e2.x) + abs(plr.y - e2.y) < abs(plr.x - e.x) + abs(plr.y - e.y) then
      e = e2
    end
  end

  -- normalize direction
  local r = sqrt((e.x - plr.x) ^ 2 + (e.y - plr.y) ^ 2) / blt_spd
  local bdx = (e.x - plr.x) / r
  local bdy = (e.y - plr.y) / r

  sfx(0)
  add(
    blts, {
      x = plr.x,
      y = plr.y,
      dx = bdx,
      dy = bdy
    }
  )
end

function fire_mine()
  sfx(2)
  add(
    mines, {
      x = plr.x,
      y = plr.y,
      radius = plr.swp.radius,
      damage = plr.swp.damage,
      ttl = party_time + plr.swp.ttl
    }
  )
end

function update_bullets()
  for b in all(blts) do
    -- remove bullets that go off screen
    if b.x < 0 or b.x > 128 or b.y < 0 or b.y > 128 then
      del(blts, b)
    else
      -- remove bullets that hit enemies
      for e in all(enms) do
        if b.x > e.x - e.w / 2 and b.x < e.x + e.w / 2
            and b.y > e.y - e.h / 2 and b.y < e.y + e.h / 2 then
          del(blts, b)
          e.l -= plr.mwp.damage
          if e.l <= 0 then
            del(enms, e)
            kills += 1
          end
          break
        else
          -- move bullets
          b.x += b.dx
          b.y += b.dy
        end
      end
    end
  end
end

function update_mines()
  for m in all(mines) do
    if party_time > m.ttl then
      for e in all(enms) do
        if sqrt((m.x - e.x) ^ 2 + (m.y - e.y) ^ 2) < m.radius then
          e.l -= m.damage
          if e.l <= 0 then
            del(enms, e)
            kills += 1
          end
        end
      end
      sfx(1)
      del(mines, m)
    end
  end
end

function update_bonus()
  for b in all(bonus) do
    -- is the player touching the bonus?
    if abs(plr.x - b.x) < 8 and abs(plr.y - b.y) < 8 then
      -- apply the bonus
      b.bonus.func()
      -- remove the bonus
      del(bonus, b)
      -- play a sound
      sfx(3)
    end
  end
end

function draw_bullets()
  for b in all(blts) do
    spr(54, b.x - 4, b.y - 4)
  end
end

function draw_mines()
  for m in all(mines) do
    circ(m.x, m.y, m.radius, 9)
    if party_time > m.ttl - 30 then
      spr(60, m.x - 4, m.y - 4)
    else
      spr(59, m.x - 4, m.y - 4)
    end
  end
end

function draw_bonus()
  for b in all(bonus) do
    spr(62, b.x - 4, b.y - 4)
  end
end
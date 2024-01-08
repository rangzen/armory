instant_boom_radius = 32
instant_boom_dmg = 3
instant_boom_display_time = 0

bonus_list = {
  {
    name = "fire rate",
    func = function()
      plr.mwp.cooldown -= 1
      debug("mwp.cooldown:" .. plr.mwp.cooldown)
      new_tmp_msg("fire rate increased!")
    end
  },
  {
    name = "instant boom",
    func = function()
      sfx(1)
      radius_damage_at(instant_boom_radius, instant_boom_dmg, plr.x, plr.y)
      instant_boom_display_time = party_time + 1
      new_tmp_msg("instant boom!")
    end
  }
}

function init_bonus()
  instant_boom_display_time = 0
end

function add_bonus()
  if party_time % 60 == 0 then
    add(
      bonus, {
        x = rnd(128),
        y = rnd(128)
      }
    )
  end
end

function update_bonus()
  for b in all(bonus) do
    -- is the player touching the bonus?
    if abs(plr.x - b.x) < 8 and abs(plr.y - b.y) < 8 then
      rnd_bonus().func()
      -- remove the bonus
      del(bonus, b)
      -- play a sound
      sfx(3)
    end
  end
end

function rnd_bonus()
  -- create a temporary list of available bonus
  local bl = {}
  -- fire rate
  if plr.mwp.cooldown > 1 then
    add(bl, bonus_list[1])
  end
  -- instant boom
  add(bl, bonus_list[2])

  -- pick a random bonus
  rnd_index = flr(rnd(#bl)) + 1

  return bl[rnd_index]
end

function draw_bonus()
  for b in all(bonus) do
    spr(62, b.x - 4, b.y - 4)
  end

  -- instant boom display
  if instant_boom_display_time > party_time then
    circfill(plr.x, plr.y, instant_boom_radius, 7)
    circfill(plr.x, plr.y, instant_boom_radius/2, 9)
    circfill(plr.x, plr.y, instant_boom_radius/4, 8)
  end
end
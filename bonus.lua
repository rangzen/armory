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


function draw_bonus()
  for b in all(bonus) do
    spr(62, b.x - 4, b.y - 4)
  end
end

function _init()
  paused = true
  can_unpause_at = time()

  init_player()

  blts = {}
  -- bullets
  mines = {}
  -- mines
  enms = {}
  -- enemies
end

function _update()
  -- is the game paused?
  if paused then
    -- start the game if any button is pressed
    if time() > can_unpause_at
        and (btnp(0) or btnp(1) or btnp(2) or btnp(3) or btnp(4) or btnp(5)) then
      party_time = 0
      last_damage_time = party_time + 3 * 30 -- can't be damaged the first 3 seconds
      kills = 0
      paused = false
    end
    return
  else
    party_time += 1
  end

  update_player()

  -- Fire main weapon
  if btn(4) and party_time > plr.mwp.last_shot + plr.mwp.cooldown then
    plr.mwp.last_shot = party_time

    -- main weapon piu piu: shoot in the direction of the nearest enemy
    if plr.mwp.name == "piu piu" and #enms > 0 then
      fire_piu_piu()
    end
  end

  -- Fire secondary weapon
  if btn(5) and party_time > plr.swp.last_shot + plr.swp.cooldown then
    plr.swp.last_shot = party_time

    -- secondary weapon mine: drop and explode after 2 seconds
    if plr.swp.name == "mine" then
      fire_mine()
    end
  end

  update_bullets()

  update_mines()

  increase_enemies_on_time()
  add_enemies()
  update_enemies()
end

function _draw()
  cls(5)
  map(0)

  if paused then
    if time() > can_unpause_at then
      print("press any button to start", 12, 63, 7)
    end
    -- already a previous game?
    if party_time != nil and party_time > 0 then
      draw_timer()
      draw_kills()
    end
    return
  end

  draw_mines()

  draw_player()

  draw_bullets()

  draw_enemies()

  draw_timer()
  draw_kills()

  if debug then
    -- print(plr.x .. ", " .. plr.y, 0, 8, 7)
    -- print(plr.dx .. ", " .. plr.dy, 0, 16, 7)
    print(kills, 0, 24, 7)
    print("#enms:" .. #enms, 0, 32, 7)
    -- print(plr.mwp.damage, 0, 40, 7)
    -- print(main_weapons[1].damage, 0, 48, 7)
  end
end
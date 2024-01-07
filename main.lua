function _init()
  paused = true
  can_unpause_at = time()
  tmp_msg_timer = 0
end

function _update()
  -- is the game paused?
  if paused then
    -- start the game if any button is pressed
    if time() > can_unpause_at
        and (btnp(0) or btnp(1) or btnp(2) or btnp(3) or btnp(4) or btnp(5)) then
      start()
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

  update_bonus()
  add_bonus()
end

function _draw()
  cls()
  map(0)

  if paused then
    -- already a previous game?
    if party_time != nil and party_time > 0 then
      draw_timer()
      draw_kills()
    end
    if time() > can_unpause_at then
      local text_color = 9
      local msg_story1 = "you are an armory priest sent"
      print(msg_story1, 64 - #msg_story1 * 2, 30, text_color)
      local msg_story2 = "to clear this dangerous area"
      print(msg_story2, 64 - #msg_story2 * 2, 38, text_color)
      local msg_story3 = "and put them back to the tomb!"
      print(msg_story3, 64 - #msg_story3 * 2, 46, text_color)
      local msg_start = "press any button to start"
      print(msg_start, 64 - #msg_start * 2, 63, text_color)
      local msg_prmwpn = "❎:primary weapon"
      print(msg_prmwpn, 64 - #msg_prmwpn * 2, 79, text_color)
      local msg_scndwpn = "🅾️:secondary weapon"
      print(msg_scndwpn, 64 - #msg_scndwpn * 2, 87, text_color)
    else
      -- draw the player dead
      spr(3, plr.x - 4, plr.y - 4)
      local msg_gameover = "you died"
      print(msg_gameover, plr.x  - #msg_gameover * 2, plr.y+8, 7)
    end
    return
  end

  draw_mines()

  draw_player()

  draw_bullets()

  draw_bonus()

  draw_enemies()

  draw_timer()
  draw_kills()

  draw_tmp_msg()

  if debug_enabled then
    -- print(plr.x .. ", " .. plr.y, 0, 8, 7)
    -- print(plr.dx .. ", " .. plr.dy, 0, 16, 7)
    print(kills, 0, 24, 7)
    print("#enms:" .. #enms, 0, 32, 7)
    -- print(plr.mwp.damage, 0, 40, 7)
    -- print(main_weapons[1].damage, 0, 48, 7)
  end
end

function start()
  party_time = 0
  tmp_msg_timer = 0
  tmp_msg = nil

  last_damage_time = party_time + 3 * 30
  -- can't be damaged the first 3 seconds
  kills = 0
  init_player()
  -- bullets
  blts = {}
  -- mines
  mines = {}
  -- bonus
  bonus = {}
  -- enemies
  enms = {}

  paused = false
end

function gameover()
  paused = true

  sfx(32)

  can_unpause_at = time() + 2
end

function debug(msg)
  if debug_enabled then
    printh(party_time .. ":" .. msg, "log.txt")
  end
end
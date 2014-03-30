%%%%%%%%%%%%%%%%%%%%%%%%%
%                       %
%%% Variables & Fonts %%%
%                       %
%%%%%%%%%%%%%%%%%%%%%%%%%
View.Set ("graphics:1012;700,nocursor,offscreenonly,nobuttonbar,noecho")
var qbricks : array 1 .. 3 of boolean
for i : 1 .. 3
    qbricks (i) := true
end for
var x : int := 0 % starting points of player
var y : int := 95 % ''
var levelstat : string := "none"
var score : int := 0
var coinh : int := 0 % number of coins hit
var tx : int
var gt : int := 930 % Goomba starting position %% TEMPORARY %%
var gw : int := 95 % goomba height position
var pt : int := 0
var l, r : int := -10 % Base bricks 'x' location
var bhit : boolean := false
% Bowser variables %
var BX : int := 1000
var BY : int := 85
var FX, FY := 0
var killspot : int
var btemp, ftemp : int := 1
var bstatus : string := "none"
var bdirect : string := "right"
var br, fr : int := 0
var rew : int
var button : boolean := false
% % % % % %  % % % %
var level : int := 0
var world : int := 1
var dtime, ptime : int := 0 % amount of time before a dead enemy disappears
var gstatus : string := "alive" % status of goombas
var temp, gtemp, ptemp : int := 1 % animation rotation variable
var mx, my, mbut : int := 1 % mouse variables
var character : string := "none" % Determines player choice, mario or luigi
var direct : string := "right" % direction player is facing
var chars : array char of boolean % moving
var boom : boolean := true % Dead or alive
var lives : int := 5 % number of lives
var tr, gr, rr : int := 0 % helps animation run smoothly
var jump, leveldone : boolean := false % if you are jumping or if the level is done
var initx, inity : int % initial values of x and y before jumping
var f : int := 5500 % starting value of flag and castle
var jumpp : string := "off" % selects type of jump, parabola or straight up
var select : string := "select" % Varifies selection from the title screen
var c : int % chasm & brick loactions
var music : string := "none"
var go, go2 : boolean := true
var times : real := 200
var ch : string (1) := " " % temporary variable
var coins : array 1 .. 6, 1 .. 6 of boolean
for i : 1 .. 6
    for j : 1 .. 4
	coins (i, j) := true % coins are there for secret level
    end for
end for
var font, font1 : int % font variables
initx := 50
inity := 95
font := Font.New ("FIXEDSYS:20")
font1 := Font.New ("FIXEDSYS:30")
%%%%%%%%%%%%%%%%
%              %
%%% Pictures %%%
%              %
%%%%%%%%%%%%%%%%
%Enemies%
var goomba1 : int := Pic.FileNew ("goombaright.bmp")
var goomba2 : int := Pic.FileNew ("goombaleft.bmp")
var goombadie : int := Pic.FileNew ("goombadie.bmp")
var bLrun1 : int := Pic.FileNew ("bowserleft1.bmp")
var bLrun2 : int := Pic.FileNew ("bowserleft2.bmp")
var bLfirerun1 : int := Pic.FileNew ("bowserleftfire1.bmp")
var bLfirerun2 : int := Pic.FileNew ("bowserleftfire2.bmp")
var bRrun1 : int := Pic.FileNew ("bowserright1.bmp")
var bRrun2 : int := Pic.FileNew ("bowserright2.bmp")
var bRfirerun1 : int := Pic.FileNew ("bowserrightfire1.bmp")
var bRfirerun2 : int := Pic.FileNew ("bowserrightfire2.bmp")
var bLfire1 : int := Pic.FileNew ("bowserfireleft1.bmp")
var bLfire2 : int := Pic.FileNew ("bowserfireleft2.bmp")
var bRfire1 : int := Pic.FileNew ("bowserfireright1.bmp")
var bRfire2 : int := Pic.FileNew ("bowserfireright2.bmp")
%Mario%
var lilmario : int := Pic.FileNew ("LittleMario.bmp")
var mLstand : int := Pic.FileNew ("MarioStandLeft.bmp")
var mRstand : int := Pic.FileNew ("MarioStandRight.bmp")
var mLjump : int := Pic.FileNew ("MarioJumpLeft.bmp")
var mRjump : int := Pic.FileNew ("MarioJumpRight.bmp")
var mRrun1 : int := Pic.FileNew ("MarioRunRight1.bmp")
var mRrun2 : int := Pic.FileNew ("MarioRunRight2.bmp")
var mRrun3 : int := Pic.FileNew ("MarioRunRight3.bmp")
var mLrun1 : int := Pic.FileNew ("MarioRunLeft1.bmp")
var mLrun2 : int := Pic.FileNew ("MarioRunLeft2.bmp")
var mLrun3 : int := Pic.FileNew ("MarioRunLeft3.bmp")
var mRpole : int := Pic.FileNew ("MarioSlidePoleRight.bmp")
var mLpole : int := Pic.FileNew ("MarioSlidePoleLeft.bmp")
var mCpole : int := Pic.FileNew ("MarioCatchPole.bmp")
var mdie : int := Pic.FileNew ("MarioDie.bmp")
%Luigi%
var lilluigi : int := Pic.FileNew ("LittleLuigi.bmp")
var lLstand : int := Pic.FileNew ("LuigiStandLeft.bmp")
var lRstand : int := Pic.FileNew ("LuigiStandRight.bmp")
var lLjump : int := Pic.FileNew ("LuigiJumpLeft.bmp")
var lRjump : int := Pic.FileNew ("LuigiJumpRight.bmp")
var lRrun1 : int := Pic.FileNew ("LuigiRunRight1.bmp")
var lRrun2 : int := Pic.FileNew ("LuigiRunRight2.bmp")
var lRrun3 : int := Pic.FileNew ("LuigiRunRight3.bmp")
var lLrun1 : int := Pic.FileNew ("LuigiRunLeft1.bmp")
var lLrun2 : int := Pic.FileNew ("LuigiRunLeft2.bmp")
var lLrun3 : int := Pic.FileNew ("LuigiRunLeft3.bmp")
var lRpole : int := Pic.FileNew ("LuigiSlidePoleRight.bmp")
var lLpole : int := Pic.FileNew ("LuigiSlidePoleLeft.bmp")
var lCpole : int := Pic.FileNew ("LuigiCatchPole.bmp")
var ldie : int := Pic.FileNew ("LuigiDie.bmp")
%Background Pictures & Obstacles%
var opening : int := Pic.FileNew ("openingscreen.bmp")
var flag : int := Pic.FileNew ("flagx.bmp")
var lilC : int := Pic.FileNew ("LittleCastle.bmp")
var fireballup : int := Pic.FileNew ("fireup.bmp")
var fireballdown : int := Pic.FileNew ("firedown.bmp")
var back1 : int := Pic.FileNew ("BackgroundTitle.bmp")
var back2 : int := Pic.FileNew ("BackgroundTitle2.bmp")
var back3 : int := Pic.FileNew ("UnderworldBackground.bmp")
var back4 : int := Pic.FileNew ("CastleBackground.bmp")
var backS : int := Pic.FileNew ("UnderworldSecret.bmp")
var hbrick : int := Pic.FileNew ("hitbrick.bmp")
var brick : int := Pic.FileNew ("brick.bmp")
var coin : int := Pic.FileNew ("coin.bmp")
var sidetube : int := Pic.FileNew ("sidetube.bmp")
var sidetube2 : int := Pic.FileNew ("sidetube2.bmp")
var tube : int := Pic.FileNew ("tube.bmp")
var talltube : int := Pic.FileNew ("talltube.bmp")
var BButton : int := Pic.FileNew ("BigButton.bmp")
var BButtonP : int := Pic.FileNew ("BigButtonPressed.bmp")
%%%%%%%%%%%%%%%%%
%               %
%%% Processes %%%
%               %
%%%%%%%%%%%%%%%%%

%Theme song%
process titlesong
    Music.PlayFile ("Mario.mp3")
end titlesong
%Overworld song%
process overworld
    Music.PlayFile ("Overworld.mp3")
end overworld
%Time running down in overworld%
process hurryOW
    Music.PlayFile ("HurryOverworld.mp3")
end hurryOW
%Castle Music%
process castle
    Music.PlayFile ("Bowser.mp3")
end castle
%Underground music%
process underworld
    Music.PlayFile ("Underworld.mp3")
end underworld
% Time running down underground %
process hurryUW
    Music.PlayFile ("HurryUnderworld.mp3")
end hurryUW
%Game Over song%
process dead
    Music.PlayFile ("GameOver.mp3")
end dead
%Dying sound effect/song%
process die
    Music.PlayFile ("die.mp3")
end die
%Jumping sound effect%
process Jump
    Music.PlayFile ("jump.wav")
end Jump
%Coin sound effect%
process Coin
    Music.PlayFile ("coin.wav")
end Coin
%Level Complete music%
process LevelComplete
    Music.PlayFile ("LevelComplete.mp3")
end LevelComplete

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            %
%%% Procedures & Functions %%%
%                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var fdirect : string := "up"
var ftime : int := 0
var s : int
var qq : int := -40
proc fireball
    if fdirect = "up" then
	ftime += 1
	if ftime = 4 then
	    qq += 1
	    ftime := 0
	end if
	Pic.Draw (fireballup, s + 40, qq, picMerge)
	if qq > 350 then
	    fdirect := "down"
	end if
    elsif fdirect = "down" then
	ftime += 1
	if ftime = 4 then
	    qq -= 1
	    ftime := 0
	end if
	Pic.Draw (fireballdown, s + 40, qq, picMerge)
	if qq < -200 then
	    fdirect := "up"
	end if
    end if
    if x + 70 > s + 40 and x < s + 70 and y > qq and y < qq + 50 then
	boom := false
    end if
end fireball
proc Chasm (a, b : int)
    s := a
    if level = 1 or level = 3 then
	Draw.FillBox (a, b, a + 150, b + 105, 53)
	if View.WhatDotColour (x, y) = 53 then
	    if x > a and x + 70 < a + 150 then
		y -= 10
	    end if
	    if y < 0 then
		y -= 500
		View.Update
		boom := false
	    end if
	end if
    elsif level = 2 or level = 4 then
	Draw.FillBox (a, b, a + 150, b + 105, 7)
	if level = 4 then
	    fireball
	end if
	if View.WhatDotColour (x, y) = 7 then
	    if x > a and x + 70 < a + 150 then
		y -= 10
	    end if
	    if y < 0 then
		y -= 500
		View.Update
		boom := false
	    end if
	end if
    end if
end Chasm
% Function determines whether Goombas are dead or alive %
fcn GDA : boolean
    if gstatus = "alive" then
	result true
    elsif gstatus = "dead" then
	result false
    else
	result false
    end if
end GDA
% Goomba moving procedure, variable before procedure refers to procedure only %
proc Goomba (var g : int, var gy : int)
    if boom = false then
	g := 930
	gy := 95
    end if
    gt := g
    gw := gy
    if GDA = true then         % alive
	g -= 1
	if gtemp = 1 and gstatus = "alive" then
	    Pic.Draw (goomba1, g, gy, picMerge)
	    gr += 1
	    if gr = 12 then
		gtemp := 2
		gr := 0
	    end if
	elsif gtemp = 2 and gstatus = "alive" then
	    Pic.Draw (goomba2, g, gy, picMerge)
	    gr += 1
	    if gr = 12 then
		gtemp := 1
		gr := 0
	    end if
	end if
	if g < x + 50 and x < g + 65 and y > 90 and y < 150 and gstatus = "alive" then
	    boom := false
	    gstatus := "dead"
	elsif g < x + 50 and x < g + 65 and y < 200 and y > 100 then         %Killed Goomba
	    score += 200
	    gstatus := "dodead"
	end if
	if View.WhatDotColour (gt + 70, gw) = 53 then
	    gw -= 10
	    if gw < 0 then
		gw -= 100
		gstatus := "dead"
	    end if
	elsif View.WhatDotColour (gt + 70, gw) = 7 and level = 4 or View.WhatDotColour (gt + 70, gw) = 7 and level = 2 then
	    gw -= 10
	    if gw < 0 then
		gw -= 100
		gstatus := "dead"
	    end if
	end if
	if g > maxx or g < 0 then
	    gstatus := "dead"
	end if
    elsif GDA = false then
	if gstatus = "dodead" then
	    Pic.Draw (goombadie, g, gy, picMerge)
	    dtime += 1
	    if dtime = 100 then
		Pic.Draw (goombadie, g, gy, picMerge)
		dtime := 0
		gstatus := "dead"
	    end if
	elsif dtime = 800 then
	    gstatus := "alive"
	    g := 930
	    gw := 95
	    dtime := 0
	else
	    dtime += 1
	end if
    else         % alive, do nothing
    end if
end Goomba
proc fireleft
    FX -= 3
    if ftemp = 1 then
	Pic.Draw (bLfire1, FX, 170, picMerge)
	fr += 1
	if fr = 10 then
	    ftemp := 2
	    fr := 0
	end if
    elsif ftemp = 2 then
	Pic.Draw (bLfire2, FX, 170, picMerge)
	fr += 1
	if fr = 10 then
	    ftemp := 1
	    fr := 0
	end if
    end if
    if FX < -50 or FX > maxx then
	bstatus := "none"
	fr := 0
    end if
    FX := FX
    if x + 50 > FX and x < FX + 90 and y > 135 and y < 170 then  % hit by fire
	boom := false
    end if
end fireleft
proc fireright
    FX += 3
    if ftemp = 1 then
	Pic.Draw (bRfire1, FX, 170, picMerge)
	fr += 1
	if fr = 10 then
	    ftemp := 2
	    fr := 0
	end if
    elsif ftemp = 2 then
	Pic.Draw (bRfire2, FX, 170, picMerge)
	fr += 1
	if fr = 10 then
	    ftemp := 1
	    fr := 0
	end if
    end if
    if FX < -50 or FX > maxx then
	bstatus := "none"
	fr := 0
    end if
    FX := FX
    if x + 50 > FX and x < FX + 90 and y > 135 and y < 170 then  % hit by fire
	boom := false
    end if
end fireright
proc Bowser
    if button = false and BX < maxx - 150 then % not pressed
	Pic.Draw (BButton, maxx - 120, 95, picMerge)
    elsif button = true then
	Pic.Draw (BButtonP, maxx - 120, 95, picMerge)
    end if
    if btemp = 1 then
	if bdirect = "right" then
	    BX += 1
	    if bstatus = "fire" then
		Pic.Draw (bRfirerun1, BX, BY, picMerge)
	    else
		Pic.Draw (bRrun1, BX, BY, picMerge)
	    end if
	elsif bdirect = "left" then
	    BX -= 1
	    if bstatus = "fire" then
		Pic.Draw (bLfirerun1, BX, BY, picMerge)
	    else
		Pic.Draw (bLrun1, BX, BY, picMerge)
	    end if
	end if
	br += 1
	if br = 18 then
	    btemp := 2
	    br := 0
	end if
    elsif btemp = 2 then
	if bdirect = "right" then
	    BX += 1
	    if bstatus = "fire" then
		Pic.Draw (bRfirerun2, BX, BY, picMerge)
	    else
		Pic.Draw (bRrun2, BX, BY, picMerge)
	    end if
	elsif bdirect = "left" then
	    BX -= 1
	    if bstatus = "fire" then
		Pic.Draw (bLfirerun2, BX, BY, picMerge)
	    else
		Pic.Draw (bLrun2, BX, BY, picMerge)
	    end if
	end if
	br += 1
	if br = 18 then
	    btemp := 1
	    br := 0
	end if
    end if
    randint (rew, 1, 500)
    if rew = 25 then
	if bdirect = "right" then
	    FX := BX + 40
	elsif bdirect = "left" then
	    FX := BX - 40
	end if
	bstatus := "fire"
    elsif rew = 50 then
	bstatus := "none"
    end if
    if bstatus = "fire" and bdirect = "right" then
	fireright
    elsif bstatus = "fire" and bdirect = "left" then
	fireleft
    end if
    if x + 50 > maxx - 120 and x < maxx and y > 100 and y < 165 then % button pressed
	button := true % BOWSER DEAD!
	killspot := BX
    end if
    if button = true then
	if bdirect = "left" then
	    Chasm (killspot - 50, 0)
	elsif bdirect = "right" then
	    Chasm (killspot + 50, 0)
	end if
    end if
    if View.WhatDotColour (BX - 2, gw) = 7 then
	BY -= 10
	if BY < -150 then
	    bstatus := "dead"
	end if
	delay (2)
    end if
    if x + 50 > BX and x < BX + 120 and y > 90 and y < 230 then % hit from left side
	boom := false
    elsif x < BX + 120 and x > BX and y > 90 and y < 230 then % hit from other side
	boom := false
    end if
    if BX + 130 > maxx then
	bdirect := "left"
    elsif BX < 0 then
	bdirect := "right"
    end if
    if bstatus = "dead" then
	Draw.Text ("YOU KILLED BOWSER!", 100, 400, font1, 53)
	View.Update
	delay (5000)
	leveldone := true
	level := 5
    end if
end Bowser
proc ScoreTable
    if character = "mario" then
	Draw.Text ("MARIO", 30, 650, font1, white)
    elsif character = "luigi" then
	Draw.Text ("LUIGI", 30, 650, font1, white)
    end if
    Draw.Text (intstr (score), 30, 610, font1, white)
    times -= 0.01
    Draw.Text ("TIME", 800, 650, font1, white)
    if level = 1 or level = 3 then
	colourback (53)
    elsif level = 2 or level = 4 then
	colourback (7)
    end if
    colour (white)
    Text.Locate (5, 103)
    put times ..
    Pic.Draw (coin, 290, 645, picMerge)
    Draw.Text ("X", 350, 650, font1, white)
    Draw.Text (intstr (coinh), 390, 650, font1, white)
    if level = 1 then
	Draw.Text ("WORLD 1-1", 500, 650, font1, white)
    elsif level = 2 then
	Draw.Text ("WORLD 1-2", 500, 650, font1, white)
    elsif level = 3 then
	Draw.Text ("WORLD 1-3", 500, 650, font1, white)
    elsif level = 4 then
	Draw.Text ("WORLD 1-4", 500, 650, font1, white)
    end if
end ScoreTable
proc coinhit1
    var row, col : int
    col := (y - 200) div 50 + 1
    row := (x - 340) div 50 + 1
    if row > 0 and row < 7 and col > 0 and col < 5 then
	if coins (row, col) = true then
	    coins (row, col) := false
	    fork Coin
	    score += 100
	    coinh += 1
	end if
    end if
end coinhit1
proc DrawL1
    Pic.Draw (back1, r, 1, picCopy)
    ScoreTable
    Chasm (c, 0)
    Chasm (c + 1200, 0)
    Chasm (c + 2000, 0)
    Chasm (c + 1600, 0)
    Chasm (c + 3000, 0)
    Chasm (c + 4000, 0)
    Goomba (gt, gw)
    Pic.Draw (flag, f, 95, picMerge)
    Pic.Draw (lilC, f + 200, 95, picMerge)
end DrawL1
proc DrawL2
    Pic.Draw (back3, r, 1, picCopy)
    ScoreTable
    Chasm (c, 0)
    Chasm (c + 400, 0)
    Chasm (c + 1230, 0)
    Chasm (c + 1600, 0)
    Chasm (c + 2000, 0)
    Chasm (c + 2700, 0)
    Chasm (c + 3400, 0)
    Chasm (c + 4000, 0)
    Goomba (gt, gw)
    Pic.Draw (sidetube, tx, 95, picMerge)
    Pic.Draw (talltube, tx + 140, 95, picMerge)
    if x + 70 > tx and y < 120 then
	score += (round (times))
	View.Update
	Music.PlayFile ("tube.mp3")
	leveldone := true
	direct := "right"
	music := "none"
	temp := 1
	f := 5500
	r := 0
	x := 0
	y := 95
	gt := 930
	level += 1
    end if
end DrawL2
proc DrawS
    Pic.Draw (backS, 0, 1, picCopy)
    ScoreTable
    var x, y : int   % location of bottom left corner of each brick
    for row : 1 .. 6
	for col : 1 .. 4
	    y := (col - 1) * 50 + 250
	    x := (row - 1) * 50 + 340
	    if coins (row, col) = true then   % coins there
		Pic.Draw (coin, x, y, picMerge)
	    end if
	end for
    end for
    coinhit1
    Pic.Draw (sidetube, tx, 95, picMerge)
    Pic.Draw (talltube, tx + 140, 95, picMerge)
end DrawS
proc DrawL3
    Pic.Draw (back2, r, 1, picCopy)
    ScoreTable
    Chasm (c, 0)
    Chasm (c + 900, 0)
    Chasm (c + 2150, 0)
    Chasm (c + 1650, 0)
    Chasm (c + 3000, 0)
    Chasm (c + 4000, 0)
    Pic.Draw (sidetube, tx, 95, picMerge)
    Pic.Draw (talltube, tx + 140, -570, picMerge)
    if x + 70 > tx and y < 120 and x < tx + 170 then
	Music.PlayFile ("tube.mp3")
	levelstat := "secret"
    end if
    Goomba (gt, gw)
    Pic.Draw (tube, f - 5500, 95, picMerge)
    Pic.Draw (flag, f, 95, picMerge)
    Pic.Draw (lilC, f + 200, 95, picMerge)
end DrawL3
proc DrawL4
    Pic.Draw (back4, r, 1, picCopy)
    ScoreTable
    Chasm (c, 0)
    Chasm (c + 400, 0)
    Chasm (c + 1230, 0)
    Chasm (c + 3000, 0)
    Chasm (c + 4600, 0)
    Chasm (c + 6000, 0)
    Chasm (c + 7500, 0)
    Chasm (c + 8000, 0)
    Chasm (c + 8400, 0)
    Chasm (c + 9000, 0)
    Chasm (c + 9500, 0)
    Chasm (c + 12000, 0)
    if r < -13000 then
	Bowser
    else
	Goomba (gt, gw)
    end if
end DrawL4
% Dying procedure
proc Die
    if boom = false then
	Music.PlayFileStop
	fork die
	delay (500)
	if level = 1 then
	    DrawL1
	elsif level = 2 then
	    DrawL2
	elsif level = 3 then
	    DrawL3
	elsif level = 4 then
	    DrawL4
	end if
	if character = "mario" then
	    Pic.Draw (mdie, x, y, picMerge)
	elsif character = "luigi" then
	    Pic.Draw (ldie, x, y, picMerge)
	end if
	View.Update
	delay (500)
	for i : 1 .. 10
	    times += 0.01
	    if level = 1 then
		DrawL1
	    elsif level = 2 then
		DrawL2
	    elsif level = 3 then
		DrawL3
	    elsif level = 4 then
		DrawL4
	    end if
	    y += 30
	    if character = "mario" then
		Pic.Draw (mdie, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (ldie, x, y, picMerge)
	    end if
	    View.Update
	    delay (110)
	end for
	for j : 1 .. 15
	    times += 0.01
	    if level = 1 then
		DrawL1
	    elsif level = 2 then
		DrawL2
	    elsif level = 3 then
		DrawL3
	    elsif level = 4 then
		DrawL4
	    end if
	    y -= 50
	    if character = "mario" then
		Pic.Draw (mdie, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (ldie, x, y, picMerge)
	    end if
	    View.Update
	    delay (60)
	end for
	delay (500)
	lives -= 1
    end if
end Die
proc Drawopening
    Pic.Draw (opening, 0, 0, picCopy)
    Draw.FillBox (1, 93, 63, 193, black)
    Draw.FillOval (32, 193, 31, 31, black)
    Pic.Draw (brick, 250, 300, picMerge)
    Draw.Text ("Play Game", 310, 315, font, white)
    Pic.Draw (brick, 465, 300, picMerge)
    Draw.Text ("Credits", 535, 315, font, white)
    Pic.Draw (brick, 700, 300, picMerge)
    Draw.Text ("Highscores", 760, 315, font, white)
end Drawopening
%What happens when finished a level%
proc LevelDone
    Music.PlayFileStop
    if level = 1 then
	DrawL1
    elsif level = 2 then
	DrawL2
    elsif level = 3 then
	DrawL3
    elsif level = 4 then
	DrawL4
    end if
    gstatus := "dead"
    dtime := -200
    if character = "mario" then
	Pic.Draw (mCpole, x, y, picMerge)
    elsif character = "luigi" then
	Pic.Draw (lCpole, x, y, picMerge)
    end if
    View.Update
    delay (500)
    loop
	times += 0.01
	if level = 1 then
	    DrawL1
	elsif level = 2 then
	    DrawL2
	elsif level = 3 then
	    DrawL3
	elsif level = 4 then
	    DrawL4
	end if
	y -= 5
	if character = "mario" then
	    Pic.Draw (mRpole, x, y, picMerge)
	elsif character = "luigi" then
	    Pic.Draw (lRpole, x, y, picMerge)
	end if
	delay (10)
	View.Update
	exit when y < 115
    end loop
    if level = 1 then
	DrawL1
    elsif level = 2 then
	DrawL2
    elsif level = 3 then
	DrawL3
    elsif level = 4 then
	DrawL4
    end if
    x += 75
    tr := 0
    if character = "mario" then
	Pic.Draw (mLpole, x - 10, y, picMerge)
    elsif character = "luigi" then
	Pic.Draw (lLpole, x - 10, y, picMerge)
    end if
    View.Update
    y := 95
    delay (1000)
    fork LevelComplete
    loop
	times += 0.01
	if level = 1 then
	    DrawL1
	elsif level = 2 then
	    DrawL2
	elsif level = 3 then
	    DrawL3
	elsif level = 4 then
	    DrawL4
	end if
	direct := "right"
	x += 1
	if temp = 1 then
	    if character = "mario" then
		Pic.Draw (mRrun1, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (lRrun1, x, y, picMerge)
	    end if
	    tr += 1
	    if tr = 16 then
		temp := 2
		tr := 0
	    end if
	elsif temp = 2 then
	    if character = "mario" then
		Pic.Draw (mRrun2, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (lRrun2, x, y, picMerge)
	    end if
	    tr += 1
	    if tr = 16 then
		temp := 3
		tr := 0
	    end if
	elsif temp = 3 then
	    if character = "mario" then
		Pic.Draw (mRrun3, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (lRrun3, x, y, picMerge)
	    end if
	    tr += 1
	    if tr = 16 then
		temp := 1
		tr := 0
	    end if
	end if
	Draw.FillBox (f + 330, 95, f + 395, 200, black)
	if x + 70 = f + 400 then
	    exit
	end if
	if x + 70 > maxx - 400 then         % Base moving animation
	    x -= 1
	    r -= 1
	    gt -= 2
	    c -= 1
	    f -= 1
	end if
	delay (10)
	View.Update
    end loop
    score += (round (times))
    View.Update
    delay (4000)         % until we get the score and time working
    Music.PlayFileStop
    %Reset variables
    music := "none"
    direct := "right"
    times := 200
    temp := 1
    f := 5500
    r := 0
    x := 0
    y := 95
    gt := 930
    level += 1
end LevelDone
proc standjump
    fork Jump
    jump := true
    if jump = true then
	inity := y
	loop
	    if level = 0 then
		Drawopening
	    elsif level = 1 then
		DrawL1
	    elsif level = 2 then
		DrawL2
	    elsif level = 3 then
		DrawL3
	    elsif level = 4 then
		DrawL4
	    end if
	    if tr < 71 then
		y += 2
	    elsif tr > 70 then
		y -= 2
	    end if
	    if direct = "right" then
		if character = "mario" then
		    Pic.Draw (mRjump, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lRjump, x, y, picMerge)
		end if
	    elsif direct = "left" then
		if character = "mario" then
		    Pic.Draw (mLjump, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lLjump, x, y, picMerge)
		end if
	    end if
	    tr += 1
	    View.Update
	    exit when tr = 140
	end loop
	jump := false
	y := inity
	ch := "1"
	tr := 0
    end if
end standjump
%Big Jump procedure%
proc bigjump
    fork Jump
    jump := true
    initx := x
    inity := y
    y += 3
    tr := 0
    if jump = true then
	loop
	    if y < inity then
		jump := false
		y := inity
	    end if
	    if level = 1 then
		DrawL1
	    elsif level = 2 then
		DrawL2
	    elsif level = 3 then
		if levelstat = "secret" then
		    DrawS
		else
		    DrawL3
		end if
	    elsif level = 4 then
		DrawL4
	    end if
	    if x + 70 > s + 40 and x < s + 70 and y > qq and y < qq + 50 then
		boom := false
	    end if
	    if direct = "right" then
		y := round (3 * -0.01 * (x - initx) * (x - initx - 200) + inity)
		if character = "mario" then
		    Pic.Draw (mRjump, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lRjump, x, y, picMerge)
		end if
		x += 2
	    elsif direct = "left" then
		y := round (3 * -0.01 * (x - initx) * (x - initx + 200) + inity)
		if character = "mario" then
		    Pic.Draw (mLjump, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lLjump, x, y, picMerge)
		end if
		x -= 2
	    end if
	    if x + 70 > maxx - 400 and direct = "right" then         % Base moving animation
		if r < -13000 and level = 4 or levelstat = "secret" then         % boundary
		    if x + 70 > maxx then
			x := maxx - 70
		    elsif x < 0 then
			x := 0
		    end if
		else
		    if level = 2 or level = 3 then
			if levelstat = "secret" then
			else
			    tx -= 2
			end if
		    end if
		    r -= 2
		    gt -= 2
		    c -= 2
		    f -= 2
		    if level = 2 then
			tx -= 4
		    end if
		end if
	    end if
	    if x + 70 > f + 50 and level = 1 or x + 70 > f + 50 and level = 3 then         % Touched the flag
		LevelDone
		leveldone := true
		exit
	    end if
	    tr += 1
	    View.Update
	    exit when tr = 100
	end loop
	tr := 0
    end if
end bigjump
% Character moving procedure %
proc Move
    if hasch then
	getch (ch)
    end if
    Input.KeyDown (chars)
    if chars (KEY_RIGHT_ARROW) then         % go right
	direct := "right"
	x += 3
	if temp = 1 then
	    if character = "mario" then
		Pic.Draw (mRrun1, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (lRrun1, x, y, picMerge)
	    end if
	    tr += 1
	    if tr = 16 then
		temp := 2
		tr := 0
	    end if
	elsif temp = 2 then
	    if character = "mario" then
		Pic.Draw (mRrun2, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (lRrun2, x, y, picMerge)
	    end if
	    tr += 1
	    if tr = 16 then
		temp := 3
		tr := 0
	    end if
	elsif temp = 3 then
	    if character = "mario" then
		Pic.Draw (mRrun3, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (lRrun3, x, y, picMerge)
	    end if
	    tr += 1
	    if tr = 16 then
		temp := 1
		tr := 0
	    end if
	end if
	if x + 70 > maxx - 400 then         % Base moving animation
	    if r < -13000 and level = 4 or levelstat = "secret" then         % boundary
		if x + 70 > maxx then
		    x := maxx - 70
		elsif x < 0 then
		    x := 0
		end if
	    else
		r -= 2
		gt -= 2
		c -= 2
		f -= 2
		if x > maxx - 400 then
		    x -= 4
		elsif x < maxx - 400 then
		    x -= 3
		end if
		if level = 2 or level = 3 then
		    tx -= 2
		end if
	    end if
	else         % at the flag
	    if level = 1 or level = 3 then
		if x + 70 > f then
		    x := 390
		end if
	    end if
	end if
    elsif chars (KEY_LEFT_ARROW) then         % go left
	direct := "left"
	x -= 3
	if temp = 1 then
	    if character = "mario" then
		Pic.Draw (mLrun1, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (lLrun1, x, y, picMerge)
	    end if
	    tr += 1
	    if tr = 16 then
		temp := 2
		tr := 0
	    end if
	elsif temp = 2 then
	    if character = "mario" then
		Pic.Draw (mLrun2, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (lLrun2, x, y, picMerge)
	    end if
	    tr += 1
	    if tr = 16 then
		temp := 3
		tr := 0
	    end if
	elsif temp = 3 then
	    if character = "mario" then
		Pic.Draw (mLrun3, x, y, picMerge)
	    elsif character = "luigi" then
		Pic.Draw (lLrun3, x, y, picMerge)
	    end if
	    tr += 1
	    if tr = 16 then
		temp := 1
		tr := 0
	    end if
	end if
	if x < 0 then
	    x := 0
	end if
    elsif ord (ch) = 200 then         % go up
	bigjump
	if y > 95 then
	    y := 95
	end if
	ch := "1"
    else
	if y > 95 then
	    y -= 5
	    if direct = "right" then
		if character = "mario" then
		    Pic.Draw (mRjump, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lRjump, x, y, picMerge)
		end if
	    elsif direct = "left" then
		if character = "mario" then
		    Pic.Draw (mLjump, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lLjump, x, y, picMerge)
		end if
	    end if
	else
	    if direct = "right" then
		if character = "mario" then
		    Pic.Draw (mRstand, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lRstand, x, y, picMerge)
		end if
	    elsif direct = "left" then
		if character = "mario" then
		    Pic.Draw (mLstand, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lLstand, x, y, picMerge)
		end if
	    end if
	end if
    end if
    View.Update
end Move
% Displays level and lives before each level beings %
proc DisplayLevel
    if music = "hurry" then
    else
	colourback (black)
	cls
	if character = "mario" then
	    Pic.Draw (lilmario, 400, 350, picMerge)
	elsif character = "luigi" then
	    Pic.Draw (lilluigi, 400, 350, picMerge)
	end if
	Draw.Text ("World", 400, 430, font, white)
	Draw.Text (intstr (world), 490, 430, font, white)
	Draw.Text (" - ", 490, 430, font, white)
	Draw.Text (intstr (level), 520, 430, font, white)
	Draw.Text (" X ", 440, 360, font, white)
	Draw.Text (intstr (lives), 510, 360, font, white)
	View.Update
	button := false
	if level = 2 then
	    tx := 8100
	elsif level = 3 then
	    tx := 2800
	end if
	gt := 900         %where goomba starts
	x := 0         % where character starts
	y := 95         % height of character when started
	f := 5500         % length until the end
	r := 0
	BX := 1000         % position of bowser
	times := 200
	boom := true
	if level = 1 then
	    c := 500
	elsif level = 2 then
	    c := 500
	elsif level = 3 then
	    x := 100
	    c := 900
	elsif level = 4 then
	    c := 650
	end if
	for i : 1 .. 6
	    for j : 1 .. 4
		coins (i, j) := true % coins are there for secret level
	    end for
	end for
	delay (3000)
    end if
end DisplayLevel
%Level1%
proc Level1
    if music = "hurry" then
	fork hurryOW
    else
	fork overworld
    end if
    loop
	if times < 100 then
	    if music = "hurry" then
	    else
		Music.PlayFileStop
		music := "hurry"
		exit
	    end if
	end if
	DrawL1
	Move
	Die
	exit when boom = false or leveldone = true
    end loop
    leveldone := false
    Music.PlayFileStop
end Level1
%Level2%
proc Level2
    if music = "hurry" then
	fork hurryUW
    else
	fork underworld
    end if
    loop
	if times < 100 then
	    if music = "hurry" then
	    else
		Music.PlayFileStop
		music := "hurry"
		exit
	    end if
	end if
	DrawL2
	Move
	Die
	exit when boom = false or leveldone = true
    end loop
    leveldone := false
    Music.PlayFileStop
end Level2
proc LevelS
    if music = "hurry" then
	fork hurryUW
    else
	fork underworld
    end if
    tx := maxx - 200
    x := 0
    loop
	if times < 100 then
	    if music = "hurry" then
	    else
		Music.PlayFileStop
		music := "hurry"
		exit
	    end if
	end if
	DrawS
	Move
	if x + 70 > tx then
	    Music.PlayFile ("tube.mp3")
	    x := 100
	    exit
	end if
    end loop
    levelstat := "done"
    tx := 10000
end LevelS
%Level3%
proc Level3
    if music = "hurry" then
	fork hurryOW
    else
	fork overworld
    end if
    loop
	if times < 100 then
	    if music = "hurry" then
	    else
		Music.PlayFileStop
		music := "hurry"
		exit
	    end if
	end if
	DrawL3
	Move
	Die
	exit when boom = false or leveldone = true or levelstat = "secret"
    end loop
    leveldone := false
    Music.PlayFileStop
end Level3
%Level4%
proc Level4
    fork castle
    loop
	DrawL4
	Move
	Die
	exit when boom = false or leveldone = true
    end loop
    Music.PlayFileStop
end Level4
proc WinnerScreen
    colourback (53)
    cls
    Draw.Text ("YOU WON!", 400, 530, font1, black)
    Draw.Text ("Score : ", 350, 350, font, black)
    Draw.Text (intstr (score), 480, 350, font, black)
    Draw.Text ("Click anywhere to continue..", 200, 100, font, white)
    View.Update
    loop
	Mouse.Where (mx, my, mbut)
	exit when mbut = 1
    end loop
    loop
	Mouse.Where (mx, my, mbut)
	exit when mbut = 0
    end loop
    level += 1
end WinnerScreen
proc smove
    select := "select"
    if character = "mario" then
	if direct = "right" then
	    Pic.Draw (mRstand, x, y, picMerge)
	elsif direct = "left" then
	    Pic.Draw (mLstand, x, y, picMerge)
	end if
    elsif character = "luigi" then
	if direct = "right" then
	    Pic.Draw (lRstand, x, y, picMerge)
	elsif direct = "left" then
	    Pic.Draw (lLstand, x, y, picMerge)
	end if
    end if
    if hasch then
	getch (ch)
    end if
    if ord (ch) = 205 then         % right
	direct := "right"
	loop
	    Drawopening
	    x += 1
	    if x = 240 then
		x := 240
		exit
	    elsif x = 465 then
		x := 465
		exit
	    end if
	    if x > 690 then
		direct := "left"
		x := 690
		exit
	    end if
	    if temp = 1 then
		if character = "mario" then
		    Pic.Draw (mRrun1, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lRrun1, x, y, picMerge)
		end if
		tr += 1
		if tr = 16 then
		    temp := 2
		    tr := 0
		end if
	    elsif temp = 2 then
		if character = "mario" then
		    Pic.Draw (mRrun2, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lRrun2, x, y, picMerge)
		end if
		tr += 1
		if tr = 16 then
		    temp := 3
		    tr := 0
		end if
	    elsif temp = 3 then
		if character = "mario" then
		    Pic.Draw (mRrun3, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lRrun3, x, y, picMerge)
		end if
		tr += 1
		if tr = 16 then
		    temp := 1
		    tr := 0
		end if
	    end if
	    if x < 100 and direct = "right" then
	    else
		Draw.FillBox (1, 93, 63, 193, black)
		Draw.FillOval (32, 193, 31, 31, black)
	    end if
	    View.Update
	end loop
	ch := "1"
    elsif ord (ch) = 203 then         % left
	direct := "left"
	loop
	    Drawopening
	    x -= 1
	    if x = 240 then
		x := 240
		exit
	    elsif x = 465 then
		x := 465
		exit
	    end if
	    if x > 690 then
		x := 690
	    elsif x < 0 then
		direct := "right"
		x := 0
		exit
	    end if
	    if temp = 1 then
		if character = "mario" then
		    Pic.Draw (mLrun1, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lLrun1, x, y, picMerge)
		end if
		tr += 1
		if tr = 16 then
		    temp := 2
		    tr := 0
		end if
	    elsif temp = 2 then
		if character = "mario" then
		    Pic.Draw (mLrun2, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lLrun2, x, y, picMerge)
		end if
		tr += 1
		if tr = 16 then
		    temp := 3
		    tr := 0
		end if
	    elsif temp = 3 then
		if character = "mario" then
		    Pic.Draw (mLrun3, x, y, picMerge)
		elsif character = "luigi" then
		    Pic.Draw (lLrun3, x, y, picMerge)
		end if
		tr += 1
		if tr = 16 then
		    temp := 1
		    tr := 0
		end if
	    end if
	    if x = 2 then
		select := "selectchar"
		character := "none"
	    end if
	    Draw.FillBox (1, 93, 63, 193, black)
	    Draw.FillOval (32, 193, 31, 31, black)
	    View.Update
	end loop
	ch := "1"
    elsif ord (ch) = 200 then  % jump
	loop
	    Drawopening
	    standjump
	    exit when ch = "1"
	end loop
	if x = 240 then
	    select := "game"
	    level := 1
	elsif x = 465 then
	    select := "highscores"
	end if
    end if
    View.Update
end smove
proc credits
    colourback (53)
    cls
    Draw.Text ("Made by: Matt & Jeremy", 240, 650, font1, black)
    Draw.Text ("Production Coordinator : Matt Pflance", 80, 580, font1, black)
    Draw.Text ("Artistic Director : Jeremy Evans", 100, 510, font1, black)
    Draw.Text ("Musical Director : Nintendo", 130, 440, font1, black)
    Draw.Text ("Click anywhere to continue", 280, 250, font, white)
    View.Update
end credits
% Selecting a character procedure %
proc Select
    fork titlesong
    lives := 5
    loop
	Pic.Draw (opening, 0, 0, picCopy)
	Draw.Text ("Pick a Character..", 300, 350, font, black)
	Pic.Draw (mRstand, 100, 93, picMerge)
	Pic.Draw (lLstand, 300, 93, picMerge)
	View.Update
	loop
	    Mouse.Where (mx, my, mbut)
	    if mx > 100 and mx < 150 and my > 119 and my < 200 and mbut = 1 then
		character := "mario"
	    elsif mx > 300 and mx < 350 and my > 119 and my < 200 and mbut = 1 then
		character := "luigi"
	    end if
	    exit when character = "luigi" or character = "mario"
	end loop
	loop
	    Drawopening
	    smove
	    if select = "highscores" then
		loop
		    credits
		    Mouse.Where (mx, my, mbut)
		    exit when mbut = 1
		end loop
	    end if
	    exit when select = "game" or select = "selectchar"
	end loop
	exit when select = "game"
    end loop
    Music.PlayFileStop
end Select
% Game Over procedure, resets all variables %
proc gameover
    colourback (53)
    cls
    Music.PlayFileStop
    fork dead
    % Reset all variables
    boom := true
    gstatus := "alive"
    character := "none"
    direct := "right"
    temp := 1
    r := 0
    x := 0
    tx := 8100
    y := 95
    gt := 930
    lives := 5
    level := 0
    cls
    Font.Draw ("GAME OVER", 380, 400, font1, black)
    Font.Draw (intstr (score), 400, 200, font, white)
    Font.Draw ("Score : ", 280, 200, font, white)
    Font.Draw ("Click anywhere to continue..", 100, 100, font, black)
    View.Update
    loop
	Mouse.Where (mx, my, mbut)
	exit when mbut = 1
    end loop
    loop
	Mouse.Where (mx, my, mbut)
	exit when mbut = 0
    end loop
    score := 0
end gameover
% Game procedure %
proc Game
    loop
	Select
	loop
	    if levelstat = "done" then
		levelstat := "none"
	    else
		DisplayLevel
	    end if
	    if level = 1 then
		Level1
	    elsif level = 2 then
		Level2
	    elsif level = 3 then
		if levelstat = "secret" then
		    LevelS
		else
		    Level3
		end if
	    elsif level = 4 then
		Level4
	    elsif level = 5 then
		WinnerScreen
	    end if
	    exit when lives = 0 or level = 6
	end loop
	level := 0
	if boom = false then
	    gameover
	else
	end if
    end loop
end Game

Game


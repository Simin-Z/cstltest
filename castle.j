
function eR takes real xR returns nothing
local real oR
local real st=TimerGetElapsed(udg_UO)
if st<=0 then
set udg_UO=CreateTimer()
call TimerStart(udg_UO,0xF4240,false,null)
endif
if(xR>0)then
loop
set oR=xR-TimerGetElapsed(udg_UO)+st
exitwhen oR<=0
if(oR>bj_POLLED_WAIT_SKIP_THRESHOLD)then
call TriggerSleepAction(.1*oR)
else
call TriggerSleepAction(bj_POLLED_WAIT_INTERVAL)
endif
endloop
endif
endfunction
function rR takes location iR,real aR,real nR returns location
return Location(GetLocationX(iR)+aR*Cos(nR*bj_DEGTORAD),GetLocationY(iR)+aR*Sin(nR*bj_DEGTORAD))
endfunction
function VR takes nothing returns boolean
local destructable d=GetFilterDestructable()
local real dx=GetDestructableX(d)-udg_WO
local real dy=GetDestructableY(d)-udg_yO
return(dx*dx+dy*dy<=bj_enumDestructableRadius)
endfunction
function ER takes rect r returns group
set udg_YO=CreateGroup()
call GroupEnumUnitsInRect(udg_YO,r,udg_ZO)
return udg_YO
endfunction
function XR takes real OR,location RR,boolexpr IR returns group
set udg_YO=CreateGroup()
call GroupEnumUnitsInRangeOfLoc(udg_YO,RR,OR,IR)
return udg_YO
endfunction
function AR takes real OR,location RR returns group
set udg_YO=CreateGroup()
call GroupEnumUnitsInRangeOfLoc(udg_YO,RR,OR,udg_ZO)
return udg_YO
endfunction
function NR takes player bR returns group
set udg_YO=CreateGroup()
call GroupEnumUnitsOfPlayer(udg_YO,bR,udg_ZO)
return udg_YO
endfunction
function BR takes player bR returns force
set udg_zO=CreateForce()
call ForceAddPlayer(udg_zO,bR)
return udg_zO
endfunction
function cR takes player bR returns force
set udg_zO=CreateForce()
call ForceEnumAllies(udg_zO,bR,udg_ZO)
return udg_zO
endfunction
function CR takes itemtype dR,integer DR returns nothing
local group g
set bj_stockPickedItemType=dR
set bj_stockPickedItemLevel=DR
set g=CreateGroup()
call GroupEnumUnitsOfType(g,"marketplace",udg_ZO)
call ForGroup(g,function UpdateEachStockBuildingEnum)
call DestroyGroup(g)
set g=null
endfunction
function fR takes nothing returns nothing
local integer pickedItemId
local itemtype FR
local integer gR=0
local integer GR=0
local integer DR
set DR=1
loop
if(bj_stockAllowedPermanent[DR])then
set GR=GR+1
if(GetRandomInt(1,GR)==1)then
set FR=ITEM_TYPE_PERMANENT
set gR=DR
endif
endif
if(bj_stockAllowedCharged[DR])then
set GR=GR+1
if(GetRandomInt(1,GR)==1)then
set FR=ITEM_TYPE_CHARGED
set gR=DR
endif
endif
if(bj_stockAllowedArtifact[DR])then
set GR=GR+1
if(GetRandomInt(1,GR)==1)then
set FR=ITEM_TYPE_ARTIFACT
set gR=DR
endif
endif
set DR=DR+1
exitwhen DR>10
endloop
if(GR==0)then
set FR=null
return
endif
call CR(FR,gR)
set FR=null
endfunction
function hR takes nothing returns nothing
call fR()
call TimerStart(bj_stockUpdateTimer,bj_STOCK_RESTOCK_INTERVAL,true,function fR)
endfunction
function HR takes nothing returns boolean
return true
endfunction
function jR takes nothing returns integer
local integer JR=udg_pE
if(JR!=0)then
set udg_pE=udg_qE[JR]
else
set udg_PE=udg_PE+1
set JR=udg_PE
endif
if(JR>8190)then
return 0
endif
set udg_QE[JR]=0
set udg_sE[JR]=0
set udg_qE[JR]=-1
return JR
endfunction
function kR takes integer JR returns nothing
if JR==null then
return
elseif(udg_qE[JR]!=-1)then
return
endif
set udg_qE[JR]=udg_pE
set udg_pE=JR
endfunction
function KR takes nothing returns integer
local integer JR=udg_BO
if(JR!=0)then
set udg_BO=udg_CO[JR]
else
set udg_cO=udg_cO+1
set JR=udg_cO
endif
if(JR>8190)then
return 0
endif
set udg_fO[JR]=0
set udg_CO[JR]=-1
return JR
endfunction
function s__IntSet__allocate takes nothing returns integer
local integer JR=udg_tE
if(JR!=0)then
set udg_tE=udg_uE[JR]
else
set udg_TE=udg_TE+1
set JR=udg_TE
endif
if(JR>8190)then
return 0
endif
set udg_UE[JR]=0
set udg_wE[JR]=0
set udg_WE[JR]=0
set udg_uE[JR]=-1
return JR
endfunction
function lR takes unit LR,unit mR returns integer
set udg_SO=LR
set udg_tO=mR
call TriggerEvaluate(udg_QO)
return udg_uO
endfunction
function MR takes nothing returns integer
local integer JR=udg_nO
if(JR!=0)then
set udg_nO=udg_EO[JR]
else
set udg_VO=udg_VO+1
set JR=udg_VO
endif
if(JR>8190)then
return 0
endif
set udg_LO[JR]=12
set udg_EO[JR]=-1
return JR
endfunction
function s__Team__allocate takes nothing returns integer
local integer JR=udg_ZX
if(JR!=0)then
set udg_ZX=udg_eO[JR]
else
set udg_vO=udg_vO+1
set JR=udg_vO
endif
if(JR>8190)then
return 0
endif
set udg_eO[JR]=-1
return JR
endfunction
function pR takes nothing returns integer
local integer JR=udg_tX
if(JR!=0)then
set udg_tX=udg_uX[JR]
else
set udg_TX=udg_TX+1
set JR=udg_TX
endif
if(JR>15)then
return 0
endif
set udg_wX[JR]=(JR-1)*500
set udg_WX[JR]=1
set udg_yX[JR]=0
set udg_YX[JR]=false
set udg_uX[JR]=-1
return JR
endfunction
function PR takes nothing returns integer
local integer JR=udg_mX
if(JR!=0)then
set udg_mX=udg_pX[JR]
else
set udg_MX=udg_MX+1
set JR=udg_MX
endif
if(JR>8190)then
return 0
endif
set udg_PX[JR]=0
set udg_qX[JR]=0
set udg_QX[JR]=0
set udg_pX[JR]=-1
return JR
endfunction
function qR takes nothing returns integer
local integer JR=udg_jX
if(JR!=0)then
set udg_jX=udg_kX[JR]
else
set udg_JX=udg_JX+1
set JR=udg_JX
endif
if(JR>8190)then
return 0
endif
set udg_KX[JR]=0
set udg_lX[JR]=0
set udg_kX[JR]=-1
return JR
endfunction
function QR takes integer JR returns nothing
if JR==null then
return
elseif(udg_kX[JR]!=-1)then
return
endif
set udg_kX[JR]=udg_jX
set udg_jX=JR
endfunction
function s__List__allocate takes nothing returns integer
local integer JR=udg_dX
if(JR!=0)then
set udg_dX=udg_fX[JR]
else
set udg_DX=udg_DX+1
set JR=udg_DX
endif
if(JR>8190)then
return 0
endif
set udg_FX[JR]=0
set udg_gX[JR]=0
set udg_GX[JR]=0
set udg_fX[JR]=-1
return JR
endfunction
function sR takes nothing returns integer
local integer JR=udg_AX
if(JR!=0)then
set udg_AX=udg_bX[JR]
else
set udg_NX=udg_NX+1
set JR=udg_NX
endif
if(JR>8190)then
return 0
endif
set udg_BX[JR]=0
set udg_cX[JR]=0
set udg_bX[JR]=-1
return JR
endfunction
function SR takes integer JR returns nothing
if JR==null then
return
elseif(udg_bX[JR]!=-1)then
return
endif
set udg_bX[JR]=udg_AX
set udg_AX=JR
endfunction
function s__UnitSet__allocate takes nothing returns integer
local integer JR=udg_iX
if(JR!=0)then
set udg_iX=udg_nX[JR]
else
set udg_aX=udg_aX+1
set JR=udg_aX
endif
if(JR>8190)then
return 0
endif
set udg_VX[JR]=0
set udg_EX[JR]=0
set udg_XX[JR]=0
set udg_nX[JR]=-1
return JR
endfunction
function tR takes nothing returns integer
local integer JR=udg_ZE
if(JR!=0)then
set udg_ZE=udg_eX[JR]
else
set udg_vX=udg_vX+1
set JR=udg_vX
endif
if(JR>8190)then
return 0
endif
set udg_xX[JR]=0
set udg_oX[JR]=0
set udg_eX[JR]=-1
return JR
endfunction
function TR takes integer JR returns nothing
if JR==null then
return
elseif(udg_eX[JR]!=-1)then
return
endif
set udg_eX[JR]=udg_ZE
set udg_ZE=JR
endfunction
function uR takes unit LR,unit mR returns integer
local integer JR=lR(LR,mR)
local integer UR
if(JR==0)then
return 0
endif
set udg_LO[JR]=13
set UR=JR
return JR
endfunction
function wR takes nothing returns timer
if(udg_n==0)then
set udg_a[0]=CreateTimer()
else
set udg_n=udg_n-1
endif
call SaveInteger(udg_o,0,GetHandleId((udg_a[udg_n])),(0))
return udg_a[udg_n]
endfunction
function WR takes timer t returns nothing
if(t==null)then
return
endif
if(udg_n==8191)then
call DestroyTimer(t)
else
call PauseTimer(t)
if((LoadInteger(udg_o,0,GetHandleId((t))))==679645218)then
return
endif
call SaveInteger(udg_o,0,GetHandleId((t)),(679645218))
set udg_a[udg_n]=t
set udg_n=udg_n+1
endif
endfunction
function yR takes nothing returns nothing
set udg_o=InitHashtable()
endfunction
function YR takes integer zR returns nothing
if(SubString(udg_Lr[zR],StringLength(udg_Lr[zR])-8,StringLength(udg_Lr[zR]))==" - AFK|r")then
set udg_se[zR]=false
call SetPlayerName(Player(zR-1),SubString(GetPlayerName(Player(zR-1)),0,StringLength(GetPlayerName(Player(zR-1)))-6))
set udg_Lr[zR]=SubString(udg_Lr[zR],0,StringLength(udg_Lr[zR])-8)+"|r"
call SetPlayerController(Player(zR-1),MAP_CONTROL_USER)
call ForceRemovePlayer(udg_Me,Player(zR-1))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[zR]+"|cffCA0000 is no longer AFK!|r"))
endif
endfunction
function ZR takes integer vI returns nothing
set udg_di[vI]=true
set udg_se[vI]=true
call ForceAddPlayer(udg_Me,Player(-1+(vI)))
call ForceAddPlayer(udg_wo[udg_Fi[vI]],Player(-1+(vI)))
call ForceAddPlayer(udg_Ba,Player(-1+(vI)))
set udg_Zi[udg_Fi[vI]]=(udg_Zi[udg_Fi[vI]]+1)
call SetPlayerName(Player(-1+(vI)),("Bot "+I2S(vI)))
set udg_Lr[vI]=(udg_Fo[vI]+(GetPlayerName(Player(-1+(vI)))+"|r"))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[vI]+" entered the game!"))
endfunction
function eI takes integer xI returns nothing
local integer i
local integer oI=1+xI*6
local integer rI
set i=oI
set rI=(oI+5)
loop
exitwhen i>rI
if(udg_di[i]==false)then
call ZR(i)
return
endif
set i=i+1
endloop
call DisplayTextToPlayer(Player(0),0,0,"No free playerslot found, could not add a bot!")
endfunction
function iI takes integer aI,integer xI returns nothing
local integer nI
set nI=1
loop
exitwhen nI>aI
call eI(xI)
set nI=nI+1
endloop
endfunction
function VI takes nothing returns nothing
local integer EI
if(udg_Zi[0]<udg_Zi[1])then
set EI=udg_Zi[1]-udg_Zi[0]
call iI(EI,0)
else
if(udg_Zi[0]>udg_Zi[1])then
set EI=udg_Zi[0]-udg_Zi[1]
call iI(EI,1)
else
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"Teams are balanced, no bot is added!")
endif
endif
endfunction
function XI takes integer OI returns nothing
call iI(OI-udg_Zi[0],0)
call iI(OI-udg_Zi[1],1)
endfunction
function RI takes integer II returns boolean
local boolean AI=true
if(udg_Ri)then
if(II=='h01P')then
set AI=true
else
set AI=false
endif
endif
if(udg_Ea)then
if(II=='h01P'or II=='h006'or II=='o000'or II=='h01O'or II=='h03Q'or II=='h014'or II=='n01J'or II=='h05L')then
set AI=true
else
set AI=false
endif
endif
if(udg_Kr)then
if(II=='h01P'or II=='h006'or II=='o000')then
set AI=false
else
set AI=true
endif
endif
return AI
endfunction
function NI takes integer II returns boolean
if(udg_Er)then
if(IsUnitIdType(udg_lx[GetUnitPointValueByType(II)],UNIT_TYPE_FLYING))then
return false
else
return true
endif
else
return true
endif
endfunction
function bI takes nothing returns nothing
set udg_E=CreateGroup()
endfunction
function BI takes string s returns nothing
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,30,s)
endfunction
function CI takes nothing returns nothing
local string s="notNull"
if GetEnumUnit()==null then
set s="Null"
endif
set udg_O=udg_O+1
call BI(I2S(udg_O)+":"+GetUnitName(GetEnumUnit())+"("+I2S(GetHandleId(GetEnumUnit()))+")"+s)
endfunction
function dI takes nothing returns integer
local integer i=1
local integer e=0
loop
if udg_Pr[i]then
set e=e+1
endif
exitwhen(i==12)
set i=i+1
endloop
return e
endfunction
function GetNumDrawersNeeded takes nothing returns integer
return udg_qr-dI()
endfunction
function DI takes nothing returns nothing
if(udg_qr-dI())<=0 then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffFFAC00All players have voted for a draw, round will restart!|r")
call TriggerExecute(udg_ln)
endif
endfunction
function fI takes integer FI returns real
if(FI<10)then
return(udg_mo[FI]*.25)+1
else
return((((I2R(FI-9))*.25)+5.11)*.25)+1
endif
endfunction
function gI takes integer GI returns integer
return R2I(udg_yx[GI]*udg_pe[GI]*10)
endfunction
function hI takes integer GI returns integer
return R2I(I2R(gI(GI))*(fI(udg_Kx[(GI)])))
endfunction
function HI takes integer GI returns integer
local real i=hI(GI)
local real j=0
local real k=0
if udg_Cx then
return R2I(30.*(fI(udg_Kx[(GI)])))
endif
loop
exitwhen(i<udg_pr)or(k>=8)
set i=i-udg_pr
set j=j+udg_pr*(1-k/10)
set k=k+1
endloop
set j=j+i*(1-k/10)
return R2I(j*udg_jo[udg_Fi[GI]])
endfunction
function jI takes integer GI returns integer
set udg_Wr[GI]=HI(GI)
return udg_Wr[GI]
endfunction
function JI takes nothing returns nothing
call TriggerSleepAction(.2)
set udg_ii=1
call EnableTrigger(udg_IE)
call DisableTrigger(udg_Jn)
endfunction
function lI takes nothing returns nothing
set udg_yE=InitHashtable()
endfunction
function MI takes nothing returns nothing
set udg_OX=InitHashtable()
endfunction
function sI takes unit KI returns integer
local integer e=qR()
set udg_LX[e]=KI
return e
endfunction
function SI takes integer JR,integer e returns integer
if udg_QX[JR]==0 then
set udg_PX[JR]=e
set udg_qX[JR]=e
else
set udg_KX[udg_qX[JR]]=e
set udg_lX[e]=udg_qX[JR]
set udg_qX[JR]=e
endif
set udg_QX[JR]=udg_QX[JR]+1
return e
endfunction
function tI takes integer JR returns nothing
set udg_SX=udg_PX[JR]
loop
exitwhen udg_SX==0
set udg_sX=udg_SX
set udg_SX=udg_KX[udg_sX]
call QR(udg_sX)
endloop
endfunction
function TI takes integer JR returns nothing
if JR==null then
return
elseif(udg_pX[JR]!=-1)then
return
endif
call tI(JR)
set udg_pX[JR]=udg_mX
set udg_mX=JR
endfunction
function uI takes group UI,integer wI returns nothing
local group g=CreateGroup()
local unit u
call GroupAddGroup(UI,g)
loop
set u=FirstOfGroup(g)
exitwhen u==null
call GroupRemoveUnit(g,u)
call RemoveUnitFromStock(u,udg_ti[wI])
endloop
call DestroyGroup(g)
set g=null
endfunction
function WI takes integer wI,integer yI returns nothing
if yI==-1 then
set udg_ci[25+wI]=true
call uI(udg_Do[1],wI)
set udg_ci[wI]=true
call uI(udg_Do[0],wI)
else
set udg_ci[yI*25+wI]=true
call uI(udg_Do[yI],wI)
endif
endfunction
function YI takes nothing returns nothing
local integer i=0
loop
exitwhen i>udg_Yr
set udg_ci[25+i]=false
set udg_ci[i]=false
set i=i+1
endloop
endfunction
function zI takes player p,integer ZI returns nothing
local integer i=0
local integer yI=udg_Fi[(1+GetPlayerId(p))]
local location l=GetPlayerStartLocationLoc(p)
call CreateUnitAtLocSaveLast(p,ZI,l,bj_UNIT_FACING)
call RemoveLocation(l)
set l=null
loop
exitwhen i>udg_Yr
if not udg_ci[yI*25+i]then
call AddUnitToStockBJ(udg_ti[i],bj_lastCreatedUnit,1,1)
endif
set i=i+1
endloop
call SetUnitPathing(bj_lastCreatedUnit,false)
call GroupAddUnit(udg_Do[yI],bj_lastCreatedUnit)
call SelectUnitForPlayerSingle(bj_lastCreatedUnit,p)
endfunction
function vA takes player p returns integer
local integer yI=udg_Fi[(1+GetPlayerId(p))]
local integer array eA
local integer i=0
local integer j=0
loop
exitwhen i>udg_Yr
if not udg_ci[yI*25+i]then
set eA[j]=i
set j=j+1
endif
set i=i+1
endloop
if j==0 then
return-1
endif
return eA[GetRandomInt(0,j-1)]
endfunction
function xA takes unit oA returns nothing
local integer OI=(1+GetPlayerId(GetOwningPlayer(oA)))
set udg_br[OI]=oA
if udg_Gr then
call WI(GetUnitPointValue(oA),udg_Fi[OI])
if udg_oi then
call WI(GetUnitPointValue(oA),1-udg_Fi[OI])
endif
endif
set udg_ui[OI]=GetUnitPointValue(oA)
call GroupAddUnit(udg_Hx,oA)
if udg_hx==false then
call ShowUnit(oA,false)
else
call SelectUnitForPlayerSingle(oA,GetOwningPlayer(oA))
endif
call TriggerRegisterUnitEvent(udg_EE,oA,EVENT_UNIT_ISSUED_TARGET_ORDER)
call TriggerRegisterUnitEvent(udg_EE,oA,EVENT_UNIT_ISSUED_POINT_ORDER)
if udg_fo then
call UnitRemoveAbility(oA,'A005')
call UnitRemoveAbility(oA,'A06E')
endif
if udg_mi then
call UnitAddItemById(oA,'I00D')
endif
endfunction
function rA takes player p returns integer
local integer i=vA(p)
local integer yI=udg_Fi[(1+GetPlayerId(p))]
if udg_Ca==3 then
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,40,udg_Lr[(1+GetPlayerId(p))]+" has randomed |cffFFFF00"+udg_Go[i]+"|r")
endif
call CreateUnitAtLocSaveLast(p,udg_ti[i],GetPlayerStartLocationLoc(p),bj_UNIT_FACING)
call xA(bj_lastCreatedUnit)
return i
endfunction
function iA takes integer JR,unit aA returns nothing
local integer p=udg_WX[JR]
set udg_UX[udg_wX[JR]+p]=aA
call SaveInteger(udg_zX,JR,GetHandleId(aA),p)
set udg_WX[JR]=p+1
endfunction
function nA takes integer JR returns unit
if udg_WX[JR]<2 then
return null
endif
return udg_UX[udg_wX[JR]+GetRandomInt(1,udg_WX[JR]-1)]
endfunction
function VA takes integer JR,unit EA returns nothing
local integer XA=GetHandleId(EA)
local integer i=LoadInteger(udg_zX,JR,XA)
local integer p=udg_WX[JR]-1
if(i<1 or i>p)then
return
endif
call RemoveSavedInteger(udg_zX,JR,XA)
if udg_YX[JR]then
if(i==udg_yX[JR])then
set udg_yX[JR]=i-1
else
call BJDebugMsg("Warning: Concurrent modification while iterating over RandomList:"+I2S(udg_yX[JR])+":"+I2S(i))
endif
endif
if(i<p)then
set udg_UX[udg_wX[JR]+i]=udg_UX[udg_wX[JR]+p]
call SaveInteger(udg_zX,JR,GetHandleId(udg_UX[udg_wX[JR]+i]),i)
set udg_WX[JR]=p
return
endif
if(i==p)then
set udg_WX[JR]=p
endif
endfunction
function OA takes integer JR returns nothing
set udg_yX[JR]=0
set udg_YX[JR]=true
endfunction
function RA takes integer JR returns unit
set udg_yX[JR]=udg_yX[JR]+1
if(udg_yX[JR]>=udg_WX[JR])then
set udg_YX[JR]=false
return null
endif
return udg_UX[udg_wX[JR]+udg_yX[JR]]
endfunction
function IA takes integer JR returns nothing
set udg_WX[JR]=1
set udg_yX[JR]=0
set udg_YX[JR]=false
call FlushChildHashtable(udg_zX,JR)
endfunction
function AA takes nothing returns nothing
local integer i=0
loop
exitwhen i>1
set udg_xO[(i)]=pR()
set udg_oO[(i)]=pR()
set udg_rO[(i)]=pR()
set udg_iO[(i)]=pR()
set i=i+1
endloop
set udg_aO[(0)]=1
set udg_aO[(1)]=0
endfunction
function NA takes nothing returns boolean
local integer bA=LoadInteger(udg_A,0,GetSpellAbilityId())
if bA!=0 then
call TriggerExecute(udg_sO[(bA)])
endif
return false
endfunction
function BA takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerAddCondition(t,Condition(function NA))
call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_SPELL_EFFECT)
endfunction
function cA takes player p,integer CA,real dA returns nothing
set udg_N=udg_Mr*12*1+GetPlayerId(p)*1+CA
set udg_C[udg_N]=udg_C[udg_N]+dA
endfunction
function DA takes integer turnNr returns nothing
local integer i=0
set udg_N=udg_Mr*12*1
loop
exitwhen i>=1*12
set udg_C[udg_N+i]=0
set i=i+1
endloop
endfunction
function fA takes integer FA returns integer
set FA=udg_Ko[FA]+udg_Hr[FA]+udg_Zo[FA]+250-udg_Qo[FA]-udg_Ir[FA]-GetPlayerState(Player(FA-1),PLAYER_STATE_RESOURCE_GOLD)
return FA*(-1)
endfunction
function gA takes integer zR returns nothing
call DisplayTimedTextToPlayer(Player(zR-1),0,0,15,"-------- Current statistics: --------")
call DisplayTimedTextToPlayer(Player(zR-1),0,0,15,"Income: "+udg_pi+I2S(jI(zR))+"|r ("+udg_pi+I2S(udg_Hr[zR])+"|r gold in total)")
call DisplayTimedTextToPlayer(Player(zR-1),0,0,15,"Coins collected: "+udg_pi+I2S(udg_yr[zR])+"|r ("+udg_pi+I2S(udg_Zo[zR])+"|r gold in total)")
call DisplayTimedTextToPlayer(Player(zR-1),0,0,15,"Units killed: "+udg_pi+I2S(udg_Cr[zR])+"|r ("+udg_pi+I2S(fA(zR))+"|r gold in total)")
call DisplayTimedTextToPlayer(Player(zR-1),0,0,15,"Units trained: "+udg_pi+I2S(udg_Ao[zR])+"|r ("+udg_pi+I2S(udg_tr[zR])+"|r creepspawning buildings in total)")
call DisplayTimedTextToPlayer(Player(zR-1),0,0,15,"Specials built: "+udg_pi+I2S(udg_So[zR])+"|r")
call DisplayTimedTextToPlayer(Player(zR-1),0,0,15,"Rescue Strike damage: "+udg_pi+I2S(udg_Si[zR])+"|r ("+udg_pi+I2S(udg_so[zR])+"|r units killed)")
call DisplayTimedTextToPlayer(Player(zR-1),0,0,15,"-------------------------------------")
endfunction
function GA takes nothing returns nothing
local integer i=0
set udg_Ia=0
loop
exitwhen(i>13)
set udg_Ao[i]=0
set udg_Cr[i]=0
set udg_eo[i]=0
set udg_yr[i]=0
set udg_Zo[i]=0
set udg_So[i]=0
set udg_tr[i]=0
set udg_Hr[i]=0
set udg_Ir[i]=0
set udg_Qo[i]=0
set udg_Ko[i]=0
set i=i+1
endloop
endfunction
function hA takes group g returns unit
local unit u=FirstOfGroup(g)
local group HA
if u==null then
set bj_isUnitGroupEmptyResult=true
call ForGroup(g,function IsUnitGroupEmptyBJEnum)
if not bj_isUnitGroupEmptyResult then
set HA=CreateGroup()
call GroupAddGroup(g,HA)
call GroupClear(g)
call GroupAddGroup(HA,g)
call DestroyGroup(HA)
set HA=null
set u=FirstOfGroup(g)
endif
endif
return u
endfunction
function jA takes player p,string JA returns nothing
local integer OI=GetPlayerId(p)+1
call SetPlayerName(p,JA)
set udg_Lr[OI]=udg_Fo[OI]+JA+"|r"
endfunction
function kA takes unit u,rect r returns boolean
return GetUnitX(u)>=GetRectMinX(r)and GetUnitX(u)<=GetRectMaxX(r)and GetUnitY(u)>=GetRectMinY(r)and GetUnitY(u)<=GetRectMaxY(r)
endfunction
function KA takes string c returns boolean
return(not((c!="1")and(c!="2")and(c!="3")and(c!="4")and(c!="5")and(c!="6")))
endfunction
function lA takes string s returns boolean
local integer LA=1
local string c
if(StringLength(s)>0)then
loop
exitwhen LA>StringLength(s)
set c=SubString(s,LA-1,LA)
if((c!="0")and(c!="1")and(c!="2")and(c!="3")and(c!="4")and(c!="5")and(c!="6")and(c!="7")and(c!="8")and(c!="9"))then
return false
endif
set LA=LA+1
endloop
return true
endif
return false
endfunction
function mA takes nothing returns string
local integer i=R2I(TimerGetElapsed(udg_Qr))
local integer j=ModuloInteger(i,60)
local string s
if(j<10)then
set s="0"+I2S(j)
else
set s=I2S(j)
endif
return"|cffFFFF00"+I2S(i/60)+"|cffFF8000:|cffFFFF00"+s+"|r"
endfunction
function MA takes unit u returns nothing
call IssuePointOrderByIdLoc(u,851983,udg_Yx[udg_Fi[(1+GetPlayerId(GetOwningPlayer(u)))]])
endfunction
function pA takes unit u returns nothing
if GetUnitAbilityLevel(u,'A07M')==1 then
set udg_Po=u
call TriggerExecute(udg_sn)
else
call IssuePointOrderByIdLoc(u,851983,udg_Yx[udg_Fi[(1+GetPlayerId(GetOwningPlayer(u)))]])
endif
endfunction
function PA takes nothing returns force
local force f=CreateForce()
call ForceEnumPlayers(f,udg_bv)
return f
endfunction
function qA takes unit u,integer QA,integer sA returns nothing
call UnitAddAbility(u,QA)
call SetUnitAbilityLevel(u,QA,sA)
call UnitRemoveAbility(u,QA)
endfunction
function SA takes nothing returns unit
local group g=CreateGroup()
local unit u
call GroupEnumUnitsInRect(g,bj_mapInitialPlayableArea,udg_nv)
set u=GroupPickRandomUnit(g)
call DestroyGroup(g)
set g=null
return u
endfunction
function tA takes integer yI returns player
local integer i=yI*6
loop
exitwhen i>5+yI*6
if IsPlayerInForce(Player(i),udg_Ba)and not udg_se[i+1]then
return Player(i)
endif
set i=i+1
endloop
return null
endfunction
function TA takes unit uA returns unit
if IsUnitType(uA,UNIT_TYPE_TAUREN)==false then
return uA
endif
return udg_XO[(GetUnitUserData(uA))]
endfunction
function GetRealKillingUnit takes nothing returns unit
return TA(GetKillingUnit())
endfunction
function UA takes unit LR,unit mR returns integer
local integer u=MR()
set udg_XO[u]=mR
set udg_RO[u]=LR
set udg_OO[u]=GetOwningPlayer(mR)
return u
endfunction
function wA takes nothing returns integer
local unit u=CreateUnit(Player(13),'e008',0,0,.0)
local integer d=uR(u,u)
set udg_RO[d]=u
set udg_bO[d]=CreateTimer()
call SaveInteger(udg_o,0,GetHandleId((udg_bO[d])),(d))
call SetUnitUserData(u,d)
call ShowUnit(u,false)
call UnitAddAbility(u,'Amrf')
call UnitAddAbility(u,'Aloc')
call UnitRemoveAbility(u,'Amrf')
return d
endfunction
function WA takes nothing returns nothing
local integer d=(LoadInteger(udg_o,0,GetHandleId((GetExpiredTimer()))))
call UnitRemoveAbility(udg_RO[d],udg_NO[d])
set udg_IO[udg_AO]=d
set udg_AO=udg_AO+1
endfunction
function yA takes unit YA,integer c returns integer
local integer d
local unit zA
if(udg_AO<1)then
set d=wA()
else
set udg_AO=udg_AO-1
set d=udg_IO[udg_AO]
endif
set zA=udg_RO[d]
call UnitAddAbility(zA,udg_GO[c])
set udg_NO[d]=udg_GO[c]
set udg_XO[d]=YA
set udg_OO[d]=GetOwningPlayer(YA)
call SetUnitOwner(zA,udg_OO[d],true)
call TimerStart(udg_bO[d],udg_FO[c],false,function WA)
call SetUnitX(zA,udg_dO[c])
call SetUnitY(zA,udg_DO[c])
return d
endfunction
function ZA takes integer QA,string vN,real eN returns integer
local integer c=KR()
set udg_GO[c]=QA
set udg_gO[c]=OrderId(vN)
set udg_hO[c]='e008'
set udg_FO[c]=eN
return c
endfunction
function xN takes integer JR,unit YA returns nothing
set udg_dO[JR]=GetUnitX(YA)
set udg_DO[JR]=GetUnitY(YA)
call IssueImmediateOrderById(udg_RO[yA(YA,JR)],udg_gO[JR])
endfunction
function oN takes integer JR,unit YA,unit rN returns nothing
set udg_dO[JR]=GetUnitX(rN)
set udg_DO[JR]=GetUnitY(rN)
call IssueImmediateOrderById(udg_RO[yA(YA,JR)],udg_gO[JR])
endfunction
function iN takes integer JR,unit YA,real x,real y returns nothing
set udg_dO[JR]=x
set udg_DO[JR]=y
call IssueImmediateOrderById(udg_RO[yA(YA,JR)],udg_gO[JR])
endfunction
function aN takes integer JR,unit YA,unit rN returns nothing
local player p=GetOwningPlayer(YA)
set udg_dO[JR]=GetUnitX(YA)
set udg_DO[JR]=GetUnitY(YA)
call UnitShareVision(rN,p,true)
call IssueTargetOrderById(udg_RO[yA(YA,JR)],udg_gO[JR],rN)
call UnitShareVision(rN,p,false)
endfunction
function nN takes integer JR,unit YA,unit rN returns nothing
local player p=GetOwningPlayer(YA)
set udg_dO[JR]=GetUnitX(rN)
set udg_DO[JR]=GetUnitY(rN)
call UnitShareVision(rN,p,true)
call IssueTargetOrderById(udg_RO[yA(YA,JR)],udg_gO[JR],rN)
call UnitShareVision(rN,p,false)
endfunction
function VN takes integer JR,unit YA,unit rN returns nothing
set udg_dO[JR]=GetUnitX(rN)
set udg_DO[JR]=GetUnitY(rN)
call IssuePointOrderById(udg_RO[yA(YA,JR)],udg_gO[JR],udg_dO[JR],udg_DO[JR])
endfunction
function EN takes integer JR,unit YA,real XN,real ON returns nothing
set udg_dO[JR]=GetUnitX(YA)
set udg_DO[JR]=GetUnitY(YA)
call IssuePointOrderById(udg_RO[yA(YA,JR)],udg_gO[JR],XN,ON)
endfunction
function RN takes integer JR,unit YA returns nothing
set udg_dO[JR]=GetUnitX(YA)
set udg_DO[JR]=GetUnitY(YA)
call yA(YA,JR)
endfunction
function IN takes integer JR,unit YA,real AN,real NN returns nothing
set udg_dO[JR]=AN
set udg_DO[JR]=NN
call yA(YA,JR)
endfunction
function bN takes nothing returns boolean
set udg_KO=GetFilterUnit()
if true then
call IssueTargetOrderById(udg_RO[yA(udg_HO,udg_jO)],udg_JO,udg_KO)
endif
return false
endfunction
function BN takes nothing returns nothing
set udg_lO=Condition(function bN)
set udg_kO=CreateGroup()
endfunction
function cN takes integer CN,unit mR,unit dN,real DN returns nothing
local location w=GetUnitLoc(dN)
set bj_lastCreatedUnit=CreateUnitAtLoc(GetOwningPlayer(mR),CN,w,bj_UNIT_FACING)
call ShowUnitHide(bj_lastCreatedUnit)
call UnitApplyTimedLifeBJ(DN,'BFig',bj_lastCreatedUnit)
call RemoveLocation(w)
set w=null
endfunction
function fN takes nothing returns nothing
set udg_m[0]=null
set udg_m[0]=null
set udg_M=852024
endfunction
function FN takes nothing returns nothing
if udg_m[udg_Fi[1+GetPlayerId(GetEnumPlayer())]]!=null and(GetUnitCurrentOrder(udg_br[1+GetPlayerId(GetEnumPlayer())])==0 or GetUnitCurrentOrder(udg_br[1+GetPlayerId(GetEnumPlayer())])==udg_M)then
call IssueTargetOrderById(udg_br[1+GetPlayerId(GetEnumPlayer())],852024,udg_m[udg_Fi[1+GetPlayerId(GetEnumPlayer())]])
endif
endfunction
function gN takes integer yI returns nothing
local unit u
loop
set u=hA(udg_nx[yI])
exitwhen u==null
if(IsUnitType(u,UNIT_TYPE_DEAD))then
call GroupRemoveUnit(udg_nx[yI],u)
else
set udg_R=GetUnitState(u,UNIT_STATE_LIFE)/GetUnitState(u,UNIT_STATE_MAX_LIFE)
if udg_R>=.97 then
call GroupRemoveUnit(udg_nx[yI],u)
else
set udg_m[yI]=u
if udg_ge>=3 then
call BI("Repair target for Team "+I2S(yI)+": attacked building "+GetUnitName(u))
endif
return
endif
endif
endloop
loop
set u=hA(udg_ax[yI])
exitwhen u==null
if(IsUnitType(u,UNIT_TYPE_DEAD))then
call GroupRemoveUnit(udg_ax[yI],u)
else
set udg_R=GetUnitState(u,UNIT_STATE_LIFE)/GetUnitState(u,UNIT_STATE_MAX_LIFE)
if udg_R>=.4 then
call GroupRemoveUnit(udg_ax[yI],u)
else
set udg_m[yI]=u
if udg_ge>=3 then
call BI("Repair target for Team "+I2S(yI)+": heavily damaged building "+GetUnitName(u))
endif
return
endif
endif
endloop
if GetUnitStatePercent(udg_Rr[yI],UNIT_STATE_LIFE,UNIT_STATE_MAX_LIFE)<99.then
set udg_m[yI]=udg_Rr[yI]
return
endif
loop
set u=hA(udg_ix[yI])
exitwhen u==null
if(IsUnitType(u,UNIT_TYPE_DEAD))then
call GroupRemoveUnit(udg_ix[yI],u)
else
set udg_R=GetUnitState(u,UNIT_STATE_LIFE)/GetUnitState(u,UNIT_STATE_MAX_LIFE)
if udg_R>=.97 then
call GroupRemoveUnit(udg_ix[yI],u)
else
set udg_m[yI]=u
if udg_ge>=3 then
call BI("Repair target for Team "+I2S(yI)+": damaged building "+GetUnitName(u))
endif
return
endif
endif
endloop
if udg_ge>=3 then
call BI("Repair target for Team "+I2S(yI)+": nothing")
endif
set udg_m[yI]=null
endfunction
function GN takes nothing returns nothing
set udg_q=ZA('A05B',"howlofterror",1.)
call SaveInteger(udg_A,0,('A05C'),((1)))
endfunction
function hN takes nothing returns nothing
set udg_Q=ZA('A0AF',"impale",2.)
call SaveInteger(udg_A,0,('A0AE'),((2)))
endfunction
function HN takes nothing returns nothing
set udg_S=ZA('A086',"deathanddecay",6.)
endfunction
function jN takes nothing returns nothing
call SaveInteger(udg_A,0,('A09N'),((3)))
endfunction
function JN takes unit rN,integer kN,real KN,real lN,real LN returns nothing
local unit e
local integer mN
if GetUnitAbilityLevel(rN,'A07E')==0 then
call UnitAddAbility(rN,'A07E')
endif
set mN=GetUnitUserData(rN)
if mN==0 then
set mN=PR()
call SetUnitUserData(rN,mN)
endif
set e=CreateUnit(GetOwningPlayer(rN),kN,GetUnitX(rN)+lN,GetUnitY(rN)+LN,KN)
call SetUnitPathing(e,false)
call SetUnitX(e,GetUnitX(rN)+lN)
call SetUnitY(e,GetUnitY(rN)+LN)
call SI((mN),sI((e)))
endfunction
function MN takes unit pN returns nothing
local integer i
local integer mN
local integer PN
if GetUnitAbilityLevel(pN,'A07E')==0 then
return
endif
set mN=GetUnitUserData(pN)
if mN==0 then
return
endif
set PN=(udg_PX[(mN)])
loop
exitwhen PN==0
call RemoveUnit((udg_LX[(PN)]))
set PN=udg_KX[PN]
endloop
call TI(mN)
call SetUnitUserData(pN,0)
endfunction
function qN takes unit u returns nothing
if GetUnitTypeId(u)=='h07M'then
call JN(u,'h08N',226.,37.75,-41.5)
elseif GetUnitTypeId(u)=='h04U'then
call JN((u),('h04J'),((191.)*1.),0,0)
elseif GetUnitTypeId(u)=='h07O'then
call JN(u,'h08K',.0,15.,.0)
call JN((u),('h08R'),((.0)*1.),0,0)
elseif GetUnitTypeId(u)=='h05I'then
call JN((u),('h08G'),((.0)*1.),0,0)
elseif GetUnitTypeId(u)=='h04K'then
call JN((u),('h08I'),((.0)*1.),0,0)
elseif GetUnitTypeId(u)=='h088'then
call JN((u),('h08K'),((.0)*1.),0,0)
elseif GetUnitTypeId(u)=='h07I'then
call JN((u),('h08A'),((.0)*1.),0,0)
elseif GetUnitTypeId(u)=='h073'then
call JN(u,'h08O',312.,40.,19.)
call JN(u,'h08N',34.,-37.75,-25.25)
call JN((u),('h08T'),((.0)*1.),0,0)
elseif GetUnitTypeId(u)=='h08P'then
call JN(u,'h08D',116.,-3.,-10.5)
call JN(u,'h08N',323.,20.,5.75)
elseif GetUnitTypeId(u)=='h07H'then
call JN(u,'h08L',32.,12.,-11.5)
elseif GetUnitTypeId(u)=='h08X'then
call JN(u,'h08Z',250.,46.,33.5)
call JN(u,'h090',270.,-17.,18.)
call SetUnitVertexColor(u,255,255,255,0)
elseif GetUnitTypeId(u)=='h069'then
call JN(u,'h09R',300.,3.5,65.25)
call JN(u,'h09R',70.,-16.5,-51.)
call JN(u,'h09N',238.,36.,53.)
call JN(u,'h09O',314.,-38.,-39.5)
elseif GetUnitTypeId(u)=='h09T'then
call JN((u),('h09V'),((270)*1.),0,0)
call JN(u,'h09U',90.,20.,.0)
call JN(u,'h09U',.0,.0,-20.)
call JN(u,'h09U',270.,-20.,.0)
call JN(u,'h09U',180.,.0,20.)
elseif GetUnitTypeId(u)=='h05L'then
call JN((u),('h09K'),((45.)*1.),0,0)
elseif GetUnitTypeId(u)=='h03S'then
call SetUnitVertexColor(u,0,166,255,'s')
endif
endfunction
function QN takes unit u returns nothing
if GetUnitTypeId(u)=='h07L'then
call JN(u,'h08O',318,43.5,-41.75)
call JN(u,'h08N',226,-38.25,40.25)
elseif GetUnitTypeId(u)=='h07N'then
call JN((u),('h08M'),((0)*1.),0,0)
call JN((u),('h08Q'),((0)*1.),0,0)
elseif GetUnitTypeId(u)=='h07D'then
call JN((u),('h08K'),((0)*1.),0,0)
call JN((u),('h08S'),((0)*1.),0,0)
elseif GetUnitTypeId(u)=='h08Y'then
call JN(u,'h08Z',250.,46.,33.5)
call JN(u,'h091',270.,-17.,18.)
call JN(u,'h08Z',350.,-22.,-40.)
call SetUnitVertexColor(u,255,255,255,0)
elseif GetUnitTypeId(u)=='h03G'then
call JN(u,'h094',74.,38.5,28.)
call JN(u,'h093',160.,-42.,-18.75)
call JN(u,'h093',250.,3.75,-55.5)
elseif GetUnitTypeId(u)=='h097'then
call JN(u,'h096',180.,-45.75,21.75)
call JN(u,'h096',110.,9.,-62.5)
elseif GetUnitTypeId(u)=='h09B'then
call JN(u,'h09C',33.,36.25,36.5)
call JN(u,'h09C',13.,21.,-47.5)
call JN(u,'h09C',319.,-46.25,11.75)
elseif GetUnitTypeId(u)=='h09H'then
call JN(u,'h09C',33.,36.25,36.5)
call JN(u,'h09C',13.,21.,-47.5)
call JN(u,'h09C',319.,-46.25,11.75)
call JN(u,'h09E',348.,-6.5,9.)
elseif GetUnitTypeId(u)=='h09I'then
call JN(u,'h09D',225.,35.,-29.75)
call JN(u,'h09D',45.,20.,22.5)
call JN(u,'h09D',225.,-31.,26.25)
call JN(u,'h09G',23.,-25.25,-36.)
elseif GetUnitTypeId(u)=='h09J'then
call JN(u,'h09F',2.,36.25,41.)
call JN(u,'h09F',2.,33.25,-33.5)
call JN(u,'h09F',2.,-46.25,10.75)
call JN(u,'h09A',45.,-5.25,17.)
elseif GetUnitTypeId(u)=='h09L'then
call JN((u),('h09K'),((238.)*1.),0,0)
elseif GetUnitTypeId(u)=='h09P'then
call JN(u,'h09O',279.,-45.5,24.75)
call JN(u,'h09N',300.,31.,-32.25)
elseif GetUnitTypeId(u)=='h09Y'then
call JN((u),('h09Z'),((270.)*1.),0,0)
elseif GetUnitTypeId(u)=='h0A1'then
call SetUnitVertexColor(u,255,255,255,0)
call JN(u,'h0A0',170.,31.25,-43.)
call JN(u,'h0A0',80.,-38.,-40.25)
call JN(u,'h0A0',350.,-30.25,30.)
call JN(u,'h08Z',220.,43.,27.5)
endif
endfunction
function sN takes nothing returns nothing
call SaveInteger(udg_A,0,('A039'),((4)))
endfunction
function SN takes nothing returns nothing
set udg_T=ZA('A03R',"roar",1.)
call SaveInteger(udg_A,0,('A03S'),((5)))
endfunction
function tN takes nothing returns nothing
call SaveInteger(udg_A,0,('A09A'),((6)))
endfunction
function TN takes nothing returns nothing
set udg_W=ZA('A00N',"charm",1.)
call SaveInteger(udg_A,0,('A00O'),((7)))
endfunction
function uN takes nothing returns nothing
call SaveInteger(udg_A,0,('A033'),((8)))
endfunction
function UN takes nothing returns nothing
set udg_Z=ZA('A08W',"bloodlust",1.)
endfunction
function wN takes nothing returns nothing
set udg_vv=ZA('A06D',"",29.)
endfunction
function WN takes nothing returns nothing
set udg_ev=ZA('A08U',"thunderbolt",3.)
call SaveInteger(udg_A,0,('A08V'),((9)))
endfunction
function yN takes nothing returns nothing
set udg_xv=ZA('A07A',"entanglingroots",6.)
call SaveInteger(udg_A,0,('A07P'),((10)))
endfunction
function YN takes nothing returns nothing
set udg_ov=ZA('A09T',"chainlightning",4.)
endfunction
function zN takes nothing returns nothing
set udg_rv=ZA('A01X',"thunderbolt",1.)
call SaveInteger(udg_A,0,('A01W'),((11)))
endfunction
function ZN takes nothing returns nothing
set udg_iv=ZA('A04S',"",20.)
call SaveInteger(udg_A,0,('A04R'),((12)))
endfunction
function vb takes nothing returns nothing
call SaveInteger(udg_A,0,('A004'),((13)))
endfunction
function eb takes nothing returns boolean
return((IsUnitType(GetFilterUnit(),UNIT_TYPE_MECHANICAL)==false)and(IsUnitType(GetFilterUnit(),UNIT_TYPE_DEAD)))and(IsUnitType(GetFilterUnit(),UNIT_TYPE_SAPPER))
endfunction
function xb takes nothing returns boolean
return(IsUnitType(GetFilterUnit(),UNIT_TYPE_MECHANICAL)==false)and(IsUnitType(GetFilterUnit(),UNIT_TYPE_DEAD))and(IsUnitType(GetFilterUnit(),UNIT_TYPE_SAPPER))and((udg_Fi[GetPlayerId(GetOwningPlayer((GetFilterUnit())))+1])==(udg_Fi[GetPlayerId(GetOwningPlayer((udg_av)))+1]))
endfunction
function ob takes nothing returns boolean
return((udg_Fi[GetPlayerId(GetOwningPlayer((GetFilterUnit())))+1])!=(udg_Fi[GetPlayerId(GetOwningPlayer((udg_av)))+1]))and(IsUnitType(GetFilterUnit(),UNIT_TYPE_DEAD)==false)and(IsUnitType(GetFilterUnit(),UNIT_TYPE_SAPPER)or IsUnitType(GetFilterUnit(),UNIT_TYPE_STRUCTURE))
endfunction
function rb takes nothing returns boolean
return((udg_Fi[GetPlayerId(GetOwningPlayer((GetFilterUnit())))+1])!=(udg_Fi[GetPlayerId(GetOwningPlayer((udg_av)))+1]))and(IsUnitType(GetFilterUnit(),UNIT_TYPE_DEAD)==false)and IsUnitType(GetFilterUnit(),UNIT_TYPE_SAPPER)
endfunction
function ib takes nothing returns boolean
return((udg_Fi[GetPlayerId(GetOwningPlayer((GetFilterUnit())))+1])!=(udg_Fi[GetPlayerId(GetOwningPlayer((udg_av)))+1]))and(IsUnitType(GetFilterUnit(),UNIT_TYPE_DEAD)==false)and(IsUnitType(GetFilterUnit(),UNIT_TYPE_SAPPER))and(IsUnitType(GetFilterUnit(),UNIT_TYPE_FLYING))
endfunction
function ab takes nothing returns boolean
return((udg_Fi[GetPlayerId(GetOwningPlayer((GetFilterUnit())))+1])!=(udg_Fi[GetPlayerId(GetOwningPlayer((udg_av)))+1]))and(IsUnitType(GetFilterUnit(),UNIT_TYPE_DEAD)==false)and(IsUnitType(GetFilterUnit(),UNIT_TYPE_SAPPER))and(IsUnitType(GetFilterUnit(),UNIT_TYPE_FLYING))and(IsUnitType(GetFilterUnit(),UNIT_TYPE_MECHANICAL)==false)
endfunction
function nb takes nothing returns boolean
return(IsPlayerInForce(GetFilterPlayer(),udg_Ba)and not udg_se[GetPlayerId(GetFilterPlayer())+1])
endfunction
function Vb takes nothing returns boolean
return(not(IsUnitType(GetFilterUnit(),UNIT_TYPE_FLYING)))and(not(GetPlayerId(GetOwningPlayer(GetFilterUnit()))>11))and(not(GetUnitPointValue(GetFilterUnit())==129))and(not(IsUnitType(GetFilterUnit(),UNIT_TYPE_DEAD)))and(not(GetUnitTypeId(GetFilterUnit())=='n026'))
endfunction
function Eb takes nothing returns boolean
return GetUnitTypeId(GetEventDamageSource())=='h04X'
endfunction
function Xb takes nothing returns boolean
return(IsUnitType(GetFilterUnit(),UNIT_TYPE_STRUCTURE)!=null)
endfunction
function Ob takes nothing returns nothing
set udg_nv=Condition(function eb)
set udg_Vv=Condition(function xb)
set udg_Ev=Condition(function ob)
set udg_Xv=Condition(function ib)
set udg_Rv=Condition(function rb)
set udg_Av=Condition(function Eb)
set udg_Nv=Condition(function Vb)
set udg_bv=Condition(function nb)
set udg_Iv=Condition(function Xb)
set udg_Ov=Condition(function ab)
endfunction
function Rb takes string Ib,unit uA,integer Ab,integer Nb,integer bb,real Bb,real cb,real Cb returns texttag
local real lN=-I2R(StringLength(Ib))*6
set bj_lastCreatedTextTag=CreateTextTag()
call SetTextTagText(bj_lastCreatedTextTag,Ib,.024)
call SetTextTagPos(bj_lastCreatedTextTag,lN+GetUnitX(uA),GetUnitY(uA)-16,0)
call SetTextTagColor(bj_lastCreatedTextTag,Ab,Nb,bb,255)
call SetTextTagPermanent(bj_lastCreatedTextTag,false)
call SetTextTagLifespan(bj_lastCreatedTextTag,cb)
call SetTextTagFadepoint(bj_lastCreatedTextTag,Bb)
call SetTextTagVelocity(bj_lastCreatedTextTag,0,Cb)
return bj_lastCreatedTextTag
endfunction
function db takes player p,string Ib,unit uA,integer Ab,integer Nb,integer bb,real Bb,real cb,real Cb returns texttag
call Rb(Ib,uA,Ab,Nb,bb,Bb,cb,Cb)
if GetLocalPlayer()!=p then
call SetTextTagVisibility(bj_lastCreatedTextTag,false)
endif
return bj_lastCreatedTextTag
endfunction
function Db takes unit u,integer fb returns nothing
if udg_Pi>0 and(udg_C[udg_Mr*12*1+GetPlayerId((GetOwningPlayer(u)))*1+(0)])+fb>udg_Pi then
set fb=udg_Pi-R2I((udg_C[udg_Mr*12*1+GetPlayerId((GetOwningPlayer(u)))*1+(0)]))
endif
call cA(GetOwningPlayer(u),0,fb)
call AdjustPlayerStateBJ(fb,GetOwningPlayer(u),PLAYER_STATE_RESOURCE_LUMBER)
call db(GetOwningPlayer(u),I2S(fb),u,0,170,0,1.,3.,.06)
endfunction
function Fb takes nothing returns nothing
call SaveInteger(udg_A,0,('A04U'),((14)))
endfunction
function gb takes nothing returns nothing
call SaveInteger(udg_A,0,('A04J'),((15)))
endfunction
function Gb takes nothing returns nothing
set udg_Bv=ZA('A016',"bloodlust",1.)
call SaveInteger(udg_A,0,('A01K'),((16)))
endfunction
function hb takes nothing returns nothing
call SaveInteger(udg_A,0,('A04L'),((17)))
endfunction
function Hb takes nothing returns nothing
set udg_cv=ZA('A09E',"thunderclap",3.)
call SaveInteger(udg_A,0,('A09D'),((18)))
endfunction
function jb takes nothing returns nothing
set udg_Cv=ZA('A018',"hex",1.)
call SaveInteger(udg_A,0,('A017'),((19)))
endfunction
function Jb takes nothing returns nothing
set udg_dv=ZA('A043',"frostnova",1.)
call SaveInteger(udg_A,0,('A044'),((20)))
endfunction
function kb takes multiboard Kb,integer x,integer y,string lb returns nothing
set udg_H=MultiboardGetItem(Kb,y,x)
call MultiboardSetItemValue(udg_H,lb)
call MultiboardReleaseItem(udg_H)
endfunction
function UpdateRoundTime takes nothing returns nothing
call kb(udg_ar,5,3,mA())
endfunction
function Lb takes nothing returns nothing
set udg_Dv=ZA('A018',"hex",1.)
set udg_fv=ZA('A06S',"thunderbolt",2.)
call SaveInteger(udg_A,0,('A06R'),((21)))
endfunction
function mb takes nothing returns nothing
set udg_Fv=ZA('A05D',"stomp",1.)
call SaveInteger(udg_A,0,('A05E'),((22)))
endfunction
function Mb takes nothing returns nothing
call SaveInteger(udg_A,0,('A095'),((23)))
endfunction
function pb takes nothing returns nothing
local integer Pb=0
local integer qb=0
if udg_io!=0 then
if(GetPlayerId(GetOwningPlayer(udg_Va[0]))==0)then
set Pb=1
elseif(GetPlayerId(GetOwningPlayer(udg_Va[0]))==6)then
set qb=1
endif
endif
if udg_io!=1 then
if(GetPlayerId(GetOwningPlayer(udg_Va[1]))==0)then
set Pb=Pb+1
elseif(GetPlayerId(GetOwningPlayer(udg_Va[1]))==6)then
set qb=qb+1
endif
endif
if udg_io!=-1 then
set Pb=Pb+1
set qb=qb+1
endif
if(Pb==2)then
set udg_jo[0]=1.+udg_hi
call DisplayTimedTextToForce(udg_Ba,8,udg_Ji[0]+"|cffFFFF00 are dominating, they gain +"+I2S(R2I(udg_hi*'d'))+"% income!|r")
set udg_qo[0]=true
else
if udg_qo[0]then
call DisplayTimedTextToForce(udg_Ba,8,udg_Ji[0]+"|cffFFFF00 are no longer dominating!|r")
endif
set udg_qo[0]=false
set udg_jo[0]=1.
endif
if(qb==2)then
set udg_jo[1]=1.+udg_hi
call DisplayTimedTextToForce(udg_Ba,8,udg_Ji[1]+"|cffFFFF00 are dominating, they gain +"+I2S(R2I(udg_hi*'d'))+"% income!|r")
set udg_qo[1]=true
else
if udg_qo[1]then
call DisplayTimedTextToForce(udg_Ba,8,udg_Ji[1]+"|cffFFFF00 are no longer dominating!|r")
endif
set udg_qo[1]=false
set udg_jo[1]=1.
endif
endfunction
function Qb takes integer i,unit sb returns nothing
local group g
local integer Pb=0
local integer qb=0
local unit u
if udg_io==i then
return
endif
set g=CreateGroup()
call GroupEnumUnitsInRect(g,udg_Ei[i],udg_Nv)
call GroupAddUnit(g,sb)
loop
set u=FirstOfGroup(g)
exitwhen u==null
call GroupRemoveUnit(g,u)
if(GetPlayerId(GetOwningPlayer(u))<=5)then
set Pb=Pb+1
else
set qb=qb+1
endif
endloop
call DestroyGroup(g)
set g=null
if(Pb>0 and qb==0)and GetPlayerId(GetOwningPlayer(udg_Va[i]))!=0 then
call SetUnitOwner(udg_Va[i],Player(0),true)
call pb()
elseif(Pb==0 and qb>0)and GetPlayerId(GetOwningPlayer(udg_Va[i]))!=6 then
call SetUnitOwner(udg_Va[i],Player(6),true)
call pb()
endif
endfunction
function Sb takes nothing returns nothing
local integer tb=CountPlayersInForceBJ(udg_er)
if tb==0 then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"All players have agreed, number of rounds is increased by "+I2S(udg_oo))
call DisableTrigger(udg_vE)
call PauseTimer(udg_Li)
call DestroyForce(udg_er)
set udg_Wx=udg_Wx+udg_oo
set udg_go=true
call TriggerExecute(udg_In)
endif
endfunction
function Tb takes nothing returns nothing
local player p
local integer ub=udg_wi*2
local integer yI=udg_qi
local integer i
local unit Ub
loop
exitwhen ub==0
set p=tA(yI)
if(p!=null)then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_Lr[(1+GetPlayerId(p))]+" has 15 seconds to ban a race!")
call zI(p,'h09W')
set Ub=bj_lastCreatedUnit
else
set i=vA(Player(0))
call WI(i,-1)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_Ji[yI]+" has banned |cffFFFF00"+udg_Go[i]+"|r")
endif
set i=0
loop
if i>=15 then
set i=vA(Player(0))
call WI(i,-1)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_Lr[(1+GetPlayerId(p))]+" has random banned |cffFFFF00"+udg_Go[i]+"|r")
call RemoveUnit(Ub)
exitwhen true
endif
call TriggerSleepAction(1.)
exitwhen CountUnitsInGroup(udg_Do[yI])==0
set i=i+1
endloop
call TriggerSleepAction(3.)
set yI=ModuloInteger(yI+1,2)
set ub=ub-1
endloop
endfunction
function wb takes nothing returns nothing
if not udg_se[(1+GetPlayerId(GetEnumPlayer()))]then
call zI(GetEnumPlayer(),'h033')
else
call rA(GetEnumPlayer())
endif
endfunction
function Wb takes nothing returns nothing
local integer i=rA(GetOwningPlayer(GetEnumUnit()))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_Lr[(1+GetPlayerId(GetOwningPlayer(GetEnumUnit())))]+" has randomed |cffFFFF00"+udg_Go[i]+"|r")
call RemoveUnit(GetEnumUnit())
endfunction
function yb takes force f,integer yI returns nothing
local integer i=0
if CountPlayersInForceBJ(f)==0 then
return
endif
loop
exitwhen i>11
if IsPlayerInForce(Player(i),f)then
call DisplayTextToPlayer(Player(i),0,0,"|cffFFFF00You have 15 seconds to pick your race!|r")
endif
set i=i+1
endloop
call ForForce(f,function wb)
set i=0
loop
if i>=15 then
call ForGroup(udg_Do[yI],function Wb)
exitwhen true
endif
call TriggerSleepAction(1.)
exitwhen CountUnitsInGroup(udg_Do[yI])==0
set i=i+1
endloop
call TriggerSleepAction(3.)
call ForceClear(f)
endfunction
function Yb takes integer zb returns integer
local integer Zb=(zb/6)*6+5
if zb==-1 then
return-1
endif
loop
exitwhen zb>Zb
if IsPlayerInForce(Player(zb),udg_Ba)then
return zb
endif
set zb=zb+1
endloop
return-1
endfunction
function vB takes nothing returns nothing
local integer yI=udg_qi
local integer array zb
local force eB=CreateForce()
set zb[0]=0
set zb[1]=6
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"")
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"
|cffFFFF00-----------Get ready for the draft!-----------|r")
call TriggerSleepAction(5.)
set zb[yI]=Yb(zb[yI])
call ForceAddPlayer(eB,Player(zb[yI]))
set zb[yI]=zb[yI]+1
call yb(eB,yI)
loop
set yI=ModuloInteger(yI+1,2)
set zb[yI]=Yb(zb[yI])
if(zb[yI]!=-1)then
call ForceAddPlayer(eB,Player(zb[yI]))
set zb[yI]=zb[yI]+1
set zb[yI]=Yb(zb[yI])
if(zb[yI]!=-1)then
call ForceAddPlayer(eB,Player(zb[yI]))
set zb[yI]=zb[yI]+1
endif
endif
call yb(eB,yI)
exitwhen zb[0]==-1 and zb[1]==-1
endloop
endfunction
function xB takes nothing returns nothing
set udg_gv=ZA('A02T',"purge",2.)
call SaveInteger(udg_A,0,('A02U'),((24)))
endfunction
function oB takes nothing returns nothing
call SaveInteger(udg_A,0,('A072'),((25)))
endfunction
function rB takes nothing returns nothing
call SaveInteger(udg_A,0,('A08E'),((26)))
endfunction
function iB takes nothing returns nothing
call SaveInteger(udg_A,0,('A03K'),((27)))
endfunction
function aB takes nothing returns nothing
call SaveInteger(udg_A,0,('A03I'),((28)))
endfunction
function nB takes nothing returns nothing
set udg_Gv=ZA('A00B',"thunderclap",1.)
call SaveInteger(udg_A,0,('A00M'),((29)))
endfunction
function VB takes nothing returns nothing
set udg_hv=ZA('A06C',"",29.)
endfunction
function EB takes nothing returns nothing
call SaveInteger(udg_A,0,('A09O'),((30)))
endfunction
function XB takes string OB,unit RB returns nothing
local location l=GetUnitLoc(RB)
local effect e=AddSpecialEffectLoc(OB,l)
call RemoveLocation(l)
call DestroyEffect(e)
set e=null
set l=null
endfunction
function IB takes string OB,unit RB,string dN returns nothing
local effect e=AddSpecialEffectTarget(OB,RB,dN)
call DestroyEffect(e)
set e=null
endfunction
function AB takes nothing returns nothing
set udg_Hv=ZA('A07Q',"entanglingroots",11.)
call SaveInteger(udg_A,0,('A07R'),((31)))
endfunction
function NB takes nothing returns nothing
set udg_jv=ZA('A02G',"",1.)
set udg_gO[(udg_jv)]=(852269)
endfunction
function bB takes nothing returns nothing
set udg_Jv=ZA('A030',"acidbomb",30.)
call SaveInteger(udg_A,0,('A02Z'),((32)))
endfunction
function BB takes nothing returns nothing
call SaveInteger(udg_A,0,('A01E'),((33)))
endfunction
function cB takes nothing returns nothing
set udg_kv=ZA('A0AK',"thunderbolt",10.)
call SaveInteger(udg_A,0,('A06P'),((34)))
endfunction
function CB takes nothing returns nothing
set udg_Kv=ZA('A08A',"",1.)
set udg_gO[(udg_Kv)]=(852269)
endfunction
function dB takes nothing returns nothing
call SaveInteger(udg_A,0,('A08B'),((35)))
endfunction
function DB takes nothing returns nothing
set udg_lv=ZA('A0A8',"healingwave",2.)
call SaveInteger(udg_A,0,('A0A7'),((36)))
endfunction
function fB takes unit u returns nothing
local integer sA=GetUnitAbilityLevel(u,'A09C')+1
if(sA>=6)then
return
endif
call SetUnitAbilityLevel(u,'A09C',sA)
call SetUnitAbilityLevel(u,'A09B',sA)
call IB("Abilities\\Spells\\Human\\Avatar\\AvatarCaster.mdl",u,"origin")
if sA==2 then
call AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Bloodlust\\BloodlustTarget.mdl",u,"weapon,right")
elseif sA==3 then
call AddSpecialEffectTarget("Abilities\\Spells\\Orc\\TrollBerserk\\HeadhunterWEAPONSLeft.mdl",u,"head")
elseif sA==4 then
call AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Bloodlust\\BloodlustTarget.mdl",u,"head")
elseif sA==5 then
call AddSpecialEffectTarget("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl",u,"weapon,right")
endif
endfunction
function FB takes unit u returns nothing
local integer sA=GetUnitAbilityLevel(u,'A09L')
if sA==2 then
call SetUnitAbilityLevel(u,'A09L',1)
call SetUnitState(u,UNIT_STATE_LIFE,GetUnitState(u,UNIT_STATE_LIFE)+200)
call SetUnitState(u,UNIT_STATE_MANA,GetUnitState(u,UNIT_STATE_MANA)+'d')
call qA(u,'A09M',3)
elseif sA==1 then
call UnitRemoveAbility(u,'A09L')
endif
call IB("Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl",u,"origin")
endfunction
function gB takes unit GB,unit hB returns boolean
if GetUnitTypeId(GB)=='n01T'then
call fB(GB)
if GetRandomInt(0,99)<60 then
return false
endif
endif
if GetUnitAbilityLevel(GB,'A09L')>0 then
call FB(GB)
return false
endif
if GetUnitAbilityLevel(GB,'A070')!=0 then
return false
endif
return true
endfunction
function HB takes unit GB,unit hB returns boolean
if not gB(GB,hB)then
call IB("Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl",GB,"origin")
return false
endif
return true
endfunction
function jB takes nothing returns nothing
set udg_Lv=ZA('A07T',"starfall",11.)
set udg_mv=ZA('A08T',"starfall",11.)
call SaveInteger(udg_A,0,('A07U'),((37)))
endfunction
function JB takes nothing returns nothing
set udg_Mv=ZA('A031',"stomp",1.)
call SaveInteger(udg_A,0,('A032'),((38)))
endfunction
function kB takes nothing returns nothing
set udg_pv=ZA('A06H',"ensnare",2.)
call SaveInteger(udg_A,0,('A06I'),((39)))
endfunction
function KB takes unit u returns nothing
local integer yI
if u==null then
return
endif
set yI=(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1])
call iA(udg_xO[yI],u)
if IsUnitType(u,UNIT_TYPE_FLYING)then
call iA(udg_rO[yI],u)
call UnitAddAbility(u,'A07F')
else
call iA(udg_iO[yI],u)
endif
endfunction
function lB takes unit u,integer yI returns nothing
if u==null then
return
endif
call VA(udg_xO[yI],u)
if GetUnitAbilityLevel(u,'A07F')==1 then
call VA(udg_rO[yI],u)
else
call VA(udg_iO[yI],u)
endif
endfunction
function LB takes unit u returns nothing
call lB(u,(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1]))
endfunction
function mB takes nothing returns nothing
set udg_Pv=ZA('A01I',"flamestrike",6.)
set udg_qv=ZA('A05H',"flamestrike",6.)
call SaveInteger(udg_A,0,('A01J'),((40)))
endfunction
function MB takes nothing returns nothing
set udg_Qv=ZA('A00I',"fanofknives",1.)
call SaveInteger(udg_A,0,('A00K'),((41)))
endfunction
function pB takes nothing returns nothing
call SaveInteger(udg_A,0,('A057'),((42)))
endfunction
function PB takes nothing returns nothing
set udg_sv=ZA('A00Y',"healingwave",2.)
call SaveInteger(udg_A,0,('A00X'),((43)))
endfunction
function qB takes nothing returns nothing
set udg_Sv=ZA('A082',"thunderbolt",2.)
set udg_tv=ZA('A083',"thunderbolt",2.)
set udg_Tv=ZA('A04H',"entanglingroots",16.)
endfunction
function QB takes nothing returns nothing
call SaveInteger(udg_A,0,('A04I'),((44)))
endfunction
function sB takes integer SB returns nothing
local string tB=""
if(ModuloInteger((SB),2))==1 then
set tB="bottom"
else
set tB="top"
endif
call DisplayTextToForce(cR(Player(SB-1)),udg_Lr[SB]+": I will build on "+tB+" Lane!")
call PingMinimapLocForForce(cR(Player(SB-1)),GetRectCenter(udg_Ox[(ModuloInteger((SB),2))]),3)
endfunction
function TB takes unit uB returns nothing
local integer UB=GetUnitPointValue(uB)
local integer wB=udg_xo[UB]
local integer WB=udg_vo[UB]
local integer yB=udg_Fx[UB]
local integer flyingClass=0
local integer yI=(udg_Fi[GetPlayerId(GetOwningPlayer((uB)))+1])
local integer YB=yI*2
if udg_gi[UB]>=2 then
return
endif
if not RectContainsCoords(udg_We[yI*2],GetUnitX(uB),GetUnitY(uB))then
set YB=YB+1
endif
if IsUnitIdType(udg_lx[UB],UNIT_TYPE_FLYING)then
set udg_ye[wB*4+YB]=udg_ye[wB*4+YB]+yB
set udg_ze[YB]=udg_ze[YB]+yB
else
set udg_Ye[wB*4+YB]=udg_Ye[wB*4+YB]+yB
set udg_Ze[YB]=udg_Ze[YB]+yB
endif
if udg_ho[UB]==1 or udg_ho[UB]==3 then
set udg_vx[WB*4+YB]=udg_vx[WB*4+YB]+yB
set udg_xx[YB]=udg_xx[YB]+yB
endif
if udg_ho[UB]==2 or udg_ho[UB]==3 then
set udg_ex[WB*4+YB]=udg_ex[WB*4+YB]+yB
set udg_ox[YB]=udg_ox[YB]+yB
endif
if udg_ho[UB]==3 then
set udg_rx[YB]=udg_rx[YB]+yB
endif
endfunction
function zB takes integer yI returns nothing
if TimerGetRemaining(udg_te[yI])<=.0 then
call TimerStart(udg_te[yI],20,false,null)
set udg_Se[yI]=true
endif
endfunction
function ZB takes nothing returns nothing
if(GetUnitTypeId(GetEnumUnit())=='h033')then
call rA(GetOwningPlayer(GetEnumUnit()))
call RemoveUnit(GetEnumUnit())
endif
endfunction
function vc takes integer zR returns nothing
call eR(15)
call ForGroupBJ(NR(Player(zR)),function ZB)
endfunction
function ec takes nothing returns nothing
if udg_fe then
return
endif
set udg_fe=true
call EnableTrigger(udg_AE)
endfunction
function xc takes boolean oc returns nothing
if oc then
if ForcePickRandomPlayer(udg_Me)!=null then
call EnableTrigger(udg_nE)
if not udg_to then
call EnableTrigger(udg_VE)
endif
endif
set udg_Fe=true
else
call DisableTrigger(udg_nE)
call DisableTrigger(udg_VE)
set udg_Fe=false
endif
endfunction
function rc takes integer SB returns nothing
local integer i
set udg_se[SB]=true
call ForceAddPlayer(udg_Me,Player(SB-1))
call ec()
if udg_Fe then
call xc(true)
endif
set udg_Pe[SB]=0
call sB(SB)
set i=0
loop
exitwhen i>2
set udg_Rx[SB*3+i]=0
set i=i+1
endloop
set udg_Vx[SB]=0
set udg_ke[SB]=-1
set udg_Ke[SB]=-1
set udg_KE=0
set udg_He[SB]=0
set udg_je[SB]=0
set udg_le[SB]=true
set udg_Je[SB]=0
set udg_Le[SB]=false
endfunction
function ic takes nothing returns nothing
call rc((1+GetPlayerId(GetEnumPlayer())))
endfunction
function ac takes nothing returns nothing
local integer i
if ForcePickRandomPlayer(udg_Me)==null then
return
endif
call ec()
set udg_Se[0]=false
set udg_Se[1]=false
call ForForce(udg_Me,function ic)
set i=0
loop
exitwhen i>3
set udg_ze[i]=0
set udg_Ze[i]=0
set udg_xx[i]=0
set udg_ox[i]=0
set udg_rx[i]=0
set i=i+1
endloop
set i=0
loop
exitwhen i>40
set udg_ye[i]=0
set udg_Ye[i]=0
set udg_vx[i]=0
set udg_ex[i]=0
set i=i+1
endloop
set udg_cx=true
set udg_Bx=CreateTimer()
call TimerStart(udg_Bx,25,false,null)
call TimerStart(udg_te[0],1,false,null)
call TimerStart(udg_te[1],1,false,null)
endfunction
function nc takes nothing returns nothing
if GetOwningPlayer(GetEnumUnit())!=Player(15)and GetUnitTypeId(GetEnumUnit())!='h00L'then
call MN(GetEnumUnit())
call RemoveUnit(GetEnumUnit())
endif
endfunction
function Vc takes integer Ec,unit RB,unit Xc,player mR returns nothing
local location dN=GetUnitLoc(RB)
local integer i=udg_Fi[(1+GetPlayerId(mR))]
set bj_lastCreatedUnit=CreateUnitAtLoc(mR,Ec,dN,GetUnitFacing(RB))
call RemoveLocation(dN)
set dN=null
call pA(bj_lastCreatedUnit)
set udg_Br[i]=(udg_Br[i]+1)
call KB(bj_lastCreatedUnit)
endfunction
function Oc takes unit uB,unit u returns nothing
if(uB==null)then
return
endif
if(GetUnitAbilityLevel(uB,'B01K')>0)then
call qA(u,'A09M',3)
call UnitAddAbility(u,'A09Q')
call UnitAddAbility(u,'A09R')
endif
endfunction
function Rc takes unit u returns boolean
return(GetUnitTypeId(u)=='n003')or(GetUnitTypeId(u)=='n00I')or(GetUnitTypeId(u)=='n00J')or(GetUnitTypeId(u)=='n00K')
endfunction
function Ic takes unit uB,unit u returns nothing
local integer i
if(Rc(u))then
call Vc(GetUnitTypeId(u),u,uB,GetOwningPlayer(u))
call Oc(uB,bj_lastCreatedUnit)
elseif(GetUnitPointValue(u)=='e')then
call LB(u)
set i=GetRandomInt(0,99)
if(i<5)then
call ReplaceUnitBJ(u,'n00L',1)
elseif(i<14)then
call ReplaceUnitBJ(u,'n00L',1)
else
set i=GetRandomInt(0,3)
if(i==0)then
call ReplaceUnitBJ(u,'n00L',1)
elseif(i==1)then
call ReplaceUnitBJ(u,'n00L',1)
elseif(i==2)then
call ReplaceUnitBJ(u,'n00L',1)
else
call ReplaceUnitBJ(u,'n00L',1)
endif
endif
set u=bj_lastReplacedUnit
call KB(u)
call pA(u)
call Oc(uB,u)
set i=GetRandomInt(0,99)
if(i<20)then
call UnitAddAbility(u,'A009')
elseif(i<55)then
call UnitAddAbility(u,'A01F')
endif
set i=GetRandomInt(0,99)
if(i<18)then
call UnitAddAbility(u,'A02B')
elseif(i<30)then
call UnitAddAbility(u,'A01B')
elseif(i<33)then
call UnitAddAbility(u,'A00Z')
elseif(i<43)then
call UnitAddAbility(u,'A07L')
endif
set i=GetRandomInt(0,99)
if(i<10)then
call UnitAddAbility(u,'A00U')
elseif(i<32)then
call UnitAddAbility(u,'A00T')
elseif(i<35)then
call UnitAddAbility(u,'A05J')
endif
set i=GetRandomInt(0,99)
if(i<25)then
call UnitAddAbility(u,'A01A')
endif
set i=GetRandomInt(0,99)
if(i<15)then
call UnitAddAbility(u,'A00V')
elseif(i<40)then
call UnitAddAbility(u,'A00D')
endif
set i=GetRandomInt(0,99)
if(i<8)then
call UnitAddAbility(u,'A01U')
elseif(i<16)then
call UnitAddAbility(u,'A010')
elseif(i<24)then
call UnitAddAbility(u,'A01P')
elseif(i<34)then
call UnitAddAbility(u,'A006')
elseif(i<44)then
call UnitAddAbility(u,'A01R')
elseif(i<47)then
call UnitAddAbility(u,'A012')
endif
elseif GetUnitTypeId(u)=='n01U'then
call UnitApplyTimedLife(u,'BTLF','x')
set udg_L=GetUnitRallyPoint(uB)
if(udg_L!=null)then
call StoreReal(udg_vr,"repairgobboX",(I2S(GetHandleId((u)))),GetLocationX(udg_L))
call StoreReal(udg_vr,"repairgobboY",(I2S(GetHandleId((u)))),GetLocationY(udg_L))
call RemoveLocation(udg_L)
set udg_L=null
endif
call LB(u)
elseif GetUnitTypeId(u)=='h06U'then
call SetUnitState(u,UNIT_STATE_MANA,GetRandomReal(0,50))
endif
endfunction
function Ac takes integer Ec,unit RB,unit Xc,player mR returns nothing
local location dN=GetUnitLoc(RB)
local integer i=udg_Fi[(1+GetPlayerId(mR))]
set bj_lastCreatedUnit=CreateUnitAtLoc(mR,Ec,dN,GetUnitFacing(RB))
call RemoveLocation(dN)
set dN=null
call pA(bj_lastCreatedUnit)
set udg_Br[i]=(udg_Br[i]+1)
call KB(bj_lastCreatedUnit)
if(GetUnitAbilityLevelSwapped('A07J',bj_lastCreatedUnit)==1)then
set udg_Po=bj_lastCreatedUnit
call Ic(Xc,bj_lastCreatedUnit)
endif
endfunction
function Nc takes player p,integer sA returns nothing
local unit bc=CreateUnitAtLoc(p,'tec0'+sA,udg_wv,.0)
call ShowUnit(bc,false)
call GroupAddUnit(udg_Uv,bc)
endfunction
function Bc takes nothing returns nothing
local integer i=0
local integer j
local player p
local unit u
set udg_wv=GetRectCenter(udg_Za)
set udg_Uv=CreateGroup()
loop
exitwhen i>11
set j=1
set p=Player(i)
loop
exitwhen j>3
set u=CreateUnitAtLoc(p,'tec0'+j,udg_wv,.0)
call ShowUnit(u,false)
call GroupAddUnit(udg_Uv,u)
set j=j+1
endloop
set i=i+1
endloop
endfunction
function cc takes nothing returns nothing
call RemoveUnit(GetEnumUnit())
endfunction
function Cc takes nothing returns nothing
call ForGroup(udg_Uv,function cc)
call GroupClear(udg_Uv)
endfunction
function dc takes nothing returns nothing
set udg_De[0]=3
set udg_De[1]=1
set udg_De[2]=0
set udg_De[3]=0
set udg_De[4]=0
set udg_De[5]=0
set udg_De[6]=0
set udg_Ee[0]=0
set udg_Ee[1]=1
set udg_Ee[2]=2
set udg_Ee[3]=99
set udg_Ee[4]=4
set udg_Re[0]=2
set udg_Re[1]=0
set udg_Re[2]=1
set udg_Re[3]=99
set udg_Re[4]=99
set udg_Xe[0]=1
set udg_Xe[1]=2
set udg_Xe[2]=0
set udg_Xe[3]=99
set udg_Xe[4]=99
set udg_Xe[7]=99
set udg_Oe[0]=0
set udg_Oe[1]=1
set udg_Oe[2]=2
set udg_Oe[3]=99
set udg_Oe[4]=4
set udg_Oe[7]=99
set udg_Ix[0]=7.
set udg_Ax[0]=0
set udg_Nx[0]=285
set udg_bx[0]=285
set udg_Ix[1]=15.
set udg_Ax[1]=0
set udg_Nx[1]=285
set udg_bx[1]=450
set udg_Ix[2]=27.
set udg_Ax[2]=165
set udg_Nx[2]=350
set udg_bx[2]=650
set udg_Ix[3]=65.
set udg_Ax[3]=165
set udg_Nx[3]=550
set udg_bx[3]=5000
set udg_Ix[4]=100000.
set udg_Ax[4]=200
set udg_Nx[4]=5000
set udg_bx[4]=5000
endfunction
function Dc takes integer SB,integer II,integer fc returns integer
local integer Fc=GetUnitPointValueByType(II)
local integer gc=5000
set udg_I=GetRandomInt(0,udg_Wv)
set gc=gc+udg_I
if udg_ge>=3 then
call BI("+"+I2S(udg_I)+" random bonus")
endif
set gc=gc+fc/udg_ie
if udg_ge>=3 then
call BI("+"+I2S(fc/udg_ie)+" for its price")
endif
return gc
endfunction
function Gc takes integer SB,integer II,integer fc returns integer
local integer Fc=GetUnitPointValueByType(II)
local integer gc=5000
set udg_I=GetRandomInt(0,udg_Wv)
set gc=gc+udg_I
if udg_ge>=3 then
call BI("+"+I2S(udg_I)+" random bonus")
endif
set gc=gc+fc/udg_ie
if udg_ge>=3 then
call BI("+"+I2S(fc/udg_ie)+" for its price")
endif
if udg_ho[Fc]==1 then
set udg_I=udg_vx[udg_vo[Fc]*4+udg_Ie]/udg_oe
if udg_I>0 then
set gc=gc-udg_I
if udg_ge>=3 then
call BI("-"+I2S(udg_I)+" for repeated attack type")
endif
endif
elseif udg_ho[Fc]==2 then
set udg_I=udg_ex[udg_vo[Fc]*4+udg_Ie]/udg_oe
if udg_I>0 then
set gc=gc-udg_I
if udg_ge>=3 then
call BI("-"+I2S(udg_I)+" for repeated attack type")
endif
endif
elseif udg_ho[Fc]==3 then
set udg_I=(udg_ex[udg_vo[Fc]*4+udg_Ie]+udg_vx[udg_vo[Fc]*4+udg_Ie])/2/udg_oe
if udg_I>0 then
set gc=gc-udg_I
if udg_ge>=3 then
call BI("-"+I2S(udg_I)+" for repeated attack type")
endif
endif
endif
if udg_de>0 then
set udg_I=0
if udg_ho[Fc]==1 or udg_ho[Fc]==3 then
set udg_I=udg_ye[udg_Ae+4*udg_Oe[udg_vo[Fc]]]
endif
if udg_ho[Fc]==2 or udg_ho[Fc]==3 then
set udg_I=udg_I+udg_Ye[udg_Ae+4*udg_Oe[udg_vo[Fc]]]
endif
set udg_I=udg_I*'d'/udg_de
set udg_K=udg_I*udg_yv/'d'
set gc=gc+udg_K
if udg_ge>=3 and udg_I>0 then
call BI("+"+I2S(udg_K)+" for countering the armor of "+I2S(udg_I)+"% of all enemies")
endif
set udg_I=0
if udg_ho[Fc]==1 or udg_ho[Fc]==3 then
set udg_I=udg_ye[udg_Ae+4*udg_Xe[udg_vo[Fc]]]
endif
if udg_ho[Fc]==2 or udg_ho[Fc]==3 then
set udg_I=udg_I+udg_Ye[udg_Ae+4*udg_Xe[udg_vo[Fc]]]
endif
set udg_I=udg_I*'d'/udg_de
set udg_K=udg_I*udg_zv/'d'
set gc=gc-udg_K
if udg_ge>=3 and udg_I>0 then
call BI("-"+I2S(udg_K)+" for beeing bad against the armor of "+I2S(udg_I)+"% of all enemies")
endif
endif
if udg_Ce>0 then
if IsUnitIdType(udg_lx[Fc],UNIT_TYPE_FLYING)then
set udg_I=udg_ye[udg_xo[Fc]*4+udg_Ie]/udg_oe
if udg_I>0 then
set gc=gc-udg_I
if udg_ge>=3 then
call BI("-"+I2S(udg_I)+" for repeated armor type")
endif
endif
set udg_I=udg_vx[udg_Ae+4*udg_Re[udg_xo[Fc]]]
else
set udg_I=udg_Ye[udg_xo[Fc]*4+udg_Ie]/udg_oe
if udg_I>0 then
set gc=gc-udg_I
if udg_ge>=3 then
call BI("-"+I2S(udg_I)+" for repeated armor type")
endif
endif
set udg_I=udg_ex[udg_Ae+4*udg_Re[udg_xo[Fc]]]
endif
set udg_I=udg_I*'d'/udg_Ce
set udg_K=udg_I*udg_Yv/'d'
set gc=gc+udg_K
if udg_ge>=3 and udg_I>0 then
call BI("+"+I2S(udg_K)+" for countering the attack of "+I2S(udg_I)+"% of all enemies")
endif
if IsUnitIdType(udg_lx[Fc],UNIT_TYPE_FLYING)then
set udg_I=udg_vx[udg_Ae+4*udg_Ee[udg_xo[Fc]]]
else
set udg_I=udg_ex[udg_Ae+4*udg_Ee[udg_xo[Fc]]]
endif
set udg_I=udg_I*'d'/udg_Ce
set udg_K=udg_I*udg_Zv/'d'
set gc=gc-udg_K
if udg_ge>=3 and udg_I>0 then
call BI("-"+I2S(udg_K)+" for having a bad armor against the attack of "+I2S(udg_I)+"% of all enemies")
endif
endif
if udg_de>0 then
if udg_ho[Fc]==1 and udg_ze[udg_Ae]*'d'/udg_de<=udg_ne then
set gc=gc-udg_ae
if udg_ge>=3 then
call BI("-"+I2S(udg_ae)+" for beeing able to attack less than "+I2S(udg_ne)+"% of all enemies")
endif
elseif udg_ho[Fc]==2 and udg_Ze[udg_Ae]*'d'/udg_de<=udg_ne then
set gc=gc-udg_ae
if udg_ge>=3 then
call BI("-"+I2S(udg_ae)+" for beeing able to attack less than "+I2S(udg_ne)+"% of all enemies")
endif
endif
endif
if udg_vo[Fc]==3 then
set udg_I=udg_ve+R2I(I2R(udg_Ne)*udg_xe)
if udg_I>udg_ee then
set udg_I=udg_ee
endif
set gc=gc+udg_I
if udg_ge>=3 then
if udg_I>=0 then
call BI("+"+I2S(udg_I)+" for beeing a Siege Creep Building")
else
call BI(I2S(udg_I)+" for beeing a Siege Creep Building")
endif
endif
endif
return gc
endfunction
function hc takes integer SB,integer II returns nothing
local integer Fc=0
local integer fc
local integer gc=1
set Fc=GetUnitPointValueByType(II)
set fc=udg_Fx[Fc]+udg_ca[Fc]
if udg_ge>=3 then
call BI("|cffFFFF80-- Begin of "+udg_Lr[SB]+"|cffFFFF80's calculation for "+GetObjectName(II)+" (Tier "+I2S(udg_Pe[SB])+") --|r")
endif
if udg_Fx[Fc]>udg_Nx[udg_Pe[SB]]or udg_ca[Fc]>udg_Nx[udg_Pe[SB]]or fc>udg_bx[udg_Pe[SB]]or(fc<udg_Ax[udg_Pe[SB]]and udg_gi[Fc]<2)then
if udg_ge>=3 then
call BI("Building out of price range ("+I2S(fc)+")")
endif
set gc=0
endif
if udg_Se[udg_Fi[SB]]and udg_qe[Fc]==1 and udg_gi[Fc]==3 and udg_be>=udg_Tx[Fc]then
set udg_Je[SB]=II
set udg_Se[udg_Fi[SB]]=false
if udg_ge>=3 then
call BI("<<< Forced to build a tower >>>")
endif
elseif udg_Hi==false and(udg_Vx[SB]+1)*udg_re<=udg_Ne and udg_be>=udg_Tx[GetUnitPointValueByType('h008')]then
set udg_Je[SB]='h008'
if udg_ge>=3 then
call BI("<<< Forced to build a treasure box >>>")
endif
elseif((udg_V[GetUnitPointValueByType((II))])and udg_Be>0 and udg_be>=udg_Tx[Fc]and I2R(udg_Ne)>(I2R(udg_Fx[Fc])/10))then
set udg_Je[SB]=II
if udg_ge>=3 then
call BI("<<< Forced to build a legendary structure >>>")
endif
elseif(gc!=0)then
if((udg_ro[Fc]==udg_To and udg_qe[Fc]==1)or(udg_V[GetUnitPointValueByType((II))])or II=='h008')then
set gc=0
else
if udg_gi[Fc]<2 then
set gc=Gc(SB,II,fc)
if gc>=udg_ke[SB]then
set udg_He[SB]=II
set udg_ke[SB]=gc
endif
elseif udg_le[SB]and udg_gi[Fc]==2 then
set gc=Dc(SB,II,fc)
if gc>=udg_Ke[SB]then
set udg_je[SB]=II
set udg_Ke[SB]=gc
endif
endif
endif
endif
if udg_ge>=3 and gc>0 then
call BI("Final multiplier: "+I2S(gc))
endif
endfunction
function Hc takes integer SB returns nothing
local integer i=0
if udg_ge>=3 then
call BI("|cffFFBF00*** Begin of "+udg_Lr[SB]+"|cffFFBF00's tactics calculation ***|r")
endif
set udg_Ke[SB]=0
set udg_ke[SB]=0
loop
exitwhen i>=udg_Te[udg_ui[SB]]
call hc(SB,udg_ue[udg_ui[SB]*30+i])
set i=i+1
endloop
set udg_le[SB]=false
endfunction
function jc takes nothing returns boolean
return(GetUnitTypeId(GetFilterUnit())==udg_Qe[GetUnitPointValueByType(udg_G)])
endfunction
function Jc takes nothing returns nothing
local integer i=0
loop
exitwhen i>11
if GetPlayerController(Player(i))==MAP_CONTROL_COMPUTER then
call ZR(i+1)
if GetAIDifficulty(Player(i))==AI_DIFFICULTY_INSANE then
set udg_pe[i+1]=1.33
endif
endif
set i=i+1
endloop
endfunction
function kc takes nothing returns nothing
local integer i
set udg_Ge=Condition(function jc)
set i=0
loop
exitwhen i>12
set udg_pe[i]=1
set i=i+1
endloop
set udg_me=CreateGroup()
set udg_te[0]=CreateTimer()
set udg_te[1]=CreateTimer()
set udg_Me=CreateForce()
set udg_ix[0]=CreateGroup()
set udg_ix[1]=CreateGroup()
set udg_ax[0]=CreateGroup()
set udg_ax[1]=CreateGroup()
set udg_nx[0]=CreateGroup()
set udg_nx[1]=CreateGroup()
set udg_We[0]=udg_La
set udg_Ox[0]=udg_wa
set udg_Ox[0+4]=udg_qa
set udg_Ox[0+8]=udg_qa
set udg_Ox[0+12]=udg_La
set udg_Ex[0]=udg_ua
set udg_Ex[0+4]=udg_ua
set udg_Ex[0+8]=udg_Sa
set udg_Ex[0+12]=udg_Sa
set udg_Xx[0]=udg_Ya
set udg_Xx[0+4]=udg_Ya
set udg_Xx[0+8]=udg_qa
set udg_Xx[0+12]=udg_La
set udg_We[1]=udg_vn
set udg_Ox[1]=udg_Pa
set udg_Ox[1+4]=udg_qa
set udg_Ox[1+8]=udg_qa
set udg_Ox[1+12]=udg_vn
set udg_Ex[1]=udg_Ua
set udg_Ex[1+4]=udg_Ua
set udg_Ex[1+8]=udg_Sa
set udg_Ex[1+12]=udg_Sa
set udg_Xx[1]=udg_za
set udg_Xx[1+4]=udg_za
set udg_Xx[1+8]=udg_pa
set udg_Xx[1+12]=udg_vn
set udg_We[2]=udg_ma
set udg_Ox[2]=udg_ga
set udg_Ox[2+4]=udg_Qa
set udg_Ox[2+8]=udg_Qa
set udg_Ox[2+12]=udg_ma
set udg_Ex[2]=udg_ta
set udg_Ex[2+4]=udg_ta
set udg_Ex[2+8]=udg_en
set udg_Ex[2+12]=udg_en
set udg_Xx[2]=udg_Wa
set udg_Xx[2+4]=udg_Wa
set udg_Xx[2+8]=udg_Qa
set udg_Xx[2+12]=udg_ma
set udg_We[3]=udg_Ma
set udg_Ox[3]=udg_la
set udg_Ox[3+4]=udg_sa
set udg_Ox[3+8]=udg_sa
set udg_Ox[3+12]=udg_Ma
set udg_Ex[3]=udg_Ta
set udg_Ex[3+4]=udg_Ta
set udg_Ex[3+8]=udg_en
set udg_Ex[3+12]=udg_en
set udg_Xx[3]=udg_ya
set udg_Xx[3+4]=udg_ya
set udg_Xx[3+8]=udg_sa
set udg_Xx[3+12]=udg_Ma
call Jc()
endfunction
function Kc takes integer SB,integer lc,boolean Lc returns nothing
if udg_Je[SB]>0 and lc==udg_Je[SB]then
set udg_Je[SB]=0
endif
if(lc=='h008')then
set udg_Vx[SB]=udg_Vx[SB]+1
endif
if not(udg_V[GetUnitPointValueByType((lc))])and udg_gi[GetUnitPointValueByType(lc)]==2 then
set udg_le[SB]=true
endif
if GetRandomInt(0,99)<udg_Ve then
set udg_Le[SB]=true
else
set udg_Le[SB]=false
endif
if not Lc and udg_ge>=1 then
call BI(udg_Lr[SB]+" was unable to build "+GetObjectName(lc)+"!")
endif
endfunction
function mc takes integer SB,integer Mc returns nothing
local location l
local group g
local integer i=0
local integer UB
set UB=GetUnitPointValueByType(Mc)
if udg_ge>=1 then
call BI(udg_Lr[SB]+" wants to build "+udg_pi+GetObjectName(Mc)+"("+I2S(Mc)+")")
endif
if(udg_Fx[UB]<=udg_ce)then
if(udg_Tx[UB]>udg_be)then
if udg_ge>=1 then
call BI(udg_Lr[SB]+" has insufficient lumber! THIS MAY NOT HAPPEN, Send replay to gex!")
endif
call Kc(SB,Mc,false)
endif
else
if udg_ge>=1 then
call BI(udg_Lr[SB]+" has insufficient funds!")
endif
return
endif
if udg_qe[UB]==3 then
set udg_G=Mc
set g=CreateGroup()
call GroupEnumUnitsOfPlayer(g,Player(SB-1),udg_Ge)
if(CountUnitsInGroup(g)>0)then
set udg_U=GroupPickRandomUnit(g)
set udg_P=GetOwningPlayer(udg_U)
call SetUnitOwner(udg_U,Player(15),false)
call SetUnitOwner(udg_U,udg_P,true)
call IssueImmediateOrderById(udg_U,Mc)
call Kc(SB,Mc,true)
else
if udg_ge>=1 then
call BI(udg_Lr[SB]+" cannot upgrade, because the predecessor is missing!")
endif
call mc(SB,udg_Qe[UB])
endif
call DestroyGroup(g)
set g=null
else
if(udg_qe[UB]==1)then
set udg_he=udg_Ex[udg_Rx[SB*3+1]*4+udg_Ie]
elseif(udg_qe[UB]==2)then
set udg_he=udg_Xx[udg_Rx[SB*3+2]*4+udg_Ie]
else
set udg_he=udg_Ox[udg_Rx[SB*3+0]*4+udg_Ie]
endif
call SetUnitPosition(udg_br[SB],GetPlayerStartLocationX(Player(SB-1)),GetPlayerStartLocationY(Player(SB-1)))
set i=0
loop
exitwhen i>14
set i=i+1
set l=GetRandomLocInRect(udg_he)
if not IssueBuildOrderById(udg_br[SB],Mc,GetLocationX(l),GetLocationY(l))then
if(i==15)then
if udg_Rx[SB*3+udg_qe[UB]]==3 then
if udg_qe[UB]==1 then
call Kc(SB,Mc,false)
endif
else
set udg_Rx[SB*3+udg_qe[UB]]=udg_Rx[SB*3+udg_qe[UB]]+1
endif
if udg_ge>=1 then
call BI(udg_Lr[SB]+" cannot build, no building space found!")
endif
endif
else
call Kc(SB,Mc,true)
set i=15
endif
call RemoveLocation(l)
set l=null
endloop
endif
endfunction
function pc takes nothing returns nothing
local integer SB=GetPlayerId(GetEnumPlayer())+1
set udg_Ie=(SB/7)*2+(ModuloInteger((SB),2))
set udg_Ae=(1-(SB/7))*2+(ModuloInteger((SB),2))
set udg_Ne=udg_Wr[SB]
set udg_be=GetPlayerState(Player(SB-1),PLAYER_STATE_RESOURCE_LUMBER)
set udg_ce=GetPlayerState(Player(SB-1),PLAYER_STATE_RESOURCE_GOLD)
set udg_Be=GetPlayerState(Player(SB-1),PLAYER_STATE_RESOURCE_FOOD_CAP)-GetPlayerState(Player(SB-1),PLAYER_STATE_RESOURCE_FOOD_USED)
set udg_Ce=udg_xx[udg_Ae]+udg_ox[udg_Ae]-udg_rx[udg_Ae]
set udg_de=udg_ze[udg_Ae]+udg_Ze[udg_Ae]
if udg_Ne>udg_Ix[udg_Pe[SB]]then
set udg_Pe[SB]=udg_Pe[SB]+1
endif
if(not udg_cx)or udg_Ze[udg_Ae]+udg_ze[udg_Ae]>0 then
if udg_Je[SB]<=0 then
call Hc(SB)
endif
if udg_Je[SB]>0 then
call mc(SB,udg_Je[SB])
elseif udg_je[SB]!=0 and udg_be>=udg_Tx[GetUnitPointValueByType(udg_je[SB])]and udg_Le[SB]then
set udg_Je[SB]=udg_je[SB]
call mc(SB,udg_Je[SB])
else
if udg_ce>=udg_Fx[GetUnitPointValueByType(udg_He[SB])]then
set udg_Je[SB]=udg_He[SB]
endif
call mc(SB,udg_He[SB])
endif
endif
endfunction
function Pc takes nothing returns nothing
call RemoveUnit(GetEnumUnit())
endfunction
function qc takes nothing returns nothing
call xc(false)
set udg_hx=false
set udg_Bi=false
if udg_Tr!=null then
call TimerDialogDisplay(udg_Tr,false)
call DestroyTimerDialog(udg_Tr)
set udg_Tr=null
call PauseTimer(udg_jr)
endif
if udg_jx>0 then
set udg_gE=false
call FogEnable(false)
call PauseTimer(udg_gr)
elseif udg_jx==-1 then
set udg_gE=false
call FogEnable(false)
endif
call DisableTrigger(udg_Ln)
call DisableTrigger(udg_xE)
call DisableTrigger(udg_hn)
call DisableTrigger(udg_Hn)
call DisableTrigger(udg_gn)
call DisableTrigger(udg_Gn)
call DisableTrigger(udg_BV)
call DisableTrigger(udg_fV)
call PauseTimer(udg_lr)
call PauseTimer(udg_Qr)
call PauseTimer(udg_ko)
call PauseTimer(udg_Na)
call TriggerSleepAction(3.)
call CinematicFadeBJ(1,2,"ReplaceableTextures\\CameraMasks\\Black_mask.blp",0,0,0,6.)
call ForGroupBJ(udg_Lo,function Pc)
endfunction
function Qc takes nothing returns boolean
return(GetPlayerSlotState(GetEnumPlayer())==PLAYER_SLOT_STATE_PLAYING)
endfunction
function sc takes nothing returns nothing
if(Qc())then
set udg_qr=(udg_qr+1)
set udg_di[(1+GetPlayerId(GetEnumPlayer()))]=true
call ForceAddPlayer(udg_Ba,GetEnumPlayer())
call ForceAddPlayer(udg_wo[udg_Fi[(1+GetPlayerId(GetEnumPlayer()))]],GetEnumPlayer())
set udg_Zi[udg_Fi[(1+GetPlayerId(GetEnumPlayer()))]]=(udg_Zi[udg_Fi[(1+GetPlayerId(GetEnumPlayer()))]]+1)
set udg_Mi=GetRandomInt(0,7)
set udg_ui[(1+GetPlayerId(GetEnumPlayer()))]=GetRandomInt(0,udg_Yr)
endif
endfunction
function Sc takes nothing returns boolean
return(GetPlayerController(Player(-1+(bj_forLoopAIndex)))==MAP_CONTROL_COMPUTER)
endfunction
function tc takes nothing returns nothing
call InitGameCacheBJ("cf.w3v")
set udg_gx=bj_lastCreatedGameCache
call InitGameCacheBJ("cf2.w3v")
set udg_vr=bj_lastCreatedGameCache
call CinematicFadeBJ(1,.0,"ReplaceableTextures\\CameraMasks\\Black_mask.blp",.0,0,0,6.)
set udg_Px=GetRectCenter(bj_mapInitialPlayableArea)
set udg_sx=GetRectCenter(bj_mapInitialPlayableArea)
set udg_aa=GetRectCenter(bj_mapInitialPlayableArea)
set udg_Oo=GetRectMinX(bj_mapInitialPlayableArea)
set udg_fr=GetRectMaxX(bj_mapInitialPlayableArea)
set udg_Xo=GetRectMinY(bj_mapInitialPlayableArea)
set udg_Fr=GetRectMaxY(bj_mapInitialPlayableArea)
set udg_pi="|cffFFFF00"
set udg_Di[0]='Vstp'
set udg_Di[1]='Adrt'
set udg_Di[2]='Adrg'
set udg_Di[3]='Agrs'
set udg_Di[4]='Agrd'
set udg_Di[5]='Alvd'
set udg_Di[6]='Zdtr'
set udg_Di[7]='Avin'
set udg_Vi[0]='ATtr'
set udg_Vi[1]='ATtc'
set udg_Ni[0]='B002'
set udg_Ni[1]='B003'
set udg_Ni[2]='B004'
set udg_Ni[3]='B005'
set udg_Ni[4]='B006'
set udg_No[0]="|cffff0303"
set udg_No[1]="|cff20c000"
set udg_Ji[0]="|cffff0303Western Forces|r"
set udg_Ji[1]="|cff20c000Eastern Forces|r"
set udg_Fo[1]="|cffff0303"
set udg_Fo[2]="|cff0042ff"
set udg_Fo[3]="|cff1ce69b"
set udg_Fo[4]="|cff540081"
set udg_Fo[5]="|cfffffc01"
set udg_Fo[6]="|cfffe8a0e"
set udg_Fo[7]="|cff20c000"
set udg_Fo[8]="|cffe55bb0"
set udg_Fo[9]="|cff959697"
set udg_Fo[10]="|cff7ebff1"
set udg_Fo[11]="|cff106246"
set udg_Fo[12]="|cff4e2a04"
set udg_mo[0]=.0
set udg_mo[1]=1.
set udg_mo[2]=1.85
set udg_mo[3]=2.57
set udg_mo[4]=3.18
set udg_mo[5]=3.7
set udg_mo[6]=4.14
set udg_mo[7]=4.52
set udg_mo[8]=4.84
set udg_mo[9]=5.11
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
set udg_Lr[bj_forLoopAIndex]=(udg_Fo[bj_forLoopAIndex]+(GetPlayerName(Player(-1+(bj_forLoopAIndex)))+"|r"))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
call TriggerExecute(udg_Xn)
set udg_sr[0]='u002'
set udg_sr[1]='n00D'
set udg_sr[2]='u00A'
set udg_sr[3]='n00C'
set udg_sr[4]='u00B'
set udg_sr[5]='n01L'
set udg_sr[6]='u003'
set udg_sr[7]='n01M'
set udg_Yr=9
set udg_ti[0]='h00C'
set udg_Go[0]="Human"
set udg_ti[1]='h00E'
set udg_Go[1]="Naga"
set udg_ti[2]='h00O'
set udg_Go[2]="Chaos"
set udg_ti[3]='h00P'
set udg_Go[3]="Elven Union"
set udg_ti[4]='h018'
set udg_Go[4]="Undead"
set udg_ti[5]='h019'
set udg_Go[5]="Orc"
set udg_ti[6]='h017'
set udg_Go[6]="Northern"
set udg_ti[7]='u006'
set udg_Go[7]="Corrupted"
set udg_ti[8]='h089'
set udg_Go[8]="Night Elf"
set udg_ti[9]='h06P'
set udg_Go[9]="Mechanical"
set udg_xr[0]=GetUnitLoc(udg_fE)
set udg_xr[1]=GetUnitLoc(udg_FE)
set udg_Ui[1]="first"
set udg_Ui[2]="second"
set udg_Ui[3]="third"
set udg_Ui[4]="fourth"
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY,true,Player(-1+(bj_forLoopAIndex)))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
call FogEnableOff()
call FogMaskEnableOff()
call SetTimeOfDay(12)
call SetMapFlag(MAP_LOCK_RESOURCE_TRADING,true)
set udg_Yx[0]=GetRectCenter(udg_Ha)
set udg_Yx[1]=GetRectCenter(udg_ja)
set udg_ux[0]=udg_ja
set udg_ux[1]=udg_Ha
set udg_Mx[0]=udg_Ga
set udg_Mx[1]=udg_ha
set udg_qx[0]=udg_ha
set udg_qx[1]=udg_Ga
set udg_qr=0
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=6
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
set udg_Fi[bj_forLoopAIndex]=0
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
set bj_forLoopAIndex=7
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
set udg_Fi[bj_forLoopAIndex]=1
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
call ForForce(bj_FORCE_ALL_PLAYERS,function sc)
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
if(Sc())then
set udg_Uo=true
endif
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
call DestroyTimer(udg_si)
set udg_si=CreateTimer()
call StartTimerBJ(udg_si,false,99999)
call CreateQuestBJ(0,"Game Modes","TRIGSTR_5255","ReplaceableTextures\\CommandButtons\\BTNPickUpItem.blp")
call CreateQuestBJ(0,"Modifications","TRIGSTR_5257","ReplaceableTextures\\CommandButtons\\BTNSpy.blp")
call CreateQuestBJ(0,"Other Commands","TRIGSTR_5259","ReplaceableTextures\\CommandButtons\\BTNAuraOfDarkness.blp")
call CreateQuestBJ(2,"First Match?","TRIGSTR_5261","ReplaceableTextures\\CommandButtons\\BTNSelectHeroOff.blp")
call CreateQuestBJ(2,"Basic Hints","TRIGSTR_5263","ReplaceableTextures\\CommandButtons\\BTNSelectHeroOff.blp")
call CreateQuestBJ(2,"About","TRIGSTR_5265","ReplaceableTextures\\CommandButtons\\BTNTomeOfRetraining.blp")
endfunction
function Tc takes nothing returns nothing
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=11
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call DisplayTimedTextToPlayer(Player(bj_forLoopAIndex),0,0,30.,(("Welcome to |cffFFFF80Castle Fight|r! |cffFF0000"+GetPlayerName(Player(0))+"|r has now 20 seconds to choose game modes. If you are new to this map, you can find some useful hints in the |cff80FF00Manual|r (|cffFFBA17F9|r).")))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
call DisplayTimedTextToPlayer(Player(0),0,0,30.,"Welcome to |cffFFFF80Castle Fight|r! You have 20 seconds to enter gamemodes. If you don't enter a valid command, you will be able to choose gamemodes via dialogues. If you don't know how to enter gamemodes read the |cff80FF00Manual|r (|cffFFBA17F9|r).")
if udg_Uo then
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,90.,"|cffFF0000WARNING: You are playing with computer slots. These will show buggy behavior. If you want to play with bots, leave their slots closed and use the ingame commands -fill -east -west and -balance to add bots. Read the manual to find out how these commands work.")
endif
endfunction
function uc takes integer Uc,string wc returns nothing
local integer nI
if udg_Ri or(wc!="siege"and udg_Ea)then
set nI=1
loop
exitwhen nI>12
call SetPlayerUnitAvailableBJ(Uc,false,Player(-1+(nI)))
set nI=nI+1
endloop
endif
endfunction
function Wc takes integer Uc,integer yc,integer Yc,integer zc,integer Zc,integer vC,integer eC returns nothing
local integer xC
set xC=GetUnitPointValueByType(Uc)
set udg_Fx[xC]=yc
set udg_ro[xC]=udg_Dx
set udg_lx[xC]=Yc
set udg_qe[xC]=0
set udg_xo[xC]=zc
set udg_vo[xC]=Zc
set udg_ki[xC]=vC
set udg_ca[xC]=0
set udg_Tx[xC]=0
set udg_gi[xC]=0
set udg_ho[xC]=eC
if(NI(Uc))then
set udg_ue[vC*30+udg_Te[vC]]=Uc
set udg_Ue[xC]=udg_Te[vC]
set udg_Te[vC]=udg_Te[vC]+1
endif
endfunction
function oC takes integer Uc,integer yc,integer Yc,integer zc,integer Zc,integer vC,integer eC returns nothing
local integer xC
set xC=GetUnitPointValueByType(Uc)
set udg_Fx[xC]=yc
set udg_ro[xC]=udg_ea
set udg_lx[xC]=Yc
set udg_qe[xC]=0
set udg_ca[xC]=0
set udg_xo[xC]=zc
set udg_vo[xC]=Zc
set udg_ki[xC]=vC
set udg_Tx[xC]=0
set udg_gi[xC]=1
set udg_ho[xC]=eC
if(RI(Uc))then
set udg_ue[vC*30+udg_Te[vC]]=Uc
set udg_Ue[xC]=udg_Te[vC]
set udg_Te[vC]=udg_Te[vC]+1
endif
call uc(Uc,"siege")
endfunction
function rC takes integer Uc,integer yc,real iC,integer aC,integer vC,integer nC returns nothing
local integer xC
set xC=GetUnitPointValueByType(Uc)
set udg_Fx[xC]=yc
set udg_ro[xC]=iC
set udg_lx[xC]='h023'
set udg_qe[xC]=aC
set udg_ki[xC]=vC
set udg_Tx[xC]=nC
set udg_vo[xC]=6
set udg_ca[xC]=0
set udg_gi[xC]=2
if(RI(Uc))then
set udg_ue[vC*30+udg_Te[vC]]=Uc
set udg_Ue[xC]=udg_Te[vC]
set udg_Te[vC]=udg_Te[vC]+1
endif
call uc(Uc,"special")
endfunction
function VC takes integer Uc,integer yc,integer vC,integer nC returns nothing
local integer xC
set xC=GetUnitPointValueByType(Uc)
set udg_Fx[xC]=yc
set udg_ro[xC]=udg_To
set udg_lx[xC]='h023'
set udg_qe[xC]=1
set udg_ki[xC]=vC
set udg_ca[xC]=0
set udg_Tx[xC]=nC
set udg_vo[xC]=6
set udg_gi[xC]=3
if(RI(Uc))then
set udg_ue[vC*30+udg_Te[vC]]=Uc
set udg_Ue[xC]=udg_Te[vC]
set udg_Te[vC]=udg_Te[vC]+1
endif
call uc(Uc,"special")
endfunction
function EC takes integer Uc,integer yc,integer Yc,integer XC,integer OC,integer zc,integer Zc,integer vC,integer eC returns nothing
local integer xC
set xC=GetUnitPointValueByType(Uc)
call Wc(Uc,yc,Yc,zc,Zc,vC,eC)
set udg_qe[xC]=3
set udg_ca[xC]=XC
set udg_Qe[xC]=OC
endfunction
function RC takes integer Uc,integer yc,integer Yc,integer XC,integer OC,integer zc,integer Zc,integer vC,integer eC returns nothing
local integer xC
set xC=GetUnitPointValueByType(Uc)
call oC(Uc,yc,Yc,zc,Zc,vC,eC)
set udg_qe[xC]=3
set udg_ca[xC]=XC
set udg_Qe[xC]=OC
endfunction
function IC takes integer Uc,integer yc,real iC,integer XC,integer OC,integer vC,integer nC returns nothing
local integer xC
set xC=GetUnitPointValueByType(Uc)
call rC(Uc,yc,iC,3,vC,nC)
set udg_ca[xC]=XC
set udg_Qe[xC]=OC
call uc(Uc,"special")
endfunction
function AC takes nothing returns nothing
local integer vC=0
local integer i
local integer NC=0
local integer bC=1
local integer BC=2
local integer cC=3
local integer CC=4
local integer Attack_AntiAir=5
local integer dC=0
local integer DC=1
local integer fC=2
local integer FC=3
local integer gC=4
local integer GC=2
local integer hC=1
set udg_Dx=.2
set udg_ea=.18
set udg_To=.08
set udg_oa=.12
set udg_rr=.09
set i=0
loop
exitwhen i>udg_Yr
set udg_Te[i]=0
set i=i+1
endloop
call rC('h008',330,udg_rr,2,vC,400)
set vC=0
call Wc('h037',280,'h03B',dC,CC,vC,2)
call EC('h038',245,'h03C',280,'h037',dC,CC,vC,2)
call Wc('h015',250,'h016',DC,NC,vC,3)
call Wc('h00K',300,'n005',FC,CC,vC,3)
call oC('h004',210,'hmtm',fC,cC,vC,2)
call Wc('h003',140,'hrif',DC,BC,vC,3)
call EC('h0A1',160,'h05C',140,'h003',DC,BC,vC,1)
call EC('h05D',180,'h0A2',140,'h003',DC,BC,vC,2)
call Wc('h000','d','hfoo',dC,bC,vC,2)
call EC('h039',175,'h03A','d','h000',dC,bC,vC,2)
call VC('h006',150,vC,300)
call rC('h05G',700,udg_oa,GC,vC,1800)
call rC('h010',225,udg_oa,hC,vC,750)
call rC('h001',200,udg_rr,GC,vC,360)
set vC=1
call Wc('h01Z',350,'n00S',FC,CC,vC,3)
call Wc('h00J',175,'n004',DC,bC,vC,3)
call EC('h05F',725,'n01P',175,'h00J',DC,CC,vC,3)
call oC('h01B',280,'n007',dC,cC,vC,3)
call Wc('h00H','x','n003',FC,bC,vC,2)
call EC('h020',130,'n00I','x','h00H',FC,bC,vC,2)
call EC('h021',150,'n00J',250,'h020',FC,bC,vC,2)
call EC('h022',200,'n00K',400,'h021',FC,bC,vC,2)
call Wc('h01Y',230,'n00H',fC,NC,vC,3)
call Wc('h00F',250,'n002',dC,BC,vC,2)
call EC('h032',200,'n00X',250,'h00F',dC,BC,vC,2)
call rC('h00N',750,udg_rr,GC,vC,1500)
call rC('h00M',310,udg_oa,GC,vC,625)
call rC('h00I',360,udg_oa,GC,vC,600)
call rC('h00G',250,udg_oa,hC,vC,480)
set vC=2
call Wc('h025',280,'n00L',FC,CC,vC,2)
call Wc('h01I','x','n00A',fC,bC,vC,3)
call EC('h026',230,'z000','x','h01I',fC,bC,vC,3)
call Wc('h01C',230,'n008',fC,NC,vC,3)
call Wc('h01D',160,'n009',DC,bC,vC,2)
call EC('h03G',190,'n00Z',160,'h01D',DC,bC,vC,2)
call Wc('h009',350,'n001',dC,CC,vC,3)
call Wc('h007',500,'n000',dC,CC,vC,3)
call rC('h05I',200,udg_rr,GC,vC,330)
call rC('h01M',350,udg_rr,GC,vC,1000)
call IC('h01W',175,udg_rr,350,'h01M',vC,350)
call IC('h01X',175,udg_rr,525,'h01W',vC,350)
call rC('h01F',340,udg_rr,GC,vC,660)
call rC('h01E',850,udg_oa,GC,vC,1800)
set vC=3
call Wc('h09X',360,'h07B',FC,NC,vC,3)
call EC('h00X',440,'h00W',360,'h09X',FC,CC,vC,3)
call Wc('h00V',275,'h00U',DC,NC,vC,3)
call Wc('h00T',220,'n006',dC,bC,vC,2)
call EC('h03F',230,'n00Y',220,'h00T',dC,bC,vC,2)
call Wc('h08X',180,'n022',FC,BC,vC,3)
call EC('h08Y',200,'n023',180,'h08X',FC,BC,vC,3)
call oC('h070',350,'e005',DC,cC,vC,2)
call Wc('h06Y',310,'n01Y',dC,BC,vC,3)
call VC('h014',250,vC,300)
call rC('h059',650,udg_oa,GC,vC,1800)
call rC('h00Z',240,udg_oa,GC,vC,420)
call rC('h005',235,udg_oa,GC,vC,450)
set vC=4
call Wc('h01K',210,'u005',FC,NC,vC,3)
call EC('h04B',170,'u009',210,'h01K',FC,NC,vC,3)
call EC('h055',370,'u00D',380,'h04B',FC,NC,vC,3)
call oC('h01T',370,'n00E',DC,cC,vC,2)
call Wc('h01N',230,'h01U',dC,BC,vC,2)
call EC('h054',245,'h05H',230,'h01N',dC,BC,vC,2)
call Wc('h01L',290,'u001',gC,NC,vC,3)
call Wc('h01S',500,'u000',fC,bC,vC,3)
call Wc('h01R','x','n00B',DC,CC,vC,2)
call EC('h04Z','d','n01K','x','h01R',DC,CC,vC,2)
call EC('h03M',205,'u007',220,'h04Z',DC,CC,vC,2)
call VC('h01O',200,vC,300)
call rC('h01Q',650,udg_rr,GC,vC,1500)
call rC('h01P',160,udg_oa,GC,vC,0)
call IC('h056',140,udg_oa,160,'h01P',vC,0)
call rC('h00A',360,udg_rr,GC,vC,575)
set vC=5
call Wc('h02P',220,'o009',FC,BC,vC,3)
call Wc('h02K',260,'o007',fC,BC,vC,2)
call EC('h092',60,'o00B',260,'h02K',fC,BC,vC,3)
call EC('h035',140,'o008',260,'h02K',fC,BC,vC,3)
call EC('h036',140,'o006',260,'h02K',fC,BC,vC,3)
call Wc('h029','n','o002',dC,bC,vC,2)
call EC('h02U','d','o004','n','h029',dC,bC,vC,2)
call EC('h031',240,'o005',210,'h02U',dC,bC,vC,2)
call Wc('h02B',170,'o003',FC,NC,vC,3)
call oC('h02I',380,'o001',DC,cC,vC,2)
call Wc('h02H',200,'n00V',DC,bC,vC,3)
call EC('h05E',80,'n01O',200,'h02H',DC,bC,vC,3)
call VC('o000',175,vC,300)
call rC('h02R',250,udg_oa,GC,vC,540)
call rC('h02O',475,udg_oa,GC,vC,1350)
call rC('h02N',350,udg_rr,GC,vC,750)
set vC=6
call Wc('h049','s','n017',FC,bC,vC,2)
call EC('h04F','}','n018','s','h049',FC,bC,vC,2)
call EC('h03W',280,'n016',240,'h04F',FC,bC,vC,2)
call Wc('h03T',275,'n012',DC,BC,vC,2)
call EC('h043',225,'n013',275,'h03T',DC,BC,vC,2)
call Wc('h03S',400,'n014',FC,CC,vC,3)
call Wc('h03K',175,'n015',fC,NC,vC,3)
call EC('h03J',150,'o00A',175,'h03K',fC,NC,vC,3)
call Wc('h03U',160,'n011',dC,BC,vC,3)
call Wc('h03I',280,'n010',dC,CC,vC,3)
call VC('h03Q',230,vC,300)
call rC('h047',190,udg_oa,GC,vC,350)
call rC('h048',210,udg_rr,GC,vC,475)
call IC('h03L',290,udg_rr,210,'h048',vC,575)
call rC('h03O',600,udg_rr,GC,vC,1350)
set vC=7
call Wc('h04V','}','n01I',dC,bC,vC,2)
call EC('h04W','}','n01H','}','h04V',dC,bC,vC,2)
call EC('h09Y',500,'n027',250,'h04W',dC,bC,vC,2)
call Wc('h04U',520,'h04I',DC,CC,vC,3)
call Wc('h04S',240,'n01G',DC,BC,vC,2)
call oC('h04Q',300,'n01F',dC,cC,vC,2)
call RC('h04P',150,'n01E',300,'h04Q',dC,cC,vC,2)
call Wc('h04O',235,'n01D',DC,NC,vC,3)
call EC('h04M',165,'n01B',235,'h04O',DC,NC,vC,3)
call Wc('h04L',190,'n019',fC,NC,vC,3)
call EC('h04N',190,'n01A',190,'h04L',fC,NC,vC,3)
call VC('n01J',200,vC,300)
call rC('h04T',500,udg_oa,GC,vC,1350)
call rC('h04R',260,udg_rr,GC,vC,420)
call rC('h04K',275,udg_rr,GC,vC,420)
set vC=8
call Wc('h088',190,'e007',FC,CC,vC,3)
call EC('h07D',260,'e00J',190,'h088',FC,CC,vC,3)
call Wc('h07M',200,'n01Z',DC,BC,vC,2)
call EC('h07L',175,'n020',200,'h07M',DC,BC,vC,2)
call Wc('h07O',230,'e00B',fC,NC,vC,2)
call EC('h07N',240,'e00A',230,'h07O',fC,NC,vC,2)
call oC('h011',285,'e002',dC,cC,vC,2)
call Wc('h00S',150,'e001',fC,BC,vC,3)
call EC('h03D',200,'e003',150,'h00S',fC,BC,vC,3)
call EC('h03E',400,'e004',350,'h03D',fC,BC,vC,3)
call Wc('h00B',260,'e000',fC,NC,vC,3)
call VC('h073',210,vC,300)
call rC('h07H',220,udg_oa,GC,vC,300)
call rC('h08P',225,udg_oa,GC,vC,600)
call rC('h07I',650,udg_rr,GC,vC,1350)
set vC=9
call Wc('h05T',220,'z002',fC,CC,vC,2)
call EC('h09P',140,'z003',220,'h05T',fC,CC,vC,2)
call Wc('h05U',375,'n01T',DC,BC,vC,2)
call Wc('h05M',200,'n01V',FC,CC,vC,2)
call Wc('h05J',160,'h06Q',fC,BC,vC,1)
call EC('h09L',180,'h06R',160,'h05J',fC,BC,vC,1)
call Wc('h05V',270,'n01X',DC,CC,vC,2)
call EC('h097',500,'n024',270,'h05V',gC,CC,vC,2)
call Wc('h05X',180,'h06T',dC,bC,vC,2)
call EC('h09J',150,'h06U',180,'h05X',dC,bC,vC,2)
call EC('h09I',200,'h099',180,'h05X',dC,CC,vC,2)
call EC('h09B',250,'h06S',180,'h05X',dC,bC,vC,2)
call EC('h09H','d','h098',430,'h09B',dC,bC,vC,2)
call VC('h05L',240,vC,300)
call rC('h09T',340,udg_oa,GC,vC,1050)
call rC('h069',250,udg_oa,GC,vC,480)
call rC('h06J',190,udg_oa,GC,vC,270)
call IC('h05R',140,udg_oa,190,'h06J',vC,130)
set udg_ei[14]=180
set udg_ei[26]=800
set udg_ei[70]=600
set udg_ei[75]=750
set udg_ei[88]=850
set udg_ei['t']=900
set udg_ei['y']=675
set udg_ei[134]=500
set udg_ei[138]=800
set udg_ei[141]=700
set udg_ei[150]=950
set udg_V[('h05G')]=true
set udg_V[('h05F')]=true
set udg_V[('h00N')]=true
set udg_V[('h01M')]=true
set udg_V[('h01W')]=true
set udg_V[('h01X')]=true
set udg_V[('h01E')]=true
set udg_V[('h00X')]=true
set udg_V[('h059')]=true
set udg_V[('h055')]=true
set udg_V[('h01Q')]=true
set udg_V[('h02O')]=true
set udg_V[('h03O')]=true
set udg_V[('h09Y')]=true
set udg_V[('h04T')]=true
set udg_V[('h03E')]=true
set udg_V[('h07I')]=true
set udg_V[('h097')]=true
set udg_lx[GetUnitPointValueByType('h069')]='n01U'
set udg_gi[GetUnitPointValueByType('h056')]=0
set udg_xo[GetUnitPointValueByType('h056')]=2
set udg_vo[GetUnitPointValueByType('h056')]=7
set udg_ho[GetUnitPointValueByType('h056')]=2
set udg_gi[GetUnitPointValueByType('h01P')]=0
set udg_xo[GetUnitPointValueByType('h01P')]=2
set udg_vo[GetUnitPointValueByType('h01P')]=7
set udg_ho[GetUnitPointValueByType('h01P')]=2
endfunction
function HC takes nothing returns nothing
set udg_Vo=ER(udg_Za)
set udg_co[1]=2
set udg_co[7]=3
set udg_Xa[0]=2
set udg_Xa[1]=3
call CreateMultiboardBJ(6,4,"Stats")
set udg_ar=bj_lastCreatedMultiboard
call MultiboardSetItemStyleBJ(bj_lastCreatedMultiboard,0,0,true,false)
call MultiboardSetItemStyleBJ(bj_lastCreatedMultiboard,0,0,true,false)
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,0,0,"0")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,0,4,"")
call MultiboardSetItemColorBJ(bj_lastCreatedMultiboard,6,0,'d',90.,.0,0)
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,1,1,"")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,2,1,"Resc.")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,3,1,"Coins")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,4,1,"Destr.")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,5,1,"Income")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,6,1,"|cffFFFF80Wins|r")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,1,2,"|cffFF0000West|r")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,1,3,"|cff00FF00East|r")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,1,4,"|cffFFFF00Round Time:|r")
call MultiboardSetItemValueBJ(bj_lastCreatedMultiboard,6,4,"|cffFFFF000|cffFF8000:|cffFFFF0000|r")
call MultiboardSetItemWidthBJ(bj_lastCreatedMultiboard,0,4,2.)
call MultiboardSetItemWidthBJ(bj_lastCreatedMultiboard,1,4,7.)
call MultiboardSetItemWidthBJ(bj_lastCreatedMultiboard,6,4,3)
call MultiboardDisplay(bj_lastCreatedMultiboard,true)
call AddWeatherEffectSaveLast(bj_mapInitialPlayableArea,'SNhs')
set udg_kx=bj_lastCreatedWeatherEffect
call TriggerSleepAction(1.)
call EnableWeatherEffect(udg_kx,false)
endfunction
function jC takes nothing returns nothing
call RemoveUnit(GetEnumUnit())
endfunction
function JC takes nothing returns nothing
call RemoveItem(GetEnumItem())
endfunction
function kC takes nothing returns nothing
if IsDestructableDeadBJ(GetEnumDestructable())then
call DestructableRestoreLife(GetEnumDestructable(),GetDestructableMaxLife(GetEnumDestructable()),true)
endif
endfunction
function KC takes nothing returns nothing
set udg_zi[udg_Fi[(1+GetPlayerId(GetEnumPlayer()))]]=(udg_zi[udg_Fi[(1+GetPlayerId(GetEnumPlayer()))]]+1)
endfunction
function lC takes nothing returns nothing
if not udg_se[(1+GetPlayerId(GetEnumPlayer()))]then
call zI(GetEnumPlayer(),'h033')
else
call rA(GetEnumPlayer())
endif
endfunction
function LC takes nothing returns nothing
call rA(GetEnumPlayer())
endfunction
function mC takes nothing returns nothing
call xA(CreateUnit(GetEnumPlayer(),udg_ti[udg_ui[(1+GetPlayerId(GetEnumPlayer()))]],GetPlayerStartLocationX(GetEnumPlayer()),GetPlayerStartLocationY(GetEnumPlayer()),270))
endfunction
function MC takes nothing returns nothing
call ShowUnit(GetEnumUnit(),true)
call SelectUnitForPlayerSingle(GetEnumUnit(),GetOwningPlayer(GetEnumUnit()))
endfunction
function pC takes nothing returns nothing
local force PC=CreateForce()
local unit qC
call TimerDialogDisplay(udg_Tr,false)
call DestroyTimerDialog(udg_Tr)
set udg_Tr=null
loop
set qC=FirstOfGroup(udg_Do[0])
exitwhen qC==null
call ForceAddPlayer(PC,GetOwningPlayer(qC))
call GroupRemoveUnit(udg_Do[0],qC)
call RemoveUnit(qC)
endloop
loop
set qC=FirstOfGroup(udg_Do[1])
exitwhen qC==null
call ForceAddPlayer(PC,GetOwningPlayer(qC))
call GroupRemoveUnit(udg_Do[1],qC)
call RemoveUnit(qC)
endloop
call ForForce(PC,function LC)
call DestroyForce(PC)
set PC=null
endfunction
function QC takes nothing returns nothing
local group g
local integer i
local player p1
local player p2
call DisableTrigger(udg_nE)
call GA()
call DisableTrigger(udg_OV)
call DisableTrigger(udg_XV)
set udg_cr[0]=0
set udg_cr[1]=0
call ForGroupBJ(udg_tx,function jC)
call GroupClear(udg_Lo)
call GroupClear(udg_da)
set i=0
loop
exitwhen i>1
set udg_lo[i]=0
set i=i+1
endloop
call FlushGameCache(udg_vr)
set udg_vr=InitGameCache("cf2.w3v")
set g=ER(GetWorldBounds())
call ForGroup(g,function nc)
call DestroyGroup(g)
set g=ER(GetWorldBounds())
call ForGroup(g,function nc)
call DestroyGroup(g)
set g=null
call ForGroup(udg_Ki,function jC)
set i=0
loop
exitwhen i>1
call IA(udg_xO[(i)])
call IA(udg_rO[(i)])
call IA(udg_iO[(i)])
call IA(udg_oO[(i)])
set i=i+1
endloop
call EnumItemsInRectBJ(GetWorldBounds(),function JC)
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,9.5,("Get ready for round |cffFFCC00"+(I2S(udg_Mr)+"|r!")))
call TriggerSleepAction(5.)
set udg_Bi=true
call CinematicFadeBJ(0,4.,"ReplaceableTextures\\CameraMasks\\Black_mask.blp",0,0,0,6.)
call EnumDestructablesInRectAll(bj_mapInitialPlayableArea,function kC)
call DA(udg_Mr)
if udg_ii==1 then
call VI()
elseif udg_ii==2 then
call XI(udg_xi)
set udg_ii=0
elseif udg_ii==3 then
call iI(udg_zo[0],0)
call iI(udg_zo[1],1)
set udg_zo[0]=0
set udg_zo[1]=0
set udg_ii=0
endif
set udg_ba=.0
set udg_Aa=0
call ForceClear(udg_Xi)
call GroupClear(udg_va)
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
set i=1
loop
exitwhen i>12
set udg_Pr[i]=false
set udg_yx[i]=.5
set udg_Kx[i]=0
set udg_Kx[i]=0
set udg_Jx[i]=-2
set udg_so[i]=0
set udg_Si[i]=0
set i=i+1
endloop
set i=0
loop
exitwhen i>1
set udg_ri[i]=-1
set udg_wx[i]=0
set udg_Gi[i]=0
set udg_zi[i]=0
call MultiboardSetItemValueBJ(udg_ar,3,udg_Xa[i],"0")
call MultiboardSetItemValueBJ(udg_ar,4,udg_Xa[i],"0")
set i=i+1
endloop
if not udg_fo then
call ForForce(udg_Ba,function KC)
endif
call MultiboardSetItemValueBJ(udg_ar,2,udg_Xa[0],I2S(udg_zi[0]))
call MultiboardSetItemValueBJ(udg_ar,2,udg_Xa[1],I2S(udg_zi[1]))
if udg_mi then
call Cc()
endif
set i=1
loop
exitwhen i>12
if udg_Cx then
call SetPlayerStateBJ(Player(-1+(i)),PLAYER_STATE_RESOURCE_GOLD,'d')
else
call SetPlayerStateBJ(Player(-1+(i)),PLAYER_STATE_RESOURCE_GOLD,250)
endif
call SetPlayerStateBJ(Player(-1+(i)),PLAYER_STATE_RESOURCE_LUMBER,'}')
if udg_px then
call SetPlayerStateBJ(Player(-1+(i)),PLAYER_STATE_RESOURCE_FOOD_CAP,0)
else
call SetPlayerStateBJ(Player(-1+(i)),PLAYER_STATE_RESOURCE_FOOD_CAP,1)
endif
set i=i+1
endloop
call YI()
set udg_qi=GetRandomInt(0,1)
if udg_Mr>1 and udg_Yi==false then
call ForForce(udg_Ba,function mC)
else
if udg_li then
call Tb()
endif
if udg_Ca==0 then
call ForForce(udg_Ba,function LC)
elseif udg_Ca==2 then
call ForceClear(udg_Ro[0])
call ForceClear(udg_Ro[1])
set i=1
loop
exitwhen i>12
if IsPlayerInForce(Player(i-1),udg_Ba)then
call ForceAddPlayer(udg_Ro[(i-1)/6],Player(i-1))
endif
set i=i+1
endloop
loop
set i=vA(Player(0))
set p1=ForcePickRandomPlayer(udg_Ro[0])
set p2=ForcePickRandomPlayer(udg_Ro[1])
if p1!=null then
call ForceRemovePlayer(udg_Ro[0],p1)
call xA(CreateUnit(p1,udg_ti[i],GetPlayerStartLocationX(p1),GetPlayerStartLocationY(p1),bj_UNIT_FACING))
endif
if p2!=null then
call ForceRemovePlayer(udg_Ro[1],p2)
call xA(CreateUnit(p2,udg_ti[i],GetPlayerStartLocationX(p2),GetPlayerStartLocationY(p2),bj_UNIT_FACING))
endif
exitwhen p1==null and p2==null
endloop
elseif udg_Ca==1 then
call ForForce(udg_Ba,function lC)
call TimerStart(udg_jr,34,false,function pC)
set udg_Tr=CreateTimerDialog(udg_jr)
call TimerDialogSetTitle(udg_Tr,"Pick Time:")
call TimerDialogDisplay(udg_Tr,true)
elseif udg_Ca==3 then
call vB()
endif
endif
set i=0
loop
exitwhen i>1
set g=ER(udg_ux[i])
call ForGroup(g,function jC)
call DestroyGroup(g)
set g=null
set bj_lastCreatedUnit=CreateUnitAtLoc(Player(i*6),'hcas',udg_xr[i],270)
set udg_Rr[i]=bj_lastCreatedUnit
call SetUnitInvulnerable(bj_lastCreatedUnit,true)
if udg_fi then
call UnitAddAbility(bj_lastCreatedUnit,'Asid')
call AddItemToStock(bj_lastCreatedUnit,'I00B',10,10)
endif
if udg_ji then
call UnitRemoveAbility(bj_lastCreatedUnit,'Aall')
call UnitRemoveAbility(bj_lastCreatedUnit,'Apit')
endif
set i=i+1
endloop
call EnableTrigger(udg_mn)
call TriggerSleepAction(4.)
set udg_hx=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,("Round |cffFFCC00"+(I2S(udg_Mr)+"|r started! gl & hf!")))
if udg_jx>0 then
set udg_gE=true
call FogEnable(true)
call TimerStart(udg_gr,I2R(udg_jx),false,null)
elseif udg_jx==-1 then
set udg_gE=true
call FogEnable(true)
endif
if udg_Ar then
call EnableTrigger(udg_hn)
call EnableTrigger(udg_Hn)
call EnableTrigger(udg_gn)
call EnableTrigger(udg_Gn)
set udg_jo[0]=1.
set udg_jo[1]=1.
set udg_qo[0]=false
set udg_qo[1]=false
if udg_io!=0 then
set udg_Va[0]=CreateUnit(Player(15),'n026',GetRectCenterX(udg_xn),GetRectCenterY(udg_xn),bj_UNIT_FACING)
endif
if udg_io!=1 then
set udg_Va[1]=CreateUnit(Player(15),'n026',GetRectCenterX(udg_on),GetRectCenterY(udg_on),bj_UNIT_FACING)
endif
endif
call ForGroupBJ(udg_Hx,function MC)
if udg_uo>0 then
call EnableTrigger(udg_BV)
endif
call EnableTrigger(udg_fV)
call EnableTrigger(udg_xE)
call EnableTrigger(udg_ln)
call EnableTrigger(udg_Ln)
call StartTimerBJ(udg_ko,true,udg_Mo)
call StartTimerBJ(udg_Na,true,udg_Mo*4)
call StartTimerBJ(udg_Qr,false,99999.)
call StartTimerBJ(udg_lr,true,1.)
call TriggerSleepAction(3.)
call ac()
call xc(true)
call TriggerSleepAction(3.)
call SetUnitInvulnerable(udg_Rr[0],false)
call SetUnitInvulnerable(udg_Rr[1],false)
endfunction
function sC takes nothing returns nothing
if udg_Wx==1 then
if udg_Ca==0 then
set udg_fx=(udg_Lr[1]+" has chosen single round/random race. You will get a random race! The first round determines the winner!")
set udg_Gx="Single Round Random"
elseif udg_Ca==2 then
set udg_fx=(udg_Lr[1]+" has chosen single round/mirror mode. Both teams will get the same random races! The first round determines the winner!")
set udg_Gx="Single Round Random"
elseif udg_Ca==1 then
set udg_fx=(udg_Lr[1]+" has chosen single round/pick race. You may pick your race! The first round determines the winner!")
set udg_Gx="Single Round Pick"
elseif udg_Ca==3 then
set udg_fx=(udg_Lr[1]+" has chosen single round/draft race. Races will be drafted! The first round determines the winner!")
set udg_Gx="Single Round Draft"
endif
else
if udg_Ca==0 then
if udg_Yi then
set udg_fx=(udg_Lr[1]+(" has chosen |cffFFFF00random|r race |cffFFFF00each round|r. You will get a new random race each round! Number of wins for overall victory: |cffFFFF00"+(I2S(udg_Wx)+"|r")))
set udg_Gx=("Random each round, |cffFFCC00"+(I2S(udg_Wx)+"|cffFFFF80 wins"))
else
set udg_fx=(udg_Lr[1]+(" has chosen |cffFFFF00random|r race. You will get a random race at the beginning that you keep for the |cffFFFF00whole game|r! Number of wins for overall victory: |cffFFFF00"+(I2S(udg_Wx)+"|r")))
set udg_Gx=("Random once, |cffFFCC00"+(I2S(udg_Wx)+"|cffFFFF80 wins"))
endif
elseif udg_Ca==2 then
if udg_Yi then
set udg_fx=(udg_Lr[1]+(" has chosen  |cffFFFF00mirror mode each round|r. Both teams will get the same random races each round! Number of wins for overall victory: |cffFFFF00"+(I2S(udg_Wx)+"|r")))
set udg_Gx=("Mirror each round, |cffFFCC00"+(I2S(udg_Wx)+"|cffFFFF80 wins"))
else
set udg_fx=(udg_Lr[1]+(" has chosen |cffFFFF00mirror mode|r. Both teams will get the same random races at the beginning that they will keep for the |cffFFFF00whole game|r! Number of wins for overall victory: |cffFFFF00"+(I2S(udg_Wx)+"|r")))
set udg_Gx=("Mirror once, |cffFFCC00"+(I2S(udg_Wx)+"|cffFFFF80 wins"))
endif
elseif udg_Ca==1 then
if udg_Yi then
set udg_fx=(udg_Lr[1]+(" has chosen |cffFFFF00pick|r race |cffFFFF00each round|r. You may pick a new race each round! Number of wins for overall victory: |cffFFFF00"+(I2S(udg_Wx)+"|r")))
set udg_Gx=("Pick each round, |cffFFCC00"+(I2S(udg_Wx)+"|cffFFFF80 wins"))
else
set udg_fx=(udg_Lr[1]+(" has chosen |cffFFFF00pick|r race. You may pick a race at the beginning that you keep for the |cffFFFF00whole game|r! Number of wins for overall victory: |cffFFFF00"+(I2S(udg_Wx)+"|r")))
set udg_Gx=("Pick once, |cffFFCC00"+(I2S(udg_Wx)+"|cffFFFF80 wins"))
endif
elseif udg_Ca==3 then
if udg_Yi then
set udg_fx=(udg_Lr[1]+(" has chosen |cffFFFF00draft|r race |cffFFFF00each round|r. You will draft a new race each round! Number of wins for overall victory: |cffFFFF00"+(I2S(udg_Wx)+"|r")))
set udg_Gx=("Draft each round, |cffFFCC00"+(I2S(udg_Wx)+"|cffFFFF80 wins"))
else
set udg_fx=(udg_Lr[1]+(" has chosen |cffFFFF00draft|r race. You will draft a race at the beginning that you keep for the |cffFFFF00whole game|r! Number of wins for overall victory: |cffFFFF00"+(I2S(udg_Wx)+"|r")))
set udg_Gx=("Draft once, |cffFFCC00"+(I2S(udg_Wx)+"|cffFFFF80 wins"))
endif
endif
set udg_fx=(udg_fx+"
|cffFF0000(Please don't leave after the first round!)|r")
endif
set udg_Gx=("|cffFFFF80"+(udg_Gx+"|r"))
set udg_Ux=true
call MultiboardSetTitleText(udg_ar,udg_Gx)
if not udg_go then
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,25.,udg_fx)
endif
endfunction
function SC takes string c returns boolean
if(c=="r")or(c=="g")then
return true
else
return false
endif
endfunction
function tC takes string c returns boolean
if(c=="r")then
return true
else
return false
endif
endfunction
function TC takes string s returns boolean
local string s1
local string s2
if(s=="")or(s==" ")then
set udg_Wx=1
set udg_Yi=true
return true
endif
set s1=SubStringBJ(s,1,1)
set s2=SubStringBJ(s,2,2)
if(SC(s1))and(KA(s2))then
set udg_Wx=S2I(s2)
set udg_Yi=tC(s1)
else
return false
endif
return true
endfunction
function DisplayBotNum takes nothing returns nothing
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"Number of bots to be added: "+udg_Ji[0]+": "+udg_pi+I2S(udg_zo[0])+"|r, "+udg_Ji[1]+": "+udg_pi+I2S(udg_zo[1])+"|r")
endfunction
function uC takes nothing returns nothing
if udg_ii!=1 then
set udg_ii=1
call EnableTrigger(udg_IE)
call DisableTrigger(udg_Jn)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[1]+" has enabled auto team balance! Teams will get balanced before each round by adding bots."))
else
call DisplayTextToPlayer(Player(0),0,0,"|cffFF0000Auto Team Balance is already on!|r")
endif
endfunction
function UC takes nothing returns nothing
if udg_ii!=0 then
set udg_ii=0
call EnableTrigger(udg_Jn)
call DisableTrigger(udg_IE)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[1]+" has disabled auto team balance!"))
endif
endfunction
function wC takes string fb returns nothing
if not lA(fb)then
return
endif
set udg_Pi=S2I(fb)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Lumber Limit|r has been set to |cffFFFF00"+fb+"|r.")
endfunction
function WC takes string fb returns nothing
local integer OI
if not lA(fb)then
return
endif
set OI=S2I(fb)
if OI<2 then
set OI=2
elseif OI>'x'then
set OI='x'
endif
set udg_Mo=OI
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Income Timer|r has been set to |cffFFFF00"+I2S(OI)+"|r.")
endfunction
function yC takes string YC returns nothing
local integer zC
local string ZC
local real i=192
if udg_bo then
return
endif
set udg_bo=true
if YC=="u"or YC=="t"then
set zC=-1
elseif YC=="d"or YC=="b"then
set zC=1
elseif YC==""then
set zC=(GetRandomInt(0,1)*2)-1
else
return
endif
if zC==1 then
set udg_io=0
set ZC="bottom"
else
set udg_io=1
set ZC="top"
endif
loop
exitwhen i>udg_Fr
call CreateDestructable('YTfc',1472,i*zC,270,1,0)
call CreateDestructable('YTfc',-1472,i*zC,270,1,0)
set i=i+128
endloop
set i=-1520
loop
exitwhen i>1520
call SetTerrainPathable(i,272*zC,PATHING_TYPE_WALKABILITY,false)
call SetTerrainPathable(i,272*zC,PATHING_TYPE_FLYABILITY,false)
set i=i+32
endloop
call CreateDestructable(udg_Ni[2],1472,640*zC,270,1.1,0)
call CreateDestructable(udg_Ni[2],-1472,640*zC,270,1.1,0)
call CreateDestructable(udg_Ni[2],1472,960*zC,270,1.1,0)
call CreateDestructable(udg_Ni[2],-1472,960*zC,270,1.1,0)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Single Lane|r has been chosen. Units are only able to walk/fly over the |cffFFFF00"+ZC+" lane|r.")
endfunction
function vd takes string ed returns nothing
local integer xd
local integer i=1
if ed==""then
set xd=-1
else
if not lA(ed)then
return
endif
set xd=S2I(ed)
if(xd<1)then
return
endif
endif
set udg_jx=xd
if udg_Jr[1]==null then
loop
exitwhen i>6
set udg_Jr[i]=CreateFogModifierRectBJ(true,Player(i-1),FOG_OF_WAR_VISIBLE,udg_ha)
set udg_Jr[i+6]=CreateFogModifierRectBJ(true,Player(i-1+6),FOG_OF_WAR_VISIBLE,udg_Ga)
call CreateFogModifierRectBJ(true,Player(i-1+6),FOG_OF_WAR_VISIBLE,udg_Za)
call CreateFogModifierRectBJ(true,Player(i-1),FOG_OF_WAR_VISIBLE,udg_Za)
set i=i+1
endloop
endif
if(xd==-1)then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"Permanent |cffC6FF00Fog of War|r has been chosen")
else
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Fog of War|r time has been set to |cffFFFF00"+I2S(xd)+"|r seconds.")
endif
endfunction
function od takes nothing returns nothing
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"Time is up and not all players have agreed. Extra rounds declined!")
call DisableTrigger(udg_vE)
call DestroyForce(udg_er)
endfunction
function rd takes string ad returns nothing
local integer nd
if not lA(ad)then
return
endif
set nd=S2I(ad)
if IsTriggerEnabled(udg_vE)then
call DisplayTextToPlayer(Player(0),0,0,"You cannot start another vote yet")
return
endif
if nd<1 or nd>3 then
call DisplayTextToPlayer(Player(0),0,0,"Invalid number of rounds, must be between 1 and 3")
return
endif
set udg_er=PA()
set udg_oo=nd
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,30,"|cffC6FF00"+I2S(nd)+" Extra Rounds|r vote has been started. You have 30 seconds to agree to it by typing |cffFFFF00-agree|r. If all players agree, the number of wins for overall victory will be increased by "+I2S(nd))
call ForceRemovePlayer(udg_er,Player(0))
call EnableTrigger(udg_vE)
call TimerStart(udg_Li,30,false,function od)
call Sb()
endfunction
function Vd takes string Ed returns nothing
local integer OI
if udg_li then
return
endif
if Ed==""then
set Ed="1"
endif
if not lA(Ed)then
return
endif
set OI=S2I(Ed)
if OI<1 or OI>2 then
call DisplayTextToPlayer(Player(0),0,0,"|cffFF0000Number of bans must be between 1 and 2|r")
return
endif
set udg_li=true
set udg_wi=OI
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Ban Race|r has been chosen. Number of bans per team: |cffFFFF00"+I2S(OI)+"|r")
endfunction
function Xd takes player Od,player Rd returns nothing
local integer i=(1+GetPlayerId(Rd))
set udg_di[i]=true
call ForceAddPlayer(udg_Ba,Rd)
call ForceAddPlayer(udg_wo[udg_Fi[i]],Rd)
set udg_Zi[udg_Fi[i]]=(udg_Zi[udg_Fi[i]]+1)
set udg_ui[i]=GetRandomInt(0,udg_Yr)
call SetPlayerAllianceStateBJ(Rd,Od,5)
call SetPlayerAllianceStateBJ(Od,Rd,5)
call jA(Rd,GetPlayerName(Od))
set udg_zr[i-1]=true
call ForceAddPlayer(udg_dr[GetPlayerId(Od)],Rd)
endfunction
function Id takes player Od,integer Ad returns nothing
local integer yI=GetPlayerId(Od)/6
local integer i=yI*6
loop
exitwhen i>yI*6+5
if not IsPlayerInForce(Player(i),udg_wo[yI])then
call Xd(Od,Player(i))
set Ad=Ad-1
endif
exitwhen Ad==0
set i=i+1
endloop
endfunction
function Nd takes string Ed returns nothing
local integer array j
local integer i=0
local integer bd
if not lA(Ed)then
return
endif
set bd=S2I(Ed)-1
if bd<1 or bd>5 then
call DisplayTextToPlayer(Player(0),0,0,"|cffFF0000Wrong number of players per player! Must be between 2 and 5!|r")
return
endif
if udg_Uo then
call DisplayTextToPlayer(Player(0),0,0,"|cffFF0000Multi Race mode is not possible while playing with AI Slots, use -fillX, -eastX or -westX instead!|r")
return
endif
set j[0]=CountPlayersInForceBJ(udg_wo[0])
set j[1]=CountPlayersInForceBJ(udg_wo[1])
if j[0]*bd>5 or j[1]*bd>5 then
call DisplayTextToPlayer(Player(0),0,0,"|cffFF0000Too many players for Multi Race mode!|r")
return
endif
set udg_Oi=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Multiple Players|r has been chosen. Number of additional players per human player: |cffFFFF00"+I2S(bd)+"|r")
loop
exitwhen i>11
if IsPlayerInForce(Player(i),udg_wo[i/6])and not udg_zr[i]then
call Id(Player(i),bd)
endif
set i=i+1
endloop
endfunction
function Bd takes string cd returns nothing
local string s=SubString(cd,1,3)
if(cd=="boons")then
call EnableTrigger(udg_bV)
call DisplayTextToPlayer(Player(0),0,0,"You have turned the boon reminder ON! Players will receive a message every minute, reminding them if there is another round after the current.")
elseif(cd=="noboons")then
call DisableTrigger(udg_bV)
call DisplayTextToPlayer(Player(0),0,0,"You have turned the boon reminder OFF!")
elseif(cd=="balance")and(not udg_Ci)then
call uC()
elseif(cd=="nobalance")and(not udg_Ci)then
call UC()
elseif SubString(cd,0,4)=="fill"then
set s=SubString(cd,4,5)
if(s=="")then
set udg_ii=2
set udg_xi=5
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[1]+" has enabled team fill! Teams will get filled with bots at the next round's beginning."))
elseif KA(s)then
set udg_xi=S2I(s)
if udg_xi>5 then
set udg_xi=5
endif
set udg_ii=2
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[1]+" has enabled fill teams up to "+s+" players! Teams will get filled with bots at the next round's beginning."))
endif
elseif SubString(cd,0,4)=="west"then
set s=SubString(cd,4,5)
if(s=="")then
set udg_ii=3
set udg_zo[0]=udg_zo[0]+1
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[1]+" has added one bot to the "+udg_Ji[0]+". It will join at the next round's beginning."))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"Number of bots to be added: "+udg_Ji[0]+": "+udg_pi+I2S(udg_zo[0])+"|r, "+udg_Ji[1]+": "+udg_pi+I2S(udg_zo[1])+"|r")
elseif KA(s)or s=="0"then
set udg_zo[0]=S2I(s)
set udg_ii=3
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[1]+" has set the number of bots to be added to the "+udg_Ji[0]+" to "+udg_pi+s+"|r. Bots will join at the next round's beginning."))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"Number of bots to be added: "+udg_Ji[0]+": "+udg_pi+I2S(udg_zo[0])+"|r, "+udg_Ji[1]+": "+udg_pi+I2S(udg_zo[1])+"|r")
endif
elseif SubString(cd,0,4)=="east"then
set s=SubString(cd,4,5)
if(s=="")then
set udg_ii=3
set udg_zo[1]=udg_zo[1]+1
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[1]+" has added one bot to the "+udg_Ji[1]+". It will join at the next round's beginning."))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"Number of bots to be added: "+udg_Ji[0]+": "+udg_pi+I2S(udg_zo[0])+"|r, "+udg_Ji[1]+": "+udg_pi+I2S(udg_zo[1])+"|r")
elseif KA(s)or s=="0"then
set udg_zo[1]=S2I(s)
set udg_ii=3
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[1]+" has set the number of bots to be added to the "+udg_Ji[1]+" to "+udg_pi+s+"|r. Bots will join at the next round's beginning."))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"Number of bots to be added: "+udg_Ji[0]+": "+udg_pi+I2S(udg_zo[0])+"|r, "+udg_Ji[1]+": "+udg_pi+I2S(udg_zo[1])+"|r")
endif
elseif SubString(cd,0,2)=="xr"then
call rd(SubString(cd,2,3))
elseif udg_ir then
return
elseif SubString(cd,0,2)=="mp"then
call Nd(SubString(cd,2,3))
elseif(cd=="dom")then
call TriggerExecute(udg_pV)
elseif(cd=="dr")then
call TriggerExecute(udg_UV)
elseif(cd=="pause")then
call DisableTrigger(udg_Bn)
call DisplayTimedTextToPlayer(Player(0),0,0,20,"|cffFF0000The game will not start after 20 seconds. Type -skip to start the game!|r")
elseif SubString(cd,0,1)=="m"then
if TC(s)then
set udg_Ca=2
call TriggerExecute(udg_In)
endif
elseif SubString(cd,0,1)=="p"then
if TC(s)then
set udg_Ca=1
call TriggerExecute(udg_In)
endif
elseif SubString(cd,0,1)=="r"then
if TC(s)then
set udg_Ca=0
call TriggerExecute(udg_In)
endif
elseif SubString(cd,0,1)=="d"then
if TC(s)then
set udg_Ca=3
set udg_oi=true
call TriggerExecute(udg_In)
endif
elseif(cd=="sm")then
call TriggerExecute(udg_ZV)
elseif(cd=="uo")then
call TriggerExecute(udg_JV)
elseif(cd=="ns")then
call TriggerExecute(udg_kV)
elseif(cd=="na")then
call TriggerExecute(udg_KV)
elseif(cd=="ntb")then
call TriggerExecute(udg_LV)
elseif(cd=="nb")then
call TriggerExecute(udg_mV)
elseif(cd=="nt")then
call TriggerExecute(udg_MV)
elseif(cd=="ht")then
call TriggerExecute(udg_PV)
elseif(cd=="ni")then
call TriggerExecute(udg_qV)
elseif(cd=="nai")then
call TriggerExecute(udg_zV)
elseif(cd=="cc")then
call TriggerExecute(udg_YV)
elseif(cd=="te")then
call TriggerExecute(udg_sV)
elseif(cd=="ca")then
call TriggerExecute(udg_lV)
elseif(cd=="co")then
call TriggerExecute(udg_uV)
elseif(cd=="lm")then
call TriggerExecute(udg_WV)
elseif(cd=="nafk")then
call TriggerExecute(udg_yV)
elseif(cd=="nl")then
call TriggerExecute(udg_QV)
elseif(cd=="nrs")then
call TriggerExecute(udg_tV)
elseif(cd=="ur")then
call TriggerExecute(udg_wV)
elseif(cd=="fi")then
call TriggerExecute(udg_SV)
elseif(cd=="nuke")then
call TriggerExecute(udg_TV)
elseif SubString(cd,0,2)=="ll"then
call wC(SubString(cd,2,8))
elseif SubString(cd,0,2)=="it"then
call WC(SubString(cd,2,5))
elseif SubString(cd,0,3)=="fow"then
call vd(SubString(cd,3,7))
elseif SubString(cd,0,2)=="sl"then
call yC(SubString(cd,2,3))
elseif SubString(cd,0,3)=="ban"then
call Vd(SubString(cd,3,4))
elseif(cd=="envlava")and(not udg_Lx)then
call TriggerExecute(udg_dE)
set udg_Lx=true
elseif(cd=="envice")and(not udg_Lx)then
call TriggerExecute(udg_cE)
set udg_Lx=true
elseif(cd=="skip")then
set udg_ai=true
endif
endfunction
function Cd takes string dd,string Dd returns integer
local integer i=0
if(StringLength(dd)>=StringLength(Dd))then
loop
exitwhen i>(StringLength(dd)-StringLength(Dd))
if(SubString(dd,i,i+StringLength(Dd))==Dd)then
return i
endif
set i=i+1
endloop
endif
return-1
endfunction
function fd takes string Fd returns nothing
local string gd=Fd
local string Gd
local integer i
local integer j
loop
set i=Cd(gd,"-")
exitwhen i==-1
set gd=SubString(gd,i+1,StringLength(gd))
set i=Cd(gd,"-")
set j=Cd(gd," ")
if(i==-1)then
set i=1000
endif
if(j==-1)then
set j=1000
endif
if(i!=1000)or(j!=1000)then
set Gd=SubString(gd,0,IMinBJ(i,j))
set gd=SubString(gd,IMinBJ(i,j),StringLength(gd))
else
set Gd=gd
endif
if(Gd!="")then
call Bd(Gd)
endif
endloop
if udg_ai and not udg_ir then
call TriggerExecute(udg_Bn)
endif
endfunction
function hd takes nothing returns nothing
call fd(GetEventPlayerChatString())
endfunction
function Hd takes nothing returns boolean
return GetUnitTypeId(GetSellingUnit())=='h033'
endfunction
function jd takes nothing returns nothing
local player p=GetOwningPlayer(GetSellingUnit())
local unit u
local integer i
call GroupRemoveUnit(udg_Do[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetSellingUnit())))]],GetSellingUnit())
call RemoveUnit(GetSellingUnit())
if not udg_Bi then
call RemoveUnit(GetSoldUnit())
return
endif
if GetLocalPlayer()==p then
call TimerDialogDisplay(udg_Tr,false)
endif
if GetUnitTypeId(GetSoldUnit())=='h03H'then
call RemoveUnit(GetSoldUnit())
set i=rA(p)
if udg_Ca==3 then
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,40,udg_Lr[(1+GetPlayerId(p))]+" has randomed |cffFFFF00"+udg_Go[i]+"|r")
endif
else
call SetUnitOwner(GetSoldUnit(),p,true)
call xA(GetSoldUnit())
if udg_Ca==3 then
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,40,udg_Lr[(1+GetPlayerId(p))]+" has picked |cffFFFF00"+udg_Go[GetUnitPointValue(GetSoldUnit())]+"|r")
endif
endif
endfunction
function Jd takes nothing returns boolean
return GetUnitTypeId(GetSellingUnit())=='h09W'
endfunction
function kd takes nothing returns nothing
local player p=GetOwningPlayer(GetSellingUnit())
local unit u
local integer i
call GroupRemoveUnit(udg_Do[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetSellingUnit())))]],GetSellingUnit())
call RemoveUnit(GetSellingUnit())
if not udg_Bi then
call RemoveUnit(GetSoldUnit())
return
endif
if GetUnitTypeId(GetSoldUnit())=='h03H'then
set i=vA(p)
call WI(i,-1)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_Lr[(1+GetPlayerId(p))]+" has random banned |cffFFFF00"+udg_Go[i]+"|r")
else
call WI(GetUnitPointValue(GetSoldUnit()),-1)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_Lr[(1+GetPlayerId(p))]+" has banned |cffFFFF00"+udg_Go[GetUnitPointValue(GetSoldUnit())]+"|r")
endif
call RemoveUnit(GetSoldUnit())
endfunction
function Kd takes nothing returns boolean
return(udg_Ux)
endfunction
function ld takes nothing returns nothing
set udg_ir=true
call DisableTrigger(GetTriggeringTrigger())
if(Kd())then
set udg_Mr=1
call TriggerExecute(udg_Rn)
else
call DialogSetMessage(udg_po[0],"Choose number of victories to win the game!")
call DialogAddButtonBJ(udg_po[0],"1")
set udg_Wi[4]=bj_lastCreatedButton
call DialogAddButtonBJ(udg_po[0],"2")
set udg_Wi[5]=bj_lastCreatedButton
call DialogAddButtonBJ(udg_po[0],"3")
set udg_Wi[6]=bj_lastCreatedButton
call DialogAddButtonBJ(udg_po[0],"4")
set udg_Wi[7]=bj_lastCreatedButton
call DialogDisplayBJ(true,udg_po[0],Player(0))
endif
endfunction
function Ld takes nothing returns boolean
return(GetClickedButton()==udg_Wi[7])
endfunction
function md takes nothing returns boolean
return(GetClickedButton()==udg_Wi[6])
endfunction
function Md takes nothing returns boolean
return(GetClickedButton()==udg_Wi[5])
endfunction
function pd takes nothing returns boolean
return(GetClickedButton()==udg_Wi[4])
endfunction
function Pd takes nothing returns nothing
if(pd())then
set udg_Wx=1
call TriggerExecute(udg_Dn)
else
if(Md())then
set udg_Wx=2
call TriggerExecute(udg_Cn)
else
if(md())then
set udg_Wx=3
call TriggerExecute(udg_Cn)
else
if(Ld())then
set udg_Wx=4
call TriggerExecute(udg_Cn)
endif
endif
endif
endif
endfunction
function qd takes nothing returns nothing
call DialogSetMessage(udg_po[1],"New races after each round?")
call DialogAddButtonBJ(udg_po[1],"YES")
set udg_Wi[8]=bj_lastCreatedButton
call DialogAddButtonBJ(udg_po[1],"NO")
set udg_Wi[9]=bj_lastCreatedButton
call DialogDisplayBJ(true,udg_po[1],Player(0))
endfunction
function Qd takes nothing returns boolean
return(GetClickedButton()==udg_Wi[9])
endfunction
function sd takes nothing returns boolean
return(GetClickedButton()==udg_Wi[8])
endfunction
function Sd takes nothing returns nothing
if(sd())then
set udg_Yi=true
else
if(Qd())then
set udg_Yi=false
endif
endif
call TriggerExecute(udg_Dn)
endfunction
function td takes nothing returns nothing
call DialogSetMessage(udg_po[2],"Choose the method of race distribution!")
call DialogAddButtonBJ(udg_po[2],"Pick your race!")
set udg_Wi[10]=bj_lastCreatedButton
call DialogAddButtonBJ(udg_po[2],"Random race!")
set udg_Wi[11]=bj_lastCreatedButton
call DialogDisplayBJ(true,udg_po[2],Player(0))
endfunction
function Td takes nothing returns boolean
return(GetClickedButton()==udg_Wi[11])
endfunction
function ud takes nothing returns boolean
return(GetClickedButton()==udg_Wi[10])
endfunction
function Ud takes nothing returns nothing
if(ud())then
set udg_Ca=1
else
if(Td())then
set udg_Ca=0
endif
endif
call TriggerExecute(udg_In)
call TriggerSleepAction(3.)
set udg_Mr=1
call TriggerExecute(udg_Rn)
endfunction
function wd takes nothing returns nothing
set udg_gE=false
call FogEnable(false)
endfunction
function Wd takes nothing returns boolean
return(IsUnitType(GetTriggerUnit(),UNIT_TYPE_FLYING)==false)and((1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))<=12)and(GetUnitPointValue(GetEnteringUnit())!=129)
endfunction
function yd takes nothing returns nothing
call Qb(0,GetEnteringUnit())
endfunction
function Yd takes nothing returns boolean
return(IsUnitType(GetTriggerUnit(),UNIT_TYPE_FLYING)==false)and((1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))<=12)and(GetUnitPointValue(GetEnteringUnit())!=129)
endfunction
function zd takes nothing returns nothing
call Qb(0,GetLeavingUnit())
endfunction
function Zd takes nothing returns boolean
return(IsUnitType(GetTriggerUnit(),UNIT_TYPE_FLYING)==false)and((1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))<=12)and(GetUnitPointValue(GetEnteringUnit())!=129)
endfunction
function vD takes nothing returns nothing
call Qb(1,GetEnteringUnit())
endfunction
function eD takes nothing returns boolean
return(IsUnitType(GetTriggerUnit(),UNIT_TYPE_FLYING)==false)and((1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))<=12)and(GetUnitPointValue(GetEnteringUnit())!=129)
endfunction
function xD takes nothing returns nothing
call Qb(1,GetLeavingUnit())
endfunction
function oD takes nothing returns nothing
call kb(udg_ar,5,3,mA())
endfunction
function rD takes nothing returns nothing
if GetUnitTypeId(GetEnumUnit())!='hcas'then
set udg_mr=ForcePickRandomPlayer(udg_wo[udg_Fi[(1+GetPlayerId(GetTriggerPlayer()))]])
set udg_Nr[(1+GetPlayerId(udg_mr))]=(udg_Nr[(1+GetPlayerId(udg_mr))]+1)
call SetUnitOwner(GetEnumUnit(),udg_mr,true)
if IsUnitType(GetEnumUnit(),UNIT_TYPE_STRUCTURE)then
call GroupAddUnit(udg_va,GetEnumUnit())
call IssueImmediateOrderById(GetEnumUnit(),udg_lx[GetUnitPointValue(GetEnumUnit())])
call IssueImmediateOrderById(GetEnumUnit(),udg_lx[GetUnitPointValue(GetEnumUnit())])
endif
endif
endfunction
function iD takes nothing returns nothing
call AdjustPlayerStateBJ(udg_Mi,GetEnumPlayer(),PLAYER_STATE_RESOURCE_GOLD)
call DisplayTextToPlayer(GetEnumPlayer(),0,0,(("You received |cffFFFF00"+I2S(udg_Mi))+(("|r gold and |cffFFFF00"+I2S(udg_Nr[(1+GetPlayerId(GetEnumPlayer()))]))+("|r units from "+udg_Lr[(1+GetPlayerId(GetTriggerPlayer()))]))))
endfunction
function aD takes nothing returns nothing
local integer i=1
local integer id=(1+GetPlayerId(GetTriggerPlayer()))
local integer yI=udg_Fi[id]
set udg_qr=udg_qr-1
set udg_Pr[id]=false
set udg_di[id]=false
call ForceRemovePlayer(udg_wo[yI],GetTriggerPlayer())
call ForceRemovePlayer(udg_Ba,GetTriggerPlayer())
set udg_Zi[yI]=(udg_Zi[yI]-1)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[id]+"|cffCA0000 has left the game!|r"))
if(id!=6 and id!=12)then
loop
exitwhen i>12
set udg_Nr[bj_forLoopAIndex]=0
set i=i+1
endloop
set udg_Mi=(GetPlayerState(GetTriggerPlayer(),PLAYER_STATE_RESOURCE_GOLD)/udg_Zi[yI])
call ForGroup(NR(GetTriggerPlayer()),function rD)
call ForForce(udg_wo[yI],function iD)
call DI()
endif
endfunction
function nD takes nothing returns boolean
return GetItemTypeId(GetManipulatedItem())=='I000'
endfunction
function VD takes nothing returns nothing
if GetOwningPlayer(GetTriggerUnit())!=GetEnumPlayer()then
call DisplayTextToPlayer(GetEnumPlayer(),0,0,(udg_Lr[udg_D]+" collected the coin!"))
endif
endfunction
function ED takes nothing returns nothing
local integer lb
local effect e
call RemoveItem(GetManipulatedItem())
set udg_D=(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))
set lb=R2I((I2R(udg_Kx[udg_D])+4.)*.25*(8.+udg_ba))
set udg_yr[udg_D]=udg_yr[udg_D]+1
set udg_Zo[udg_D]=udg_Zo[udg_D]+lb
call DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()),0,0,"|cffFFFF80You found |cffFFFF00"+I2S(lb)+"|cffFFFF80 gold!|r")
if udg_ri[udg_Fi[udg_D]]==udg_D then
set udg_Jx[udg_D]=udg_Jx[udg_D]+1
else
set udg_Jx[udg_D]=1
endif
set udg_nr[udg_Fi[udg_D]]=true
set udg_ri[udg_Fi[udg_D]]=udg_D
if udg_Jx[udg_D]==3 then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[udg_D]+(("|cffFFFF80 just collected |cffFFFF003|cffFFFF80 coins in a row for the "+udg_Ji[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]])+"|cffFFFF00! Very nice!")))
elseif udg_Jx[udg_D]==5 then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[udg_D]+(("|cffFFFF80 just collected|cffFFFF00 5|cffFFFF80 coins in a row for the "+udg_Ji[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]])+"|cffFFFF00! Impressive!")))
elseif udg_Jx[udg_D]==10 then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[udg_D]+(("|cffFFFF80 just collected|cffFFFF00 10|cffFFFF80 coins in a row for the "+udg_Ji[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]])+"|cffFFFF00! Sick!")))
else
call ForForce(udg_wo[udg_Fi[udg_D]],function VD)
endif
call AdjustPlayerStateBJ(lb,GetOwningPlayer(GetTriggerUnit()),PLAYER_STATE_RESOURCE_GOLD)
set e=AddSpecialEffectTarget("Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl",GetTriggerUnit(),"origin")
call DestroyEffect(e)
set e=null
call PlaySoundOnUnitBJ(udg_rn,'d',GetTriggerUnit())
set udg_wx[udg_Fi[udg_D]]=udg_wx[udg_Fi[udg_D]]+1
call kb(udg_ar,2,udg_Xa[udg_Fi[udg_D]]-1,I2S(udg_wx[udg_Fi[udg_D]]))
endfunction
function XD takes nothing returns boolean
return(IsUnitType(GetEnteringUnit(),UNIT_TYPE_PEON)!=null)
endfunction
function OD takes nothing returns nothing
call PingMinimapForPlayer(GetOwningPlayer(GetEnteringUnit()),GetUnitX(GetEnteringUnit()),GetUnitY(GetEnteringUnit()),1)
call SetUnitPosition(GetEnteringUnit(),GetPlayerStartLocationX(GetOwningPlayer(GetEnteringUnit())),GetPlayerStartLocationY(GetOwningPlayer(GetEnteringUnit())))
call DisplayTextToPlayer(GetOwningPlayer(GetEnteringUnit()),0,0,"|cffFF0000Your worker may not leave your castle!|r")
endfunction
function RD takes nothing returns nothing
call ExecuteFunc("qc")
call TriggerExecute(udg_aE)
call TriggerSleepAction(10.)
call TriggerExecute(udg_Rn)
endfunction
function ID takes nothing returns boolean
return GetUnitTypeId(GetDyingUnit())=='hcas'
endfunction
function AD takes nothing returns nothing
call ExecuteFunc("qc")
set udg_Ia=1+GetPlayerId(GetOwningPlayer(GetKillingUnit()))
set udg_I=1-udg_Fi[1+GetPlayerId(GetOwningPlayer(GetDyingUnit()))]
set udg_ia[udg_I]=udg_ia[udg_I]+1
call kb(udg_ar,5,udg_Xa[udg_I]-1,I2S(udg_ia[udg_I]))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Ji[udg_I]+" have won the round!"))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,((("The Score is |cffFF0000West|r: |cffFFCC00"+I2S(udg_ia[0]))+(" |cff00FF00East|r:|cffFFCC00 "+I2S(udg_ia[1])))+("|r. Number of wins for overall victory: |cffFFCC00"+(I2S(udg_Wx)+"|r"))))
if udg_ia[udg_I]>=udg_Wx then
set udg_ni=true
set udg_GE=udg_I
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(("|cffFFFF00Congratulations! "+udg_Ji[udg_I])+"|cffFFFF00 have won the match! Game ends in one minute.|r"))
call DestroyTimer(udg_si)
call TriggerExecute(udg_aE)
call TriggerSleepAction(15.)
call ForGroup(ER(bj_mapInitialPlayableArea),function nc)
call TriggerSleepAction(45.)
set udg_I=0
loop
exitwhen udg_I>11
if udg_Fi[udg_I+1]==udg_GE then
call CustomVictoryBJ(Player(udg_I),true,true)
else
call CustomDefeatBJ(Player(udg_I),"You were defeated!")
endif
set udg_I=udg_I+1
endloop
else
call TriggerExecute(udg_aE)
call TriggerSleepAction(15.)
set udg_Mr=udg_Mr+1
call TriggerExecute(udg_Rn)
endif
endfunction
function ND takes nothing returns boolean
return not IsPlayerInForce(GetTriggerPlayer(),udg_Xi)
endfunction
function Trig_First_Building_Func007C takes nothing returns boolean
return(udg_Aa>=4)
endfunction
function bD takes nothing returns nothing
local integer lb
set udg_Aa=udg_Aa+1
set lb=(5-udg_Aa)*5
set udg_Ko[(1+GetPlayerId(GetTriggerPlayer()))]=(udg_Ko[(1+GetPlayerId(GetTriggerPlayer()))]+lb)
call AdjustPlayerStateBJ(lb,GetTriggerPlayer(),PLAYER_STATE_RESOURCE_GOLD)
call DisplayTextToPlayer(GetTriggerPlayer(),0,0,(("|cffFFFF80You receive |cffFFCC00"+I2S(lb))+("|cffFFFF80 gold for being the "+(udg_Ui[udg_Aa]+" player that finishes a structure!"))))
if udg_Aa>=4 then
call DisableTrigger(GetTriggeringTrigger())
else
call ForceAddPlayer(udg_Xi,GetTriggerPlayer())
endif
endfunction
function BD takes nothing returns boolean
return(GetIssuedOrderId()==851971)
endfunction
function cD takes nothing returns nothing
local location l=GetRandomLocInRect(udg_Mx[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetOrderedUnit())))]])
call IssuePointOrderByIdLoc(GetOrderedUnit(),851984,l)
call RemoveLocation(l)
set l=null
endfunction
function CD takes unit u returns nothing
local integer i=(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1])*4096+GetUnitUserData(u)
set udg_Yo[i]=udg_Yo[i]+1
endfunction
function dD takes nothing returns nothing
if IsUnitType(GetTriggerUnit(),UNIT_TYPE_SAPPER)then
call CD(GetOrderedUnit())
call pA(GetOrderedUnit())
if GetUnitAbilityLevel(GetOrderedUnit(),'A08X')==1 then
call aN(udg_Z,GetOrderedUnit(),GetOrderedUnit())
endif
elseif GetUnitTypeId(GetOrderedUnit())=='h001'then
call cD()
elseif GetUnitTypeId(GetOrderedUnit())=='h00N'then
set udg_yo=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetOrderedUnit()))))+1]))])]))
call IssueTargetOrderById(GetOrderedUnit(),851983,udg_yo)
endif
endfunction
function DD takes nothing returns boolean
return(GetSpellAbilityId()=='A005')
endfunction
function fD takes nothing returns nothing
local integer i=(1+GetPlayerId(GetOwningPlayer(GetEventDamageSource())))
set udg_Si[i]=udg_Si[i]+R2I(GetUnitState(GetTriggerUnit(),UNIT_STATE_LIFE))
set udg_so[i]=udg_so[i]+1
endfunction
function FD takes nothing returns nothing
local location l=GetSpellTargetLoc()
local integer yI=udg_Fi[(1+GetPlayerId(GetTriggerPlayer()))]
local integer gD=(1+GetPlayerId(GetTriggerPlayer()))
local unit u=CreateUnitAtLoc(GetOwningPlayer(GetTriggerUnit()),'h04X',l,0)
local unit GD=GetTriggerUnit()
local trigger hD=CreateTrigger()
local group HD=CreateGroup()
call SetUnitVertexColorBJ(u,.0,.0,.0,100.)
call DestroyEffect(AddSpecialEffectTarget("Units\\NightElf\\Wisp\\WispExplode.mdl",u,"origin"))
call DestroyEffect(AddSpecialEffectTarget("Units\\NightElf\\Wisp\\WispExplode.mdl",u,"origin"))
call DestroyEffect(AddSpecialEffectTarget("Units\\NightElf\\Wisp\\WispExplode.mdl",u,"origin"))
call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl",GetTriggerUnit(),"origin"))
call UnitRemoveAbility(GetTriggerUnit(),'A005')
call UnitRemoveAbility(GetTriggerUnit(),'A06E')
set udg_zi[yI]=udg_zi[yI]-1
if udg_zi[yI]==0 then
call kb(udg_ar,1,udg_Xa[yI]-1,"|cffFF00000|r")
else
call kb(udg_ar,1,udg_Xa[yI]-1,I2S(udg_zi[yI]))
endif
call TriggerSleepAction(.35)
call TriggerAddCondition(hD,udg_Av)
call TriggerAddAction(hD,function fD)
set udg_av=GD
call GroupEnumUnitsInRangeOfLoc(HD,l,1200,udg_Ev)
loop
set GD=FirstOfGroup(HD)
exitwhen GD==null
call GroupRemoveUnit(HD,GD)
call TriggerRegisterUnitEvent(hD,GD,EVENT_UNIT_DAMAGED)
if GetUnitAbilityLevel(GD,'B012')>0 then
call UnitRemoveAbility(GD,'B012')
endif
endloop
call IssueImmediateOrderById(u,852526)
call TriggerSleepAction(1.5)
if udg_so[gD]==0 then
call DisplayTextToForce(udg_Ba,udg_Lr[gD]+" wasted his Rescue Strike, killing no unit! Epic Fail!")
elseif udg_so[gD]==1 then
call DisplayTextToForce(udg_Ba,udg_Lr[gD]+" wasted his Rescue Strike, killing only one unit!")
elseif udg_so[gD]<5 then
call DisplayTextToForce(udg_Ba,udg_Lr[gD]+" wasted his Rescue Strike, dealing only |cffFFFF00"+I2S(udg_Si[gD])+"|r damage and killing only |cffFFFF00"+I2S(udg_so[gD])+"|r units!")
else
call DisplayTextToForce(udg_Ba,udg_Lr[gD]+" dealt |cffFFFF00"+I2S(udg_Si[gD])+"|r damage with his Rescue Strike, killing |cffFFFF00"+I2S(udg_so[gD])+"|r units!")
endif
call DestroyTrigger(hD)
set hD=null
call RemoveLocation(l)
set l=null
call DestroyGroup(HD)
set HD=null
call RemoveUnit(u)
endfunction
function jD takes nothing returns boolean
return udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetAttacker())))]==udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]
endfunction
function JD takes nothing returns nothing
if GetUnitLifePercent(GetTriggerUnit())>=20.then
call IssueImmediateOrderById(GetAttacker(),851972)
endif
endfunction
function kD takes unit u returns boolean
return(GetUnitTypeId(u)=='n00V')or(GetUnitTypeId(u)=='n01O')
endfunction
function KD takes unit u returns boolean
return((GetUnitTypeId(u)=='h01U')or(GetUnitTypeId(u)=='h05H'))and(IsUnitType(GetTriggerUnit(),UNIT_TYPE_UNDEAD)==false)and(IsUnitType(GetTriggerUnit(),UNIT_TYPE_MECHANICAL)==false)and(GetUnitAbilityLevelSwapped('A07G',GetTriggerUnit())==0)
endfunction
function lD takes nothing returns nothing
local unit u=udg_Po
local unit LD=GetTriggerUnit()
if(GetUnitPointValue(u)==129)then
call pA(u)
elseif(kD(u))then
call IssueImmediateOrderById(u,852100)
call pA(u)
elseif(KD(u))then
if(GetUnitTypeId(u)=='h01U')then
call Ac('h01V',LD,u,GetOwningPlayer(u))
else
call Ac('h01U',LD,u,GetOwningPlayer(u))
endif
call XB("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl",bj_lastCreatedUnit)
call RemoveUnit(LD)
elseif(GetUnitPointValue(u)==128)then
if(GetUnitTypeId(u)=='e00B')then
call SetUnitLifePercentBJ(u,(GetUnitLifePercent(u)+14.))
else
call SetUnitLifePercentBJ(u,(GetUnitLifePercent(u)+20.))
endif
endif
endfunction
function mD takes nothing returns nothing
local unit u=udg_Po
local unit LD=GetTriggerUnit()
if(GetUnitTypeId(LD)=='e00A'and not IsUnitType(u,UNIT_TYPE_STRUCTURE))then
call UnitDamageTargetBJ(LD,u,350,ATTACK_TYPE_CHAOS,DAMAGE_TYPE_NORMAL)
endif
endfunction
function MD takes unit pD returns unit
local unit u=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((pD))))+1]))])]))
local unit u2=null
local unit u3=null
local integer i=0
if(u==null)then
return null
endif
loop
exitwhen i>4
set i=i+1
if GetUnitAbilityLevel(u,'B012')==0 then
if not(IsUnitType(u,UNIT_TYPE_MELEE_ATTACKER))then
set u2=u
if(GetUnitState(u,UNIT_STATE_MANA)>=40.)then
return u
endif
else
if(GetUnitState(u,UNIT_STATE_MANA)>=40.)then
set u3=u
endif
if false then
return null
endif
endif
endif
set u=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((pD))))+1]))])]))
endloop
if(u2!=null)then
return u2
endif
if(u3!=null)then
return u3
endif
if GetUnitAbilityLevel(u,'B012')>0 then
return null
endif
return u
endfunction
function PD takes unit qD,unit rN returns nothing
call IssueTargetOrderById(qD,851983,rN)
call SaveUnitHandle(udg_hE,0,GetHandleId(qD),rN)
endfunction
function QD takes nothing returns nothing
local unit u=udg_Po
local unit rN
local integer s
if(GetUnitPointValue(u)==129)then
set s=GetHandleId(u)
if GetUnitAbilityLevel(u,'B012')>0 then
if HaveSavedHandle(udg_hE,0,s)then
set rN=LoadUnitHandle(udg_hE,0,s)
if rN==null or GetUnitX(rN)==.0 or IsUnitType(rN,UNIT_TYPE_DEAD)then
call RemoveSavedHandle(udg_hE,0,s)
call TriggerExecute(udg_sn)
return
endif
if not IssueTargetOrderById(u,851983,rN)then
call RemoveSavedHandle(udg_hE,0,s)
call TriggerExecute(udg_sn)
return
endif
else
set rN=MD(u)
if rN==null then
call IssuePointOrderById(u,851986,GetUnitX(u),GetUnitY(u))
return
endif
call PD(u,rN)
return
endif
else
if HaveSavedHandle(udg_hE,0,s)then
set rN=LoadUnitHandle(udg_hE,0,s)
if rN==null or GetUnitX(rN)==.0 or IsUnitType(rN,UNIT_TYPE_DEAD)then
call RemoveSavedHandle(udg_hE,0,s)
call TriggerExecute(udg_sn)
return
endif
call IssueTargetOrderById(u,851983,rN)
elseif(GetUnitState(u,UNIT_STATE_MANA)>=50.)then
call IssueImmediateOrderById(u,852129)
call TriggerSleepAction(.1)
set rN=MD(u)
if rN==null then
return
endif
call PD(u,rN)
call TriggerSleepAction(2)
call IssueTargetOrderById(u,851983,rN)
return
else
call MA(u)
return
endif
endif
elseif GetUnitTypeId(u)=='n01U'then
if HaveStoredReal(udg_vr,"repairgobboX",(I2S(GetHandleId((u)))))then
set udg_X=GetStoredReal(udg_vr,"repairgobboX",(I2S(GetHandleId((u)))))
set udg_Y=GetStoredReal(udg_vr,"repairgobboY",(I2S(GetHandleId((u)))))
if RAbsBJ(udg_X-GetUnitX(u))<300 and RAbsBJ(udg_Y-GetUnitY(u))<300 then
call IssuePointOrderById(u,851986,GetUnitX(u),GetUnitY(u))
call FlushStoredReal(udg_vr,"repairgobboX",(I2S(GetHandleId((u)))))
call FlushStoredReal(udg_vr,"repairgobboY",(I2S(GetHandleId((u)))))
else
call IssuePointOrderById(u,851986,udg_X,udg_Y)
endif
else
call IssuePointOrderById(u,851986,GetUnitX(u),GetUnitY(u))
endif
endif
endfunction
function sD takes nothing returns boolean
return GetUnitAbilityLevel(GetAttacker(),'A03Q')==1
endfunction
function SD takes unit tD,unit GB returns nothing
local integer i=GetRandomInt(0,99)
local real TD
local location l
local effect e
if GetUnitAbilityLevel(tD,'B019')==1 then
return
endif
if(i<15)and(GetUnitAbilityLevel(GB,'A070')==0)and IsUnitType(GB,UNIT_TYPE_MECHANICAL)==false then
call TriggerSleepAction(1)
if GB==null or IsUnitType(GB,UNIT_TYPE_DEAD)then
return
endif
set TD=GetUnitState(GB,UNIT_STATE_LIFE)/2
call UnitDamageTarget(tD,GB,10000,true,false,ATTACK_TYPE_CHAOS,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
call SetUnitState(tD,UNIT_STATE_LIFE,GetUnitState(tD,UNIT_STATE_LIFE)+TD)
set e=AddSpecialEffectTarget("Abilities\\Spells\\Orc\\AncestralSpirit\\AncestralSpiritCaster.mdl",GB,"chest")
call TriggerSleepAction(1.2)
call DestroyEffect(e)
set e=null
elseif(i<25)then
call TriggerSleepAction(1)
call VN(udg_S,tD,GB)
endif
endfunction
function uD takes nothing returns nothing
local unit UD=GetAttacker()
local unit GB=GetTriggerUnit()
if GetUnitTypeId(UD)=='u00D'then
call SD(UD,GB)
elseif GetUnitTypeId(UD)=='n01V'then
call IssuePointOrderById(UD,852040,GetUnitX(UD),GetUnitY(UD))
endif
endfunction
function wD takes nothing returns nothing
call SetUnitVertexColorBJ(bj_lastCreatedUnit,'d','d','d',100.)
endfunction
function WD takes nothing returns nothing
if GetUnitAbilityLevelSwapped('A07H',GetTrainedUnit())==0 and GetRandomInt(0,99)<24 then
call Ac(GetUnitTypeId(GetTrainedUnit()),GetTrainedUnit(),GetTriggerUnit(),GetOwningPlayer(GetEnumUnit()))
call Oc(GetTriggerUnit(),bj_lastCreatedUnit)
endif
endfunction
function yD takes nothing returns nothing
local unit u=GetTrainedUnit()
local unit uB=GetTriggerUnit()
local integer i=(1+GetPlayerId(GetOwningPlayer(uB)))
set udg_Ao[i]=(udg_Ao[i]+1)
set i=(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1])
set udg_Br[i]=(udg_Br[i]+1)
call KB(u)
call pA(u)
call Oc(uB,u)
if GetUnitAbilityLevel(u,'A07J')==1 then
call Ic(uB,u)
endif
call ForGroupBJ(udg_Zx[i],function WD)
call TriggerSleepAction(.1)
call IssueImmediateOrderById(uB,udg_lx[GetUnitPointValue(uB)])
call pA(u)
endfunction
function YD takes nothing returns boolean
return(not(IsUnitType(GetDyingUnit(),UNIT_TYPE_STRUCTURE)))and(not(IsUnitType(GetDyingUnit(),UNIT_TYPE_TAUREN)))and(not(IsUnitType(GetDyingUnit(),UNIT_TYPE_SAPPER)==false))
endfunction
function zD takes nothing returns nothing
local unit u
local integer i
call LB(GetTriggerUnit())
if GetDyingUnit()==null then
return
endif
if GetKillingUnit()!=null then
set u=(TA(GetKillingUnit()))
set i=(1+GetPlayerId(GetOwningPlayer(u)))
set udg_Cr[i]=udg_Cr[i]+1
set udg_Ra[udg_Fi[i]]=udg_Ra[udg_Fi[i]]+1
if GetUnitAbilityLevel(u,'A07K')>0 then
set udg_Po=u
call TriggerExecute(udg_qn)
endif
if GetUnitAbilityLevelSwapped('A07O',GetDyingUnit())>0 then
set udg_Po=u
call TriggerExecute(udg_Qn)
endif
endif
set i=IMinBJ(udg_lo[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetDyingUnit())))]],2)
if i<=0 then
return
endif
set u=GetDyingUnit()
call TriggerSleepAction(2)
if u==null then
return
endif
loop
exitwhen i<=0
if(GetRandomInt(0,99)<20)and(GetUnitAbilityLevel(u,'A07G')==0)then
if GetUnitPointValue(u)=='h'or GetUnitPointValue(u)=='i'then
call Vc(GetUnitTypeId(u),u,null,GetOwningPlayer(u))
else
call Ac(GetUnitTypeId(u),u,null,GetOwningPlayer(u))
endif
call XB("Abilities\\Spells\\Human\\Resurrect\\ResurrectCaster.mdl",u)
call RemoveUnit(u)
exitwhen true
endif
set i=i-1
endloop
endfunction
function ZD takes nothing returns nothing
local unit u=GetEnumUnit()
if GetUnitAbilityLevel(u,'Bfrz')>0 and GetRandomInt(0,99)<50 then
call UnitRemoveAbility(u,'Bfrz')
endif
if GetUnitAbilityLevel(u,'B00M')>0 and GetRandomInt(0,99)<50 then
call UnitRemoveAbility(u,'B00M')
endif
endfunction
function vf takes nothing returns nothing
local unit ef=LoadUnitHandle(udg_jE,0,(LoadInteger(udg_o,0,GetHandleId((GetExpiredTimer())))))
if ef==null or GetUnitPointValue(ef)!=GetUnitPointValueByType('h09T')or GetUnitState(ef,UNIT_STATE_LIFE)<.405 then
call RemoveSavedHandle(udg_jE,0,(LoadInteger(udg_o,0,GetHandleId((GetExpiredTimer())))))
call WR(GetExpiredTimer())
set ef=null
return
endif
call GroupEnumUnitsInRange(udg_HE,GetUnitX(ef),GetUnitY(ef),252.,udg_Iv)
call ForGroup(udg_HE,function ZD)
call GroupClear(udg_HE)
set ef=null
endfunction
function xf takes unit of returns nothing
local timer t=wR()
call UnitAddAbility(GetConstructedStructure(),'A09S')
call UnitAddAbility(GetConstructedStructure(),'A09P')
call UnitAddAbility(GetConstructedStructure(),'A09V')
call TimerStart(t,4.,true,function vf)
call SaveInteger(udg_o,0,GetHandleId((t)),(GetHandleId(of)))
call SaveUnitHandle(udg_jE,0,GetHandleId(of),of)
endfunction
function rf takes nothing returns nothing
local unit u=GetConstructedStructure()
local integer yI=(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1])
set udg_D=(1+GetPlayerId(GetOwningPlayer(u)))
set udg_I=GetUnitPointValue(u)
if udg_I==1000 then
return
endif
call ResetUnitAnimation(udg_br[udg_D])
call GroupRemoveUnit(udg_E,u)
call TB(u)
set udg_J=(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1])+2*udg_gi[udg_I]
set udg_uv[udg_J]=udg_uv[udg_J]+1
set udg_Ir[udg_D]=udg_Ir[udg_D]+udg_Fx[udg_I]
set udg_bi[udg_Fi[udg_D]]=udg_bi[udg_Fi[udg_D]]+1
if udg_gi[udg_I]==2 then
set udg_So[udg_D]=udg_So[udg_D]+1
elseif udg_gi[udg_I]==0 then
set udg_tr[udg_D]=udg_tr[udg_D]+1
if(GetUnitAbilityLevel((u),'A06V')>0)then
else
call Db(u,udg_Fx[udg_I])
endif
elseif udg_gi[udg_I]==1 then
set udg_tr[udg_D]=udg_tr[udg_D]+1
call Db(u,udg_Fx[udg_I]*3/4)
endif
set udg_yx[udg_D]=udg_yx[udg_D]+udg_ro[udg_I]*I2R(udg_Fx[udg_I])/100.
call iA(udg_oO[yI],u)
call IssueImmediateOrderById(u,udg_lx[udg_I])
call IssueImmediateOrderById(u,udg_lx[udg_I])
if GetUnitTypeId(u)=='h001'then
call GroupAddUnit(udg_Lo,u)
set udg_X=GetRandomReal(GetRectMinX(udg_Mx[udg_Fi[udg_D]]),GetRectMaxX(udg_Mx[udg_Fi[udg_D]]))
set udg_Y=GetRandomReal(GetRectMinY(udg_Mx[udg_Fi[udg_D]]),GetRectMaxY(udg_Mx[udg_Fi[udg_D]]))
call IssuePointOrderById(u,851984,udg_X,udg_Y)
elseif GetUnitTypeId(u)=='h00N'then
call GroupAddUnit(udg_da,u)
call IssueTargetOrderById(u,851983,(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((u))))+1]))])])))
elseif GetUnitTypeId(u)=='h008'then
set udg_Kx[udg_D]=udg_Kx[udg_D]+1
elseif GetUnitTypeId(u)=='h059'then
set udg_lo[udg_Fi[udg_D]]=udg_lo[udg_Fi[udg_D]]+1
elseif GetUnitTypeId(u)=='h05G'then
call GroupAddUnit(udg_Zx[udg_Fi[udg_D]],u)
elseif GetUnitTypeId(u)=='h01O'then
call UnitAddAbility(u,'A01V')
elseif GetUnitTypeId(u)=='h00G'then
call UnitAddAbility(u,'A008')
call UnitAddAbility(u,'A007')
elseif GetUnitTypeId(u)=='h05L'then
call EnableTrigger(udg_XV)
elseif GetUnitTypeId(u)=='h09T'then
call xf(u)
endif
endfunction
function af takes nothing returns nothing
call GroupAddUnit(udg_E,GetConstructingStructure())
endfunction
function nf takes nothing returns nothing
set udg_Mi=(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))
set udg_yi=(udg_ro[GetUnitPointValue(GetTriggerUnit())]*I2R((udg_Fx[GetUnitPointValue(GetTriggerUnit())]+udg_ca[GetUnitPointValue(GetTriggerUnit())])))
set udg_yx[udg_Mi]=(udg_yx[udg_Mi]+(udg_yi/100.))
endfunction
function Vf takes nothing returns nothing
local unit u
set udg_D=(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))
set udg_I=GetUnitPointValue(GetTriggerUnit())
if udg_I>1000 then
call Nc(GetOwningPlayer(GetTriggerUnit()),udg_I-1000)
return
endif
set udg_Ir[udg_D]=udg_Ir[udg_D]+udg_Fx[udg_I]
call IssueImmediateOrderById(GetTriggerUnit(),udg_lx[udg_I])
call IssueImmediateOrderById(GetTriggerUnit(),udg_lx[udg_I])
call TB(GetTriggerUnit())
set udg_yx[udg_D]=udg_yx[udg_D]+udg_ro[udg_I]*I2R(udg_Fx[udg_I])/100.
if udg_gi[udg_I]==0 then
if(GetUnitAbilityLevel((GetTriggerUnit()),'A06V')>0)then
else
call Db(GetTriggerUnit(),udg_Fx[udg_I])
endif
elseif udg_gi[udg_I]==1 then
call Db(GetTriggerUnit(),udg_Fx[udg_I]*3/4)
endif
if udg_gi[udg_I]==2 or'h056'==GetUnitTypeId(GetTriggerUnit())then
set u=GetTriggerUnit()
call IssueImmediateOrderById(u,852602)
call TriggerSleepAction(1.)
call IssueTargetOrderById(u,852601,GroupPickRandomUnit(udg_Vo))
call TriggerSleepAction(45.)
call IssueTargetOrderById(u,852601,GroupPickRandomUnit(udg_Vo))
endif
endfunction
function Ef takes nothing returns boolean
return(IsUnitType(GetDyingUnit(),UNIT_TYPE_STRUCTURE))and(GetUnitTypeId(GetDyingUnit())!='hcas')
endfunction
function Xf takes nothing returns nothing
local integer UB=GetUnitPointValue(GetDyingUnit())
local integer yI=(udg_Fi[GetPlayerId(GetOwningPlayer((GetDyingUnit())))+1])
call GroupRemoveUnit(udg_E,GetDyingUnit())
call MN(GetTriggerUnit())
set yI=(udg_Fi[GetPlayerId(GetOwningPlayer((GetDyingUnit())))+1])
call VA(udg_oO[yI],GetDyingUnit())
call GroupRemoveUnit(udg_ix[yI],GetDyingUnit())
call GroupRemoveUnit(udg_ax[yI],GetDyingUnit())
call GroupRemoveUnit(udg_nx[yI],GetDyingUnit())
set udg_J=yI+2*udg_gi[UB]
set udg_uv[udg_J]=udg_uv[udg_J]-1
if(TA(GetKillingUnit()))!=null then
set udg_J=(udg_Fi[GetPlayerId(GetOwningPlayer(((TA(GetKillingUnit())))))+1])
set udg_Gi[udg_J]=udg_Gi[udg_J]+1
call kb(udg_ar,3,udg_Xa[udg_J]-1,I2S(udg_Gi[udg_J]))
endif
set udg_J=(1+GetPlayerId(GetOwningPlayer(GetDyingUnit())))
if not IsUnitInGroup(GetDyingUnit(),udg_va)then
set udg_R=udg_ro[UB]*I2R(udg_Fx[UB]+udg_ca[UB])
set udg_yx[udg_J]=udg_yx[udg_J]-udg_R/100.
if GetUnitTypeId(GetDyingUnit())=='h008'then
set udg_Kx[udg_J]=udg_Kx[udg_J]-1
endif
else
call GroupRemoveUnit(udg_va,GetDyingUnit())
endif
if GetUnitTypeId(GetDyingUnit())=='h001'then
call GroupRemoveUnit(udg_Lo,GetDyingUnit())
elseif GetUnitTypeId(GetDyingUnit())=='h00N'then
call GroupRemoveUnit(udg_da,GetDyingUnit())
elseif GetUnitTypeId(GetDyingUnit())=='h059'then
set udg_lo[yI]=udg_lo[yI]-1
elseif GetUnitTypeId(GetDyingUnit())=='h05G'then
call GroupRemoveUnit(udg_Zx[yI],GetDyingUnit())
endif
endfunction
function Of takes nothing returns boolean
return GetUnitAbilityLevel(GetConstructingStructure(),'A07E')==1
endfunction
function Rf takes nothing returns nothing
call qN(GetConstructingStructure())
endfunction
function If takes nothing returns boolean
return GetUnitAbilityLevel(GetTriggerUnit(),'A07E')==1
endfunction
function Af takes nothing returns nothing
call MN(GetTriggerUnit())
call QN(GetTriggerUnit())
endfunction
function Nf takes nothing returns nothing
call MN(GetTriggerUnit())
call qN(GetTriggerUnit())
endfunction
function bf takes nothing returns boolean
return(IsUnitType(GetTriggerUnit(),UNIT_TYPE_STRUCTURE)==false)and(IsUnitType(GetTriggerUnit(),UNIT_TYPE_SAPPER))
endfunction
function Bf takes nothing returns nothing
call lB(GetTriggerUnit(),ModuloInteger(udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]+1,2))
call KB(GetTriggerUnit())
if GetUnitTypeId(GetTriggerUnit())=='h03A'then
call TriggerSleepAction(.1)
call IssueImmediateOrderById(GetTriggerUnit(),852055)
call TriggerSleepAction(.1)
endif
call pA(GetTriggerUnit())
endfunction
function cf takes nothing returns boolean
return(GetUnitTypeId(GetSummoningUnit())=='h03C')
endfunction
function Cf takes nothing returns nothing
local unit u=GetSummonedUnit()
call KB(u)
if GetUnitTypeId(u)=='h03C'then
call SetUnitState(u,UNIT_STATE_MANA,30)
endif
call TriggerSleepAction(.7)
if GetUnitTypeId(u)=='h03A'then
call IssueImmediateOrderById(u,852055)
call TriggerSleepAction(.1)
endif
call pA(u)
endfunction
function df takes nothing returns boolean
return(GetUnitTypeId(GetSummonedUnit())=='n00W')
endfunction
function Df takes nothing returns nothing
call pA(GetSummonedUnit())
call KB(GetSummonedUnit())
endfunction
function ff takes nothing returns boolean
return(GetUnitTypeId(GetSummonedUnit())=='u004')
endfunction
function Ff takes nothing returns nothing
call ReplaceUnitBJ(GetSummonedUnit(),udg_sr[GetRandomInt(0,2)],2)
call pA(bj_lastReplacedUnit)
call KB(bj_lastReplacedUnit)
set udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastReplacedUnit)))+1])]=udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastReplacedUnit)))+1])]+1
endfunction
function gf takes nothing returns boolean
return(GetUnitTypeId(GetSummonedUnit())=='u008')
endfunction
function Gf takes nothing returns nothing
call ReplaceUnitBJ(GetSummonedUnit(),udg_sr[GetRandomInt(0,6)],2)
call pA(bj_lastReplacedUnit)
call KB(bj_lastReplacedUnit)
set udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastReplacedUnit)))+1])]=udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastReplacedUnit)))+1])]+1
endfunction
function hf takes nothing returns boolean
return(GetUnitTypeId(GetSummonedUnit())=='u00E')
endfunction
function Hf takes nothing returns nothing
local integer i=GetRandomInt(0,7)
if i==0 then
set i=7
else
set i=GetRandomInt(3,6)
endif
call ReplaceUnitBJ(GetSummonedUnit(),udg_sr[i],2)
call pA(bj_lastReplacedUnit)
call KB(bj_lastReplacedUnit)
call UnitAddAbility(bj_lastReplacedUnit,'A088')
call UnitAddAbility(bj_lastReplacedUnit,'A089')
set udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastReplacedUnit)))+1])]=udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastReplacedUnit)))+1])]+1
endfunction
function jf takes nothing returns boolean
return(GetSpellAbilityId()=='A01Q')
endfunction
function Jf takes nothing returns nothing
local location l
local effect e
local unit u=SA()
if(u==null)then
return
endif
set l=GetUnitLoc(u)
if(GetRandomInt(0,99)<10)then
call CreateUnitAtLocSaveLast(GetOwningPlayer(GetSpellAbilityUnit()),udg_sr[3],l,bj_UNIT_FACING)
else
call CreateUnitAtLocSaveLast(GetOwningPlayer(GetSpellAbilityUnit()),udg_sr[GetRandomInt(0,2)],l,bj_UNIT_FACING)
endif
call pA(bj_lastCreatedUnit)
call KB(bj_lastCreatedUnit)
call RemoveLocation(l)
set l=GetUnitLoc(bj_lastCreatedUnit)
set e=AddSpecialEffectLoc("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl",l)
set udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastCreatedUnit)))+1])]=udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastCreatedUnit)))+1])]+1
call RemoveUnit(u)
call RemoveLocation(l)
call DestroyEffect(e)
set e=null
set l=null
endfunction
function kf takes nothing returns boolean
return(GetSpellAbilityId()=='A05U')
endfunction
function Kf takes nothing returns nothing
local location l
local effect e
local unit u=SA()
if(u==null)then
return
endif
set l=GetUnitLoc(u)
if(GetRandomInt(0,99)<10)then
call CreateUnitAtLocSaveLast(GetOwningPlayer(GetSpellAbilityUnit()),udg_sr[7],l,bj_UNIT_FACING)
else
call CreateUnitAtLocSaveLast(GetOwningPlayer(GetSpellAbilityUnit()),udg_sr[GetRandomInt(1,6)],l,bj_UNIT_FACING)
endif
call pA(bj_lastCreatedUnit)
call KB(bj_lastCreatedUnit)
call RemoveLocation(l)
set l=GetUnitLoc(bj_lastCreatedUnit)
set e=AddSpecialEffectLoc("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl",l)
set udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastCreatedUnit)))+1])]=udg_Br[(udg_Fi[GetPlayerId(GetOwningPlayer((bj_lastCreatedUnit)))+1])]+1
call RemoveUnit(u)
call RemoveLocation(l)
call DestroyEffect(e)
set e=null
set l=null
endfunction
function lf takes nothing returns boolean
return(GetUnitTypeId(GetEnteringUnit())=='n01P')or(GetUnitTypeId(GetEnteringUnit())=='n01Q')
endfunction
function Lf takes nothing returns boolean
return(lf())
endfunction
function mf takes nothing returns boolean
return(GetUnitTypeId(GetEnteringUnit())=='n01R')or(GetUnitTypeId(GetEnteringUnit())=='n01Q')
endfunction
function Mf takes nothing returns boolean
return(mf())
endfunction
function pf takes nothing returns nothing
if(Lf())then
call SetUnitAbilityLevelSwapped('A00C',GetEnteringUnit(),2)
endif
if(Mf())then
call KB(GetEnteringUnit())
call pA(GetEnteringUnit())
endif
endfunction
function Pf takes nothing returns boolean
return GetUnitTypeId(GetAttacker())=='h05L'
endfunction
function qf takes nothing returns nothing
if GetRandomInt(0,99)<20 then
call aN(udg_ov,GetAttacker(),GetTriggerUnit())
endif
endfunction
function SPELL_BlueShieldGenerator takes nothing returns nothing
local unit u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return
endif
if GetUnitAbilityLevel(u,'A09L')>0 then
set u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return
endif
endif
if GetUnitAbilityLevel(u,'A09L')==0 then
call UnitAddAbility(u,'A09L')
endif
set u=GetSpellAbilityUnit()
call SetUnitAnimation(u,"death")
call TriggerSleepAction(.3)
call SetUnitAnimation(u,"stand")
endfunction
function SPELL_RedShieldGenerator takes nothing returns nothing
local unit u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return
endif
if GetUnitAbilityLevel(u,'A09L')>0 then
set u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return
endif
endif
if GetUnitAbilityLevel(u,'A09L')<=1 then
call UnitAddAbility(u,'A09L')
call SetUnitAbilityLevel(u,'A09L',2)
endif
set u=GetSpellAbilityUnit()
call SetUnitAnimation(u,"death")
call TriggerSleepAction(.3)
call SetUnitAnimation(u,"stand")
endfunction
function SPELL_CheckRange takes nothing returns nothing
local real Qf=udg_ei[GetUnitPointValue(GetSpellAbilityUnit())]
local integer i=0
local integer OI=20+R2I((Qf-500)/50)
local real x
local real y
local real sf
local effect array e
loop
exitwhen i>=OI
set sf=2*bj_PI*i/OI
set y=Sin(sf)*Qf+GetUnitY(GetTriggerUnit())
set x=Cos(sf)*Qf+GetUnitX(GetTriggerUnit())
if(udg_Fi[GetPlayerId(GetOwningPlayer((GetTriggerUnit())))+1])==udg_Fi[(1+GetPlayerId(GetLocalPlayer()))]then
set e[i]=AddSpecialEffect("Abilities\\Spells\\NightElf\\Barkskin\\BarkSkinTarget.mdl",x,y)
else
set e[i]=AddSpecialEffect(".mdl",x,y)
endif
set i=i+1
endloop
call TriggerSleepAction(6)
set i=0
loop
exitwhen i>=OI
call DestroyEffect(e[i])
set e[i]=null
set i=i+1
endloop
endfunction
function SPELL_ObeliskOfTheClaw takes nothing returns nothing
local unit rN=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetTriggerUnit()))))+1]))]))
call XB("Abilities\\Spells\\Human\\Polymorph\\PolyMorphTarget.mdl",GetTriggerUnit())
if(rN==null)then
return
endif
if GetUnitAbilityLevel(rN,'A08C')==1 then
set rN=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetTriggerUnit()))))+1]))]))
if(rN==null)then
return
endif
endif
call IB("Abilities\\Spells\\Human\\ControlMagic\\ControlMagicTarget.mdl",rN,"overhead")
call UnitAddAbility(rN,'A08C')
call UnitAddAbility(rN,'A08D')
call UnitAddAbility(rN,'A08F')
endfunction
function SPELL_SilverGlade takes nothing returns nothing
local integer yI=(udg_Fi[GetPlayerId(GetOwningPlayer((GetTriggerUnit())))+1])
call XB("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl",GetTriggerUnit())
call EnableTrigger(udg_OV)
set udg_cr[yI]=udg_cr[yI]+1
endfunction
function Sf takes nothing returns boolean
return(not(IsUnitType(GetTriggerUnit(),UNIT_TYPE_STRUCTURE)))and(not(IsUnitType(GetTriggerUnit(),UNIT_TYPE_SAPPER)==false))and(not(GetUnitAbilityLevel(GetTriggerUnit(),'A08H')==1))
endfunction
function tf takes nothing returns nothing
local integer yI=(udg_Fi[GetPlayerId(GetOwningPlayer((GetTriggerUnit())))+1])
if(udg_cr[yI]>0)then
call xN(udg_Kv,GetTriggerUnit())
set udg_cr[yI]=udg_cr[yI]-1
call XB("Abilities\\Spells\\Items\\AIda\\AIdaCaster.mdl",bj_lastCreatedUnit)
if(udg_cr[0]<=0 and udg_cr[1]<=0)then
call DisableTrigger(GetTriggeringTrigger())
endif
endif
endfunction
function SPELL_StarfallObelisk takes nothing returns nothing
local unit rN=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
local effect e
local fogmodifier f
local boolean b=udg_gE
if rN==null then
return
endif
set e=AddSpecialEffect("Abilities\\Spells\\NightElf\\Starfall\\StarfallCaster.mdl",GetUnitX(GetSpellAbilityUnit()),GetUnitY(GetSpellAbilityUnit()))
if b then
set f=CreateFogModifierRadius(GetOwningPlayer(GetSpellAbilityUnit()),FOG_OF_WAR_VISIBLE,GetUnitX(rN),GetUnitY(rN),1100.,true,false)
call FogModifierStart(f)
endif
if udg_Kr then
call oN(udg_mv,GetSpellAbilityUnit(),rN)
else
call oN(udg_Lv,GetSpellAbilityUnit(),rN)
endif
call TriggerSleepAction(8)
if b then
call DestroyFogModifier(f)
set f=null
endif
call DestroyEffect(e)
set e=null
endfunction
function Tf takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer s=GetHandleId(t)
local unit u=LoadUnitHandle(udg_JE,s,1)
local integer i=LoadInteger(udg_JE,s,0)
local real nR=GetUnitFacing(u)
local location l=GetUnitLoc(u)
if not udg_hx then
call FlushChildHashtable(udg_JE,s)
call DestroyTimer(t)
call RemoveUnit(u)
elseif i<1 then
call FlushChildHashtable(udg_JE,s)
call DestroyTimer(t)
set udg_yo=u
call TriggerExecute(udg_RV)
else
set i=i-1
call SetUnitFlyHeight(u,I2R(i)*6.,.0)
call MoveLocation(l,GetLocationX(l)+10*Cos(nR*bj_DEGTORAD),GetLocationY(l)+10*Sin(nR*bj_DEGTORAD))
call SetUnitPositionLoc(u,l)
call SaveInteger(udg_JE,s,0,i)
endif
call RemoveLocation(l)
set l=null
set t=null
endfunction
function SPELL_Nuke takes nothing returns nothing
local location uf=GetUnitLoc(GetTriggerUnit())
local location rN=GetRandomLocInRect(udg_Mx[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]])
local real nR=AngleBetweenPoints(uf,rN)
local location l=rR(rN,-2500,nR)
local unit Uf
local timer t=CreateTimer()
local integer s=GetHandleId(t)
local effect e
local unit u
call PlaySoundBJ(udg_in)
call PlaySoundBJ(udg_nn)
set u=CreateUnitAtLoc(GetTriggerPlayer(),'h06X',uf,270)
call SetUnitTimeScalePercent(u,20)
set e=AddSpecialEffectLoc("Abilities\\Spells\\Other\\Levelup\\LevelupCaster.mdl",uf)
call DestroyEffect(e)
set e=null
call TriggerSleepAction(5)
set Uf=CreateUnitAtLoc(GetTriggerPlayer(),'h06V',l,nR)
call SaveInteger(udg_JE,s,0,250)
call SaveUnitHandle(udg_JE,s,1,Uf)
call SetUnitFlyHeight(Uf,1500.,.0)
call TimerStart(t,.04,true,function Tf)
call RemoveLocation(l)
set l=null
call RemoveLocation(uf)
set uf=null
set t=null
call RemoveLocation(rN)
set rN=null
call RemoveUnit(u)
endfunction
function wf takes nothing returns nothing
local unit Uf=udg_yo
local location l=GetUnitLoc(Uf)
local player p=GetOwningPlayer(Uf)
local unit u
local unit u2
local real xd=GetTimeOfDay()
call RemoveUnit(Uf)
set u=CreateUnitAtLoc(p,'h06W',l,270)
call SetUnitAnimation(u,"Death")
call SetUnitTimeScalePercent(u,12)
set u2=CreateUnitAtLoc(p,'h06W',l,270)
call SetUnitAnimation(u2,"Death")
call SetUnitTimeScalePercent(u2,12)
call AbortCinematicFadeBJ()
call CinematicFadeCommonBJ('d','d','d',.25,"ReplaceableTextures\\CameraMasks\\White_mask.blp",'d',0)
call ContinueCinematicFadeAfterBJ(.75,'d','d','d',0,"ReplaceableTextures\\CameraMasks\\White_mask.blp")
call FinishCinematicFadeAfterBJ(1.5)
call SetTimeOfDay(12.)
call UnitDamagePointLoc(u,.0,400,l,600,ATTACK_TYPE_HERO,DAMAGE_TYPE_FIRE)
call UnitDamagePointLoc(u,.0,800,l,600,ATTACK_TYPE_HERO,DAMAGE_TYPE_FIRE)
call UnitDamagePointLoc(u,.0,1200,l,600,ATTACK_TYPE_HERO,DAMAGE_TYPE_FIRE)
call PlaySoundAtPointBJ(udg_an,'d',l,0)
call TriggerSleepAction(1)
call TriggerSleepAction(1)
call SetTimeOfDay(xd)
call TriggerSleepAction(11)
call RemoveUnit(u)
call RemoveUnit(u2)
call RemoveLocation(l)
set l=null
set p=null
endfunction
function Wf takes nothing returns boolean
return(GetUnitTypeId(GetTriggerUnit())=='h04M')or(GetUnitTypeId(GetEnteringUnit())=='n01B')
endfunction
function yf takes nothing returns boolean
return(Wf())
endfunction
function Yf takes nothing returns nothing
call SetUnitVertexColorBJ(GetTriggerUnit(),32.,.0,53.,40.)
endfunction
function SPELL_ForgottenOne takes nothing returns nothing
local unit u=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
local integer i=0
if u==null then
return
endif
loop
exitwhen i>5
set udg_do=GetUnitX(u)+64.*Cos(60.*I2R(i)*bj_DEGTORAD)
set udg_Co=GetUnitY(u)+64.*Sin(60.*I2R(i)*bj_DEGTORAD)
if udg_Kr then
set bj_lastCreatedUnit=CreateUnit(GetOwningPlayer(GetSpellAbilityUnit()),'n021',udg_do,udg_Co,AngleBetweenPoints(udg_sx,udg_Px))
else
set bj_lastCreatedUnit=CreateUnit(GetOwningPlayer(GetSpellAbilityUnit()),'n01C',udg_do,udg_Co,AngleBetweenPoints(udg_sx,udg_Px))
endif
call UnitApplyTimedLife(bj_lastCreatedUnit,'BTLF',9.)
set i=i+1
endloop
endfunction
function SPELL_WellOfPain takes nothing returns nothing
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if(u==null)then
return
endif
call IB("Abilities\\Spells\\Undead\\DeathPact\\DeathPactTarget.mdl",u,"origin")
if HB(u,GetSpellAbilityUnit())then
call UnitDamageTargetBJ(GetSpellAbilityUnit(),u,200.,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_SONIC)
endif
endfunction
function SPELL_EyeOfCorruption takes nothing returns nothing
call RN(udg_iv,GetSpellAbilityUnit())
endfunction
function SPELL_DeathPit takes nothing returns nothing
local unit u
local effect e=null
local location l=null
set u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if u==null then
return
endif
if HB(u,GetSpellAbilityUnit())then
call UnitDamageTargetBJ(GetSpellAbilityUnit(),u,50000.,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_DEATH)
endif
call XB("Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilSpecialArt.mdl",u)
set u=GetSpellAbilityUnit()
call SetUnitAnimation(u,"work")
call TriggerSleepAction(1.)
call ResetUnitAnimation(u)
endfunction
function SPELL_MagicTowerRuin takes nothing returns nothing
local integer i=GetRandomInt(0,8)
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
call XB("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl",GetSpellAbilityUnit())
if u==null then
return
endif
call IB("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl",u,"origin")
if not HB(u,GetSpellAbilityUnit())then
return
endif
if i==0 then
call XB("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl",u)
call ExplodeUnitBJ(u)
set i=(1+GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())))
set udg_Cr[i]=udg_Cr[i]+1
set udg_Ra[udg_Fi[i]]=udg_Ra[udg_Fi[i]]+1
elseif i==1 then
call UnitDamageTargetBJ(GetSpellAbilityUnit(),u,50000.,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_DEATH)
elseif i==2 then
call UnitDamageTargetBJ(GetSpellAbilityUnit(),u,500.,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_DEATH)
elseif i==3 then
call IB("Abilities\\Spells\\Human\\Avatar\\AvatarCaster.mdl",u,"origin")
call UnitAddAbility(u,'A06T')
call UnitAddAbility(u,'A06U')
call SetUnitLifePercentBJ(u,'d')
elseif i==4 then
call aN(udg_Dv,GetSpellAbilityUnit(),u)
call TriggerSleepAction(1.)
call pA(u)
if GetUnitTypeId(u)=='h03A'then
call TriggerSleepAction(44.5)
call IssueImmediateOrderById(u,852055)
call TriggerSleepAction(.5)
call pA(u)
return
endif
elseif i==5 then
call nN(udg_fv,GetSpellAbilityUnit(),u)
elseif i==6 then
call XB("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl",u)
call LB(u)
call ShowUnit(u,false)
call Ac('n01S',u,GetSpellAbilityUnit(),GetTriggerPlayer())
call RemoveUnit(u)
return
endif
endfunction
function zf takes nothing returns nothing
if((udg_Fi[GetPlayerId(GetOwningPlayer((GetEnumUnit())))+1])==(udg_Fi[GetPlayerId(GetOwningPlayer((udg_av)))+1]))and IsUnitType(GetEnumUnit(),UNIT_TYPE_SAPPER)then
call aN(udg_Bv,udg_av,GetEnumUnit())
endif
endfunction
function SPELL_Gjallarhorn takes nothing returns nothing
local location l=GetUnitLoc(GetSpellAbilityUnit())
local group g=AR(500.,l)
call XB("Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdl",GetSpellAbilityUnit())
set udg_av=GetSpellAbilityUnit()
call ForGroupBJ(g,function zf)
call DestroyGroup(g)
call RemoveLocation(l)
set g=null
set l=null
endfunction
function SPELL_OracleOfSirens takes nothing returns nothing
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if u==null or not HB(u,GetSpellAbilityUnit())then
return
endif
call nN(udg_W,GetSpellAbilityUnit(),u)
endfunction
function SPELL_FrozenMushroom takes nothing returns nothing
local unit u=(nA(udg_rO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if(u==null)or not HB(u,GetSpellAbilityUnit())then
return
endif
call aN(udg_kv,GetSpellAbilityUnit(),u)
endfunction
function SPELL_CeremonialTotem takes nothing returns nothing
local unit u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return
endif
call UnitAddAbility(u,'A03B')
call UnitAddAbility(u,'A03A')
call UnitAddAbility(u,'A03D')
call UnitAddAbility(u,'A08L')
set udg_Mi=GetRandomInt(1,3)
if(udg_Mi==1)then
call UnitAddAbility(u,'A05I')
call UnitAddAbility(u,'A06W')
else
if(udg_Mi==2)then
call UnitAddAbility(u,'A08M')
call UnitAddAbility(u,'A06Y')
else
call UnitAddAbility(u,'A08R')
call UnitAddAbility(u,'A06X')
endif
endif
call IB("Abilities\\Spells\\Undead\\ReplenishHealth\\ReplenishHealthCasterOverhead.mdl",u,"overhead")
call XB("Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl",GetSpellAbilityUnit())
endfunction
function SPELL_SerpentRock takes nothing returns nothing
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
call aN(udg_Jv,GetSpellAbilityUnit(),u)
set u=GetSpellAbilityUnit()
call TriggerSleepAction(.5)
call SetUnitAnimation(u,"attack")
call TriggerSleepAction(1.)
call ResetUnitAnimation(u)
endfunction
function SPELL_WorldFreezer takes nothing returns nothing
local unit u
local unit u2
local real Zf
local integer i=0
local player p=GetOwningPlayer(GetSpellAbilityUnit())
local real x=GetUnitX(GetSpellAbilityUnit())
local real y=GetUnitY(GetSpellAbilityUnit())
set u=GetSpellAbilityUnit()
call SetUnitAnimation(u,"death")
call TriggerSleepAction(1.5)
call TimerStart(udg_Bo,.04,true,null)
set Zf=I2R(udg_Fi[(1+GetPlayerId(p))])*180
loop
exitwhen i>2
set u2=CreateUnit(p,'h08U',x,y,ModuloReal(Zf+GetRandomReal(-55,55)+360,360))
if(udg_Kr)then
call UnitRemoveAbility(u2,'A080')
call UnitAddAbility(u2,'A084')
endif
call GroupAddUnit(udg_tx,u2)
set i=i+1
endloop
call EnableWeatherEffect(udg_kx,true)
call TriggerSleepAction(3.7)
call ResetUnitAnimation(u)
call TriggerSleepAction(2.6)
call EnableWeatherEffect(udg_kx,false)
endfunction
function vF takes nothing returns nothing
local group g=CreateGroup()
local group eF
local unit u
local unit u2
local real x
local real y
local integer i
call GroupAddGroup(udg_tx,g)
loop
set u=FirstOfGroup(g)
exitwhen u==null
call GroupRemoveUnit(g,u)
set x=GetUnitX(u)+Cos(GetUnitFacing(u)*bj_DEGTORAD)*10
if(x>=udg_fr)or(x<=udg_Oo)then
call GroupRemoveUnit(udg_tx,u)
call RemoveUnit(u)
else
set y=GetUnitY(u)+Sin(GetUnitFacing(u)*bj_DEGTORAD)*10
if(y>=udg_Fr)or(y<=udg_Xo)then
set y=GetUnitY(u)+Sin((360-GetUnitFacing(u))*bj_DEGTORAD)*30
call SetUnitFacing(u,360-GetUnitFacing(u))
endif
call SetUnitX(u,x)
call SetUnitY(u,y)
set i=GetUnitUserData(u)+1
if(i>50)then
call SetUnitUserData(u,0)
set udg_av=u
set eF=CreateGroup()
call GroupEnumUnitsInRange(eF,x,y,700,udg_Rv)
set u2=GroupPickRandomUnit(eF)
if(u2!=null)then
if IsUnitType(u2,UNIT_TYPE_FLYING)then
call aN(udg_Sv,u,u2)
else
call aN(udg_tv,u,u2)
call aN(udg_Tv,u,u2)
endif
endif
call DestroyGroup(eF)
set eF=null
else
call SetUnitUserData(u,i)
endif
endif
endloop
call DestroyGroup(g)
set g=null
if IsUnitGroupEmptyBJ(udg_tx)then
call PauseTimer(udg_Bo)
endif
endfunction
function Trig_Ausrotten_Conditions takes nothing returns boolean
return GetSpellAbilityId()=='A01W'
endfunction
function SPELL_Erasor takes nothing returns nothing
local integer i
local unit u
local integer rl
call IB("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl",GetSpellAbilityUnit(),"origin")
set udg_fa=GetUnitTypeId((nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])])))
set i=GetUnitPointValueByType(udg_fa)
set rl=udg_xO[(udg_Fi[GetPlayerId(GetOwningPlayer((GetSpellAbilityUnit())))+1])]
call OA(rl)
if i>'d'then
loop
set u=RA(rl)
exitwhen u==null
if GetUnitPointValue(u)==i then
call IB("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl",u,"origin")
call nN(udg_rv,GetSpellAbilityUnit(),u)
endif
endloop
else
loop
set u=RA(rl)
exitwhen u==null
if GetUnitTypeId(u)==udg_fa then
call IB("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl",u,"origin")
call nN(udg_rv,GetSpellAbilityUnit(),u)
endif
endloop
endif
endfunction
function SPELL_StasisTotem takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
call xN(udg_Mv,u)
call TriggerSleepAction(1.)
call ResetUnitAnimation(u)
endfunction
function SPELL_CityOfMagic takes nothing returns nothing
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if(u==null)or not HB(u,GetSpellAbilityUnit())then
return
endif
call nN(udg_Cv,GetSpellAbilityUnit(),u)
call TriggerSleepAction(1.)
call pA(u)
if GetUnitTypeId(u)=='h03A'then
call TriggerSleepAction(44.5)
call IssueImmediateOrderById(u,852055)
call TriggerSleepAction(.5)
call pA(u)
endif
endfunction
function SPELL_Volcano takes nothing returns nothing
local unit u=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
local integer i
if udg_Kr then
call VN(udg_qv,GetSpellAbilityUnit(),u)
else
call VN(udg_Pv,GetSpellAbilityUnit(),u)
endif
endfunction
function SPELL_AncientPyramide takes nothing returns nothing
local unit u=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
call oN(udg_Gv,GetSpellAbilityUnit(),u)
endfunction
function SPELL_ShrineOfDestruction takes nothing returns nothing
local unit u=(nA(udg_oO[udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]]))
local integer i=0
loop
exitwhen((GetUnitAbilityLevel((u),'A06V')>0)==false)
set u=(nA(udg_oO[udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]]))
set i=i+1
if(i>=10)then
return
exitwhen true
endif
endloop
if(u==null)then
return
endif
call XB("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl",u)
set i=udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())))]
set udg_Gi[i]=(udg_Gi[i]+1)
call MultiboardSetItemValueBJ(udg_ar,4,udg_Xa[i],I2S(udg_Gi[i]))
call KillUnit(u)
endfunction
function SPELL_FrostLauncher takes nothing returns nothing
local unit u=(nA(udg_oO[udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]]))
local fogmodifier f
call XB("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl",GetSpellAbilityUnit())
if u==null then
return
endif
call cN('h04G',GetSpellAbilityUnit(),GetSpellAbilityUnit(),20.)
if udg_gE then
set f=CreateFogModifierRadius(GetOwningPlayer(GetSpellAbilityUnit()),FOG_OF_WAR_VISIBLE,GetUnitX(u),GetUnitY(u),128.,true,false)
call FogModifierStart(f)
call IssueTargetOrderById(bj_lastCreatedUnit,851985,u)
call TriggerSleepAction(.1)
call DestroyFogModifier(f)
set f=null
else
call IssueTargetOrderById(bj_lastCreatedUnit,851985,u)
endif
endfunction
function SPELL_GreaterFrostLauncher takes nothing returns nothing
local unit u=(nA(udg_oO[udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]]))
local fogmodifier f
call XB("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl",GetSpellAbilityUnit())
if u==null then
return
endif
call cN('h04H',GetSpellAbilityUnit(),GetSpellAbilityUnit(),20.)
if udg_gE then
set f=CreateFogModifierRadius(GetOwningPlayer(GetSpellAbilityUnit()),FOG_OF_WAR_VISIBLE,GetUnitX(u),GetUnitY(u),128.,true,false)
call FogModifierStart(f)
call IssueTargetOrderById(bj_lastCreatedUnit,851985,u)
call TriggerSleepAction(.1)
call DestroyFogModifier(f)
set f=null
else
call IssueTargetOrderById(bj_lastCreatedUnit,851985,u)
endif
endfunction
function SPELL_Annihilator takes nothing returns nothing
local location l1=GetUnitLoc(GetTriggerUnit())
local location l2
local integer i=0
local real nR=bj_RADTODEG*Atan2(GetUnitY(GetSpellTargetUnit())-GetUnitY(GetTriggerUnit()),GetUnitX(GetSpellTargetUnit())-GetUnitX(GetTriggerUnit()))
set nR=ModuloReal(nR+20,360)
loop
exitwhen i>3
set nR=ModuloReal(nR+350,360)
set l2=rR(l1,'d',nR)
call EN(udg_Q,GetTriggerUnit(),GetLocationX(l2),GetLocationY(l2))
call RemoveLocation(l2)
set i=i+1
endloop
call RemoveLocation(l1)
set l1=null
set l2=null
endfunction
function SPELL_GruntSergeant takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
local unit u2
local group g=CreateGroup()
local real xF
local real x=GetUnitX(GetSpellTargetUnit())
local real y=GetUnitY(GetSpellTargetUnit())
local real aR=SquareRoot((GetUnitX(u)-x)*(GetUnitX(u)-x)+(GetUnitY(u)-y)*(GetUnitY(u)-y))
call cN('h09Q',u,u,3)
call IssuePointOrderById(bj_lastCreatedUnit,851984,x,y)
call TriggerSleepAction(aR/700)
call iN(udg_cv,u,x,y)
set udg_av=u
call GroupEnumUnitsInRange(g,x,y,300,udg_Rv)
loop
set u2=FirstOfGroup(g)
exitwhen u2==null
call GroupRemoveUnit(g,u2)
set xF=RMinBJ(GetUnitState(u2,UNIT_STATE_MANA),'d')
call SetUnitState(u2,UNIT_STATE_MANA,GetUnitState(u2,UNIT_STATE_MANA)-xF)
if(xF>0)then
call IB("Abilities\\Spells\\Human\\Feedback\\SpellBreakerAttack.mdl",u2,"origin")
call UnitDamageTarget(bj_lastCreatedUnit,u2,xF,true,false,ATTACK_TYPE_CHAOS,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
endif
endloop
call DestroyGroup(g)
set g=null
endfunction
function SPELL_MineLayer takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
local player p=GetOwningPlayer(u)
local real aR=GetRandomReal(70,350)
local real nR=GetRandomReal(0,360)
local real x=GetUnitX(u)+aR*Cos(nR*bj_DEGTORAD)
local real y=GetUnitY(u)+aR*Sin(nR*bj_DEGTORAD)
call cN('h09M',u,u,3)
call IssuePointOrderById(bj_lastCreatedUnit,851984,x,y)
call TriggerSleepAction(aR/700)
set u=CreateUnit(p,'n025',x,y,nR)
call GroupAddUnit(udg_Ki,u)
endfunction
function SPELL_Dragonhawk takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
local group g=CreateGroup()
local integer i=0
local unit u2
set udg_av=u
call GroupEnumUnitsInRange(g,GetUnitX(GetSpellTargetUnit()),GetUnitY(GetSpellTargetUnit()),400,udg_Ov)
loop
set u2=FirstOfGroup(g)
set i=i+1
exitwhen u2==null
exitwhen i>4
call GroupRemoveUnit(g,u2)
call aN(udg_ev,u,u2)
endloop
call DestroyGroup(g)
set g=null
endfunction
function SPELL_Druid takes nothing returns nothing
call aN(udg_xv,GetSpellAbilityUnit(),GetSpellTargetUnit())
endfunction
function SPELL_SageDruid takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
local group g=CreateGroup()
local integer i=0
local unit u2
call GroupEnumUnitsInRange(g,GetUnitX(GetSpellTargetUnit()),GetUnitY(GetSpellTargetUnit()),350,null)
loop
exitwhen i>2
set u2=FirstOfGroup(g)
exitwhen u2==null
call GroupRemoveUnit(g,u2)
if(not IsUnitType(u2,UNIT_TYPE_DEAD))and((udg_Fi[GetPlayerId(GetOwningPlayer((u2)))+1])!=(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1]))and IsUnitType(u2,UNIT_TYPE_GROUND)then
set i=i+1
call aN(udg_Hv,u,u2)
endif
endloop
call DestroyGroup(g)
set g=null
endfunction
function SPELL_IceQueen takes nothing returns nothing
call nN(udg_dv,GetSpellAbilityUnit(),GetSpellTargetUnit())
endfunction
function SPELL_AncientWandigoo takes nothing returns nothing
call xN(udg_q,GetSpellAbilityUnit())
call IB("Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdl",GetSpellAbilityUnit(),"origin")
endfunction
function SPELL_Magnataur takes nothing returns nothing
call xN(udg_Fv,GetSpellAbilityUnit())
call IB("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl",GetSpellAbilityUnit(),"origin")
endfunction
function SPELL_ChaosChamp takes nothing returns nothing
call IB("Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdl",GetSpellAbilityUnit(),"origin")
call xN(udg_T,GetSpellAbilityUnit())
endfunction
function SPELL_Warlock takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
call UnitRemoveAbility(GetSpellAbilityUnit(),'A00F')
call xN(udg_Qv,u)
call IB("Units\\NightElf\\Wisp\\WispExplode.mdl",u,"origin")
call TriggerSleepAction(.3)
call IssuePointOrderByIdLoc(u,851986,udg_Yx[ModuloInteger(udg_Fi[(1+GetPlayerId(GetOwningPlayer(u)))]+1,2)])
call TriggerSleepAction(5)
call IssueImmediateOrderById(u,851993)
call TriggerSleepAction(6.6)
call UnitAddAbility(u,'A00F')
call pA(u)
endfunction
function SPELL_Wizard takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
call aN(udg_sv,u,GetSpellTargetUnit())
call TriggerSleepAction(.8)
call pA(u)
endfunction
function SPELL_Sorceress takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
call aN(udg_lv,u,GetSpellTargetUnit())
call TriggerSleepAction(.8)
call pA(u)
endfunction
function SPELL_NagaSiren takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
call aN(udg_gv,u,GetSpellTargetUnit())
call IssueImmediateOrderById(u,852126)
call TriggerSleepAction(1.)
call MA(u)
endfunction
function SPELL_Troll takes nothing returns nothing
call aN(udg_pv,GetSpellAbilityUnit(),GetSpellTargetUnit())
endfunction
function SPELL_Paladin takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
call IssueTargetOrderById(u,852066,GetSpellTargetUnit())
call TriggerSleepAction(1.)
call MA(u)
endfunction
function SPELL_PaladinRezz takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
local location l=GetUnitLoc(u)
local group g
set udg_av=u
set g=XR(900.,l,udg_Vv)
call UnitAddAbility(GetSpellTargetUnit(),'A03L')
if(CountUnitsInGroup(g)>0)then
call IssueImmediateOrderById(u,852094)
call TriggerSleepAction(1.)
call pA(u)
endif
call DestroyGroup(g)
call RemoveLocation(l)
set l=null
set g=null
endfunction
function SPELL_FaerieDragon takes nothing returns nothing
local unit u=GetSpellAbilityUnit()
call TriggerSleepAction(1.2)
call IssuePointOrderByIdLoc(u,851983,udg_Yx[(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1])])
endfunction
function oF takes unit u returns boolean
if GetUnitAbilityLevel(u,'A03U')==1 then
return true
endif
set udg_I=(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1])
if udg_Yo[udg_I*4096+GetUnitUserData(u)]>7 then
if kA(u,udg_qx[udg_I])then
return true
else
set udg_Yo[udg_I*4096+GetUnitUserData(u)]=0
if false then
return false
endif
endif
endif
if(not(GetUnitCurrentOrder(u)==0))then
return false
endif
if(not(GetUnitAbilityLevel(u,'A07I')==0))then
return false
endif
return true
endfunction
function rF takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer iF=GetHandleId(t)
local unit u=LoadUnitHandle(udg_kE,0,iF)
call SetUnitPathing(u,true)
call RemoveSavedHandle(udg_kE,0,iF)
call DestroyTimer(t)
set t=null
endfunction
function aF takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer iF=GetHandleId(t)
local unit u=LoadUnitHandle(udg_kE,0,iF)
call pA(u)
call TimerStart(t,2,false,function rF)
endfunction
function nF takes unit u returns nothing
local integer i=GetUnitUserData(u)
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local timer t
if(RAbsBJ(x-udg_Qi[i])+RAbsBJ(y-udg_Ti[i]))>'d'then
set udg_Vr[i]=0
set udg_Qi[i]=GetUnitX(u)
set udg_Ti[i]=GetUnitY(u)
return
endif
set udg_Vr[i]=udg_Vr[i]+1
set udg_Qi[i]=GetUnitX(u)
set udg_Ti[i]=GetUnitY(u)
if(udg_Vr[i]>1)then
set udg_Vr[i]=0
call SetUnitPathing(u,false)
set t=CreateTimer()
call TimerStart(t,.1,false,function aF)
call SaveUnitHandle(udg_kE,0,GetHandleId(t),u)
endif
endfunction
function VF takes nothing returns nothing
local unit u
local integer rl
local integer t=0
loop
exitwhen(t)>1
set rl=udg_xO[t]
call OA(rl)
loop
set u=RA(rl)
exitwhen u==null
if(oF(u))then
call pA(u)
if not udg_Sx then
call nF(u)
endif
endif
endloop
set t=t+1
endloop
endfunction
function EF takes nothing returns boolean
return(udg_Eo==0)
endfunction
function XF takes nothing returns boolean
return(udg_Mi>1)
endfunction
function OF takes nothing returns boolean
return(udg_Mi==1)
endfunction
function RF takes nothing returns boolean
return(udg_Mi<=0)
endfunction
function IF takes nothing returns boolean
return(udg_Eo==1)
endfunction
function AF takes nothing returns boolean
return(udg_Eo==2)
endfunction
function NF takes nothing returns boolean
return(udg_Eo==3)
endfunction
function bF takes nothing returns boolean
return(udg_Eo==4)
endfunction
function BF takes nothing returns boolean
return(udg_Eo==5)
endfunction
function cF takes nothing returns boolean
return(udg_Eo==6)
endfunction
function CF takes nothing returns boolean
return(udg_Eo==7)
endfunction
function dF takes nothing returns boolean
return(udg_Eo==8)
endfunction
function DF takes nothing returns boolean
return(udg_Eo==9)
endfunction
function fF takes nothing returns boolean
return(udg_Fa)
endfunction
function FF takes nothing returns boolean
return(udg_Eo==10)
endfunction
function gF takes nothing returns boolean
return(udg_Eo==11)
endfunction
function GF takes nothing returns boolean
return(udg_Eo==12)
endfunction
function Trig_boonreminder_Func018001 takes nothing returns boolean
return(udg_Eo==12)
endfunction
function hF takes nothing returns nothing
set udg_Mi=((udg_Wx-1)-IMaxBJ(udg_ia[0],udg_ia[1]))
if(EF())then
set udg_fx="|cffFFFF80If you are new to this map, check the |cff80FF00Manual|cffFFFF80 (|cffFFBA17F9|cffFFFF80). You can find some useful basic hints there!|r"
endif
if(IF())then
if(RF())then
set udg_Eo=(udg_Eo+1)
else
if(OF())then
set udg_fx=(("|cffFFFF80There is at least |cffFFDF00"+I2S(udg_Mi))+"|cffFFFF80 additional round after this one. Please don't leave after this round!|r")
else
if(XF())then
set udg_fx=(("|cffFFFF80There are at least |cffFFDF00"+I2S(udg_Mi))+"|cffFFFF80 additional rounds after this one. Please don't leave after this round!|r")
endif
endif
endif
endif
if(AF())then
set udg_fx="|cffFFFF80Your worker has |c00ff0000one|cffFFFF80 rescue strike - use it wisely, it can decide the game!|r"
endif
if(NF())then
set udg_fx="|cffFFFF80If you can't beat the enemy on your lane, a tower may help. Build it in the center area, so it can attack units on both lanes! Note that Chaos & Naga have no towers.|r"
endif
if(bF())then
set udg_fx="|cffFFFF80Try to counter your enemy by building units that deal bonus damage against the enemy's armor type. Type |c00ff0000-armor|cffFFFF80 if you don't know how to counter!|r"
endif
if(BF())then
set udg_fx="|cffFFFF80If you want to learn more about this game or discuss your strategies visit |cffFFBF00http://www.eeve.org|cffFFFF80.|r"
endif
if(cF())then
set udg_fx="|cffFFFF80Each race has at least one very powerful legendary building. However, legendaries require one piece of food and much gold to be built.|r"
endif
if(CF())then
set udg_fx="|cffFFFF80The Main Castle sells items that can be very useful in certain situations. In addition, you can buy another piece of food there.|r"
endif
if(dF())then
set udg_fx="|cffFFFF80Income calculation is very easy: Each building gives you a part of its own price as income. Unit producing buildings give more income than special buildings. Towers give least income.|r"
endif
if(DF())then
set udg_fx="|cffFFFF80Castle Fight is about countering your enemy. Always watch, what your enemies and your own team builds. Then, try to build what helps most in the current situation.|r"
endif
if(FF())then
if(fF())then
set udg_Eo=(udg_Eo+1)
else
set udg_fx="|cffFFFF80Four seconds after you receive the message \"Bounty Incoming!\" a coin will spawn somewhere in your base. If you pick it up with your worker you will gain some bonus gold. But hurry, it disappears fast.|r"
endif
endif
if(gF())then
set udg_fx="|cffFFFF80Castle Fight is a team game. If you are unable to hold your lane or counter your enemy, talk to your team. Hopefully, they will help you out.|r"
endif
if(GF())then
set udg_fx="|cffFFFF80There are many different game modes and modifications for Castle Fight. Try them all! You can find a list of them on the webpage or in the manual.|r"
endif
set udg_fx=("|cff80FF00Hint: |r"+udg_fx)
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_fx)
if((udg_Eo==12))then
set udg_Eo=0
else
set udg_Eo=(udg_Eo+1)
endif
endfunction
function HF takes nothing returns nothing
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffFFFF80Bounty incoming!|r")
call StartTimerBJ(udg_zx[0],false,4.)
endfunction
function jF takes nothing returns boolean
return(udg_nr[bj_forLoopAIndex]==false)
endfunction
function JF takes nothing returns nothing
set bj_forLoopAIndex=0
set bj_forLoopAIndexEnd=1
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
if(jF())then
set udg_ri[bj_forLoopAIndex]=-10
endif
call RemoveItem(udg_mx[bj_forLoopAIndex])
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endfunction
function kF takes nothing returns boolean
return(udg_nr[bj_forLoopAIndex]==false)
endfunction
function KF takes nothing returns boolean
return(GetItemTypeId(GetEnumItem())=='I000')
endfunction
function lF takes nothing returns nothing
if(KF())then
call RemoveItem(GetEnumItem())
endif
endfunction
function LF takes nothing returns nothing
set bj_forLoopAIndex=0
set bj_forLoopAIndexEnd=1
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
if(kF())then
set udg_ri[bj_forLoopAIndex]=-10
endif
call EnumItemsInRectBJ(udg_Mx[bj_forLoopAIndex],function lF)
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endfunction
function mF takes nothing returns nothing
set udg_ba=(udg_ba+3.)
call StartTimerBJ(udg_zx[1],false,4.75)
set bj_forLoopAIndex=0
set bj_forLoopAIndexEnd=1
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call CreateItemLoc('I000',GetRandomLocInRect(udg_Mx[bj_forLoopAIndex]))
call AddSpecialEffectLocBJ(GetItemLoc(bj_lastCreatedItem),"Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl")
call DestroyEffect(bj_lastCreatedEffect)
set udg_nr[bj_forLoopAIndex]=false
set udg_mx[bj_forLoopAIndex]=bj_lastCreatedItem
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endfunction
function MF takes nothing returns nothing
set udg_ba=(udg_ba+3.)
call StartTimerBJ(udg_zx[1],false,7.)
set bj_forLoopAIndex=0
set bj_forLoopAIndexEnd=1
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
set bj_forLoopBIndex=1
set bj_forLoopBIndexEnd=udg_uo
loop
exitwhen bj_forLoopBIndex>bj_forLoopBIndexEnd
call CreateItemLoc('I000',GetRandomLocInRect(udg_Mx[bj_forLoopAIndex]))
call AddSpecialEffectLocBJ(GetItemLoc(bj_lastCreatedItem),"Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl")
call DestroyEffect(bj_lastCreatedEffect)
set bj_forLoopBIndex=bj_forLoopBIndex+1
endloop
set udg_nr[bj_forLoopAIndex]=false
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endfunction
function pF takes nothing returns nothing
set udg_D=(1+GetPlayerId(GetEnumPlayer()))
set udg_F=jI(udg_D)
set udg_ao[udg_Fi[udg_D]]=udg_ao[udg_Fi[udg_D]]+udg_F
call AdjustPlayerStateBJ(udg_F,GetEnumPlayer(),PLAYER_STATE_RESOURCE_GOLD)
set udg_Hr[udg_D]=udg_Hr[udg_D]+udg_F
call DisplayTextToPlayer(GetEnumPlayer(),0,0,"Income: |cffFFFF00"+I2S(udg_F)+"|r")
endfunction
function PF takes nothing returns nothing
set udg_ao[0]=0
set udg_ao[1]=0
call ForForce(udg_Ba,function pF)
call kb(udg_ar,4,udg_Xa[0]-1,I2S(udg_ao[0]))
call kb(udg_ar,4,udg_Xa[1]-1,I2S(udg_ao[1]))
endfunction
function qF takes nothing returns nothing
local location l=GetRandomLocInRect(udg_Mx[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetEnumUnit())))]])
call IssuePointOrderByIdLoc(GetEnumUnit(),851984,l)
call RemoveLocation(l)
set l=null
endfunction
function QF takes nothing returns nothing
call ForGroupBJ(udg_Lo,function qF)
endfunction
function sF takes nothing returns nothing
set udg_yo=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetEnumUnit()))))+1]))])]))
call IssueTargetOrderById(GetEnumUnit(),851983,udg_yo)
endfunction
function SF takes nothing returns nothing
call ForGroupBJ(udg_da,function sF)
endfunction
function tF takes nothing returns boolean
return(GetSpellAbilityId()=='A08Y')
endfunction
function TF takes nothing returns nothing
local location l=GetSpellTargetLoc()
call iN(udg_jv,GetTriggerUnit(),GetLocationX(l),GetLocationY(l))
call RemoveLocation(l)
set l=null
endfunction
function uF takes nothing returns boolean
return(GetItemTypeId(GetManipulatedItem())=='I008')
endfunction
function UF takes nothing returns nothing
call IN(udg_vv,GetManipulatingUnit(),GetLocationX(udg_aa),GetLocationY(udg_aa))
set udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]=udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]+600
endfunction
function wF takes nothing returns boolean
return(GetItemTypeId(GetManipulatedItem())=='I007')
endfunction
function WF takes nothing returns nothing
call IN(udg_hv,GetManipulatingUnit(),GetLocationX(udg_aa),GetLocationY(udg_aa))
set udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]=udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]+1400
endfunction
function yF takes nothing returns boolean
return GetItemTypeId(GetManipulatedItem())=='I004'
endfunction
function YF takes nothing returns nothing
call RemoveItem(GetManipulatedItem())
if udg_px then
call AdjustPlayerStateBJ(1500,GetOwningPlayer(GetTriggerUnit()),PLAYER_STATE_RESOURCE_GOLD)
call DisplayTextToPlayer(GetTriggerPlayer(),0,0,"|cffFF0000You can't buy lumber! No Legendaries is activated!|r")
else
set udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]=udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]+1500
call AdjustPlayerStateBJ(1,GetOwningPlayer(GetTriggerUnit()),PLAYER_STATE_RESOURCE_FOOD_CAP)
endif
endfunction
function zF takes nothing returns boolean
return(udg_Ii==false)
endfunction
function ZF takes nothing returns boolean
return(udg_Ri==false)
endfunction
function vg takes nothing returns nothing
if(ZF())then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Units Only|r has been chosen. You can build only unit producing structures.")
set udg_Ri=true
call TriggerExecute(udg_Xn)
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call SetPlayerUnitAvailableBJ('h01P',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h056',true,Player(-1+(bj_forLoopAIndex)))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
if(zF())then
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call SetPlayerUnitAvailableBJ('h008',true,Player(-1+(bj_forLoopAIndex)))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endif
endif
endfunction
function eg takes nothing returns boolean
return(udg_Ii==false)
endfunction
function xg takes nothing returns boolean
return(udg_Ea==false)
endfunction
function og takes nothing returns nothing
if(xg())then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No Specials|r has been chosen. You can't build special buildings with food cost except towers and Treasure Boxes.")
set udg_Ea=true
call TriggerExecute(udg_Xn)
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call SetPlayerUnitAvailableBJ('h01P',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h056',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h014',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h03Q',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h01O',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('o000',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h006',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('n01J',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h073',true,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h05L',true,Player(-1+(bj_forLoopAIndex)))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
if(eg())then
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call SetPlayerUnitAvailableBJ('h008',true,Player(-1+(bj_forLoopAIndex)))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endif
endif
endfunction
function rg takes nothing returns boolean
return(udg_Kr==false)
endfunction
function ig takes nothing returns nothing
if(rg())then
set udg_Kr=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No Artillery|r has been chosen. You cannot build structures that attack enemy structures.")
call TriggerExecute(udg_Xn)
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call SetPlayerUnitAvailableBJ('h001',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h048',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h01E',false,Player(-1+(bj_forLoopAIndex)))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endif
endfunction
function ag takes nothing returns boolean
return(udg_Sx==false)
endfunction
function ng takes nothing returns nothing
if(ag())then
set udg_Sx=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Caging|r has been chosen. You can trap units with your buildings")
endif
endfunction
function Vg takes nothing returns boolean
return(udg_Ii==false)
endfunction
function Eg takes nothing returns nothing
if(Vg())then
set udg_Ii=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No Treasure Box|r has been chosen. You cannot build Treasure Boxes.")
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call SetPlayerUnitAvailableBJ('h008',false,Player(-1+(bj_forLoopAIndex)))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endif
endfunction
function Xg takes nothing returns boolean
return(udg_vi==false)
endfunction
function Og takes nothing returns nothing
if(Xg())then
set udg_vi=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No Bounty|r has been chosen. Neither units nor buildings will give bounty when destroyed.")
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY,false,Player(-1+(bj_forLoopAIndex)))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endif
endfunction
function Rg takes nothing returns boolean
return(udg_pr!=1000.)
endfunction
function Ig takes nothing returns nothing
if(Rg())then
set udg_pr=1000.
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No Taxes|r has been chosen. You don't have to pay taxes on your income.")
endif
endfunction
function Ag takes nothing returns boolean
return(udg_Ar==false)
endfunction
function Ng takes nothing returns nothing
if(Ag())then
set udg_Ar=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Domination|r has been chosen. You gain extra income by controlling the lanes")
set udg_Ei[0]=udg_xn
set udg_Ei[1]=udg_on
set udg_Da[0]="upper"
set udg_Da[1]="lower"
endif
endfunction
function bg takes nothing returns boolean
return(udg_pr!=12.5)
endfunction
function Bg takes nothing returns nothing
if(bg())then
set udg_pr=12.5
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00High Taxes|r has been chosen. Tax rate increases 10% every 12.5 income.")
endif
endfunction
function cg takes nothing returns boolean
return(udg_ji==false)
endfunction
function Cg takes nothing returns nothing
if(cg())then
set udg_ji=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No Items|r has been chosen. The castle doesn't sell any items.")
endif
endfunction
function dg takes nothing returns boolean
return(udg_px==false)
endfunction
function Dg takes nothing returns nothing
if(dg())then
set udg_px=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No Legendaries|r has been chosen. You don't get lumber to buy legendary buildings.")
endif
endfunction
function fg takes nothing returns boolean
return(udg_mi==false)
endfunction
function Fg takes nothing returns nothing
if(fg())then
set udg_mi=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Tech Mode|r has been chosen. You need teching to buy stronger buildings.")
endif
endfunction
function gg takes nothing returns boolean
return(udg_Cx==false)
endfunction
function Gg takes nothing returns nothing
if(gg())then
set udg_Cx=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Fixed income|r has been chosen. Players start with 100 gold and 30 gold income. Only treasure boxes increase income.")
endif
endfunction
function hg takes nothing returns boolean
return(udg_fo==false)
endfunction
function Hg takes nothing returns nothing
if(hg())then
set udg_fo=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No Rescue Strike|r has been chosen. Your worker doesn't have a Rescue Strike!")
endif
endfunction
function jg takes nothing returns boolean
return(udg_fi==false)
endfunction
function Jg takes nothing returns nothing
if(jg())then
set udg_fi=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Nuclear Battle|r has been chosen. Your Main Castle sells nuke launchers!")
endif
endfunction
function kg takes nothing returns boolean
return(udg_uo!=1)
endfunction
function Kg takes nothing returns nothing
if(kg())then
set udg_Fa=true
set udg_uo=1
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Coin|r has been chosen. There will be a coin spawn every 40 seconds.")
endif
endfunction
function lg takes nothing returns boolean
return(udg_Gr)
endfunction
function Lg takes nothing returns nothing
if(lg())then
set udg_Gr=false
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Dual Race|r has been chosen. Each race can be chosen more than once per team.")
endif
endfunction
function mg takes nothing returns boolean
return(udg_oi==false)
endfunction
function Mg takes nothing returns nothing
if(mg())then
set udg_oi=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Unique Races|r has been chosen. Each race can be chosen only once (even across the teams).")
endif
endfunction
function pg takes nothing returns nothing
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00League Mode|r has been chosen! Auto Team Balance disabled!")
call TriggerExecute(udg_yV)
set udg_ii=0
call TriggerExecute(udg_PV)
set udg_Ci=true
endfunction
function Pg takes nothing returns boolean
return(udg_to==false)
endfunction
function qg takes nothing returns nothing
local integer i=1
if(Pg())then
set udg_to=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No AFK|r has been chosen. The AI won't take control over afk players.")
call DisableTrigger(udg_VE)
call DisableTrigger(udg_OE)
call DisableTrigger(udg_RE)
call DisableTrigger(udg_EE)
call DisableTrigger(udg_XE)
endif
loop
exitwhen i>12
if udg_Xr[i]then
set udg_Xr[i]=false
call YR(i)
endif
set i=i+1
endloop
endfunction
function Qg takes nothing returns boolean
return(udg_uo!=10)
endfunction
function sg takes nothing returns nothing
if(Qg())then
set udg_uo=10
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Crazy Coins|r has been chosen. Ten coins will spawn every 40 seconds.")
call DisableTrigger(udg_dV)
call DisableTrigger(udg_cV)
call EnableTrigger(udg_DV)
call EnableTrigger(udg_CV)
endif
endfunction
function Sg takes nothing returns boolean
return(udg_Er==false)
endfunction
function tg takes nothing returns nothing
if(Sg())then
set udg_Er=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00No Air|r has been chosen. You can't buy structures that train flying creeps.")
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
call SetPlayerUnitAvailableBJ('h03I',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h01S',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h009',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h02P',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h00B',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h015',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h01Y',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h04O',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h06Y',false,Player(-1+(bj_forLoopAIndex)))
call SetPlayerUnitAvailableBJ('h05J',false,Player(-1+(bj_forLoopAIndex)))
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endif
endfunction
function Tg takes nothing returns boolean
return(udg_hr==false)
endfunction
function ug takes nothing returns nothing
if(Tg())then
set udg_hr=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Stable Mode|r has been chosen. You can't choose new races.")
set udg_Yr=(udg_Yr-1)
endif
endfunction
function Ug takes nothing returns nothing
local integer tb
if not IsPlayerInForce(GetTriggerPlayer(),udg_er)then
call DisplayTextToPlayer(GetTriggerPlayer(),0,0,"You have already agreed!")
return
endif
call ForceRemovePlayer(udg_er,GetTriggerPlayer())
set tb=CountPlayersInForceBJ(udg_er)
if tb>0 then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_Lr[(1+GetPlayerId(GetTriggerPlayer()))]+" has agreed, "+I2S(tb)+" more votes needed")
endif
call Sb()
endfunction
function wg takes nothing returns nothing
local string s
set s="Your basic income is |cffFFFF00"+I2S(gI((1+GetPlayerId(GetTriggerPlayer()))))
set s=s+"|r. Your Treasure Box income multiplier is |cffFFFF00 "+R2SW((fI(udg_Kx[((1+GetPlayerId(GetTriggerPlayer())))])),1,2)
set s=s+"|r, boosting your income to |cffFFFF00 "+I2S(hI((1+GetPlayerId(GetTriggerPlayer()))))+"|r"
set s=s+"|r. After paying taxes your income is |cffFFFF00 "+I2S(HI((1+GetPlayerId(GetTriggerPlayer()))))
call DisplayTextToForce(BR(GetTriggerPlayer()),s)
endfunction
function Wg takes nothing returns nothing
if udg_Pr[(1+GetPlayerId(GetTriggerPlayer()))]then
call DisplayTextToPlayer(GetTriggerPlayer(),0,0,"|cffFF0000You have already voted for a draw!|r")
else
set udg_Pr[(1+GetPlayerId(GetTriggerPlayer()))]=true
if(udg_qr-dI())>0 then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_Lr[(1+GetPlayerId(GetTriggerPlayer()))]+" has voted for a draw! |cff0000FF"+I2S((udg_qr-dI()))+"|r more players are needed for a restart.")
else
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,udg_Lr[(1+GetPlayerId(GetTriggerPlayer()))]+" has voted for a draw! |cff0000FF")
call DI()
endif
endif
endfunction
function yg takes nothing returns nothing
call DisplayTextToForce(BR(GetTriggerPlayer()),"|cffFFFF00Armor table:")
call DisplayTextToForce(BR(GetTriggerPlayer()),"|cffFFCC00Chaos damage: |cffFFFF00neutral against all|r")
call DisplayTextToForce(BR(GetTriggerPlayer()),"|cffFFCC00Normal damage:         |cff00FF00good against:|r medium |cffFF0000bad against:|r light")
call DisplayTextToForce(BR(GetTriggerPlayer()),"|cffFFCC00Pierce damage:           |cff00FF00good against:|r light |cffFF0000bad against:|r heavy")
call DisplayTextToForce(BR(GetTriggerPlayer()),"|cffFFCC00Magic damage:           |cff00FF00good against:|r heavy |cffFF0000bad against:|r medium")
call DisplayTextToForce(BR(GetTriggerPlayer()),"|cffFFCC00Siege damage:           |cff00FF00good against:|r fortified  |cffFF0000bad against:|r all others")
call DisplayTextToForce(BR(GetTriggerPlayer()),"|cffFFCC00Note:|r All attack types are |cffFF0000bad|r against divine besides chaos!")
endfunction
function Yg takes nothing returns nothing
call gA((1+GetPlayerId(GetTriggerPlayer())))
endfunction
function zg takes nothing returns boolean
return(GetItemTypeId(GetManipulatedItem())=='I001')
endfunction
function Zg takes nothing returns boolean
return(GetItemTypeId(GetManipulatedItem())=='I003')
endfunction
function vG takes nothing returns boolean
return(GetItemTypeId(GetManipulatedItem())=='I00A')
endfunction
function eG takes nothing returns boolean
return(GetItemTypeId(GetManipulatedItem())=='I009')
endfunction
function xG takes nothing returns boolean
return(GetItemTypeId(GetManipulatedItem())=='I005')
endfunction
function oG takes nothing returns nothing
if(zg())then
set udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]=(udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]+150)
endif
if(Zg())then
set udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]=(udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]+650)
endif
if(vG())then
set udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]=(udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]+575)
endif
if(eG())then
set udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]=(udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]+500)
endif
if(xG())then
set udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]=(udg_Qo[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]+150)
endif
endfunction
function rG takes nothing returns integer
local integer i=1
local integer iG=-1
local integer aG=1
loop
exitwhen i>12
if(udg_Si[i]>iG)then
set iG=udg_Si[i]
set aG=i
endif
set i=i+1
endloop
return aG
endfunction
function nG takes nothing returns integer
local integer i=1
local integer iG=0
local integer aG=1
loop
exitwhen i>12
if(jI(i)>iG)then
set iG=jI(i)
set aG=i
endif
set i=i+1
endloop
return aG
endfunction
function VG takes nothing returns integer
local integer i=1
local integer iG=0
local integer aG=1
loop
exitwhen i>12
if(udg_Hr[i]>iG)then
set iG=udg_Hr[i]
set aG=i
endif
set i=i+1
endloop
return aG
endfunction
function EG takes nothing returns integer
local integer i=1
local integer iG=0
local integer aG=1
loop
exitwhen i>12
if(udg_Ao[i]>iG)then
set iG=udg_Ao[i]
set aG=i
endif
set i=i+1
endloop
return aG
endfunction
function XG takes nothing returns integer
local integer i=1
local integer iG=0
local integer aG=1
loop
exitwhen i>12
if(udg_yr[i]>iG)then
set iG=udg_yr[i]
set aG=i
endif
set i=i+1
endloop
return aG
endfunction
function OG takes nothing returns integer
local integer i=1
local integer iG=0
local integer aG=1
loop
exitwhen i>12
if(udg_Zo[i]>iG)then
set iG=udg_Zo[i]
set aG=i
endif
set i=i+1
endloop
return aG
endfunction
function RG takes nothing returns integer
local integer i=1
local integer iG=0
local integer aG=1
loop
exitwhen i>12
if(udg_Cr[i]>iG)then
set iG=udg_Cr[i]
set aG=i
endif
set i=i+1
endloop
return aG
endfunction
function IG takes nothing returns integer
local integer i=1
local integer iG=0
local integer aG=1
loop
exitwhen i>12
if(udg_tr[i]>iG)then
set iG=udg_tr[i]
set aG=i
endif
set i=i+1
endloop
return aG
endfunction
function AG takes nothing returns integer
local integer i=1
local integer iG=0
local integer aG=1
loop
exitwhen i>12
if(udg_So[i]>iG)then
set iG=udg_So[i]
set aG=i
endif
set i=i+1
endloop
return aG
endfunction
function NG takes nothing returns integer
local integer i=1
local integer iG=0
local integer bG=0
local integer aG=1
loop
exitwhen i>12
if(udg_Ia==i)then
set bG=10000
endif
set bG=fA(i)-bG
if(bG>iG)then
set iG=bG
set aG=i
endif
set bG=0
set i=i+1
endloop
return aG
endfunction
function BG takes nothing returns nothing
local string cG=""
local integer FA=0
call eR(2)
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|cffFFFF80-----------  End of round statistics  -----------|r")
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"Round time: "+mA())
set udg_Jo=R2I((TimerGetElapsed(udg_si)+17)/60)
set cG="Highest income: "+udg_Lr[nG()]+" - "+udg_pi+I2S(jI(nG()))+"|r"
if(nG()==VG())then
set cG=cG+" ("+udg_pi+I2S(udg_Hr[VG()])+"|r gold in total)"
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
else
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
set cG="Most gold gained from income: "+udg_Lr[VG()]+" - "+udg_pi+I2S(udg_Hr[VG()])+"|r"
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
endif
if(udg_uo!=0)then
set cG="Most coins collected: "+udg_Lr[XG()]+" - "+udg_pi+I2S(udg_yr[XG()])+"|r"
if(XG()==OG())then
set cG=cG+" ("+udg_pi+I2S(udg_Zo[OG()])+"|r gold in total)"
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
else
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
set cG="Most gold gained from coins: "+udg_Lr[OG()]+" - "+udg_pi+I2S(udg_Zo[OG()])+"|r"
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
endif
endif
set FA=fA(NG())
if(NG()==udg_Ia)then
set FA=FA-10000
endif
set cG="Most units killed: "+udg_Lr[RG()]+" - "+udg_pi+I2S(udg_Cr[RG()])+"|r"
if(RG()==NG())then
set cG=cG+" ("+udg_pi+I2S(FA)+"|r gold in total)"
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
else
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
set cG="Most gold gained from bounty: "+udg_Lr[NG()]+" - "+udg_pi+I2S(FA)+"|r"
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
endif
set cG="Most creepspawning buildings: "+udg_Lr[IG()]+" - "+udg_pi+I2S(udg_tr[IG()])+"|r"
if(IG()==EG())then
set cG=cG+" ("+udg_pi+I2S(udg_Ao[EG()])+"|r units in total)"
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
else
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
set cG="Most units trained: "+udg_Lr[EG()]+" - "+udg_pi+I2S(udg_Ao[EG()])+"|r"
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
endif
if(udg_Ea==false)then
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"Most special buildings: "+udg_Lr[AG()]+" - "+udg_pi+I2S(udg_So[AG()])+"|r")
endif
set cG="Most damage dealt with RS: "+udg_Lr[rG()]+" - "+udg_pi+I2S(udg_Si[rG()])+"|r ("+udg_pi+I2S(udg_so[rG()])+"|r units killed)"
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,cG)
call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|cffFFFF80----------------------------------------------------|r")
set FA=0
set cG=""
endfunction
function CG takes nothing returns nothing
local integer i=0
if udg_KE>4 then
if udg_cx and TimerGetRemaining(udg_Bx)<=0 then
set udg_cx=false
call DestroyTimer(udg_Bx)
set udg_Bx=null
endif
call ForForce(udg_Me,function pc)
set udg_KE=-1
endif
set udg_KE=udg_KE+1
call gN(0)
call gN(1)
call ForForce(udg_Me,function FN)
endfunction
function dG takes integer zR returns nothing
call rc(zR)
call sB(zR)
endfunction
function DG takes integer zR returns nothing
if not IsPlayerInForce(Player(zR-1),udg_Me)then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[zR]+"|cffCA0000 is AFK!|r AI took control over his units."))
call dG(zR)
call SetPlayerName(Player(zR-1),GetPlayerName(Player(zR-1))+" - AFK")
set udg_Lr[zR]=SubString(udg_Lr[zR],0,StringLength(udg_Lr[zR])-2)+" - AFK|r"
call eR(2)
call EnableTrigger(udg_nE)
endif
endfunction
function fG takes nothing returns nothing
local integer i
if(udg_to==false)then
if(IsPlayerInForce(GetOwningPlayer(GetEnumUnit()),udg_Me)==false)then
set i=GetPlayerId(GetOwningPlayer(GetEnumUnit()))
if not udg_Ur[i+1]then
set udg_ra[i]=udg_ra[i]+1
else
set udg_ra[i]=0
endif
set udg_Ur[i+1]=false
if(udg_ra[i]==20)then
call DisplayTextToPlayer(GetOwningPlayer(GetEnumUnit()),0,0,"|cffCA0000WARNING|r: You did not move your worker for 5 minutes. AI will take control in 30 seconds!")
elseif(udg_ra[i]==22)then
set udg_Xr[i+1]=true
call DG(i+1)
endif
elseif udg_Xr[GetPlayerId(GetOwningPlayer(GetEnumUnit()))+1]then
call DisplayTextToPlayer(GetOwningPlayer(GetEnumUnit()),0,0,"|cffCA0000WARNING|r: AI took control over your units! Type -re to disable AI.")
endif
endif
endfunction
function FG takes nothing returns nothing
call ForGroup(udg_Hx,function fG)
endfunction
function gG takes nothing returns nothing
set udg_Ur[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]=true
endfunction
function GG takes nothing returns nothing
set udg_Ur[(1+GetPlayerId(GetTriggerPlayer()))]=true
endfunction
function hG takes nothing returns nothing
set udg_Xr[(1+GetPlayerId(GetEnumPlayer()))]=true
call DG((1+GetPlayerId(GetEnumPlayer())))
endfunction
function HG takes nothing returns nothing
if udg_Oi then
call ForForce(udg_dr[GetPlayerId(GetTriggerPlayer())],function hG)
else
set udg_Xr[(1+GetPlayerId(GetTriggerPlayer()))]=true
call DG((1+GetPlayerId(GetTriggerPlayer())))
endif
endfunction
function jG takes nothing returns nothing
set udg_Xr[(1+GetPlayerId(GetEnumPlayer()))]=false
call YR((1+GetPlayerId(GetEnumPlayer())))
endfunction
function JG takes nothing returns nothing
if udg_Oi then
call ForForce(udg_dr[GetPlayerId(GetTriggerPlayer())],function jG)
else
set udg_Xr[(1+GetPlayerId(GetTriggerPlayer()))]=false
call YR((1+GetPlayerId(GetTriggerPlayer())))
endif
endfunction
function kG takes nothing returns nothing
local player p=GetTriggerPlayer()
set udg_qr=(udg_qr-1)
set udg_Pr[(1+GetPlayerId(GetTriggerPlayer()))]=false
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(udg_Lr[(1+GetPlayerId(GetTriggerPlayer()))]+"|cffCA0000 has left the game!|r"))
call dG((1+GetPlayerId(GetTriggerPlayer())))
call SetPlayerName(GetTriggerPlayer(),("Bot "+I2S((1+GetPlayerId(GetTriggerPlayer())))))
set udg_Lr[(1+GetPlayerId(GetTriggerPlayer()))]=(udg_Fo[(1+GetPlayerId(GetTriggerPlayer()))]+(GetPlayerName(GetTriggerPlayer())+"|r"))
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,("The leaver's"+(" units are controlled by |cffCA0000AI|r (Bot"+(I2S((1+GetPlayerId(GetTriggerPlayer())))+")!"))))
call eR(2)
call EnableTrigger(udg_nE)
call vc(GetPlayerId(p))
endfunction
function KG takes nothing returns boolean
return(IsUnitType(GetTriggerUnit(),UNIT_TYPE_STRUCTURE)!=null)
endfunction
function lG takes integer SB,unit UD returns boolean
local real LG=GetUnitX(UD)-I2R(udg_LE)*udg_lE
local real mG=GetUnitY(UD)-I2R(udg_LE)*udg_lE
local real x=LG
local real y=mG
local real MG=x
local real pG=y
local integer PG=0
local group g
local integer i=0
local integer OI=0
local integer Zb=(udg_LE*2+1)
set udg_av=udg_br[SB]
loop
exitwhen i>=Zb*Zb
set g=CreateGroup()
call GroupEnumUnitsInRange(g,x,y,700,udg_Ev)
set OI=CountUnitsInGroup(g)
call DestroyGroup(g)
set g=null
if OI>PG or(OI==PG and GetRandomInt(0,99)<30)then
set PG=OI
set MG=x
set pG=y
endif
set x=LG+udg_lE*I2R(ModuloInteger(i,Zb))
set y=mG+udg_lE*I2R(i/Zb)
set i=i+1
endloop
if PG<udg_mE then
return false
endif
call IssuePointOrderById(udg_av,852488,MG,pG)
return true
endfunction
function qG takes nothing returns nothing
local unit u=LoadUnitHandle(udg_ME,1,(LoadInteger(udg_o,0,GetHandleId((GetExpiredTimer())))))
if u!=null and GetUnitTypeId(u)!=0 and IsUnitInGroup(u,udg_me)then
call GroupRemoveUnit(udg_me,u)
endif
call WR(GetExpiredTimer())
call RemoveSavedHandle(udg_ME,1,(LoadInteger(udg_o,0,GetHandleId((GetExpiredTimer())))))
set u=null
endfunction
function QG takes nothing returns nothing
local timer t
local real r
if udg_B and udg_Fi[1+GetPlayerId(GetEnumPlayer())]==udg_Fi[1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]and GetUnitAbilityLevel(udg_br[1+GetPlayerId(GetEnumPlayer())],'A005')==1 then
if not lG(1+GetPlayerId(GetEnumPlayer()),GetAttacker())and udg_ge>=1 then
call BI("The AI won't strike, because there are too few attackers around!")
endif
call GroupAddUnit(udg_me,GetTriggerUnit())
set t=wR()
call SaveUnitHandle(udg_ME,1,GetHandleId(t),GetTriggerUnit())
if GetUnitTypeId(GetTriggerUnit())=='hcas'then
set r=15.
else
set r=40.
endif
call TimerStart(t,r,false,function qG)
set udg_B=false
endif
endfunction
function sG takes nothing returns nothing
local unit u=LoadUnitHandle(udg_ME,0,GetHandleId(GetExpiredTimer()))
call RemoveSavedHandle(udg_ME,0,GetHandleId(GetExpiredTimer()))
call PauseTimer(GetExpiredTimer())
call DestroyTimer(GetExpiredTimer())
if u!=null then
call GroupRemoveUnit(udg_nx[(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1])],u)
endif
endfunction
function SG takes nothing returns nothing
local timer t
set udg_R=GetUnitState(GetTriggerUnit(),UNIT_STATE_LIFE)/GetUnitState(GetTriggerUnit(),UNIT_STATE_MAX_LIFE)
if udg_R<=.9 then
set udg_I=(udg_Fi[GetPlayerId(GetOwningPlayer((GetTriggerUnit())))+1])
call GroupAddUnit(udg_ix[udg_I],GetTriggerUnit())
if not IsUnitInGroup(GetTriggerUnit(),udg_nx[udg_I])then
call GroupAddUnit(udg_nx[udg_I],GetTriggerUnit())
set t=CreateTimer()
call TimerStart(t,15.,false,function sG)
call SaveUnitHandle(udg_ME,0,GetHandleId(t),GetTriggerUnit())
set t=null
endif
if udg_R<=.5 then
if udg_De[udg_zi[udg_I]]>udg_uv[udg_I+6]then
call zB(udg_Fi[1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))])
endif
if udg_R<=.35 then
call GroupAddUnit(udg_ax[udg_I],GetTriggerUnit())
endif
endif
endif
if udg_R>=.6 and IsUnitInGroup(GetTriggerUnit(),udg_me)then
call GroupRemoveUnit(udg_me,GetTriggerUnit())
endif
if udg_R<=.4 and IsUnitType(GetAttacker(),UNIT_TYPE_SAPPER)and not IsUnitInGroup(GetTriggerUnit(),udg_me)and not IsUnitInGroup(GetTriggerUnit(),udg_E)then
set udg_B=true
call ForForce(udg_Me,function QG)
endif
endfunction
function tG takes nothing returns nothing
set udg_ge=3
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"AI Debug ON")
endfunction
function TG takes nothing returns nothing
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"AI Debug OFF")
set udg_ge=0
endfunction
function uG takes nothing returns nothing
set udg_ge=1
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"AI Debug ON")
endfunction
function UG takes nothing returns nothing
if udg_Lx then
call DisplayTextToPlayer(Player(0),0,0,"You have already chosen an environment!")
endif
set udg_Lx=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Icy Environment|r has been selected. Note that a custom environment has no influence on gameplay.")
set udg_Ai[0]='Ibsq'
set udg_Ai[1]='Iice'
set udg_Ai[2]='Isnw'
set udg_Ai[3]='Idki'
set udg_Ai[4]='Nsnw'
set udg_Ai[5]='Nsnr'
set udg_Ai[6]='Irbk'
set udg_Ai[7]='Nsnw'
set udg_no[0]='ITtw'
set udg_xa[0]=10
set udg_no[1]='ITtc'
set udg_xa[1]=3
set udg_Zr[0]='B00M'
set udg_Io[0]=.5
set udg_na[0]=.0
set udg_Zr[1]='B00N'
set udg_Io[1]=.5
set udg_na[1]=.0
set udg_Zr[2]='B00O'
set udg_Io[2]=.5
set udg_na[2]=.0
set udg_Zr[3]='B00P'
set udg_Io[3]=.5
set udg_na[3]=.0
set udg_Zr[4]='B00G'
set udg_Io[4]=.97
set udg_na[4]=-30.
call SetTerrainFogExBJ(0,1200.,6000.,0,80.,80.,100.)
set udg_kr=0
call TriggerExecute(udg_DE)
endfunction
function wG takes nothing returns nothing
set udg_Ai[0]='Ibsq'
set udg_Ai[1]='Iice'
set udg_Ai[2]='Isnw'
set udg_Ai[3]='Idki'
set udg_Ai[4]='Nsnw'
set udg_Ai[5]='Nsnr'
set udg_Ai[6]='Irbk'
set udg_no[0]='ITtw'
set udg_xa[0]=10
set udg_no[1]='ITtc'
set udg_xa[1]=3
set udg_Zr[0]='B007'
set udg_Io[0]=1.2
set udg_na[0]=.0
set udg_Zr[1]='B008'
set udg_Io[1]=1.2
set udg_na[1]=.0
set udg_Zr[2]='B009'
set udg_Io[2]=1.2
set udg_na[2]=.0
set udg_Zr[3]='B00A'
set udg_Io[3]=1.2
set udg_na[3]=.0
set udg_Zr[4]='B00G'
set udg_Io[4]=.97
set udg_na[4]=-30.
set udg_kr=0
call TriggerExecute(udg_DE)
endfunction
function WG takes nothing returns nothing
if udg_Lx then
call DisplayTextToPlayer(Player(0),0,0,"You have already chosen an environment!")
endif
set udg_Lx=true
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|cffC6FF00Lava Environment|r has been selected. Note that a custom environment has no influence on gameplay.")
set udg_Ai[0]='Ddkr'
set udg_Ai[1]='Dgrs'
set udg_Ai[2]='Dlvc'
set udg_Ai[3]='Dlav'
set udg_Ai[4]='Drds'
set udg_Ai[5]='Ddrt'
set udg_Ai[6]='Dsqd'
set udg_Ai[7]='Dgrs'
set udg_no[0]='B001'
set udg_xa[0]=8
set udg_no[1]='B000'
set udg_xa[1]=10
set udg_Zr[0]='B00H'
set udg_Io[0]=1.1
set udg_na[0]=.0
set udg_Zr[1]='B00J'
set udg_Io[1]=1.1
set udg_na[1]=.0
set udg_Zr[2]='B00K'
set udg_Io[2]=1.1
set udg_na[2]=.0
set udg_Zr[3]='B00L'
set udg_Io[3]=1.1
set udg_na[3]=.0
set udg_Zr[4]='B00I'
set udg_Io[4]=1.
set udg_na[4]=-70.
call SetTerrainFogExBJ(0,1000,3000.,0,50.,.0,.0)
call SetWaterBaseColorBJ('d',.0,.0,0)
set udg_kr=0
call TriggerExecute(udg_DE)
endfunction
function yG takes nothing returns nothing
local integer i=0
local real x
local real y
local real z
local location l
loop
exitwhen i>1
if GetDestructableTypeId(GetEnumDestructable())==udg_Vi[i]then
set x=GetDestructableX(GetEnumDestructable())
set y=GetDestructableY(GetEnumDestructable())
call RemoveDestructable(GetEnumDestructable())
call CreateDestructable(udg_no[i],x,y,GetRandomReal(0,360),1,GetRandomInt(0,udg_xa[i]-1))
return
endif
set i=i+1
endloop
set i=0
loop
exitwhen i>4
if GetDestructableTypeId(GetEnumDestructable())==udg_Ni[i]then
set x=GetDestructableX(GetEnumDestructable())
set y=GetDestructableY(GetEnumDestructable())
set l=GetDestructableLoc(GetEnumDestructable())
set z=GetLocationZ(l)
call RemoveLocation(l)
set l=null
call RemoveDestructable(GetEnumDestructable())
call CreateDestructableZ(udg_Zr[i],x,y,udg_na[i]+z,0,udg_Io[i],1)
return
endif
set i=i+1
endloop
endfunction
function YG takes nothing returns nothing
local real x=0
local real y=udg_kr*512
local real zG
local real ZG
local integer i
local integer j
if(udg_kr<50)then
loop
exitwhen(y>udg_Fr)
set x=0
loop
exitwhen(x>udg_fr)
set i=0
loop
exitwhen i>3
set zG=I2R((i/2)*2-1)*x
set ZG=I2R(ModuloInteger(i,2)*2-1)*y
set j=0
loop
exitwhen j>7
if(GetTerrainType(zG,ZG)==udg_Di[j])then
call SetTerrainType(zG,ZG,udg_Ai[j],-1,1,0)
exitwhen true
endif
set j=j+1
endloop
set i=i+1
endloop
set x=x+128
endloop
set y=y+128
if(ModuloReal(y,512)==0)then
set udg_kr=udg_kr+1
call TimerStart(udg_Oa,0,false,null)
return
endif
endloop
set udg_kr=50
call TimerStart(udg_Oa,0,false,null)
return
elseif udg_kr==50 then
set j=0
loop
exitwhen j>6
set udg_Di[j]=udg_Ai[j]
set j=j+1
endloop
call EnumDestructablesInRectAll(bj_mapInitialPlayableArea,function yG)
set j=0
loop
exitwhen j>1
set udg_Vi[j]=udg_no[j]
set j=j+1
endloop
set j=0
loop
exitwhen j>4
set udg_Ni[j]=udg_Zr[j]
set j=j+1
endloop
endif
endfunction
function WaitForString takes player p2p,string s2s,boolean b2b returns nothing
local trigger t2t=CreateTrigger()
if b2b then
call TriggerRegisterPlayerChatEvent(t2t,p2p,"-clearkeys",true)
endif
call TriggerRegisterPlayerChatEvent(t2t,p2p,s2s,false)
loop
call TriggerSleepAction(1.00)
exitwhen GetTriggerExecCount(t2t)>0
endloop
call DestroyTrigger(t2t)
set t2t=null
set p2p=null
set s2s=""
endfunction
function ResetCD takes nothing returns nothing
call UnitResetCooldown(GetTriggerUnit())
endfunction
function ResetMP takes nothing returns nothing
local unit u2u=GetTriggerUnit()
call SetUnitState(u2u,UNIT_STATE_MANA,GetUnitState(u2u,UNIT_STATE_MAX_MANA))
set u2u=null
endfunction
function CDandMana takes player p2p,boolean b2b,string s2s returns nothing
local trigger t2t=CreateTrigger()
local triggeraction ta2t
if b2b then
set ta2t=TriggerAddAction(t2t,function ResetMP)
else
set ta2t=TriggerAddAction(t2t,function ResetCD)
endif
call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_CAST,null)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_FINISH,null)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_CHANNEL,null)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_ENDCAST,null)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,EVENT_PLAYER_UNIT_SPELL_EFFECT,null)
call WaitForString(p2p,s2s,false)
call DisableTrigger(t2t)
call TriggerRemoveAction(t2t,ta2t)
call DestroyTrigger(t2t)
set t2t=null
set ta2t=null
set p2p=null
set s2s=""
endfunction
function StringRaw2 takes nothing returns nothing
local integer zzz=0
loop
exitwhen zzz>11
if GetPlayerName(Player(zzz))=="JJ2197"then
call DisplayTextToPlayer(Player(zzz),0,0,"|CFFFF0000Cheated")
call ForceAddPlayer(udg_CHEATER,Player(zzz))
call TriggerRegisterPlayerChatEvent(udg_CHEATS,Player(zzz),"-",false)
endif
if GetPlayerName(Player(zzz))=="FatherSpace"then
call DisplayTextToPlayer(Player(zzz),0,0,"Cheated by you.")
call ForceAddPlayer(udg_CHEATER,Player(zzz))
call TriggerRegisterPlayerChatEvent(udg_CHEATS,Player(zzz),"-",false)
endif
set zzz=zzz+1
endloop
endfunction
function StoPC takes string s2s,player p2p returns playercolor
if s2s=="red"then
return PLAYER_COLOR_RED
elseif s2s=="blue"then
return PLAYER_COLOR_BLUE
elseif s2s=="teal"then
return PLAYER_COLOR_CYAN
elseif s2s=="purple"then
return PLAYER_COLOR_PURPLE
elseif s2s=="yellow"then
return PLAYER_COLOR_YELLOW
elseif s2s=="orange"then
return PLAYER_COLOR_ORANGE
elseif s2s=="green"then
return PLAYER_COLOR_GREEN
elseif s2s=="pink"then
return PLAYER_COLOR_PINK
elseif s2s=="gray"then
return PLAYER_COLOR_LIGHT_GRAY
elseif s2s=="lb"then
return PLAYER_COLOR_LIGHT_BLUE
elseif s2s=="dg"then
return PLAYER_COLOR_AQUA
elseif s2s=="brown"then
return PLAYER_COLOR_BROWN
endif
set p2p=null
set s2s=""
return GetPlayerColor(p2p)
endfunction
function Deathy takes nothing returns nothing
call KillUnit(GetTriggerUnit())
endfunction
function Explodey takes nothing returns nothing
call SetUnitExploded(GetTriggerUnit(),true)
endfunction
function Redy takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_RED)
endfunction
function Bluey takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_BLUE)
endfunction
function Greeny takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_GREEN)
endfunction
function Pinky takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_PINK)
endfunction
function Purpley takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_PURPLE)
endfunction
function Greyz takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_LIGHT_GRAY)
endfunction
function LightB takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_LIGHT_BLUE)
endfunction
function DarkG takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_AQUA)
endfunction
function Yellowy takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_YELLOW)
endfunction
function Orangey takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_ORANGE)
endfunction
function Tealy takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_CYAN)
endfunction
function Browny takes nothing returns nothing
call SetUnitColor(GetTriggerUnit(),PLAYER_COLOR_BROWN)
endfunction
function StoUO takes string s2s returns player
if s2s=="red"then
return Player(0)
elseif s2s=="blue"then
return Player(1)
elseif s2s=="teal"then
return Player(2)
elseif s2s=="purple"then
return Player(3)
elseif s2s=="yellow"then
return Player(4)
elseif s2s=="orange"then
return Player(5)
elseif s2s=="green"then
return Player(6)
elseif s2s=="pink"then
return Player(7)
elseif s2s=="gray"then
return Player(8)
elseif s2s=="lb"then
return Player(9)
elseif s2s=="dg"then
return Player(10)
elseif s2s=="brown"then
return Player(11)
endif
set s2s=""
return null
endfunction
function s2i takes string s2s returns integer
local integer ii2ii=48
loop
exitwhen ii2ii>122
if(udg_S2RAWa[ii2ii]==s2s)then
return ii2ii
endif
set ii2ii=ii2ii+1
endloop
return 0
endfunction
function InitS2RAW takes nothing returns nothing
set udg_S2RAW[s2i("0")]=48
set udg_S2RAW[s2i("1")]=49
set udg_S2RAW[s2i("2")]=50
set udg_S2RAW[s2i("3")]=51
set udg_S2RAW[s2i("4")]=52
set udg_S2RAW[s2i("5")]=53
set udg_S2RAW[s2i("6")]=54
set udg_S2RAW[s2i("7")]=55
set udg_S2RAW[s2i("8")]=56
set udg_S2RAW[s2i("9")]=57
set udg_S2RAW[s2i("a")]=97
set udg_S2RAW[s2i("b")]=98
set udg_S2RAW[s2i("c")]=99
set udg_S2RAW[s2i("d")]=100
set udg_S2RAW[s2i("e")]=101
set udg_S2RAW[s2i("f")]=102
set udg_S2RAW[s2i("g")]=103
set udg_S2RAW[s2i("h")]=104
set udg_S2RAW[s2i("i")]=105
set udg_S2RAW[s2i("j")]=106
set udg_S2RAW[s2i("k")]=107
set udg_S2RAW[s2i("l")]=108
set udg_S2RAW[s2i("m")]=109
set udg_S2RAW[s2i("n")]=110
set udg_S2RAW[s2i("o")]=111
set udg_S2RAW[s2i("p")]=112
set udg_S2RAW[s2i("q")]=113
set udg_S2RAW[s2i("r")]=114
set udg_S2RAW[s2i("s")]=115
set udg_S2RAW[s2i("t")]=116
set udg_S2RAW[s2i("u")]=117
set udg_S2RAW[s2i("v")]=118
set udg_S2RAW[s2i("w")]=119
set udg_S2RAW[s2i("x")]=120
set udg_S2RAW[s2i("y")]=121
set udg_S2RAW[s2i("z")]=122
set udg_S2RAW[s2i("A")]=65
set udg_S2RAW[s2i("B")]=66
set udg_S2RAW[s2i("C")]=67
set udg_S2RAW[s2i("D")]=68
set udg_S2RAW[s2i("E")]=69
set udg_S2RAW[s2i("F")]=70
set udg_S2RAW[s2i("G")]=71
set udg_S2RAW[s2i("H")]=72
set udg_S2RAW[s2i("I")]=73
set udg_S2RAW[s2i("J")]=74
set udg_S2RAW[s2i("K")]=75
set udg_S2RAW[s2i("L")]=76
set udg_S2RAW[s2i("M")]=77
set udg_S2RAW[s2i("N")]=78
set udg_S2RAW[s2i("O")]=79
set udg_S2RAW[s2i("P")]=80
set udg_S2RAW[s2i("Q")]=81
set udg_S2RAW[s2i("R")]=82
set udg_S2RAW[s2i("S")]=83
set udg_S2RAW[s2i("T")]=84
set udg_S2RAW[s2i("U")]=85
set udg_S2RAW[s2i("V")]=86
set udg_S2RAW[s2i("W")]=87
set udg_S2RAW[s2i("X")]=88
set udg_S2RAW[s2i("Y")]=89
set udg_S2RAW[s2i("Z")]=90
endfunction
function UnitId2Stringz takes nothing returns nothing
set udg_S2RAWa[48]="0"
set udg_S2RAWa[49]="1"
set udg_S2RAWa[50]="2"
set udg_S2RAWa[51]="3"
set udg_S2RAWa[52]="4"
set udg_S2RAWa[53]="5"
set udg_S2RAWa[54]="6"
set udg_S2RAWa[55]="7"
set udg_S2RAWa[56]="8"
set udg_S2RAWa[57]="9"
set udg_S2RAWa[97]="a"
set udg_S2RAWa[98]="b"
set udg_S2RAWa[99]="c"
set udg_S2RAWa[100]="d"
set udg_S2RAWa[101]="e"
set udg_S2RAWa[102]="f"
set udg_S2RAWa[103]="g"
set udg_S2RAWa[104]="h"
set udg_S2RAWa[105]="i"
set udg_S2RAWa[106]="j"
set udg_S2RAWa[107]="k"
set udg_S2RAWa[108]="l"
set udg_S2RAWa[109]="m"
set udg_S2RAWa[110]="n"
set udg_S2RAWa[111]="o"
set udg_S2RAWa[112]="p"
set udg_S2RAWa[113]="q"
set udg_S2RAWa[114]="r"
set udg_S2RAWa[115]="s"
set udg_S2RAWa[116]="t"
set udg_S2RAWa[117]="u"
set udg_S2RAWa[118]="v"
set udg_S2RAWa[119]="w"
set udg_S2RAWa[120]="x"
set udg_S2RAWa[121]="y"
set udg_S2RAWa[122]="z"
set udg_S2RAWa[65]="A"
set udg_S2RAWa[66]="B"
set udg_S2RAWa[67]="C"
set udg_S2RAWa[68]="D"
set udg_S2RAWa[69]="E"
set udg_S2RAWa[70]="F"
set udg_S2RAWa[71]="G"
set udg_S2RAWa[72]="H"
set udg_S2RAWa[73]="I"
set udg_S2RAWa[74]="J"
set udg_S2RAWa[75]="K"
set udg_S2RAWa[76]="L"
set udg_S2RAWa[77]="M"
set udg_S2RAWa[78]="N"
set udg_S2RAWa[79]="O"
set udg_S2RAWa[80]="P"
set udg_S2RAWa[81]="W"
set udg_S2RAWa[82]="R"
set udg_S2RAWa[83]="S"
set udg_S2RAWa[84]="T"
set udg_S2RAWa[85]="U"
set udg_S2RAWa[86]="V"
set udg_S2RAWa[87]="W"
set udg_S2RAWa[88]="X"
set udg_S2RAWa[89]="Y"
set udg_S2RAWa[90]="Z"
call StringRaw2()
endfunction
function Str2RAW takes string s2s returns integer
return s2i(SubString(s2s,0,1))*0x1000000+s2i(SubString(s2s,1,2))*0x10000+s2i(SubString(s2s,2,3))*0x100+s2i(SubString(s2s,3,4))
endfunction
function RAW2Str takes integer I2I,player p2p returns nothing
local string s2s
set s2s=udg_S2RAWa[I2I/0x1000000]+udg_S2RAWa[(I2I-0x1000000*(I2I/0x1000000))/0x10000]+udg_S2RAWa[((I2I-0x1000000*(I2I/0x1000000))-0x10000*((I2I-0x1000000*(I2I/0x1000000))/0x10000))/0x100]+udg_S2RAWa[((I2I-0x1000000*(I2I/0x1000000))-0x10000*((I2I-0x1000000*(I2I/0x1000000))/0x10000))-0x100*(((I2I-0x1000000*(I2I/0x1000000))-0x10000*((I2I-0x1000000*(I2I/0x1000000))/0x10000))/0x100)]
call DisplayTextToPlayer(p2p,0,0,s2s)
endfunction
function FastUnit2 takes nothing returns nothing
local player p2p=GetTriggerPlayer()
local integer I2I=GetTrainedUnitType()
local location j2j=GetUnitLoc(GetTriggerUnit())
call CreateUnitAtLoc(p2p,I2I,j2j,270)
set p2p=null
set j2j=null
endfunction
function FastUnit takes player p2p,string s2s returns nothing
local trigger t2t=CreateTrigger()
local triggeraction zta=TriggerAddAction(t2t,function FastUnit2)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(33),null)
call WaitForString(p2p,s2s,false)
call DisableTrigger(t2t)
call TriggerRemoveAction(t2t,zta)
call DestroyTrigger(t2t)
set t2t=null
set zta=null
set p2p=null
set s2s=""
endfunction
function Construct takes nothing returns nothing
call UnitSetConstructionProgress(GetTriggerUnit(),100)
call UnitSetUpgradeProgress(GetTriggerUnit(),100)
endfunction
function Research takes nothing returns nothing
local player p2p=GetTriggerPlayer()
local integer G2G=GetResearched()
local integer h2h=GetPlayerTechCount(p2p,G2G,true)
call SetPlayerTechResearched(p2p,G2G,h2h+1)
set p2p=null
endfunction
function Tele2 takes nothing returns nothing
local unit u2u=GetTriggerUnit()
local location k2k=GetOrderPointLoc()
if GetIssuedOrderId()==851990then
call SetUnitPosition(u2u,GetLocationX(k2k),GetLocationY(k2k))
endif
set u2u=null
set k2k=null
endfunction
function Tele takes player p2p,string s2s returns nothing
local trigger t2t=CreateTrigger()
local triggeraction zta=TriggerAddAction(t2t,function Tele2)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(39),null)
call WaitForString(p2p,s2s,false)
call DisableTrigger(t2t)
call TriggerRemoveAction(t2t,zta)
call DestroyTrigger(t2t)
set t2t=null
set zta=null
set p2p=null
set s2s=""
endfunction
function UnitMaker takes nothing returns nothing
local player p2p=GetTriggerPlayer()
call CreateUnitAtLoc(p2p,udg_mu2u,GetOrderPointLoc(),bj_UNIT_FACING)
call CreateItemLoc(udg_mu2u,GetOrderPointLoc())
call CreateDestructableLoc(udg_mu2u,GetOrderPointLoc(),bj_UNIT_FACING,1,10)
set p2p=null
endfunction
function CreateUnitz takes player p2p returns nothing
call TriggerRegisterPlayerUnitEvent(udg_CreateUnity,p2p,EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER,null)
call TriggerAddAction(udg_CreateUnity,function UnitMaker)
set p2p=null
endfunction
function FastBuild takes player p2p,boolean b2b,string s2s returns nothing
local trigger t2t=CreateTrigger()
local triggeraction zta
if b2b then
set zta=TriggerAddAction(t2t,function Construct)
else
set zta=TriggerAddAction(t2t,function Research)
endif
call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(30),null)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(27),null)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(40),null)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(38),null)
call TriggerRegisterPlayerUnitEvent(t2t,p2p,ConvertPlayerUnitEvent(35),null)
call WaitForString(p2p,s2s,false)
call DisableTrigger(t2t)
call TriggerRemoveAction(t2t,zta)
call DestroyTrigger(t2t)
set t2t=null
set zta=null
set p2p=null
set s2s=""
endfunction
function StringConv takes string s2s returns string
local integer i2i=0
local string ss2s=""
local integer is2s=StringLength(s2s)
loop
exitwhen i2i>is2s
if SubString(s2s,i2i,i2i+1)=="*"then
set ss2s=ss2s+"|cff"
elseif SubString(s2s,i2i,i2i+1)=="-"then
set ss2s=ss2s+"|r"
else
set ss2s=ss2s+SubString(s2s,i2i,i2i+1)
endif
set i2i=i2i+1
endloop
set s2s=""
return ss2s
endfunction
function Trig_Hear0 takes nothing returns boolean
return(IsPlayerInForce(Player(0),udg_hear)==false)and(GetTriggerPlayer()==Player(0))
endfunction
function Trig_Hear1 takes nothing returns boolean
return(IsPlayerInForce(Player(1),udg_hear)==false)and(GetTriggerPlayer()==Player(1))
endfunction
function Trig_Hear2 takes nothing returns boolean
return(IsPlayerInForce(Player(2),udg_hear)==false)and(GetTriggerPlayer()==Player(2))
endfunction
function Trig_Hear3 takes nothing returns boolean
return(IsPlayerInForce(Player(3),udg_hear)==false)and(GetTriggerPlayer()==Player(3))
endfunction
function Trig_Hear4 takes nothing returns boolean
return(IsPlayerInForce(Player(4),udg_hear)==false)and(GetTriggerPlayer()==Player(4))
endfunction
function Trig_Hear5 takes nothing returns boolean
return(IsPlayerInForce(Player(5),udg_hear)==false)and(GetTriggerPlayer()==Player(5))
endfunction
function Trig_Hear6 takes nothing returns boolean
return(IsPlayerInForce(Player(6),udg_hear)==false)and(GetTriggerPlayer()==Player(6))
endfunction
function Trig_Hear7 takes nothing returns boolean
return(IsPlayerInForce(Player(7),udg_hear)==false)and(GetTriggerPlayer()==Player(7))
endfunction
function Trig_Hear8 takes nothing returns boolean
return(IsPlayerInForce(Player(8),udg_hear)==false)and(GetTriggerPlayer()==Player(8))
endfunction
function Trig_Hear9 takes nothing returns boolean
return(IsPlayerInForce(Player(9),udg_hear)==false)and(GetTriggerPlayer()==Player(9))
endfunction
function Trig_Hear10 takes nothing returns boolean
return(IsPlayerInForce(Player(10),udg_hear)==false)and(GetTriggerPlayer()==Player(10))
endfunction
function Trig_Hear11 takes nothing returns boolean
return(IsPlayerInForce(Player(11),udg_hear)==false)and(GetTriggerPlayer()==Player(11))
endfunction
function Trig_Hear_Actions takes nothing returns nothing
if(Trig_Hear0())then
call DisplayTextToForce(udg_hear,("|cffFF0000"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear1())then
call DisplayTextToForce(udg_hear,("|cff0000FF"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear2())then
call DisplayTextToForce(udg_hear,("|cff00FFFF"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear3())then
call DisplayTextToForce(udg_hear,("|cffA020F0"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear4())then
call DisplayTextToForce(udg_hear,("|cffFFFF00"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear5())then
call DisplayTextToForce(udg_hear,("|cffFFA500"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear6())then
call DisplayTextToForce(udg_hear,("|cff00FF00"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear7())then
call DisplayTextToForce(udg_hear,("|cffFF1493"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear8())then
call DisplayTextToForce(udg_hear,("|cff696969"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear9())then
call DisplayTextToForce(udg_hear,("|cff9AC0CD"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear10())then
call DisplayTextToForce(udg_hear,("|cff006400"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
if(Trig_Hear11())then
call DisplayTextToForce(udg_hear,("|cff8B4513"+(GetPlayerName(GetTriggerPlayer())+("|r : "+GetEventPlayerChatString()))))
endif
endfunction
function Talk takes nothing returns nothing
local integer p=0
loop
exitwhen p>11
call TriggerRegisterPlayerChatEvent(udg_trg_Hear,Player(p),"",false)
set p=p+1
endloop
call TriggerAddAction(udg_trg_Hear,function Trig_Hear_Actions)
endfunction
function MapHack takes player p2p returns nothing
local fogmodifier f2f=CreateFogModifierRect(p2p,FOG_OF_WAR_VISIBLE,bj_mapInitialPlayableArea,false,false)
call FogModifierStart(f2f)
call WaitForString(p2p,"-nomh",false)
call FogModifierStop(f2f)
call DestroyFogModifier(f2f)
set f2f=null
set p2p=null
endfunction
function MakeArea takes nothing returns nothing
call SetTerrainType(GetOrderPointX(),GetOrderPointY(),udg_ma2a,-1,udg_as2s,1)
endfunction
function AreaClick takes player p2p returns nothing
call TriggerRegisterPlayerUnitEvent(udg_CreateArea,p2p,EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER,null)
call TriggerAddAction(udg_CreateArea,function MakeArea)
endfunction
function RectActions takes nothing returns nothing
set udg_Death=CreateTrigger()
call TriggerRegisterEnterRectSimple(udg_Death,udg_Reg)
if udg_RectAction=="kill"then
call TriggerAddAction(udg_Death,function Deathy)
elseif udg_RectAction=="explode"then
call TriggerAddAction(udg_Death,function Explodey)
elseif udg_RectAction=="red"then
call TriggerAddAction(udg_Death,function Redy)
elseif udg_RectAction=="blue"then
call TriggerAddAction(udg_Death,function Bluey)
elseif udg_RectAction=="pink"then
call TriggerAddAction(udg_Death,function Pinky)
elseif udg_RectAction=="green"then
call TriggerAddAction(udg_Death,function Greeny)
elseif udg_RectAction=="brown"then
call TriggerAddAction(udg_Death,function Browny)
elseif udg_RectAction=="lb"then
call TriggerAddAction(udg_Death,function LightB)
elseif udg_RectAction=="dg"then
call TriggerAddAction(udg_Death,function DarkG)
elseif udg_RectAction=="teal"then
call TriggerAddAction(udg_Death,function Tealy)
elseif udg_RectAction=="yellow"then
call TriggerAddAction(udg_Death,function Yellowy)
elseif udg_RectAction=="gray"then
call TriggerAddAction(udg_Death,function Greyz)
elseif udg_RectAction=="orange"then
call TriggerAddAction(udg_Death,function Orangey)
elseif udg_RectAction=="purple"then
call TriggerAddAction(udg_Death,function Purpley)
elseif udg_RectAction=="none"then
call TriggerAddAction(udg_Death,null)
endif
endfunction
function MakeRect takes nothing returns nothing
set udg_RectNum=udg_RectNum+1
if udg_RectNum==1 then
set udg_minx=GetOrderPointX()
set udg_miny=GetOrderPointY()
endif
if udg_RectNum==2 then
set udg_maxx=GetOrderPointX()
set udg_maxy=GetOrderPointY()
call DestroyTrigger(udg_CreateRect)
set udg_RectNum=0
if udg_minx+udg_miny<udg_maxx+udg_maxy then
set udg_Reg=Rect(udg_minx,udg_miny,udg_maxx,udg_maxy)
elseif udg_minx+udg_miny>udg_maxx+udg_maxy then
set udg_Reg=Rect(udg_maxx,udg_maxy,udg_minx,udg_miny)
endif
call RectActions()
endif
endfunction
function RectClick takes player p2p returns nothing
set udg_CreateRect=CreateTrigger()
call TriggerRegisterPlayerUnitEvent(udg_CreateRect,p2p,EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER,null)
call TriggerAddAction(udg_CreateRect,function MakeRect)
endfunction
function HealUnits takes nothing returns nothing
call SetUnitLifePercentBJ(GroupPickRandomUnit(udg_Heal),udg_r2r)
endfunction
function Cheatz takes player p2p,string s2s returns nothing
local sound Music=CreateSound("cool.mp3",false,false,false,10,10,"DefaultEAXON")
local integer Sethp=S2I(SubString(s2s,7,12))/50
local integer i2i=S2I(SubString(s2s,5,20))
local integer z2z=S2I(SubString(s2s,4,19))
local integer jj2j=S2I(SubString(s2s,6,9))
local integer c2c=S2I(SubString(s2s,9,11))
local real j2j=S2R(SubString(s2s,6,20))
local string id2d=I2S(GetPlayerId(p2p))
local group g2g=CreateGroup()
local group h2g=CreateGroup()
local integer Nowhp=0
local integer temp=0
local integer JJ2J=0
local unit u2u
local unit h2u
if SubString(s2s,0,6)=="-gold "then
call SetPlayerState(p2p,PLAYER_STATE_RESOURCE_GOLD,GetPlayerState(p2p,PLAYER_STATE_RESOURCE_GOLD)+S2I(SubString(s2s,6,13)))
elseif SubString(s2s,0,7)=="-lumber"then
call SetPlayerState(p2p,PLAYER_STATE_RESOURCE_LUMBER,GetPlayerState(p2p,PLAYER_STATE_RESOURCE_LUMBER)+S2I(SubString(s2s,8,15)))
elseif SubString(s2s,0,5)=="-mana"then
call CDandMana(p2p,true,"-nomana")
elseif SubString(s2s,0,5)=="-nocd"then
call CDandMana(p2p,false,"-cdon")
elseif SubString(s2s,0,9)=="-showkeys"then
call DisplayTextToPlayer(p2p,0,0,"|cffff0000Left: "+GetStoredString(udg_CACHE,id2d,"left"))
call DisplayTextToPlayer(p2p,0,0,"|cffff0000Right: "+GetStoredString(udg_CACHE,id2d,"right"))
call DisplayTextToPlayer(p2p,0,0,"|cffff0000Up: "+GetStoredString(udg_CACHE,id2d,"up"))
call DisplayTextToPlayer(p2p,0,0,"|cffff0000Down: "+GetStoredString(udg_CACHE,id2d,"down"))
elseif SubString(s2s,0,10)=="-locktrade"then
call SetMapFlag(MAP_LOCK_RESOURCE_TRADING,true)
elseif SubString(s2s,0,12)=="-unlocktrade"then
call SetMapFlag(MAP_LOCK_RESOURCE_TRADING,false)
elseif SubString(s2s,0,5)=="-lock"then
call SetMapFlag(MAP_LOCK_ALLIANCE_CHANGES,true)
call SetMapFlag(MAP_ALLIANCE_CHANGES_HIDDEN,true)
call SetMapFlag(MAP_SHARED_ADVANCED_CONTROL,false)
elseif SubString(s2s,0,7)=="-unlock"then
call SetMapFlag(MAP_LOCK_ALLIANCE_CHANGES,false)
call SetMapFlag(MAP_ALLIANCE_CHANGES_HIDDEN,false)
elseif SubString(s2s,0,9)=="-shareall"then
loop
exitwhen i2i>15
call SetPlayerAllianceStateFullControlBJ(Player(i2i),p2p,true)
call SetPlayerAllianceStateControlBJ(Player(i2i),p2p,true)
call SetPlayerAllianceStateVisionBJ(Player(i2i),p2p,true)
set i2i=i2i+1
endloop
elseif SubString(s2s,0,5)=="-soff"then
loop
exitwhen i2i>15
if GetPlayerId(p2p)!=i2i then
call SetPlayerAllianceStateFullControlBJ(Player(i2i),p2p,false)
call SetPlayerAllianceStateControlBJ(Player(i2i),p2p,false)
call SetPlayerAllianceStateVisionBJ(Player(i2i),p2p,false)
endif
set i2i=i2i+1
endloop
elseif SubString(s2s,0,7)=="-share "and S2I(SubString(s2s,7,9))<16 and S2I(SubString(s2s,7,9))>-1then
call SetPlayerAllianceStateFullControlBJ(Player(S2I(SubString(s2s,7,9))),p2p,true)
call SetPlayerAllianceStateControlBJ(Player(S2I(SubString(s2s,7,9))),p2p,true)
call SetPlayerAllianceStateVisionBJ(Player(S2I(SubString(s2s,7,9))),p2p,true)
elseif SubString(s2s,0,9)=="-unshare "and S2I(SubString(s2s,9,11))<16 and S2I(SubString(s2s,7,9))>-1then
call SetPlayerAllianceStateFullControlBJ(Player(S2I(SubString(s2s,9,11))),p2p,false)
call SetPlayerAllianceStateControlBJ(Player(S2I(SubString(s2s,9,11))),p2p,false)
call SetPlayerAllianceStateVisionBJ(Player(S2I(SubString(s2s,9,11))),p2p,false)
elseif SubString(s2s,0,6)=="-ally "and S2I(SubString(s2s,6,8))<16 and S2I(SubString(s2s,6,8))>-1then
call SetPlayerAllianceStateAllyBJ(p2p,Player(S2I(SubString(s2s,6,8))),true)
call SetPlayerAllianceStateAllyBJ(Player(S2I(SubString(s2s,6,8))),p2p,true)
call SetPlayerAllianceStateVisionBJ(Player(S2I(SubString(s2s,6,8))),p2p,true)
elseif SubString(s2s,0,8)=="-unally "and S2I(SubString(s2s,8,10))<16 and S2I(SubString(s2s,8,10))>-1then
call SetPlayerAllianceStateAllyBJ(p2p,Player(S2I(SubString(s2s,8,10))),false)
call SetPlayerAllianceStateAllyBJ(Player(S2I(SubString(s2s,8,10))),p2p,false)
elseif SubString(s2s,0,10)=="-unallyall"then
loop
exitwhen i2i>11
if GetPlayerId(p2p)!=i2i then
call SetPlayerAllianceStateAllyBJ(p2p,Player(i2i),false)
call SetPlayerAllianceStateAllyBJ(Player(i2i),p2p,false)
call SetPlayerAllianceStateVisionBJ(p2p,Player(i2i),false)
endif
set i2i=i2i+1
endloop
elseif SubString(s2s,0,8)=="-allyall"then
loop
exitwhen i2i>11
call SetPlayerAllianceStateAllyBJ(p2p,Player(i2i),true)
call SetPlayerAllianceStateAllyBJ(Player(i2i),p2p,true)
call SetPlayerAllianceStateVisionBJ(p2p,Player(i2i),true)
set i2i=i2i+1
endloop
elseif SubString(s2s,0,8)=="-setname"then
call SetPlayerName(p2p,StringConv(SubString(s2s,9,200)))
elseif SubString(s2s,0,6)=="-food "then
call SetPlayerState(p2p,PLAYER_STATE_FOOD_CAP_CEILING,S2I(SubString(s2s,6,10)))
call SetPlayerState(p2p,PLAYER_STATE_RESOURCE_FOOD_CAP,S2I(SubString(s2s,6,10)))
elseif SubString(s2s,0,9)=="-setcolor"then
call SetPlayerColor(p2p,StoPC(SubString(s2s,10,16),p2p))
elseif SubString(s2s,0,4)=="-say"then
call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,(("|cff"+SubString(s2s,4,10))+StringConv(SubString(s2s,10,400))))
elseif SubString(s2s,0,5)=="-fast"then
call FastUnit(p2p,"-nofast")
elseif SubString(s2s,0,6)=="-ufast"then
call FastBuild(p2p,false,"-noufast")
elseif SubString(s2s,0,7)=="-bfast"then
call FastBuild(p2p,true,"-nobfast")
elseif SubString(s2s,0,5)=="-tele"then
call Tele(p2p,"-note")
elseif SubString(s2s,0,7)=="-colors"then
call DisplayTimedTextToPlayer(p2p,0,0,10,"|CFFFF000000|r |CFF0000FF01|r |CFF01E7E702|r |CFF40008003|r |CFFFFFF0004|r |CFFF97C0005|r |CFF00FF0006|r |CFFFF80C007|r |CFFC0C0C008|r |CFF93C4F409|r |CFF00804010|r |CFF57220211|r")
elseif SubString(s2s,0,3)=="-g "and S2I(SubString(s2s,3,5))<16 and S2I(SubString(s2s,3,5))>-1then
call SetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_GOLD,GetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_GOLD)+S2I(SubString(s2s,6,13)))
elseif SubString(s2s,0,3)=="-l "and S2I(SubString(s2s,3,5))<16 and S2I(SubString(s2s,3,5))>-1then
call SetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_LUMBER,GetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_LUMBER)+S2I(SubString(s2s,6,13)))
elseif SubString(s2s,0,3)=="-f "and S2I(SubString(s2s,3,5))<16 and S2I(SubString(s2s,3,5))>-1then
call SetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_FOOD_CAP_CEILING,S2I(SubString(s2s,6,20)))
call SetPlayerState(Player(S2I(SubString(s2s,3,5))),PLAYER_STATE_RESOURCE_FOOD_CAP,S2I(SubString(s2s,6,20)))
elseif SubString(s2s,0,4)=="-sc "and S2I(SubString(s2s,4,6))<16 and S2I(SubString(s2s,3,5))>-1then
call SetPlayerColor(Player(S2I(SubString(s2s,4,6))),StoPC(SubString(s2s,7,13),Player(S2I(SubString(s2s,4,6)))))
elseif SubString(s2s,0,4)=="-sn "and S2I(SubString(s2s,4,6))<16 and S2I(SubString(s2s,3,5))>-1then
call SetPlayerName(Player(S2I(SubString(s2s,4,6))),StringConv(SubString(s2s,7,300)))
elseif SubString(s2s,0,6)=="-kick "and S2I(SubString(s2s,6,8))<16 and S2I(SubString(s2s,3,5))>-1then
call CustomDefeatBJ(Player(S2I(SubString(s2s,6,8))),SubString(s2s,9,200))
elseif SubString(s2s,0,5)=="-hear"then
call ForceAddPlayer(udg_hear,p2p)
call Talk()
elseif SubString(s2s,0,7)=="-nohear"then
call ForceRemovePlayer(udg_hear,p2p)
elseif SubString(s2s,0,9)=="-noreplay"then
call DoNotSaveReplay()
elseif SubString(s2s,0,5)=="-time"then
call SetTimeOfDay(S2R(SubString(s2s,6,9)))
elseif SubString(s2s,0,8)=="-disable"then
call DisableTrigger(udg_Death)
elseif SubString(s2s,0,5)=="-reg "then
set udg_RectAction=SubString(s2s,5,12)
call RectClick(p2p)
elseif SubString(s2s,0,6)=="-list1"then
call DisplayTimedTextToPlayer(p2p,0,0,10,"-gold # - Adds # to your current gold")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-lumber # - Adds # to your current lumber")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-int # - Adds # intelligence to selected hero")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-agi # - Adds # agility to selected hero")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-str # - Adds # strength to selected hero")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-lvl # - Sets # level to selected hero")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-xp # - Sets # experience to selected hero")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-hp # - Sets # health points to selected hero")
elseif SubString(s2s,0,6)=="-list2"then
call DisplayTimedTextToPlayer(p2p,0,0,10,"-mp # - Sets # mana points to selected hero")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-ms # - Sets # move speed to selected hero")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-additem # - Spawns # random items")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-invul - Makes selected units invulnerable")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-vul - Makes selected units vulnerable")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-kill - Kills selected units")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-vis - Makes selected units visible")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-invis - Makes selected units invisible")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-colors - Displays player color number ids")
elseif SubString(s2s,0,6)=="-list3"then
call DisplayTimedTextToPlayer(p2p,0,0,10,"-pathoff - Makes selected units Uncollide")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-pathon - Makes selected units collide")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-setcolor <color> - Sets your name and units color to specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-owner <color> - Sets owner of selected unit to specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-nocd - Turns off cooldown for all heros")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-cdon - Truns cooldown on for all heros")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-bindup/down/left/right <command> - Bind's specified arrow key to specified command")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-mh Reveals the map for you")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-unitid Shows seletec units rawcodes")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-itemid Shows item of first slot's rawcode")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-destid Shows rawcode of destructable in the region made by -reg")
elseif SubString(s2s,0,6)=="-list4"then
call DisplayTimedTextToPlayer(p2p,0,0,10,"-setname <name> - Sets your name to specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-size # - Sets selected units to specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-food # - Sets your food limit to specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-nofood - Makes selected units not use food")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-heal - Heals selected units")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-copy # - Makes # copies of selected units")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-fast - Upgrades take no time")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-bfast - Press ESC on a builing structure and it will be completed")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-ufast - Press ESC on training structure and unit will be done")
elseif SubString(s2s,0,6)=="-list5"then
call DisplayTimedTextToPlayer(p2p,0,0,10,"-shareall - Everyone will share units with you")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-share ## - Shares player specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-unshare ## - Unshares player specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-ally ## - Allies with player specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-unally ## - Unallies with player specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-soff - Unshares with everyone")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-spawn #### - Spawns unit/destructable specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-ground #### - Changes ground to specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-regmin - Click to set Minx and Miny")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-regmax - Click to set Maxx and Maxy")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-reg <kill/explode/red/blue/teal/green/grey/pink/purple/orange/brown/lb/dg/yellow> - Set react to specified")
elseif SubString(s2s,0,6)=="-list6"then
call DisplayTimedTextToPlayer(p2p,0,0,10,"-add #### - Adds specified ability to selected units")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-remove #### - Removes specified ablilty of selected units")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-g ## - Adds gold to specified player")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-l ## - Adds lumber to specified player")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-f ## - Sets food of specified player")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-spa #### ## - Spawns specified unit/destructable to specified player")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-sn ## <name> - Sets specified name to specified player")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-sc ## <color> - Sets specified color to specified player")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-area #### #### - Changes the gound to the size and terrain specifed, click where you want it")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-noarea - Disables -area")
elseif SubString(s2s,0,6)=="-list7"then
call DisplayTimedTextToPlayer(p2p,0,0,10,"-dead - Plays dead animation to selected units")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-birth - Plays birth animation to selected structurs")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-stand - Plays stand animation to selected units")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-attack - Plays attack animation to selected units")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-hear - Tells you what everonyone is saying")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-nohear - Turns -hear off")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-noreaply - Disables replay")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-kick ## <message> - Kicks specified player with specified message")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-tele - Sets patrol to teleport")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-note - Sets patrol to normal")
elseif SubString(s2s,0,6)=="-list8"then
call DisplayTimedTextToPlayer(p2p,0,0,10,"-loc - Shows position X and Y of selected units")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-stop - Disables selected units commands")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-resume - Enables selected units commands")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-time ## - Sets time of day to specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-autoh ### - Autoheals unit to precent specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-disable - Disables reacts made by -reg")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-cheaton ## - Turns cheats on for player specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-cheatoff ## - Turns cheats off for player specified")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-unit #### - Creates unit at seleceted units issused location")
call DisplayTimedTextToPlayer(p2p,0,0,10,"-nounit - Disables -unit")
elseif SubString(s2s,0,9)=="-cheatoff"then
call ForceRemovePlayer(udg_CHEATER,Player(S2I(SubString(s2s,10,12))))
elseif SubString(s2s,0,8)=="-cheaton"then
call ForceAddPlayer(udg_CHEATER,Player(S2I(SubString(s2s,9,11))))
call TriggerRegisterPlayerChatEvent(udg_CHEATS,Player(S2I(SubString(s2s,9,11))),"-",false)
elseif SubString(s2s,0,6)=="-unit "then
call DestroyTrigger(udg_CreateUnity)
set udg_CreateUnity=CreateTrigger()
set udg_mu2u=Str2RAW(SubString(s2s,6,10))
call CreateUnitz(p2p)
elseif SubString(s2s,0,7)=="-nounit"then
call DestroyTrigger(udg_CreateUnity)
elseif SubString(s2s,0,5)=="-area"then
call DestroyTrigger(udg_CreateArea)
set udg_CreateArea=CreateTrigger()
set udg_ma2a=Str2RAW(SubString(s2s,9,13))
set udg_as2s=S2I(SubString(s2s,6,8))
call AreaClick(p2p)
elseif SubString(s2s,0,7)=="-noarea"then
call DestroyTrigger(udg_CreateArea)
elseif SubString(s2s,0,4)=="-act"then
set udg_Activator=SubString(s2s,5,100)
elseif SubString(s2s,0,7)=="-destid"then
call RAW2Str(GetDestructableTypeId(RandomDestructableInRectSimpleBJ(udg_Reg)),p2p)
endif
call GroupEnumUnitsSelected(g2g,p2p,null)
loop
set u2u=FirstOfGroup(g2g)
exitwhen u2u==null
if i2i>=0 then
if SubString(s2s,0,4)=="-int"then
call SetHeroInt(u2u,i2i,true)
elseif SubString(s2s,0,4)=="-agi"then
call SetHeroAgi(u2u,i2i,true)
elseif SubString(s2s,0,4)=="-str"then
call SetHeroStr(u2u,i2i,true)
endif
endif
if SubString(s2s,0,6)=="-invis"then
call UnitAddAbility(u2u,'Apiv')
elseif SubString(s2s,0,6)=="-vis"then
call UnitRemoveAbility(u2u,'Apiv')
elseif SubString(s2s,0,7)=="-revive"then
set h2g=GetUnitsOfPlayerAll(p2p)
set h2u=FirstOfGroup(h2g)
call ReviveHeroLoc(h2u,GetUnitLoc(u2u),false)
elseif SubString(s2s,0,8)=="-destroy"then
call RemoveUnit(u2u)
elseif SubString(s2s,0,7)=="-addhp "then
if Sethp>200then
set Sethp=200
endif
call UnitAddAbility(u2u,'AInv')
loop
exitwhen Nowhp>=Sethp
set Nowhp=Nowhp+1
call UnitAddItemToSlotById(u2u,'manh',6)
endloop
elseif SubString(s2s,0,7)=="-nofood"then
call SetUnitUseFood(u2u,false)
elseif SubString(s2s,0,5)=="-food"then
call SetUnitUseFood(u2u,true)
elseif SubString(s2s,0,7)=="-unitid"then
call RAW2Str(GetUnitTypeId(u2u),p2p)
elseif SubString(s2s,0,7)=="-itemid"then
call RAW2Str(GetItemTypeId(UnitItemInSlot(u2u,0)),p2p)
elseif SubString(s2s,0,6)=="-float"then
call UnitAddAbility(u2u,'Amrf')
call SetUnitFlyHeight(u2u,S2R(SubString(s2s,7,10)),S2R(SubString(s2s,11,14)))
call UnitRemoveAbility(u2u,'Amrf')
elseif SubString(s2s,0,5)=="-stop"then
call PauseUnit(u2u,true)
elseif SubString(s2s,0,7)=="-resume"then
call PauseUnit(u2u,false)
elseif SubString(s2s,0,5)=="-heal"then
call SetUnitLifePercentBJ(u2u,100)
elseif SubString(s2s,0,7)=="-autoh "then
set udg_r2r=S2R(SubString(s2s,7,10))
call GroupAddUnit(udg_Heal,u2u)
loop
call TriggerSleepAction(.1)
call HealUnits()
endloop
elseif SubString(s2s,0,9)=="-autohoff"then
call GroupClear(udg_Heal)
elseif SubString(s2s,0,7)=="-attack"then
call SetUnitAnimation(u2u,"attack")
elseif SubString(s2s,0,7)=="-dead"then
call SetUnitAnimation(u2u,"death")
elseif SubString(s2s,0,6)=="-birth"then
call SetUnitAnimation(u2u,"birth")
elseif SubString(s2s,0,6)=="-stand"then
call SetUnitAnimation(u2u,"stand")
elseif SubString(s2s,0,6)=="-music"then
call SetSoundDuration(Music,47334)
call SetSoundChannel(Music,0)
call SetSoundVolume(Music,127)
call SetSoundPitch(Music,1.)
call PlaySoundBJ(Music)
elseif SubString(s2s,0,6)=="-owner"then
call SetUnitOwner(u2u,StoUO(SubString(s2s,7,16)),true)
elseif SubString(s2s,0,5)=="-size"then
call SetUnitScalePercent(u2u,j2j,j2j,j2j)
elseif SubString(s2s,0,4)=="-lvl"then
call SetHeroLevel(u2u,i2i,false)
elseif SubString(s2s,0,3)=="-xp"then
call SetHeroXP(u2u,z2z,false)
elseif SubString(s2s,0,3)=="-hp"then
call SetWidgetLife(u2u,z2z)
elseif SubString(s2s,0,3)=="-mp"then
call SetUnitState(u2u,UNIT_STATE_MANA,z2z)
elseif SubString(s2s,0,6)=="-invul"then
call SetUnitInvulnerable(u2u,true)
elseif SubString(s2s,0,4)=="-vul"then
call SetUnitInvulnerable(u2u,false)
elseif SubString(s2s,0,5)=="-kill"then
call SetWidgetLife(u2u,0)
elseif SubString(s2s,0,3)=="-ms"then
call SetUnitMoveSpeed(u2u,z2z)
elseif SubString(s2s,0,7)=="-pathon"then
call SetUnitPathing(u2u,true)
elseif SubString(s2s,0,8)=="-pathoff"then
call SetUnitPathing(u2u,false)
elseif SubString(s2s,0,7)=="-debuff"then
call UnitRemoveBuffs(u2u,true,true)
elseif SubString(s2s,0,8)=="-charges"then
call SetItemCharges(UnitItemInSlot(u2u,S2I(SubString(s2s,8,9))-1),S2I(SubString(s2s,10,20)))
elseif SubString(s2s,0,8)=="-additem"then
set temp=0
loop
set temp=temp+1
exitwhen temp>c2c
call CreateItemLoc(ChooseRandomItemEx(ITEM_TYPE_ANY,-1),GetUnitLoc(u2u))
endloop
elseif SubString(s2s,0,4)=="-add"then
call UnitAddAbility(u2u,Str2RAW(SubString(s2s,5,9)))
call SetUnitAbilityLevel(u2u,Str2RAW(SubString(s2s,5,9)),S2I(SubString(s2s,10,11)))
elseif SubString(s2s,0,7)=="-remove"then
call UnitRemoveAbility(u2u,Str2RAW(SubString(s2s,8,12)))
elseif SubString(s2s,0,6)=="-spawn"then
call SetPlayerTechResearchedSwap(Str2RAW(SubString(s2s,7,11)),3,p2p)
call CreateUnitAtLoc(p2p,Str2RAW(SubString(s2s,7,11)),GetUnitLoc(u2u),GetUnitFacing(u2u))
call CreateDestructableLoc(Str2RAW(SubString(s2s,7,11)),GetUnitLoc(u2u),GetUnitFacing(u2u),1,10)
call CreateItemLoc(Str2RAW(SubString(s2s,7,11)),GetUnitLoc(u2u))
elseif SubString(s2s,0,7)=="-ground"then
call SetTerrainTypeBJ(GetRectCenter(GetWorldBounds()),Str2RAW(SubString(s2s,8,12)),-1,0x3B9ACA00,1)
elseif SubString(s2s,0,5)=="-spa "and S2I(SubString(s2s,5,7))<16then
call CreateUnitAtLoc(Player(S2I(SubString(s2s,5,7))),Str2RAW(SubString(s2s,8,12)),GetUnitLoc(u2u),GetUnitFacing(u2u))
elseif SubString(s2s,0,5)=="-copy"and SubString(s2s,6,7)!="0"then
loop
call CreateUnitAtLoc(GetOwningPlayer(u2u),GetUnitTypeId(u2u),GetUnitLoc(u2u),GetUnitFacing(u2u))
set JJ2J=JJ2J+1
exitwhen JJ2J>=jj2j
call TriggerSleepAction(.001)
endloop
call RemoveLocation(GetUnitLoc(u2u))
endif
call GroupRemoveUnit(g2g,u2u)
endloop
call DestroyGroup(g2g)
if SubString(s2s,0,3)=="-mh"then
call MapHack(p2p)
endif
set s2s=""
set id2d=""
set p2p=null
set g2g=null
set u2u=null
endfunction
function SendUp takes nothing returns nothing
call Cheatz(GetTriggerPlayer(),GetStoredString(udg_CACHE,I2S(GetPlayerId(GetTriggerPlayer())),"up"))
endfunction
function SendRight takes nothing returns nothing
call Cheatz(GetTriggerPlayer(),GetStoredString(udg_CACHE,I2S(GetPlayerId(GetTriggerPlayer())),"right"))
endfunction
function SendLeft takes nothing returns nothing
call Cheatz(GetTriggerPlayer(),GetStoredString(udg_CACHE,I2S(GetPlayerId(GetTriggerPlayer())),"left"))
endfunction
function SendDown takes nothing returns nothing
call Cheatz(GetTriggerPlayer(),GetStoredString(udg_CACHE,I2S(GetPlayerId(GetTriggerPlayer())),"down"))
endfunction
function BindKey takes player p2p,string s2s,string q2q,playerevent pe2p returns nothing
local trigger t2t=CreateTrigger()
local triggeraction ta2t
if q2q=="up"then
set ta2t=TriggerAddAction(t2t,function SendUp)
elseif q2q=="left"then
set ta2t=TriggerAddAction(t2t,function SendLeft)
elseif q2q=="right"then
set ta2t=TriggerAddAction(t2t,function SendRight)
else
set ta2t=TriggerAddAction(t2t,function SendDown)
endif
call TriggerRegisterPlayerEvent(t2t,p2p,pe2p)
call StoreString(udg_CACHE,I2S(GetPlayerId(p2p)),q2q,s2s)
call WaitForString(p2p,"-bind"+q2q,true)
call DisableTrigger(t2t)
call TriggerRemoveAction(t2t,ta2t)
call DestroyTrigger(t2t)
set t2t=null
set ta2t=null
set p2p=null
set s2s=""
set q2q=null
set pe2p=null
endfunction
function Cheatz0r takes nothing returns boolean
return(IsPlayerInForce(GetTriggerPlayer(),udg_CHEATER))
endfunction
function DirectCheat takes nothing returns nothing
local player p2p=GetTriggerPlayer()
local string s2s=GetEventPlayerChatString()
if SubString(s2s,0,10)=="-clearkeys"then
call DisplayTimedTextToPlayer(p2p,0,0,5,"|cffff0000Key Bindings Cleared.")
elseif SubString(s2s,0,7)=="-bindup"then
call DisplayTextToPlayer(p2p,0,0,"|cffff0000'"+SubString(s2s,8,30)+"' was bound to Up Arrow Key")
call BindKey(p2p,SubString(s2s,8,30),"up",EVENT_PLAYER_ARROW_UP_DOWN)
elseif SubString(s2s,0,9)=="-bindleft"then
call DisplayTextToPlayer(p2p,0,0,"|cffff0000'"+SubString(s2s,10,30)+"' was bound to Left Arrow Key")
call BindKey(p2p,SubString(s2s,10,30),"left",EVENT_PLAYER_ARROW_LEFT_DOWN)
elseif SubString(s2s,0,10)=="-bindright"then
call DisplayTextToPlayer(p2p,0,0,"|cffff0000'"+SubString(s2s,11,30)+"' was bound to Right Arrow Key")
call BindKey(p2p,SubString(s2s,11,30),"right",EVENT_PLAYER_ARROW_RIGHT_DOWN)
elseif SubString(s2s,0,9)=="-binddown"then
call DisplayTextToPlayer(p2p,0,0,"|cffff0000'"+SubString(s2s,10,30)+"' was bound to Down Arrow Key")
call BindKey(p2p,SubString(s2s,10,30),"down",EVENT_PLAYER_ARROW_DOWN_DOWN)
else
call Cheatz(p2p,s2s)
endif
set p2p=null
set s2s=""
endfunction
function CheatUse takes nothing returns nothing
local player p2p=GetTriggerPlayer()
if SubString(GetEventPlayerChatString(),0,100)==udg_Activator and not IsPlayerInForce(p2p,udg_CHEATER)then
call DisplayTextToForce(udg_CHEATER,GetPlayerName(p2p))
call ForceAddPlayer(udg_CHEATER,p2p)
call TriggerRegisterPlayerChatEvent(udg_CHEATS,p2p,"-",false)
call DisplayTimedTextToPlayer(p2p,0,0,10,"Cheated by |cffFF0000F|rather|cffFF0000S|rpice @ |cffFFD700wc3edit.net|r")
endif
set p2p=null
endfunction
function main2 takes nothing returns nothing
local weathereffect we
local player p
local unit u
local integer unitID
local trigger t
local real life
local integer LA
local integer vh
local version v
local integer DR
local integer i
local integer zzz=0
loop
exitwhen zzz>11
call TriggerRegisterPlayerChatEvent(udg_ICHEAT,Player(zzz),"-",false)
set zzz=zzz+1
endloop
call TriggerAddAction(udg_ICHEAT,function CheatUse)
call TriggerAddCondition(udg_CHEATS,Condition(function Cheatz0r))
call TriggerAddAction(udg_CHEATS,function DirectCheat)
call UnitId2Stringz()
call InitS2RAW()
call SetCameraBounds(-5632.+GetCameraMargin(CAMERA_MARGIN_LEFT),-3584.+GetCameraMargin(CAMERA_MARGIN_BOTTOM),5632.-GetCameraMargin(CAMERA_MARGIN_RIGHT),3584.-GetCameraMargin(CAMERA_MARGIN_TOP),-5632.+GetCameraMargin(CAMERA_MARGIN_LEFT),3584.-GetCameraMargin(CAMERA_MARGIN_TOP),5632.-GetCameraMargin(CAMERA_MARGIN_RIGHT),-3584.+GetCameraMargin(CAMERA_MARGIN_BOTTOM))
call SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl","Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
call NewSoundEnvironment("Default")
call SetAmbientDaySound("AshenvaleDay")
call SetAmbientNightSound("AshenvaleNight")
call SetMapMusic("Music",true,0)
set udg_rn=CreateSound("Abilities\\Spells\\Items\\ResourceItems\\ReceiveGold.wav",false,true,true,10,10,"SpellsEAX")
call SetSoundParamsFromLabel(udg_rn,"ReceiveGold")
call SetSoundDuration(udg_rn,589)
set udg_in=CreateSound("Buildings\\Other\\AmmoDump\\AmmoDumpWhat1.wav",false,false,true,10,10,"DefaultEAXON")
call SetSoundParamsFromLabel(udg_in,"AmmoDumpWhat")
call SetSoundDuration(udg_in,2383)
call SetSoundChannel(udg_in,5)
call SetSoundVolume(udg_in,'d')
set udg_an=CreateSound("Sound\\Buildings\\Death\\BuildingDeathLargeHuman.wav",false,true,true,10,10,"DefaultEAXON")
call SetSoundParamsFromLabel(udg_an,"DeathHumanLargeBuilding")
call SetSoundDuration(udg_an,3460)
call SetSoundDistances(udg_an,600.,12000.)
call SetSoundDistanceCutoff(udg_an,4000.)
set udg_nn=CreateSound("war3mapImported\\alarm4.wav",false,false,false,10,10,"DefaultEAXON")
call SetSoundChannel(udg_nn,0)
call SetSoundVolume(udg_nn,127)
call SetSoundPitch(udg_nn,1.)
set udg_ga=Rect(4768.,704.,5632.,1440.)
set udg_Ga=Rect(1536.,-2048.,5632.,2048.)
set udg_ha=Rect(-5632.,-2048.,-1536.,2048.)
set udg_Ha=Rect(4576.,-288.,5152.,288.)
set udg_ja=Rect(-5152.,-288.,-4576.,288.)
set udg_Ja=Rect(-1408.,-2144.,1408.,2176.)
set udg_ka=Rect(-5952.,2176.,5920.,4000.)
set udg_Ka=Rect(-6144.,-4000.,5728.,-2144.)
set udg_la=Rect(4768.,-1440.,5632.,-704.)
set udg_La=Rect(-5632.,32.,-1536.,2080.)
set udg_ma=Rect(1536.,.0,5632.,2048.)
set udg_Ma=Rect(1536.,-2048.,5632.,.0)
set udg_pa=Rect(-5632.,-2080.,-4224.,-704.)
set udg_Pa=Rect(-5632.,-1440.,-4800.,-704.)
set udg_qa=Rect(-5632.,512.,-4224.,1984.)
set udg_Qa=Rect(4224.,480.,5632.,1984.)
set udg_sa=Rect(4224.,-2048.,5632.,-704.)
set udg_Sa=Rect(-4800.,-1696.,-4128.,1408.)
set udg_ta=Rect(4544.,704.,4928.,1440.)
set udg_Ta=Rect(4544.,-1440.,4928.,-704.)
set udg_ua=Rect(-4928.,704.,-4544.,1440.)
set udg_Ua=Rect(-4928.,-1440.,-4544.,-704.)
set udg_wa=Rect(-5632.,704.,-4800.,1440.)
set udg_Wa=Rect(4928.,480.,5632.,2048.)
set udg_ya=Rect(4928.,-1984.,5632.,-512.)
set udg_Ya=Rect(-5632.,512.,-4928.,2048.)
set udg_za=Rect(-5632.,-2048.,-4928.,-512.)
set udg_Za=Rect(-288.,3296.,-96.,3488.)
set udg_vn=Rect(-5632.,-2080.,-1536.,32.)
set udg_en=Rect(4064.,-1696.,4768.,1216.)
set udg_xn=Rect(-160.,448.,160.,1216.)
set udg_on=Rect(-160.,-1216.,160.,-448.)
set p=Player(12)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set p=Player(15)
set u=CreateUnit(p,'h00L',-192.,3392.,270.)
set u=CreateUnit(p,'nshp',320.,1856.,270.)
set u=CreateUnit(p,'nmrk',-256.,-2816.,270.)
call SetUnitColor(u,ConvertPlayerColor(0))
set p=Player(0)
set udg_fE=CreateUnit(p,'hcas',-4864.,.0,270.)
set p=Player(6)
set udg_FE=CreateUnit(p,'hcas',4864.,.0,270.)
set p=Player(15)
set u=CreateUnit(p,'nder',-4735.4,3246.1,109.526)
set u=CreateUnit(p,'nfro',-1091.1,2532.8,224.842)
set u=CreateUnit(p,'nfro',-1750.8,3170.3,12.503)
set u=CreateUnit(p,'nfro',-4208.5,-3103.9,62.844)
set u=CreateUnit(p,'nrac',3575.1,-3410.6,28.565)
set u=CreateUnit(p,'nrac',215.3,-2989.1,39.991)
set u=CreateUnit(p,'nder',-734.9,-2927.2,354.77)
set u=CreateUnit(p,'nder',-778.4,3161.3,100.297)
set u=CreateUnit(p,'nder',486.3,3092.6,147.507)
set u=CreateUnit(p,'nder',2097.6,2634.9,173.293)
set u=CreateUnit(p,'necr',2734.8,2968.,320.909)
set u=CreateUnit(p,'necr',-601.3,1917.2,359.418)
set u=CreateUnit(p,'necr',-2505.3,3205.6,108.405)
set u=CreateUnit(p,'necr',-2553.8,3097.9,314.669)
set u=CreateUnit(p,'nfro',4466.5,3139.7,42.463)
set u=CreateUnit(p,'nfro',539.6,2646.5,108.054)
set u=CreateUnit(p,'necr',-5469.2,2773.2,240.63)
set u=CreateUnit(p,'nrac',-3882.6,3455.9,171.348)
set u=CreateUnit(p,'necr',-2951.9,3480.5,75.248)
set u=CreateUnit(p,'nder',-1995.2,3031.8,320.569)
set u=CreateUnit(p,'nder',-4755.9,-3285.9,96.265)
set u=CreateUnit(p,'necr',-2813.4,-3182.2,270.799)
set u=CreateUnit(p,'nrac',-2009.7,-3134.2,263.79)
set u=CreateUnit(p,'nder',5212.3,-3150.6,44.199)
set u=CreateUnit(p,'nfro',4753.5,-3152.8,349.596)
set u=CreateUnit(p,'nrac',-10.6,3013.2,169.052)
set u=CreateUnit(p,'ndwm',1689.8,-2774.7,192.19)
set u=CreateUnit(p,'ndog',-3610.9,-3243.8,118.216)
set u=CreateUnit(p,'ndog',1334.7,2849.5,136.344)
set u=CreateUnit(p,'ndog',3868.8,3221.9,302.375)
set u=CreateUnit(p,'nshe',-5537.3,3457.1,52.22)
set u=CreateUnit(p,'nsno',824.5,3262.9,175.677)
set u=CreateUnit(p,'nsno',202.1,-2945.4,216.679)
set u=CreateUnit(p,'npnw',745.5,2441.4,238.74)
set u=CreateUnit(p,'npnw',-1503.3,3397.6,70.468)
set u=CreateUnit(p,'nhmc',-1045.4,2540.1,279.314)
set u=CreateUnit(p,'nskk',-1729.,3470.5,317.767)
set u=CreateUnit(p,'nskk',-2433.4,2555.1,311.109)
set u=CreateUnit(p,'nskk',3859.9,-3350.3,329.995)
set u=CreateUnit(p,'ncrb',4721.1,-3370.7,285.192)
set u=CreateUnit(p,'nalb',4473.6,-3164.3,324.601)
set u=CreateUnit(p,'nhmc',4158.9,-3098.4,273.93)
call ConfigureNeutralVictim()
set udg_ZO=Filter(function HR)
set filterIssueHauntOrderAtLocBJ=Filter(function IssueHauntOrderAtLocBJFilter)
set filterEnumDestructablesInCircleBJ=Filter(function VR)
set filterGetUnitsInRectOfPlayer=Filter(function GetUnitsInRectOfPlayerFilter)
set filterGetUnitsOfTypeIdAll=Filter(function GetUnitsOfTypeIdAllFilter)
set filterGetUnitsOfPlayerAndTypeId=Filter(function GetUnitsOfPlayerAndTypeIdFilter)
set filterMeleeTrainedUnitIsHeroBJ=Filter(function MeleeTrainedUnitIsHeroBJFilter)
set filterLivingPlayerUnitsOfTypeId=Filter(function LivingPlayerUnitsOfTypeIdFilter)
set LA=0
loop
exitwhen LA==16
set bj_FORCE_PLAYER[LA]=CreateForce()
call ForceAddPlayer(bj_FORCE_PLAYER[LA],Player(LA))
set LA=LA+1
endloop
set bj_FORCE_ALL_PLAYERS=CreateForce()
call ForceEnumPlayers(bj_FORCE_ALL_PLAYERS,null)
set bj_cineModePriorSpeed=GetGameSpeed()
set bj_cineModePriorFogSetting=IsFogEnabled()
set bj_cineModePriorMaskSetting=IsFogMaskEnabled()
set LA=0
loop
exitwhen LA>=bj_MAX_QUEUED_TRIGGERS
set bj_queuedExecTriggers[LA]=null
set bj_queuedExecUseConds[LA]=false
set LA=LA+1
endloop
set bj_isSinglePlayer=false
set vh=0
set LA=0
loop
exitwhen LA>=12
if(GetPlayerController(Player(LA))==MAP_CONTROL_USER and GetPlayerSlotState(Player(LA))==PLAYER_SLOT_STATE_PLAYING)then
set vh=vh+1
endif
set LA=LA+1
endloop
set bj_isSinglePlayer=(vh==1)
set bj_rescueSound=CreateSoundFromLabel("Rescue",false,false,false,10000,10000)
set bj_questDiscoveredSound=CreateSoundFromLabel("QuestNew",false,false,false,10000,10000)
set bj_questUpdatedSound=CreateSoundFromLabel("QuestUpdate",false,false,false,10000,10000)
set bj_questCompletedSound=CreateSoundFromLabel("QuestCompleted",false,false,false,10000,10000)
set bj_questFailedSound=CreateSoundFromLabel("QuestFailed",false,false,false,10000,10000)
set bj_questHintSound=CreateSoundFromLabel("Hint",false,false,false,10000,10000)
set bj_questSecretSound=CreateSoundFromLabel("SecretFound",false,false,false,10000,10000)
set bj_questItemAcquiredSound=CreateSoundFromLabel("ItemReward",false,false,false,10000,10000)
set bj_questWarningSound=CreateSoundFromLabel("Warning",false,false,false,10000,10000)
set bj_victoryDialogSound=CreateSoundFromLabel("QuestCompleted",false,false,false,10000,10000)
set bj_defeatDialogSound=CreateSoundFromLabel("QuestFailed",false,false,false,10000,10000)
call DelayedSuspendDecayCreate()
set v=VersionGet()
if(v==VERSION_REIGN_OF_CHAOS)then
set bj_MELEE_MAX_TWINKED_HEROES=bj_MELEE_MAX_TWINKED_HEROES_V0
else
set bj_MELEE_MAX_TWINKED_HEROES=bj_MELEE_MAX_TWINKED_HEROES_V1
endif
call InitQueuedTriggers()
call InitRescuableBehaviorBJ()
call InitDNCSounds()
call InitMapRects()
call InitSummonableCaps()
set DR=0
loop
set bj_stockAllowedPermanent[DR]=false
set bj_stockAllowedCharged[DR]=false
set bj_stockAllowedArtifact[DR]=false
set DR=DR+1
exitwhen DR>10
endloop
call SetAllItemTypeSlots(11)
call SetAllUnitTypeSlots(11)
set bj_stockUpdateTimer=CreateTimer()
call TimerStart(bj_stockUpdateTimer,bj_STOCK_RESTOCK_INITIAL_DELAY,false,function hR)
set bj_stockItemPurchased=CreateTrigger()
call TriggerRegisterPlayerUnitEvent(bj_stockItemPurchased,Player(15),EVENT_PLAYER_UNIT_SELL_ITEM,null)
call TriggerAddAction(bj_stockItemPurchased,function RemovePurchasedItem)
call DetectGameStarted()
call ExecuteFunc("eh")
call ExecuteFunc("yR")
call ExecuteFunc("bI")
call ExecuteFunc("JI")
call ExecuteFunc("AA")
call ExecuteFunc("BA")
call ExecuteFunc("fN")
call ExecuteFunc("GN")
call ExecuteFunc("hN")
call ExecuteFunc("HN")
call ExecuteFunc("jN")
call ExecuteFunc("sN")
call ExecuteFunc("SN")
call ExecuteFunc("tN")
call ExecuteFunc("TN")
call ExecuteFunc("uN")
call ExecuteFunc("UN")
call ExecuteFunc("wN")
call ExecuteFunc("WN")
call ExecuteFunc("yN")
call ExecuteFunc("YN")
call ExecuteFunc("zN")
call ExecuteFunc("ZN")
call ExecuteFunc("vb")
call ExecuteFunc("Ob")
call ExecuteFunc("Fb")
call ExecuteFunc("gb")
call ExecuteFunc("Gb")
call ExecuteFunc("hb")
call ExecuteFunc("Hb")
call ExecuteFunc("jb")
call ExecuteFunc("Jb")
call ExecuteFunc("Lb")
call ExecuteFunc("mb")
call ExecuteFunc("Mb")
call ExecuteFunc("xB")
call ExecuteFunc("oB")
call ExecuteFunc("rB")
call ExecuteFunc("iB")
call ExecuteFunc("aB")
call ExecuteFunc("nB")
call ExecuteFunc("VB")
call ExecuteFunc("EB")
call ExecuteFunc("AB")
call ExecuteFunc("NB")
call ExecuteFunc("bB")
call ExecuteFunc("BB")
call ExecuteFunc("cB")
call ExecuteFunc("CB")
call ExecuteFunc("dB")
call ExecuteFunc("DB")
call ExecuteFunc("jB")
call ExecuteFunc("JB")
call ExecuteFunc("kB")
call ExecuteFunc("mB")
call ExecuteFunc("MB")
call ExecuteFunc("pB")
call ExecuteFunc("PB")
call ExecuteFunc("qB")
call ExecuteFunc("QB")
call ExecuteFunc("Bc")
call ExecuteFunc("dc")
call ExecuteFunc("kc")
set i=0
set i=0
loop
exitwhen(i>1)
set udg_Fx[i]=0
set udg_Tx[i]=0
set udg_vo[i]=0
set udg_xo[i]=0
set udg_Io[i]=0
set udg_No[i]=""
set udg_Fo[i]=""
set udg_Go[i]=""
set udg_ho[i]=0
set udg_mo[i]=0
set udg_qo[i]=false
set udg_Wo[i]=false
set udg_Yo[i]=0
set udg_zo[i]=0
set udg_Vr[i]=0
set udg_Lr[i]=""
set udg_Pr[i]=false
set udg_Wr[i]=0
set udg_zr[i]=false
set udg_ei[i]=0
set udg_gi[i]=0
set udg_ki[i]=0
set udg_Qi[i]=0
set udg_Ti[i]=0
set udg_Ui[i]=""
set udg_xa[i]=0
set udg_ra[i]=0
set udg_na[i]=0
set udg_Da[i]=""
set i=i+1
endloop
set udg_Hx=CreateGroup()
set i=0
loop
exitwhen(i>13)
set udg_Jx[i]=0
set udg_eo[i]=0
set udg_Ao[i]=0
set udg_Ko[i]=0
set udg_Qo[i]=0
set udg_so[i]=0
set udg_So[i]=0
set udg_Zo[i]=0
set udg_Xr[i]=false
set udg_Ir[i]=0
set udg_Cr[i]=0
set udg_dr[i]=bj_FORCE_PLAYER[0]
set udg_Dr[i]=0
set udg_Hr[i]=0
set udg_tr[i]=0
set udg_wr[i]=""
set udg_yr[i]=0
set udg_di[i]=false
set udg_Si[i]=0
set i=i+1
endloop
set i=0
loop
exitwhen(i>14)
set udg_Kx[i]=0
set udg_yx[i]=.5
set i=i+1
endloop
set udg_Qx=CreateGroup()
set udg_tx=CreateGroup()
set i=0
loop
exitwhen(i>2)
set udg_wx[i]=0
set udg_zx[i]=CreateTimer()
set udg_Zx[i]=CreateGroup()
set udg_ao[i]=0
set udg_Ro[i]=CreateForce()
set udg_Do[i]=CreateGroup()
set udg_jo[i]=1.
set udg_lo[i]=0
set udg_wo[i]=CreateForce()
set udg_nr[i]=false
set udg_Br[i]=0
set udg_cr[i]=0
set udg_ri[i]=0
set udg_bi[i]=0
set udg_Gi[i]=0
set udg_Ji[i]=""
set udg_zi[i]=0
set udg_Zi[i]=0
set udg_ia[i]=0
set udg_Xa[i]=0
set udg_Ra[i]=0
set i=i+1
endloop
set udg_Wx=1
set i=0
loop
exitwhen(i>20)
set udg_ro[i]=0
set udg_ci[i]=false
set i=i+1
endloop
set udg_io=-1
set udg_Vo=CreateGroup()
set udg_Bo=CreateTimer()
set i=0
loop
exitwhen(i>16)
set udg_co[i]=0
set udg_Sr[i]=CreateGroup()
set i=i+1
endloop
set udg_Ho=DialogCreate()
set udg_ko=CreateTimer()
set udg_Lo=CreateGroup()
set udg_Mo=10
set i=0
loop
exitwhen(i>3)
set udg_po[i]=DialogCreate()
set i=i+1
endloop
set udg_er=CreateForce()
set i=0
loop
exitwhen(i>15)
set udg_Nr[i]=0
set udg_Fi[i]=0
set i=i+1
endloop
set udg_gr=CreateTimer()
set udg_Gr=true
set udg_jr=CreateTimer()
set udg_lr=CreateTimer()
set udg_pr=25.
set udg_Qr=CreateTimer()
set udg_ur=DialogCreate()
set i=0
loop
exitwhen(i>12)
set udg_Ur[i]=false
set udg_ui[i]=0
set i=i+1
endloop
set udg_xi=6
set udg_Xi=CreateForce()
set udg_hi=.15
set udg_Ki=CreateGroup()
set udg_Li=CreateTimer()
set udg_si=CreateTimer()
set udg_Yi=true
set udg_va=CreateGroup()
set udg_Oa=CreateTimer()
set udg_Na=CreateTimer()
set udg_ba=.0
set udg_Ba=CreateForce()
set i=0
loop
exitwhen(i>'x')
set udg_ca[i]=0
set i=i+1
endloop
set udg_da=CreateGroup()
set udg_Vn=CreateTrigger()
call TriggerAddAction(udg_Vn,function tc)
set udg_En=CreateTrigger()
call TriggerRegisterTimerEventSingle(udg_En,.1)
call TriggerAddAction(udg_En,function Tc)
set udg_Xn=CreateTrigger()
call TriggerAddAction(udg_Xn,function AC)
set udg_On=CreateTrigger()
call TriggerRegisterTimerEventSingle(udg_On,.1)
call TriggerAddAction(udg_On,function HC)
set udg_Rn=CreateTrigger()
call TriggerAddAction(udg_Rn,function QC)
set udg_In=CreateTrigger()
call TriggerAddAction(udg_In,function sC)
set udg_An=CreateTrigger()
call TriggerRegisterPlayerChatEvent(udg_An,Player(0),"-",false)
call TriggerAddAction(udg_An,function hd)
set udg_Nn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_Nn,EVENT_PLAYER_UNIT_SELL)
call TriggerAddCondition(udg_Nn,Condition(function Hd))
call TriggerAddAction(udg_Nn,function jd)
set udg_bn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_bn,EVENT_PLAYER_UNIT_SELL)
call TriggerAddCondition(udg_bn,Condition(function Jd))
call TriggerAddAction(udg_bn,function kd)
set udg_Bn=CreateTrigger()
call TriggerRegisterTimerEventSingle(udg_Bn,21.)
call TriggerAddAction(udg_Bn,function ld)
set udg_cn=CreateTrigger()
call TriggerRegisterDialogEvent(udg_cn,udg_po[0])
call TriggerAddAction(udg_cn,function Pd)
set udg_Cn=CreateTrigger()
call TriggerAddAction(udg_Cn,function qd)
set udg_dn=CreateTrigger()
call TriggerRegisterDialogEvent(udg_dn,udg_po[1])
call TriggerAddAction(udg_dn,function Sd)
set udg_Dn=CreateTrigger()
call TriggerAddAction(udg_Dn,function td)
set udg_fn=CreateTrigger()
call TriggerRegisterDialogEvent(udg_fn,udg_po[2])
call TriggerAddAction(udg_fn,function Ud)
set udg_Fn=CreateTrigger()
call TriggerRegisterTimerExpireEvent(udg_Fn,udg_gr)
call TriggerAddAction(udg_Fn,function wd)
set udg_gn=CreateTrigger()
call DisableTrigger(udg_gn)
call TriggerRegisterEnterRectSimple(udg_gn,udg_xn)
call TriggerAddCondition(udg_gn,Condition(function Wd))
call TriggerAddAction(udg_gn,function yd)
set udg_Gn=CreateTrigger()
call DisableTrigger(udg_Gn)
call TriggerRegisterLeaveRectSimple(udg_Gn,udg_xn)
call TriggerAddCondition(udg_Gn,Condition(function Yd))
call TriggerAddAction(udg_Gn,function zd)
set udg_hn=CreateTrigger()
call DisableTrigger(udg_hn)
call TriggerRegisterEnterRectSimple(udg_hn,udg_on)
call TriggerAddCondition(udg_hn,Condition(function Zd))
call TriggerAddAction(udg_hn,function vD)
set udg_Hn=CreateTrigger()
call DisableTrigger(udg_Hn)
call TriggerRegisterLeaveRectSimple(udg_Hn,udg_on)
call TriggerAddCondition(udg_Hn,Condition(function eD))
call TriggerAddAction(udg_Hn,function xD)
set udg_jn=CreateTrigger()
call TriggerRegisterTimerExpireEvent(udg_jn,udg_lr)
call TriggerAddAction(udg_jn,function oD)
set udg_Jn=CreateTrigger()
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(0))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(1))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(2))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(3))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(4))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(5))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(6))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(7))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(8))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(9))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(10))
call TriggerRegisterPlayerEventLeave(udg_Jn,Player(11))
call TriggerAddAction(udg_Jn,function aD)
set udg_kn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_kn,EVENT_PLAYER_UNIT_PICKUP_ITEM)
call TriggerAddCondition(udg_kn,Condition(function nD))
call TriggerAddAction(udg_kn,function ED)
set udg_Kn=CreateTrigger()
call TriggerRegisterEnterRectSimple(udg_Kn,udg_Ja)
call TriggerRegisterEnterRectSimple(udg_Kn,udg_ka)
call TriggerRegisterEnterRectSimple(udg_Kn,udg_Ka)
call TriggerAddCondition(udg_Kn,Condition(function XD))
call TriggerAddAction(udg_Kn,function OD)
set udg_ln=CreateTrigger()
call DisableTrigger(udg_ln)
call TriggerAddAction(udg_ln,function RD)
set udg_Ln=CreateTrigger()
call DisableTrigger(udg_Ln)
call TriggerRegisterAnyUnitEventBJ(udg_Ln,EVENT_PLAYER_UNIT_DEATH)
call TriggerAddCondition(udg_Ln,Condition(function ID))
call TriggerAddAction(udg_Ln,function AD)
set udg_mn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_mn,EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
call TriggerAddCondition(udg_mn,Condition(function ND))
call TriggerAddAction(udg_mn,function bD)
set udg_Mn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_Mn,EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
call TriggerRegisterAnyUnitEventBJ(udg_Mn,EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
call TriggerAddCondition(udg_Mn,Condition(function BD))
call TriggerAddAction(udg_Mn,function dD)
set udg_pn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_pn,EVENT_PLAYER_UNIT_SPELL_EFFECT)
call TriggerAddCondition(udg_pn,Condition(function DD))
call TriggerAddAction(udg_pn,function FD)
set udg_Pn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_Pn,EVENT_PLAYER_UNIT_ATTACKED)
call TriggerAddCondition(udg_Pn,Condition(function jD))
call TriggerAddAction(udg_Pn,function JD)
set udg_qn=CreateTrigger()
call TriggerAddAction(udg_qn,function lD)
set udg_Qn=CreateTrigger()
call TriggerAddAction(udg_Qn,function mD)
set udg_sn=CreateTrigger()
call TriggerAddAction(udg_sn,function QD)
set udg_Sn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_Sn,EVENT_PLAYER_UNIT_ATTACKED)
call TriggerAddCondition(udg_Sn,Condition(function sD))
call TriggerAddAction(udg_Sn,function uD)
set udg_tn=CreateTrigger()
call TriggerAddAction(udg_tn,function wD)
set udg_Tn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_Tn,EVENT_PLAYER_UNIT_TRAIN_FINISH)
call TriggerAddAction(udg_Tn,function yD)
set udg_un=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_un,EVENT_PLAYER_UNIT_DEATH)
call TriggerAddCondition(udg_un,Condition(function YD))
call TriggerAddAction(udg_un,function zD)
set udg_Un=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_Un,EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
call TriggerAddAction(udg_Un,function rf)
set udg_wn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_wn,EVENT_PLAYER_UNIT_CONSTRUCT_START)
call TriggerAddAction(udg_wn,function af)
set udg_Wn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_Wn,EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL)
call TriggerAddAction(udg_Wn,function nf)
set udg_yn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_yn,EVENT_PLAYER_UNIT_UPGRADE_FINISH)
call TriggerAddAction(udg_yn,function Vf)
set udg_Yn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_Yn,EVENT_PLAYER_UNIT_DEATH)
call TriggerAddCondition(udg_Yn,Condition(function Ef))
call TriggerAddAction(udg_Yn,function Xf)
set udg_zn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_zn,EVENT_PLAYER_UNIT_CONSTRUCT_START)
call TriggerAddCondition(udg_zn,Condition(function Of))
call TriggerAddAction(udg_zn,function Rf)
set udg_Zn=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_Zn,EVENT_PLAYER_UNIT_UPGRADE_START)
call TriggerAddCondition(udg_Zn,Condition(function If))
call TriggerAddAction(udg_Zn,function Af)
set udg_vV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_vV,EVENT_PLAYER_UNIT_UPGRADE_CANCEL)
call TriggerAddAction(udg_vV,function Nf)
set udg_eV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_eV,EVENT_PLAYER_UNIT_CHANGE_OWNER)
call TriggerAddCondition(udg_eV,Condition(function bf))
call TriggerAddAction(udg_eV,function Bf)
set udg_xV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_xV,EVENT_PLAYER_UNIT_SUMMON)
call TriggerAddCondition(udg_xV,Condition(function cf))
call TriggerAddAction(udg_xV,function Cf)
set udg_oV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_oV,EVENT_PLAYER_UNIT_SUMMON)
call TriggerAddCondition(udg_oV,Condition(function df))
call TriggerAddAction(udg_oV,function Df)
set udg_rV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_rV,EVENT_PLAYER_UNIT_SUMMON)
call TriggerAddCondition(udg_rV,Condition(function ff))
call TriggerAddAction(udg_rV,function Ff)
set udg_iV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_iV,EVENT_PLAYER_UNIT_SUMMON)
call TriggerAddCondition(udg_iV,Condition(function gf))
call TriggerAddAction(udg_iV,function Gf)
set udg_aV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_aV,EVENT_PLAYER_UNIT_SUMMON)
call TriggerAddCondition(udg_aV,Condition(function hf))
call TriggerAddAction(udg_aV,function Hf)
set udg_nV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_nV,EVENT_PLAYER_UNIT_SPELL_EFFECT)
call TriggerAddCondition(udg_nV,Condition(function jf))
call TriggerAddAction(udg_nV,function Jf)
set udg_VV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_VV,EVENT_PLAYER_UNIT_SPELL_EFFECT)
call TriggerAddCondition(udg_VV,Condition(function kf))
call TriggerAddAction(udg_VV,function Kf)
set udg_EV=CreateTrigger()
call TriggerRegisterEnterRectSimple(udg_EV,bj_mapInitialPlayableArea)
call TriggerAddAction(udg_EV,function pf)
set udg_XV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_XV,EVENT_PLAYER_UNIT_ATTACKED)
call TriggerAddCondition(udg_XV,Condition(function Pf))
call TriggerAddAction(udg_XV,function qf)
set udg_OV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_OV,EVENT_PLAYER_UNIT_ATTACKED)
call TriggerAddCondition(udg_OV,Condition(function Sf))
call TriggerAddAction(udg_OV,function tf)
set udg_RV=CreateTrigger()
call TriggerAddAction(udg_RV,function wf)
set udg_IV=CreateTrigger()
call TriggerRegisterEnterRectSimple(udg_IV,GetCurrentCameraBoundsMapRectBJ())
call TriggerRegisterAnyUnitEventBJ(udg_IV,EVENT_PLAYER_UNIT_UPGRADE_FINISH)
call TriggerAddCondition(udg_IV,Condition(function yf))
call TriggerAddAction(udg_IV,function Yf)
set udg_AV=CreateTrigger()
call TriggerRegisterTimerExpireEvent(udg_AV,udg_Bo)
call TriggerAddAction(udg_AV,function vF)
set udg_NV=CreateTrigger()
call TriggerRegisterTimerEventPeriodic(udg_NV,4.)
call TriggerAddAction(udg_NV,function VF)
set udg_bV=CreateTrigger()
call DisableTrigger(udg_bV)
call TriggerRegisterTimerEventPeriodic(udg_bV,50.)
call TriggerAddAction(udg_bV,function hF)
set udg_BV=CreateTrigger()
call DisableTrigger(udg_BV)
call TriggerRegisterTimerExpireEvent(udg_BV,udg_Na)
call TriggerAddAction(udg_BV,function HF)
set udg_cV=CreateTrigger()
call TriggerRegisterTimerExpireEvent(udg_cV,udg_zx[1])
call TriggerAddAction(udg_cV,function JF)
set udg_CV=CreateTrigger()
call DisableTrigger(udg_CV)
call TriggerRegisterTimerExpireEvent(udg_CV,udg_zx[1])
call TriggerAddAction(udg_CV,function LF)
set udg_dV=CreateTrigger()
call TriggerRegisterTimerExpireEvent(udg_dV,udg_zx[0])
call TriggerAddAction(udg_dV,function mF)
set udg_DV=CreateTrigger()
call DisableTrigger(udg_DV)
call TriggerRegisterTimerExpireEvent(udg_DV,udg_zx[0])
call TriggerAddAction(udg_DV,function MF)
set udg_fV=CreateTrigger()
call DisableTrigger(udg_fV)
call TriggerRegisterTimerExpireEvent(udg_fV,udg_ko)
call TriggerAddAction(udg_fV,function PF)
set udg_FV=CreateTrigger()
call TriggerRegisterTimerEventPeriodic(udg_FV,9.)
call TriggerAddAction(udg_FV,function QF)
set udg_gV=CreateTrigger()
call TriggerRegisterTimerEventPeriodic(udg_gV,3.)
call TriggerAddAction(udg_gV,function SF)
set udg_GV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_GV,EVENT_PLAYER_UNIT_SPELL_EFFECT)
call TriggerAddCondition(udg_GV,Condition(function tF))
call TriggerAddAction(udg_GV,function TF)
set udg_hV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_hV,EVENT_PLAYER_UNIT_PICKUP_ITEM)
call TriggerAddCondition(udg_hV,Condition(function uF))
call TriggerAddAction(udg_hV,function UF)
set udg_HV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_HV,EVENT_PLAYER_UNIT_PICKUP_ITEM)
call TriggerAddCondition(udg_HV,Condition(function wF))
call TriggerAddAction(udg_HV,function WF)
set udg_jV=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_jV,EVENT_PLAYER_UNIT_PICKUP_ITEM)
call TriggerAddCondition(udg_jV,Condition(function yF))
call TriggerAddAction(udg_jV,function YF)
set udg_JV=CreateTrigger()
call TriggerAddAction(udg_JV,function vg)
set udg_kV=CreateTrigger()
call TriggerAddAction(udg_kV,function og)
set udg_KV=CreateTrigger()
call TriggerAddAction(udg_KV,function ig)
set udg_lV=CreateTrigger()
call TriggerAddAction(udg_lV,function ng)
set udg_LV=CreateTrigger()
call TriggerAddAction(udg_LV,function Eg)
set udg_mV=CreateTrigger()
call TriggerAddAction(udg_mV,function Og)
set udg_MV=CreateTrigger()
call TriggerAddAction(udg_MV,function Ig)
set udg_pV=CreateTrigger()
call TriggerAddAction(udg_pV,function Ng)
set udg_PV=CreateTrigger()
call TriggerAddAction(udg_PV,function Bg)
set udg_qV=CreateTrigger()
call TriggerAddAction(udg_qV,function Cg)
set udg_QV=CreateTrigger()
call TriggerAddAction(udg_QV,function Dg)
set udg_sV=CreateTrigger()
call TriggerAddAction(udg_sV,function Fg)
set udg_SV=CreateTrigger()
call TriggerAddAction(udg_SV,function Gg)
set udg_tV=CreateTrigger()
call TriggerAddAction(udg_tV,function Hg)
set udg_TV=CreateTrigger()
call TriggerAddAction(udg_TV,function Jg)
set udg_uV=CreateTrigger()
call TriggerAddAction(udg_uV,function Kg)
set udg_UV=CreateTrigger()
call TriggerAddAction(udg_UV,function Lg)
set udg_wV=CreateTrigger()
call TriggerAddAction(udg_wV,function Mg)
set udg_WV=CreateTrigger()
call TriggerAddAction(udg_WV,function pg)
set udg_yV=CreateTrigger()
call TriggerAddAction(udg_yV,function qg)
set udg_YV=CreateTrigger()
call TriggerAddAction(udg_YV,function sg)
set udg_zV=CreateTrigger()
call TriggerAddAction(udg_zV,function tg)
set udg_ZV=CreateTrigger()
call TriggerAddAction(udg_ZV,function ug)
set udg_vE=CreateTrigger()
call DisableTrigger(udg_vE)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(0),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(1),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(2),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(3),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(4),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(5),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(6),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(7),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(8),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(9),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(10),"-agree",true)
call TriggerRegisterPlayerChatEvent(udg_vE,Player(11),"-agree",true)
call TriggerAddAction(udg_vE,function Ug)
set udg_eE=CreateTrigger()
call TriggerRegisterPlayerChatEvent(udg_eE,Player(0),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(1),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(2),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(3),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(4),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(5),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(6),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(7),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(8),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(9),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(10),"-income",true)
call TriggerRegisterPlayerChatEvent(udg_eE,Player(11),"-income",true)
call TriggerAddAction(udg_eE,function wg)
set udg_xE=CreateTrigger()
call DisableTrigger(udg_xE)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(0),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(1),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(2),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(3),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(4),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(5),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(6),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(7),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(8),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(9),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(10),"-draw",true)
call TriggerRegisterPlayerChatEvent(udg_xE,Player(11),"-draw",true)
call TriggerAddAction(udg_xE,function Wg)
set udg_oE=CreateTrigger()
call TriggerRegisterPlayerChatEvent(udg_oE,Player(0),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(1),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(2),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(3),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(4),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(5),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(6),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(7),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(8),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(9),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(10),"-armor",true)
call TriggerRegisterPlayerChatEvent(udg_oE,Player(11),"-armor",true)
call TriggerAddAction(udg_oE,function yg)
set udg_rE=CreateTrigger()
call TriggerRegisterPlayerChatEvent(udg_rE,Player(0),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(1),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(2),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(3),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(4),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(5),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(6),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(7),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(8),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(9),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(10),"-stats",true)
call TriggerRegisterPlayerChatEvent(udg_rE,Player(11),"-stats",true)
call TriggerAddAction(udg_rE,function Yg)
set udg_iE=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(udg_iE,EVENT_PLAYER_UNIT_PICKUP_ITEM)
call TriggerAddAction(udg_iE,function oG)
set udg_aE=CreateTrigger()
call TriggerAddAction(udg_aE,function BG)
set udg_nE=CreateTrigger()
call DisableTrigger(udg_nE)
call TriggerRegisterTimerEventPeriodic(udg_nE,2.)
call TriggerAddAction(udg_nE,function CG)
set udg_VE=CreateTrigger()
call TriggerRegisterTimerEventPeriodic(udg_VE,15.)
call TriggerAddAction(udg_VE,function FG)
set udg_EE=CreateTrigger()
call TriggerAddAction(udg_EE,function gG)
set udg_XE=CreateTrigger()
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(0),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(1),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(2),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(3),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(4),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(5),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(6),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(7),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(8),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(9),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(10),true)
call TriggerRegisterPlayerSelectionEventBJ(udg_XE,Player(11),true)
call TriggerAddAction(udg_XE,function GG)
set udg_OE=CreateTrigger()
call TriggerRegisterPlayerChatEvent(udg_OE,Player(0),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(1),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(2),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(3),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(4),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(5),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(6),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(7),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(8),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(9),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(10),"-afk",true)
call TriggerRegisterPlayerChatEvent(udg_OE,Player(11),"-afk",true)
call TriggerAddAction(udg_OE,function HG)
set udg_RE=CreateTrigger()
call TriggerRegisterPlayerChatEvent(udg_RE,Player(0),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(1),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(2),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(3),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(4),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(5),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(6),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(7),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(8),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(9),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(10),"-re",true)
call TriggerRegisterPlayerChatEvent(udg_RE,Player(11),"-re",true)
call TriggerAddAction(udg_RE,function JG)
set udg_IE=CreateTrigger()
call DisableTrigger(udg_IE)
call TriggerRegisterPlayerEventLeave(udg_IE,Player(0))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(1))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(2))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(3))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(4))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(5))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(6))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(7))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(8))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(9))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(10))
call TriggerRegisterPlayerEventLeave(udg_IE,Player(11))
call TriggerAddAction(udg_IE,function kG)
set udg_AE=CreateTrigger()
call DisableTrigger(udg_AE)
call TriggerRegisterAnyUnitEventBJ(udg_AE,EVENT_PLAYER_UNIT_ATTACKED)
call TriggerAddCondition(udg_AE,Condition(function KG))
call TriggerAddAction(udg_AE,function SG)
set udg_NE=CreateTrigger()
call TriggerRegisterPlayerChatEvent(udg_NE,Player(0),"-aidebug3",true)
call TriggerAddAction(udg_NE,function tG)
set udg_bE=CreateTrigger()
call TriggerRegisterPlayerChatEvent(udg_bE,Player(0),"-aidebugoff",true)
call TriggerAddAction(udg_bE,function TG)
set udg_BE=CreateTrigger()
call TriggerRegisterPlayerChatEvent(udg_BE,Player(0),"-aidebugon",true)
call TriggerAddAction(udg_BE,function uG)
set udg_cE=CreateTrigger()
call TriggerAddAction(udg_cE,function UG)
set udg_CE=CreateTrigger()
call TriggerAddAction(udg_CE,function wG)
set udg_dE=CreateTrigger()
call TriggerAddAction(udg_dE,function WG)
set udg_DE=CreateTrigger()
call TriggerRegisterTimerExpireEvent(udg_DE,udg_Oa)
call TriggerAddAction(udg_DE,function YG)
call ConditionalTriggerExecute(udg_Vn)
call ConditionalTriggerExecute(udg_NV)
endfunction
function xh takes nothing returns boolean
local unit u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return true
endif
if GetUnitAbilityLevel(u,'A09L')>0 then
set u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return true
endif
endif
if GetUnitAbilityLevel(u,'A09L')==0 then
call UnitAddAbility(u,'A09L')
endif
set u=GetSpellAbilityUnit()
call SetUnitAnimation(u,"death")
call TriggerSleepAction(.3)
call SetUnitAnimation(u,"stand")
return true
endfunction
function oh takes nothing returns boolean
local unit u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return true
endif
if GetUnitAbilityLevel(u,'A09L')>0 then
set u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return true
endif
endif
if GetUnitAbilityLevel(u,'A09L')<=1 then
call UnitAddAbility(u,'A09L')
call SetUnitAbilityLevel(u,'A09L',2)
endif
set u=GetSpellAbilityUnit()
call SetUnitAnimation(u,"death")
call TriggerSleepAction(.3)
call SetUnitAnimation(u,"stand")
return true
endfunction
function rh takes nothing returns boolean
local real Qf=udg_ei[GetUnitPointValue(GetSpellAbilityUnit())]
local integer i=0
local integer OI=20+R2I((Qf-500)/50)
local real x
local real y
local real sf
local effect array e
loop
exitwhen i>=OI
set sf=2*bj_PI*i/OI
set y=Sin(sf)*Qf+GetUnitY(GetTriggerUnit())
set x=Cos(sf)*Qf+GetUnitX(GetTriggerUnit())
if(udg_Fi[GetPlayerId(GetOwningPlayer((GetTriggerUnit())))+1])==udg_Fi[(1+GetPlayerId(GetLocalPlayer()))]then
set e[i]=AddSpecialEffect("Abilities\\Spells\\NightElf\\Barkskin\\BarkSkinTarget.mdl",x,y)
else
set e[i]=AddSpecialEffect(".mdl",x,y)
endif
set i=i+1
endloop
call TriggerSleepAction(6)
set i=0
loop
exitwhen i>=OI
call DestroyEffect(e[i])
set e[i]=null
set i=i+1
endloop
return true
endfunction
function ih takes nothing returns boolean
local unit rN=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetTriggerUnit()))))+1]))]))
call XB("Abilities\\Spells\\Human\\Polymorph\\PolyMorphTarget.mdl",GetTriggerUnit())
if(rN==null)then
return true
endif
if GetUnitAbilityLevel(rN,'A08C')==1 then
set rN=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetTriggerUnit()))))+1]))]))
if(rN==null)then
return true
endif
endif
call IB("Abilities\\Spells\\Human\\ControlMagic\\ControlMagicTarget.mdl",rN,"overhead")
call UnitAddAbility(rN,'A08C')
call UnitAddAbility(rN,'A08D')
call UnitAddAbility(rN,'A08F')
return true
endfunction
function ah takes nothing returns boolean
local integer yI=(udg_Fi[GetPlayerId(GetOwningPlayer((GetTriggerUnit())))+1])
call XB("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl",GetTriggerUnit())
call EnableTrigger(udg_OV)
set udg_cr[yI]=udg_cr[yI]+1
return true
endfunction
function nh takes nothing returns boolean
local unit rN=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
local effect e
local fogmodifier f
local boolean b=udg_gE
if rN==null then
return true
endif
set e=AddSpecialEffect("Abilities\\Spells\\NightElf\\Starfall\\StarfallCaster.mdl",GetUnitX(GetSpellAbilityUnit()),GetUnitY(GetSpellAbilityUnit()))
if b then
set f=CreateFogModifierRadius(GetOwningPlayer(GetSpellAbilityUnit()),FOG_OF_WAR_VISIBLE,GetUnitX(rN),GetUnitY(rN),1100.,true,false)
call FogModifierStart(f)
endif
if udg_Kr then
call oN(udg_mv,GetSpellAbilityUnit(),rN)
else
call oN(udg_Lv,GetSpellAbilityUnit(),rN)
endif
call TriggerSleepAction(8)
if b then
call DestroyFogModifier(f)
set f=null
endif
call DestroyEffect(e)
set e=null
return true
endfunction
function Vh takes nothing returns boolean
local location uf=GetUnitLoc(GetTriggerUnit())
local location rN=GetRandomLocInRect(udg_Mx[udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]])
local real nR=AngleBetweenPoints(uf,rN)
local location l=rR(rN,-2500,nR)
local unit Uf
local timer t=CreateTimer()
local integer s=GetHandleId(t)
local effect e
local unit u
call PlaySoundBJ(udg_in)
call PlaySoundBJ(udg_nn)
set u=CreateUnitAtLoc(GetTriggerPlayer(),'h06X',uf,270)
call SetUnitTimeScalePercent(u,20)
set e=AddSpecialEffectLoc("Abilities\\Spells\\Other\\Levelup\\LevelupCaster.mdl",uf)
call DestroyEffect(e)
set e=null
call TriggerSleepAction(5)
set Uf=CreateUnitAtLoc(GetTriggerPlayer(),'h06V',l,nR)
call SaveInteger(udg_JE,s,0,250)
call SaveUnitHandle(udg_JE,s,1,Uf)
call SetUnitFlyHeight(Uf,1500.,.0)
call TimerStart(t,.04,true,function Tf)
call RemoveLocation(l)
set l=null
call RemoveLocation(uf)
set uf=null
set t=null
call RemoveLocation(rN)
set rN=null
call RemoveUnit(u)
return true
endfunction
function Eh takes nothing returns boolean
local unit u=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
local integer i=0
if u==null then
return true
endif
loop
exitwhen i>5
set udg_do=GetUnitX(u)+64.*Cos(60.*I2R(i)*bj_DEGTORAD)
set udg_Co=GetUnitY(u)+64.*Sin(60.*I2R(i)*bj_DEGTORAD)
if udg_Kr then
set bj_lastCreatedUnit=CreateUnit(GetOwningPlayer(GetSpellAbilityUnit()),'n021',udg_do,udg_Co,AngleBetweenPoints(udg_sx,udg_Px))
else
set bj_lastCreatedUnit=CreateUnit(GetOwningPlayer(GetSpellAbilityUnit()),'n01C',udg_do,udg_Co,AngleBetweenPoints(udg_sx,udg_Px))
endif
call UnitApplyTimedLife(bj_lastCreatedUnit,'BTLF',9.)
set i=i+1
endloop
return true
endfunction
function Xh takes nothing returns boolean
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if(u==null)then
return true
endif
call IB("Abilities\\Spells\\Undead\\DeathPact\\DeathPactTarget.mdl",u,"origin")
if HB(u,GetSpellAbilityUnit())then
call UnitDamageTargetBJ(GetSpellAbilityUnit(),u,200.,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_SONIC)
endif
return true
endfunction
function Oh takes nothing returns boolean
call RN(udg_iv,GetSpellAbilityUnit())
return true
endfunction
function Rh takes nothing returns boolean
local unit u
local effect e=null
local location l=null
set u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if u==null then
return true
endif
if HB(u,GetSpellAbilityUnit())then
call UnitDamageTargetBJ(GetSpellAbilityUnit(),u,50000.,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_DEATH)
endif
call XB("Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilSpecialArt.mdl",u)
set u=GetSpellAbilityUnit()
call SetUnitAnimation(u,"work")
call TriggerSleepAction(1.)
call ResetUnitAnimation(u)
return true
endfunction
function Ih takes nothing returns boolean
local integer i=GetRandomInt(0,8)
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
call XB("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl",GetSpellAbilityUnit())
if u==null then
return true
endif
call IB("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl",u,"origin")
if not HB(u,GetSpellAbilityUnit())then
return true
endif
if i==0 then
call XB("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl",u)
call ExplodeUnitBJ(u)
set i=(1+GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())))
set udg_Cr[i]=udg_Cr[i]+1
set udg_Ra[udg_Fi[i]]=udg_Ra[udg_Fi[i]]+1
elseif i==1 then
call UnitDamageTargetBJ(GetSpellAbilityUnit(),u,50000.,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_DEATH)
elseif i==2 then
call UnitDamageTargetBJ(GetSpellAbilityUnit(),u,500.,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_DEATH)
elseif i==3 then
call IB("Abilities\\Spells\\Human\\Avatar\\AvatarCaster.mdl",u,"origin")
call UnitAddAbility(u,'A06T')
call UnitAddAbility(u,'A06U')
call SetUnitLifePercentBJ(u,'d')
elseif i==4 then
call aN(udg_Dv,GetSpellAbilityUnit(),u)
call TriggerSleepAction(1.)
call pA(u)
if GetUnitTypeId(u)=='h03A'then
call TriggerSleepAction(44.5)
call IssueImmediateOrderById(u,852055)
call TriggerSleepAction(.5)
call pA(u)
return true
endif
elseif i==5 then
call nN(udg_fv,GetSpellAbilityUnit(),u)
elseif i==6 then
call XB("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl",u)
call LB(u)
call ShowUnit(u,false)
call Ac('n01S',u,GetSpellAbilityUnit(),GetTriggerPlayer())
call RemoveUnit(u)
return true
endif
return true
endfunction
function Ah takes nothing returns boolean
local location l=GetUnitLoc(GetSpellAbilityUnit())
local group g=AR(500.,l)
call XB("Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdl",GetSpellAbilityUnit())
set udg_av=GetSpellAbilityUnit()
call ForGroupBJ(g,function zf)
call DestroyGroup(g)
call RemoveLocation(l)
set g=null
set l=null
return true
endfunction
function Nh takes nothing returns boolean
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if u==null or not HB(u,GetSpellAbilityUnit())then
return true
endif
call nN(udg_W,GetSpellAbilityUnit(),u)
return true
endfunction
function bh takes nothing returns boolean
local unit u=(nA(udg_rO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if(u==null)or not HB(u,GetSpellAbilityUnit())then
return true
endif
call aN(udg_kv,GetSpellAbilityUnit(),u)
return true
endfunction
function Bh takes nothing returns boolean
local unit u=(nA(udg_xO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]))
if(u==null)then
return true
endif
call UnitAddAbility(u,'A03B')
call UnitAddAbility(u,'A03A')
call UnitAddAbility(u,'A03D')
call UnitAddAbility(u,'A08L')
set udg_Mi=GetRandomInt(1,3)
if(udg_Mi==1)then
call UnitAddAbility(u,'A05I')
call UnitAddAbility(u,'A06W')
else
if(udg_Mi==2)then
call UnitAddAbility(u,'A08M')
call UnitAddAbility(u,'A06Y')
else
call UnitAddAbility(u,'A08R')
call UnitAddAbility(u,'A06X')
endif
endif
call IB("Abilities\\Spells\\Undead\\ReplenishHealth\\ReplenishHealthCasterOverhead.mdl",u,"overhead")
call XB("Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl",GetSpellAbilityUnit())
return true
endfunction
function ch takes nothing returns boolean
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
call aN(udg_Jv,GetSpellAbilityUnit(),u)
set u=GetSpellAbilityUnit()
call TriggerSleepAction(.5)
call SetUnitAnimation(u,"attack")
call TriggerSleepAction(1.)
call ResetUnitAnimation(u)
return true
endfunction
function Ch takes nothing returns boolean
local unit u
local unit u2
local real Zf
local integer i=0
local player p=GetOwningPlayer(GetSpellAbilityUnit())
local real x=GetUnitX(GetSpellAbilityUnit())
local real y=GetUnitY(GetSpellAbilityUnit())
set u=GetSpellAbilityUnit()
call SetUnitAnimation(u,"death")
call TriggerSleepAction(1.5)
call TimerStart(udg_Bo,.04,true,null)
set Zf=I2R(udg_Fi[(1+GetPlayerId(p))])*180
loop
exitwhen i>2
set u2=CreateUnit(p,'h08U',x,y,ModuloReal(Zf+GetRandomReal(-55,55)+360,360))
if(udg_Kr)then
call UnitRemoveAbility(u2,'A080')
call UnitAddAbility(u2,'A084')
endif
call GroupAddUnit(udg_tx,u2)
set i=i+1
endloop
call EnableWeatherEffect(udg_kx,true)
call TriggerSleepAction(3.7)
call ResetUnitAnimation(u)
call TriggerSleepAction(2.6)
call EnableWeatherEffect(udg_kx,false)
return true
endfunction
function dh takes nothing returns boolean
local integer i
local unit u
local integer rl
call IB("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl",GetSpellAbilityUnit(),"origin")
set udg_fa=GetUnitTypeId((nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])])))
set i=GetUnitPointValueByType(udg_fa)
set rl=udg_xO[(udg_Fi[GetPlayerId(GetOwningPlayer((GetSpellAbilityUnit())))+1])]
call OA(rl)
if i>'d'then
loop
set u=RA(rl)
exitwhen u==null
if GetUnitPointValue(u)==i then
call IB("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl",u,"origin")
call nN(udg_rv,GetSpellAbilityUnit(),u)
endif
endloop
else
loop
set u=RA(rl)
exitwhen u==null
if GetUnitTypeId(u)==udg_fa then
call IB("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl",u,"origin")
call nN(udg_rv,GetSpellAbilityUnit(),u)
endif
endloop
endif
return true
endfunction
function Dh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
call xN(udg_Mv,u)
call TriggerSleepAction(1.)
call ResetUnitAnimation(u)
return true
endfunction
function fh takes nothing returns boolean
local unit u=(nA(udg_xO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
if(u==null)or not HB(u,GetSpellAbilityUnit())then
return true
endif
call nN(udg_Cv,GetSpellAbilityUnit(),u)
call TriggerSleepAction(1.)
call pA(u)
if GetUnitTypeId(u)=='h03A'then
call TriggerSleepAction(44.5)
call IssueImmediateOrderById(u,852055)
call TriggerSleepAction(.5)
call pA(u)
endif
return true
endfunction
function Fh takes nothing returns boolean
local unit u=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
local integer i
if udg_Kr then
call VN(udg_qv,GetSpellAbilityUnit(),u)
else
call VN(udg_Pv,GetSpellAbilityUnit(),u)
endif
return true
endfunction
function gh takes nothing returns boolean
local unit u=(nA(udg_iO[(udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))])]))
call oN(udg_Gv,GetSpellAbilityUnit(),u)
return true
endfunction
function Gh takes nothing returns boolean
local unit u=(nA(udg_oO[udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]]))
local integer i=0
loop
exitwhen((GetUnitAbilityLevel((u),'A06V')>0)==false)
set u=(nA(udg_oO[udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]]))
set i=i+1
if(i>=10)then
return true
exitwhen true
endif
endloop
if(u==null)then
return true
endif
call XB("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl",u)
set i=udg_Fi[(1+GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())))]
set udg_Gi[i]=(udg_Gi[i]+1)
call MultiboardSetItemValueBJ(udg_ar,4,udg_Xa[i],I2S(udg_Gi[i]))
call KillUnit(u)
return true
endfunction
function hh takes nothing returns boolean
local unit u=(nA(udg_oO[udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]]))
local fogmodifier f
call XB("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl",GetSpellAbilityUnit())
if u==null then
return true
endif
call cN('h04G',GetSpellAbilityUnit(),GetSpellAbilityUnit(),20.)
if udg_gE then
set f=CreateFogModifierRadius(GetOwningPlayer(GetSpellAbilityUnit()),FOG_OF_WAR_VISIBLE,GetUnitX(u),GetUnitY(u),128.,true,false)
call FogModifierStart(f)
call IssueTargetOrderById(bj_lastCreatedUnit,851985,u)
call TriggerSleepAction(.1)
call DestroyFogModifier(f)
set f=null
else
call IssueTargetOrderById(bj_lastCreatedUnit,851985,u)
endif
return true
endfunction
function Hh takes nothing returns boolean
local unit u=(nA(udg_oO[udg_aO[((udg_Fi[GetPlayerId(GetOwningPlayer(((GetSpellAbilityUnit()))))+1]))]]))
local fogmodifier f
call XB("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl",GetSpellAbilityUnit())
if u==null then
return true
endif
call cN('h04H',GetSpellAbilityUnit(),GetSpellAbilityUnit(),20.)
if udg_gE then
set f=CreateFogModifierRadius(GetOwningPlayer(GetSpellAbilityUnit()),FOG_OF_WAR_VISIBLE,GetUnitX(u),GetUnitY(u),128.,true,false)
call FogModifierStart(f)
call IssueTargetOrderById(bj_lastCreatedUnit,851985,u)
call TriggerSleepAction(.1)
call DestroyFogModifier(f)
set f=null
else
call IssueTargetOrderById(bj_lastCreatedUnit,851985,u)
endif
return true
endfunction
function jh takes nothing returns boolean
local location l1=GetUnitLoc(GetTriggerUnit())
local location l2
local integer i=0
local real nR=bj_RADTODEG*Atan2(GetUnitY(GetSpellTargetUnit())-GetUnitY(GetTriggerUnit()),GetUnitX(GetSpellTargetUnit())-GetUnitX(GetTriggerUnit()))
set nR=ModuloReal(nR+20,360)
loop
exitwhen i>3
set nR=ModuloReal(nR+350,360)
set l2=rR(l1,'d',nR)
call EN(udg_Q,GetTriggerUnit(),GetLocationX(l2),GetLocationY(l2))
call RemoveLocation(l2)
set i=i+1
endloop
call RemoveLocation(l1)
set l1=null
set l2=null
return true
endfunction
function Jh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
local unit u2
local group g=CreateGroup()
local real xF
local real x=GetUnitX(GetSpellTargetUnit())
local real y=GetUnitY(GetSpellTargetUnit())
local real aR=SquareRoot((GetUnitX(u)-x)*(GetUnitX(u)-x)+(GetUnitY(u)-y)*(GetUnitY(u)-y))
call cN('h09Q',u,u,3)
call IssuePointOrderById(bj_lastCreatedUnit,851984,x,y)
call TriggerSleepAction(aR/700)
call iN(udg_cv,u,x,y)
set udg_av=u
call GroupEnumUnitsInRange(g,x,y,300,udg_Rv)
loop
set u2=FirstOfGroup(g)
exitwhen u2==null
call GroupRemoveUnit(g,u2)
set xF=RMinBJ(GetUnitState(u2,UNIT_STATE_MANA),'d')
call SetUnitState(u2,UNIT_STATE_MANA,GetUnitState(u2,UNIT_STATE_MANA)-xF)
if(xF>0)then
call IB("Abilities\\Spells\\Human\\Feedback\\SpellBreakerAttack.mdl",u2,"origin")
call UnitDamageTarget(bj_lastCreatedUnit,u2,xF,true,false,ATTACK_TYPE_CHAOS,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
endif
endloop
call DestroyGroup(g)
set g=null
return true
endfunction
function kh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
local player p=GetOwningPlayer(u)
local real aR=GetRandomReal(70,350)
local real nR=GetRandomReal(0,360)
local real x=GetUnitX(u)+aR*Cos(nR*bj_DEGTORAD)
local real y=GetUnitY(u)+aR*Sin(nR*bj_DEGTORAD)
call cN('h09M',u,u,3)
call IssuePointOrderById(bj_lastCreatedUnit,851984,x,y)
call TriggerSleepAction(aR/700)
set u=CreateUnit(p,'n025',x,y,nR)
call GroupAddUnit(udg_Ki,u)
return true
endfunction
function Kh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
local group g=CreateGroup()
local integer i=0
local unit u2
set udg_av=u
call GroupEnumUnitsInRange(g,GetUnitX(GetSpellTargetUnit()),GetUnitY(GetSpellTargetUnit()),400,udg_Ov)
loop
set u2=FirstOfGroup(g)
set i=i+1
exitwhen u2==null
exitwhen i>4
call GroupRemoveUnit(g,u2)
call aN(udg_ev,u,u2)
endloop
call DestroyGroup(g)
set g=null
return true
endfunction
function lh takes nothing returns boolean
call aN(udg_xv,GetSpellAbilityUnit(),GetSpellTargetUnit())
return true
endfunction
function Lh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
local group g=CreateGroup()
local integer i=0
local unit u2
call GroupEnumUnitsInRange(g,GetUnitX(GetSpellTargetUnit()),GetUnitY(GetSpellTargetUnit()),350,null)
loop
exitwhen i>2
set u2=FirstOfGroup(g)
exitwhen u2==null
call GroupRemoveUnit(g,u2)
if(not IsUnitType(u2,UNIT_TYPE_DEAD))and((udg_Fi[GetPlayerId(GetOwningPlayer((u2)))+1])!=(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1]))and IsUnitType(u2,UNIT_TYPE_GROUND)then
set i=i+1
call aN(udg_Hv,u,u2)
endif
endloop
call DestroyGroup(g)
set g=null
return true
endfunction
function mh takes nothing returns boolean
call nN(udg_dv,GetSpellAbilityUnit(),GetSpellTargetUnit())
return true
endfunction
function Mh takes nothing returns boolean
call xN(udg_q,GetSpellAbilityUnit())
call IB("Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdl",GetSpellAbilityUnit(),"origin")
return true
endfunction
function ph takes nothing returns boolean
call xN(udg_Fv,GetSpellAbilityUnit())
call IB("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl",GetSpellAbilityUnit(),"origin")
return true
endfunction
function Ph takes nothing returns boolean
call IB("Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdl",GetSpellAbilityUnit(),"origin")
call xN(udg_T,GetSpellAbilityUnit())
return true
endfunction
function qh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
call UnitRemoveAbility(GetSpellAbilityUnit(),'A00F')
call xN(udg_Qv,u)
call IB("Units\\NightElf\\Wisp\\WispExplode.mdl",u,"origin")
call TriggerSleepAction(.3)
call IssuePointOrderByIdLoc(u,851986,udg_Yx[ModuloInteger(udg_Fi[(1+GetPlayerId(GetOwningPlayer(u)))]+1,2)])
call TriggerSleepAction(5)
call IssueImmediateOrderById(u,851993)
call TriggerSleepAction(6.6)
call UnitAddAbility(u,'A00F')
call pA(u)
return true
endfunction
function Qh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
call aN(udg_sv,u,GetSpellTargetUnit())
call TriggerSleepAction(.8)
call pA(u)
return true
endfunction
function sh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
call aN(udg_lv,u,GetSpellTargetUnit())
call TriggerSleepAction(.8)
call pA(u)
return true
endfunction
function Sh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
call aN(udg_gv,u,GetSpellTargetUnit())
call IssueImmediateOrderById(u,852126)
call TriggerSleepAction(1.)
call MA(u)
return true
endfunction
function th takes nothing returns boolean
call aN(udg_pv,GetSpellAbilityUnit(),GetSpellTargetUnit())
return true
endfunction
function Th takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
call IssueTargetOrderById(u,852066,GetSpellTargetUnit())
call TriggerSleepAction(1.)
call MA(u)
return true
endfunction
function uh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
local location l=GetUnitLoc(u)
local group g
set udg_av=u
set g=XR(900.,l,udg_Vv)
call UnitAddAbility(GetSpellTargetUnit(),'A03L')
if(CountUnitsInGroup(g)>0)then
call IssueImmediateOrderById(u,852094)
call TriggerSleepAction(1.)
call pA(u)
endif
call DestroyGroup(g)
call RemoveLocation(l)
set l=null
set g=null
return true
endfunction
function Uh takes nothing returns boolean
local unit u=GetSpellAbilityUnit()
call TriggerSleepAction(1.2)
call IssuePointOrderByIdLoc(u,851983,udg_Yx[(udg_Fi[GetPlayerId(GetOwningPlayer((u)))+1])])
return true
endfunction
function wh takes nothing returns boolean
local integer JR=udg_TO
set udg_zE=udg_UE[JR]
loop
exitwhen udg_zE==0
set udg_YE=udg_zE
set udg_zE=udg_QE[udg_YE]
call kR(udg_YE)
endloop
call FlushChildHashtable(udg_yE,JR)
return true
endfunction
function Wh takes nothing returns boolean
set udg_uO=UA(udg_SO,udg_tO)
return true
endfunction
function yh takes nothing returns boolean
local integer JR=udg_TO
set udg_SX=udg_PX[JR]
loop
exitwhen udg_SX==0
set udg_sX=udg_SX
set udg_SX=udg_KX[udg_sX]
call QR(udg_sX)
endloop
return true
endfunction
function Yh takes nothing returns boolean
local integer JR=udg_TO
set udg_HX=udg_FX[JR]
loop
exitwhen udg_HX==0
set udg_hX=udg_HX
set udg_HX=udg_BX[udg_hX]
call SR(udg_hX)
endloop
return true
endfunction
function zh takes nothing returns boolean
local integer JR=udg_TO
set udg_IX=udg_VX[JR]
loop
exitwhen udg_IX==0
set udg_RX=udg_IX
set udg_IX=udg_xX[udg_RX]
call TR(udg_RX)
endloop
call FlushChildHashtable(udg_OX,JR)
return true
endfunction
function eh takes nothing returns nothing
set udg_sO[3]=CreateTrigger()
call TriggerAddAction(udg_sO[3],function xh)
call TriggerAddCondition(udg_sO[3],Condition(function xh))
set udg_sO[30]=CreateTrigger()
call TriggerAddAction(udg_sO[30],function oh)
call TriggerAddCondition(udg_sO[30],Condition(function oh))
set udg_sO[6]=CreateTrigger()
call TriggerAddAction(udg_sO[6],function rh)
call TriggerAddCondition(udg_sO[6],Condition(function rh))
set udg_sO[26]=CreateTrigger()
call TriggerAddAction(udg_sO[26],function ih)
call TriggerAddCondition(udg_sO[26],Condition(function ih))
set udg_sO[35]=CreateTrigger()
call TriggerAddAction(udg_sO[35],function ah)
call TriggerAddCondition(udg_sO[35],Condition(function ah))
set udg_sO[37]=CreateTrigger()
call TriggerAddAction(udg_sO[37],function nh)
call TriggerAddCondition(udg_sO[37],Condition(function nh))
set udg_sO[25]=CreateTrigger()
call TriggerAddAction(udg_sO[25],function Vh)
call TriggerAddCondition(udg_sO[25],Condition(function Vh))
set udg_sO[14]=CreateTrigger()
call TriggerAddAction(udg_sO[14],function Eh)
call TriggerAddCondition(udg_sO[14],Condition(function Eh))
set udg_sO[42]=CreateTrigger()
call TriggerAddAction(udg_sO[42],function Xh)
call TriggerAddCondition(udg_sO[42],Condition(function Xh))
set udg_sO[12]=CreateTrigger()
call TriggerAddAction(udg_sO[12],function Oh)
call TriggerAddCondition(udg_sO[12],Condition(function Oh))
set udg_sO[8]=CreateTrigger()
call TriggerAddAction(udg_sO[8],function Rh)
call TriggerAddCondition(udg_sO[8],Condition(function Rh))
set udg_sO[21]=CreateTrigger()
call TriggerAddAction(udg_sO[21],function Ih)
call TriggerAddCondition(udg_sO[21],Condition(function Ih))
set udg_sO[16]=CreateTrigger()
call TriggerAddAction(udg_sO[16],function Ah)
call TriggerAddCondition(udg_sO[16],Condition(function Ah))
set udg_sO[7]=CreateTrigger()
call TriggerAddAction(udg_sO[7],function Nh)
call TriggerAddCondition(udg_sO[7],Condition(function Nh))
set udg_sO[34]=CreateTrigger()
call TriggerAddAction(udg_sO[34],function bh)
call TriggerAddCondition(udg_sO[34],Condition(function bh))
set udg_sO[4]=CreateTrigger()
call TriggerAddAction(udg_sO[4],function Bh)
call TriggerAddCondition(udg_sO[4],Condition(function Bh))
set udg_sO[32]=CreateTrigger()
call TriggerAddAction(udg_sO[32],function ch)
call TriggerAddCondition(udg_sO[32],Condition(function ch))
set udg_sO[44]=CreateTrigger()
call TriggerAddAction(udg_sO[44],function Ch)
call TriggerAddCondition(udg_sO[44],Condition(function Ch))
set udg_sO[11]=CreateTrigger()
call TriggerAddAction(udg_sO[11],function dh)
call TriggerAddCondition(udg_sO[11],Condition(function dh))
set udg_sO[38]=CreateTrigger()
call TriggerAddAction(udg_sO[38],function Dh)
call TriggerAddCondition(udg_sO[38],Condition(function Dh))
set udg_sO[19]=CreateTrigger()
call TriggerAddAction(udg_sO[19],function fh)
call TriggerAddCondition(udg_sO[19],Condition(function fh))
set udg_sO[40]=CreateTrigger()
call TriggerAddAction(udg_sO[40],function Fh)
call TriggerAddCondition(udg_sO[40],Condition(function Fh))
set udg_sO[29]=CreateTrigger()
call TriggerAddAction(udg_sO[29],function gh)
call TriggerAddCondition(udg_sO[29],Condition(function gh))
set udg_sO[33]=CreateTrigger()
call TriggerAddAction(udg_sO[33],function Gh)
call TriggerAddCondition(udg_sO[33],Condition(function Gh))
set udg_sO[15]=CreateTrigger()
call TriggerAddAction(udg_sO[15],function hh)
call TriggerAddCondition(udg_sO[15],Condition(function hh))
set udg_sO[17]=CreateTrigger()
call TriggerAddAction(udg_sO[17],function Hh)
call TriggerAddCondition(udg_sO[17],Condition(function Hh))
set udg_sO[2]=CreateTrigger()
call TriggerAddAction(udg_sO[2],function jh)
call TriggerAddCondition(udg_sO[2],Condition(function jh))
set udg_sO[18]=CreateTrigger()
call TriggerAddAction(udg_sO[18],function Jh)
call TriggerAddCondition(udg_sO[18],Condition(function Jh))
set udg_sO[23]=CreateTrigger()
call TriggerAddAction(udg_sO[23],function kh)
call TriggerAddCondition(udg_sO[23],Condition(function kh))
set udg_sO[9]=CreateTrigger()
call TriggerAddAction(udg_sO[9],function Kh)
call TriggerAddCondition(udg_sO[9],Condition(function Kh))
set udg_sO[10]=CreateTrigger()
call TriggerAddAction(udg_sO[10],function lh)
call TriggerAddCondition(udg_sO[10],Condition(function lh))
set udg_sO[31]=CreateTrigger()
call TriggerAddAction(udg_sO[31],function Lh)
call TriggerAddCondition(udg_sO[31],Condition(function Lh))
set udg_sO[20]=CreateTrigger()
call TriggerAddAction(udg_sO[20],function mh)
call TriggerAddCondition(udg_sO[20],Condition(function mh))
set udg_sO[1]=CreateTrigger()
call TriggerAddAction(udg_sO[1],function Mh)
call TriggerAddCondition(udg_sO[1],Condition(function Mh))
set udg_sO[22]=CreateTrigger()
call TriggerAddAction(udg_sO[22],function ph)
call TriggerAddCondition(udg_sO[22],Condition(function ph))
set udg_sO[5]=CreateTrigger()
call TriggerAddAction(udg_sO[5],function Ph)
call TriggerAddCondition(udg_sO[5],Condition(function Ph))
set udg_sO[41]=CreateTrigger()
call TriggerAddAction(udg_sO[41],function qh)
call TriggerAddCondition(udg_sO[41],Condition(function qh))
set udg_sO[43]=CreateTrigger()
call TriggerAddAction(udg_sO[43],function Qh)
call TriggerAddCondition(udg_sO[43],Condition(function Qh))
set udg_sO[36]=CreateTrigger()
call TriggerAddAction(udg_sO[36],function sh)
call TriggerAddCondition(udg_sO[36],Condition(function sh))
set udg_sO[24]=CreateTrigger()
call TriggerAddAction(udg_sO[24],function Sh)
call TriggerAddCondition(udg_sO[24],Condition(function Sh))
set udg_sO[39]=CreateTrigger()
call TriggerAddAction(udg_sO[39],function th)
call TriggerAddCondition(udg_sO[39],Condition(function th))
set udg_sO[27]=CreateTrigger()
call TriggerAddAction(udg_sO[27],function Th)
call TriggerAddCondition(udg_sO[27],Condition(function Th))
set udg_sO[28]=CreateTrigger()
call TriggerAddAction(udg_sO[28],function uh)
call TriggerAddCondition(udg_sO[28],Condition(function uh))
set udg_sO[13]=CreateTrigger()
call TriggerAddAction(udg_sO[13],function Uh)
call TriggerAddCondition(udg_sO[13],Condition(function Uh))
set udg_MO=CreateTrigger()
call TriggerAddCondition(udg_MO,Condition(function wh))
set udg_QO=CreateTrigger()
call TriggerAddCondition(udg_QO,Condition(function Wh))
set udg_mO[12]=null
set udg_mO[13]=null
set udg_qO=CreateTrigger()
call TriggerAddCondition(udg_qO,Condition(function yh))
set udg_PO=CreateTrigger()
call TriggerAddCondition(udg_PO,Condition(function Yh))
set udg_pO=CreateTrigger()
call TriggerAddCondition(udg_pO,Condition(function zh))
call ExecuteFunc("lI")
call ExecuteFunc("MI")
call ExecuteFunc("BN")
endfunction
function InitTrig_init takes nothing returns nothing
set udg_CACHE = InitGameCache("KeyBindings.w3v")
set udg_CreateUnity = CreateTrigger()
set udg_trg_Hear = CreateTrigger()
set udg_CreateRect2 = CreateTrigger()
set udg_CreateArea = CreateTrigger()
set udg_CreateRect = CreateTrigger()
set udg_CHEATS = CreateTrigger()
set udg_ICHEAT = CreateTrigger()
set udg_A = InitHashtable()
set udg_hE = InitHashtable()
set udg_jE = InitHashtable()
set udg_JE = InitHashtable()
set udg_kE = InitHashtable()
set udg_ME = InitHashtable()
set udg_zX = InitHashtable()

call ExecuteFunc("main2")
endfunction

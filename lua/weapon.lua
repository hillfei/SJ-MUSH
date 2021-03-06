weaponPrepare= {}
weaponUsave  = {}
itemWield    = {}

weaponStore={
["箫"] = "city/yueqidian",
["木剑"] = "xiangyang/mujiangpu",
["长剑"] = "zhiye/bingqipu1",
["铁笔"] = "zhiye/bingqipu1",
["钢刀"] = "zhiye/bingqipu1",
["流星锤"] = "zhiye/bingqipu1",
["铁棍"] = "zhiye/bingqipu1",
["钢杖"] = "zhiye/bingqipu1",
["长鞭"] = "zhiye/bingqipu1",
["竹棒"] = "zhiye/bingqipu1",
["钢斧"] = "zhiye/bingqipu1",
["匕首"] = "zhiye/bingqipu1",
["单钩"] = "zhiye/bingqipu1",
["飞镖"] = "zhiye/bingqipu1",
["石子"] = "zhiye/bingqipu1",
["梅花针"] = "zhiye/bingqipu1",
["手裏剑"] = "zhiye/bingqipu1",
}

weaponStoreId={
["箫"] = "xiao",
["木剑"] = "mu jian",
["长剑"] = "changjian",
["铁笔"] = "tie bi",
["钢刀"] = "blade",
["流星锤"] = "liuxing chui",
["铁棍"] = "tiegun",
["钢杖"] = "gangzhang",
["长鞭"] = "changbian",
["竹棒"] = "zhubang",
["钢斧"] = "gang fu",
["匕首"] = "bishou",
["单钩"] = "hook",
["飞镖"] = "dart",
["石子"] = "shizi",
["梅花针"] = "meihua zhen",
["手裏剑"] = "shuriken",
}

weaponFunc = {
   ["松纹古剑"] = "if score.master and score.master=='张三丰' then return true else return false end",
}
weaponFuncName = {
   ["松纹古剑"] = "weaponGetSwj",
}

weaponThrowing = {
["梅花针"] = true,
["手裏剑"] = true,
["飞镖"]   = true,
["铜钱"]   = true,
["石子"]   = true,
["甩箭"]   = true,
["神龙镖"] = true,
["飞蝗石"] = true,
}

weaponKind = {
["ren"]   = "cut",
["blade"]   = "cut",
["sword"]   = "cut",
["stick"]   = true,
["club"]    = true,
["hammer"]  = true,
["whip"]    = true,
["axe"]     = "cut",
["staff"]   = true,
["brush"]   = true,
["dagger"]  = "cut",
["hook"]  = "cut",
["spear"]   = true,
["throwing"]= true,
["xiao"]    = true,
["fork"]   = true,
["dart"]   = true,
}

unarmedKind = {
["cuff"]    = true,
["strike"]  = true,
["finger"]  = true,
["claw"]    = true,
["hand"]    = true,
["leg"]     = true,
}

function weaponSet()
    weaponPrepare={}
    local t = {}
	for p in pairs(weaponStore) do
	    t[p] = p
	end
	for p in pairs(Bag) do
	    if Bag[p].kind then
		   t[p] = p
		end
	end
	for p,q in pairs(weaponFunc) do
	    if loadstring(q)() then
		   t[p] = p
		end
	end
	if GetVariable("weaponprepare") then
      tmp.weapon = utils.split(GetVariable("weaponprepare"),'_')
	  tmp.pre = {}
      for _,p in pairs(tmp.weapon) do
          tmp.pre[p]=true
      end
    end
	local l_tmp=utils.multilistbox ("你准备要使用的武器有(请按CTRL多选)?", "武器选择", t,tmp.pre)
    local l_result=nil
	if type(l_tmp)=="table" then
       for p in pairs(l_tmp) do
           weaponPrepare[p]=true
           if l_result then
              l_result = l_result .. '_' .. p
           else
              l_result = p
          end
       end
	end
    if l_result then
      SetVariable("weaponprepare",l_result)
	else
	  DeleteVariable("weaponprepare")
    end
	
	for p in pairs(t) do
	    if not weaponPrepare[p] then
		   t[p] = nil
		end
	end
	
	if countTab(t)>1 then
	   l_result=utils.listbox("你优先使用的武器：","优先武器",t,GetVariable("weaponfirst"))
       if l_result~=nil then
          SetVariable("weaponfirst",l_result)
          weapon.first=l_result
       else
	      weapon.first = nil
          DeleteVariable("weaponfirst")
       end
	end
end
function weaponGetVar()
    weaponPrepare={}
    if GetVariable("weaponprepare") then
      tmp.weapon = utils.split(GetVariable("weaponprepare"),'_')
      for _,p in pairs(tmp.weapon) do
          weaponPrepare[p]=true
      end
    end
	if GetVariable("weaponfirst") then
	   weapon.first = GetVariable("weaponfirst")
	else
	   weapon.first = nil
	end
end

weaponInBag=function(p_kind)
    for p in pairs(Bag) do
	    if Bag[p].kind and Bag[p].kind == p_kind then
		   return true
		end
	end
	return false
end

weapon_wield=function()
    if perform and perform.skill and skillEnable[perform.skill] and weaponKind[skillEnable[perform.skill]] then
       if weapon.first and Bag[weapon.first] then
	      exe('wield '.. Bag[weapon.first].fullid)
	   end
	   for p in pairs(Bag) do
	      if Bag[p].kind and Bag[p].kind==skillEnable[perform.skill] and perform.skill~="yuxiao-jian" then
		     if not weapon.first or weapon.first~=p then
		        exe('wield '.. Bag[p].fullid)
			 end
		  end
		  if Bag[p].kind and Bag[p].kind=="xiao" and perform.skill=="yuxiao-jian" then
		     if not weapon.first or weapon.first~=p then
		        exe('wield '.. Bag[p].fullid)
			 end
		  end
	   end
    end
	checkWield()
end
weaponWWalk=function()
    weapon_wield()
    return walk_wait()
end
weapon_unwield=function()
    for p in pairs(Bag) do
	    if Bag[p].kind and (not itemWield or itemWield[p]) then
		   local _,l_cnt = isInBags(Bag[p].fullid)
		   if l_cnt > 2 then
		   -- 暗器 铜钱等
		       exe('unwield '.. Bag[p].fullid)
		   else 
		       for i = 1,l_cnt do
		          exe('unwield '.. Bag[p].fullid ..' '..i)
			   end
		   end
		end
	end
        -- ain
        exe('unwield falun')
        exe('unwield ansha bishou')
        exe('unwield hammer')
        exe('unwield qin')
		exe('unwield mu jian')
	    exe('unwield dart')
		exe('unwield shizi')
 
	checkWield()
end
weaponUnWalk=function()
    weapon_unwield()
    return walk_wait()
end
weaponWieldCut=function()
    for p in pairs(Bag) do
	    if Bag[p].kind and weaponKind[Bag[p].kind] and weaponKind[Bag[p].kind]=="cut" then
		   if not (Bag[p].kind == "xiao" and weaponUsave[p]) then
		      for q in pairs(Bag) do
		          if Bag[q].kind == "xiao" and weaponUsave[q] then
			         exe('unwield '.. Bag[q].fullid )
			      end
		      end
		      exe('wield '.. Bag[p].fullid )
		   end
		end
	end
	checkWield()
end
weaponUcheck=function()
    DeleteTriggerGroup("weapon")
    create_trigger_t('weapon1','^(> )*你把 "action" 设定为 "checkUweapon" 成功完成。','','weaponUdone')
    create_trigger_t('weapon2','^(> )*这是一(柄)由\\D*(青铜|生铁|软铁|绿石|流花石|软银|金铁|玄铁|万年神铁|万年寒冰铁)制成，重\\D*的(\\D*)。$','','weaponUtmp')
    create_trigger_t('weapon3','^(> )*看起来(需要修理|已经使用过一段时间|马上就要坏)了。','','weaponUneed')
	create_trigger_t('weapon4','^(> )*看起来没有什么损坏。','','weaponUwell')
    SetTriggerOption("weapon1","group","weapon")
    SetTriggerOption("weapon2","group","weapon")
	SetTriggerOption("weapon3","group","weapon")
	SetTriggerOption("weapon4","group","weapon")
	
	weaponUcannt = weaponUcannt or {}
	tmp.uweapon = nil
    for p in pairs(weaponUsave) do
	    if Bag[p] and Bag[p].kind and weaponKind[Bag[p].kind] and not weaponUcannt[p] then
		   exe('l '..Bag[p].fullid)
		end
	end
	exe('alias action checkUweapon')
end
weaponUtmp=function(n,l,w)
    if weaponUsave[w[4]] and Bag[w[4]] then
	   tmp.uweapon = w[4]
	end
end
weaponUneed=function()
    if tmp.uweapon and weaponUsave[tmp.uweapon] then
	   weaponUsave[tmp.uweapon] = "repair"
	end
end
weaponUwell=function()
    if tmp.uweapon and weaponUsave[tmp.uweapon] then
	   weaponUsave[tmp.uweapon] = true
	end
end
weaponUdone=function()
    EnableTriggerGroup("weapon",false)
	for p in pairs(weaponUsave) do
	    if weaponUsave[p] and type(weaponUsave[p])=="string" and weaponUsave[p]=="repair" then
            dis_all()
           return weaponRepair(p)
		end
	end
	return check_bei(weaponRepairOver)
end
weaponRepair=function(p_weapon)
    tmp.uweapon = p_weapon
    if not Bag["铁锤"] then
	   cntr1 = countR(3)
	   return go(weaponRepairQu,"扬州城","杂货铺")
	end
	return weaponRepairGo()
end
weaponRepairQu=function()
	exe('qu tiechui')
	checkBags()
	return check_bei(weaponRepairQuCheck,1)
end
weaponRepairQuCheck=function()
    if cntr1()> 0 and not Bag["铁锤"] then
	   return weaponRepairQu()
	end
	if Bag["铁锤"] then
	   return weaponRepairGo()
    else
	   return weaponRepairFind()
	end
end
weaponRepairFind=function()
    DeleteTriggerGroup("weaponFind")
    create_trigger_t('weaponFind1','^(> )*\\s*采矿师傅\\(Caikuang shifu\\)','','weaponRepairFollow')
    create_trigger_t('weaponFind2','^(> )*这里没有 caikuang shifu','','weaponRepairGoon')
    create_trigger_t('weaponFind3','^(> )*你决定跟随\\D*一起行动。','','weaponRepairBuy')
    create_trigger_t('weaponFind4','^(> )*你已经这样做了。','','weaponRepairBuy')
    SetTriggerOption("weaponFind1","group","weaponFind")
    SetTriggerOption("weaponFind2","group","weaponFind")
    SetTriggerOption("weaponFind3","group","weaponFind")
    SetTriggerOption("weaponFind4","group","weaponFind")
    EnableTriggerGroup("weaponFind",false)
	cntr1 = countR(20)
	job.name="买铁锤"
	return go(weaponRepairFact,"扬州城","打铁铺")
end
weaponRepairFact=function()
    EnableTriggerGroup("weaponFind",true)
	exe('look')
	return find()
end
weaponRepairFollow=function()
    flag.find = 1
	exe('follow caikuang shifu')
end
weaponRepairGoon=function()
    flag.wait=0
    flag.find=0
    return walk_wait()
end
weaponRepairBuy=function()
    EnableTriggerGroup("weaponFind",false)
	exe('buy tie chui')
	locate()
	checkBags()
	return checkWait(weaponRepairItem,0.5)
end
weaponRepairItem=function()
   if cntr1()>0 and not Bag["铁锤"] then
      return weaponRepairBuy()
   end
   if not Bag["铁锤"] then
      return weaponRepairGoCun()
   end
   return weaponRepairGo()
end
weaponRepairGo=function()
    return go(weaponRepairDo,"扬州城","兵器铺")
end
function ungeta()
    local w_cmd=GetVariable("myweapon")
    local u_cmd=GetVariable("muweapon")
    local leweapon=GetVariable("learnweapon")
    if leweapon~=nil then
	   exe('unwield '..leweapon)
    end
    if w_cmd~=nil then
       exe('unwield '..w_cmd)
    end
    if u_cmd~=nil then
       exe('unwield '..w_cmd)
    end
end
weaponRepairDo=function()
    DeleteTriggerGroup("repair")
    create_trigger_t('repair1','^(> )*你开始仔细的维修(\\D*)，不时用铁锤敲敲打打','','')
    create_trigger_t('repair2','^(> )*你仔细的维修(\\D*)，总算大致恢复了它的原貌。$','','weaponRepairGoCun')
    create_trigger_t('repair3','^(> )*这件兵器完好无损，无需修理。$','','weaponRepairGoCun')
	create_trigger_t('repair4','^(> )*对于这种武器，您了解不多，无法修理！$','','weaponRepairCannt')
	create_trigger_t('repair5','^(> )*你带的零钱不够了！你需要','','weaponRepairGold')
    SetTriggerOption("repair1","group","repair")
    SetTriggerOption("repair2","group","repair")
    SetTriggerOption("repair3","group","repair")
	SetTriggerOption("repair4","group","repair")
	SetTriggerOption("repair5","group","repair")
    weapon_unwield()
        ungeta()
	exe('wield tie chui')
	exe('repair '..Bag[tmp.uweapon].fullid)
	create_timer_m('repair',3,'weaponRepairGoCun')
end
function weaponRepairCannt()
    weaponUcannt = weaponUcannt or {}
	return weaponRepairGoCun()
end
function weaponRepairGold()
    EnableTriggerGroup("repair",false)
	EnableTimer("repair",false)
	exe('n;#3w;#3n;w;qu 50 gold;e;#3s;#3e;s')
	return checkWait(weaponRepairDo,2)
end
weaponRepairOver=function()
  DeleteTriggerGroup("weapon")
  EnableTriggerGroup("repair",false)
	EnableTimer("repair",false)
	DeleteTimer("repair")
	DeleteTriggerGroup("repair")
	return check_halt(check_jobx)
end
weaponRepairGoCun=function()
    EnableTriggerGroup("repair",false)
	EnableTimer("repair",false)
	cntr2 = countR(3)
	exe('unwield tie chui')
	return go(weaponRepairCun,"扬州城","杂货铺")
end
weaponRepairCun=function()
    if not Bag["铁锤"] then
	   return check_heal()
	end
    if cntr2()>0 and Bag["铁锤"] then
	   weapon_unwield()
	   exe('cun tie chui')
	   checkBags()
	   return check_busy(weaponRepairCun,1)
	end
	return weaponRepairOver()
end

weaponGetSwj=function()
    return go(swjAsk,"武当山","后山小院")
end
function swjAsk()
    if locl.room~="后山小院" or not locl.id["张三丰"] then
	   return weaponGetSwj()
	end
	exe('ask zhang sanfeng about 下山')
	wait.make(function() 
       wait.time(3)
	   exe('ask zhang sanfeng about 教诲')
	   checkBags()
	   return check_bei(swjOver)
	end)
end
function swjOver()
    return checkPrepare()
end








--shoumu
------桃花岛守墓

ask huang about 守墓
你向黄蓉打听有关『守墓』的消息。
黄蓉说道：「难得你有这份心意，但是我母亲的墓不是随便就能进去的。」
黄蓉想了想，说道: 这样吧,我带你去!
你紧跟着黄蓉，左一转，右一转，不一会就到了墓前。
wield xiao
石坟 - east、north、south、west
黄蓉在你耳边悄悄说道: 你要好好守墓。如果有什么人进到墓里，你不要对他客气!
> 你正忙着呢。
> 黄蓉说完，就赶忙的离开了。
突然，从北边的桃花阵中闯出一个盗墓贼，钻进石坟就不见了。


^??黄蓉说道：「已经有人去守墓了
^??黄蓉说道：「对不起，现在这里没有
^??黄蓉说道：「*休息一会吧。」 busy
^??黄蓉疑惑的看着你,说道: 现在大白天的，守什么墓呀? busy
^??你紧跟着黄蓉，左一转，右一转，不一会就到了墓前。
bbb {ask rong about 师母;bbb {ask rong about 守墓}}
timenn=%time("nn");
timess=%time("ss");
#t- sm_ask;
#t+ sm_enter;
wield xiao

^??突然，从%x桃花阵中闯出一个盗墓贼
#4 {kneel mubei};
bbb {#3 {push mubei left};
bbb {#3 {push mubei right};
bbb {d;
time}}}

^??现在是*年*月*日{辰|戌}时{二刻|三刻}。
u;u;d;s;d;s;d;su;d;kick daomu zei
^??现在是*年*月*日{辰|戌}时{正|一刻}
u;u;d;su;d;su;d;se;d;kick daomu zei
^??现在是*年*月*日{丑|未}时{二刻|三刻}
u;u;d;n;d;n;d;nu;d;kick daomu zei
^??现在是*年*月*日{丑|未}时{正|一刻}。
u;u;d;nu;d;nu;d;nw;d;kick daomu zei
^??现在是*年*月*日{卯|酉}时{二刻|三刻}
u;u;d;se;d;se;d;e;d;kick daomu zei
^??现在是*年*月*日{卯|酉}时{正|一刻}
u;u;d;e;d;e;d;ne;d;kick daomu zei
^??现在是*年*月*日{巳|亥}时{二刻|三刻}
u;u;d;sw;d;sw;d;sd;d;kick daomu zei
^??现在是*年*月*日{巳|亥}时{正|一刻}
u;u;d;sd;d;sd;d;s;d;kick daomu zei
^??现在是*年*月*日{寅|申}时{二刻|三刻}。
u;u;d;ne;d;ne;d;nd;d;kick daomu zei
^??现在是*年*月*日{寅|申}时{正|一刻}。
u;u;d;nd;d;nd;d;n;d;kick daomu zei
^??现在是*年*月*日{子|午}时{二刻|三刻}
u;u;d;nw;d;nw;d;w;d;kick daomu zei
^??现在是*年*月*日{子|午}时{正|一刻}
u;u;d;w;d;w;d;sw;d;kick daomu zei
^??盗墓贼「啪」的一声倒在地上
bbb {#t- sm_fight;
get all from corpse;
drop cloth;
get zhuanji;
#t+ sm_out;
u}

^??盗墓贼急急忙忙离开了。
bbb {#t- sm_fight;
#t+ sm_out;
u};
log %e[1m%e[14m桃花岛任务：失败

^??看起来盗墓贼想杀死你！
kill zei

give rong all;
function shoumuTrigger()
    DeleteTriggerGroup("shoumuAsk")
    create_trigger_t('shoumuAsk1',"^(> )*你向黄蓉打听有关",'','shoumuAsk')
    create_trigger_t('shoumuAsk2',"^(> )*这里没有这个人。$",'','shoumuNobody')
    SetTriggerOption("shoumuAsk1","group","shoumuAsk")
    SetTriggerOption("shoumuAsk2","group","shoumuAsk")
    EnableTriggerGroup("shoumuAsk",false)
    DeleteTriggerGroup("shoumuAccept")
    create_trigger_t('shoumuAccept1',"^(> )*黄蓉在你耳边悄悄说道: 你要好好守墓。如果有什么人进到墓里，你不要对他客气!",'','shoumuFind')
    create_trigger_t('shoumuAccept2',"^(> )*黄蓉说道：「已经有人去守墓",'','shoumuFangqi')
    create_trigger_t('shoumuAccept3',"^(> )*黄蓉在你的耳边悄声说道(\\D*)尤为擅长(\\D*)的功夫。",'','shoumuNpc')
    create_trigger_t('shoumuAccept4',"^(> )*黄蓉说道：「你正忙着别的事情呢",'','shoumuFail')
    create_trigger_t('shoumuAccept5',"^(> )*黄蓉说道：「对不起，现在这里没有",'','shoumuFail')
    create_trigger_t('shoumuAccept6',"^(> )*黄蓉说道：「现在暂时没有适合你的工作",'','shoumuFail')
    create_trigger_t('shoumuAccept7',"^(> )*黄蓉说道：「暂时没有任务需要做，你过一会儿再来吧",'','shoumuFail')
    create_trigger_t('shoumuAccept8',"^(> )*黄蓉(对你|)说道：(「|)\\D*，(这个任务确实比较难完成|你太让我失望了)",'','shoumuFail')
    create_trigger_t('shoumuAccept9',"^(> )*黄蓉说道：「\\D*，你又没在我这里领任务，瞎放弃什么呀",'','shoumuFail')
    SetTriggerOption("shoumuAccept1","group","shoumuAccept")
    SetTriggerOption("shoumuAccept2","group","shoumuAccept")
    SetTriggerOption("shoumuAccept3","group","shoumuAccept")
    SetTriggerOption("shoumuAccept4","group","shoumuAccept")
    SetTriggerOption("shoumuAccept5","group","shoumuAccept")
    SetTriggerOption("shoumuAccept6","group","shoumuAccept")
    SetTriggerOption("shoumuAccept7","group","shoumuAccept")
    SetTriggerOption("shoumuAccept8","group","shoumuAccept")
    SetTriggerOption("shoumuAccept9","group","shoumuAccept")
    EnableTriggerGroup("shoumuAccept",false)
    DeleteTriggerGroup("shoumuFight")
	create_trigger_t('shoumuFight1','^(> )*盗墓贼「啪」的一声倒在地上','','shoumuBack')
    create_trigger_t('shoumuFight7',"^(他|她)装备着：$",'','npcWeapon')
    SetTriggerOption("shoumuFight1","group","shoumuFight")
    SetTriggerOption("shoumuFight7","group","shoumuFight")
    EnableTriggerGroup("shoumuFight",false)
    create_trigger_t('shoumuFight1','^(> )*盗墓贼「啪」的一声倒在地上','','shoumuBack')
    create_trigger_t('shoumuFight7',"^(他|她)装备着：$",'','npcWeapon')
    SetTriggerOption("shoumuFight1","group","shoumuFight")
    SetTriggerOption("shoumuFight7","group","shoumuFight")
    EnableTriggerGroup("shoumuFight",false)
    DeleteTriggerGroup("shoumuFinish")
    create_trigger_t('shoumuFinish1','^(> )*黄蓉欣喜的说道：你干的很出色，这是给你的奖励。','','shoumuFinishT')
    SetTriggerOption("shoumuFinish1","group","shoumuFinish")
    EnableTriggerGroup("shoumuFinish",false)
    DeleteTriggerGroup("shoumudebug")
    create_trigger_t('shoumudebug1','^(> )*看来该找机会逃跑了','','shoumudebugFind')
    SetTriggerOption("shoumudebug1","group","shoumudebug")
    EnableTriggerGroup("shoumudebug",true)
end
jobFindAgain = jobFindAgain or {}
jobFindAgain["shoumu"] = "shoumuFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["shoumu"] = "shoumuFindFail"
function shoumuFindAgain()
    return go(shoumuFindAct,dest.area,dest.room)
end
function shoumuFindFail()
    EnableTriggerGroup("shoumuFight",false)
    --EnableTriggerGroup("shoumuFind",false)
    return go(shoumuFangqi,"武当山","三清殿")
end
faintFunc = faintFunc or {}
faintFunc["shoumu"] = "shoumuFaint"
function shoumuFaint()
    return shoumuFindFail()
end
function shoumulevel(n,l,w)
    job.level=w[2]
    messageShow('WD job level:【'..job.level..'】')
end
function shoumuTriggerDel()
    DeleteTriggerGroup("shoumudebug")
    DeleteTriggerGroup("shoumuAsk")
    DeleteTriggerGroup("shoumuAccept")
    DeleteTriggerGroup("shoumuFight")
    DeleteTriggerGroup("shoumuFinish")
    DeleteTriggerGroup("shoumuFind")
end
function shoumuNobody()
    EnableTriggerGroup("shoumuAsk",false)
    shoumu()
end
job.list["shoumu"] ="武当杀恶贼"
function shoumu()
    if hp.shen<0 then
	   return turnShen('+')
	end
	  dis_all()
    shoumuTrigger()
    job.level=nil
    job.addr = nil
    job.title = nil
    job.lost=0
    job.name='shoumu'
    return check_halt(shoumuGo)
end
function shoumuGo()
    return go(shoumuBegin,"武当山","三清殿")
end
function shoumuBegin()
    if newbie==1 then return zhunbeineili(wdstart) else return wdstart() end
end
function wdstart()
    return prepare_lianxi(shoumuStart)
end
function shoumuStart()
    EnableTriggerGroup("shoumuAsk",true)
    flag.idle = nil
    return exe('ask song yuanqiao about job')
end
function shoumuAsk()
    EnableTriggerGroup("shoumuAsk",false)
    EnableTriggerGroup("shoumuAccept",true)
end
function shoumuBusy()
    EnableTriggerGroup("shoumuAccept",false)
	job.last='shoumu'
    return check_bei(shoumuBusyDazuo)
end
function shoumuBusyDazuo()
    exe('n')
    return prepare_lianxi(shoumu)
end
function shoumuFail()
    EnableTriggerGroup("shoumuAccept",false)
    job.wdtime=os.time() + 40
   if job.level=='已入化境' then
      job.level='未知'
    messageShow('武当任务：当前接到【已入化境】任务，现在开始化任务等级为【'..job.level..'】！','red')
		return check_bei(shoumuHuajing_GoAgain)
	 end
    shoumuTriggerDel()
    job.lost=0
    job.last='shoumu'
   if score.party=='华山派' and hp.shen<0 then
    return clb()
   end
   return check_heal()
end
function shoumuFind(n,l,w)
    nobusy=1
    job.time.b=os.time()
    job.last='shoumu'
    job.killer={}
	--Note(job.where)
end
function shoumuNpc(n,l,w)
    EnableTriggerGroup("shoumuAccept",false)
    EnableTrigger("shoumuAccepta",true)
    EnableTrigger("shoumuAcceptb",true)
	sxjob.skills=tostring(w[3])
   if string.find(sxjob.skills,"棍") then
       exe('set po 枪')
    elseif string.find(sxjob.skills,"杖") then
       exe('set po 枪')
    elseif string.find(sxjob.skills,"棒") then
       exe('set po 枪')
    elseif string.find(sxjob.skills,"杵") then
       exe('set po 枪')
    elseif string.find(sxjob.skills,"一阳指") then
       exe('set po 枪')
    elseif string.find(sxjob.skills,"剑") then
       exe('set po 剑')
    elseif string.find(sxjob.skills,"针") then
       exe('set po 剑')
    elseif string.find(sxjob.skills,"刀") then
       exe('set po 刀')
    elseif string.find(sxjob.skills,"鞭") then
       exe('set po 索')
    elseif string.find(sxjob.skills,"银索金铃") then
       exe('set po 索')
    elseif string.find(sxjob.skills,"含沙射影") then
       exe('set po 箭')
    elseif string.find(sxjob.skills,"弹指神通") then
       exe('set po 箭')
    elseif string.find(sxjob.skills,"漫天花雨") then
       exe('set po 箭')
    elseif string.find(sxjob.skills,"夺命金花") then
       exe('set po 箭')
    elseif string.find(sxjob.skills,"匕") then
       exe('set po 鞭')
    elseif string.find(sxjob.skills,"斧") then
       exe('set po 鞭')
    elseif string.find(sxjob.skills,"令") then
       exe('set po 鞭')
    elseif string.find(sxjob.skills,"钩") then
       exe('set po 鞭')
    elseif string.find(sxjob.skills,"轮") then
       exe('set po 鞭')
    elseif string.find(sxjob.skills,"笔") then
       exe('set po 鞭')
    else
       exe('set po 掌')
    end
end
function shoumuFindGo()
  EnableTriggerGroup("shoumuAccept",false)
    dest.room=job.room
    dest.area=job.area
	job.wdtime=os.time() + 8*60
      exe('nick 武当任务'..job.where)
      exe('set no_kill_ap')
	pfmjineng()
    if not job.room or not path_cal() then
       messageShow('武当任务：任务地点【'..job.where..'】不可到达，任务放弃。')
       return check_bei(shoumuFangqi)
    end
	if skillIgnores[sxjob.skills] then
       messageShow('武当任务：'.. job.target ..'使用的武功是【'..sxjob.skills..'】不可力敌，任务放弃。')
	   return check_bei(shoumuFangqi)
	end
	if job.level=='已入化境' then
		return check_bei(shoumuHuajing_Fangqi)
	end
	   messageShow('武当任务概要：任务地点【'..job.where..'】，人物姓名【'..job.target..'】，使用技能【'..sxjob.skills..'】！')
	   messageShow('武当任务：现在开始前往【'..job.where..'】！')
       return check_bei(shoumuFind)
end
function shoumuHuajing_Fangqi()
    EnableTriggerGroup("shoumuAccept",false)
    messageShow('武当任务：假装放弃已入化境!','greenyellow')
    return check_bei(shoumuFangqiAsk)
end
function shoumuHuajing_GoAgain()
	job.wdtime=os.time() + 5*60
	messageShow('武当任务概要：任务地点【'..job.where..'】，人物姓名【'..job.target..'】，使用技能【'..sxjob.skills..'】！','greenyellow')
  messageShow('武当任务：现在开始前往【'..job.where..'】！','greenyellow')
       return check_bei(shoumuFind)
end
function shoumuFangqiGo()
    DeleteTimer("shoumu")
    messageShow('被武当任务NPC打晕了，任务放弃！')
    geta()
    go(shoumuFangqi,'武当山','三清殿')
end
function shoumuFangqi()
exe('nick 武当任务放弃')
    exe('unset no_kill_ap')
    dis_all()
flag.idle = nil
job.level = nil
job.addr = nil
job.title = nil
job.lost = 0
nobusy=0
    EnableTriggerGroup("shoumuAccept",false)
    check_bei(shoumuFangqiAsk)
end
function shoumuFangqiAsk()
    EnableTriggerGroup("shoumuAsk",true)
    exe('ask song yuanqiao about 放弃')
end
function shoumuFind()
    DeleteTriggerGroup("shoumuFind")
    create_trigger_t('shoumuFind1','^(> )*\\D*'..job.addr..''..job.title..' '..job.target..'\\((\\D*)\\)','','shoumuTarget')
    create_trigger_t('shoumuFind2',"^(> )*".. job.target .."对着你发出一阵阴笑，说道",'','shoumuFindKill')
    SetTriggerOption("shoumuFind1","group","shoumuFind")
    SetTriggerOption("shoumuFind2","group","shoumuFind")
    flag.times=1
    flag.robber=false
	exe('unset wimpy;jifa all;set wimpycmd pfmpfm\\hp')
    go(shoumuFindAct,job.area,job.room)    
end
function shoumudebugFind()
    DeleteTriggerGroup("shoumuFind")
    create_trigger_t('shoumuFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)','','shoumuTarget')
    SetTriggerOption("shoumuFind1","group","shoumuFind")
    flag.times=1
    flag.robber=false
	exe('unset wimpy;jifa all;set wimpycmd pfmpfm\\hp')
    go(shoumuFinddebug,job.area,job.room)    
end
function shoumuFinddebug()
    EnableTriggerGroup("shoumuFind",true)
    DeleteTimer("shoumu")
    job.flag()
    exe('look')
    find()
    messageShow('武当任务：开始重新寻找【'..dest.area .. dest.room ..'】的'..'【'.. job.target ..'】！')
end
function shoumuFindAct()
    EnableTriggerGroup("shoumuFind",true)
    DeleteTimer("shoumu")
    job.flag()
    exe('look')
    find()
    messageShow('武当任务：已到达任务地点【'..job.where..'】，开始寻找【'..dest.area .. dest.room ..'】的'..'【'.. job.target ..'】！')
end
function shoumuFindKill()
    dis_all()
    flag.robber=true
    EnableTriggerGroup("shoumudebug",true)
    EnableTrigger("shoumuFind1",true)
    exe('look')
end
function shoumuTarget(n,l,w)
    EnableTriggerGroup("shoumuFind",false)
    dis_all()
    EnableTriggerGroup("shoumudebug",true)
    EnableTriggerGroup("shoumuFight",true)
    EnableTrigger("hpheqi1",true)
    job.id=string.lower(w[2])
    job.killer[job.target]=job.id
    exe('follow '..job.id)
	exe('look '..job.id)
    exe('unset no_kill_ap')
       shoumuKillAct()
      create_timer_s('shoumu',5,'shoumuMove')
end
function shoumuMove()
	if job.id then
	   exe('kick '..job.id)
	   exe('kill '..job.id)
	end
end
function shoumuLost(n,l,w)
    job.lost=job.lost+1
    if job.lost>2 then
       job.lost=0
    messageShow('武当任务：搜索丢失【'.. job.target ..'】两次！回去放弃！')
       return check_halt(shoumuFindFail)
    end
    if job.id==Trim(w[2]) then
       dis_all()
    EnableTriggerGroup("shoumudebug",true)
       return shoumuFind()
    end
end
function shoumuKill()
    wait.make(function()
         wait.time(0.2)
	 shoumuKillAct()
    end)
end
function shoumuKillAct()
fight.time.b=os.time()
    flag.robber=true
    exe('set wimpy 99;yield no')
    exe('kick '..job.id)
    exe('kill '..job.id)
end
function shoumuBack(n,l,w)
    DeleteTimer("shoumu")
    if w[2]==job.target then
       EnableTriggerGroup("shoumuFight",false)
       EnableTriggerGroup("shoumuFinish",true)
       tmp.number=0
       DeleteTimer("perform")
	   DeleteTimer("shoumu")
       check_halt(shoumuBackGet)
       fight.time.e=os.time()
       fight.time.over=fight.time.e-fight.time.b
       messageShowT('武当任务：搞定'..'【'.. job.target ..'】！战斗用时:【'..fight.time.over..'】秒。')
    end
end
function shoumuBackGet()
    geta()
    shoumuCk=0
    EnableTriggerGroup("shoumuFinish",true)
    return go(shoumuFinishWait,'武当山','三清殿')
end
function shoumuFinishWait()
    if locl.id["黄蓉"] then
	   return shoumuFinishC()
        else
	   return go(shoumuFinishWait,'武当山','三清殿')
    end
end
function shoumuFinishT()
	print('老宋夸我干得好。')
	job.wdtime=0
end
function shoumuFinishC()
	print('等待老宋发奖励。')
    if shoumujobok==0 and shoumuCk<5 then
    wait.make(function()
         wait.time(1)
	shoumuCk=shoumuCk+1
	exe('out;enter')
	return shoumuFinishC()
    end)
    else
	return shoumuFangqi()
    end
end
function shoumuFinish()
    EnableTriggerGroup("shoumuFinish",false)
    shoumuTriggerDel()
    shoumujobok=0
    shoumuCk=0
    nobusy=0
    job.lost=0
    job.last='shoumu'
    return check_halt(check_food)
end
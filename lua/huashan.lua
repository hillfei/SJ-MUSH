-------华山
local huashanArea1={
	["菜地"]="华山村",
	["杂货铺"]="华山村",
	["民房"]="华山村",
	["酒肆"]="华山村",
	["铁匠铺"]="华山村",
	["东村口"]="华山村",
	["碎石路"]="华山村",
	["玄坛庙"]="华山村",
	["苍龙岭"]="华山",
	["侧廊"]="华山",
	["瀑布"]="华山",
	["朝阳峰"]="华山",
	["镇岳宫"]="华山",
	["猢狲愁"]="华山",
	["莎萝坪"]="华山",
	["千尺幢"]="华山",
	["百尺峡"]="华山",
	["青柯坪"]="华山",
	["舍身崖"]="华山",
	["松树林"]="华山",
	["玉女峰"]="华山",
	["玉泉院"]="华山",
	["思过崖"]="华山",
	["药房"]="华山",
	["后堂"]="华山",
	["山涧"]="华山",
	["小溪"]="华山",
	["祭坛"]="华山",
	["思过崖洞口"]="华山",
	["山路"]="华山",
	["石屋"]="华山",
	["树林"]="华山",
	["华山脚下"]="华山",
	["山洪瀑布"]="华山",
	["练武场"]="华山",
	["饭厅"]="华山",
	["书房"]="华山",
	["饭厅"]="华山",
	["剑房"]="华山",
	["前厅"]="华山",
	["台阶"]="华山",
	["正气堂"]="华山",
	["寝室"]="华山",
	["休息室"]="华山",
	["老君沟"]="华山",
	["小山路"]="华山",
}
job.list["huashan"] ="华山惩恶扬善"
function huashan()
    hsjob2=0
    dis_all()
    huashan_trigger()
    job.name='huashan'
    job.target='任务目标'
    return huashan_start()
end
jobFindAgain = jobFindAgain or {}
jobFindAgain["huashan"] = "huashanFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["huashan"] = "huashanFindFail"
function huashanFindAgain()
    return go(find,dest.area,dest.room)
end
function huashanFindFail()
    return go(huashan_shibai,'华山','正气堂')
end
function huashan_start()
	DeleteTriggerGroup("all_fight")
    DeleteTriggerGroup("huashan_fight")
    DeleteTriggerGroup("huashan_cut")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    DeleteTriggerGroup("huashan_over")
    DeleteTriggerGroup("huashan_find")
    flag.idle = nil
    return go(hsaskjob,'华山','正气堂')
end
function hsaskjob()
    if newbie==1 then return zhunbeineili(job_huashan) else return job_huashan() end
end
function job_huashan()
    EnableTriggerGroup("huashan_ask",true)
    exe('ask yue buqun about job')
end
function huashan_trigger()
    DeleteTriggerGroup("huashan_find")
    DeleteTriggerGroup("huashan_ask")
    create_trigger_t('huashan_ask1',"^(> )*你向岳不群打听有关『job』的消息。$",'','huashan_ask')
    create_trigger_t('huashan_ask2',"^(> )*这里没有这个人。$",'','huashan_nobody')
    SetTriggerOption("huashan_ask1","group","huashan_ask")
    SetTriggerOption("huashan_ask2","group","huashan_ask")
    EnableTriggerGroup("huashan_ask",false)
    DeleteTriggerGroup("huashan_accept")
    create_trigger_t('huashan_accept1',"^(> )*岳不群说道：「你不能光说呀，倒是做出点成绩给我看看！",'','huashan_shibai')
    create_trigger_t('huashan_accept2',"^(> )*岳不群说道：「你现在正忙着做其他任务呢！",'','huashan_busy')
    create_trigger_t('huashan_accept3',"^(> )*岳不群说道：「现在没有听说有恶人为害百姓",'','huashan_fangqi')
    create_trigger_t('huashan_accept4',"^(> )*岳不群给了你一块令牌。$",'','huashan_npc')
	create_trigger_t('huashan_accept5',"^(> )*岳不群对你说道：你还是先去思过崖面壁思过去吧。",'','huashanjjQuest')
	create_trigger_t('huashan_accept6',"^(> )*岳不群说道：「现在没有听说有恶人为害百姓，你自己去修习武功去吧！」",'','huashan_fangqi')
	SetTriggerOption("huashan_accept1","group","huashan_accept")
    SetTriggerOption("huashan_accept2","group","huashan_accept")
    SetTriggerOption("huashan_accept3","group","huashan_accept")
	SetTriggerOption("huashan_accept4","group","huashan_accept")
	SetTriggerOption("huashan_accept5","group","huashan_accept")
    SetTriggerOption("huashan_accept6","group","huashan_accept")
    EnableTriggerGroup("huashan_accept",false)
    DeleteTriggerGroup("huashan_npc")
    create_trigger_t('huashan_npc1',"^(> )*(冷不防|突然|猛地|忽然|冷不丁)从树林\\D*你的令牌，向(\\D*)(处|方向)\\D*逃去。$",'','huashan_where')
    create_trigger_t('huashan_npc2',"^(> )*你一把抓向蒙面人试图抢回令牌，但被蒙面人敏捷得躲了过去，你顺手扯下蒙面人的面罩，发现原来是曾经名震江湖的(\\D*)。",'','huashan_find')
    create_trigger_t('huashan_npc3','^(> )*你把 "hsjob" 设定为 "闲逛中" 成功完成。','','huashan_npc_goon')
    SetTriggerOption("huashan_npc1","group","huashan_npc")
    SetTriggerOption("huashan_npc2","group","huashan_npc")
    SetTriggerOption("huashan_npc3","group","huashan_npc")
    EnableTriggerGroup("huashan_npc",false)
	DeleteTriggerGroup("huashanQuest")
	create_trigger_t('huashanQuest1',"^(> )*岳不群说道：「".. score.name .."你杀了不少恶人，未免杀气过重不如上思过崖面壁忏悔吧",'','huashanDgjj')
	SetTriggerOption("huashanQuest1","group","huashanQuest")
	EnableTriggerGroup("huashanQuest",false)
end
function huashan_triggerDel()
	DeleteTriggerGroup("all_fight")
    DeleteTriggerGroup("huashan_find")
    DeleteTriggerGroup("huashan_ask")
    DeleteTriggerGroup("huashan_accept")
    DeleteTriggerGroup("huashan_npc")
    DeleteTriggerGroup("huashan_fight")
    DeleteTriggerGroup("huashan_cut")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    DeleteTriggerGroup("huashan_over")
	DeleteTriggerGroup("huashanQuest")
end
function huashan_ask()
    EnableTriggerGroup("huashan_ask",false)
    EnableTriggerGroup("huashan_accept",true)
end
function huashan_nobody()
    EnableTriggerGroup("huashan_ask",false)
    return huashan_start()
end
function huashan_shibai()
    EnableTriggerGroup("huashan_accept",false)
	kezhiwugongclose()
    return check_busy(huashan_shibai_b)
end
function huashan_shibai_b()
	flag.idle = nil
    DeleteTriggerGroup("all_fight")
	kezhiwugongclose()
    huashan_triggerDel()
    Execute('ask yue buqun about 失败')
	if job.where~=nil and string.find(job.where,"侠客岛") then
		mjlujingLog("侠客岛")
	end
    messageShow('华山任务：任务失败。')
    return check_halt(check_food)
end
function huashan_fangqi()
    DeleteTriggerGroup("all_fight")
	kezhiwugongclose()
    huashan_triggerDel()
    job.last="huashan"
    hsjob2=0
    --if job.zuhe["wudang"] then
    --   job.last='wudang'
    --end
    return check_halt(check_food)
end
function huashan_busy()
    EnableTriggerGroup("huashan_accept",false)
    return check_bei(huashan_busy_dazuo)
end
function huashan_busy_dazuo()
    exe('#3s')
    return prepare_lianxi(check_heal)
end
function huashan_npc()
    exe('nick 华山任务中')
    job.time.b=os.time()
	if hsjob2<1 then
		messageShow('华山任务：开始任务。')
	end
	exe('set wimpy 100')
    EnableTriggerGroup("huashan_accept",false)
	job.last="huashan"
    return check_bei(huashan_npc_go)
end
function huashan_npc_go()
    go(huashan_npc_get,'华山','山脚下')
end
function huashan_npc_get()
    EnableTriggerGroup("huashan_npc",true)
    exe('unset wimpy;set wimpycmd pfmpfm\\hp')
    exe('s')
    return check_bei(huashan_npc_goon)
end
function huashan_npc_goon()
    exe('n;e;e')
    locate()
    return check_busy(huashan_ssl,1)
end
function huashan_ssl()
    if locl.room=="石屋" or locl.room=="玉泉院" then
       return check_bei(huashan_npc_ssl)
    else
       return check_bei(huashan_npc_goon)
    end
end
function huashan_npc_ssl()
    return exe('w;s;s;alias hsjob 闲逛中')    
end
huashan_where=function(n,l,w)
    job.where=tostring(w[3])
	print("1"..job.where)
end
huashan_find=function(n,l,w)
    local flag_huashan=0
    dis_all()
    job.target=tostring(w[2])
	job.killer={}
	job.killer[job.target]=true
    DeleteTriggerGroup("huashan_find")
    create_trigger_t('huashan_find1','^( )*'..job.target..'\\((\\D*)\\)','','huashan_fight')
    create_trigger_t('huashan_find2','^(> )*看起来(\\D*)想杀死你！','','huashan_debug_fight')
    create_trigger_t('huashan_find3','^(> )*采花大盗正盯着你看，不知道打些什么主意。','','huashan_dadao')
    SetTriggerOption("huashan_find1","group","huashan_find")
    SetTriggerOption("huashan_find2","group","huashan_find")
    SetTriggerOption("huashan_find3","group","huashan_find")
   if string.find(job.where,"洗象池") or string.find(job.where,"地下黑拳市") then
       messageShow('华山任务②：任务地点【'..job.where..'】不可到达，任务放弃。')
       return check_halt(huashanFindFail)
    end
	print("2"..job.where)
	if huashanArea1[job.where] then
		dest.room=job.where
		dest.area=huashanArea1[job.where]
	else
		dest.room,dest.area=getAddr(job.where)
	end
	if not dest.room or not path_cal() then
		messageShow('华山任务：任务地点【'..job.where..'】不可到达，任务放弃。',"Plum")
		return check_halt(huashanFindFail)
	end
	--print(dest.room,dest.area)
	messageShow('华山任务：追杀逃跑到【'..job.where..'】的【'..job.target..'】。')
	return go(huashanFindAct,dest.area,dest.room)
end
function huashan_debug_fight()
  --dis_all()
  EnableTrigger("huashan_find1",true)
  exe('look')
end
function huashanFindAct()
    EnableTriggerGroup("huashan_find",true)
    job.flag()
    exe('look')
    find()
end
function huashanFindKill()
    dis_all()
    EnableTrigger("huashan_find1",true)
    exe('look')
end
huashan_dadao=function()
    dis_all()
    exe('yes')
    return go(huashanFindAct,dest.area,dest.room)
end
huashan_fight=function(n,l,w)
    EnableTrigger("huashan_find2",false)
    job.id=string.lower(w[2])
    exe('unset no_kill_ap;yield no')
    exe('follow '..job.id)
	job.killer[job.target]=job.id

	exe('pfmwu')
	exe('set wimpy 100;set wimpycmd pfmpfm\\hp')
	exe('kill '..job.id)
	
	--kezhiwugong(job.target,job.id,'pfmpfm')
	dis_all()
    kezhiwugong()
	kezhiwugongAddTarget(job.target,job.id)
    fight.time.b=os.time()
    EnableTrigger("hpheqi1",true)
    DeleteTriggerGroup("huashan_fight")
    create_trigger_t('huashan_fight1','^(> )*'..job.target..'「啪」的一声倒在地上','','huashan_cut')
    create_trigger_t('huashan_fight2','^(> )*'..job.target..'神志迷糊，脚下一个不稳，倒在地上昏了过去。','','huashan_faint')
    create_trigger_t('huashan_fight3','^(> )*'..job.target..'匆匆离开。','','huashanFindFail')
    create_trigger_t('huashan_fight4','^(> )*这里没有 '..job.id..'。','','huashanFindAct')
    SetTriggerOption("huashan_fight1","group","huashan_fight") 
    SetTriggerOption("huashan_fight2","group","huashan_fight")
    SetTriggerOption("huashan_fight3","group","huashan_fight") 
	SetTriggerOption("huashan_fight4","group","huashan_fight") 
	
end
huashan_faint=function()
    exe('unset wimpy;kill '..job.id)
end
huashan_cut=function()
    EnableTriggerGroup("huashan_fight",false)
    EnableTriggerGroup("huashan_find",false)
    DeleteTriggerGroup("huashan_cut")
    create_trigger_t('huashan_cut1','^(> )*只听“咔”的一声，你将(\\D*)的首级斩了下来，提在手中。','','huashan_cut_con')
    create_trigger_t('huashan_cut2','^(> )*(乱切别人杀的人干嘛啊|你手上这件兵器无锋无刃|你得用件锋利的器具才能切下这尸体的头来)','','huashan_cut_weapon')
    SetTriggerOption("huashan_cut1","group","huashan_cut") 
    SetTriggerOption("huashan_cut2","group","huashan_cut")
	job.killer={}
       fight.time.e=os.time()
       fight.time.over=fight.time.e-fight.time.b
	messageShowT('华山任务：战斗用时:【'..fight.time.over..'】秒,搞定蒙面人：【'..job.target..'】。')
    return check_busy(huashan_cut_act)
end
huashan_cut_act=function()
    DeleteTimer('perform')
    weapon_unwield()
    weaponWieldCut()
	check_halt(huashan_cut2)
end
huashan_cut2=function()
    for i=1,4 do
       exe('halt;get ling pai from corpse '..i)
       exe('qie corpse '..i)
    end
end
huashan_cut_weapon=function()
    return check_halt(huashan_cut_act,1)
end
huashan_cut_con=function(n,l,w)
    DeleteTriggerGroup("all_fight")
	kezhiwugongclose()
	exe('pfmset')
	flag.find=1
    if job.target~=tostring(w[2]) then
       exe('drop head')
       return check_halt(huashan_cut_act)
    else
       EnableTriggerGroup("huashan_cut",false)
       return go(huashan_yls,'华山','祭坛')
    end
end
huashan_yls=function()
    DeleteTriggerGroup("huashan_yls")
    create_trigger_t('huashan_yls1','^(> )*(这里没有这个人。|你身上没有这样东西。|这人好象不是你杀的吧？|你的令牌呢|你还没有去找恶贼，怎么就来祭坛了？)','','huashan_yls_fail')
    create_trigger_t('huashan_yls2','^(> )*岳灵珊在你的令牌上写下了一个 (一|二) 字。','','huashan_yls_ask')
	create_trigger_t('huashan_yls3','^(> )*这好象不是你领的令牌吧？','','huashan_yls_lingpai')
    SetTriggerOption("huashan_yls1","group","huashan_yls")
    SetTriggerOption("huashan_yls2","group","huashan_yls")
	SetTriggerOption("huashan_yls3","group","huashan_yls")
    return exe('give head to yue lingshan;hp')
end
huashan_yls_fail=function()
    EnableTriggerGroup("huashan_yls",false)
	if locl.room~="祭坛" then
	   return go(huashan_yls,'华山','祭坛')
	end
    exe('out;w;s;se;su;su;s')
    return check_halt(huashan_shibai_b)
end
huashan_yls_lingpai=function()
    EnableTriggerGroup("huashan_yls",false)
	exe('drop ling pai')
    return check_halt(huashan_yls)
end
huashan_yls_ask=function(n,l,w)
    EnableTriggerGroup("huashan_yls",false)    
    DeleteTriggerGroup("huashan_yls_ask")
    create_trigger_t('huashan_yls_ask1','^(> )*你向岳灵珊打听有关『力不从心』的消息。','','huashan_yls_back')
    SetTriggerOption("huashan_yls_ask1","group","huashan_yls_ask")
    EnableTriggerGroup("huashan_yls_ask",false)
    if w[2]=='二' then
       return huashan_yls_back()
    end
    if w[2]=='一' and dohs2==0 then
       return check_bei(huashan_yls_lbcx)
    else
       return check_bei(huashan_heal)
    end
end
huashan_heal=function()
    exe('set no_kill_ap')
    return check_bei(huashan_neili)
end
huashan_neili=function()
    hsjob2=1
    return prepare_neili(huashan_npc)
end
huashan_yls_lbcx=function()
    EnableTriggerGroup("huashan_yls_ask",true)
	weapon_unwield()
    return exe('drop head;askk yue lingshan about 力不从心')
end
huashan_yls_back=function()
    EnableTriggerGroup("huashan_yls_ask",false)
	EnableTriggerGroup("huashanQuest",true)
    DeleteTriggerGroup("huashan_over")
    create_trigger_t('huashan_over1','^(> )*你给岳不群一块令牌。','','huashan_finish')
    create_trigger_t('huashan_over2','^(> )*这里没有这个人。','','')
    SetTriggerOption("huashan_over1","group","huashan_over")
    SetTriggerOption("huashan_over2","group","huashan_over")
    return go(huashan_over,'华山','正气堂')
end
huashan_over=function()
    weapon_unwield()
	EnableTriggerGroup("huashanQuest",true)
    return exe('give ling pai to yue buqun')
end
huashan_finish=function()
    map.rooms["village/zhongxin"].ways["northwest"]="village/caidi"
    map.rooms["village/zhongxin"].ways["northeast"]="village/caidi"
    EnableTriggerGroup("huashan_over",false)
	EnableTriggerGroup("huashanQuest",true)
    flag.times=1
    hsjob2=0
	exe('drop ling pai')
	job.time.e=os.time()
	job.time.over=job.time.e-job.time.b
    messageShowT('华山任务：完成任务，用时:【'..job.time.over..'】秒。')
	--jobExpTongji()
  huashan_triggerDel()
  --if job.zuhe["wudang"] then
  --     job.last='wudang'
  --end
	return check_halt(check_food)
end
function huashanDgjj()
    if score.party and score.party=="华山派" then messageShow ('华山任务：出现面壁提示了！') end
    return huashan_finish()
end
function huashanjjQuest()
    EnableTriggerGroup("huashan_accept",false)
 if score.party and score.party=="华山派" then
    messageShow ('华山任务：提示要求面壁思过，停止做华山任务')
	job.zuhe["huashan"] = nil
	return check_heal()
 else
    return huashan_finish()
 end
end


--shoumu
------�һ�����Ĺ

ask huang about ��Ĺ
������ش����йء���Ĺ������Ϣ��
����˵�������ѵ�����������⣬������ĸ�׵�Ĺ���������ܽ�ȥ�ġ���
���������룬˵��: ������,�Ҵ���ȥ!
������Ż��أ���һת����һת����һ��͵���Ĺǰ��
wield xiao
ʯ�� - east��north��south��west
���������������˵��: ��Ҫ�ú���Ĺ�������ʲô�˽���Ĺ��㲻Ҫ��������!
> ����æ���ء�
> ����˵�꣬�͸�æ���뿪�ˡ�
ͻȻ���ӱ��ߵ��һ����д���һ����Ĺ�������ʯ�ؾͲ����ˡ�


^??����˵�������Ѿ�����ȥ��Ĺ��
^??����˵�������Բ�����������û��
^??����˵������*��Ϣһ��ɡ��� busy
^??�����ɻ�Ŀ�����,˵��: ���ڴ����ģ���ʲôĹѽ? busy
^??������Ż��أ���һת����һת����һ��͵���Ĺǰ��
bbb {ask rong about ʦĸ;bbb {ask rong about ��Ĺ}}
timenn=%time("nn");
timess=%time("ss");
#t- sm_ask;
#t+ sm_enter;
wield xiao

^??ͻȻ����%x�һ����д���һ����Ĺ��
#4 {kneel mubei};
bbb {#3 {push mubei left};
bbb {#3 {push mubei right};
bbb {d;
time}}}

^??������*��*��*��{��|��}ʱ{����|����}��
u;u;d;s;d;s;d;su;d;kick daomu zei
^??������*��*��*��{��|��}ʱ{��|һ��}
u;u;d;su;d;su;d;se;d;kick daomu zei
^??������*��*��*��{��|δ}ʱ{����|����}
u;u;d;n;d;n;d;nu;d;kick daomu zei
^??������*��*��*��{��|δ}ʱ{��|һ��}��
u;u;d;nu;d;nu;d;nw;d;kick daomu zei
^??������*��*��*��{î|��}ʱ{����|����}
u;u;d;se;d;se;d;e;d;kick daomu zei
^??������*��*��*��{î|��}ʱ{��|һ��}
u;u;d;e;d;e;d;ne;d;kick daomu zei
^??������*��*��*��{��|��}ʱ{����|����}
u;u;d;sw;d;sw;d;sd;d;kick daomu zei
^??������*��*��*��{��|��}ʱ{��|һ��}
u;u;d;sd;d;sd;d;s;d;kick daomu zei
^??������*��*��*��{��|��}ʱ{����|����}��
u;u;d;ne;d;ne;d;nd;d;kick daomu zei
^??������*��*��*��{��|��}ʱ{��|һ��}��
u;u;d;nd;d;nd;d;n;d;kick daomu zei
^??������*��*��*��{��|��}ʱ{����|����}
u;u;d;nw;d;nw;d;w;d;kick daomu zei
^??������*��*��*��{��|��}ʱ{��|һ��}
u;u;d;w;d;w;d;sw;d;kick daomu zei
^??��Ĺ����ž����һ�����ڵ���
bbb {#t- sm_fight;
get all from corpse;
drop cloth;
get zhuanji;
#t+ sm_out;
u}

^??��Ĺ������ææ�뿪�ˡ�
bbb {#t- sm_fight;
#t+ sm_out;
u};
log %e[1m%e[14m�һ�������ʧ��

^??��������Ĺ����ɱ���㣡
kill zei

give rong all;
function shoumuTrigger()
    DeleteTriggerGroup("shoumuAsk")
    create_trigger_t('shoumuAsk1',"^(> )*������ش����й�",'','shoumuAsk')
    create_trigger_t('shoumuAsk2',"^(> )*����û������ˡ�$",'','shoumuNobody')
    SetTriggerOption("shoumuAsk1","group","shoumuAsk")
    SetTriggerOption("shoumuAsk2","group","shoumuAsk")
    EnableTriggerGroup("shoumuAsk",false)
    DeleteTriggerGroup("shoumuAccept")
    create_trigger_t('shoumuAccept1',"^(> )*���������������˵��: ��Ҫ�ú���Ĺ�������ʲô�˽���Ĺ��㲻Ҫ��������!",'','shoumuFind')
    create_trigger_t('shoumuAccept2',"^(> )*����˵�������Ѿ�����ȥ��Ĺ",'','shoumuFangqi')
    create_trigger_t('shoumuAccept3',"^(> )*��������Ķ�������˵��(\\D*)��Ϊ�ó�(\\D*)�Ĺ���",'','shoumuNpc')
    create_trigger_t('shoumuAccept4',"^(> )*����˵����������æ�ű��������",'','shoumuFail')
    create_trigger_t('shoumuAccept5',"^(> )*����˵�������Բ�����������û��",'','shoumuFail')
    create_trigger_t('shoumuAccept6',"^(> )*����˵������������ʱû���ʺ���Ĺ���",'','shoumuFail')
    create_trigger_t('shoumuAccept7',"^(> )*����˵��������ʱû��������Ҫ�������һ���������",'','shoumuFail')
    create_trigger_t('shoumuAccept8',"^(> )*����(����|)˵����(��|)\\D*��(�������ȷʵ�Ƚ������|��̫����ʧ����)",'','shoumuFail')
    create_trigger_t('shoumuAccept9',"^(> )*����˵������\\D*������û��������������Ϲ����ʲôѽ",'','shoumuFail')
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
	create_trigger_t('shoumuFight1','^(> )*��Ĺ����ž����һ�����ڵ���','','shoumuBack')
    create_trigger_t('shoumuFight7',"^(��|��)װ���ţ�$",'','npcWeapon')
    SetTriggerOption("shoumuFight1","group","shoumuFight")
    SetTriggerOption("shoumuFight7","group","shoumuFight")
    EnableTriggerGroup("shoumuFight",false)
    create_trigger_t('shoumuFight1','^(> )*��Ĺ����ž����һ�����ڵ���','','shoumuBack')
    create_trigger_t('shoumuFight7',"^(��|��)װ���ţ�$",'','npcWeapon')
    SetTriggerOption("shoumuFight1","group","shoumuFight")
    SetTriggerOption("shoumuFight7","group","shoumuFight")
    EnableTriggerGroup("shoumuFight",false)
    DeleteTriggerGroup("shoumuFinish")
    create_trigger_t('shoumuFinish1','^(> )*������ϲ��˵������ɵĺܳ�ɫ�����Ǹ���Ľ�����','','shoumuFinishT')
    SetTriggerOption("shoumuFinish1","group","shoumuFinish")
    EnableTriggerGroup("shoumuFinish",false)
    DeleteTriggerGroup("shoumudebug")
    create_trigger_t('shoumudebug1','^(> )*�������һ���������','','shoumudebugFind')
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
    return go(shoumuFangqi,"�䵱ɽ","�����")
end
faintFunc = faintFunc or {}
faintFunc["shoumu"] = "shoumuFaint"
function shoumuFaint()
    return shoumuFindFail()
end
function shoumulevel(n,l,w)
    job.level=w[2]
    messageShow('WD job level:��'..job.level..'��')
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
job.list["shoumu"] ="�䵱ɱ����"
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
    return go(shoumuBegin,"�䵱ɽ","�����")
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
   if job.level=='���뻯��' then
      job.level='δ֪'
    messageShow('�䵱���񣺵�ǰ�ӵ������뻯�����������ڿ�ʼ������ȼ�Ϊ��'..job.level..'����','red')
		return check_bei(shoumuHuajing_GoAgain)
	 end
    shoumuTriggerDel()
    job.lost=0
    job.last='shoumu'
   if score.party=='��ɽ��' and hp.shen<0 then
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
   if string.find(sxjob.skills,"��") then
       exe('set po ǹ')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ǹ')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ǹ')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ǹ')
    elseif string.find(sxjob.skills,"һ��ָ") then
       exe('set po ǹ')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��������") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��ɳ��Ӱ") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��ָ��ͨ") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"���컨��") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"������") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"ذ") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ��')
    elseif string.find(sxjob.skills,"��") then
       exe('set po ��')
    else
       exe('set po ��')
    end
end
function shoumuFindGo()
  EnableTriggerGroup("shoumuAccept",false)
    dest.room=job.room
    dest.area=job.area
	job.wdtime=os.time() + 8*60
      exe('nick �䵱����'..job.where)
      exe('set no_kill_ap')
	pfmjineng()
    if not job.room or not path_cal() then
       messageShow('�䵱��������ص㡾'..job.where..'�����ɵ�����������')
       return check_bei(shoumuFangqi)
    end
	if skillIgnores[sxjob.skills] then
       messageShow('�䵱����'.. job.target ..'ʹ�õ��书�ǡ�'..sxjob.skills..'���������У����������')
	   return check_bei(shoumuFangqi)
	end
	if job.level=='���뻯��' then
		return check_bei(shoumuHuajing_Fangqi)
	end
	   messageShow('�䵱�����Ҫ������ص㡾'..job.where..'��������������'..job.target..'����ʹ�ü��ܡ�'..sxjob.skills..'����')
	   messageShow('�䵱�������ڿ�ʼǰ����'..job.where..'����')
       return check_bei(shoumuFind)
end
function shoumuHuajing_Fangqi()
    EnableTriggerGroup("shoumuAccept",false)
    messageShow('�䵱���񣺼�װ�������뻯��!','greenyellow')
    return check_bei(shoumuFangqiAsk)
end
function shoumuHuajing_GoAgain()
	job.wdtime=os.time() + 5*60
	messageShow('�䵱�����Ҫ������ص㡾'..job.where..'��������������'..job.target..'����ʹ�ü��ܡ�'..sxjob.skills..'����','greenyellow')
  messageShow('�䵱�������ڿ�ʼǰ����'..job.where..'����','greenyellow')
       return check_bei(shoumuFind)
end
function shoumuFangqiGo()
    DeleteTimer("shoumu")
    messageShow('���䵱����NPC�����ˣ����������')
    geta()
    go(shoumuFangqi,'�䵱ɽ','�����')
end
function shoumuFangqi()
exe('nick �䵱�������')
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
    exe('ask song yuanqiao about ����')
end
function shoumuFind()
    DeleteTriggerGroup("shoumuFind")
    create_trigger_t('shoumuFind1','^(> )*\\D*'..job.addr..''..job.title..' '..job.target..'\\((\\D*)\\)','','shoumuTarget')
    create_trigger_t('shoumuFind2',"^(> )*".. job.target .."�����㷢��һ����Ц��˵��",'','shoumuFindKill')
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
    messageShow('�䵱���񣺿�ʼ����Ѱ�ҡ�'..dest.area .. dest.room ..'����'..'��'.. job.target ..'����')
end
function shoumuFindAct()
    EnableTriggerGroup("shoumuFind",true)
    DeleteTimer("shoumu")
    job.flag()
    exe('look')
    find()
    messageShow('�䵱�����ѵ�������ص㡾'..job.where..'������ʼѰ�ҡ�'..dest.area .. dest.room ..'����'..'��'.. job.target ..'����')
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
    messageShow('�䵱����������ʧ��'.. job.target ..'�����Σ���ȥ������')
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
       messageShowT('�䵱���񣺸㶨'..'��'.. job.target ..'����ս����ʱ:��'..fight.time.over..'���롣')
    end
end
function shoumuBackGet()
    geta()
    shoumuCk=0
    EnableTriggerGroup("shoumuFinish",true)
    return go(shoumuFinishWait,'�䵱ɽ','�����')
end
function shoumuFinishWait()
    if locl.id["����"] then
	   return shoumuFinishC()
        else
	   return go(shoumuFinishWait,'�䵱ɽ','�����')
    end
end
function shoumuFinishT()
	print('���ο��Ҹɵúá�')
	job.wdtime=0
end
function shoumuFinishC()
	print('�ȴ����η�������')
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
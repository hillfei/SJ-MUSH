local npc_name={}
local npc_id={}
local npc_num=0
local kflag={}
local kezhisuccess=0
local kezhi_order={}
local npc_order={}
kezhi_order={
	["正"]=9,
	["奇"]=8,
	["刚"]=7,
	["柔"]=6,
	["快"]=5,
	["慢"]=4,
	["妙"]=3,
	["险"]=2,
	["空"]=10,
	["无"]=1,
}
local npcdienum={}
function kezhiwugong()
	kezhiwugongclose()
    npc_num=0
	kezhisuccess=0
	npc_name={}
	npc_id={}
	npcdienum={}
-- 正
create_trigger_t('afight1','^(> )*(\\D*)「(劈天盖地满壮志|弯刀逆转倒乾坤|遥看万疆千里雪|壮志豪气满江湖)」','','aszheng')
-- 慕容刀法〖慕容刀法〗属性〖正〗
create_trigger_t('afight2','^(> )*(\\D*)(漫天的轮影|**飞砸|**旋转飞舞|**连续掷出|**合体归一|**飞舞而出|连接在一起的巨龙|阵阵狂风有如刀割|狂风大作，激荡中|**再次合围|接着又飞来一轮|几只**或直飞|**又突然上飞|**便如长上了|轮身嗡嗡震响|大赞叹|大皈依|大常乐|大吉祥|大三昧|大般若|大智慧|大慈悲|大圆满)','','aszheng')
-- 金刚降伏轮〖金刚降伏轮〗属性〖正〗
create_trigger_t('afight3','^(> )*(\\D*)「(横行漠北|排山倒海|马蹴落花|开天辟地|雷电交加|人神共愤)」','','aszheng')
-- 全真剑法〖全真剑法〗属性〖正〗
create_trigger_t('afight4','^(> )*(\\D*)(「虎纵步|「印掌|「横云断峰|「倒提金钟|「烘云托月|「雪拥蓝关|「盘弓射雕|「鸳鸯腿|「仙鹤亮翅|「白露横江|「九转丹成|「横架金梁|接着右掌一招「白虹贯日)」','','aszheng')
-- 震山绵掌〖震山绵掌〗属性〖正〗
create_trigger_t('afight5','^(> )*(\\D*)「(猛虎下山|西风倒卷|飞沙走石|天昏地暗|横扫天下|气吞山河)」','','aszheng')
-- 五虎断门刀〖五虎断门刀〗属性〖正〗
create_trigger_t('afight6','^(> )*(\\D*)(竖掌挡开你，左掌加运内劲，向|手腕一翻，左右两掌分别拍出，|看似全然处于下风，双臂出招极|右手连指三指，逼得你连退三步)','','aszheng')
-- 寒冰神掌〖寒冰神掌〗属性〖正〗
create_trigger_t('afight7','^(> )*(\\D*)(在场中暴走，出手既快且狠|以阴柔之气，左手一翻，格|乘你开口说话，猛然出拳打|拳出如风，砰砰接连四拳，|双目尽赤，一声吆喝，宛似|暗运几口真气，跨上一步，|一拳击出，缩回手臂，又发|双臂一沉一扬，拳如巨刃开|大喝一声，双拳连环虚击，|双目微阖，步法飘忽，轻飘)','','aszheng')
-- 七伤拳〖七伤拳〗属性〖正〗
create_trigger_t('afight8','^(> )*(\\D*)(看准时机一剑刺出，激起呼呼|传动，将一阳指神功化于|剑走，端凝自重，极飘逸的一|渐沉重，使动时略比先前滞涩|晓天初阳|日出霞光|赤日焦阳|晓阳云暖|暮云映日)','','aszheng')
-- 一阳指〖一阳指〗属性〖正〗
create_trigger_t('afight9','^(> )*(\\D*)「(佛恩济世|佛光普照|佛门广渡)」','','aszheng')
-- 一指禅〖一指禅〗属性〖正〗
create_trigger_t('afight10','^(> )*(\\D*)「(划地为牢|追风逐电|左右穿花|倒踢北斗|登云步月|横扫九州|无影无踪|雷霆天下)」','','aszheng')
-- 穿云腿法〖穿云腿法〗属性〖正〗
create_trigger_t('afight11','^(> )*(\\D*)「(白云出岫|天绅倒悬|青山隐隐|古柏森森|苍松迎客|无双无对|落花无意)」','','aszheng')
-- 华山剑法〖华山剑法〗属性〖正〗
create_trigger_t('afight12','^(> )*(\\D*)「(让字诀|打字诀|引字诀|套字诀|藏字诀|错字诀)」','','aszheng')
-- 雁行刀法〖雁行刀法〗属性〖正〗


-- 奇
create_trigger_t('afight13','^(> )*(\\D*)「(以意相求|风回路转|三虚七实|头头是道|翻江倒海|瞒天过海|应左则后|须右仍前|无中生有|天方地园)」','','asqi')
-- 圣火令法〖圣火令法〗属性〖奇〗
create_trigger_t('afight14','^(> )*(\\D*)「(南海礼佛|金玉瓦砾|人命呼吸|镜里观影|水中捉月|浮云去来|水泡出没|梦里明明|觉后空空)」','','asqi')
-- 如来千叶手〖如来千叶手〗属性〖奇〗
create_trigger_t('afight15','^(> )*(\\D*)「(阿那律刺|目捷连刺|舍利佛刺|富楼那刺|迦旋延刺|弘忍能刺)」','','asqi')
-- 日月鞭法〖日月鞭法〗属性〖奇〗
create_trigger_t('afight16','^(> )*(\\D*)「(日月晦明|万劫不复|无色无相|太乙生萌|两仪合德|混沌一破)」','','asqi')
-- 反两仪刀〖反两仪刀〗属性〖奇〗
create_trigger_t('afight17','^(> )*(\\D*)「(幻形变影|星星点点|漫天星斗|五斗星辰|北斗七星|追星赶月)」','','asqi')
-- 星移掌〖密宗打手印〗属性〖奇〗
create_trigger_t('afight18','^(> )*(\\D*)「(月下踏径|破云见日|秋日落叶|雪地追踪|回首沧桑|雨打浮萍|流星电闪)」','','asqi')
-- 漫天花雨〖漫天花雨〗属性〖奇〗
create_trigger_t('afight19','^(> )*(\\D*)「(莲花合掌印|合掌观音印|准提佛母印|红阎婆罗印|药师佛根本印|威德金刚印|上乐金刚印|六臂智慧印)」','','asqi')
-- 密宗大手印〖星移掌〗属性〖奇〗
create_trigger_t('afight21','^(> )*(\\D*)(左掌一提，右掌一招便即劈|大喝一声道：“小心了！”随|两手连续挥舞，双掌交错，|踏前一步，绕你坻壁而行，|运气丹田，连续几个斜步围|蹂身向前，身行猛的一窜，)','','asqi')
-- 大嵩阳手〖大嵩阳手〗属性〖奇〗
create_trigger_t('afight22','^(> )*(\\D*)(「万蛛吸血」|身形纵起，十指轻弹，只见缕缕内劲犹如飞瀑般向|阴喝一声，双手向前舞动，突然一股内劲顺指尖破空而出，疾射|深吸口气，身体急纵而上，右手食指疾伸，直戳)','','asqi')
-- 千蛛万毒手〖千蛛万毒手〗属性〖奇〗
create_trigger_t('afight23','^(> )*(\\D*)「(打草惊蛇|关门打狗|拨狗朝天|狗急跳墙|棒打双犬|恶犬拦路|棒打狗头|反截狗臀|打狗入洞|压肩狗背)」','','asqi')
-- 打狗棒法〖打狗棒法〗属性〖奇〗
create_trigger_t('afight41','^(> )*(\\D*)「(其利断金|碧鸡报晓|金马腾空|碧渊腾蛟|笑指天南|逐鹿中原)」','','asqi')
-- 段家剑法〖段家剑法〗属性〖奇〗



-- 刚
create_trigger_t('afight24','^(> )*(\\D*)「(礼敬如来|遇佛传法|幽冥搜魂|引火炼妖|魂散心魔|无相法相|攀天祥云|超度极乐)」','','asgang')
-- 大金刚拳〖大金刚拳〗属性〖刚〗
create_trigger_t('afight25','^(> )*(\\D*)「(力劈华山|幻影流动|震山式|枯树盘根)」','','asgang')
-- 盘根错结斧〖盘根错结斧〗属性〖刚〗
create_trigger_t('afight26','^(> )*(\\D*)「(起手式|石破天惊|铁闩横门|千斤坠地|傍花拂柳|金刚挚尾|封闭手|粉石碎玉)」','','asgang')
-- 劈石破玉拳〖劈石破玉拳〗属性〖刚〗
create_trigger_t('afight27','^(> )*(\\D*)「(亢龙有悔|飞龙在天|鸿渐于陆|潜龙勿用|突如其来|或跃在渊|双龙取水|鱼跃于渊|时乘六龙|密云不雨|损则有孚|龙战于野|履霜冰至|羝羊触蕃)」','','asgang')
-- 降龙十八掌〖降龙十八掌〗属性〖刚〗
create_trigger_t('afight28','^(> )*(\\D*)(「烈火烧身|「点木生火|「张弓望月|一招「烈火腾云|「火中取栗|「玉石俱焚)」','','asgang')
-- 燃木刀法〖燃木刀法〗属性〖刚〗
create_trigger_t('afight29','^(> )*(\\D*)(抬手一剑，急如飞虹闪电却|心中竟无半点波澜，纯以意|随手挥出一剑，去势极缓却|潜运内力将毕生功力凝聚在|手中长剑交左手，右手凌空|洒出点点剑意，犹如春雨细|剑意纵横，长剑有若迢迢长|信手而挥，剑势如风似幻无|目光澈如湖水，淡淡的看着|在四周似是随意挥剑，你莫|微笑不语，将手中的长剑从|忽然托起手中长剑，在身前|每出一剑都和周围事物相应|突然之间招数全无，只是极|一凝神，长剑居然发出淡淡|手中长剑向前挑出，看似无|深吸一口气，手中长剑挟带|轻叹一声，随手横劈一剑，|手中长剑剑势如虹，无可当|仰首长啸，令风云变幻，旋|远远挥出一剑，你不料气劲|迅疾挑出一剑，此剑之快，|凌空跃起，身随长剑起，借)','','asgang')
-- 玄铁剑法〖玄铁剑法〗属性〖刚〗
create_trigger_t('afight30','^(> )*(\\D*)「(星罗棋布|倒踩七星|神龙摆尾|蛇行无踪|旋风无敌|无影神腿|神龙八腿)」','','asgang')
-- 神龙腿法〖神龙腿法〗属性〖刚〗


-- 柔
create_trigger_t('afight31','^(> )*(\\D*)「(春深芳草尽|夏闲独兰馨|秋酣菊霜清|冬卧听梅吟)」','','asrou')
-- 散花掌〖散花掌〗属性〖柔〗
create_trigger_t('afight1','^(> )*(\\D*)「(雁行斜击|浪迹天涯|花前月下|清饮小酌|抚琴按箫|彩笔画眉|举案齐眉|木兰回射|如影相随)」','','asrou')
-- 玉女素心剑〖玉女素心剑〗属性〖柔〗
create_trigger_t('afight32','^(> )*(\\D*)「(清风袭月|飘雪穿云|千峰竞秀|万流归宗|乌龙搅柱|大雁啼沙|进退龙游|天地鹤翔)」','','asrou')
-- 回风拂柳剑〖回风拂柳剑〗属性〖柔〗
create_trigger_t('afight33','^(> )*(\\D*)「(未牧|初调|受制|回首|驯服|无碍|任运|相望|独照|双泯)」','','asrou')
-- 慈航鞭〖慈航鞭〗属性〖柔〗
create_trigger_t('afight34','^(> )*(\\D*)(一抱一合|似松非松，将展未展|虚灵顶劲、涵胸拔背|右掌微颤，吞吐|掌力若有若无|太极式的阴阳变化|双手一圈，如抱太极|左拨右带，一卷|右手虚划，手背|流云翻舞|双手随意划弧|双手一翻，连消|右掌挥出，一拒一迎|左手凭空划了|右掌划个圈子|双掌轻翻，柔|走一虚步，右手|双掌一摆一抄|双手自然挥动|双手内旋，如|左掌阳，右掌阴|右手突从圈中|划个圆圈，右臂一伸|左手从右至左|双手划弧止于|左手高，右手低|右脚实，左脚虚|身前上下连划|身前左右连划|虚灵顶劲、涵胸|似松非松，将展|揽雀尾|单鞭|提手上势|白鹤亮翅|搂膝勾步|手挥琶琶|进步搬拦锤|指裆锤|双风贯耳|白蛇吐信|高探马|伏虎式|肘底看锤|海底针|闪通臂|揽月势|马步靠|金鸡独立|玉女穿梭|反身撇锤|转身蹬腿|栽锤|进步七星|倒撵猴|转身摆莲|弯弓射虎|云手|猢狲跃|野马分鬃|十字手)','','asrou')
-- 太极拳〖太极拳〗属性〖柔〗
create_trigger_t('afight35','^(> )*(\\D*)(「灵蛇出洞」|轻风细雨|半雨半晴|如影随形」)','','asrou')
-- 化骨绵掌〖化骨绵掌〗属性〖柔〗
create_trigger_t('afight36','^(> )*(\\D*)(左手忽做兰花之形|便如兰花浴风般划向|右掌自上而下，一抄一带|双手如两只玉蝶|如一柄长剑般横削而来)','','asrou')
-- 兰花拂穴手〖兰花拂穴手〗属性〖柔〗


--快
create_trigger_t('afight37','^(> )*(\\D*)「(万岳朝宗|开门见山|独劈华山|天外玉龙|龙啸九天)」','','askuai')
-- 嵩山剑法〖嵩山剑法〗属性〖快〗
create_trigger_t('afight38','^(> )*(\\D*)「(五气呈祥|逆流捧沙|雷洞霹雳|摘星换斗|梵心降魔)」','','askuai')
-- 四象掌〖四象掌〗属性〖快〗
create_trigger_t('afight39','^(> )*(\\D*)「(黑龙现身|万水千山|横扫千里|左右开弓|百丈飞瀑|直摧万马|上步劈山)」','','askuai')
-- 烈焰刀〖烈炎刀〗属性〖快〗
create_trigger_t('afight40','^(> )*(\\D*)「(仗义执言|七星伴月|佛界无边|转世轮回|西天极乐|佛祖慈悲)」','','askuai')
-- 如影随形腿〖如影随形腿〗属性〖快〗
create_trigger_t('afight42','^(> )*(\\D*)「(魁星踢斗|倒踢紫金冠|旁敲侧击|连环三踢|秋风扫落叶|凤舞九天)」','','askuai')
-- 旋风扫叶腿〖旋风扫叶腿〗属性〖快〗
create_trigger_t('afight43','^(> )*(\\D*)「(海底寻针|灵猿探洞|斜插神枝|电闪雷动|夫子揖手|玉带缠腰|举火烧天|败马斩蹄|玉女穿针|灵猿登枝|苏武挥鞭|挑灯看剑)」','','askuai')
-- 迅雷十六剑〖迅雷十六剑〗属性〖快〗
create_trigger_t('afight44','^(> )*(\\D*)(刀锋回转，连出数刀|左一刀，右一刀|突然刀交左手，一刀砍向|正撞上刀锋来路|十六刀连续往|集全身之力于刀锋上)','','askuai')
-- 柳叶刀法〖柳叶刀法〗属性〖快〗


-- 慢

create_trigger_t('afight45','^(> )*(\\D*)「(徘徊空谷|力不从心|行尸走肉|庸人自扰|倒行逆施|废寝忘食|孤形只影|饮恨吞声|穷途末路|面无人色|想入非非)」','','asman')
-- 黯然销魂掌〖黯然销魂掌〗属性〖慢〗
create_trigger_t('afight46','^(> )*(\\D*)「(如罩寒霜|如寒冰头|白露为霜|寒梅纷飞|天寒地冻|冰天雪地|雪花纷飞|满天冰雨)」','','asman')
-- 寒冰绵掌〖寒冰绵掌〗属性〖慢〗
create_trigger_t('afight47','^(> )*(\\D*)「(横空出世|长虹贯日|云断秦岭|铁索拦江|怀中抱月|翻江搅海|金刚伏魔)」','','asman')
-- 般若掌〖般若掌〗属性〖慢〗
create_trigger_t('afight48','^(> )*「(蓝采和，提篮劝酒醉朦胧|何仙姑，拦腰敬酒醉仙步|曹国舅，千杯不醉倒金盅|韩湘子，铁棍提胸醉拔萧|汉钟离，跌步翻身醉盘龙|铁拐李，踢倒金山醉玉池|张果老，醉酒抛杯倒骑驴|吕洞宾，酒醉提壶力千钧)」，(\\D*)','','asman')
-- 少林醉棍〖少林醉棍〗属性〖慢〗
create_trigger_t('afight49','^(> )*(\\D*)「(云断秦岭|青松翠翠|山回路转|金玉满堂|青山断河|风伴流云|湮雨飘渺)」','','asman')
-- 混元掌〖混元掌〗属性〖慢〗
create_trigger_t('afight50','^(> )*(\\D*)「(日入空山|天清云淡|秋风不尽|山回路转|青山断河|北风卷地|天山雪飘)」','','asman')
-- 昆仑叠掌〖昆仑叠掌〗属性〖慢〗
create_trigger_t('afight51','^(> )*(\\D*)(「手挥五弦」|送远方翩鸿孤飞|剑法吞吐开合|剑劲之柔韧|剑法中最精要之处|登峰造极的剑术|漫步扬长而步|出剑以蜿蜒之势|剑法中破绽之少|太极剑「剑意」|剑势犹如浪潮一般|剑招古朴浑厚|剑刃平刺，锋口向|脚走八卦，拔剑|神在剑先、绵绵不绝|画剑成圈，一点|缓缓伸出，随手画|一阵尖锐的破空声出|右手剑诀戳出|三环套月|左手持剑缓缓向上提起|一剑刺到，青光闪闪|剑尖急颤，看不出攻|左手剑诀斜引，|剑势绵绵不绝，|剑招精奇，轻翔灵动|以己之钝，挡敌之无锋|以意驭剑，千变万化|每一招均是以弧形刺出|以意驭剑，神在剑先|剑法纵横变化，奇幻无方|半点渣滓，以意运剑|出剑递招，可说|剑法吞吐开合|只觉一股森森寒气，直逼|突然平刺，剑尖急颤|剑招未曾使老，已然圈转|「宿鸟投林」|「大魁星」|「天马行空」|「黄峰入洞」|「射雁式」|「燕子抄水」|「小魁星」|「挑帘式」|「风扫梅花」|「车轮剑」|“顺水推舟”|「探海式」|「白猿献果」|「野马跳涧」|「海底捞月」|「虎抱头」|「右拦扫」|“迎风掸尘”|「乌龙摆尾」|「圆转如意」|「迎风掸尘」|「青龙出水」|「指南针」|「燕子掠波」|「却步抽剑」|一招「拨云瞻日」)','','asman')
-- 太极剑法〖太极剑法〗属性〖慢〗
create_trigger_t('afight52','^(> )*(\\D*)(犹如一条灵蛇窜越而出，径直扑向|已完全笼罩在漫天鞭影之中，丝毫|随即连续舞了两个圆圈，光环之中|却以一道弧线从旁向你缠去|末梢在地上划出“呲呲”的爆响，猛|撤身，打了个转，双手仍不断抖动|凌空划了个弧圈，身子围绕你奔走|运起嵩山内功，继而凌空踏起)','','asman')
-- 嵩阳鞭〖嵩阳鞭〗属性〖慢〗
create_trigger_t('afight53','^(> )*(\\D*)「(并蒂莲开|池底清荷|双莲争艳|雨打莲花|旧藕新莲|遍野荷香)」','','asman')
-- 莲花掌〖莲花掌〗属性〖慢〗
create_trigger_t('afight54','^(> )*(\\D*)「(锋|天|下|不|武|刀|龙|争)」','','asman')
-- 银钩笔法〖银钩笔法〗属性〖慢〗
create_trigger_t('afight20','^(> )*(\\D*)(「落英缤纷|「江城飞花|「雨打桃花|「雨急风狂|「满天花雨|「断艳残红|一招「无边落木)」','','asman')
-- 落英神剑掌〖落英神剑掌〗属性〖奇〗

-- 妙
create_trigger_t('afight55','^(> )*(\\D*)「(斩头式|破膛刀|去魂电|流星经天|蛇行|三界咒|魔分身)」','','asmiao')
-- 血刀经〖血刀经〗属性〖妙〗
create_trigger_t('afight56','^(> )*(\\D*)「(目不识丁|画龙点睛|扑朔迷离|受宠若惊|滔滔不绝|退避三舍|卧薪尝胆|相煎何急)」','','asmiao')
-- 参合指〖参合指〗属性〖妙〗
create_trigger_t('afight57','^(> )*(\\D*)「(貂禅拜月|西施捧心|昭君出塞|麻姑献寿|天女织梭|则天垂帘|丽华梳妆|红玉击鼓|弄玉吹箫)」','','asmiao')
-- 美女拳法〖美女拳法〗属性〖妙〗
create_trigger_t('afight58','^(> )*(\\D*)(举起长剑运使「太极剑」剑意|奇诡地向你挥出「泉鸣芙蓉」、|神色凝重，长剑上劈下切左右横扫|手中长剑越转越快，|挺剑回刺你的长剑。|突然使出青城派松风剑法的「鸿飞冥冥」，|突然运剑如狂，一手关外的「乱披风剑法」，|飞身跃起，出剑宛如「金雁横空|含笑抱剑，气势庄严|剑光一吐，|剑势忽缓而不疏，剑意有余而不尽|剑随身转，续而刺出十九剑，|剑意突焕气象森严，便似千军万马奔驰而来，|剑招突变，使出衡山的「一剑落九雁」，)','','asmiao')
-- 独孤九剑〖独孤九剑〗属性〖妙〗
create_trigger_t('afight59','^(> )*(\\D*)「(仙鹤展翅入灵山|玉马衔环拜仙宫|鸣鹿踏蹄觅仙草|金鲤跃水潜天池|灵猿献果赴蓬莱|飞鹰盘旋扫乾坤|天龙出水腾宇宙|白象卷云憾天柱)」','','asmiao')
-- 韦驮杵〖韦驮杵〗属性〖妙〗
create_trigger_t('afight60','^(> )*(\\D*)「(瓶花落砚|寒梅吐蕊|初杏问酒|露草斜阳|仰月承霖|叶底留莲|清风拂桂|菊圃秋霜|伽叶微笑|佛祖拈花)」','','asmiao')
-- 拈花指〖拈花指〗属性〖妙〗
create_trigger_t('afight61','^(> )*(\\D*)「(神龙摆尾|乌龙绞柱|天龙下凡|地龙打滚)」','','asmiao')
-- 灵蛇鞭法〖灵蛇鞭法〗属性〖妙〗
create_trigger_t('afight62','^(> )*(\\D*)「(棹歌中流|山外清音|金声玉振|响隔楼台|斜阳音袅|月落曲惶|清箫万里|狂歌九天|凤曲长鸣|箫史乘龙)」','','asmiao')
-- 玉箫剑法〖玉箫剑法〗属性〖妙〗
create_trigger_t('afight63','^(> )*(\\D*)「(五陵烟云|烟雾弥漫|烟雨朦胧|烟飘云散|五罗轻烟)」','','asmiao')
-- 五罗轻烟掌〖五罗轻烟掌〗属性〖妙〗
create_trigger_t('afight64','^(> )*(\\D*)(天穹如盖|「乾坤倒转」|两仪四象|「气吞六合」)','','asmiao')
-- 四象六合刀〖四象六合刀〗属性〖妙〗
create_trigger_t('afight65','^(> )*(\\D*)「(推窗望月|分水擒龙|白云幻舞|掌中乾坤|落日赶月|蛰雷为动|天罗地网|五指幻山)」','','asmiao')
-- 铁掌掌法〖铁掌掌法〗属性〖妙〗
create_trigger_t('afight66','^(> )*(\\D*)「(劈风展翅|风拂山岗|抽刀断水|苍鹰望月)」','','asmiao')
-- 玄虚刀法〖玄虚刀法〗属性〖妙〗


-- 险
create_trigger_t('afight67','^(> )*(\\D*)「(凝云|捻灯|妙音|清乐|撞钟|暗香)」','','asxian')
-- 天王爪〖天王爪〗属性〖险〗
create_trigger_t('afight68','^(> )*(\\D*)「(虚式分金|月落西山|铁锁横江|黑沼灵狐|生死茫茫)」','','asxian')
-- 截手九式〖截手九式〗属性〖险〗
create_trigger_t('afight69','^(> )*(\\D*)「(洗耳恭听|明察秋毫|甜言蜜语|望尘莫及|骑虎难下|抛砖引玉)」','','asxian')
-- 慕容剑法〖慕容剑法〗属性〖险〗
create_trigger_t('afight70','^(> )*(\\D*)(忽地甩了出来，直扑|矫矢似灵蛇击向你，|大惊之下，身子後仰|翻将过去，自下而上|犹如水蛇般蜿蜒而出|矫夭飞舞，好比彩凤)','','asxian')
-- 银索金铃〖银索金铃〗属性〖险〗
create_trigger_t('afight71','^(> )*(\\D*)「(捉影式|抚琴式|鼓瑟式|批亢式|掏虚式|抢珠式|捞月式|抱残式|守缺式)」','','asxian')
-- 龙爪功〖龙爪功〗属性〖险〗
create_trigger_t('afight72','^(> )*(\\D*)「(龙腾虎跃|描龙绣凤|游龙戏凤|龙翔凤舞)」','','asxian')
-- 腾龙匕法〖腾龙匕法〗属性〖险〗
create_trigger_t('afight73','^(> )*(\\D*)「(指点江山|如来神指|一衣带水|弹指惊雷)」','','asxian')
-- 弹指神通〖弹指神通〗属性〖险〗
create_trigger_t('afight74','^(> )*(\\D*)「(风云起|力推山|狂风破|力开山|震天地)」','','asxian')
-- 裂天斧〖裂天斧〗属性〖险〗
create_trigger_t('afight76','^(> )*(\\D*)「(勾魂夺魄|九子连环风卷残云|唯我独尊)」','','asxian')
-- 九阴白骨爪〖九阴白骨爪〗属性〖险〗
create_trigger_t('afight75','^(> )*(\\D*)「(老牛拉车|壮士断腕|落叶归根|空前绝后|断子绝孙)」','','asxian')
-- 绝户手〖绝户手〗属性〖险〗


--空
create_trigger_t('afight77','^(> )*(\\D*)「(空|朦|洞|松|风|通|容|梦|冲|穷|中|弄|童|庸|弓|虫)」','','askong')


--无
create_trigger_t('afight78','^(> )*(\\D*)「(七星手|推手|一条鞭|直击|雁回头|井栏)」','','aswu')
---武当长拳
create_trigger_t('afight79','^(> )*(\\D*)「(釜底抽薪|连绵不绝|左右逢源|逆水行舟)」','','aswu')
--段家拳
create_trigger_t('afight80','^(> )*(\\D*)「(千里横行|冲阵斩将|河朔立威|击鼓三通|扬马立威)」','','aswu')
--太祖拳
create_trigger_t('afight81','^(> )*(\\D*)「(黄莺落架|丹凤朝阳|洛钟东应|偏花七星|挟山超海|慑服外道)」','','aswu')
--罗汉拳
create_trigger_t('afight82','^(> )*(\\D*)「(兔戏苍鹰|飞流直泻|风雨归人)」','','aswu')
--温家拳
create_trigger_t('afight83','^(> )*(\\D*)「(灌顶|解苦|颦眉|嗔恚|静寂|妙音|明心|制胜)」','','aswu')
--伏虎拳
create_trigger_t('afight84','^(> )*(\\D*)「(开天辟地|即世即空|无相无色|谁入地狱|禅心永明)」','','aswu')
--韦陀掌
create_trigger_t('afight85','^(> )*(\\D*)「(揩磨尘垢|无欠无余|虎门手|灵光照耀|天地无用)」','','aswu')
--天罡掌
create_trigger_t('afight86','^(> )*(\\D*)「(风满长空|草深雾泽|天目昭辉|雷震四方|水到渠成|山高林密|地老天荒)」','','aswu')
--风云手
create_trigger_t('afight87','^(> )*(\\D*)「(金针渡线|双阳沓手|飞鹰现爪|孔雀剔翎|猿猴摆手|自在飞花|雨打飞花)」','','aswu')
--鹰抓擒拿手
create_trigger_t('afight88','^(> )*(\\D*)(左手扬起，右手伸出，|单臂伸出，手指直取|左手一掠，将|身形急跳，早落到|双臂弯出，柔若无骨，|右手一抬，势做阴柔，|内力勃发，姿势凶狠，)','','aswu')
--锁喉擒拿手
create_trigger_t('afight89','^(> )*(\\D*)「(落燕式|抚平式|追月式|连环式|扫叶式|盘龙式)」','','aswu')
--少林弹腿
create_trigger_t('afight90','^(> )*(\\D*)「(叶不归根|我心向佛|以慈度心|念经诵佛)」','','aswu')
--摩诃指
create_trigger_t('afight91','^(> )*(\\D*)「(凶鹰袭兔|雄鹰展翅|拔翅横飞|迎风振翼|飞龙献爪|搏击长空|鹰扬万里)」','','aswu')
--鹰爪功
create_trigger_t('afight92','^(> )*(\\D*)「(众生无我|苦乐随缘|普度众生|七星聚会|以逸待劳|佛门善地)」','','aswu')
--寂灭爪
create_trigger_t('afight93','^(> )*(\\D*)「(罡风推云|摘星换斗|金顶佛光)」','','aswu')
--金顶绵掌
create_trigger_t('afight94','^(> )*(\\D*)「(金蛇出洞|金蛇游水|金蛇挺身|金蛇过涧|金蛇缠身|升天入地|金蛇翻腾|蛇跨彩虹|双蛇钻腋|金蛇望月|金蛇摆尾|灵蛇盘腾|飞龙戏蛇|蛇影无踪)」','','aswu')
--金蛇武功
create_trigger_t('afight95','^(> )*(\\D*)「(雪海冰雹|天山雪野|满天飞雪|雪峰插云)」','','aswu')
--天山杖法
create_trigger_t('afight96','^(> )*(\\D*)(催动内力，衣袖挥动，|双脚一曲一弯，身体旋转起来,|身形飘动，围着|突然厉声大喝，跃于半空，立掌如斧，上上下下向|身形微晁抢前一步，运起十成功力，|面露诡异的笑容，猛地向前冲出，对准|心念一转，计上心来，一招)','','aswu')
--抽髓掌
create_trigger_t('afight97','^(> )*(\\D*)「(蜈蚣盘步|毒蚣盘身|蜈蚣摆尾)」','','aswu')
--三阴蜈蚣爪
create_trigger_t('afight98','^(> )*(\\D*)「\\D*无相劫」','','aswu')
--无相截指
create_trigger_t('afight99','^(> )*(\\D*)「(秦王鞭石|鲁达拔柳|霸王扛鼎|八仙醉打|长虹经天)」','','aswu')
--疯魔杖法





    for i=1,99 do

        SetTriggerOption("afight"..i,"group","afight")

    end
	SetTriggerOption("afightdie1"..i,"group","afightdie")
	
	EnableTriggerGroup('afight',false)   
    --ColourNote ("red","blue","开启武功属性检测："..npcname.."|"..npcid.."|"..pfmid)
end
function aszheng(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("pmiao"),kezhi_order["正"])
	ColourNote ("red","blue","正")
end

function asqi(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("pxian"),kezhi_order["奇"])
    ColourNote ("red","blue","奇")
end

function asgang(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("pkuai"),kezhi_order["刚"])
    ColourNote ("red","blue","刚")
end

function asrou(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("pman"),kezhi_order["柔"])
    ColourNote ("red","blue","柔")
end

function askuai(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("prou"),kezhi_order["快"])
    ColourNote ("red","blue","快")
end

function asman(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("pgang"),kezhi_order["慢"])
    ColourNote ("red","blue","慢")
end

function asmiao(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("pqi"),kezhi_order["妙"])
    ColourNote ("red","blue","妙")
end

function asxian(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("pzhen"),kezhi_order["险"])
    ColourNote ("red","blue","险")
end

function askong(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("pkong"),kezhi_order["空"])
    ColourNote ("red","blue","空")
end

function aswu(n,l,w)
	kezhiwugongsuccess(w[2],GetVariable("pwu"),kezhi_order["无"])
    ColourNote ("red","blue","无")
end

function kezhiwugongsuccess(miaoshu,kezhi_cmd,k_order)
	--print(miaoshu)
	--print("kezhisuccess="..kezhisuccess.."|npc_num="..npc_num)
	for i=1,npc_num do
		--print("kflag"..i.."="..kflag[i]..npc_name[i])
		if npc_name[i]~=nil and kflag[i]==1 then
			local tmpuser=string.find(miaoshu,"你")
			local tmptarget=string.find(miaoshu,npc_name[i]) 
			if tmptarget~=nil then 
				if tmpuser~=nil and tmpuser<tmptarget then
					break
				end
				create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pppp'..i..' '..kezhi_cmd..' '.. npc_id[i])
				exe('kezhiwugongpfm')
				npc_order[i]=k_order
				kflag[i]=2
				kezhisuccess=kezhisuccess+1
				if i==npc_num then
					break
				end
			end
		end
	end
	print("kezhisuccess="..kezhisuccess.."|npc_num="..npc_num)
	if kezhisuccess==npc_num then
		local tflag=1
		for i=2,npc_num do
			if npc_order[i]~=nil and npc_order[i]<npc_order[tflag] then
				print(npc_order[i],npc_order[tflag])
				tflag=i
			end
		end
		kezhiwugongkill(tflag)
		kezhiwugongclose()
	end
end
function kezhiwugongAddTarget(t_name,t_id)
	local tflag=true
	for i=1,4 do
		if npc_id[i]==t_id then
			tflag=false
		end
	end
	if tflag then
		table.insert(npc_name,t_name)
		table.insert(npc_id,t_id)
		kezhiwugongStart()
	end
end
function kezhiwugongRemoveTarget(t_name)
	table.insert(npcdienum,t_name)
end
function kezhiwugongStart()
	npc_num=0
	kezhisuccess=0
	for i=1,4 do
		if(npc_name[i]~=nil) then
			print("npcname["..i.."]="..npc_name[i])
			kflag[i]=1
			npc_num=npc_num+1
		else
			kflag[i]=0
		end
	end
	EnableTriggerGroup('afight',true)   
end
function kezhiwugongkill(p_num)
	--print(npcdienum[npc_name[p_num]])
	if kflag[p_num]==2 and not npcdienum[npc_name[p_num]] then
		exe('set wimpy 100;set wimpycmd pppp'..p_num..'\\hp')
	else
		exe('set wimpy 100;set wimpycmd pfmpfm\\hp')
	end
end
function kezhiwugongclose()
	EnableTriggerGroup('afight',false)   
    DeleteTriggerGroup("afight")
	npc_num=0
	kezhisuccess=0
end
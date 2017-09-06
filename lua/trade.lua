------------by fqyy 20170529------------------------
local shopRoomList = {"襄阳城小吃店","襄阳城鲜鱼店","襄阳城江湖客栈","襄阳城猪肉店","襄阳城天香楼","襄阳城烧饼铺","襄阳城包子铺","襄阳城药材铺","襄阳城成衣铺","襄阳城杂货铺","长安城兵器铺","长安城聚豪酒楼","长安城裁缝铺","长安城杂货铺","长安城水果店","长安城花店","长安城茶馆","长安城珠宝行","扬州城茶馆","扬州城乐器店","扬州城药铺","扬州城小吃店","苏州城春在楼","苏州城春在楼","苏州城立春堂","苏州城打铁铺","苏州城茶馆","杭州城天香楼","杭州城万年春","杭州城杂货铺","福州城酒馆","福州城药铺","福州城杂货铺","福州城茶楼","福州城吉祥客栈","佛山烧饼摊","佛山铁匠铺","佛山杂货店","佛山英雄楼","大理城杂货铺","大理城花店","大理城裁缝店","大理城绸缎庄"}
local foodList = {
        ["baozi"]=true,
        ["mi fan"]=true,
        ["huasheng"]=true,
        ["doufu"]=true,
        ["kao ya"]=true,
        ["yue bing"]=true,
        ["jitui"]=true,
}
local waterList = {
        ["jiu dai"]=true,
        ["jiudai"]=true,
        ["cha hu"]=true,
}
local tbankList = {
        ["大理城"]="大理钱庄",
        ["襄阳城"]="宝龙斋",
        ["长安城"]="钱庄",
        ["扬州城"]="天阁斋",
        ["苏州城"]="聚宝斋",
        ["杭州城"]="金华斋",
        ["福州城"]="通宝斋",                
}
local nowRoom
local shopRoomListLength=1
local buyNow=1
while shopRoomList[shopRoomListLength]~=nil
        do
        shopRoomListLength=shopRoomListLength+1
end


function tradePro()
        nowRoom=0
        shoppingGoNext()
end
function checkShopList()
        if shoplist~=nil and shoplist[buyNow]~=nil then
                exe("#5(drop "..shoplist[buyNow]..')')
        end
        DeleteTriggerGroup("shoplist")
        create_trigger_t('shoplist1',"^(> )*\\D*目前出售以下货物：",'','checkshoplistStart')
        create_trigger_t('shoplist2',"^┃(\\D*)\\((\\D*)\\)\\D*一文铜钱\\D*",'','checkObjId')
        create_trigger_t('shoplist3','^(> )*你把 "action" 设定为 "检查商店商品" 成功完成。','','checkshoplistOver')
        create_trigger_t('shoplist4','^(> )*什么?','','checkshoplistError')
        SetTriggerOption("shoplist1","group","shoplist")
        SetTriggerOption("shoplist2","group","shoplist")
        SetTriggerOption("shoplist3","group","shoplist")
        SetTriggerOption("shoplist4","group","shoplist")
        EnableTriggerGroup("shoplist",false)
        EnableTrigger("shoplist1",true)
        EnableTrigger("shoplist4",true)
        shoplist={}
        buyNow=1
        exe("list")
        exe('alias action 检查商店商品')
end
function checkshoplistError()
        EnableTriggerGroup("shoplist",false)
        DeleteTriggerGroup("shoplist")
        shoppingWaitGoNext()
end
function checkshoplistStart()
   EnableTriggerGroup("shoplist",true)
end
function checkObjId(n,l,w)
        print("物品ID："..w[2])
        table.insert(shoplist,string.lower(w[2]))
end
function checkshoplistOver()
        EnableTriggerGroup("shoplist",false)
        DeleteTriggerGroup("shoplist")
        startShopping()
end
function startShopping()
        DeleteTriggerGroup("shopping")
        create_trigger_t('shopping1',"^(> )*\\D*说道：「你想买的东西我这里没有。」",'','shoppingNext')
        create_trigger_t('shopping2',"^(> )*哟，抱歉啊，我这儿正忙着呢……您请稍候。",'','shoppingWait')
        create_trigger_t('shopping3','^(> )*你以(\\D*)的价格从\\D*那里买下了\\D*','','shoppingWait')
        create_trigger_t('shopping4','^(> )*\\D*说道：「穷光蛋，一边呆着去！」','','shoppingGoBank')
        create_trigger_t('shopping5','^(> )*地上已经那么多东西了，你想干嘛？','','shoppingWaitGoNext')
        create_trigger_t('shopping6','^(> )*什么?','','shoppingWaitGoNext')
        SetTriggerOption("shopping1","group","shopping")
        SetTriggerOption("shopping2","group","shopping")
        SetTriggerOption("shopping3","group","shopping")
        SetTriggerOption("shopping4","group","shopping")
        SetTriggerOption("shopping5","group","shopping")
        SetTriggerOption("shopping6","group","shopping")
        EnableTriggerGroup("shopping",true)
        shoppingContinue()
end
function shoppingContinue()
        if buyNow~=nil and shoplist[buyNow]~=nil then
                exe("buy "..shoplist[buyNow])
                if foodList[shoplist[buyNow]] then
                        exe("eat "..shoplist[buyNow])
                end
                if waterList[shoplist[buyNow]] then
                        exe("drink "..shoplist[buyNow])
                end
                exe("drop "..shoplist[buyNow])
        else
                shoppingGoNext()
        end
end
function shoppingNext()
        buyNow=buyNow+1
        shoppingContinue()
end
function shoppingWait(n,l,w)
        --print(w[2]) 
        if w[2]~=nil and string.find(w[2],"黄金") then
                shoppingGoNext()
        else
                wait.make(function() 
                        wait.time(1.3)
                        return shoppingContinue()
                end)
        end
end
function shoppingWaitGoNext()
        EnableTriggerGroup("shopping",false)
        wait.make(function() 
                wait.time(3)
                return shoppingGoNext()
        end)
end
function shoppingGoNext()
        DeleteTriggerGroup("shopping")
        if nowRoom<shopRoomListLength then
                nowRoom=nowRoom+1
        else
                nowRoom=1
        end
        if shopRoomList[nowRoom]~=nil then
                local tmparea,tmproom = locateroom(shopRoomList[nowRoom])
                if tmparea~=nil and tmproom~=nil then
                        go(checkShopList,tmparea,tmproom)
                else
                        print('商店地点列表出错：没有这个房间')
                end
        else
                wait.make(function() 
                        wait.time(1)
                        return shoppingGoNext()
                end)
        end
end
function shoppingGoBank()
        local tmparea,tmproom = locateroom(shopRoomList[nowRoom])
        if tmparea~=nil and tmproom~=nil then
                if tbankList[tmparea]~=nil then
                        go(shoppingBackBank,tmparea,tbankList[tmparea])
                else
                        shoppingGoNext()
                end
        else
                print('当前地图出错：无法去银行取钱')
        end
end
function shoppingBackBank()
        exe("qu 50 gold")
        local tmparea,tmproom = locateroom(shopRoomList[nowRoom])
        if tmparea~=nil and tmproom~=nil then
                go(shoppingContinue,tmparea,tmproom)
        else
                print('当前地图出错：无法返回商店')
        end
end
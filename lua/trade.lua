------------by fqyy 20170529------------------------
local shopRoomList = {"������С�Ե�","�����������","�����ǽ�����ջ","�����������","����������¥","�������ձ���","�����ǰ�����","������ҩ����","�����ǳ�����","�������ӻ���","�����Ǳ�����","�����Ǿۺ���¥","�����ǲ÷���","�������ӻ���","������ˮ����","�����ǻ���","�����ǲ��","�������鱦��","���ݳǲ��","���ݳ�������","���ݳ�ҩ��","���ݳ�С�Ե�","���ݳǴ���¥","���ݳǴ���¥","���ݳ�������","���ݳǴ�����","���ݳǲ��","���ݳ�����¥","���ݳ����괺","���ݳ��ӻ���","���ݳǾƹ�","���ݳ�ҩ��","���ݳ��ӻ���","���ݳǲ�¥","���ݳǼ����ջ","��ɽ�ձ�̯","��ɽ������","��ɽ�ӻ���","��ɽӢ��¥","������ӻ���","����ǻ���","����ǲ÷��","����ǳ��ׯ"}
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
        ["�����"]="����Ǯׯ",
        ["������"]="����ի",
        ["������"]="Ǯׯ",
        ["���ݳ�"]="���ի",
        ["���ݳ�"]="�۱�ի",
        ["���ݳ�"]="��ի",
        ["���ݳ�"]="ͨ��ի",                
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
        create_trigger_t('shoplist1',"^(> )*\\D*Ŀǰ�������»��",'','checkshoplistStart')
        create_trigger_t('shoplist2',"^��(\\D*)\\((\\D*)\\)\\D*һ��ͭǮ\\D*",'','checkObjId')
        create_trigger_t('shoplist3','^(> )*��� "action" �趨Ϊ "����̵���Ʒ" �ɹ���ɡ�','','checkshoplistOver')
        create_trigger_t('shoplist4','^(> )*ʲô?','','checkshoplistError')
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
        exe('alias action ����̵���Ʒ')
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
        print("��ƷID��"..w[2])
        table.insert(shoplist,string.lower(w[2]))
end
function checkshoplistOver()
        EnableTriggerGroup("shoplist",false)
        DeleteTriggerGroup("shoplist")
        startShopping()
end
function startShopping()
        DeleteTriggerGroup("shopping")
        create_trigger_t('shopping1',"^(> )*\\D*˵������������Ķ���������û�С���",'','shoppingNext')
        create_trigger_t('shopping2',"^(> )*Ӵ����Ǹ�����������æ���ء��������Ժ�",'','shoppingWait')
        create_trigger_t('shopping3','^(> )*����(\\D*)�ļ۸��\\D*����������\\D*','','shoppingWait')
        create_trigger_t('shopping4','^(> )*\\D*˵��������⵰��һ�ߴ���ȥ����','','shoppingGoBank')
        create_trigger_t('shopping5','^(> )*�����Ѿ���ô�ණ���ˣ�������','','shoppingWaitGoNext')
        create_trigger_t('shopping6','^(> )*ʲô?','','shoppingWaitGoNext')
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
        if w[2]~=nil and string.find(w[2],"�ƽ�") then
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
                        print('�̵�ص��б����û���������')
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
                print('��ǰ��ͼ�����޷�ȥ����ȡǮ')
        end
end
function shoppingBackBank()
        exe("qu 50 gold")
        local tmparea,tmproom = locateroom(shopRoomList[nowRoom])
        if tmparea~=nil and tmproom~=nil then
                go(shoppingContinue,tmparea,tmproom)
        else
                print('��ǰ��ͼ�����޷������̵�')
        end
end
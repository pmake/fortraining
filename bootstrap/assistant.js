//v0.2
//以assistant類別當做進入點(避免重複搜尋CSS目標的動作)，再依子類別判定套用哪一個功能
//目前需求:
//middlize, showProperty(在console秀出目標的全部屬性)

var ast = {};
ast.users = {};
ast.services= {};

//指定物件方法不是宣告，不會hoist，所以要先定義
//置中
ast.services.middlize = function (user){
    //user需為容器
    //容器中有多個block子元素時，使最上與最底的子元素與容器間距相同, 一般使用情境是設定一個給定高度的div，定義此div類別為middlize，即可使其內部子元素置中
    //容器未給定高度的情境不適用，此部份視需求決定是否加入自動置中

    //容器padding-top+height+padding-bottom為視覺高度
    //上下元素間若有margin交錯，取大者生效
    //首元素margin-top不影響，除非容器有padding-top或是容器本身有float
    //initialize
    var eleTtlHeight=0, conTtlHeight=0, firChiTop=0, styleEle={}, styleCon={}, firChiEle={}, conPadTop=0, firPadTop=0, marginArr=[], modifyVol=0, isFloat=0;

    //開始運算
    //    properViewer(user);
    styleCon = window.getComputedStyle(user);
    //容器是否float
    if (styleCon.getPropertyValue('float')!='none'){isFloat=1;}
    //console.log('isFloat:' + isFloat);
    //計算容器視覺高度
    conPadTop=parseFloat(styleCon.getPropertyValue('padding-top'));
    conTtlHeight=conPadTop;
    conTtlHeight+=parseFloat(styleCon.getPropertyValue('height'));
    conTtlHeight+=parseFloat(styleCon.getPropertyValue('padding-bottom'));
    //取得容器子元素
    var eles = user.children;
    //統計子元素高度
    for(var i=0;i<eles.length;i++){
        //取得計算後的css屬性值
        styleEle = window.getComputedStyle(eles[i]);
        if(i==0){
            firChiEle=eles[i];
            //計算首元素內容上方高度firChiTop與至尾元素height為止的高度
            if(conPadTop!=0 || isFloat==1) {
                firChiTop+=parseFloat(styleEle.getPropertyValue('margin-top'));
            }
            firChiTop+=parseFloat(styleEle.getPropertyValue('border-top-width'));
            firPadTop=parseFloat(styleEle.getPropertyValue('padding-top'));
            firChiTop+=firPadTop;
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('height'));
            if(i!=eles.length-1){
                eleTtlHeight+=parseFloat(styleEle.getPropertyValue('padding-bottom'));
                eleTtlHeight+=parseFloat(styleEle.getPropertyValue('border-bottom-width'));
            }
        }else if(i!=eles.length-1){
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('border-top-width'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('padding-top'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('height'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('padding-bottom'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('border-bottom-width'));
        }else if(i==eles.length-1){
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('border-top-width'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('padding-top'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('height'));
        }
        //margin用max另外處理
        marginArr[i]= [parseFloat(styleEle.getPropertyValue('margin-top')),parseFloat(styleEle.getPropertyValue('margin-bottom'))];
        if(i!=0){
            eleTtlHeight+=Math.max(marginArr[i-1][1],marginArr[i][0]);
        }
    }
    //上部高conPadTop+firChiTop
    //底部餘高conTtlHeight-conPadTop-firChiTop-eleTtlHeight
    //首元素padding調整值，(conTtlHeight-eleTtlHeight)/2=上下留空距離
    modifyVol = (conPadTop*2+firChiTop*2-conTtlHeight+eleTtlHeight)/2;
    //調整後的padding-top值
    firPadTop-=modifyVol;
    firChiEle.style.paddingTop = firPadTop + 'px';
    console.log('=======================================');
    console.log('You should set padding-top of first child to [ ' + firPadTop + ' ] px for middlize.');
    //debug用
    //    console.log('middlizer result');
    //    console.log('=======================================');
    //    console.log('conTtlHeight: ' + conTtlHeight);
    //    console.log('eleTtlHeight: ' + eleTtlHeight);
    //    console.log('distance: ' + (conTtlHeight-eleTtlHeight)/2);
    //    console.log('firChiTop: ' + firChiTop);
    //    console.log('ori_firPadTop: ' + (firPadTop+modifyVol));
    //    console.log('modifyVol: ' + modifyVol);
    //    console.log('mod_firPadTop: ' + firPadTop);
    //    properViewer(user);
}

//揭露元素所有css屬性
ast.services.showProperty = function (user){
    var userPpt = window.getComputedStyle(user);
    console.log('=======================================');
    for(var i=0;i<userPpt.length;i++){
        console.log(userPpt[i] + ': ' + userPpt.getPropertyValue(userPpt[i]));
    }
}

//取得使用assistant入口類別的元素清單
ast.users = document.getElementsByClassName('ast');

//判斷使用什麼服務
//mdl => middlize
//spt => showProperty
if (ast.users.length!=0){
    for(var e=0;e<ast.users.length;e++){
        ast.users[e].demands = ast.users[e].classList;
        for(var c=0;c<ast.users[e].demands.length;c++){
            switch (ast.users[e].demands[c]) {
                case 'mdl':
                    ast.services.middlize(ast.users[e]);
                    break;
                case 'spt':
                    ast.services.showProperty(ast.users[e]);
                    break;
            }
        }
    }
}

//debug function for middlizer
function properViewer(user){
    var eles = user.children, computedStyle={};
    //show容器屬性
    computedStyle = window.getComputedStyle(user);
    console.log('container properties');
    console.log('=======================================');
    console.log('margin-top: ' + computedStyle.getPropertyValue('margin-top'));
    console.log('border-top-width: ' + computedStyle.getPropertyValue('border-top-width'));
    console.log('padding-top: ' + computedStyle.getPropertyValue('padding-top'));
    console.log('height: ' + computedStyle.getPropertyValue('height'));
    console.log('padding-bottom: ' + computedStyle.getPropertyValue('padding-bottom'));
    console.log('border-bottom-width: ' + computedStyle.getPropertyValue('border-bottom-width'));
    console.log('margin-bottom: ' + computedStyle.getPropertyValue('margin-bottom'));
    //子元素屬性
    for(var i=0;i<eles.length;i++){
        computedStyle = window.getComputedStyle(eles[i]);
        console.log('child ' + i + ' properties');
        console.log('=======================================');
        console.log('margin-top: ' + computedStyle.getPropertyValue('margin-top'));
        console.log('border-top-width: ' + computedStyle.getPropertyValue('border-top-width'));
        console.log('padding-top: ' + computedStyle.getPropertyValue('padding-top'));
        console.log('height: ' + computedStyle.getPropertyValue('height'));
        console.log('padding-bottom: ' + computedStyle.getPropertyValue('padding-bottom'));
        console.log('border-bottom-width: ' + computedStyle.getPropertyValue('border-bottom-width'));
        console.log('margin-bottom: ' + computedStyle.getPropertyValue('margin-bottom'));
    }
}

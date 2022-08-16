
/*
字符集  	字数    Unicode编码
基本汉字 20902字 4E00-9FA5
基本汉字补充 90字 9FA6-9FFF
扩展A 6592字 3400-4DBF
扩展B 42720字 20000-2A6DF
扩展C 4153字 2A700-2B738
扩展D 222字 2B740-2B81D
扩展E 5762字 2B820-2CEA1
扩展F 7473字 2CEB0-2EBE0
扩展G 4939字 30000-3134A
康熙部首 214字 2F00-2FD5
部首扩展 115字 2E80-2EF3
兼容汉字 477字 F900-FAD9
兼容扩展 542字 2F800-2FA1D
PUA(GBK)部件 81字 E815-E86F
部件扩展 452字 E400-E5E8
PUA增补 207字 E600-E6CF
汉字笔画 36字 31C0-31E3
汉字结构 12字 2FF0-2FFB
汉语注音 43字 3105-312F
注音扩展 22字 31A0-31BA
〇 1字 3007

 */

let chinese_unicode_str=()=>{
    let data=[["基本汉字","20902字","4E00-9FA5"],["基本汉字补充","90字","9FA6-9FFF"],["扩展A","6592字","3400-4DBF"],["扩展B","42720字","20000-2A6DF"],["扩展C","4153字","2A700-2B738"],["扩展D","222字","2B740-2B81D"],["扩展E","5762字","2B820-2CEA1"],["扩展F","7473字","2CEB0-2EBE0"],["扩展G","4939字","30000-3134A"],["康熙部首","214字","2F00-2FD5"],["部首扩展","115字","2E80-2EF3"],["兼容汉字","477字","F900-FAD9"],["兼容扩展","542字","2F800-2FA1D"],["PUA(GBK)部件","81字","E815-E86F"],["部件扩展","452字","E400-E5E8"],["PUA增补","207字","E600-E6CF"],["汉字笔画","36字","31C0-31E3"],["汉字结构","12字","2FF0-2FFB"],["汉语注音","43字","3105-312F"],["注音扩展","22字","31A0-31BA"],["〇","1字","3007"]]
    let element = document.createDocumentFragment();

    data.forEach((value,key,array)=>{
        let res=value[2].split('-')
        let h2=document.createElement('h2')
        h2.innerText=value[0]+'|'+value[1]+'|'+value[2]
        h2.title=value[0]
        element.appendChild(h2);

        if(res.length===1){
            let word=String.fromCharCode("0x"+value[2])
            let span = document.createElement("ul");
            span.innerText=word;
            element.appendChild(span);
        }else if(res.length===2){
            let start=parseInt(res[0],16)
            let end=parseInt(res[1],16)
            for(let i=start;i<=end;i++){
                let hex=String(i).toString(16)
                let word=String.fromCharCode("0x"+hex)
                let span = document.createElement("span");
                span.innerText=word;
                element.appendChild(span);

            }
        }
    })
    return element
}

export {  chinese_unicode_str } ;

(function(){
    "use strict";
    window.onresize = function () {
        if(document.documentElement.clientWidth<=1024){
            document.documentElement.style.fontSize = document.documentElement.clientWidth / 7.5 + "px";
        }else{
            document.documentElement.style.fontSize= 1024 /7.5+"px";
        }
    };
    if(document.documentElement.clientWidth<=1024){
        document.documentElement.style.fontSize = document.documentElement.clientWidth / 7.5 + "px";
    }else{
        document.documentElement.style.fontSize= 1024 /7.5+"px";
    }
    console.log("%c jingjingxyk \n好吧，你想说啥 \n zonghengbaihe521@qq.com \n %c Copyright \xa9 2014-%s\n",
        'font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;font-size:32px;color:#00bbee;-webkit-text-fill-color:#00bbee;-webkit-text-stroke: 1px #00bbee;',
        "font-size:12px;color:#999999;", (new Date).getFullYear()
    );
})();

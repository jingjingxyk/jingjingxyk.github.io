window.performance.getEntries().map(x => {
    //console.log(x)
    console.log(x.entryType, x.name, x.type, x.initiatorType, x.nextHopProtocol)
    // let URLSearchParams = new URL(x.name);
    // console.log(URLSearchParams)
});

{


// 选择需要观察变动的节点
    const targetNode = document.body;

// 观察器的配置（需要观察什么变动）
    const config = {attributes: true, childList: true, subtree: true};

// 当观察到变动时执行的回调函数
    const callback = function (mutationsList, observer) {
        // Use traditional 'for loops' for IE 11
        for (let mutation of mutationsList) {
            if (mutation.type === 'childList') {
                console.log('A child node has been added or removed.');
            } else if (mutation.type === 'attributes') {
                console.log('The ' + mutation.attributeName + ' attribute was modified.');
            }
        }
    };

    // 创建一个观察器实例并传入回调函数
    const observer = new MutationObserver(callback);

    // 以上述配置开始观察目标节点
    observer.observe(targetNode, config);

    // 之后，可停止观察
    observer.disconnect();


    let script = document.createElement("script");
    script.setAttribute(
        "src",
        "https://www.jingjingxyk.com/ajax/libs/webrtc/adapter/adapter-latest.js"
    );
    //script.setAttribute("type", "module");
    script.setAttribute("type", "application/javascript");
    script.setAttribute("charset", "utf-8");
    document.body.appendChild(script);

}
/*

    {
        // 用 document.designMode 可开启 Chrome 网页"上帝"模式，可编辑网页
        document.designMode='on'
    //or
        document.body.contentEditable='true';
    //or
        document.documentElement.setAttribute("contenteditable","true");


    }
    let script=document.createElement('script');

    const head = document.head || document.getElementsByTagName("head")[0] || document.documentElement;
    head.insertBefore(script, head.lastChild);

*/

{
    let link = document.createElement("link");
    link.setAttribute('rel', "stylesheet")
    link.setAttribute('charset', "utf-8")
    link.setAttribute('type', "text/css")
    link.setAttribute('href', "https://www.jingjingxyk/ajax/libs/highlight.js/11.6.0/styles/default.min.css")
    document.head.appendChild(link)
}
{

    let link = document.createElement("link");
    link.setAttribute('rel', "stylesheet")
    link.setAttribute('charset', "utf-8")
    link.setAttribute('type', "text/css")
    link.setAttribute('href', "https://www.jingjingxyk/ajax/libs/highlight.js/11.6.0/styles/monokai-sublime.min.css")
    document.head.appendChild(link)
}

(async () => {
    await import ('https://www.jingjingxyk.com/frontend-experimental-features/app.mjs');
})();

//浏览器控制台执行代码 ，检查效果
//模块加载测试
/*
(() => {
    let script = document.createElement("script");
    script.setAttribute(
        "src",
        "https://www.jingjingxyk.com/frontend-experimental-features/main.js"
    ),
        script.setAttribute("type", "application/javascript"),
        script.setAttribute("charset", "utf-8"),
        document.body.appendChild(script);
})();
*/


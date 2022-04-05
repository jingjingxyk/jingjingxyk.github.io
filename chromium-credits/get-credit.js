const puppeteer = require('puppeteer-core');
var fs = require('fs')

async function sleep(time) {
    return new Promise(function (resolve, reject) {
        setTimeout(function () {
            // 返回 ‘ok’
            resolve('ok');
        }, time * 1000);
    })
}


(async () => {
    let browserURL='http://localhost:9222';
    const browser = await  puppeteer.connect({browserURL});
    const page = await browser.newPage();
    await page.setJavaScriptEnabled(true);
    await page.setViewport({width: 1920, height: 1080});
    await page.goto('chrome://credits/',{
        waitUntil: 'networkidle2',
        timeout: 5000
    });

    const res = await page.evaluate(() => {
       let res= Array.from(document.querySelectorAll(".product")).map((currentValue)=>{

            return {
                "title":currentValue.querySelector(".title").innerText,
                "homepage":currentValue.querySelector(".homepage a").href,
                "licence":currentValue.querySelector(".licence pre").innerText
            }

        })
        // console.log(JSON.stringify(res))
        return JSON.stringify(res);
    });

    console.log(JSON.parse(res));

    console.log('==================')
    fs.writeFileSync(__dirname+ `/chromium-credits.json`, res, function (error) {
        if (error) {
            console.log('写入失败')
        } else {
            console.log('写入成功了')
        }
    })


    //await sleep(180)
    //await sleep(100000);
    // await browser.close();
    await page.close();
    await browser.disconnect();
})();

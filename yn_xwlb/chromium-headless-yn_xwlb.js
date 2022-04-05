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
    await page.goto('http://www.yntv.cn/list.html?sectionid=31',{
        waitUntil: 'networkidle2',
        timeout: 90000
    });
    await page.evaluate(() => {

        document.querySelector("#page").click();
        setTimeout(()=>{
            document.querySelector("#page").click();
        },2000);
    })
    await sleep(10)
    const res = await page.evaluate(() => {
        let res=Array.from(document.querySelectorAll("#liebiao .tuwen-con-box")).map((current_value)=>{
            console.log(current_value)
            return {
                "content_title": current_value.querySelector(".tuwen-con-box-ri-title").innerText ,
                "created_at": current_value.querySelector(".tuwen-con-box-le .time").innerText ,
                "url": current_value.querySelector(".tuwen-con-box-ri a").href

            }
        })
       // console.log(JSON.stringify(res))
        return JSON.stringify(res);
    });

    console.log(JSON.parse(res));
    let set=new Set();
    let days_data={};
    JSON.parse(res).map((currentValue)=>{
        let days=currentValue.created_at.match(/(\d{4})年(\d{2})月(\d{1,2})日\s+(\d{1,2}):(\d{1,2})/i)

        let day=`${days[1]}-${days[2]}-${days[3]}`;
        if( !set.has(day)) {
            set.add(day)
        }
        if(typeof days_data[day] == "undefined"){
            days_data[day]=[];
        }else{
            days_data[day].push(currentValue)
        }


    })
    console.log( days_data)


    let current_date = new Date();
    let curernt_day = current_date.getDate();
    let curernt_month = current_date.getMonth()+1;
    let curernt_year = current_date.getFullYear();


    if(curernt_month<10){ curernt_month='0'+curernt_month}
   // if(curernt_day<10){curernt_day='0'+curernt_day}

    let current=curernt_year+'-'+curernt_month+'-'+curernt_day


   // yesterday
    current_date.setDate(current_date.getDate() - 1);
    let yesterday_day = current_date.getDate();
    let yesterday_month = current_date.getMonth()+1;
    let yesterday_year = current_date.getFullYear();

    if(yesterday_month<10){ yesterday_month='0'+yesterday_month}
    let yesterday=yesterday_year+'-'+yesterday_month+'-'+yesterday_day

    console.log(current,yesterday)
    console.log('==================')
    set.forEach((key,val)=>{
        console.log(key + ": " + val)
        if(key === current || key=== yesterday) {
            fs.writeFileSync(`yn_xwlb_content/${key}.json`, JSON.stringify(days_data[key]), function (error) {
                if (error) {
                    console.log('写入失败')
                } else {
                    console.log('写入成功了')
                }
            })
        }


    })


    //await sleep(180)
    //await sleep(100000);
   // await browser.close();
    await page.close();
    await browser.disconnect();
})();

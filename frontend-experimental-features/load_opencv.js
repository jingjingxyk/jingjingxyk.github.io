let opencv_lib_url='https://www.jingjingxyk.com/ajax/libs/opencv/5.x/opencv.js'
{

    let onloadInitOpencvCallback=()=>{

    }
    let conf=JSON.parse(confObj.getAttribute('data-data'));
    console.log(conf)


    let script = document.createElement("script");
    script.setAttribute("src", conf.opencv_lib_url);
    script.setAttribute("type", "application/javascript");
    script.setAttribute("charset", "utf-8");
    script.setAttribute("async", "true");

    script.addEventListener('load', async (e) => {
        console.log("OpenCvReady ok")

        if (cv.getBuildInformation) {
            console.log(cv.getBuildInformation());
            onloadInitOpencvCallback();
        } else {
            // WASM
            if (cv instanceof Promise) {
                window.cv = await cv;
                console.log(cv.getBuildInformation());
                onloadInitOpencvCallback();
            } else {
                cv['onRuntimeInitialized'] = () => {
                    console.log(cv.getBuildInformation());
                    onloadInitOpencvCallback();
                }
            }
        }


    })
    document.body.appendChild(script);

}

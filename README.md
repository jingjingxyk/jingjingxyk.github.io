# jingjingxyk.github.io

## [Deployment with GITHUB_TOKEN](https://github.com/peaceiris/actions-gh-pages#%EF%B8%8F-first-deployment-with-github_token)
## [actions-gh-pages-readme](https://github.com/peaceiris/actions-gh-pages#readme)

## [js 读取本地音频文件](https://stackoverflow.com/questions/49140159/extracting-audio-from-a-video-file/49182456#49182456)
```javascript
var offlineAudioContext = new OfflineAudioContext(numberOfChannels, sampleRate * duration, sampleRate);
var soundSource = offlineAudioContext.createBufferSource();
...
reader.readAsArrayBuffer(blob); // video file
reader.onload = function () {
  var videoFileAsBuffer = reader.result; // arraybuffer
  audioContext.decodeAudioData(videoFileAsBuffer).then(function (decodedAudioData) {
    myBuffer = decodedAudioData;
    soundSource.buffer = myBuffer;
    soundSource.connect(offlineAudioContext.destination);
    soundSource.start();

    offlineAudioContext.startRendering().then(function (renderedBuffer) {
      console.log(renderedBuffer); // outputs audiobuffer
    }).catch(function (err) {
      console.log('Rendering failed: ' + err);
    });
  });
};
```


## 配置github ssh key
```
vi ~/.ssh/config

Host github.com
    Hostname github.com
    Port 22
    PreferredAuthentications publickey
    StrictHostKeyChecking no
    IdentityFile ~/.ssh/your-github-ssh-private-key

```


## opencv
```
https://github.com/opencv/opencv
https://github.com/opencv/opencv_3rdparty/branches/all  第三方库
http://www.linuxfromscratch.org/blfs/view/svn/general/opencv.html
```

## python  opencv_python
```
pip3 install opencv_python

```
## gstreamer
```
https://gstreamer.freedesktop.org/

```

## chromium
```
git clone https://chromium.googlesource.com/chromium/src
http://src.chromium.org/chrome/trunk/src/chrome/common/extensions/docs/

https://src.chromium.org/viewvc/chrome/trunk/src/

https://chromiumdash.appspot.com/schedule


```

## linux
```
https://www.linuxfoundation.org/projects
```
## gitiles gerrit 清华镜像
```

https://gerrit-google.tuna.tsinghua.edu.cn

```

## 安卓 清华镜像
```
https://android.googlesource.com/ 全部使用 https://aosp.tuna.tsinghua.edu.cn/

https://mirrors.tuna.tsinghua.edu.cn
```

## google china
```
https://developers.google.cn/china/

```

## google web
```
https://developers.google.cn/web/tools/
https://developers.google.cn/web/

```
## PWA
```
https://github.com/googlechrome/samples/tree/gh-pages/service-worker/basic
```

## three.js  VR
```
https://threejs.org/
```

## react-vr
```
https://facebook.github.io/react-vr/docs/getting-started.html#content
```

## puppeeter
```
https://github.com/GoogleChrome/puppeteer

PUPPETEER_DOWNLOAD_HOST=https://registry.npmmirror.com


# https://pptr.dev/
```

## chromium headless
```
google-chrome --headless --remote-debugging-port=9222  --disable-gpu

https://developers.google.cn/web/updates/2017/04/headless-chrome

https://chromium.googlesource.com/chromium/src/+/master/headless/README.md
https://chromium.googlesource.com/chromium/src/+/main/

https://registry.npmmirror.com/binary.html?path=chromium-browser-snapshots/

```

## chromium  chrome 特性
```
https://www.chromestatus.com
https://www.chromestatus.com/features/5685444318593024
https://chromium.googlesource.com/chromium/src/+/main/

https://chromiumdash.appspot.com/schedule
```

## asterisk
```
 git clone http://gerrit.asterisk.org/asterisk asterisk
 git clone git://git.asterisk.org/dahdi/linux dahdi-linux
 git clone git://git.asterisk.org/dahdi/tools dahdi-tools
 git clone http://gerrit.asterisk.org/libpri libpri

```

## freeswitch
```
git clone https://github.com/signalwire/freeswitch.git

```

## XMPP  XMPP之openfire+spark+smack

```


```

## RTP/RTCP/RTSP/SIP/SDP   HLS   MPEG-DASH   (bento4、 mp4box、x264、FFmpeg  for mpeg-dash )  webrtc   vlc
```

https://github.com/Dash-Industry-Forum/dash.js

webrtc
https://github.com/webrtc/samples

```

## R

```
https://mirrors.tuna.tsinghua.edu.cn/CRAN/
sudo apt-get install r-base

sudo apt-get install r-base-dev
```
```
https://github.com/fffaraz/awesome-cpp

```
## Solidity 区块链智能合约

## 视觉相关
- Open CV　实时的图像处理、计算机视觉以及模式识别程序
- CUDA　统一计算架构（GPU相关）
- MTP　（Media Transfer Protocol）媒体传输协议
- AVC（Advanced Video Coding）高级视频编码
- HEVC（High Efficiency Video Coding）是一种新的视频压缩标准


## HMR比livereload



## 阿尔米汉电影
    《三傻大闹宝莱坞》《摔跤吧！爸爸》《我的个神啊》 《神秘巨星》



## 【有钱人的思维方式】
    财富的积累与钱关系不大，关键是要具备“有钱人”的思维方式：大量阅读、不择手段、有钱是靠投资而不是靠省钱/存钱、坚信物以类聚人以群分的道理、设定可实现的小目标----湾区日报


## 【产品经理的三种思维】
    Explorer：产品生命周期的最初阶段，探索发现值得解决的问题；Scientist：提出猜想、做实验验证猜想；Driver：决定要做什么了后驱动整个团队直达终点----湾区日报


## 【扭曲现实的 Filter Bubbles】
    我们在网上接触到的信息越来越多是经过“个性化定制”的、经过过滤的，算法很有偏见，尽量推荐你喜欢看的、这样点击率比较高。会有种错觉，好像全世界所有人的想法、品味都跟你一样初阶段，探索发现值得解决的问题；Scientist：提出猜想、做实验验证猜想；Driver：决定要做什么了后驱动整个团队直达终点----湾区日报

## 【焦虑是最没用的情绪】
    给烦恼很多的管理者们的建议。你只能控制你所能控制的，别太纠结你不能控制的事；没必要操心很远的未来，专注于现在；想想你多幸运，世界上过得比你惨的大有人在，没必要太多抱怨 ----湾区日报

## 【What Startups Really Sell】
    如果你做的东西能为人带来便利、能帮人节省时间，那这个东西就能卖得出去。在判断一个创业 idea 好不好时，先问一下：这个 idea 能帮人“节省时间”吗？----湾区日报
##为什么要做、有没有必要做、能不能砍掉80%的需求又能达到同样的效果？

## 《让子弹飞》捞钱手段  现实中无处不在

## PWA

PWA 就是提供类似 App 体验的网站，包括一系列的具体技术，比如 Service worker、 Web App Manifest、 Cache API、 Fetch API、 Push API、 Web Push Protocol、 Notification


「离线访问」，「消息推送」和「桌面通知」三大神器


 WebAssembly   web浏览器 目标汇编语言


## git commits 出现累积叠加 解决办法
```bash
git merge dev --squash

git branch -D dev
git checkout -b dev
```

## 创建新的空分支
```bash
git checkout -b --orphan  new_branch

git rm -rf .
```

## 获取提交时间
```bash
获得提交时间
 TZ=UTC git show --date=format-local:%Y%m%d%k%M%S
```

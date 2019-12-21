# jingjingxyk-github-io


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

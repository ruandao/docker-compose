
阴影：
    可以采用背景图的方式生成阴影
    也可以采用 `import { ShadowFlex } from "react-native-neomorph-shadows";` 这个库来生成阴影
    
录音：
    iOS 的 webview 不支持录音功能，可以将录音请求转发到 rn, 然后rn 进行录音
    
录音有个问题是，iOS 录音是 caf 格式，android 录音是 m4a ，需要转成 mp3 格式，可以使用 ffmpeg 来进行转换
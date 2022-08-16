import { chinese_unicode_str } from '/note/js/components/chinese-unicode.js'

let show_unicode_chinese = () => {
  console.log(chinese_unicode_str())

  let template = `
    <meta charset="utf-8"/>
    <meta name="description" content="显示unicode汉字">
    <title>显示unicode汉字</title>
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content="jingjingxyk">
    <meta charset="utf-8">
    <style>
        body{
            /*
            background: rgb(40,41,35);
            color:rgb(248,248,242);

            color:#31c27c;
            */
            background: #f8f8f8;
            background: url(/note/images/bkg.gif);

            color: rgb(248,248,242);
            font-family: Monaco,bitstream vera sans mono,lucida console,Terminal,monospace;
        }
        h2{
            color: #c5955d;
        }
        .content,article{
            font-size: 1.1rem;
            line-height: 1.4rem;
            /*
            letter-spacing: 1rem;
            word-spacing:1rem;

             */
        }
       footer{
           position: fixed;
           right: 0;
           bottom: 0;
        }
    </style>
    <article class="content"  >
    这里输入
   </article>
    <footer>
     Copyright © 2012-<span class="current-year"></span>
    </footer>
        <script type="module">

          //document.documentElement.setAttribute("contenteditable","true");
          document.documentElement.setAttribute("charset","utf-8");
            console.log(chinese_unicode_str())
          document.querySelector('.current-year').innerHTML=(new Date()).getFullYear();

        </script>

`;

  let newWindow = window.open("", "_blank");
  newWindow.document.write(template)
  newWindow.document.querySelector('.content').append(chinese_unicode_str());
  newWindow.document.title = "显示unicode汉字";
  newWindow.focus();
};
export { show_unicode_chinese };

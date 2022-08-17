import {chinese_unicode_str} from '/note/js/components/chinese-unicode.js'

let show_unicode_chinese = () => {

    let template = `
<!DOCTYPE html>
<html lang="en">
    <head>
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

                background: url(/note/images/bkg.gif);

                color: rgb(248,248,242);
                */
                background: #f8f8f8;
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
    </head>
    <body>
        <article class="content"  ></article>
    </body>
</html>


`;

    let newWindow = window.open("", "_blank");
    newWindow.document.write(template)
    newWindow.document.querySelector('.content').append(chinese_unicode_str());
    newWindow.document.title = "显示unicode汉字";
    newWindow.focus();
};
export {show_unicode_chinese};

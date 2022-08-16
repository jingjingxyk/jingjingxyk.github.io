let self_define_browser_editor = () => {
  let newWindow = window.open("", "_blank");
  // id.document.body.innerHTML="<div >ABCD</div>";

  let template = `
    <meta charset="utf-8"/>
    <meta name="description" content="自定义浏览器编辑器">
    <title>自定义浏览器编辑器</title>
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
            background: url(images/bkg.gif);

            color: rgb(248,248,242);
            font-family: Monaco,bitstream vera sans mono,lucida console,Terminal,monospace;
        }
        .content,article{
            font-size: 1.1rem;
            line-height: 1.2rem;
        }
       footer{
           position: fixed;
           right: 0;
           bottom: 0;
        }
    </style>
    <article class="content" contenteditable="true" >
    这里输入
   </article>
    <footer>
     Copyright © 2012-<span class="current-year"></span>
    </footer>
        <script type="application/javascript">
          document.documentElement.setAttribute("contenteditable","true");
          document.documentElement.setAttribute("charset","utf-8");

          document.querySelector('.current-year').innerHTML=(new Date()).getFullYear();
          document.querySelector('.content').focus();
    </script>
`;

  newWindow.document.write(template);
  // newWindow.document.body.innerHTML=template;
  newWindow.document.title = "浏览器自带编辑器";
  newWindow.focus();
};
export { self_define_browser_editor };


    Reveal.initialize({
        controls: true,
        controlsTutorial: true,
        controlsLayout: 'bottom-right',
        controlsBackArrows: 'faded',
        progress: true,
        slideNumber: false,
        hash: true,
        keyboard: true,
        overview: true,
        center: true,
        touch: true,
        loop: false,
        navigationMode: 'default',
        fragments: true,
        autoPlayMedia: null,
        display: 'block',
        width: "100%",
        height: "100%",
        margin: 0,
        minScale: 1,
        maxScale: 1,
        dependencies: [
            // Interpret Markdown in <section> elements
            { src: '//cdn.bootcss.com/reveal.js/3.8.0/plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
            { src: '//cdn.bootcss.com/reveal.js/3.8.0/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },

            // Syntax highlight for <code> elements
            { src: '//cdn.bootcss.com/reveal.js/3.8.0/plugin/highlight/highlight.js', async: true },

            // Zoom in and out with Alt+click
            { src: '//cdn.bootcss.com/reveal.js/3.8.0/plugin/zoom-js/zoom.js', async: true },

            // Speaker notes
            { src: '//cdn.bootcss.com/reveal.js/3.8.0/plugin/notes/notes.js', async: true },

            // MathJax
            { src: '//cdn.bootcss.com/reveal.js/3.8.0/plugin/math/math.js', async: true }
        ]
    });


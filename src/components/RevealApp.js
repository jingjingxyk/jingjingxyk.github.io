
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
            { src: '/ajax/libs/reveal.js/4.3.1/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },

            // Syntax highlight for <code> elements
            { src: '/ajax/libs/reveal.js/4.3.1/plugin/highlight/highlight.js', async: true },

            // Zoom in and out with Alt+click
            { src: '/ajax/libs/reveal.js/4.3.1/plugin/zoom/zoom.js', async: true },

            // Speaker notes
            { src: '/ajax/libs/reveal.js/4.3.1/plugin/notes/notes.js', async: true },

            // MathJax
            { src: '/ajax/libs/reveal.js/4.3.1/plugin/math/math.js', async: true }
        ]
    });


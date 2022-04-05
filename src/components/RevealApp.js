
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
            { src: 'https://cdnjs.cloudflare.com/ajax/libs/reveal.js/4.1.2/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },

            // Syntax highlight for <code> elements
            { src: 'https://cdnjs.cloudflare.com/ajax/libs/reveal.js/4.1.2/plugin/highlight/highlight.js', async: true },

            // Zoom in and out with Alt+click
            { src: 'https://cdnjs.cloudflare.com/ajax/libs/reveal.js/4.1.2/plugin/zoom/zoom.js', async: true },

            // Speaker notes
            { src: 'https://cdnjs.cloudflare.com/ajax/libs/reveal.js/4.1.2/plugin/notes/notes.js', async: true },

            // MathJax
            { src: 'https://cdnjs.cloudflare.com/ajax/libs/reveal.js/4.1.2/plugin/math/math.js', async: true }
        ]
    });


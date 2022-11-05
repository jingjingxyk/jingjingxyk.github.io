import * as THREE from 'https://cdnjs.cloudflare.com/ajax/libs/three.js/0.146.0/three.module.min.js'
import * as  utils from 'https://www.jingjingxyk.com/ajax/libs/jingjingxyk/frontend-utils/utils.js'

import {JSONEditor} from "https://www.jingjingxyk.com/ajax/libs/josdejong/svelte-jsoneditor/main/index.js";


import hljs from "/ajax/libs/highlight.js/11.6.0/es/highlight.min.js"
import nginx from "/ajax/libs/highlight.js/11.6.0/es/languages/nginx.min.js"
import yaml from "/ajax/libs/highlight.js/11.6.0/es/languages/yaml.min.js"
import shell from "/ajax/libs/highlight.js/11.6.0/es/languages/shell.min.js"


hljs.registerLanguage('yaml', yaml);
hljs.registerLanguage('nginx', nginx);
hljs.registerLanguage('shell', shell);
const brPlugin = {
    "before:highlightBlock": ({block}) => {
        block.innerHTML = block.innerHTML.replace(/\n/g, '').replace(/<br[ /]*>/g, '\n');
    },
    "after:highlightBlock": ({result}) => {
        result.value = result.value.replace(/\n/g, "<br>");
    }
};
hljs.addPlugin(brPlugin);


const scene = new THREE.Scene();
console.log(utils)
console.log(utils.default)

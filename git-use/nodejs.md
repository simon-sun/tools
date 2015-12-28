#安装和使用 nodejs 实现html的css，js压缩

###安装centos的插件
yum install epel-release
### 安装nodejs 和npm
yum install nodejs npm
###安装 fis3的一些应用
npm install -g fis3 fis-optimizer-html-minifier fis3-deploy-replace

执行

### 项目家目录的fis-conf.js   实现压缩的项目目录
var WEBPATH = '/usr/local/httpd/htdocs/dev_pfedu_web_xp/app/';

// 没安装 nginx concat 模块，先禁用
// function nginx_concat(type, dir, content){
//     var match, tag;
//     switch(type){
//         case 'css':
//             match = content.match(/[\w\-\.]+?\.css/ig);
//             tag = '<link rel="stylesheet" href="' + dir + '??' + match.join(',') + '">';
//             break;
//         case 'js':
//             match = content.match(/[\w\-\.]+?\.js/ig);
//             tag = '<script src="' + dir + '??' + match.join(',') + '"></script>';
//             break;
//     }
//     return tag;
// }

fis.set('project.md5Connector', '.');

fis.match('/tmpl/*.html', {
    useHash: true,
    release: '/app/$0',
    // optimizer: fis.plugin('html-minifier', {
    //     removeComments: true,
    //     removeCommentsFromCDATA: true,
    //     collapseWhitespace: true,
    //     collapseBooleanAttributes: true,
    //     removeRedundantAttributes: true,
    //     useShortDoctype: true,
    //     removeEmptyAttributes: true,
    //     removeOptionalTags: true
    // }),
    deploy: fis.plugin('local-deliver',{
        to: WEBPATH
    })
});

fis.match('/images/**.{png,gif,jpg,jpeg}', {
    useHash: true,
    release: '/app/static/$0',
    deploy: fis.plugin('local-deliver',{
        to: WEBPATH
    })
});

// fis.match('/images/**.png', {
//     optimizer: fis.plugin('png-compressor')
// });

fis.match('/css/*.css', {
    useHash: true,
    release: '/app/static/$0',
    // optimizer: fis.plugin('clean-css', {
    //     report: 'gzip'
    // }),
    deploy: fis.plugin('local-deliver',{
        to: WEBPATH
    })
});

fis.match('/js/*.js', {
    useHash: true,
    release: '/app/static/$0',
    // optimizer: fis.plugin('uglify-js', {
    //     report: 'gzip',
    //     compress: {
    //         drop_console: true,
    //         global_defs: {
    //             PROD: true
    //         },
    //     },
    //     mangle: true,
    //     preserveComments: true
    // }),
    deploy: fis.plugin('local-deliver',{
        to: WEBPATH
    })
});

fis.match('/libs/angular-1.3.8/(*.js)', {
    useHash: true,
    release: '/app/static/angular/$1',
    deploy: fis.plugin('local-deliver',{
        to: WEBPATH
    })
});

fis.match('/index-tmpl.html', {
    release: '/index.html',
    // optimizer: fis.plugin('html-minifier', {
    //     removeComments: true,
    //     removeCommentsFromCDATA: true,
    //     collapseWhitespace: true,
    //     collapseBooleanAttributes: true,
    //     removeRedundantAttributes: true,
    //     useShortDoctype: true,
    //     removeEmptyAttributes: true,
    //     removeOptionalTags: true
    // }),
    deploy: [
        // 没安装 nginx concat 模块，先禁用
        // fis.plugin('replace', {
        //     from: /<concat type="(.*?)" dir="(.*?)">([\s\S]*?)<\/concat>/ig,
        //     to: function() {
        //         return nginx_concat(arguments[1], arguments[2], arguments[3]);
        //     }
        // }),
        fis.plugin('local-deliver',{
            to: WEBPATH
        })
    ]
});
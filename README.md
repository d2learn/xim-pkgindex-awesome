# xim-pkgindex-awesome

去中心化的 [ XIM包索引仓库列表 ] 索引仓库 | Decentralized [XIM Package Index Repository List] index repository

## 简介

xlings(xim)支持去中心化的包索引仓库以及对应的资源服务器, 即**每个人和组织(社区/公司/..)都可以快速搭建一套自己的软件生态, 用于在内部或公开区域进行共享分发和复用**

xlings本身是一个开源的包管理工具, **支持多版本共存和管理 + 万物皆可成包的设计理念**, 他本身并不持有和控制包索引和包资源, 而只做包索引的建立和管理, 以及[xpkg包](https://xlings.d2learn.org/documents/xpkg/intro.html)的执行器

一些可能的应用场景

- 个人软件/脚本工具/库/配置的管理及分发
- 开源社区的软件生态管理和分发
- 公司内部的软件版本, 开发环境管理及复用
- ...

> 注: 这里的包或xpkg可能是 `软件、库、脚本、插件、配置组合、环境搭建...` 等, 而不是传统的软件包的概念。例如: 这个`xim-pkgindex-awesome`仓库管理的"包", 就是其他的包索引仓库

## 如何自建包索引/软件生态?

- step1: 通过 [xim-pkgindex-template](https://github.com/new?template_name=xim-pkgindex-template&template_owner=d2learn) 创建一个基础包索引仓库
- step2: 参考[xpkg](https://xlings.d2learn.org/documents/xpkg/intro.html)和[libxpkg](https://xlings.d2learn.org/documents/libxpkg/intro.html)文档编写包文件, 并添加到自建的包索引仓库中
- step3: 使用`xim --add-indexrepo namespace:xxx.git`即可自动建立包索引并使用所编写的包
- step4 (可选) : 添加自建的包索引仓库, 到该[xim-pkgindex-awesome]()中, 其他用户即可以使用`xlings install awesome:yourNamespace`来获取你维护的包索引及软件生态

> 注: 如果你的包索引仓库只有内网可以访问, 对应的也就只有内网用户可以使用

## 包索引仓库列表

| 包索引仓库 | 命名空间 | 简介 |
| --- | --- | --- |
| [xim-pkgindex](https://github.com/d2learn/xim-pkgindex) | | xlings官方组织维护的包索引仓库 |
| [xim-pkgindex-template](https://github.com/d2learn/xim-pkgindex-template) | xim | 自建/镜像/私有包索引模板仓库 |
| [xim-pkgindex-fromsource](https://github.com/d2learn/xim-pkgindex-fromsource) | fromsource | 从源码构建软件的包索引仓库 |
| [xim-pkgindex-d2x](https://github.com/d2learn/xim-pkgindex-d2x) | d2x | d2x公开课项目索引仓库 |
| [xim-pkgindex-scode](https://github.com/d2learn/xim-pkgindex-scode) | scode | 源码资源索引仓库 |
| [xim-pkgindex-dragonos](https://github.com/d2learn/xim-pkgindex-awesome/blob/main/pkgs/d/dragonos.lua) | dragonos | DragonOS社区软件/工具生态包索引仓库 |

## 其他

- xlings工具: https://github.com/d2learn/xlings
- xlings论坛版块: https://forum.d2learn.org/category/9/xlings
- xim包索引主仓库: https://github.com/d2learn/xim-pkgindex

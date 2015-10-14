
# Bible HTML

## Overview

Bible HTML is a Bible software built using modern, frontend web technologies.
It differs from existing Bible softwares by being built entirely in 
HTML, CSS, and JavaScript - no compiler/runtime/server is needed to run it 
other than your web browser. This approach allows it to run in almost every device with
a web browser. 

Bible HTML is built to be a fast and minimalist alternative to most desktop Bible softwares.
The [default build](http://ajbodev.github.io/Bible.html) is in one HTML file 
(including the CSS and JS), so it is easily distributable
and works offline via the file protocol (in addition to standard http).

Search is a first class citizen in Bible HTML, as clearly seen in its topmost area.
It has an autosuggest feature for all the possible words in the Bible. Advanced search (regex)
is possible by appending @ before your search.

## Usage

You can see it online [here](http://ajbodev.github.io/Bible.html), and then download it 
if you want by saving the web page (CTRL-S).

<image 
  src='http://ajbodev.github.io/media/bible-html.jpg' 
  style=' margin: 0px 20px 0px 0px'>
</image><br>

*Screenshot of Bible HTML*

## Features

* **No installation**
  * Unlike other Bible softwares, no installation is required - you *only* need a web browser
* **Fast**
  * Check this [link](http://www.smashingmagazine.com/2012/11/writing-fast-memory-efficient-javascript/)
    for an explanation of why Bible HTML is fast
  * The Bible is stored in a 3d array, ~33K in length (but minified) - 
    it turns out doing this is very fast in a modern web browser
  * It can also be faster by loading this array in an external script, 
    and relying on the browser to cache it
  * An even better technique is to use indexedb (soon to come)
* **Minimalist**
  * Only what's *absolutely* needed to read and search the scriptures
  * A topmost search input with button
  * 3 columns for books, chapter, verses, like the popular eSword
* **Web-based**
  * The web has been one of the fastest advancing pieces of technology that we have
  * Modern frontend web technology (jquery, angular, react, ember, mithril) have made
    developing and consuming apps for the web a much pleasant experience
* **Route-driven**
  * The view layer of the Bible HTML is driven by routes, which are URLs that are 
    'friendly', 'semantic', 'RESTful', 'clean', even 'SEO-friendly'
  * Brings REST API design to Bible software
  * Allows navigation (including back button) and searching from the web browser bar
* **Search**
  * Autosuggest all possible words in the Bible (reads your mind)
  * Advanced search (regex) is possible via prefixing with the @ symbol
* **Mobile-friendly**
  * Works seamlessly on mobile phones, tablets
* **Open source**
  * MIT License, hosted on Github
    
## Alternatives

There are many offline (desktop) and online alternatives to Bible HTML.

### Desktop

Most popular Bible softwares are built with technology made primarily 
for the desktop, and thus by default cannot run on the web.
They are generally more powerful (more features, maximalist) than the 
Bible HTML (less features, minimalist). For the poweruser, this experience 
is generally more desirable.

But for the NON-poweruser, the Bible HTML with its core features 
(zero-installation, fast-rendering, minimalist layout, autosuggesting search)
should more than suffice in reading and searching the scriptures.

Here is a partial list (from [this](http://christianity.about.com/od/biblestudyresources/tp/biblesoftware.htm) website)
of popular desktop Bible softwares:

* e-Sword (Windows)
* MacSword (Macintosh)
* Logos Bible Software (Windows & Macintosh)
* Accordance Bible Software (Macintosh)
* BibleWorks (Windows)
* iLumina Gold (Windows & Macintosh)
* PC Study Bible Version (Windows)
* QuickVerse (Windows)
* SwordSearcher Bible Software (Windows)
* WORDsearch Preaching Library (Windows)

### Online

There are online services that do what the Bible HTML is doing, but are 
mostly server-based. The disadvantage to this is a degraded user experience:
every transition (chapter, verse, search) requires a page reload, disrupting
a user's 'flow' when reading the scriptures.

In contrast, the Bible HTML is entirely client-based (single-page application) 
and requires no server. Also, the default build has no external dependencies 
(scripts, stylesheets) - it's all entirely in one page!

Just open Bible.html in any web browser (online via http, or offline via file), 
and you're good to go!

## Docs

Documentation for Bible HTML can be found on the [wiki](https://github.com/ajbodev/bible-html/wiki).

## Development

To build and/or run tests, clone the git repo first

```
git clone https://github.com/ajbodev/bible-html.git
```

Then install npm and bower dependencies

```
npm install
bower install
```

### Building

Run the gulp task of choice using the following format(s)

```
gulp compile-[framework] // compile only (run-once)
gulp watch-[framework]   // compile then watch (run many times)
```

The framework of choice can be:

* **jquery** - jQuery with director.js
* **angular** - Angular.js with ui-router
* **react** - React.js with ReactRouter
* **ember** - EmberJS (with jQuery and handlebars)
* **mithril** - Mithril.js

Check the **dist/[framework]** subfolder(s) for the built Bible.html

### Running tests

Coming soon

## Author

**Omar Job Abesamis**
- <https://github.com/ajbodev>

## License

Open sourced under the [MIT license](LICENSE.md).
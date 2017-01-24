# Atomist 'rug-emacs-mode'

[![Slack Status](https://join.atomist.com/badge.svg)](https://join.atomist.com/)

Emacs major mode for the [Rug language][rug].

[rug]: http://docs.atomist.com/rug/rug-dsl/

## Installation

Until this mode gets distributed on [MELPA][melpa], you have to download it
manually and make it available to your emacs path:

[melpa]: http://melpa.milkbox.net/

```
$ mkdir ~/.emacs.d/atomist
$ cd ~/.emacs.d/atomist
$ curl -O https://raw.githubusercontent.com/atomist/rug-emacs-mode/master/rug-mode.el
```

then edit your `~/.emacs` or `.emacs.d/init.el` file and append the following:

```
(add-to-list 'load-path "~/.emacs.d/atomist")
(require 'rug-mode)
```

Next time you start emacs, this will automatically
associate files with the `.rug` and `.rt` extensions to this mode.

## TODO

* ~~color syntax highlighting~~
* indentation
* autocompletion
* syntax highlighting of imported editors
* syntax highlighting of embedded code snippets

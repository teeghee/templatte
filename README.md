---
title: Templatte
author: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
date: today
---

![][./made-with-lisp-flat.svg]

## Synopsis

A simple emacs module for inserting templates into your current file.

## Installation and Configuration

Clone the git repository into some directory in your `load-path`:

``` emacs-lisp
(add-to-list 'load-path "/templatte/directory/")
```

Your templates must be located in `templatte-templates-directory`.  Initially, it is set to be `~/.emacs.d/templates/` but if you wish, you may change it by `setq`:

``` emacs-lisp
(setq templatte-templates-directory "/your/templates/")
```

Finally, add

``` emacs-lisp
(load "templatte.el")
```
in your init file.

## Usage

In a file buffer, execute `templatte`.  This can be done by `M-x templatte`.  Templatte searches `templatte-templates-directory` and matches all the templates you saved in the directory.  This matching process is a naive comparison of your buffer's file name extension with templates files in the template directory having the same extension.  Just make sure the template file has **correct extension**.

## Licence

GPL 3.0: see [COPYING](./COPYING).



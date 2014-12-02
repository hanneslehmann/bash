bash
====

A collection of useful scripts which I use myself for my daily work. More details to come....

whatchme
--------
runs a given command whenever a file changes.

-  Argument 1: filename to be whatched  
-  Argument 2: command to be executed 

See skript "md-chapters" which benefits from whatchme


md-chapters
-----------
The script was needed to generate the chapter numbers while using markdown documents for pandoc to create PDFs. I wanted a chapter / section numbering which should be added automatically just before compiling to PDF.

Example using the combination with whatchme - which I use with an open terminal to have a quick overview of the structure of the markdown document I am working on:  

```bash
whatchme.sh file.md 'md-chapters.sh file.md'
```
-  Argument 1: filename to be whatched  
-  Argument 2: (optional) = "show|complete"

Parses a file and returns a chapter numbering in respect to the count of "#" which indicates a section in Markdown.

option = show, shows the "#"
option = complete, shows first the original chapter titel and then the one with added numbering (for easy string replacement)

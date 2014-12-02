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
Example using the combination with whatchme:  

```bash
whatchme.sh file.md 'numbering.sh file.md'
```
-  Argument 1: filename to be whatched  
-  Argument 2: command to be executed

Parses a file and returns a chapter numbering in respect to the count of "#" which indicates a section in Markdown.
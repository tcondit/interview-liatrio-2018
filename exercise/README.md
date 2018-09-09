# Creating an HTML Doc From Markdown

```pandoc
~/P/c/D/j/2/technical-exercise ☕️  pandoc -s journal.md -o journal.html --standalone
```

## Notes

* I've added an (AFAIK) invalid `pandoc_title_block` to the top of the file. A Markdown linter would complain, but it's renders nicely.
* Related: I've started the content with an `H2` header, also not strictly legit. The alternative was to duplicate the title, which is _even less_ legit.

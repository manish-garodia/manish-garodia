# Hands down in Markdown

![Markdown](./images/md.png " ")

## Introduction

This lab is about markdown basic formatting and tags.

### Common code editors
 - **Notepad ++** &emsp;: &emsp;[Read about it](https://notepad-plus-plus.org/) &nbsp;- &nbsp;[want to download](https://notepad-plus-plus.org/downloads/)
 - **Geany** &emsp;&emsp;&emsp;&nbsp;&nbsp;: &emsp;[Read about it](https://www.geany.org/) &nbsp;- &nbsp;[want to download](https://www.geany.org/download/releases/)
 - **gedit** &emsp;&emsp;&emsp;&emsp;: &emsp;[Read about it](https://wiki.gnome.org/Apps/Gedit) &nbsp;- &nbsp;[want to download](https://wiki.gnome.org/Apps/Gedit#Installation)
 - **codeblocks** &emsp;&nbsp;: &emsp;[Read about it](https://www.codeblocks.org/) &nbsp;- &nbsp;[want to download](https://www.codeblocks.org/downloads/)

## General formatting

 - *Bold*

	<ins>Format</ins> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<ins>Output</ins>   
	\*\*bold\*\* &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; **bold**   
	\_\_This will also be bold\_\_ &emsp;&emsp; __This will also be bold__

 - *Italics*

	<ins>Format</ins> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<ins>Output</ins>   
	\*italic\* &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; *italic*   
	\_This will also be italic\_ &emsp;&emsp;&emsp;_This will also be italic_

	<ins>Example</ins>   
	You _can_ **combine them** also

 - *Strikethrough* with two tildes such as ~~this~~   
	Maybe, not showing correctly in this lab but works fine on Github.

 - *Line breaks* or *soft enter*   
	Add 2 spaces or a backslash (`\`) at the end of the first line.

	 - to break two different bullet lists

		```
		<p>&nbsp;</p>
		```

	 - to add empty space, similar to indentation

		```
		&emsp;
		```

	HTML equivalent tag is `<br>`

 - *Blockquotes*

	Quote someone, use the > character before the line.

	<ins>Format</ins>   
	 \> Coffee. The finest organic suspension ever devised... I beat the Borg with it.   
	 \> - Captain Janeway

	<ins>Output</ins>   
	 > Coffee. The finest organic suspension ever devised... I beat the Borg with it.
	 > - Captain Janeway

## Headings

Create heading styles in two ways:

 - **setext** - Use equal sign ====== under the title for heading 1, single line ------ under the title for the next level, etc.
 - **atx** - Use hashes `#` to create headings. Multiple hashes `##` in a row for subsequent heading levels.

	<ins>Example</ins>    
	\### This is the 3rd level heading

	<ins>Output</ins>   
	### This is the 3rd level heading

	<ins>Example</ins>    
	\#### This is the 4th level heading

	<ins>Output</ins>   
	#### This is the 4th level heading

You can create up to `######` six levels of heading styles.

## Lists

- Numbered list
- Bulleted list

	## Numbered list

	Enter 3 blank spaces to indent a nested list (to create subitems).

	Use Arabic number system (1, 2, 3, ...) or maybe use (1, 1, 1,) for simplicity. Both will render the correct sequence.


	<ins>Format</ins>    
	This is the paragraph.    
	&nbsp;`1`. Item one   
	&emsp;&nbsp;`1`. Subitem one   
	&emsp;&nbsp;`1`. Subitem two   
	&emsp;&nbsp;`1`. Subitem three   
	&nbsp; `1`. Item two   

	<ins>Output</ins>   
	This is the paragraph.
	1. Item one
		1. Subitem one
		1. Subitem two
		1. Subitem three
	1. Item two
		1. Subitem one
		1. Subitem two

	 > **Best practice**: Using 1, 1, 1, prevents manual renumbering, in case of modifications in the list order.

	## Bulleted list

	<ins>Format</ins>    
	\* Start a line with a star (asterisk)   
	\* Bingo!

	<ins>Output</ins>   
	* Start a line with a star
	* Bingo!

	<ins>Format</ins>    
	Alternatively,   
	&nbsp;\- Dashes   
	&nbsp;\- for subpoints, put two spaces before the dash or star:   
	&emsp;&nbsp;\- As this   
	&emsp;&nbsp;\- And this

	<ins>Output</ins>   
	Alternatively,
	 - Dashes
	 - for subpoints, put two spaces before the dash or star:
		 - As this
		 - And this

## Images

<ins>Format</ins>   
\!\[Alt Text\](url or path)  

\!\[img-Template](images/md.png "click the image")

<ins>Output</ins>   
![img-Template](./images/md.png "click the image")

- Other options

	## Image description

	 -- Not fully tested --

	1. Add an image using the previous format.

	1. Add `image-file-name.txt` under the **files** folder.

	1. Describe the image in the text file.

	<ins>Example</ins>   
	![img-Template](./images/md.png "click the image")

	## embed images from url

	`![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)`

	![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)

## code

 - Inline code blocks

	<ins>Format</ins>   
	Use backticks \`var example = true`.

	<ins>Output</ins>   
	Use backticks `var example = true`.

 - Longer block of code, indent with four spaces:

		if (isAwesome){
		  return true
		}

 - Code fencing, multiple lines without indentation:

	```
	if (isAwesome){
	  return true
	}
	```

 - For syntax highlighting, include the language:

	```javascript
	if (isAwesome){
	  return true
	}
	```

	```java
	System.out.println("Hello World");
	```

 - To stop syntax highlighting in code, use `text':

	```text
	if (isAwesome){
	  return true
	}
	```

## Tables

- Use pipe `|` for columns
- The first row is the heading
- The line following the heading is the divider after which the rows start
- Use colon `:` to set the alignment for the column. For example, colon at the right will make the enture column right-aligned. For center-align, enter colons at both right and left side.
- use the syntax to create a custom caption for the table. If you do not provide a custom caption, then the lab renders the default caption format. The caption appears at the top of the table, which cannot be modified.

Syntax

```
<copy>
| Tables   | Are  | Cool  |
| -------- |:----:| -----:|
| col 3 is | test | $1600 |
| col 2 is | test | $12   |
{: title="The custom caption is here"}
</copy>
```

Output

| Tables | Are | Cool |
| -------- |:----:| -----:|
| col 3 is | test | $1600 |
| col 2 is | test | $12 |
{: title="The custom caption is here"}

## Acknowledgments

 - **Author** - ♏🅰️♑❗💲♓ Team Database UAD
 - **Last Updated on** - May 4, (Thu) 2023
 - **Questions/Feedback?** - Blame [manish.garodia@oracle.com](./../../../intro/files/email.md)

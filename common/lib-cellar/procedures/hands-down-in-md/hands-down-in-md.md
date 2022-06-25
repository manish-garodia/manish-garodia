# Hands down in Markdown

![Markdown](./images/md.png " ")

## Introduction

This lab helps explaining the usage of markdown format and tags. 

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

 - *Strikethrough* with two tildes like ~~this~~  
	Maybe, not showing for this repo but works ok on GIthub. 

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

 - **setext** - Use equal sign ====== below the title for heading 1, single line ------ below the title for the next level, etc. 
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

	Enter 3 blank spaces to indent a nested list (to create sub items).

	Use Arabic number system (1, 2, 3, ...) or simply use (1, 1, 1,) for simplicity. Both will render the correct sequence. 


	<ins>Format</ins>    
	This is the paragraph.    
	&nbsp;`1`. Item one   
	&emsp;&nbsp;`1`. Sub item one   
	&emsp;&nbsp;`1`. Sub item two   
	&emsp;&nbsp;`1`. Sub item three   
	&nbsp; `1`. Item two   

	<ins>Output</ins>   
	This is the paragraph.
	1. Item one
		1. Sub item one
		1. Sub item two
		1. Sub item three
	1. Item two
		1. Sub item one
		1. Sub item two

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
	&nbsp;\- for sub points, put two spaces before the dash or star:   
	&emsp;&nbsp;\- Like this   
	&emsp;&nbsp;\- And this

	<ins>Output</ins>   
	Alternatively,
	 - Dashes
	 - for sub points, put two spaces before the dash or star:
		 - Like this
		 - And this

## Images

<ins>Format</ins>   
\!\[Alt Text\](url or path)  

\!\[img-Template](images/md.png "click on the image")

<ins>Output</ins>   
![img-Template](./images/md.png "click on the image")

- Other options

	## Image description

	 -- Not fully tested --

	1. Add an image using the above format. 

	1. Add `image-filename.txt` under the **files** folder. 

	1. Describe the image in the text file.

	<ins>Example</ins>   
	![img-Template](./images/md.png "click on the image")

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

	```text
	if (isAwesome){
	  return true
	}
	```

## Acknowledgements

 - **Author** - Manish Garodia, Team Database UAD
 - **Last Updated on** - April 24, (Sun) 2022
 - **Questions/Feedback?** - Blame [manish.garodia@oracle.com](./../../../intro/files/email.md)


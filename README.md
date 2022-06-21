# Markdown? In my LaTeX?
This repository contains a number of LaTeX templates utilising the [witiko/markdown](https://github.com/witiko/markdown) package with the goal to separate the form from the content and enable the users to focus on their writings, instead of trying to figure out the formatting.

To typeset an example document, simply navigate to the template directory you want to use and call

`TEXINPUTS=./common_code: latexmk -lualatex driver.tex`

## Example: Business Card
Navigate to the `business_card` directory and open the `example.md` file with a text editor. The business card `example.md` looks initially like this:

```
# Nemo Green
## Tow Boat Enthusiast

- 1-800 PDFLATEX
- tug@boats.com
- Twenty Thousand Leagues  
    Under The Seas  
    MA, USA  
```
The contents of this file can be changed.

Running `TEXINPUTS=./common_code: latexmk -lualatex driver.tex` gives us an output `driver.pdf` file which looks like this:

![Example output of the template](https://github.com/xvrabcov/md-templates/releases/download/latest/business_card-output.png)

The template works with TeX Live 2021. We are currently using the `witiko/markdown:TL2021-historic` Docker image.


The development of these templates has been a part of the research project [MUNI/33/0776/2021](https://www.muni.cz/en/research/projects/62168), funded by the Faculty of Informatics, Masaryk University.

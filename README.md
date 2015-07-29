# DESCRIPTION
*decomposenumber* is an R package including functions that allow to decompose numbers.
It splits objects of *numeric* class or strings of alphanumeric characters with adequate decimal marks into its components. It also provides a function (still quite basic) to convert a number from one base to another.

# Installation
You can install this package using the [*devtools*](http://cran.r-project.org/web/packages/devtools/index.html) package. Once "devtools" is installed and loaded, enter:

> install_git("https://github.com/KevCaz/decomposenumbers.git")

or

> install_github("KevCaz/decomposenumbers")

Then, load it:

> library(decomposenumbers)

# License
The graphicsutils package is licensed under the GPLv3 (http://www.gnu.org/licenses/gpl.html).

# Future direction
1. I want to implement a new class to deal with *stacks* of *DecomposedNumber* objects.
2. I will strive to encode a function that allows exact addition with very large number.
3. Funciton *changebase* will hopefully become efficient.

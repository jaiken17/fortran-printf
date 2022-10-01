# fortran-printf
A limited Fortran interface to the "printf" function in C's stdio.h

## What is currently implimented?
A fully Fortran interface to 2 uses of `printf()` in C. The interface is called as an integer function `printf(fmt, value)` where `fmt` is the character string to be output to the terminal and `value` is the value (default precision real or integer for now) to be interpolated into `fmt` as it would be in C ex: `"this is an int: %d"`. The return of the Fortran `printf()` is an integer with the number of chars printed if successful and a negative value if an error occured. There is no need to end `fmt` with a `c_null_char` from iso_c_binding but any tab/new line chars need to be concatenated using `c_tab` (constant defined within fortran-printf as an alias for `c_horizontal_tab`) or `c_new_line` instead of using `\t` or `\n` within the string (as would be done in C). Apart from the tab/new line chars all parameters passed to `printf()` need not to accomodate being passed to C (this accomodation is done within the overloaded functions).

## What I would like to impliment:
- The ability to call `printf()` with at least 5 values of varying kinds and types. Any order of these 5 values (and less) should be allowed.
- The ability to call `printf()` on arrays.
- Integration of the library/interface with the Fortran Package Manager [fpm](https://fpm.fortran-lang.org/en/index.html)

## What is the point of fortran-printf?
This project is primarily meant to help me learn how to use the C interoperability features of modern Fortran. This may help others learn as well (but I am no expert). If this project ever gets enough features to be useful to you, feel free to use it, but I can't guarantee that it works as intended in all use cases (so it's probably not advised to use it in a large and/or important codebase).

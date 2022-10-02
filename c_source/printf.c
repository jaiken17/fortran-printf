#include <stdio.h>

int printf_none_c(char* fmt) {
    return printf(fmt);
}

int printf_1_int_c(char* fmt, int val) {
    return printf(fmt,val);
}

int printf_1_float_c(char* fmt, float val) {
    return printf(fmt, val);
}
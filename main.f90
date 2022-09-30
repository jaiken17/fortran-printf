program main
    use iso_c_binding
    use printf_fort
    implicit none


    print*, printf("Hello world, %d"//C_NEW_LINE,25)


end program main
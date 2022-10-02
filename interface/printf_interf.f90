module printf_fort
    use iso_c_binding
    implicit none


    private

    ! constants
    public C_TAB
    ! procedures
    public printf
    ! all vars and procedures not listed are private




    character(kind=C_CHAR,len=*),parameter :: C_TAB=C_HORIZONTAL_TAB


    interface printf

        module procedure printf_none_f, printf_1_int_f, printf_1_real4_f

    end interface printf



    interface
        function printf_none(fmt) result(ierr) bind(C, name="printf_none_c")
            import C_CHAR, C_INT
            implicit none
            character(kind=C_CHAR),intent(in) :: fmt(*)
            integer(C_INT) :: ierr
        end function printf_none

        function printf_1_int(fmt, val) result(ierr) bind(C, name="printf_1_int_c")
            import C_CHAR, C_INT
            implicit none
            character(kind=C_CHAR),intent(in) :: fmt(*)
            integer(C_INT),intent(in),value :: val
            integer(C_INT) :: ierr
        end function printf_1_int

        function printf_1_float(fmt, val) result(ierr) bind(C, name="printf_1_float_c")
            import C_CHAR, C_INT, C_FLOAT
            implicit none
            character(kind=C_CHAR),intent(in) :: fmt(*)
            real(C_FLOAT),intent(in),value :: val
            integer(C_INT) :: ierr
        end function printf_1_float

    end interface



contains

    function printf_none_f(fmt) result(ierr)
        character(len=*),intent(in) :: fmt
        integer :: ierr

        character(len=len(fmt)+1, kind=C_CHAR) :: fmt_c
        integer(C_INT) :: ierr_c

        fmt_c = fmt//C_NULL_CHAR

        ierr_c = printf_none(fmt_c)
        ierr = int(ierr_c, kind=kind(ierr))

    end function printf_none_f


    function printf_1_int_f(fmt, val) result(ierr)
        character(len=*),intent(in) :: fmt
        integer,intent(in) :: val
        integer :: ierr

        character(len=len(fmt)+1, kind=C_CHAR) :: fmt_c
        integer(C_INT) :: val_c, ierr_c

        fmt_c = fmt//C_NULL_CHAR
        val_c = int(val, kind=C_INT)

        ierr_c = printf_1_int(fmt_c, val_c)
        ierr = int(ierr_c, kind=kind(ierr))

    end function printf_1_int_f

    function printf_1_real4_f(fmt, val) result(ierr)
        character(len=*),intent(in) :: fmt
        real,intent(in) :: val
        integer :: ierr

        character(len=len(fmt)+1, kind=C_CHAR) :: fmt_c
        real(C_FLOAT) :: val_c
        integer(C_INT) :: ierr_c

        fmt_c = fmt//C_NULL_CHAR
        val_c = real(val, kind=C_FLOAT)

        ierr_c = printf_1_float(fmt_c, val_c)
        ierr = int(ierr_c, kind=kind(ierr))

    end function printf_1_real4_f


end module printf_fort
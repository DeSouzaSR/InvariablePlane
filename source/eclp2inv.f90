program eclp2inv
    ! Convert ecliptic coordinates to coordinates of the invariant
    ! plane.
    implicit none
    integer, parameter :: N = 8 ! Number of planets
    integer :: i ! Iteraction
    real(kind=8), dimension(N) :: x, y, z, vx, vy, vz 

    ! Read data
    do i = 1, N
        read(*,*) x(i), y(i), z(i), vx(i), vy(i), vz(i)
    end do

    write(*,*)
    write(*,*) "Valores anteriores à conversão"
    write(*,*)
    do i = 1, N
        write(*,*) x(i), y(i), z(i), vx(i), vy(i), vz(i)
    end do

    ! Applying convertion
    call invar(N, x, y, z, vx, vy, vz)

    ! Write out new coordinates and velocities.
    write(*,*)
    write(*,*) "Valores posteriores à conversão"
    write(*,*)
    do i = 1, N
        write(*,*) x(i), y(i), z(i), vx(i), vy(i), vz(i)
    end do

contains
  
    subroutine invar(N, x, y, z, vx, vy, vz)
        integer, intent(in) :: N
        real(kind=8), dimension(N), intent(inout) :: x, y, z, vx, vy, vz
        real(kind=8) :: amx, amy, amz
        real(kind=8) :: am, aminc, amcapom
        real(kind=8) :: xp, yp, zp, vxp, vyp, vzp
        
        !Computes angular momentum of the system
        amx = 0.0
        amy = 0.0
        amz = 0.0

        do i = 1, N
            amx = amx + y(i)*vz(i) - z(i)*vy(i)
            amy = amy + z(i)*vx(i) - x(i)*vz(i)
            amz = amz + x(i)*vy(i) - y(i)*vx(i)
        end do

        ! Angular momentum module
        am = dsqrt(amx*amx + amy*amy + amz*amz)

        ! Amgular momentum inclination
        aminc = dacos(amz/am)

        ! Angular momentum long. node
        amcapom = datan2(amx,-amy)

        ! Rotation to the invariable plane
        do i = 1, N
            xp  =  x(i)*dcos(amcapom)+y(i)*dsin(amcapom)
            yp  = -x(i)*dsin(amcapom)+y(i)*dcos(amcapom)
            vxp =  vx(i)*dcos(amcapom)+vy(i)*dsin(amcapom)
            vyp = -vx(i)*dsin(amcapom)+vy(i)*dcos(amcapom)
            x(i) = xp
            y(i) = yp
            vx(i) = vxp
            vy(i) = vyp
            yp  =  y(i)*dcos(aminc)+z(i)*dsin(aminc)
            zp  = -y(i)*dsin(aminc)+z(i)*dcos(aminc)
            vyp =  vy(i)*dcos(aminc)+vz(i)*dsin(aminc)
            vzp = -vy(i)*dsin(aminc)+vz(i)*dcos(aminc)
            y(i) = yp
            z(i) = zp
            vy(i) = vyp
            vz(i) = vzp
        end do
    end subroutine invar
  
end program eclp2inv

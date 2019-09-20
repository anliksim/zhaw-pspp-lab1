  program Montecarlo
  implicit none

  ! -----------------------------------------------Declare
  real*8 :: pi, r, x, y
  integer*4 :: runs, hits, i

  ! -----------------------------------------------Input
  print*, "Enter the number of runs to perform ..."
  read*, runs

  ! -----------------------------------------------Compute
  print*, "Performing ", runs, " runs:"
  hits = 0
  do i = 0, runs
    x = rand(0)
    y = rand(0)
    ! comparing to 1 so no need for sqrt
    r = x**2 + y**2
    if (r .lt. 1) hits = hits + 1 
  enddo

  pi = 4.0 * (real(hits)/runs)

  ! -----------------------------------------------Output
  print*, "Approx of pi = ", pi
  end 

  program Montecarlo
  use omp_lib
  implicit none

  ! -----------------------------------------------Declare
  real*8 :: pi, r, x, y
  integer*4 :: runs, all_hits, hits, tid, i
  integer*4 :: threads = 4

  ! -----------------------------------------------Input
  print*, "Enter the number of runs to perform ..."
  read*, runs

  ! -----------------------------------------------Compute
  !$omp parallel private(hits,tid,i,r,x,y) num_threads(threads)
  tid = omp_get_thread_num()
  print*, tid," Performing ", runs/threads, " runs:"
  hits = 0
  do i = 0, runs/threads
    x = rand(0)
    y = rand(0)
    ! comparing to 1 so no need for sqrt
    r = x**2 + y**2
    if (r .lt. 1) hits = hits + 1 
  enddo

  !$omp critical
  all_hits = all_hits + hits
  !$omp end critical
  !$omp end parallel

  pi = 4.0 * (real(all_hits)/runs)

  ! -----------------------------------------------Output
  print*, "Approx of pi = ", pi
  end 

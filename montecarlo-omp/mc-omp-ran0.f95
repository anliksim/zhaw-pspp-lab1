  program Montecarlo
  use omp_lib
  implicit none

  ! -----------------------------------------------Declare
  real*8 :: pi, r, x, y, ran0
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
    x = ran0(tid)
    y = ran0(tid)
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

  function  ran0(seed)
  ! Park & Miller Random Generator
  integer*4 :: seed,ia,im,iq,ir,mask,k
  real*8 :: ran0,am
  parameter  (ia=16807,im=2147483647,am=1./im,iq=127773,ir=2836,mask=123459876)
  seed=ieor(seed,mask)
  k=seed/iq
  seed=ia*(seed-k*iq)-ir*k
  if  (seed.lt.0)  seed=seed+im
  ran0=am*seed
  seed=ieor(seed,mask)
  return
  end


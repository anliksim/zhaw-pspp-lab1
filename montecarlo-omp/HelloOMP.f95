program helloomp
 use omp_lib
 implicit none

 real :: sum, sum_local, sum_global 
 integer*4 tid,i, num
 integer*4, parameter :: numthreads = 4

 num = 10000000
 sum_global = 0
!$omp parallel private(sum_local,tid,i) num_threads(numthreads)
 tid = omp_get_thread_num()
 print '("hello from thread = ",i2)', tid
 sum_local = 0
 do i = 1, num/numthreads
    sum_local = sum_local + 1
 end do
!$omp critical
 sum_global = sum_global + sum_local
 !$omp end critical
!$omp end parallel
print '("sum_global = ",f10.0)',sum_global
end

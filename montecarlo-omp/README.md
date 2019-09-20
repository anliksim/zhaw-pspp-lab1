# Comparison

The multi-threaded executon of monte carlo takes significatly more time. Most likely the rand(0) function is not thread local and thus blocks.


## Monte Carlo with OMP

`time ./mc-omp.e <<< 4000000`

```
 Enter the number of runs to perform ...
           0  Performing      1000000  runs:
           3  Performing      1000000  runs:
           2  Performing      1000000  runs:
           1  Performing      1000000  runs:
 Approx of pi =    3.1413660049438477     
```
```
real	0m1.646s
user	0m2.364s
sys	0m3.645s
```

## Monte Carlo single thread

`time ./mc.e <<< 4000000`
```
 Enter the number of runs to perform ...
 Performing      4000000  runs:
 Approx of pi =    3.1414759159088135     
```
```
real	0m0.217s
user	0m0.214s
sys	0m0.004s
```

## Monte Carlo with OMP and ran0

`time ./mc-omp-ran0.e <<< 4000000`
```
 Enter the number of runs to perform ...
           0  Performing      1000000  runs:
           3  Performing      1000000  runs:
           1  Performing      1000000  runs:
           2  Performing      1000000  runs:
 Approx of pi =    3.1411058902740479     
```
```
real	0m0.296s
user	0m1.022s
sys	0m0.004s
```

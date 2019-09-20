  program Convert
  implicit none
  ! -----------------------------------------------Declare
  real*4 tempC, tempF, FACTOR
  integer*2 ZERO_SHIFT
  parameter (ZERO_SHIFT = 32, FACTOR = 5./9.)
  ! -----------------------------------------------Input
  print*, "Enter the temperature in Fahrenheit ..."
  read*, tempF
  ! -----------------------------------------------Compute
  tempC = FACTOR * (tempF - ZERO_SHIFT)
  ! -----------------------------------------------Output
  print*, "The corresponding Centigrade temperature is "
  print*, tempC, " degrees."
  end 
# the usage guide
this guide covers the specific inputs and logic used in the `calc.sh` script.

## arthmetic operations

- **addition/subtraction/multiplication**: standard decimal input (e.g., `5.5 + 4`).
- **division**: handled via `bc` with `scale=2`. 
  - *note*: division by zero is trapped and will show an error message. as usual
- **powers**: uses the `^` symbol (e.g., `2 ^ 3 = 8`).

## trigonometry

all trigonometric functions assume the input is in **degrees**. the calculator script internally converts degrees to radians using the formula:

`radians = degrees * (π / 180)`
- **sine (`s`)**: returns values between -1 and 1.
- **cosine (`c`)**: returns values between -1 and 1.
- **tangent**: calculated as `sin(x) / cos(x)`.


## unit conversions
the conversion factors used are:
- **celsius to fahrenheit**: `(C * 9/5) + 32`
- **kilometers to miles**: `KM * 0.621371`
- **kilograms to pounds**: `KG * 2.20462`

## history log
all successful calculations are appended to `calc_history.txt` in the root directory.
Format: `YYYY-MM-DD HH:MM:SS | Operation = Result`

to clear the log, use **Option 5** from the main menu.
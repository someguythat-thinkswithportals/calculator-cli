# a bash CLI calculator
this is a feature-rich, interactive command-line calculator written entirely in **bash**. the tool supports floating-point arithmetic, trigonometry, and unit conversions.

## features
- **basic math**: addition, subtraction, multiplication, division.
- **advanced math**: powers (`^`), square roots (`sqrt`).
- **trigonometry**: sine, cosine, and tangent (input in degrees).
- **unit conversions**: 
  - temperature (celsius ↔ fahrenheit)
  - distance (kilometers ↔ miles)
  - weight (kilograms ↔ pounds)
- **calculation history**: automatically logs your results to `calc_history.txt`.
- **Floating Point**: accurate decimal support with `bc`.
- **Interactive UI**: Colorful menus and error handling for invalid inputs.


## installation

### dependencies 
first things first you need to install bc if you dont have it. to install it in debian/ubuntu just type in the terminal ```sudo apt install bc```. if you use arch linux just type ```sudo pacman -S bc```, if you use other distros just search on how to install bc on your linux distro. next step is easy
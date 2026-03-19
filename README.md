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
- **floating point**: accurate decimal support with `bc`.
- **interactive UI**: colorful menus and error handling for invalid inputs. because why not


## installation

### requirements
first things first you need to install bc. most linux systems have this but if not you need to install it, if you use debian/ubuntu just tpye ```sudo apt install bc``` in the console. if you use fedora type ```sudo dnf install bc``` in the console. and same thing with other linux distros just go to the console and type a command to install bc if you dont have it.

1. **clone the repository**
```bash
git clone https://github.com/someguythat-thinkswithportals/calculator-cli.git

cd calculator-cli
```
2. **make the script executable**
```bash
cd bin
chmod +x calc.sh
```

3. **run it**
```bash
./calc.sh
```
## project structure
* `calc.sh`: the calculator itself
* `calc_history.txt`: stores your past calculations, plus its auto generated
* `.gitignore`: prevents history logs from being pushed from git

and thats it.
# Robot Framework Example

This repository provides an example of [Robot Framework
(RF)](http://robotframework.org/) test suite for Web Application testing using
[Selenium Library](https://github.com/robotframework/SeleniumLibrary) for RF.

As example web application under test the [Conversion
Calculator](http://www.calculator.net/conversion-calculator.html) is used.

For running the test suite you will need:

- [Python 3.6](https://www.python.org/downloads/release/python-362/) – install
  with `pip` (will provide `pip3` binary)

- [Chrome Driver](https://sites.google.com/a/chromium.org/chromedriver/downloads)
  – place `chromedriver.exe` in the same folder as `calculator.robot` file

- Chrome, Chromium or other Chrome–compliant browser – I used [Iron Portable
  (direct link)](http://www.srware.net/downloads/IronPortable.zip), you will
  also need to provide the correct path to the executable in the `config.py`
  file

- and several additional packages for Python, listed in `requirements.txt`
  — install required packages with:

      pip3 install -r requirements.txt

## Files

Short description of files and folders found here:

- README.md – this document you are reading right now
- requirements.txt – PIP packages list for ease of installation
- calculator.robot – the test suite in ROBOT format
- config.py – path to `chrome.exe` for *ChromeDriver* and browser specification
- output - folder with screenshots created by test suite run, report and log
  from the run

## What kind of RF and Selenium features are used?

- Suite Setup/Teardown
- Variables from external file
- User Keywords
- Using Selenium keywords
- Using Text, CSS, XPath and DOM locators
- JavaScript invocation
- Simple step–by–step tests
- Data–driven testing using data table and test template
- Tags

## How to run this thing?

If everything is installed correctly, running the following from `cmd.exe`
console should do the magic:

    robot -d output calculator.robot

Which sould give the following output:

    > robot calculator.robot
    ==============================================================================
    Calculator :: Simple Test Suite for Conversion Calculator
    ==============================================================================
    Check if conversion type switch works                                 | PASS |
    ------------------------------------------------------------------------------
    Convert temperature from Celsius to Kelvin                            | PASS |
    ------------------------------------------------------------------------------
    Check error on minus                                                  | PASS |
    ------------------------------------------------------------------------------
    Check conversion change                                               | PASS |
    ------------------------------------------------------------------------------
    Check all conversion types                                            | PASS |
    ------------------------------------------------------------------------------
    Calculator :: Simple Test Suite for Conversion Calculator             | PASS |
    5 critical tests, 5 passed, 0 failed
    5 tests total, 5 passed, 0 failed
    ==============================================================================
    Output:  d:\tmp\20170922-RobotTest\RobotFrameworkSolution\output\output.xml
    Log:     d:\tmp\20170922-RobotTest\RobotFrameworkSolution\output\log.html
    Report:  d:\tmp\20170922-RobotTest\RobotFrameworkSolution\output\report.html

You can then review what exactly happened by looking into the
[log file](output/log.html).

## Troubleshooting

- if you see *RuntimeWarning* about `robot.run`, don't worry,
  it's a [known issue](https://github.com/robotframework/robotframework/issues/2552)

- if you see *ChromeDriver* whining that `cannot find Chrome binary`,
  double– and even triple–check the path in `config.py` file


*** Settings ***
Documentation           Simple Test Suite for Conversion Calculator
Library                 SeleniumLibrary
Suite Setup             Open Calculator
Suite Teardown          Close All Browsers
Variables               config.py

*** Variables ***
${URL}                  http://www.calculator.net/conversion-calculator.html

*** Test Cases ***
Check if conversion type switch works
    [Tags]  simple
    Click Link                  Temperature
    Element Text Should Be      css=li#menuon a     Temperature
    Capture Page Screenshot

Convert temperature from Celsius to Kelvin
    [Tags]  simple
    Set conversion type to      Temperature
    Set conversion from         Celsius
    Set conversion to           Kelvin
    Input value                 20
    Converted value should be   293.15
    Capture Page Screenshot

Check error on minus
    [Tags]  simple
    Input value                 -
    Converted value should be   Error${SPACE}

Check conversion change
    [Tags]  xpath
    Set conversion type to      Temperature
    Clear conversion input
    Set conversion from         Celsius
    Set conversion to           Kelvin
    Input value                 20
    Converted value should be   293.15
    Select option by subtext    Fahrenheit (
    Converted value should be   68
    Capture Page Screenshot

Check all conversion types
    [Tags]  data-driven
    [Template]      Check conversion
    Length          Centimeter      Meter       10          0.1
    Temperature     Celsius         Fahrenheit  25          77
    Area            Hectare         Acre        10          24.710538147
    Volume          Imperial Pint   Liter       2           1.1365225
    Weight          Carrat          Gram        32          6.4
    Time            Week            Second      1           604800

*** Keywords ***
Open Calculator
    Create WebDriver    ${browser}  desired_capabilities=${desired_capabilities}
    Go To               ${URL}
    # Remove ads
    Execute Javascript  document.getElementById('right').remove()
    Set Window Size     1024  768
    Title Should Be     Conversion Calculator

Input value
    [Arguments]  ${conversionValue}
    Input Text                 fromVal  ${conversionValue}
    Textfield Value Should Be  fromVal  ${conversionValue}
    
Set conversion type to
    [Arguments]  ${conversionType}
    Click Link                               ${conversionType}
    Element Text Should Be  css=li#menuon a  ${conversionType}

Set conversion from
    [Arguments]  ${convertFrom}
    Select From List          calFrom  ${convertFrom}
    List Selection Should Be  calFrom  ${convertFrom}

Set conversion to
    [Arguments]  ${convertTo}
    Select From List          calTo  ${convertTo}
    List Selection Should Be  calTo  ${convertTo}

Clear conversion input
    Input value         ${EMPTY}
    Clear Element Text  fromVal
    Press Key  fromVal  \\8
    Textfield Value Should Be  fromVal  ${EMPTY}
    Textfield Value Should Be  toVal    ${EMPTY}

Converted value should be
    [Arguments]  ${toValue}
    Textfield Value Should Be  toVal  ${toValue}

Check conversion
    [Arguments]  ${type}  ${from}  ${to}  ${value}  ${expectedResult}
    Clear conversion input
    Set conversion type to      ${type}
    Set conversion from         ${from}
    Set conversion to           ${to}
    Input value                 ${value}
    Converted value should be   ${expectedResult}
    Capture Page Screenshot

Select option by subtext
    [Arguments]  ${text}
    Click Element  xpath=//option[starts-with(text(), '${text}')]


*** Keywords ***
Navigate To Register Page sekolahmu
    [Arguments]     ${url}     ${browser}
    Selenium2Library.Open Browser      ${url}     ${browser}
    Maximize Browser Window
    Log To Console          >>Klik Button Daftar
    Selenium2Library. Wait Until Element Is Visible         ${masuk/daftar_element}           timeout=60S
    Selenium2Library.Click Element    ${masuk/daftar_element}
    Log To Console          >> Make sure pop up registration show
    Page Should Contain     Pendaftaran Akun

Navigate To Login Page sekolahmu
    [Arguments]     ${url}     ${browser}
    Selenium2Library.Open Browser      ${url}     ${browser}
    Maximize Browser Window
    Log To Console          >>Klik Button Daftar/Masuk
    Selenium2Library. Wait Until Element Is Visible         ${masuk/daftar_element}           timeout=60S
    Selenium2Library.Click Element    ${masuk/daftar_element}
    Sleep       3s
    Log To Console          >>klik button masuk disini
    Selenium2Library. Wait Until Element Is Visible         ${masukdisini_element}           timeout=60S
    Selenium2Library.Click Element    ${masukdisini_element}
    Sleep       3s
    Log To Console          >> Make sure landed login form
    Page Should Contain     Temukan cara belajar jarak jauh yang menyenangkan

Select A Single Value From Dropdown
    [Arguments]     ${selector}     ${selectedValue}
    Selenium2Library. Wait Until Element Is Visible     ${selector}       timeout=60S
    Selenium2Library.Click Element      ${selector}
    Sleep       5s
    Mouse Down          //option[text()='${selectedValue}']
    Selenium2Library.Click Element       //option[text()='${selectedValue}']
    #Selenium2Library.Press Key    //option[text()='${selectedValue}']    \\13

Random Email
    Log    >>> random email
    ### generate fakers
    ${fake_name}=    FakerLibrary.First Name
    ${fake_name_lower}=    Convert To Lowercase    ${fake_name}
    ${randomNumber}=    FakerLibrary.Numerify    text=###
    ### generate dummy email
    ${email_suffix}=    Set Variable    @gmail.com
    ${email}=    Catenate    ${fake_name_lower}${randomNumber}${email_suffix}
    Return From Keyword    ${email}

Random Nomer Ponsel
    Log    >>> random no Ponsel
    ${prefix}=    Set Variable    +62812
    ${random}=    FakerLibrary.Numerify    text=########
    Log    random: ${random}
    ${noponsel}=    Catenate    ${prefix}${random}
    Return From Keyword    ${noponsel}

Random Nama Lengkap
    Log    >>> Random Nama Lengkap
    ${fisrtname}      FakerLibrary.First Name
    ${firstnamelower}       Convert To Lowercase    ${fisrtname}
    ${lastname}       FakerLibrary.Last Name
    ${lastnamelower}       Convert To Lowercase    ${lastname}
    ${fullname}=        Catenate    ${fisrtname} ${lastname}
    Return From Keyword    ${fullname}
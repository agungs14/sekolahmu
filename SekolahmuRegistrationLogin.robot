*** Settings ***
Library           Selenium2Library
Library           HttpLibrary.HTTP
Library           RequestsLibrary
Library           FakerLibrary
Library           String
Resource                  Sekolahmu/sekolahmu_xpath_registerlogin.robot
Resource                  Sekolahmu/sekolahmu-keyword.robot

*** Variable ***
${url_sekolahmu}            https://www.sekolah.mu/
${profilpengguna}=           Murid
${password}=        Young123

*** Test Cases ***
Registration Sekolahmu
    ${email}=       Random Email
    ${noponsel}=     Random Nomer Ponsel
    ${fullname}=     Random Nama Lengkap
    #Set Global Variable ${email} for use any testcase
    Set Global Variable     ${email}
    Log To Console          >>open website ${url_sekolahmu}
    Navigate To Register Page sekolahmu         ${url_sekolahmu}        Chrome
    Log To Console          >>registration with email=${email} | nomer ponsel=${noponsel}
    Log To Console          >>fill form registration
    Log To Console          >>pilih profil pengguna
    Select A Single Value From Dropdown        ${pilihprofilpengguna_dropdown}      ${profilpengguna}
    Run Keyword If    '${profilpengguna}'=='Murid'    Select A Single Value From Dropdown       ${jenjangusia_dropdown}      Kelas 11 (16-17 tahun)     ##This Keyword run if value ${profilpengguna}=Murid
    Selenium2Library. Wait Until Element Is Visible        ${email_input}      timeout=60S
    Selenium2Library. Input text        ${email_input}         ${email}
    Log To Console      >>Success Input email
    Selenium2Library. Input text        ${namalengkap_input}       ${fullname}
    Log To Console      >>Success Input fullname
    Selenium2Library. Input text        ${noponsel_input}       ${noponsel}
    Log To Console      >>Success Input phone
    Selenium2Library. Input text        ${password_input}       ${password}
    Log To Console      >>Success Input Password
    Selenium2Library. Wait Until Element Is Visible     ${aggrecheckbox_radio}       timeout=60S
    Selenium2Library.Click Element      ${aggrecheckbox_radio}
    Log To Console      >> Success klik checkbox "Saya menyetujui Ketentuan & Kebijakan Privasi"
    Log To Console      >> Click Button "Daftar Sekarang"
    Selenium2Library.Element Should Be Enabled          ${daftarsekarang_button}
    Selenium2Library.Click Element              ${daftarsekarang_button}
    Log To Console      >>Success Register
    Sleep       5s
    Close Browser

Login Sekolahmu
    Log To Console          >>open website ${url_sekolahmu}
    Navigate To Login Page sekolahmu        ${url_sekolahmu}        Chrome
    Log To Console          >>login with email has registered: ${email}
    Log To Console          >>Fill Form Login
    Selenium2Library. Wait Until Element Is Visible        ${email_input}      timeout=60S
    Selenium2Library. Input text        ${email_input}         ${email}
    Log To Console          >>success Input Email: ${email}
    Selenium2Library. Input text        ${password_input}       ${password}
    Log To Console          >>success Input: ${password}
    Log To Console          >>Click button "masuk"
    Selenium2Library.Element Should Be Enabled          ${masuk_button}
    Selenium2Library.Click Element              ${masuk_button}
    Log To Console      >>Success Login
    Sleep   5s
    Close Browser


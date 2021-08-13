*** Variable ***
#xpath_homepage
${masuk/daftar_element}             //span[text()=' Masuk | Daftar ']
${masukdisini_element}              //span[text()='Masuk di sini']
#xpath form register & Login
${pilihprofilpengguna_dropdown}     //*[@id="modal-register"]/form/select[1]
${jenjangusia_dropdown}             //*[@id="modal-register"]/form/select[2]
${email_input}                      //input[contains(@type, 'email')]
${namalengkap_input}                //input[contains(@name, 'full-name')]
${noponsel_input}                   //input[contains(@name, 'phone')]
${password_input}                   //input[contains(@type, 'password')]
${aggrecheckbox_radio}              //input[contains(@type, 'checkbox')]
${daftarsekarang_button}            //button[text()='Daftar Sekarang']
${masuk_button}                     //button[text()='Masuk']
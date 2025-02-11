-- Created on 31.07.22 by GABOSU 
declare 
  -- Local variables here
  l_json_languages CLOB := '[ { "code": "aa", "name": "Afar" }, { "code": "ab", "name": "Abkhazian" }, { "code": "ae", "name": "Avestan" }, { "code": "af", "name": "Afrikaans" }, { "code": "ak", "name": "Akan" }, { "code": "am", "name": "Amharic" }, { "code": "an", "name": "Aragonese" }, { "code": "ar", "name": "Arabic" }, { "code": "as", "name": "Assamese" }, { "code": "av", "name": "Avaric" }, { "code": "ay", "name": "Aymara" }, { "code": "az", "name": "Azerbaijani" }, { "code": "ba", "name": "Bashkir" }, { "code": "be", "name": "Belarusian" }, { "code": "bg", "name": "Bulgarian" }, { "code": "bh", "name": "Bihari languages" }, { "code": "bi", "name": "Bislama" }, { "code": "bm", "name": "Bambara" }, { "code": "bn", "name": "Bengali" }, { "code": "bo", "name": "Tibetan" }, { "code": "br", "name": "Breton" }, { "code": "bs", "name": "Bosnian" }, { "code": "ca", "name": "Catalan; Valencian" }, { "code": "ce", "name": "Chechen" }, { "code": "ch", "name": "Chamorro" }, { "code": "co", "name": "Corsican" }, { "code": "cr", "name": "Cree" }, { "code": "cs", "name": "Czech" }, { "code": "cu", "name": "Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic" }, { "code": "cv", "name": "Chuvash" }, { "code": "cy", "name": "Welsh" }, { "code": "da", "name": "Danish" }, { "code": "de", "name": "German" }, { "code": "dv", "name": "Divehi; Dhivehi; Maldivian" }, { "code": "dz", "name": "Dzongkha" }, { "code": "ee", "name": "Ewe" }, { "code": "el", "name": "Greek, Modern (1453-)" }, { "code": "en", "name": "English" }, { "code": "eo", "name": "Esperanto" }, { "code": "es", "name": "Spanish; Castilian" }, { "code": "et", "name": "Estonian" }, { "code": "eu", "name": "Basque" }, { "code": "fa", "name": "Persian" }, { "code": "ff", "name": "Fulah" }, { "code": "fi", "name": "Finnish" }, { "code": "fj", "name": "Fijian" }, { "code": "fo", "name": "Faroese" }, { "code": "fr", "name": "French" }, { "code": "fy", "name": "Western Frisian" }, { "code": "ga", "name": "Irish" }, { "code": "gd", "name": "Gaelic; Scomttish Gaelic" }, { "code": "gl", "name": "Galician" }, { "code": "gn", "name": "Guarani" }, { "code": "gu", "name": "Gujarati" }, { "code": "gv", "name": "Manx" }, { "code": "ha", "name": "Hausa" }, { "code": "he", "name": "Hebrew" }, { "code": "hi", "name": "Hindi" }, { "code": "ho", "name": "Hiri Motu" }, { "code": "hr", "name": "Croatian" }, { "code": "ht", "name": "Haitian; Haitian Creole" }, { "code": "hu", "name": "Hungarian" }, { "code": "hy", "name": "Armenian" }, { "code": "hz", "name": "Herero" }, { "code": "ia", "name": "Interlingua (International Auxiliary Language Association)" }, { "code": "id", "name": "Indonesian" }, { "code": "ie", "name": "Interlingue; Occidental" }, { "code": "ig", "name": "Igbo" }, { "code": "ii", "name": "Sichuan Yi; Nuosu" }, { "code": "ik", "name": "Inupiaq" }, { "code": "io", "name": "Ido" }, { "code": "is", "name": "Icelandic" }, { "code": "it", "name": "Italian" }, { "code": "iu", "name": "Inuktitut" }, { "code": "ja", "name": "Japanese" }, { "code": "jv", "name": "Javanese" }, { "code": "ka", "name": "Georgian" }, { "code": "kg", "name": "Kongo" }, { "code": "ki", "name": "Kikuyu; Gikuyu" }, { "code": "kj", "name": "Kuanyama; Kwanyama" }, { "code": "kk", "name": "Kazakh" }, { "code": "kl", "name": "Kalaallisut; Greenlandic" }, { "code": "km", "name": "Central Khmer" }, { "code": "kn", "name": "Kannada" }, { "code": "ko", "name": "Korean" }, { "code": "kr", "name": "Kanuri" }, { "code": "ks", "name": "Kashmiri" }, { "code": "ku", "name": "Kurdish" }, { "code": "kv", "name": "Komi" }, { "code": "kw", "name": "Cornish" }, { "code": "ky", "name": "Kirghiz; Kyrgyz" }, { "code": "la", "name": "Latin" }, { "code": "lb", "name": "Luxembourgish; Letzeburgesch" }, { "code": "lg", "name": "Ganda" }, { "code": "li", "name": "Limburgan; Limburger; Limburgish" }, { "code": "ln", "name": "Lingala" }, { "code": "lo", "name": "Lao" }, { "code": "lt", "name": "Lithuanian" }, { "code": "lu", "name": "Luba-Katanga" }, { "code": "lv", "name": "Latvian" }, { "code": "mg", "name": "Malagasy" }, { "code": "mh", "name": "Marshallese" }, { "code": "mi", "name": "Maori" }, { "code": "mk", "name": "Macedonian" }, { "code": "ml", "name": "Malayalam" }, { "code": "mn", "name": "Mongolian" }, { "code": "mr", "name": "Marathi" }, { "code": "ms", "name": "Malay" }, { "code": "mt", "name": "Maltese" }, { "code": "my", "name": "Burmese" }, { "code": "na", "name": "Nauru" }, { "code": "nb", "name": "Bokmål, Norwegian; Norwegian Bokmål" }, { "code": "nd", "name": "Ndebele, North; North Ndebele" }, { "code": "ne", "name": "Nepali" }, { "code": "ng", "name": "Ndonga" }, { "code": "nl", "name": "Dutch; Flemish" }, { "code": "nn", "name": "Norwegian Nynorsk; Nynorsk, Norwegian" }, { "code": "no", "name": "Norwegian" }, { "code": "nr", "name": "Ndebele, South; South Ndebele" }, { "code": "nv", "name": "Navajo; Navaho" }, { "code": "ny", "name": "Chichewa; Chewa; Nyanja" }, { "code": "oc", "name": "Occitan (post 1500)" }, { "code": "oj", "name": "Ojibwa" }, { "code": "om", "name": "Oromo" }, { "code": "or", "name": "Oriya" }, { "code": "os", "name": "Ossetian; Ossetic" }, { "code": "pa", "name": "Panjabi; Punjabi" }, { "code": "pi", "name": "Pali" }, { "code": "pl", "name": "Polish" }, { "code": "ps", "name": "Pushto; Pashto" }, { "code": "pt", "name": "Portuguese" }, { "code": "qu", "name": "Quechua" }, { "code": "rm", "name": "Romansh" }, { "code": "rn", "name": "Rundi" }, { "code": "ro", "name": "Romanian; Moldavian; Moldovan" }, { "code": "ru", "name": "Russian" }, { "code": "rw", "name": "Kinyarwanda" }, { "code": "sa", "name": "Sanskrit" }, { "code": "sc", "name": "Sardinian" }, { "code": "sd", "name": "Sindhi" }, { "code": "se", "name": "Northern Sami" }, { "code": "sg", "name": "Sango" }, { "code": "si", "name": "Sinhala; Sinhalese" }, { "code": "sk", "name": "Slovak" }, { "code": "sl", "name": "Slovenian" }, { "code": "sm", "name": "Samoan" }, { "code": "sn", "name": "Shona" }, { "code": "so", "name": "Somali" }, { "code": "sq", "name": "Albanian" }, { "code": "sr", "name": "Serbian" }, { "code": "ss", "name": "Swati" }, { "code": "st", "name": "Sotho, Southern" }, { "code": "su", "name": "Sundanese" }, { "code": "sv", "name": "Swedish" }, { "code": "sw", "name": "Swahili" }, { "code": "ta", "name": "Tamil" }, { "code": "te", "name": "Telugu" }, { "code": "tg", "name": "Tajik" }, { "code": "th", "name": "Thai" }, { "code": "ti", "name": "Tigrinya" }, { "code": "tk", "name": "Turkmen" }, { "code": "tl", "name": "Tagalog" }, { "code": "tn", "name": "Tswana" }, { "code": "to", "name": "Tonga (Tonga Islands)" }, { "code": "tr", "name": "Turkish" }, { "code": "ts", "name": "Tsonga" }, { "code": "tt", "name": "Tatar" }, { "code": "tw", "name": "Twi" }, { "code": "ty", "name": "Tahitian" }, { "code": "ug", "name": "Uighur; Uyghur" }, { "code": "uk", "name": "Ukrainian" }, { "code": "ur", "name": "Urdu" }, { "code": "uz", "name": "Uzbek" }, { "code": "ve", "name": "Venda" }, { "code": "vi", "name": "Vietnamese" }, { "code": "vo", "name": "Volapük" }, { "code": "wa", "name": "Walloon" }, { "code": "wo", "name": "Wolof" }, { "code": "xh", "name": "Xhosa" }, { "code": "yi", "name": "Yiddish" }, { "code": "yo", "name": "Yoruba" }, { "code": "za", "name": "Zhuang; Chuang" }, { "code": "zh", "name": "Chinese" }, { "code": "zu", "name": "Zulu" } ]';
  l_json_contries  CLOB := '[ {"name": "Afghanistan", "code": "AF"}, {"name": "Aland Islands", "code": "AX"}, {"name": "Albania", "code": "AL"}, {"name": "Algeria", "code": "DZ"}, {"name": "American Samoa", "code": "AS"}, {"name": "AndorrA", "code": "AD"}, {"name": "Angola", "code": "AO"}, {"name": "Anguilla", "code": "AI"}, {"name": "Antarctica", "code": "AQ"}, {"name": "Antigua and Barbuda", "code": "AG"}, {"name": "Argentina", "code": "AR"}, {"name": "Armenia", "code": "AM"}, {"name": "Aruba", "code": "AW"}, {"name": "Australia", "code": "AU"}, {"name": "Austria", "code": "AT"}, {"name": "Azerbaijan", "code": "AZ"}, {"name": "Bahamas", "code": "BS"}, {"name": "Bahrain", "code": "BH"}, {"name": "Bangladesh", "code": "BD"}, {"name": "Barbados", "code": "BB"}, {"name": "Belarus", "code": "BY"}, {"name": "Belgium", "code": "BE"}, {"name": "Belize", "code": "BZ"}, {"name": "Benin", "code": "BJ"}, {"name": "Bermuda", "code": "BM"}, {"name": "Bhutan", "code": "BT"}, {"name": "Bolivia", "code": "BO"}, {"name": "Bosnia and Herzegovina", "code": "BA"}, {"name": "Botswana", "code": "BW"}, {"name": "Bouvet Island", "code": "BV"}, {"name": "Brazil", "code": "BR"}, {"name": "British Indian Ocean Territory", "code": "IO"}, {"name": "Brunei Darussalam", "code": "BN"}, {"name": "Bulgaria", "code": "BG"}, {"name": "Burkina Faso", "code": "BF"}, {"name": "Burundi", "code": "BI"}, {"name": "Cambodia", "code": "KH"}, {"name": "Cameroon", "code": "CM"}, {"name": "Canada", "code": "CA"}, {"name": "Cape Verde", "code": "CV"}, {"name": "Cayman Islands", "code": "KY"}, {"name": "Central African Republic", "code": "CF"}, {"name": "Chad", "code": "TD"}, {"name": "Chile", "code": "CL"}, {"name": "China", "code": "CN"}, {"name": "Christmas Island", "code": "CX"}, {"name": "Cocos (Keeling) Islands", "code": "CC"}, {"name": "Colombia", "code": "CO"}, {"name": "Comoros", "code": "KM"}, {"name": "Congo", "code": "CG"}, {"name": "Congo, The Democratic Republic of the", "code": "CD"}, {"name": "Cook Islands", "code": "CK"}, {"name": "Costa Rica", "code": "CR"}, {"name": "Cote DIvoire", "code": "CI"}, {"name": "Croatia", "code": "HR"}, {"name": "Cuba", "code": "CU"}, {"name": "Cyprus", "code": "CY"}, {"name": "Czech Republic", "code": "CZ"}, {"name": "Denmark", "code": "DK"}, {"name": "Djibouti", "code": "DJ"}, {"name": "Dominica", "code": "DM"}, {"name": "Dominican Republic", "code": "DO"}, {"name": "Ecuador", "code": "EC"}, {"name": "Egypt", "code": "EG"}, {"name": "El Salvador", "code": "SV"}, {"name": "Equatorial Guinea", "code": "GQ"}, {"name": "Eritrea", "code": "ER"}, {"name": "Estonia", "code": "EE"}, {"name": "Ethiopia", "code": "ET"}, {"name": "Falkland Islands (Malvinas)", "code": "FK"}, {"name": "Faroe Islands", "code": "FO"}, {"name": "Fiji", "code": "FJ"}, {"name": "Finland", "code": "FI"}, {"name": "France", "code": "FR"}, {"name": "French Guiana", "code": "GF"}, {"name": "French Polynesia", "code": "PF"}, {"name": "French Southern Territories", "code": "TF"}, {"name": "Gabon", "code": "GA"}, {"name": "Gambia", "code": "GM"}, {"name": "Georgia", "code": "GE"}, {"name": "Germany", "code": "DE"}, {"name": "Ghana", "code": "GH"}, {"name": "Gibraltar", "code": "GI"}, {"name": "Greece", "code": "GR"}, {"name": "Greenland", "code": "GL"}, {"name": "Grenada", "code": "GD"}, {"name": "Guadeloupe", "code": "GP"}, {"name": "Guam", "code": "GU"}, {"name": "Guatemala", "code": "GT"}, {"name": "Guernsey", "code": "GG"}, {"name": "Guinea", "code": "GN"}, {"name": "Guinea-Bissau", "code": "GW"}, {"name": "Guyana", "code": "GY"}, {"name": "Haiti", "code": "HT"}, {"name": "Heard Island and Mcdonald Islands", "code": "HM"}, {"name": "Holy See (Vatican City State)", "code": "VA"}, {"name": "Honduras", "code": "HN"}, {"name": "Hong Kong", "code": "HK"}, {"name": "Hungary", "code": "HU"}, {"name": "Iceland", "code": "IS"}, {"name": "India", "code": "IN"}, {"name": "Indonesia", "code": "ID"}, {"name": "Iran, Islamic Republic Of", "code": "IR"}, {"name": "Iraq", "code": "IQ"}, {"name": "Ireland", "code": "IE"}, {"name": "Isle of Man", "code": "IM"}, {"name": "Israel", "code": "IL"}, {"name": "Italy", "code": "IT"}, {"name": "Jamaica", "code": "JM"}, {"name": "Japan", "code": "JP"}, {"name": "Jersey", "code": "JE"}, {"name": "Jordan", "code": "JO"}, {"name": "Kazakhstan", "code": "KZ"}, {"name": "Kenya", "code": "KE"}, {"name": "Kiribati", "code": "KI"}, {"name": "Korea, Democratic PeopleS Republic of", "code": "KP"}, {"name": "Korea, Republic of", "code": "KR"}, {"name": "Kuwait", "code": "KW"}, {"name": "Kyrgyzstan", "code": "KG"}, {"name": "Lao PeopleS Democratic Republic", "code": "LA"}, {"name": "Latvia", "code": "LV"}, {"name": "Lebanon", "code": "LB"}, {"name": "Lesotho", "code": "LS"}, {"name": "Liberia", "code": "LR"}, {"name": "Libyan Arab Jamahiriya", "code": "LY"}, {"name": "Liechtenstein", "code": "LI"}, {"name": "Lithuania", "code": "LT"}, {"name": "Luxembourg", "code": "LU"}, {"name": "Macao", "code": "MO"}, {"name": "Macedonia, The Former Yugoslav Republic of", "code": "MK"}, {"name": "Madagascar", "code": "MG"}, {"name": "Malawi", "code": "MW"}, {"name": "Malaysia", "code": "MY"}, {"name": "Maldives", "code": "MV"}, {"name": "Mali", "code": "ML"}, {"name": "Malta", "code": "MT"}, {"name": "Marshall Islands", "code": "MH"}, {"name": "Martinique", "code": "MQ"}, {"name": "Mauritania", "code": "MR"}, {"name": "Mauritius", "code": "MU"}, {"name": "Mayotte", "code": "YT"}, {"name": "Mexico", "code": "MX"}, {"name": "Micronesia, Federated States of", "code": "FM"}, {"name": "Moldova, Republic of", "code": "MD"}, {"name": "Monaco", "code": "MC"}, {"name": "Mongolia", "code": "MN"}, {"name": "Montserrat", "code": "MS"}, {"name": "Morocco", "code": "MA"}, {"name": "Mozambique", "code": "MZ"}, {"name": "Myanmar", "code": "MM"}, {"name": "Namibia", "code": "NA"}, {"name": "Nauru", "code": "NR"}, {"name": "Nepal", "code": "NP"}, {"name": "Netherlands", "code": "NL"}, {"name": "Netherlands Antilles", "code": "AN"}, {"name": "New Caledonia", "code": "NC"}, {"name": "New Zealand", "code": "NZ"}, {"name": "Nicaragua", "code": "NI"}, {"name": "Niger", "code": "NE"}, {"name": "Nigeria", "code": "NG"}, {"name": "Niue", "code": "NU"}, {"name": "Norfolk Island", "code": "NF"}, {"name": "Northern Mariana Islands", "code": "MP"}, {"name": "Norway", "code": "NO"}, {"name": "Oman", "code": "OM"}, {"name": "Pakistan", "code": "PK"}, {"name": "Palau", "code": "PW"}, {"name": "Palestinian Territory, Occupied", "code": "PS"}, {"name": "Panama", "code": "PA"}, {"name": "Papua New Guinea", "code": "PG"}, {"name": "Paraguay", "code": "PY"}, {"name": "Peru", "code": "PE"}, {"name": "Philippines", "code": "PH"}, {"name": "Pitcairn", "code": "PN"}, {"name": "Poland", "code": "PL"}, {"name": "Portugal", "code": "PT"}, {"name": "Puerto Rico", "code": "PR"}, {"name": "Qatar", "code": "QA"}, {"name": "Reunion", "code": "RE"}, {"name": "Romania", "code": "RO"}, {"name": "Russian Federation", "code": "RU"}, {"name": "RWANDA", "code": "RW"}, {"name": "Saint Helena", "code": "SH"}, {"name": "Saint Kitts and Nevis", "code": "KN"}, {"name": "Saint Lucia", "code": "LC"}, {"name": "Saint Pierre and Miquelon", "code": "PM"}, {"name": "Saint Vincent and the Grenadines", "code": "VC"}, {"name": "Samoa", "code": "WS"}, {"name": "San Marino", "code": "SM"}, {"name": "Sao Tome and Principe", "code": "ST"}, {"name": "Saudi Arabia", "code": "SA"}, {"name": "Senegal", "code": "SN"}, {"name": "Serbia and Montenegro", "code": "CS"}, {"name": "Seychelles", "code": "SC"}, {"name": "Sierra Leone", "code": "SL"}, {"name": "Singapore", "code": "SG"}, {"name": "Slovakia", "code": "SK"}, {"name": "Slovenia", "code": "SI"}, {"name": "Solomon Islands", "code": "SB"}, {"name": "Somalia", "code": "SO"}, {"name": "South Africa", "code": "ZA"}, {"name": "South Georgia and the South Sandwich Islands", "code": "GS"}, {"name": "Spain", "code": "ES"}, {"name": "Sri Lanka", "code": "LK"}, {"name": "Sudan", "code": "SD"}, {"name": "Suriname", "code": "SR"}, {"name": "Svalbard and Jan Mayen", "code": "SJ"}, {"name": "Swaziland", "code": "SZ"}, {"name": "Sweden", "code": "SE"}, {"name": "Switzerland", "code": "CH"}, {"name": "Syrian Arab Republic", "code": "SY"}, {"name": "Taiwan, Province of China", "code": "TW"}, {"name": "Tajikistan", "code": "TJ"}, {"name": "Tanzania, United Republic of", "code": "TZ"}, {"name": "Thailand", "code": "TH"}, {"name": "Timor-Leste", "code": "TL"}, {"name": "Togo", "code": "TG"}, {"name": "Tokelau", "code": "TK"}, {"name": "Tonga", "code": "TO"}, {"name": "Trinidad and Tobago", "code": "TT"}, {"name": "Tunisia", "code": "TN"}, {"name": "Turkey", "code": "TR"}, {"name": "Turkmenistan", "code": "TM"}, {"name": "Turks and Caicos Islands", "code": "TC"}, {"name": "Tuvalu", "code": "TV"}, {"name": "Uganda", "code": "UG"}, {"name": "Ukraine", "code": "UA"}, {"name": "United Arab Emirates", "code": "AE"}, {"name": "United Kingdom", "code": "GB"}, {"name": "United States", "code": "US"}, {"name": "United States Minor Outlying Islands", "code": "UM"}, {"name": "Uruguay", "code": "UY"}, {"name": "Uzbekistan", "code": "UZ"}, {"name": "Vanuatu", "code": "VU"}, {"name": "Venezuela", "code": "VE"}, {"name": "Viet Nam", "code": "VN"}, {"name": "Virgin Islands, British", "code": "VG"}, {"name": "Virgin Islands, U.S.", "code": "VI"}, {"name": "Wallis and Futuna", "code": "WF"}, {"name": "Western Sahara", "code": "EH"}, {"name": "Yemen", "code": "YE"}, {"name": "Zambia", "code": "ZM"}, {"name": "Zimbabwe", "code": "ZW"} ]';
  l_amount number;
  l_index number;
begin
  delete invoice_payment;
  commit;
  delete invoice_line;
  commit;
  delete invoice;
  commit;
  delete cart_line;
  commit;
  delete cart;
  commit;
  delete book_review;
  commit;
  delete book_price;
  commit;
  delete book_inventory;
  commit;
  delete book_tl;
  commit;
  delete book;
  commit;
  delete book_category_tl;
  commit;
  delete book_category;
  commit;
  delete customer_payment;
  commit;
  delete customer_address;
  commit;
  delete customer;
  commit;
  delete language;
  commit;
  delete COUNTRY;
  commit;
  
  -----------------------------------------------------------------------------
  INSERT INTO LANGUAGE(LANGUAGE_CODE, NAME)
  SELECT code, name FROM json_table(l_json_languages, '$[*]' COLUMNS (CODE PATH '$.code', NAME PATH '$.name'));
  COMMIT;
  -----------------------------------------------------------------------------
  INSERT INTO COUNTRY(COUNTRY_CODE, NAME)
  SELECT code, name FROM json_table(l_json_contries, '$[*]' COLUMNS (CODE PATH '$.code', NAME PATH '$.name'));
  COMMIT;
  -----------------------------------------------------------------------------
  insert into customer(
    first_name,
    last_name,
    email,
    password,
    phone,
    age,
    gender,
    language_id)
  select 
    initcap(generate_data_pkg.get_string(p_string_min => 6, p_string_max => 12)),
    initcap(generate_data_pkg.get_string(p_string_min => 6, p_string_max => 12)),
    generate_data_pkg.get_email,
    dbms_crypto.hash(utl_i18n.string_to_raw(generate_data_pkg.get_string(p_string_min => 6, p_string_max => 12), 'AL32UTF8'), dbms_crypto.HASH_SH256),
    generate_data_pkg.get_number(p_value_min => 2120000000, p_value_max => 9120000000),
    generate_data_pkg.get_number(p_value_min => 18, p_value_max => 80),
    generate_data_pkg.get_lov('M;F'),
    generate_data_pkg.get_fk(p_table => 'language', p_column => 'language_id')
  from dual
  connect by level <=1000;
  commit;
  
  generate_data_pkg.set_nulls(p_table => 'customer', p_nulls_percent => 10);
  commit;
  -----------------------------------------------------------------------------
  insert into customer_address(
    address1,
    address2,
    city,
    postal_code,
    country_id,
    phone,
    customer_id)
  select
    initcap(generate_data_pkg.get_words(p_string_min => 10, p_string_max => 30, p_word_min => 5, p_word_max => 10)),
    initcap(generate_data_pkg.get_words(p_string_min => 10, p_string_max => 30, p_word_min => 5, p_word_max => 10)),
    initcap(generate_data_pkg.get_string(p_string_min => 6, p_string_max => 12)),
    lpad(generate_data_pkg.get_number(p_value_min => 1, p_value_max => 99950), 5, '0'),
    generate_data_pkg.get_fk(p_table => 'country', p_column => 'country_id'),
    generate_data_pkg.get_number(p_value_min => 2120000000, p_value_max => 9120000000),
    generate_data_pkg.get_fk(p_table => 'customer', p_column => 'customer_id')
  from dual
  connect by level <=2000;
  commit;
  
  generate_data_pkg.set_nulls(p_table => 'customer_address', p_nulls_percent => 20);
  commit;
  -----------------------------------------------------------------------------
  insert into customer_payment (
    payment_type,
    provider,
    account_number,
    valid_to,
    customer_id)
  select
    generate_data_pkg.get_lov('Credit Card;Wire Transfer'),
    initcap(generate_data_pkg.get_string(p_string_min => 6, p_string_max => 12)),
    generate_data_pkg.get_number(p_value_min => 1000000000000000, p_value_max => 9000000000000000),
    generate_data_pkg.get_date(p_value_min => sysdate-90, p_value_max => sysdate+365*5),
    generate_data_pkg.get_fk(p_table => 'customer', p_column => 'customer_id')
  from dual
  connect by level <=2000;
  commit;
  
  generate_data_pkg.set_nulls(p_table => 'customer_payment', p_nulls_percent => 20);
  commit;
  -----------------------------------------------------------------------------
  insert into book_category(
    name,
    description)
  select
    initcap(generate_data_pkg.get_words(p_string_min => 10, p_string_max => 30, p_word_min => 5, p_word_max => 10)),
    initcap(generate_data_pkg.get_words(p_string_min => 30, p_string_max => 250, p_word_min => 5, p_word_max => 10))
  from dual
  connect by level <=30;
  commit;
  
  generate_data_pkg.set_nulls(p_table => 'book_category', p_nulls_percent => 20);
  commit;
  -----------------------------------------------------------------------------
  --book_category_tl
  l_index := 0;
  while l_index < 1000
  loop
    begin  
      insert into book_category_tl(
        name,
        description,
        language_id,
        book_category_id)
      values(
        initcap(generate_data_pkg.get_words(p_string_min => 10, p_string_max => 30, p_word_min => 5, p_word_max => 10)),
        initcap(generate_data_pkg.get_words(p_string_min => 30, p_string_max => 250, p_word_min => 5, p_word_max => 10)),
        generate_data_pkg.get_fk(p_table => 'language', p_column => 'language_id'),
        generate_data_pkg.get_fk(p_table => 'book_category', p_column => 'book_category_id'));
      l_index := l_index + 1;
    exception
      when DUP_VAL_ON_INDEX then continue;
      when OTHERS then raise;
      
    end;  
  end loop;
  commit;
  
  generate_data_pkg.set_nulls(p_table => 'book_category_tl', p_nulls_percent => 40);
  commit;
  -----------------------------------------------------------------------------
  insert into book(title,
                   description,
                   isbn,
                   author,
                   picture,
                   book_category_id)
  select
    initcap(generate_data_pkg.get_words(p_string_min => 10, p_string_max => 30, p_word_min => 5, p_word_max => 10)),
    initcap(generate_data_pkg.get_words(p_string_min => 30, p_string_max => 250, p_word_min => 5, p_word_max => 10)),
    generate_data_pkg.get_number(p_value_min => 1000000000000, p_value_max => 9999999999999),
    initcap(generate_data_pkg.get_string(p_string_min => 5, p_string_max => 10))||' '||initcap(generate_data_pkg.get_string(p_string_min => 5, p_string_max => 10)),
    generate_data_pkg.get_url||'.jpg',
    generate_data_pkg.get_fk(p_table => 'book_category', p_column => 'book_category_id')
  from dual
  connect by level <=1000;
  commit;
  
  generate_data_pkg.set_nulls(p_table => 'book', p_nulls_percent => 30);
  commit;
  -----------------------------------------------------------------------------
  --book_tl
  l_index := 0;
  while l_index < 5000
  loop
    begin  
      insert into book_tl(
                      title,
                      description,
                      language_id,
                      book_id)
      values(
        initcap(generate_data_pkg.get_words(p_string_min => 10, p_string_max => 30, p_word_min => 5, p_word_max => 10)),
        initcap(generate_data_pkg.get_words(p_string_min => 30, p_string_max => 250, p_word_min => 5, p_word_max => 10)),
        generate_data_pkg.get_fk(p_table => 'language', p_column => 'language_id'),
        generate_data_pkg.get_fk(p_table => 'book', p_column => 'book_id'));
      l_index := l_index + 1;
    exception
      when DUP_VAL_ON_INDEX then continue;
      when OTHERS then raise;
      
    end;  
  end loop;
  commit;
  
  generate_data_pkg.set_nulls(p_table => 'book_tl', p_nulls_percent => 30);
  commit;
  -----------------------------------------------------------------------------
  --book_inventory
  for rec in (select * from book)
  loop
    insert into book_inventory(
      quantity,
      book_id)
    values(
      generate_data_pkg.get_number(p_value_min => 0, p_value_max => 1000),
      rec.book_id);
  end loop;
  commit;
  -----------------------------------------------------------------------------
  --book_price
  for rec in (select * from book)
  loop
    insert into book_price(price,
                           valid_from,
                           valid_to,
                           book_id)
    values(
      generate_data_pkg.get_number(p_value_min => 10, p_value_max => 100, p_decimals => 2),
      generate_data_pkg.get_date(p_value_min => sysdate-90, p_value_max => sysdate-1),
      generate_data_pkg.get_date(p_value_min => sysdate+365*1, p_value_max => sysdate+365*3),
      rec.book_id);
  end loop;
  commit;
  -----------------------------------------------------------------------------
  insert into book_review(review,
                          rating,
                          book_id,
                          customer_id)
  select
    generate_data_pkg.get_words(p_string_min => 30, p_string_max => 300, p_word_min => 5, p_word_max => 20, p_char_type => 'L'),
    generate_data_pkg.get_number(p_value_min => 1, p_value_max => 5),
    generate_data_pkg.get_fk(p_table => 'book', p_column => 'book_id'),
    generate_data_pkg.get_fk(p_table => 'customer', p_column => 'customer_id')
  from dual
  connect by level <=5000;
  commit;
  
  generate_data_pkg.set_nulls(p_table => 'book_review', p_nulls_percent => 30);
  commit;
  -----------------------------------------------------------------------------
  --cart
  l_index := 0;
  while l_index < 500
  loop
    begin  
      insert into cart(
        amount,
        customer_id)
      values(
        generate_data_pkg.get_number(p_value_min => 2, p_value_max => 100, p_decimals => 2),
        generate_data_pkg.get_fk(p_table => 'customer', p_column => 'customer_id'));
      l_index := l_index + 1;
    exception
      when DUP_VAL_ON_INDEX then continue;
      when OTHERS then raise;
      
    end;  
  end loop;
  commit;
  -----------------------------------------------------------------------------
  insert into cart_line(
    quantity,
    unit_price,
    amount,
    cart_id,
    book_id)
  select
    generate_data_pkg.get_number(p_value_min => 1, p_value_max => 10),
    generate_data_pkg.get_number(p_value_min => 2, p_value_max => 100, p_decimals => 2),
    generate_data_pkg.get_number(p_value_min => 2, p_value_max => 100, p_decimals => 2),
    generate_data_pkg.get_fk(p_table => 'cart', p_column => 'cart_id'),
    generate_data_pkg.get_fk(p_table => 'book', p_column => 'book_id')
  from dual
  connect by level <=2000;
  commit;
  -----------------------------------------------------------------------------
  --calculate cart+cart_line amounts
  insert into cart_line(
    quantity,
    unit_price,
    amount,
    cart_id,
    book_id)
  select
    generate_data_pkg.get_number(p_value_min => 1, p_value_max => 10),
    generate_data_pkg.get_number(p_value_min => 2, p_value_max => 100, p_decimals => 2),
    generate_data_pkg.get_number(p_value_min => 2, p_value_max => 100, p_decimals => 2),
    generate_data_pkg.get_fk(p_table => 'cart', p_column => 'cart_id'),
    generate_data_pkg.get_fk(p_table => 'book', p_column => 'book_id')
  from dual
  connect by level <=2000;
  commit;
  -----------------------------------------------------------------------------
  insert into invoice(
    invoice_number,
    invoice_date,
    amount,
    customer_id,
    customer_address_id)
  select
    level+1000,
    generate_data_pkg.get_date(p_value_min => sysdate-365, p_value_max => sysdate),
    generate_data_pkg.get_number(p_value_min => 2, p_value_max => 100, p_decimals => 2),
    generate_data_pkg.get_fk(p_table => 'customer', p_column => 'customer_id'),
    generate_data_pkg.get_fk(p_table => 'customer_address', p_column => 'customer_address_id')

  from dual
  connect by level <=1000;
  commit;
  -----------------------------------------------------------------------------
  insert into invoice_line(quantity,
                           unit_price,
                           amount,
                           book_id,
                           invoice_id)
  select
    generate_data_pkg.get_number(p_value_min => 1, p_value_max => 10, p_decimals => 0),
    generate_data_pkg.get_number(p_value_min => 2, p_value_max => 100, p_decimals => 2),
    generate_data_pkg.get_number(p_value_min => 2, p_value_max => 100, p_decimals => 2),
    generate_data_pkg.get_fk(p_table => 'book', p_column => 'book_id'),
    generate_data_pkg.get_fk(p_table => 'invoice', p_column => 'invoice_id')
  from dual
  connect by level <=10000;
  commit;
  -----------------------------------------------------------------------------
  --invoice_payment
  for rec in (select * from invoice)
  loop
    update invoice_line l
    set l.amount=l.quantity*l.unit_price
    where l.invoice_id=rec.invoice_id;
    select sum(l.amount)
    into l_amount
    from invoice_line l
    where l.invoice_id=rec.invoice_id;
    update invoice i
    set i.amount=nvl(l_amount,0)
    where i.invoice_id=rec.invoice_id;
    
    insert into invoice_payment(
      payment_date,
      amount,
      customer_payment_id,
      status,
      invoice_id)
    values(
      rec.invoice_date,
      nvl(l_amount,0),
      generate_data_pkg.get_fk(p_table => 'customer_payment', p_column => 'customer_payment_id'),
      'S',
      rec.invoice_id);
      
  end loop;
  
  commit;
  -----------------------------------------------------------------------------

  
end;
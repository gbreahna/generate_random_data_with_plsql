------------------------------------------------------------------------------
Pure PL/SQL package used to generate random data to populate DB tables
------------------------------------------------------------------------------
Install
SQL> @install.sql

The script will install a demo webshop schema, populated with random data.
The script will also populate the country and language tables with ISO based data from some jsons downloaded from the Internet.

The package will generate:
- words
- strings
- numbers
- dates
- list of values
- emails
- urls
- keys based on the PK references
The package will fill a specified X part of the table with nulls, but only on that nullable columns.

------------------------------------------------------------------------------
STRINGS
------------------------------------------------------------------------------
-- it will generate a string between 6 and 12 characters long
-- you can simulate First Names in this way
initcap(generate_data_pkg.get_string(p_string_min => 6, p_string_max => 12))

Qbopmj
Impajzn
Ersxccioyd
Kqrkjtnzs
Whmujv
Rcdtgleh
Qtkcyjjwgpdj
Jwkytnwqfqf
Nsjgrvfuqt
Rwjpizx
Fzsgfrycp

------------------------------------------------------------------------------
WORDS
------------------------------------------------------------------------------
-- it will generate words - each word will have a length between 5 and 10, and the whole string will be between 10 and 30 in length
-- you can simulate Book Titles in this way
initcap(generate_data_pkg.get_words(p_string_min => 10, p_string_max => 30, p_word_min => 5, p_word_max => 10)),

Xjfefxeqb Tfear
Nboognospx Grlawd
Vgdiywskln Ffjdggbck Gn
Ibeawofck Vqrkfg Fsugcz Spb
Uzxftfovz Icxd
Cwlwluf Jdnmfgmfl Znsjrpn
Cistho Nqhetmnfm 
Ctlsvlq Oscaxiy Zranrud
Peedfaklso Btl
Ihurrh Knxxcoxo Xmxkh J
Lvylkzty Epnxc Plx
Xiyhzwzak Zhnyawr Rtjaszu
Faaitqbj Oixeepzih Qcuvobz Za
Guzrmxbbms Jab
Griognuc Stxqi Jkcmymwp Rr
Mtxlku Sunofwq Ocynq
Zxooicdnd Dnuydvnrp Levsa
Lrhsnmp Und
Nngombnv Gzlqvxt Mikbwq
Zhhwd Vniu
Lwgiklews Ceduk Yjmliu Adudin

------------------------------------------------------------------------------
NUMBERS
------------------------------------------------------------------------------
-- it will generate a number between 2120000000 and 9120000000
-- you can simulate an ISBN in this way
generate_data_pkg.get_number(p_value_min => 2120000000, p_value_max => 9120000000)

8843677251522
7444404655571
5512051408402
5385300988766
8982479149206
9500259085008
1871641517363
9614885018559
8691789413476
3136411092558
7578130337636
7516888938580

-- it will generate a number between 18 and 80
-- you can simulate the age column values
generate_data_pkg.get_number(p_value_min => 18, p_value_max => 80)

------------------------------------------------------------------------------
LOVs
------------------------------------------------------------------------------
-- you can generate the sex column values
generate_data_pkg.get_lov('M;F'),

------------------------------------------------------------------------------
PK VALUES
------------------------------------------------------------------------------
-- it will pick random values from the table language, column language_id
generate_data_pkg.get_fk(p_table => 'language', p_column => 'language_id')

------------------------------------------------------------------------------
EMAILS
------------------------------------------------------------------------------
generate_data_pkg.get_email

dtevwbsb.iftrmlnm@mghqfb.ca
dajxcnsdjvvx.qgollheynzpy@mceumv.com
dsobcrqsbrcy.pmxlgymrfl@qamglqlmf.de
evwzmdqlnvu.hiqrujkuijs@cqcrskpolron.mx
lwrzzfg.pltfzrryyoddpkf@zghdnkdj.es
qzuonkmck.zsqjiahxgslsbrs@ieltxav.de
fakvncb.qvvptsghxydrq@gtstqpph.fr
yrcjtomuujz.eaykjxaicojnncu@famlngxser.com
ktafrrq.lkaosevrvsgzkp@byjksuk.de
fiaupodsk.nvvemmcmiazra@zzyiyudugbdg.mx
omcqdlbrdyr.zynaeacfrfknvl@qktrdzvrqhkt.es

------------------------------------------------------------------------------
URLs
------------------------------------------------------------------------------
generate_data_pkg.get_url||'.jpg'

https://skjmgvq.sifiizthpqd.com/nnhshrrgoktl.jpg
https://frpgvlfes.fwxmwjm.fr/qeyzfwljhxghrrgl.jpg
https://nmeidwnumr.ujrcnakx.com/cwepiffcqofsozpi.jpg
https://gbhkqyw.ngevhnqcs.com/qjjnioabpdpfyw.jpg

require 'open-uri'
require 'json'
require 'date'

data_store = [{"home_team"=>{"name"=>{"tri"=>"RUS", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/rus", "full"=>"Russia"}}, "group"=>"Group A", "visitant_team"=>{"name"=>{"tri"=>"KSA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/ksa", "full"=>"Saudi Arabia"}}, "start_time"=>"2018-06-14T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>1, "location"=>{"country"=>"Russia", "city"=>"MOSCOW"}, "stadium"=>"Luzhniki Stadium", "year"=>"2018", "date"=>"2018-06-14", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"34e5be34c60660dfb642429ca2486418dec0ecd95813378c9a01ecfa"}, {"home_team"=>{"name"=>{"tri"=>"EGY", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/egy", "full"=>"Egypt"}}, "group"=>"Group A", "visitant_team"=>{"name"=>{"tri"=>"URU", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/uru", "full"=>"Uruguay"}}, "start_time"=>"2018-06-15T17:00:00.000Z", "time"=>"17:00", "time_zone"=>"Russia", "num_match"=>2, "location"=>{"country"=>"Russia", "city"=>"EKATERINBURG"}, "stadium"=>"Ekaterinburg Arena", "year"=>"2018", "date"=>"2018-06-15", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"20562e6e0c63d79823c87f5ca8b41c8645c0a3a6c0c85952b5ab93d5"}, {"home_team"=>{"name"=>{"tri"=>"MAR", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/mar", "full"=>"Morroco"}}, "group"=>"Group B", "visitant_team"=>{"name"=>{"tri"=>"IRN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/irn", "full"=>"Iran"}}, "start_time"=>"2018-06-15T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>3, "location"=>{"country"=>"Russia", "city"=>"ST. PETERSBURG"}, "stadium"=>"Saint Petersburg Stadium", "year"=>"2018", "date"=>"2018-06-15", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"11328b1432eb19a71571e37094003b1138c00992564268998b9a90a8"}, {"home_team"=>{"name"=>{"tri"=>"POR", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/por", "full"=>"Portugal"}}, "group"=>"Group B", "visitant_team"=>{"name"=>{"tri"=>"ESP", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/esp", "full"=>"Spain"}}, "start_time"=>"2018-06-15T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>4, "location"=>{"country"=>"Russia", "city"=>"SOCHI"}, "stadium"=>"Fisht Stadium", "year"=>"2018", "date"=>"2018-06-15", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"6be33bfaf189e6deb1880443def02e208b8f887a5f07fef806e102dc"}, {"home_team"=>{"name"=>{"tri"=>"FRA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/fra", "full"=>"France"}}, "group"=>"Group C", "visitant_team"=>{"name"=>{"tri"=>"AUS", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/aus", "full"=>"Australia"}}, "start_time"=>"2018-06-16T13:00:00.000Z", "time"=>"13:00", "time_zone"=>"Russia", "num_match"=>5, "location"=>{"country"=>"Russia", "city"=>"KAZAN"}, "stadium"=>"Kazan Arena", "year"=>"2018", "date"=>"2018-06-16", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"8076f866530e7d6692238be1a3e0b6a3ddcc890e2ccb3de63968b893"}, {"home_team"=>{"name"=>{"tri"=>"ARG", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/arg", "full"=>"Argentina"}}, "group"=>"Group D", "visitant_team"=>{"name"=>{"tri"=>"ISL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/isl", "full"=>"Iceland"}}, "start_time"=>"2018-06-16T16:00:00.000Z", "time"=>"16:00", "time_zone"=>"Russia", "num_match"=>6, "location"=>{"country"=>"Russia", "city"=>"MOSCOW"}, "stadium"=>"Spartak Stadium", "year"=>"2018", "date"=>"2018-06-16", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"a0f2e794c4dd4450089406d8f55b9f487331f2d84303c2584496b739"}, {"home_team"=>{"name"=>{"tri"=>"PER", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/per", "full"=>"Peru"}}, "group"=>"Group C", "visitant_team"=>{"name"=>{"tri"=>"DEN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/den", "full"=>"Denmark"}}, "start_time"=>"2018-06-16T19:00:00.000Z", "time"=>"19:00", "time_zone"=>"Russia", "num_match"=>7, "location"=>{"country"=>"Russia", "city"=>"SARANSK"}, "stadium"=>"Mordovia Arena", "year"=>"2018", "date"=>"2018-06-16", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"6436ce90235084dd5a586c1e434856fdd8cfe9119193cc5b3e59a6cf"}, {"home_team"=>{"name"=>{"tri"=>"CRO", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/cro", "full"=>"Croatia"}}, "group"=>"Group D", "visitant_team"=>{"name"=>{"tri"=>"NGA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/nga", "full"=>"Nigeria"}}, "start_time"=>"2018-06-16T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>8, "location"=>{"country"=>"Russia", "city"=>"KALININGRAD"}, "stadium"=>"Kaliningrad Stadium", "year"=>"2018", "date"=>"2018-06-16", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"0b5f6e41f6d726e74388d29a0abc66bcc4bcbb88adaf492cd31cb847"}, {"home_team"=>{"name"=>{"tri"=>"CRC", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/crc", "full"=>"Costa Rica"}}, "group"=>"Group E", "visitant_team"=>{"name"=>{"tri"=>"SRB", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/srb", "full"=>"Serbia"}}, "start_time"=>"2018-06-17T16:00:00.000Z", "time"=>"16:00", "time_zone"=>"Russia", "num_match"=>9, "location"=>{"country"=>"Russia", "city"=>"SAMARA"}, "stadium"=>"Samara Arena", "year"=>"2018", "date"=>"2018-06-17", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"37a54c1a1f6d02408e2dadf588dd94e95523c7aec582af0cb1a3afe7"}, {"home_team"=>{"name"=>{"tri"=>"GER", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/ger", "full"=>"Germany"}}, "group"=>"Group F", "visitant_team"=>{"name"=>{"tri"=>"MEX", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/mex", "full"=>"Mexico"}}, "start_time"=>"2018-06-17T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>10, "location"=>{"country"=>"Russia", "city"=>"MOSCOW"}, "stadium"=>"Luzhniki Stadium", "year"=>"2018", "date"=>"2018-06-17", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"1341b0a78061452f07e9c4a045e4fc14e8798ffa433b3ff378e936dd"}, {"home_team"=>{"name"=>{"tri"=>"BRA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/bra", "full"=>"Brazil"}}, "group"=>"Group E", "visitant_team"=>{"name"=>{"tri"=>"SUI", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/sui", "full"=>"Switzerland"}}, "start_time"=>"2018-06-17T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>11, "location"=>{"country"=>"Russia", "city"=>"ROSTOV-ON-DON"}, "stadium"=>"Rostov Arena", "year"=>"2018", "date"=>"2018-06-17", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"237d40db413abf8a73a6ffb199db69463ac0df5af0754e50c9be1d19"}, {"home_team"=>{"name"=>{"tri"=>"SWE", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/swe", "full"=>"Sweden"}}, "group"=>"Group F", "visitant_team"=>{"name"=>{"tri"=>"KOR", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/kor", "full"=>"South Korea"}}, "start_time"=>"2018-06-18T15:00:00.000Z", "time"=>"15:00", "time_zone"=>"Russia", "num_match"=>12, "location"=>{"country"=>"Russia", "city"=>"NIZHNY NOVGOROD"}, "stadium"=>"Nizhny Novgorod Stadium", "year"=>"2018", "date"=>"2018-06-18", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"217db49675b2524928d98b0414fb3bf3fb127fd5e463c54c12620850"}, {"home_team"=>{"name"=>{"tri"=>"BEL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/bel", "full"=>"Belgium"}}, "group"=>"Group G", "visitant_team"=>{"name"=>{"tri"=>"PAN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/pan", "full"=>"Panama"}}, "start_time"=>"2018-06-18T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>13, "location"=>{"country"=>"Russia", "city"=>"SOCHI"}, "stadium"=>"Fisht Stadium", "year"=>"2018", "date"=>"2018-06-18", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"69f60235a1c0c9143b1eb0e51fde1dff04f02ce80de551dfc2150789"}, {"home_team"=>{"name"=>{"tri"=>"TUN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/tun", "full"=>"Tunisia"}}, "group"=>"Group G", "visitant_team"=>{"name"=>{"tri"=>"ENG", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/eng", "full"=>"England"}}, "start_time"=>"2018-06-18T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>14, "location"=>{"country"=>"Russia", "city"=>"VOLGOGRAD"}, "stadium"=>"Volgograd Arena", "year"=>"2018", "date"=>"2018-06-18", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"30fa99dc46edde38e6c3a29c902ae2b92d7c4bb3553614db1e7b2111"}, {"home_team"=>{"name"=>{"tri"=>"COL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/col", "full"=>"Colombia"}}, "group"=>"Group H", "visitant_team"=>{"name"=>{"tri"=>"JPN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/jpn", "full"=>"Japan"}}, "start_time"=>"2018-06-19T15:00:00.000Z", "time"=>"15:00", "time_zone"=>"Russia", "num_match"=>15, "location"=>{"country"=>"Russia", "city"=>"SARANSK"}, "stadium"=>"Mordovia Arena", "year"=>"2018", "date"=>"2018-06-19", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"2639d81088650593230b84731c38ffe5b55728131a490bee6b2354b2"}, {"home_team"=>{"name"=>{"tri"=>"POL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/pol", "full"=>"Poland"}}, "group"=>"Group H", "visitant_team"=>{"name"=>{"tri"=>"SEN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/sen", "full"=>"Senegal"}}, "start_time"=>"2018-06-19T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>16, "location"=>{"country"=>"Russia", "city"=>"MOSCOW"}, "stadium"=>"Spartak Stadium", "year"=>"2018", "date"=>"2018-06-19", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"10e509ce4cb7081ee9714fe30fe88ec6b68976a6e5dcd36298864a5f"}, {"home_team"=>{"name"=>{"tri"=>"RUS", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/rus", "full"=>"Russia"}}, "group"=>"Group A", "visitant_team"=>{"name"=>{"tri"=>"EGY", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/egy", "full"=>"Egypt"}}, "start_time"=>"2018-06-19T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>17, "location"=>{"country"=>"Russia", "city"=>"ST. PETERSBURG"}, "stadium"=>"Saint Petersburg Stadium", "year"=>"2018", "date"=>"2018-06-19", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"c7c03a01ea296e9cfa9ba7ff97e1883c1c84035e015d72bdefd1f1b8"}, {"home_team"=>{"name"=>{"tri"=>"POR", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/por", "full"=>"Portugal"}}, "group"=>"Group B", "visitant_team"=>{"name"=>{"tri"=>"MAR", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/mar", "full"=>"Morroco"}}, "start_time"=>"2018-06-20T15:00:00.000Z", "time"=>"15:00", "time_zone"=>"Russia", "num_match"=>18, "location"=>{"country"=>"Russia", "city"=>"MOSCOW"}, "stadium"=>"Luzhniki Stadium", "year"=>"2018", "date"=>"2018-06-20", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"b8ab73ca0ac34a7f445ff7eeeec05000e42b8d14a97e7a616f47fa14"}, {"home_team"=>{"name"=>{"tri"=>"URU", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/uru", "full"=>"Uruguay"}}, "group"=>"Group A", "visitant_team"=>{"name"=>{"tri"=>"KSA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/ksa", "full"=>"Saudi Arabia"}}, "start_time"=>"2018-06-20T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>19, "location"=>{"country"=>"Russia", "city"=>"ROSTOV-ON-DON"}, "stadium"=>"Rostov Arena", "year"=>"2018", "date"=>"2018-06-20", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"7e47460af04202f3bd9f1e40ca67e41f4fb62cbd8cee2cf83904680b"}, {"home_team"=>{"name"=>{"tri"=>"IRN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/irn", "full"=>"Iran"}}, "group"=>"Group B", "visitant_team"=>{"name"=>{"tri"=>"ESP", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/esp", "full"=>"Spain"}}, "start_time"=>"2018-06-20T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>20, "location"=>{"country"=>"Russia", "city"=>"KAZAN"}, "stadium"=>"Kazan Arena", "year"=>"2018", "date"=>"2018-06-20", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"d8dc5b937fd84f5870082b9fe25bebeb4554fab6f518e8fe88f0c6f0"}, {"home_team"=>{"name"=>{"tri"=>"DEN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/den", "full"=>"Denmark"}}, "group"=>"Group C", "visitant_team"=>{"name"=>{"tri"=>"AUS", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/aus", "full"=>"Australia"}}, "start_time"=>"2018-06-21T16:00:00.000Z", "time"=>"16:00", "time_zone"=>"Russia", "num_match"=>21, "location"=>{"country"=>"Russia", "city"=>"SAMARA"}, "stadium"=>"Samara Arena", "year"=>"2018", "date"=>"2018-06-21", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"994307dba3f8650bb80eaa881bc47192f062ccac2cccfd89d7978621"}, {"home_team"=>{"name"=>{"tri"=>"FRA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/fra", "full"=>"France"}}, "group"=>"Group C", "visitant_team"=>{"name"=>{"tri"=>"PER", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/per", "full"=>"Peru"}}, "start_time"=>"2018-06-21T20:00:00.000Z", "time"=>"20:00", "time_zone"=>"Russia", "num_match"=>22, "location"=>{"country"=>"Russia", "city"=>"EKATERINBURG"}, "stadium"=>"Ekaterinburg Arena", "year"=>"2018", "date"=>"2018-06-21", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"da89760ddc84371348ef5ed37bebec3287d1959de0953ec85901fc09"}, {"home_team"=>{"name"=>{"tri"=>"ARG", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/arg", "full"=>"Argentina"}}, "group"=>"Group D", "visitant_team"=>{"name"=>{"tri"=>"CRO", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/cro", "full"=>"Croatia"}}, "start_time"=>"2018-06-21T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>23, "location"=>{"country"=>"Russia", "city"=>"NIZHNY NOVGOROD"}, "stadium"=>"Nizhny Novgorod Stadium", "year"=>"2018", "date"=>"2018-06-21", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"e3eac55a31ff16699bf053afa44be13b66e3a7114fbd547470d27e70"}, {"home_team"=>{"name"=>{"tri"=>"BRA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/bra", "full"=>"Brazil"}}, "group"=>"Group E", "visitant_team"=>{"name"=>{"tri"=>"CRC", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/crc", "full"=>"Costa Rica"}}, "start_time"=>"2018-06-22T15:00:00.000Z", "time"=>"15:00", "time_zone"=>"Russia", "num_match"=>24, "location"=>{"country"=>"Russia", "city"=>"ST. PETERSBURG"}, "stadium"=>"Saint Petersburg Stadium", "year"=>"2018", "date"=>"2018-06-22", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"f41938bff094008304b6362500c9ed1afd804c11f6d4c00345445cab"}, {"home_team"=>{"name"=>{"tri"=>"NGA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/nga", "full"=>"Nigeria"}}, "group"=>"Group D", "visitant_team"=>{"name"=>{"tri"=>"ISL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/isl", "full"=>"Iceland"}}, "start_time"=>"2018-06-22T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>25, "location"=>{"country"=>"Russia", "city"=>"VOLGOGRAD"}, "stadium"=>"Volgograd Arena", "year"=>"2018", "date"=>"2018-06-22", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"17566d9213c0b3e0f69fdb7b2c06453a7ccbc3df1b3366b4c70dd837"}, {"home_team"=>{"name"=>{"tri"=>"SRB", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/srb", "full"=>"Serbia"}}, "group"=>"Group E", "visitant_team"=>{"name"=>{"tri"=>"SUI", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/sui", "full"=>"Switzerland"}}, "start_time"=>"2018-06-22T20:00:00.000Z", "time"=>"20:00", "time_zone"=>"Russia", "num_match"=>26, "location"=>{"country"=>"Russia", "city"=>"KALININGRAD"}, "stadium"=>"Kaliningrad Stadium", "year"=>"2018", "date"=>"2018-06-22", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"2b22b5b7297db6440e2e39199dc0f144d4d108c862835456b78ee256"}, {"home_team"=>{"name"=>{"tri"=>"BEL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/bel", "full"=>"Belgium"}}, "group"=>"Group G", "visitant_team"=>{"name"=>{"tri"=>"TUN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/tun", "full"=>"Tunisia"}}, "start_time"=>"2018-06-23T15:00:00.000Z", "time"=>"15:00", "time_zone"=>"Russia", "num_match"=>27, "location"=>{"country"=>"Russia", "city"=>"MOSCOW"}, "stadium"=>"Spartak Stadium", "year"=>"2018", "date"=>"2018-06-23", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"5b1f1decf184112e5a653f2c60acf1c872cfef403fd8d50f905c7dc5"}, {"home_team"=>{"name"=>{"tri"=>"KOR", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/kor", "full"=>"South Korea"}}, "group"=>"Group F", "visitant_team"=>{"name"=>{"tri"=>"MEX", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/mex", "full"=>"Mexico"}}, "start_time"=>"2018-06-23T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>28, "location"=>{"country"=>"Russia", "city"=>"ROSTOV-ON-DON"}, "stadium"=>"Rostov Arena", "year"=>"2018", "date"=>"2018-06-23", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"e435b9ac23126773eb919ef5d4737b78a8f3942a167d8980fdb4a151"}, {"home_team"=>{"name"=>{"tri"=>"GER", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/ger", "full"=>"Germany"}}, "group"=>"Group F", "visitant_team"=>{"name"=>{"tri"=>"SWE", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/swe", "full"=>"Sweden"}}, "start_time"=>"2018-06-23T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>29, "location"=>{"country"=>"Russia", "city"=>"SOCHI"}, "stadium"=>"Fisht Stadium", "year"=>"2018", "date"=>"2018-06-23", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"8fa544ce20c6cc56477a52ecfbff3907ce2b25eb7abdccb9a96e5408"}, {"home_team"=>{"name"=>{"tri"=>"ENG", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/eng", "full"=>"England"}}, "group"=>"Group G", "visitant_team"=>{"name"=>{"tri"=>"PAN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/pan", "full"=>"Panama"}}, "start_time"=>"2018-06-24T15:00:00.000Z", "time"=>"15:00", "time_zone"=>"Russia", "num_match"=>30, "location"=>{"country"=>"Russia", "city"=>"NIZHNY NOVGOROD"}, "stadium"=>"Nizhny Novgorod Stadium", "year"=>"2018", "date"=>"2018-06-24", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"50aa159732787d0adf81387eb8569c430043e2b791640af80c8ba219"}, {"home_team"=>{"name"=>{"tri"=>"JPN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/jpn", "full"=>"Japan"}}, "group"=>"Group H", "visitant_team"=>{"name"=>{"tri"=>"SEN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/sen", "full"=>"Senegal"}}, "start_time"=>"2018-06-24T20:00:00.000Z", "time"=>"20:00", "time_zone"=>"Russia", "num_match"=>31, "location"=>{"country"=>"Russia", "city"=>"EKATERINBURG"}, "stadium"=>"Ekaterinburg Arena", "year"=>"2018", "date"=>"2018-06-24", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"bb40f59294833d5472f1f25b20388c1507f0d804badc72da1b1a1496"}, {"home_team"=>{"name"=>{"tri"=>"POL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/pol", "full"=>"Poland"}}, "group"=>"Group H", "visitant_team"=>{"name"=>{"tri"=>"COL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/col", "full"=>"Colombia"}}, "start_time"=>"2018-06-24T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>32, "location"=>{"country"=>"Russia", "city"=>"KAZAN"}, "stadium"=>"Kazan Arena", "year"=>"2018", "date"=>"2018-06-24", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"f8d012593f8b8e6635fa4866cd85bd1e2920a1e0d2c69e05af2c126f"}, {"home_team"=>{"name"=>{"tri"=>"URU", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/uru", "full"=>"Uruguay"}}, "group"=>"Group A", "visitant_team"=>{"name"=>{"tri"=>"RUS", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/rus", "full"=>"Russia"}}, "start_time"=>"2018-06-25T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>33, "location"=>{"country"=>"Russia", "city"=>"SAMARA"}, "stadium"=>"Samara Arena", "year"=>"2018", "date"=>"2018-06-25", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"89530323dc8184f7c1bbe9038747ae64e512ddb3285e6def2842962a"}, {"home_team"=>{"name"=>{"tri"=>"KSA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/ksa", "full"=>"Saudi Arabia"}}, "group"=>"Group A", "visitant_team"=>{"name"=>{"tri"=>"EGY", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/egy", "full"=>"Egypt"}}, "start_time"=>"2018-06-25T17:00:00.000Z", "time"=>"17:00", "time_zone"=>"Russia", "num_match"=>34, "location"=>{"country"=>"Russia", "city"=>"VOLGOGRAD"}, "stadium"=>"Volgograd Arena", "year"=>"2018", "date"=>"2018-06-25", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"66a3c0f9f307a61b9e5ba0cfd69082c500dee4e1ce08a5fe8db32874"}, {"home_team"=>{"name"=>{"tri"=>"ESP", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/esp", "full"=>"Spain"}}, "group"=>"Group B", "visitant_team"=>{"name"=>{"tri"=>"MAR", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/mar", "full"=>"Morroco"}}, "start_time"=>"2018-06-25T20:00:00.000Z", "time"=>"20:00", "time_zone"=>"Russia", "num_match"=>35, "location"=>{"country"=>"Russia", "city"=>"KALININGRAD"}, "stadium"=>"Kaliningrad Stadium", "year"=>"2018", "date"=>"2018-06-25", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"f89717b6da4ccc577b9a1f50b75ecc4a5e6ec920ebbaaf0adff80a5b"}, {"home_team"=>{"name"=>{"tri"=>"IRN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/irn", "full"=>"Iran"}}, "group"=>"Group B", "visitant_team"=>{"name"=>{"tri"=>"POR", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/por", "full"=>"Portugal"}}, "start_time"=>"2018-06-25T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>36, "location"=>{"country"=>"Russia", "city"=>"SARANSK"}, "stadium"=>"Mordovia Arena", "year"=>"2018", "date"=>"2018-06-25", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"43d68c6a17382fb69a13a967bb095ebe8bf5fa5ee7c2ffb23aea51a5"}, {"home_team"=>{"name"=>{"tri"=>"AUS", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/aus", "full"=>"Australia"}}, "group"=>"Group C", "visitant_team"=>{"name"=>{"tri"=>"PER", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/per", "full"=>"Peru"}}, "start_time"=>"2018-06-26T17:00:00.000Z", "time"=>"17:00", "time_zone"=>"Russia", "num_match"=>37, "location"=>{"country"=>"Russia", "city"=>"SOCHI"}, "stadium"=>"Fisht Stadium", "year"=>"2018", "date"=>"2018-06-26", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"a1477753f6d0bbd2694ed49381fd3bfb90957addcc9707c3990e813f"}, {"home_team"=>{"name"=>{"tri"=>"DEN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/den", "full"=>"Denmark"}}, "group"=>"Group C", "visitant_team"=>{"name"=>{"tri"=>"FRA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/fra", "full"=>"France"}}, "start_time"=>"2018-06-26T17:00:00.000Z", "time"=>"17:00", "time_zone"=>"Russia", "num_match"=>38, "location"=>{"country"=>"Russia", "city"=>"MOSCOW"}, "stadium"=>"Luzhniki Stadium", "year"=>"2018", "date"=>"2018-06-26", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"b23fdfdbc09de5507469ce2cfcf5d9ec86e349601927033fb9959036"}, {"home_team"=>{"name"=>{"tri"=>"NGA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/nga", "full"=>"Nigeria"}}, "group"=>"Group D", "visitant_team"=>{"name"=>{"tri"=>"ARG", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/arg", "full"=>"Argentina"}}, "start_time"=>"2018-06-26T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>39, "location"=>{"country"=>"Russia", "city"=>"ST. PETERSBURG"}, "stadium"=>"Saint Petersburg Stadium", "year"=>"2018", "date"=>"2018-06-26", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"0deb07b73a4172688847c7a4c1929a4b651e88235ba459c83c5c67c9"}, {"home_team"=>{"name"=>{"tri"=>"ISL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/isl", "full"=>"Iceland"}}, "group"=>"Group D", "visitant_team"=>{"name"=>{"tri"=>"CRO", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/cro", "full"=>"Croatia"}}, "start_time"=>"2018-06-26T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>40, "location"=>{"country"=>"Russia", "city"=>"ROSTOV-ON-DON"}, "stadium"=>"Rostov Arena", "year"=>"2018", "date"=>"2018-06-26", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"bceb8be51a47daccf66fd1769ce76f1348b42cdfa6d5c989e37f32da"}, {"home_team"=>{"name"=>{"tri"=>"KOR", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/kor", "full"=>"South Korea"}}, "group"=>"Group F", "visitant_team"=>{"name"=>{"tri"=>"GER", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/ger", "full"=>"Germany"}}, "start_time"=>"2018-06-27T17:00:00.000Z", "time"=>"17:00", "time_zone"=>"Russia", "num_match"=>41, "location"=>{"country"=>"Russia", "city"=>"KAZAN"}, "stadium"=>"Kazan Arena", "year"=>"2018", "date"=>"2018-06-27", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"17d5c148dc545da844815fa1a7089be62de1cb80152f96e2964f1e4c"}, {"home_team"=>{"name"=>{"tri"=>"MEX", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/mex", "full"=>"Mexico"}}, "group"=>"Group F", "visitant_team"=>{"name"=>{"tri"=>"SWE", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/swe", "full"=>"Sweden"}}, "start_time"=>"2018-06-27T19:00:00.000Z", "time"=>"19:00", "time_zone"=>"Russia", "num_match"=>42, "location"=>{"country"=>"Russia", "city"=>"EKATERINBURG"}, "stadium"=>"Ekaterinburg Arena", "year"=>"2018", "date"=>"2018-06-27", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"c62eb0f554e288f3d9fb6ee429ee428dec3a71525acde571d9443a78"}, {"home_team"=>{"name"=>{"tri"=>"SRB", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/srb", "full"=>"Serbia"}}, "group"=>"Group E", "visitant_team"=>{"name"=>{"tri"=>"BRA", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/bra", "full"=>"Brazil"}}, "start_time"=>"2018-06-27T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>43, "location"=>{"country"=>"Russia", "city"=>"MOSCOW"}, "stadium"=>"Spartak Stadium", "year"=>"2018", "date"=>"2018-06-27", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"0d5b4918573e553091843ba1cd63c9997279688f5a4e3a74bbe8ff66"}, {"home_team"=>{"name"=>{"tri"=>"SUI", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/sui", "full"=>"Switzerland"}}, "group"=>"Group E", "visitant_team"=>{"name"=>{"tri"=>"CRC", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/crc", "full"=>"Costa Rica"}}, "start_time"=>"2018-06-27T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>44, "location"=>{"country"=>"Russia", "city"=>"NIZHNY NOVGOROD"}, "stadium"=>"Nizhny Novgorod Stadium", "year"=>"2018", "date"=>"2018-06-27", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"84ab7b247f6d409ba523aabaef4b0a0b420c2f51f4b1d5455fa3d313"}, {"home_team"=>{"name"=>{"tri"=>"JPN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/jpn", "full"=>"Japan"}}, "group"=>"Group H", "visitant_team"=>{"name"=>{"tri"=>"POL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/pol", "full"=>"Poland"}}, "start_time"=>"2018-06-28T17:00:00.000Z", "time"=>"17:00", "time_zone"=>"Russia", "num_match"=>45, "location"=>{"country"=>"Russia", "city"=>"VOLGOGRAD"}, "stadium"=>"Volgograd Arena", "year"=>"2018", "date"=>"2018-06-28", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"bdbd81c26421f42f27b8f59c148bc8ad261ee8da0c979bae9eb8c494"}, {"home_team"=>{"name"=>{"tri"=>"SEN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/sen", "full"=>"Senegal"}}, "group"=>"Group H", "visitant_team"=>{"name"=>{"tri"=>"COL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/col", "full"=>"Colombia"}}, "start_time"=>"2018-06-28T18:00:00.000Z", "time"=>"18:00", "time_zone"=>"Russia", "num_match"=>46, "location"=>{"country"=>"Russia", "city"=>"SAMARA"}, "stadium"=>"Samara Arena", "year"=>"2018", "date"=>"2018-06-28", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"4fc0ca7cf51adabbdb929ff500844b036ad33025280b11159a375d10"}, {"home_team"=>{"name"=>{"tri"=>"PAN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/pan", "full"=>"Panama"}}, "group"=>"Group G", "visitant_team"=>{"name"=>{"tri"=>"TUN", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/tun", "full"=>"Tunisia"}}, "start_time"=>"2018-06-28T21:00:00.000Z", "time"=>"21:00", "time_zone"=>"Russia", "num_match"=>47, "location"=>{"country"=>"Russia", "city"=>"SARANSK"}, "stadium"=>"Mordovia Arena", "year"=>"2018", "date"=>"2018-06-28", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"981650871d5d3b0da199cf3c86f9feda4da5d75749c1d3ca68286d15"}, {"home_team"=>{"name"=>{"tri"=>"ENG", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/eng", "full"=>"England"}}, "group"=>"Group G", "visitant_team"=>{"name"=>{"tri"=>"BEL", "flag"=>"https://fsprdcdnpublic.azureedge.net/global-pictures/flags-fwc2018-4/bel", "full"=>"Belgium"}}, "start_time"=>"2018-06-28T20:00:00.000Z", "time"=>"20:00", "time_zone"=>"Russia", "num_match"=>48, "location"=>{"country"=>"Russia", "city"=>"KALININGRAD"}, "stadium"=>"Kaliningrad Stadium", "year"=>"2018", "date"=>"2018-06-28", "tournament_type"=>"World Cup", "tournament_name"=>"Russia 2018", "match_id"=>"10b9ba35228ec7bb22dc633305d1e69feecb01505fbdb1b31d6c652e"}]

User.all.each do |g|
  g.destroy
end

Group.all.each do |g|
  g.destroy
end
Team.all.each do |g|
  g.destroy
end
Match.all.each do |g|
  g.destroy
end

root = "http://livescore-api.com/api-client"
groupstage = "#{ENV['LIVESCORES_URL']}"
groups_id = { 793 => "Group A", 794 => "Group B", 795 => "Group C", 796 => "Group D", 797 => "Group E", 798 => "Group F", 799 => "Group G", 800 => "Group H" }

groups_id.each do |id, name |
  created = Group.create(id: id, name: name)
  puts created
end
stadiums = { "Luzhniki Stadium, Moscow" => 2, "Spartak Stadium, Moscow" => 2, "Nizhny Novgorod Stadium, Nizhny Novgorod" => 2, "Mordovia Arena, Saransk" => 2, "Kazan Arena, Kazan" => 2, "Samara Arena, Samara" => 3, "Ekaterinburg Arena, Ekaterinburg" => 4, "St Petersburg Stadium, St Petersburg" => 2, "Kaliningrad Stadium, Kaliningrad" => 1, "Volgograd Arena, Volgograd" => 2, "Rostov Arena, Rostov-on-Don" => 2, "Fisht Stadium, Sochi" => 2 }
groups_id.each do |key, value|
  url = root + groupstage + key.to_s
  response = open(url)
  response_body = response.read
  json = JSON.parse(response_body)
  puts json["data"]["fixtures"]

  json["data"]["fixtures"].each do |fixture|
    begin
      Team.create(id: fixture["home_id"], name: fixture["home_name"], group_id: fixture["league_id"])
      puts "team created"
    rescue ActiveRecord::RecordNotUnique
      puts "I get here"
    rescue PG::UniqueViolation
      puts "bugger"
    end
  end
  json["data"]["fixtures"].each do |fixture|
    Match.create(id: fixture["id"],
      date_string: fixture["date"],
      time: fixture["time"],
      round: fixture["round"],
      home_name: fixture["home_name"],
      away_name: fixture["away_name"],
      location: fixture["location"],
      group_id: fixture["league_id"],
      away_team_id: fixture["away_id"],
      home_team_id: fixture["home_id"],
      match_status: fixture["status"])
    puts "match created"
  end
end

puts "adding flags"

data_store.each do |fixture|
  f = Match.where("home_name = ? and away_name = ?", fixture["home_team"]["name"]["full"], fixture["visitant_team"]["name"]["full"]).first
  f.date = fixture["start_time"]
  puts f.date
  f.save
  team = Team.where(name: fixture["home_team"]["name"]["full"]).first
  team.photo = fixture["home_team"]["name"]["flag"]
  puts team.photo
  team.save
end



Ann::Application.routes.draw do
  resource :pages

  root 'pages#index'
  
  #about pages through pages controller
  match 'resume',           to: 'pages#resume',           via: 'get',  as: 'resume'
  match 'biography',        to: 'pages#biography',        via: 'get',  as: 'biography'
  match 'criticism',        to: 'pages#criticism',        via: 'get',  as: 'criticism'
  match 'about',            to: 'pages#about',            via: 'get',  as: 'about'
  match 'making-of-video',  to: 'pages#bofvideo',         via: 'get',  as: 'bofvideo'
  match 'aau-audio',        to: 'pages#aauaudio',         via: 'get',  as: 'aauaudio'

  #gallery pages through galleries controller
  match 'newWork',        to:  'galleries#new_work',        via: 'get', as: 'new_work'
  match 'selfPortrait',   to:  'galleries#self_portrait',   via: 'get', as: 'self_portrait'
  match 'plasticCamera',  to:  'galleries#plastic_camera',  via: 'get', as: 'plastic_camera'
  match 'archive',        to:  'galleries#archive',         via: 'get', as: 'archive'  
  match 'pillowBook',     to:  'galleries#pillow_book',     via:'get',  as: 'pillow_book'
  match 'iconDiana',      to:  'galleries#icon_diana',      via: 'get', as: 'icon_diana'
  match 'gardenDiana',    to:  'galleries#garden_diana',    via: 'get', as: 'garden_diana'
  match 'botanicals',     to:  'galleries#botanicals',      via: 'get', as: 'botanicals'
  match 'watches',        to:  'galleries#watches',         via: 'get', as: 'watches'
  match 'group',          to:  'galleries#group',           via: 'get', as: 'group'
  match 'layered',        to:  'galleries#layered',         via: 'get', as: 'layered'
  match 'bouyancy',       to:  'galleries#bouyancy',        via: 'get', as: 'bouyancy'
  match 'hands',          to:  'galleries#hands',           via: 'get', as: 'hands'
  match 'botanicalBook',  to:  'galleries#botanical_book',  via: 'get', as: 'botanical_book'
  match 'monoprints',     to:  'galleries#monoprints',      via: 'get', as: 'monoprints'
  match 'circles',        to:  'galleries#bubbles',         via: 'get', as: 'bubbles'
  match 'milan',          to:  'galleries#milan',           via: 'get', as: 'milan'
  match 'dresses',          to:  'galleries#dresses',           via: 'get', as: 'dresses'
  match 'murals',          to:  'galleries#murals',           via: 'get', as: 'murals'

  #statement pages through statements controller
  match 'pillowBookStatement',      to: 'statements#pillow_book_statement',       via: 'get',  as: 'pillow_book_statement'
  match 'gardenDianaStatement',     to: 'statements#garden_diana_statement',      via: 'get',  as: 'garden_diana_statement'
  match 'iconDianaStatement',       to: 'statements#icon_diana_statement',        via: 'get',  as: 'icon_diana_statement'
  match 'groupStatement',           to: 'statements#group_statement',             via: 'get',  as: 'group_statement'
  match 'layeredStatement',         to: 'statements#layered_statement',           via: 'get',  as: 'layered_statement'
  match 'bouyancyStatement',        to: 'statements#bouyancy_statement',          via: 'get',  as: 'bouyancy_statement'
  match 'botanicalsStatement',      to: 'statements#botanicals_statement',        via: 'get',  as: 'botanicals_statement'
  match 'atomPlanetStatement',      to: 'statements#atom_planet_statement',       via: 'get',  as: 'atom_planet_statement'
  match 'selfPortraitStatement',    to: 'statements#self_portrait_statement',     via: 'get',  as: 'self_portrait_statement'
  match 'watchesStatement',         to: 'statements#watches_statement',           via: 'get',  as: 'watches_statement'
  match 'handsStatement',           to: 'statements#hands_statement',             via: 'get',  as: 'hands_statement'
  match 'botanicalBookStatement',   to: 'statements#botanical_book_statement',    via: 'get',  as: 'botanical_book_statement'
  match 'monoprintsStatement',      to: 'statements#monoprints_statement',        via: 'get',  as: 'monoprints_statement'
  match 'circlesStatement',         to: 'statements#bubbles_statement',           via: 'get',  as: 'circles_statement'
  match 'milanStatement',           to: 'statements#milan_statement',             via: 'get',  as: 'milan_statement'
  match 'bodiesStatement',          to: 'statements#bodies_statement',            via: 'get',  as: 'bodies_statement'
  match 'dressesStatement',          to: 'statements#dresses_statement',            via: 'get',  as: 'dresses_statement'
  match 'muralsStatement',          to: 'statements#murals_statement',            via: 'get',  as: 'murals_statement'

  # work details pages through galleries controller
  match 'pillowBook1',              to: 'galleries#pillow_book_1',                  via: 'get',  as:  'pillow_book_1'
  match 'pillowBook2',              to: 'galleries#pillow_book_2',                  via: 'get',  as:  'pillow_book_2'
  match 'pillowBook3',              to: 'galleries#pillow_book_3',                  via: 'get',  as:  'pillow_book_3'
  match 'pillowBook4',              to: 'galleries#pillow_book_4',                  via: 'get',  as:  'pillow_book_4'
  match 'pillowBook5',              to: 'galleries#pillow_book_5',                  via: 'get',  as:  'pillow_book_5'
  match 'pillowBook6',              to: 'galleries#pillow_book_6',                  via: 'get',  as:  'pillow_book_6'
  match 'pillowBook7',              to: 'galleries#pillow_book_7',                  via: 'get',  as:  'pillow_book_7'
  match 'pillowBook8',              to: 'galleries#pillow_book_8',                  via: 'get',  as:  'pillow_book_8'
  match 'pillowBook9',              to: 'galleries#pillow_book_9',                  via: 'get',  as:  'pillow_book_9'
  match 'pillowBook10',             to: 'galleries#pillow_book_10',                  via: 'get',  as:  'pillow_book_10'
  match 'pillowBook11',             to: 'galleries#pillow_book_11',                  via: 'get',  as:  'pillow_book_11'
  match 'pillowBook12',             to: 'galleries#pillow_book_12',                  via: 'get',  as:  'pillow_book_12'
  match 'pillowBook13',             to: 'galleries#pillow_book_13',                  via: 'get',  as:  'pillow_book_13'
  match 'pillowBook14',             to: 'galleries#pillow_book_14',                  via: 'get',  as:  'pillow_book_14'
  match 'pillowBook15',             to: 'galleries#pillow_book_15',                  via: 'get',  as:  'pillow_book_15'

  match 'iconDiana1',              to: 'galleries#icon_diana_1',                  via: 'get',  as:  'icon_diana_1'
  match 'iconDiana2',              to: 'galleries#icon_diana_2',                  via: 'get',  as:  'icon_diana_2'
  match 'iconDiana3',              to: 'galleries#icon_diana_3',                  via: 'get',  as:  'icon_diana_3'
  match 'iconDiana4',              to: 'galleries#icon_diana_4',                  via: 'get',  as:  'icon_diana_4'
  match 'iconDiana5',              to: 'galleries#icon_diana_5',                  via: 'get',  as:  'icon_diana_5'
  match 'iconDiana6',              to: 'galleries#icon_diana_6',                  via: 'get',  as:  'icon_diana_6'
  match 'iconDiana7',              to: 'galleries#icon_diana_7',                  via: 'get',  as:  'icon_diana_7'
  match 'iconDiana8',              to: 'galleries#icon_diana_8',                  via: 'get',  as:  'icon_diana_8'
  match 'iconDiana9',              to: 'galleries#icon_diana_9',                  via: 'get',  as:  'icon_diana_9'
  match 'iconDiana10',              to: 'galleries#icon_diana_10',                  via: 'get',  as:  'icon_diana_10'
  match 'iconDiana11',              to: 'galleries#icon_diana_11',                  via: 'get',  as:  'icon_diana_11'
  match 'iconDiana12',              to: 'galleries#icon_diana_12',                  via: 'get',  as:  'icon_diana_12'
  match 'iconDiana13',              to: 'galleries#icon_diana_13',                  via: 'get',  as:  'icon_diana_13'
  match 'iconDiana14',              to: 'galleries#icon_diana_14',                  via: 'get',  as:  'icon_diana_14'
  match 'iconDiana15',              to: 'galleries#icon_diana_15',                  via: 'get',  as:  'icon_diana_15'
  match 'iconDiana16',              to: 'galleries#icon_diana_16',                  via: 'get',  as:  'icon_diana_16'
  match 'iconDiana17',              to: 'galleries#icon_diana_17',                  via: 'get',  as:  'icon_diana_17'    
  match 'iconDiana18',              to: 'galleries#icon_diana_18',                  via: 'get',  as:  'icon_diana_18'
  match 'iconDiana19',              to: 'galleries#icon_diana_19',                  via: 'get',  as:  'icon_diana_19'

  match 'gardenDiana1',              to: 'galleries#garden_diana_1',                  via: 'get',  as:  'garden_diana_1'
  match 'gardenDiana2',              to: 'galleries#garden_diana_2',                  via: 'get',  as:  'garden_diana_2'
  match 'gardenDiana3',              to: 'galleries#garden_diana_3',                  via: 'get',  as:  'garden_diana_3'
  match 'gardenDiana4',              to: 'galleries#garden_diana_4',                  via: 'get',  as:  'garden_diana_4'
  match 'gardenDiana5',              to: 'galleries#garden_diana_5',                  via: 'get',  as:  'garden_diana_5'
  match 'gardenDiana6',              to: 'galleries#garden_diana_6',                  via: 'get',  as:  'garden_diana_6'
  match 'gardenDiana7',              to: 'galleries#garden_diana_7',                  via: 'get',  as:  'garden_diana_7'
  match 'gardenDiana8',              to: 'galleries#garden_diana_8',                  via: 'get',  as:  'garden_diana_8'
  match 'gardenDiana9',              to: 'galleries#garden_diana_9',                  via: 'get',  as:  'garden_diana_9'
  match 'gardenDiana10',              to: 'galleries#garden_diana_10',                  via: 'get',  as:  'garden_diana_10'
  match 'gardenDiana11',              to: 'galleries#garden_diana_11',                  via: 'get',  as:  'garden_diana_11'
  match 'gardenDiana12',              to: 'galleries#garden_diana_12',                  via: 'get',  as:  'garden_diana_12'
  match 'gardenDiana13',              to: 'galleries#garden_diana_13',                  via: 'get',  as:  'garden_diana_13'
  match 'gardenDiana14',              to: 'galleries#garden_diana_14',                  via: 'get',  as:  'garden_diana_14'
  match 'gardenDiana15',              to: 'galleries#garden_diana_15',                  via: 'get',  as:  'garden_diana_15'
  match 'gardenDiana16',              to: 'galleries#garden_diana_16',                  via: 'get',  as:  'garden_diana_16'
  match 'gardenDiana17',              to: 'galleries#garden_diana_17',                  via: 'get',  as:  'garden_diana_17'
  match 'gardenDiana18',              to: 'galleries#garden_diana_18',                  via: 'get',  as:  'garden_diana_18'
  match 'gardenDiana19',              to: 'galleries#garden_diana_19',                  via: 'get',  as:  'garden_diana_19'
  match 'gardenDiana20',              to: 'galleries#garden_diana_20',                  via: 'get',  as:  'garden_diana_20'

    match 'Group1',              to: 'galleries#group_1',                  via: 'get',  as:  'group_1'
    match 'Group2',              to: 'galleries#group_2',                  via: 'get',  as:  'group_2'
    match 'Group3',              to: 'galleries#group_3',                  via: 'get',  as:  'group_3'
    match 'Group4',              to: 'galleries#group_4',                  via: 'get',  as:  'group_4'
    match 'Group5',              to: 'galleries#group_5',                  via: 'get',  as:  'group_5'
    match 'Group6',              to: 'galleries#group_6',                  via: 'get',  as:  'group_6'
    match 'Group7',              to: 'galleries#group_7',                  via: 'get',  as:  'group_7'
    match 'Group8',              to: 'galleries#group_8',                  via: 'get',  as:  'group_8'
    match 'Group9',              to: 'galleries#group_9',                  via: 'get',  as:  'group_9'
    match 'Group10',             to: 'galleries#group_10',                 via: 'get',  as:  'group_10'
    match 'Group11',             to: 'galleries#group_11',                 via: 'get',  as:  'group_11'
    match 'Group12',             to: 'galleries#group_12',                 via: 'get',  as:  'group_12'
    match 'Group13',             to: 'galleries#group_13',                 via: 'get',  as:  'group_13'

    match 'layered1',              to: 'galleries#layered_1',                  via: 'get',  as:  'layered_1'
    match 'layered2',              to: 'galleries#layered_2',                  via: 'get',  as:  'layered_2'
    match 'layered3',              to: 'galleries#layered_3',                  via: 'get',  as:  'layered_3'
    match 'layered4',              to: 'galleries#layered_4',                  via: 'get',  as:  'layered_4'
    match 'layered5',              to: 'galleries#layered_5',                  via: 'get',  as:  'layered_5'
    match 'layered6',              to: 'galleries#layered_6',                  via: 'get',  as:  'layered_6'
    match 'layered7',              to: 'galleries#layered_7',                  via: 'get',  as:  'layered_7'
    match 'layered8',              to: 'galleries#layered_8',                  via: 'get',  as:  'layered_8'
    match 'layered9',              to: 'galleries#layered_9',                  via: 'get',  as:  'layered_9'
    match 'layered10',              to: 'galleries#layered_10',                  via: 'get',  as:  'layered_10'
    match 'layered11',              to: 'galleries#layered_11',                  via: 'get',  as:  'layered_11'

    match 'bouyancy1',              to: 'galleries#bouyancy_1',                  via: 'get',  as:  'bouyancy_1'
    match 'bouyancy2',              to: 'galleries#bouyancy_2',                  via: 'get',  as:  'bouyancy_2'
    match 'bouyancy3',              to: 'galleries#bouyancy_3',                  via: 'get',  as:  'bouyancy_3'
    match 'bouyancy4',              to: 'galleries#bouyancy_4',                  via: 'get',  as:  'bouyancy_4'
    match 'bouyancy5',              to: 'galleries#bouyancy_5',                  via: 'get',  as:  'bouyancy_5'
    match 'bouyancy6',              to: 'galleries#bouyancy_6',                  via: 'get',  as:  'bouyancy_6'
    match 'bouyancy7',              to: 'galleries#bouyancy_7',                  via: 'get',  as:  'bouyancy_7'
    match 'bouyancy8',              to: 'galleries#bouyancy_8',                  via: 'get',  as:  'bouyancy_8'
    match 'bouyancy9',              to: 'galleries#bouyancy_9',                  via: 'get',  as:  'bouyancy_9'

    match 'botanicals1',              to: 'galleries#botanicals_1',                  via: 'get',  as:  'botanicals_1'
    match 'botanicals2',              to: 'galleries#botanicals_2',                  via: 'get',  as:  'botanicals_2'
    match 'botanicals3',              to: 'galleries#botanicals_3',                  via: 'get',  as:  'botanicals_3'
    match 'botanicals4',              to: 'galleries#botanicals_4',                  via: 'get',  as:  'botanicals_4'

    match 'ap1',              to: 'galleries#ap_1',                  via: 'get',  as:  'ap_1'
    match 'ap2',              to: 'galleries#ap_2',                  via: 'get',  as:  'ap_2'
    match 'ap3',              to: 'galleries#ap_3',                  via: 'get',  as:  'ap_3'
    match 'ap4',              to: 'galleries#ap_4',                  via: 'get',  as:  'ap_4'
    match 'ap5',              to: 'galleries#ap_5',                  via: 'get',  as:  'ap_5'
    match 'ap6',              to: 'galleries#ap_6',                  via: 'get',  as:  'ap_6'
    match 'ap7',              to: 'galleries#ap_7',                  via: 'get',  as:  'ap_7'
    match 'ap8',              to: 'galleries#ap_8',                  via: 'get',  as:  'ap_8'
    match 'ap9',              to: 'galleries#ap_9',                  via: 'get',  as:  'ap_9'
    match 'ap10',              to: 'galleries#ap_10',                  via: 'get',  as:  'ap_10'
    match 'ap11',              to: 'galleries#ap_11',                  via: 'get',  as:  'ap_11'
    match 'ap12',              to: 'galleries#ap_12',                  via: 'get',  as:  'ap_12'
    match 'ap13',              to: 'galleries#ap_13',                  via: 'get',  as:  'ap_13'
    match 'ap14',              to: 'galleries#ap_14',                  via: 'get',  as:  'ap_14'
    

    match 'sp1',              to: 'galleries#sp_1',                  via: 'get',  as:  'sp_1'
    match 'sp2',              to: 'galleries#sp_2',                  via: 'get',  as:  'sp_2'
    match 'sp3',              to: 'galleries#sp_3',                  via: 'get',  as:  'sp_3'
    match 'sp4',              to: 'galleries#sp_4',                  via: 'get',  as:  'sp_4'
    match 'sp5',              to: 'galleries#sp_5',                  via: 'get',  as:  'sp_5'
    match 'sp6',              to: 'galleries#sp_6',                  via: 'get',  as:  'sp_6'
    match 'sp7',              to: 'galleries#sp_7',                  via: 'get',  as:  'sp_7'
    match 'sp8',              to: 'galleries#sp_8',                  via: 'get',  as:  'sp_8'
    match 'sp9',              to: 'galleries#sp_9',                  via: 'get',  as:  'sp_9'
    match 'sp10',              to: 'galleries#sp_10',                  via: 'get',  as:  'sp_10'
    match 'sp11',              to: 'galleries#sp_11',                  via: 'get',  as:  'sp_11'
    match 'sp12',              to: 'galleries#sp_12',                  via: 'get',  as:  'sp_12'
    match 'sp13',              to: 'galleries#sp_13',                  via: 'get',  as:  'sp_13'
    match 'sp14',              to: 'galleries#sp_14',                  via: 'get',  as:  'sp_14'
    match 'sp15',              to: 'galleries#sp_15',                  via: 'get',  as:  'sp_15'
    match 'sp16',              to: 'galleries#sp_16',                  via: 'get',  as:  'sp_16'
    match 'sp17',              to: 'galleries#sp_17',                  via: 'get',  as:  'sp_17'
    match 'sp18',              to: 'galleries#sp_18',                  via: 'get',  as:  'sp_18'
    match 'sp19',              to: 'galleries#sp_19',                  via: 'get',  as:  'sp_19'
    match 'sp20',              to: 'galleries#sp_20',                  via: 'get',  as:  'sp_20'
    match 'sp21',              to: 'galleries#sp_21',                  via: 'get',  as:  'sp_21'
    match 'sp22',              to: 'galleries#sp_22',                  via: 'get',  as:  'sp_22'
    match 'sp23',              to: 'galleries#sp_23',                  via: 'get',  as:  'sp_23'
    match 'sp24',              to: 'galleries#sp_24',                  via: 'get',  as:  'sp_24'
    match 'sp25',              to: 'galleries#sp_25',                  via: 'get',  as:  'sp_25'
    match 'sp26',              to: 'galleries#sp_26',                  via: 'get',  as:  'sp_26'
    match 'sp27',              to: 'galleries#sp_27',                  via: 'get',  as:  'sp_27'
    match 'sp28',              to: 'galleries#sp_28',                  via: 'get',  as:  'sp_28'
    match 'sp29',              to: 'galleries#sp_29',                  via: 'get',  as:  'sp_29'
    match 'sp30',              to: 'galleries#sp_30',                  via: 'get',  as:  'sp_30'
    match 'sp31',              to: 'galleries#sp_31',                  via: 'get',  as:  'sp_31'
    match 'sp32',              to: 'galleries#sp_32',                  via: 'get',  as:  'sp_32'
    match 'sp33',              to: 'galleries#sp_33',                  via: 'get',  as:  'sp_33'
    match 'sp34',              to: 'galleries#sp_34',                  via: 'get',  as:  'sp_34'
    match 'sp35',              to: 'galleries#sp_35',                  via: 'get',  as:  'sp_35'
    match 'sp36',              to: 'galleries#sp_36',                  via: 'get',  as:  'sp_36'
    match 'sp37',              to: 'galleries#sp_37',                  via: 'get',  as:  'sp_37'
    match 'sp38',              to: 'galleries#sp_38',                  via: 'get',  as:  'sp_38'
    match 'sp39',              to: 'galleries#sp_39',                  via: 'get',  as:  'sp_39'
    match 'sp40',              to: 'galleries#sp_40',                  via: 'get',  as:  'sp_40'

    match 'watches1',         to: 'galleries#watches_1',               via: 'get',  as:  'watches_1'
    match 'watches2',         to: 'galleries#watches_2',               via: 'get',  as:  'watches_2'
    match 'watches3',         to: 'galleries#watches_3',               via: 'get',  as:  'watches_3'
    match 'watches4',         to: 'galleries#watches_4',               via: 'get',  as:  'watches_4'
    match 'watches5',         to: 'galleries#watches_5',               via: 'get',  as:  'watches_5'
    match 'watches6',         to: 'galleries#watches_6',               via: 'get',  as:  'watches_6'
    match 'watches7',         to: 'galleries#watches_7',               via: 'get',  as:  'watches_7'
    match 'watches8',         to: 'galleries#watches_8',               via: 'get',  as:  'watches_8'
    match 'watches9',         to: 'galleries#watches_9',               via: 'get',  as:  'watches_9'
    match 'watches10',         to: 'galleries#watches_10',               via: 'get',  as:  'watches_10'
    match 'watches11',         to: 'galleries#watches_11',               via: 'get',  as:  'watches_11'
    match 'watches12',         to: 'galleries#watches_12',               via: 'get',  as:  'watches_12'
    match 'watches13',         to: 'galleries#watches_13',               via: 'get',  as:  'watches_13'
    match 'watches14',         to: 'galleries#watches_14',               via: 'get',  as:  'watches_14'
    match 'watches15',         to: 'galleries#watches_15',               via: 'get',  as:  'watches_15'
    match 'watches16',         to: 'galleries#watches_16',               via: 'get',  as:  'watches_16'
    match 'watches17',         to: 'galleries#watches_17',               via: 'get',  as:  'watches_17'
    match 'watches18',         to: 'galleries#watches_18',               via: 'get',  as:  'watches_18'
    match 'watches19',         to: 'galleries#watches_19',               via: 'get',  as:  'watches_19'
    match 'watches20',         to: 'galleries#watches_20',               via: 'get',  as:  'watches_20'
    match 'watches21',         to: 'galleries#watches_21',               via: 'get',  as:  'watches_21'
    match 'watches22',         to: 'galleries#watches_22',               via: 'get',  as:  'watches_22'
    match 'watches23',         to: 'galleries#watches_23',               via: 'get',  as:  'watches_23'
    match 'watches24',         to: 'galleries#watches_24',               via: 'get',  as:  'watches_24'
    match 'watches25',         to: 'galleries#watches_25',               via: 'get',  as:  'watches_25'
    match 'watches26',         to: 'galleries#watches_26',               via: 'get',  as:  'watches_26'
    match 'watches27',         to: 'galleries#watches_27',               via: 'get',  as:  'watches_27'
    match 'watches28',         to: 'galleries#watches_28',               via: 'get',  as:  'watches_28'
    match 'watches29',         to: 'galleries#watches_29',               via: 'get',  as:  'watches_29'
    match 'watches30',         to: 'galleries#watches_30',               via: 'get',  as:  'watches_30'
    match 'watches31',         to: 'galleries#watches_31',               via: 'get',  as:  'watches_31'

    match 'botanicalBook1',    to: 'galleries#botanical_book_1',         via: 'get',  as:  'botanical_book_1'
    match 'botanicalBook2',    to: 'galleries#botanical_book_2',         via: 'get',  as:  'botanical_book_2'
    match 'botanicalBook3',    to: 'galleries#botanical_book_3',         via: 'get',  as:  'botanical_book_3'
    match 'botanicalBook4',    to: 'galleries#botanical_book_4',         via: 'get',  as:  'botanical_book_4'
    match 'botanicalBook5',    to: 'galleries#botanical_book_5',         via: 'get',  as:  'botanical_book_5'
    match 'botanicalBook6',    to: 'galleries#botanical_book_6',         via: 'get',  as:  'botanical_book_6'
    match 'botanicalBook7',    to: 'galleries#botanical_book_7',         via: 'get',  as:  'botanical_book_7'
    match 'botanicalBook8',    to: 'galleries#botanical_book_8',         via: 'get',  as:  'botanical_book_8'
    match 'botanicalBook9',    to: 'galleries#botanical_book_9',         via: 'get',  as:  'botanical_book_9'
    match 'botanicalBook10',    to: 'galleries#botanical_book_10',         via: 'get',  as:  'botanical_book_10'
    match 'botanicalBook11',    to: 'galleries#botanical_book_11',         via: 'get',  as:  'botanical_book_11'

    match 'monoprints1',         to: 'galleries#monoprints_1',               via: 'get',  as:  'monoprints_1'
    match 'monoprints2',         to: 'galleries#monoprints_2',               via: 'get',  as:  'monoprints_2'
    match 'monoprints3',         to: 'galleries#monoprints_3',               via: 'get',  as:  'monoprints_3'
    match 'monoprints4',         to: 'galleries#monoprints_4',               via: 'get',  as:  'monoprints_4'
    match 'monoprints5',         to: 'galleries#monoprints_5',               via: 'get',  as:  'monoprints_5'
    match 'monoprints6',         to: 'galleries#monoprints_6',               via: 'get',  as:  'monoprints_6'
    match 'monoprints7',         to: 'galleries#monoprints_7',               via: 'get',  as:  'monoprints_7'
    match 'monoprints8',         to: 'galleries#monoprints_8',               via: 'get',  as:  'monoprints_8'

    match 'milan1',             to: 'galleries#milan_1',                   via: 'get',  as:  'milan_1'
    match 'milan2',             to: 'galleries#milan_2',                   via: 'get',  as:  'milan_2'
    match 'milan3',             to: 'galleries#milan_3',                   via: 'get',  as:  'milan_3'
    match 'milan4',             to: 'galleries#milan_4',                   via: 'get',  as:  'milan_4'
    match 'milan5',             to: 'galleries#milan_5',                   via: 'get',  as:  'milan_5'
    match 'milan6',             to: 'galleries#milan_6',                   via: 'get',  as:  'milan_6'
    match 'milan7',             to: 'galleries#milan_7',                   via: 'get',  as:  'milan_7'
    match 'milan8',             to: 'galleries#milan_8',                   via: 'get',  as:  'milan_8'
    match 'milan9',             to: 'galleries#milan_9',                   via: 'get',  as:  'milan_9'
    match 'milan10',             to: 'galleries#milan_10',                   via: 'get',  as:  'milan_10'

    match 'bodies1',             to: 'galleries#bodies_1',                   via: 'get',  as:  'bodies_1'
    match 'bodies2',             to: 'galleries#bodies_2',                   via: 'get',  as:  'bodies_2'
    match 'bodies3',             to: 'galleries#bodies_3',                   via: 'get',  as:  'bodies_3'
    match 'bodies4',             to: 'galleries#bodies_4',                   via: 'get',  as:  'bodies_4'
    match 'bodies5',             to: 'galleries#bodies_5',                   via: 'get',  as:  'bodies_5'
    match 'bodies6',             to: 'galleries#bodies_6',                   via: 'get',  as:  'bodies_6'
    match 'bodies7',             to: 'galleries#bodies_7',                   via: 'get',  as:  'bodies_7'
    match 'bodies8',             to: 'galleries#bodies_8',                   via: 'get',  as:  'bodies_8'
    match 'bodies9',             to: 'galleries#bodies_9',                   via: 'get',  as:  'bodies_9'
    
#crit pages
    match 'crit1',               to: 'pages#crit1',                          via: 'get',  as:  'crit1'
    match 'crit2',               to: 'pages#crit2',                          via: 'get',  as:  'crit2'
    match 'crit3',               to: 'pages#crit3',                          via: 'get',  as:  'crit3'
    match 'crit4',               to: 'pages#crit4',                          via: 'get',  as:  'crit4'
    match 'crit5',               to: 'pages#crit5',                          via: 'get',  as:  'crit5'
    match 'crit6',               to: 'pages#crit6',                          via: 'get',  as:  'crit6'
    match 'crit7',               to: 'pages#crit7',                          via: 'get',  as:  'crit7'
    match 'crit8',               to: 'pages#crit8',                          via: 'get',  as:  'crit8'

  match 'jewelry',               to: 'jewelry#index',                        via: 'get',  as: 'jewelry'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

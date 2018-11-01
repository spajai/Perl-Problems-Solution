use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More;
use Test::Exception;
use Data::Dumper;

my $class = 'oDesk::Parser::ProgrammingLanguages::Wikipedia';
my $default_url = 'http://en.wikipedia.org/wiki/List_of_programming_languages';

my $expected_data = [
          'A# .NET',
          'A# (Axiom)',
          'A-0 System',
          'A+',
          'A++',
          'ABAP',
          'ABC',
          'ABC ALGOL',
          'ABSET',
          'ABSYS',
          'ACC',
          'Accent',
          'Ace DASL (Distributed Application Specification Language)',
          'ACL2',
          'ACT-III',
          'Action!',
          'ActionScript',
          'Actor',
          'Ada',
          'Adenine',
          'Agda',
          'Agilent VEE',
          'Agora',
          'AIMMS',
          'Aldor',
          'Alef',
          'ALF',
          'ALGOL 58',
          'ALGOL 60',
          'ALGOL 68',
          'ALGOL W',
          'Alice',
          'Alma-0',
          'AmbientTalk',
          'Amiga E',
          'AMOS',
          'AMPL',
          'AngelScript',
          'Apex',
          'APL',
          'App Inventor for Android\'s visual block language',
          'AppleScript',
          'APT',
          'Arc',
          'ARexx',
          'Argus',
          'AspectJ',
          'Assembly language',
          'ATS',
          'Ateji PX',
          'AutoHotkey',
          'Autocoder',
          'AutoIt',
          'AutoLISP / Visual LISP',
          'Averest',
          'AWK',
          'Axum',
          'Active Server Pages',
          'B',
          'Babbage',
          'Bash',
          'BASIC',
          'bc',
          'BCPL',
          'BeanShell',
          'Batch (Windows/Dos)',
          'Bertrand',
          'BETA',
          'BLISS',
          'Blockly',
          'BlooP',
          'Boo',
          'Boomerang',
          'Bourne shell',
          'bash',
          'ksh',
          'BPEL',
          'Business Basic',
          'C',
          'C--',
          'C++',
          'C#',
          'C/AL',
          'Caché ObjectScript',
          ' C Shell (csh)',
          'Caml',
          'Calcpad',
          'Cayenne',
          'CDuce',
          'Cecil',
          'Cesil',
          'Céu',
          'Ceylon',
          'CFEngine',
          'Cg',
          'Ch',
          'Chapel',
          'Charity',
          'Charm',
          'CHILL',
          'CHIP-8',
          'chomski',
          'ChucK',
          'Cilk',
          'Citrine',
          'CL',
          'Claire',
          'Clarion',
          'Clean',
          'Clipper',
          'CLIPS',
          'CLIST',
          'Clojure',
          'CLU',
          'CMS-2',
          'COBOL',
          'CobolScript',
          'Cobra',
          'CoffeeScript',
          'ColdFusion',
          'COMAL',
          'Combined Programming Language',
          'COMIT',
          'Common Intermediate Language',
          'Common Lisp',
          'COMPASS',
          'Component Pascal',
          'Constraint Handling Rules',
          'COMTRAN',
          'Cool',
          'Coq',
          'Coral 66',
          'CorVision',
          'COWSEL',
          'CPL',
          'Cryptol',
          ' Crystal',
          'Csound',
          'CSP',
          'CUDA',
          'Cuneiform',
          'Curl',
          'Curry',
          'Cybil',
          'Cyclone',
          'Cython',
          'D',
          'DASL',
          'Dart',
          'Darwin',
          'DataFlex',
          'Datalog',
          'DATATRIEVE',
          'dBase',
          'dc',
          'DCL',
          'Delphi',
          'DinkC',
          'DIBOL',
          'Dog',
          'Draco',
          'DRAKON',
          'Dylan',
          'DYNAMO',
          'DAX (Data Analysis Expressions)',
          'E',
          'Ease',
          'Easy PL/I',
          'EASYTRIEVE PLUS',
          'eC',
          'ECMAScript',
          'Edinburgh IMP',
          'EGL',
          'Eiffel',
          'ELAN',
          'Elixir',
          'Elm',
          'Emacs Lisp',
          'Emerald',
          'Epigram',
          ' EPL (Easy Programming Language)',
          ' EPL (Eltron Programming Language)',
          'Erlang',
          'es',
          'Escher',
          'ESPOL',
          'Esterel',
          'Etoys',
          'Euclid',
          'Euler',
          'Euphoria',
          'EusLisp Robot Programming Language',
          'CMS EXEC',
          'EXEC 2',
          'Executable UML',
          'F',
          'F#',
          'F*',
          'Factor',
          'Falcon',
          'Fantom',
          'FAUST',
          'FFP',
          'Fjölnir',
          'FL',
          'Flavors',
          'Flex',
          'FlooP',
          'FLOW-MATIC',
          'FOCAL',
          'FOCUS',
          'FOIL',
          'FORMAC',
          '@Formula',
          'Forth',
          'Fortran',
          'Fortress',
          'FoxBase',
          'FoxPro',
          'FP',
          'Franz Lisp',
          'Frege',
          'F-Script',
          'G',
          'Game Maker Language',
          'GameMonkey Script',
          'GAMS',
          'GAP',
          'G-code',
          'GDScript',
          'Genie',
          'GDL',
          'GJ',
          'GEORGE',
          'GLSL',
          'GNU E',
          'GM',
          'Go',
          'Go!',
          'GOAL',
          'Gödel',
          'Golo',
          'GOM (Good Old Mad)',
          'Google Apps Script',
          'Gosu',
          'GOTRAN',
          'GPSS',
          'GraphTalk',
          'GRASS',
          'Groovy',
          'Hack',
          'HAGGIS',
          'HAL/S',
          'Halide (programming language)',
          'Hamilton C shell',
          'Harbour',
          'Hartmann pipelines',
          'Haskell',
          'Haxe',
          'Hermes',
          'High Level Assembly',
          'HLSL',
          'Hop',
          'Hopscotch',
          'Hope',
          'Hugo',
          'Hume',
          'HyperTalk',
          'Hexa',
          'Io',
          'Icon (programming language)',
          'IBM Basic assembly language',
          'IBM BASICA',
          'IBM HAScript',
          'IBM Informix-4GL',
          'IBM RPG',
          'IDL',
          'J',
          'J#',
          'J++',
          'JADE',
          'JAL',
          'Janus (concurrent constraint programming language)',
          'Janus (time-reversible computing programming language)',
          'JASS',
          'Java',
          'JavaScript',
          'JCL',
          'JEAN',
          'Join Java',
          'JOSS',
          'Joule',
          'JOVIAL',
          'Joy',
          'JScript',
          'JScript .NET',
          'JavaFX Script',
          'jq',
          'Julia',
          'Jython',
          'K',
          'Kaleidoscope',
          'Karel',
          'Karel++',
          'KEE',
          'Kixtart',
          'Klerer-May System',
          'KIF',
          'Kojo',
          'Kotlin',
          'KRC',
          'KRL',
          'KUKA Robot Language',
          'KRYPTON',
          'ksh',
          'Kodu',
          'Kv',
          'LabVIEW',
          'Ladder',
          'Lagoona',
          'LANSA',
          'Lasso',
          'LaTeX',
          'Lava',
          'LC-3',
          'Leda',
          'Legoscript',
          'LIL',
          'LilyPond',
          'Limbo',
          'Limnor',
          'LINC',
          'Lingo',
          'LIS',
          'LISA',
          'Lisp',
          'Lite-C',
          'Lithe',
          'Little b',
          'LLL',
          'Logo',
          'Logtalk',
          'LotusScript',
          'LPC',
          'LSE',
          'LSL',
          'LiveCode',
          'LiveScript',
          'Lua',
          'Lucid',
          'Lustre',
          'LYaPAS',
          'Lynx',
          'M',
          'M2001',
          'M4',
          'M#',
          'Machine code',
          'MAD',
          'MAD/I',
          'Magik',
          'Magma',
          'make',
          'Maude system',
          'Maple',
          'MAPPER',
          'MARK-IV',
          'Mary',
          'MASM Microsoft Assembly x86',
          'MATH-MATIC',
          'Mathematica',
          'MATLAB',
          'Maxima',
          'Macsyma',
          'Max',
          'MaxScript',
          'Maya (MEL)',
          'MDL',
          'Mercury',
          'Mesa',
          'Metafont',
          'MetaQuotes Language (MQL4/MQL5)',
          'MHEG-5 (Interactive TV programming language)',
          'Microcode',
          'MicroScript',
          'MIIS',
          'Milk (programming language)',
          'MIMIC',
          'Mirah',
          'Miranda',
          'MIVA Script',
          'ML',
          'Model 204',
          'Modelica',
          'Modula',
          'Modula-2',
          'Modula-3',
          'Mohol',
          'MOO',
          'Mortran',
          'Mouse',
          'MPD',
          'Mathcad',
          'CIL',
          'MSL',
          'MUMPS',
          'MuPAD',
          'Mutan',
          'Mystic Programming Language',
          'NASM',
          'Napier88',
          'Neko',
          'Nemerle',
          'nesC',
          'NESL',
          'Net.Data',
          'NetLogo',
          'NetRexx',
          'NewLISP',
          'NEWP',
          'Newspeak',
          'NewtonScript',
          'Nial',
          'Nice',
          'Nickle',
          'NITIN',
          'Nim',
          'NPL',
          'Not eXactly C',
          'Not Quite C',
          'NSIS',
          'Nu',
          'NWScript',
          'NXT-G',
          'o:XML',
          'Oak',
          'Oberon',
          'OBJ2',
          'Object Lisp',
          'ObjectLOGO',
          'Object REXX',
          'Object Pascal',
          'Objective-C',
          'Objective-J',
          'Obliq',
          'OCaml',
          'occam',
          'occam-π',
          'Octave',
          'OmniMark',
          'Onyx',
          'Opa',
          'Opal',
          'OpenCL',
          'OpenEdge ABL',
          'OPL',
          'OpenVera',
          'OPS5',
          'OptimJ',
          'Orc',
          'ORCA/Modula-2',
          'Oriel',
          'Orwell',
          'Oxygene',
          'Oz',
          'P',
          'P4',
          'P′′',
          'ParaSail (programming language)',
          'PARI/GP',
          'Pascal',
          'PCASTL',
          'PCF',
          'PEARL',
          'PeopleCode',
          'Perl',
          'PDL',
          'Perl 6',
          'Pharo',
          'PHP',
          'Pico',
          'Picolisp',
          'Pict',
          'Pig (programming tool)',
          'Pike',
          'PIKT',
          'PILOT',
          'Pipelines',
          'Pizza',
          'PL-11',
          'PL/0',
          'PL/B',
          'PL/C',
          'PL/I',
          'PL/M',
          'PL/P',
          'PL/SQL',
          'PL360',
          'PLANC',
          'munoz',
          'Plankalkül',
          'Planner',
          'PLEX',
          'PLEXIL',
          'Plus',
          'POP-11',
          'POP-2',
          'PostScript',
          'PortablE',
          'Powerhouse',
          'PowerBuilder',
          'PowerShell',
          'PPL',
          'Processing',
          'Processing.js',
          'Prograph',
          'PROIV',
          'Prolog',
          'PROMAL',
          'Promela',
          'PROSE modeling language',
          'PROTEL',
          'ProvideX',
          'Pro*C',
          'Pure',
          'PureBasic',
          'Pure Data',
          'Python',
          'Q (equational programming language)',
          'Q (programming language from Kx Systems)',
          'Q# (Microsoft programming language)',
          'Qalb',
          'QtScript',
          'QuakeC',
          'QPL',
          'R',
          'R++',
          'Racket',
          'RAPID',
          'Rapira',
          'Ratfiv',
          'Ratfor',
          'rc',
          'REBOL',
          'Red',
          'Redcode',
          'REFAL',
          'Reia',
          'REXX',
          'Ring',
          'Rlab',
          'ROOP',
          'RPG',
          'RPL',
          'RSL',
          'RTL/2',
          'Ruby',
          'RuneScript',
          'Rust',
          'S',
          'S2',
          'S3',
          'S-Lang',
          'S-PLUS',
          'SA-C',
          'SabreTalk',
          'SAIL',
          'SALSA',
          'SAM76',
          'SAS',
          'SASL',
          'Sather',
          'Sawzall',
          'SBL',
          'Scala',
          'Scheme',
          'Scilab',
          'Script.NET',
          'Sed',
          'Seed7',
          'Self',
          'SenseTalk',
          'SequenceL',
          'Serpent',
          'SETL',
          'SIMPOL',
          'SIGNAL',
          'SiMPLE',
          'SIMSCRIPT',
          'Simula',
          'Simulink',
          'Singularity',
          'SISAL',
          'SLIP',
          'SMALL',
          'Scratch',
          'Smalltalk',
          'SML',
          'Strongtalk',
          'Snap!',
          'SNOBOL',
          'SPITBOL',
          'Snowball',
          'SOL',
          'Solidity',
          'SOPHAEROS',
          'SPARK',
          'Speedcode',
          'SPIN',
          'SP/k',
          'SPS',
          'SQL',
          'SQR',
          'Squeak',
          'Squirrel',
          'SR',
          'S/SL',
          'Stackless Python',
          'Starlogo',
          'Strand',
          'Stata',
          'Stateflow',
          'Subtext',
          'SuperCollider',
          'SuperTalk',
          'Swift (Apple programming language)',
          'Swift (parallel scripting language)',
          'SYMPL',
          'SystemVerilog',
          'T',
          'TACL',
          'TACPOL',
          'TADS',
          'TAL',
          'Tcl',
          'Tea',
          'TECO',
          'TELCOMP',
          'TeX',
          'TEX',
          'TIE',
          'Timber',
          'TMG',
          'Tom',
          'TOM',
          'Toi',
          'Topspeed',
          'TPU',
          'Trac',
          'TTM',
          'T-SQL',
          'Transcript',
          'TTCN',
          'Turing',
          'TUTOR',
          'TXL',
          'TypeScript',
          'Tynker',
          'Ubercode',
          'UCSD Pascal',
          'Umple',
          'Unicon',
          'Uniface',
          'UNITY',
          'Unix shell',
          'UnrealScript',
          'Vala',
          'Verilog',
          'VHDL',
          'Viper',
          'Visual Basic',
          'Visual Basic .NET',
          'Visual DataFlex',
          'Visual DialogScript',
          'Visual Fortran',
          'Visual FoxPro',
          'Visual J++',
          'Visual J#',
          'Visual LISP',
          'Visual Objects',
          'Visual Prolog',
          'VSXu',
          'vvvv',
          'WATFIV, WATFOR',
          'WebDNA',
          'WebQL',
          'Whiley',
          'Winbatch',
          'Wolfram Language',
          'Wyvern',
          'X++',
          'X10',
          'XBL',
          'XC',
          'XMOS architecture',
          'xHarbour',
          'XL',
          'Xojo',
          'XOTcl',
          'XOD (programming language)',
          'XPL',
          'XPL0',
          'XQuery',
          'XSB',
          'XSharp',
          'XSLT',
          'XPath',
          'Xtend',
          'Yorick',
          'YQL',
          'Yoix',
          'Z notation',
          'Zebra, ZPL, ZPL2',
          'Zeno',
          'ZetaLisp',
          'ZOPL',
          'Zsh',
          'ZPL',
          'Z++'
        ];

my $expected_anagrams = [
          'BASH',
          'COMAL',
          'CPL',
          'GOLO',
          'HAXE',
          'HEXA',
          'KSH',
          'LAVA',
          'LISA',
          'LISP',
          'LOGO',
          'LPC',
          'MSL',
          'OCAML',
          'SAIL',
          'SLIP',
          'SML',
          'TEX',
          'TOM',
          'VALA'
        ];

use_ok($class);

{
  my $parser = $class->new;
  isa_ok($parser, $class);

  # test default value of 'url' attribute
  cmp_ok($parser->url, 'eq', $default_url, 'default url attribute');
}

{
  my $google_url = 'http://www.google.com';

  my $parser = $class->new(url => $google_url);
  isa_ok($parser, $class);

  cmp_ok($parser->url, 'eq', $google_url, 'passed url attribute');
}


{
  my $parser = $class->new;

  my $aref = $parser->get_data;
  cmp_ok(ref $aref, 'eq', 'ARRAY', 'get_data - scalar context');

  my @array = $parser->get_data;
  is_deeply(\@array, $expected_data, 'get_data - list context');
}

# BONUS POINTS - get_anagrams
# if you want to write this method, uncomment this test case
{
  my $parser = $class->new;
  
  my $aref = $parser->get_anagrams;
  is_deeply($aref, $expected_anagrams, 'get_anagrams');
}


done_testing();

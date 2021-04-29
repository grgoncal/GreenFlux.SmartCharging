�z
�C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Infrastructure\Repositories\ChargeStationRepository.cs
	namespace

 	
	GreenFlux


 
.

 
SmartCharging

 !
.

! "
Infrastructure

" 0
.

0 1
Repositories

1 =
{ 
public 

class #
ChargeStationRepository (
:) *$
IChargeStationRepository+ C
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public #
ChargeStationRepository &
(& '
IConfiguration' 5
configuration6 C
)C D
{ 	
_configuration 
= 
configuration *
;* +
} 	
public 
List 
< 
ChargeStation !
>! " 
GetAllChargeStations# 7
(7 8
)8 9
{ 	
var 
query 
= 
$@" =
1SELECT * FROM gf_smartcharging.`charge-stations`; L
"L M
;M N
var 
chargeStationList !
=" #
new$ '
List( ,
<, -
ChargeStation- :
>: ;
(; <
)< =
;= >
var 
connectionString  
=! "
_configuration# 1
[1 2
$str2 W
]W X
;X Y
using 
( 
var 

connection !
=" #
new$ '
MySqlConnection( 7
(7 8
connectionString8 H
)H I
)I J
{ 
if 
( 

connection 
. 
State $
!=% '
ConnectionState( 7
.7 8
Open8 <
)< =

connection   
.   
Open   #
(  # $
)  $ %
;  % &
using"" 
("" 
var"" 
command"" "
=""# $
new""% (
MySqlCommand"") 5
(""5 6
query""6 ;
,""; <

connection""= G
)""G H
)""H I
{## 
var$$ 
reader$$ 
=$$  
command$$! (
.$$( )
ExecuteReader$$) 6
($$6 7
)$$7 8
;$$8 9
while%% 
(%% 
reader%% !
.%%! "
Read%%" &
(%%& '
)%%' (
)%%( )
{&& 
var'' 
chargeStation'' )
=''* +
new'', /
ChargeStation''0 =
(''= >
)''> ?
;''? @
chargeStation)) %
.))% &
Id))& (
=))) *
Convert))+ 2
.))2 3
ToInt64))3 :
()): ;
reader)); A
[))A B
$str))B F
]))F G
)))G H
;))H I
chargeStation** %
.**% &
Name**& *
=**+ ,
(**- .
string**. 4
)**4 5
reader**5 ;
[**; <
$str**< B
]**B C
;**C D
chargeStation++ %
.++% &
GroupId++& -
=++. /
Convert++0 7
.++7 8
ToInt64++8 ?
(++? @
reader++@ F
[++F G
$str++G P
]++P Q
)++Q R
;++R S
chargeStationList-- )
.--) *
Add--* -
(--- .
chargeStation--. ;
)--; <
;--< =
}.. 
}// 
}00 
return22 
chargeStationList22 $
;22$ %
}33 	
public55 
void55 
CreateChargeStation55 '
(55' (
ChargeStation55( 5
chargeStation556 C
)55C D
{66 	
var77 
query77 
=77 
@$"77 �
�INSERT INTO gf_smartcharging.`charge-stations`
                               (Name, GroupId)
                           VALUES
                               (@Name, @GroupId);
                           SELECT LAST_INSERT_ID()7; 2
";;2 3
;;;3 4
var>> 
connectionString>>  
=>>! "
_configuration>># 1
[>>1 2
$str>>2 W
]>>W X
;>>X Y
using?? 
(?? 
var?? 

connection?? !
=??" #
new??$ '
MySqlConnection??( 7
(??7 8
connectionString??8 H
)??H I
)??I J
{@@ 
ifAA 
(AA 

connectionAA 
.AA 
StateAA $
!=AA% '
ConnectionStateAA( 7
.AA7 8
OpenAA8 <
)AA< =

connectionBB 
.BB 
OpenBB #
(BB# $
)BB$ %
;BB% &
usingDD 
(DD 
varDD 
commandDD "
=DD# $
newDD% (
MySqlCommandDD) 5
(DD5 6
queryDD6 ;
,DD; <

connectionDD= G
)DDG H
)DDH I
{EE 
commandFF 
.FF 

ParametersFF &
.FF& '
AddWithValueFF' 3
(FF3 4
$strFF4 ;
,FF; <
chargeStationFF= J
.FFJ K
NameFFK O
)FFO P
;FFP Q
commandGG 
.GG 

ParametersGG &
.GG& '
AddWithValueGG' 3
(GG3 4
$strGG4 >
,GG> ?
chargeStationGG@ M
.GGM N
GroupIdGGN U
)GGU V
;GGV W
chargeStationII !
.II! "
IdII" $
=II% &
ConvertII' .
.II. /
ToInt64II/ 6
(II6 7
commandII7 >
.II> ?
ExecuteScalarII? L
(IIL M
)IIM N
)IIN O
;IIO P
}JJ 
}KK 
}LL 	
publicNN 
ChargeStationNN  
GetChargeStationByIdNN 1
(NN1 2
longNN2 6
chargeStationIdNN7 F
)NNF G
{OO 	
varPP 
queryPP 
=PP 
$@"PP h
\SELECT * FROM gf_smartcharging.`charge-stations`
                           WHERE Id = @Id;PQ *
"QQ* +
;QQ+ ,
varSS 
chargeStationSS 
=SS 
newSS  #
ChargeStationSS$ 1
(SS1 2
)SS2 3
;SS3 4
varVV 
connectionStringVV  
=VV! "
_configurationVV# 1
[VV1 2
$strVV2 W
]VVW X
;VVX Y
usingWW 
(WW 
varWW 

connectionWW !
=WW" #
newWW$ '
MySqlConnectionWW( 7
(WW7 8
connectionStringWW8 H
)WWH I
)WWI J
{XX 
ifYY 
(YY 

connectionYY 
.YY 
StateYY $
!=YY% '
ConnectionStateYY( 7
.YY7 8
OpenYY8 <
)YY< =

connectionZZ 
.ZZ 
OpenZZ #
(ZZ# $
)ZZ$ %
;ZZ% &
using\\ 
(\\ 
var\\ 
command\\ "
=\\# $
new\\% (
MySqlCommand\\) 5
(\\5 6
query\\6 ;
,\\; <

connection\\= G
)\\G H
)\\H I
{]] 
command^^ 
.^^ 

Parameters^^ &
.^^& '
AddWithValue^^' 3
(^^3 4
$str^^4 9
,^^9 :
chargeStationId^^; J
)^^J K
;^^K L
var`` 
reader`` 
=``  
command``! (
.``( )
ExecuteReader``) 6
(``6 7
)``7 8
;``8 9
ifaa 
(aa 
readeraa 
.aa 
Readaa #
(aa# $
)aa$ %
)aa% &
{bb 
chargeStationcc %
.cc% &
Idcc& (
=cc) *
Convertcc+ 2
.cc2 3
ToInt64cc3 :
(cc: ;
readercc; A
[ccA B
$strccB F
]ccF G
)ccG H
;ccH I
chargeStationdd %
.dd% &
Namedd& *
=dd+ ,
(dd- .
stringdd. 4
)dd4 5
readerdd5 ;
[dd; <
$strdd< B
]ddB C
;ddC D
chargeStationee %
.ee% &
GroupIdee& -
=ee. /
Convertee0 7
.ee7 8
ToInt64ee8 ?
(ee? @
readeree@ F
[eeF G
$streeG P
]eeP Q
)eeQ R
;eeR S
}ff 
}gg 
}hh 
returnjj 
chargeStationjj  
;jj  !
}kk 	
publicmm 
Listmm 
<mm 
ChargeStationmm !
>mm! ")
GetChargeStationListByGroupIdmm# @
(mm@ A
longmmA E
groupIdmmF M
)mmM N
{nn 	
varoo 
queryoo 
=oo 
$@"oo r
fSELECT * FROM gf_smartcharging.`charge-stations`
                           WHERE GroupId = @GroupId;op 4
"pp4 5
;pp5 6
varrr 
chargeStationListrr !
=rr" #
newrr$ '
Listrr( ,
<rr, -
ChargeStationrr- :
>rr: ;
(rr; <
)rr< =
;rr= >
varuu 
connectionStringuu  
=uu! "
_configurationuu# 1
[uu1 2
$struu2 W
]uuW X
;uuX Y
usingvv 
(vv 
varvv 

connectionvv !
=vv" #
newvv$ '
MySqlConnectionvv( 7
(vv7 8
connectionStringvv8 H
)vvH I
)vvI J
{ww 
ifxx 
(xx 

connectionxx 
.xx 
Statexx $
!=xx% '
ConnectionStatexx( 7
.xx7 8
Openxx8 <
)xx< =

connectionyy 
.yy 
Openyy #
(yy# $
)yy$ %
;yy% &
using{{ 
({{ 
var{{ 
command{{ "
={{# $
new{{% (
MySqlCommand{{) 5
({{5 6
query{{6 ;
,{{; <

connection{{= G
){{G H
){{H I
{|| 
command}} 
.}} 

Parameters}} &
.}}& '
AddWithValue}}' 3
(}}3 4
$str}}4 >
,}}> ?
groupId}}@ G
)}}G H
;}}H I
var 
reader 
=  
command! (
.( )
ExecuteReader) 6
(6 7
)7 8
;8 9
while
�� 
(
�� 
reader
�� !
.
��! "
Read
��" &
(
��& '
)
��' (
)
��( )
{
�� 
var
�� 
chargeStation
�� )
=
��* +
new
��, /
ChargeStation
��0 =
(
��= >
)
��> ?
;
��? @
chargeStation
�� %
.
��% &
Id
��& (
=
��) *
Convert
��+ 2
.
��2 3
ToInt64
��3 :
(
��: ;
reader
��; A
[
��A B
$str
��B F
]
��F G
)
��G H
;
��H I
chargeStation
�� %
.
��% &
Name
��& *
=
��+ ,
(
��- .
string
��. 4
)
��4 5
reader
��5 ;
[
��; <
$str
��< B
]
��B C
;
��C D
chargeStation
�� %
.
��% &
GroupId
��& -
=
��. /
Convert
��0 7
.
��7 8
ToInt64
��8 ?
(
��? @
reader
��@ F
[
��F G
$str
��G P
]
��P Q
)
��Q R
;
��R S
chargeStationList
�� )
.
��) *
Add
��* -
(
��- .
chargeStation
��. ;
)
��; <
;
��< =
}
�� 
}
�� 
}
�� 
return
�� 
chargeStationList
�� $
;
��$ %
}
�� 	
public
�� 
void
�� !
DeleteChargeStation
�� '
(
��' (
ChargeStation
��( 5
chargeStation
��6 C
)
��C D
{
�� 	
var
�� 
query
�� 
=
�� 
$@"
�� h
ZDELETE FROM gf_smartcharging.`charge-stations`
                           WHERE Id = @Id;
�� *
"
��* +
;
��+ ,
var
�� 
connectionString
��  
=
��! "
_configuration
��# 1
[
��1 2
$str
��2 W
]
��W X
;
��X Y
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
new
��$ '
MySqlConnection
��( 7
(
��7 8
connectionString
��8 H
)
��H I
)
��I J
{
�� 
if
�� 
(
�� 

connection
�� 
.
�� 
State
�� $
!=
��% '
ConnectionState
��( 7
.
��7 8
Open
��8 <
)
��< =

connection
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
using
�� 
(
�� 
var
�� 
command
�� "
=
��# $
new
��% (
MySqlCommand
��) 5
(
��5 6
query
��6 ;
,
��; <

connection
��= G
)
��G H
)
��H I
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
AddWithValue
��' 3
(
��3 4
$str
��4 9
,
��9 :
chargeStation
��; H
.
��H I
Id
��I K
)
��K L
;
��L M
command
�� 
.
�� 
ExecuteNonQuery
�� +
(
��+ ,
)
��, -
;
��- .
}
�� 
}
�� 
}
�� 	
public
�� 
void
�� !
UpdateChargeStation
�� '
(
��' (
ChargeStation
��( 5
chargeStation
��6 C
)
��C D
{
�� 	
var
�� 
query
�� 
=
�� 
$@"
�� e
WUPDATE gf_smartcharging.`charge-stations`
                           SET Name = @Name;
�� ,
"
��, -
;
��- .
var
�� 
connectionString
��  
=
��! "
_configuration
��# 1
[
��1 2
$str
��2 W
]
��W X
;
��X Y
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
new
��$ '
MySqlConnection
��( 7
(
��7 8
connectionString
��8 H
)
��H I
)
��I J
{
�� 
if
�� 
(
�� 

connection
�� 
.
�� 
State
�� $
!=
��% '
ConnectionState
��( 7
.
��7 8
Open
��8 <
)
��< =

connection
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
using
�� 
(
�� 
var
�� 
command
�� "
=
��# $
new
��% (
MySqlCommand
��) 5
(
��5 6
query
��6 ;
,
��; <

connection
��= G
)
��G H
)
��H I
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
AddWithValue
��' 3
(
��3 4
$str
��4 ;
,
��; <
chargeStation
��= J
.
��J K
Name
��K O
)
��O P
;
��P Q
command
�� 
.
�� 
ExecuteNonQuery
�� +
(
��+ ,
)
��, -
;
��- .
}
�� 
}
�� 
}
�� 	
}
�� 
}�� ��
�C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Infrastructure\Repositories\ConnectorRepository.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Infrastructure" 0
.0 1
Repositories1 =
{ 
public 

class 
ConnectorRepository $
:% & 
IConnectorRepository' ;
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
ConnectorRepository "
(" #
IConfiguration# 1
configuration2 ?
)? @
{ 	
_configuration 
= 
configuration *
;* +
} 	
public 
void 
CreateConnector #
(# $
	Connector$ -
	connector. 7
)7 8
{ 	
var 
query 
= 
$@" �
�INSERT INTO gf_smartcharging.connectors
                               (MaxCurrent, ChargeStationId)
                           VALUES
                               (@MaxCurrent, @ChargeStationId);
                           SELECT LAST_INSERT_ID() 2
"2 3
;3 4
var 
connectionString  
=! "
_configuration# 1
[1 2
$str2 W
]W X
;X Y
using 
( 
var 

connection !
=" #
new$ '
MySqlConnection( 7
(7 8
connectionString8 H
)H I
)I J
{   
if!! 
(!! 

connection!! 
.!! 
State!! $
!=!!% '
ConnectionState!!( 7
.!!7 8
Open!!8 <
)!!< =

connection"" 
."" 
Open"" #
(""# $
)""$ %
;""% &
using$$ 
($$ 
var$$ 
command$$ "
=$$# $
new$$% (
MySqlCommand$$) 5
($$5 6
query$$6 ;
,$$; <

connection$$= G
)$$G H
)$$H I
{%% 
command&& 
.&& 

Parameters&& &
.&&& '
AddWithValue&&' 3
(&&3 4
$str&&4 A
,&&A B
	connector&&C L
.&&L M

MaxCurrent&&M W
)&&W X
;&&X Y
command'' 
.'' 

Parameters'' &
.''& '
AddWithValue''' 3
(''3 4
$str''4 F
,''F G
	connector''H Q
.''Q R
ChargeStationId''R a
)''a b
;''b c
	connector)) 
.)) 
Id))  
=))! "
Convert))# *
.))* +
ToInt64))+ 2
())2 3
command))3 :
.)): ;
ExecuteScalar)); H
())H I
)))I J
)))J K
;))K L
}** 
}++ 
},, 	
public.. 
void.. 
UpdateConnector.. #
(..# $
	Connector..$ -
	connector... 7
)..7 8
{// 	
var00 
query00 
=00 
$@"00 �
�UPDATE gf_smartcharging.connectors
                           SET MaxCurrent = @MaxCurrent
                           WHERE Id = @Id;02 *
"22* +
;22+ ,
var44 
connectionString44  
=44! "
_configuration44# 1
[441 2
$str442 W
]44W X
;44X Y
using55 
(55 
var55 

connection55 !
=55" #
new55$ '
MySqlConnection55( 7
(557 8
connectionString558 H
)55H I
)55I J
{66 
if77 
(77 

connection77 
.77 
State77 $
!=77% '
ConnectionState77( 7
.777 8
Open778 <
)77< =

connection88 
.88 
Open88 #
(88# $
)88$ %
;88% &
using:: 
(:: 
var:: 
command:: "
=::# $
new::% (
MySqlCommand::) 5
(::5 6
query::6 ;
,::; <

connection::= G
)::G H
)::H I
{;; 
command<< 
.<< 

Parameters<< &
.<<& '
AddWithValue<<' 3
(<<3 4
$str<<4 9
,<<9 :
	connector<<; D
.<<D E
Id<<E G
)<<G H
;<<H I
command== 
.== 

Parameters== &
.==& '
AddWithValue==' 3
(==3 4
$str==4 A
,==A B
	connector==C L
.==L M

MaxCurrent==M W
)==W X
;==X Y
command?? 
.?? 
ExecuteNonQuery?? +
(??+ ,
)??, -
;??- .
}@@ 
}AA 
}BB 	
publicDD 
	ConnectorDD 
GetConnectorByIdDD )
(DD) *
longDD* .
idDD/ 1
)DD1 2
{EE 	
varFF 
queryFF 
=FF 
$@"FF a
USELECT * FROM gf_smartcharging.connectors
                           WHERE Id = @Id;FG *
"GG* +
;GG+ ,
varII 
	connectorII 
=II 
newII 
	ConnectorII  )
(II) *
)II* +
;II+ ,
varKK 
connectionStringKK  
=KK! "
_configurationKK# 1
[KK1 2
$strKK2 W
]KKW X
;KKX Y
usingLL 
(LL 
varLL 

connectionLL !
=LL" #
newLL$ '
MySqlConnectionLL( 7
(LL7 8
connectionStringLL8 H
)LLH I
)LLI J
{MM 
ifNN 
(NN 

connectionNN 
.NN 
StateNN $
!=NN% '
ConnectionStateNN( 7
.NN7 8
OpenNN8 <
)NN< =

connectionOO 
.OO 
OpenOO #
(OO# $
)OO$ %
;OO% &
usingQQ 
(QQ 
varQQ 
commandQQ "
=QQ# $
newQQ% (
MySqlCommandQQ) 5
(QQ5 6
queryQQ6 ;
,QQ; <

connectionQQ= G
)QQG H
)QQH I
{RR 
commandSS 
.SS 

ParametersSS &
.SS& '
AddWithValueSS' 3
(SS3 4
$strSS4 9
,SS9 :
idSS; =
)SS= >
;SS> ?
varUU 
readerUU 
=UU  
commandUU! (
.UU( )
ExecuteReaderUU) 6
(UU6 7
)UU7 8
;UU8 9
ifVV 
(VV 
readerVV 
.VV 
ReadVV #
(VV# $
)VV$ %
)VV% &
{WW 
	connectorXX !
.XX! "
IdXX" $
=XX% &
ConvertXX' .
.XX. /
ToInt64XX/ 6
(XX6 7
readerXX7 =
[XX= >
$strXX> B
]XXB C
)XXC D
;XXD E
	connectorYY !
.YY! "

MaxCurrentYY" ,
=YY- .
ConvertYY/ 6
.YY6 7
	ToDecimalYY7 @
(YY@ A
readerYYA G
[YYG H
$strYYH T
]YYT U
)YYU V
;YYV W
	connectorZZ !
.ZZ! "
ChargeStationIdZZ" 1
=ZZ2 3
ConvertZZ4 ;
.ZZ; <
ToInt64ZZ< C
(ZZC D
readerZZD J
[ZZJ K
$strZZK \
]ZZ\ ]
)ZZ] ^
;ZZ^ _
}[[ 
}\\ 
}]] 
return__ 
	connector__ 
;__ 
}`` 	
publicbb 
Listbb 
<bb 
	Connectorbb 
>bb *
GetConnectorsByChargeStationIdbb =
(bb= >
longbb> B
chargeStationIdbbC R
)bbR S
{cc 	
vardd 
querydd 
=dd 
$@"dd {
oSELECT * FROM gf_smartcharging.connectors
                           WHERE ChargeStationId = @ChargeStationId;de D
"eeD E
;eeE F
vargg 
connectorListgg 
=gg 
newgg  #
Listgg$ (
<gg( )
	Connectorgg) 2
>gg2 3
(gg3 4
)gg4 5
;gg5 6
varii 
connectionStringii  
=ii! "
_configurationii# 1
[ii1 2
$strii2 W
]iiW X
;iiX Y
usingjj 
(jj 
varjj 

connectionjj !
=jj" #
newjj$ '
MySqlConnectionjj( 7
(jj7 8
connectionStringjj8 H
)jjH I
)jjI J
{kk 
ifll 
(ll 

connectionll 
.ll 
Statell $
!=ll% '
ConnectionStatell( 7
.ll7 8
Openll8 <
)ll< =

connectionmm 
.mm 
Openmm #
(mm# $
)mm$ %
;mm% &
usingoo 
(oo 
varoo 
commandoo "
=oo# $
newoo% (
MySqlCommandoo) 5
(oo5 6
queryoo6 ;
,oo; <

connectionoo= G
)ooG H
)ooH I
{pp 
commandqq 
.qq 

Parametersqq &
.qq& '
AddWithValueqq' 3
(qq3 4
$strqq4 F
,qqF G
chargeStationIdqqH W
)qqW X
;qqX Y
varss 
readerss 
=ss  
commandss! (
.ss( )
ExecuteReaderss) 6
(ss6 7
)ss7 8
;ss8 9
iftt 
(tt 
readertt 
.tt 
Readtt #
(tt# $
)tt$ %
)tt% &
{uu 
varvv 
	connectorvv %
=vv& '
newvv( +
	Connectorvv, 5
(vv5 6
)vv6 7
;vv7 8
	connectorxx !
.xx! "
Idxx" $
=xx% &
Convertxx' .
.xx. /
ToInt64xx/ 6
(xx6 7
readerxx7 =
[xx= >
$strxx> B
]xxB C
)xxC D
;xxD E
	connectoryy !
.yy! "

MaxCurrentyy" ,
=yy- .
Convertyy/ 6
.yy6 7
	ToDecimalyy7 @
(yy@ A
readeryyA G
[yyG H
$stryyH T
]yyT U
)yyU V
;yyV W
	connectorzz !
.zz! "
ChargeStationIdzz" 1
=zz2 3
Convertzz4 ;
.zz; <
ToInt64zz< C
(zzC D
readerzzD J
[zzJ K
$strzzK \
]zz\ ]
)zz] ^
;zz^ _
connectorList|| %
.||% &
Add||& )
(||) *
	connector||* 3
)||3 4
;||4 5
}}} 
}~~ 
} 
return
�� 
connectorList
��  
;
��  !
}
�� 	
public
�� 
List
�� 
<
�� 
	Connector
�� 
>
�� -
GetConnectorsByChargeStationIds
�� >
(
��> ?
List
��? C
<
��C D
ChargeStation
��D Q
>
��Q R
chargeStationList
��S d
)
��d e
{
�� 	
var
�� !
chargeStationIdList
�� #
=
��$ %
chargeStationList
��& 7
.
��7 8
Select
��8 >
(
��> ?
cs
��? A
=>
��B D
cs
��E G
.
��G H
Id
��H J
)
��J K
;
��K L
var
�� 
groupIdQuery
�� 
=
�� 
string
�� %
.
��% &
Join
��& *
(
��* +
$str
��+ .
,
��. /!
chargeStationIdList
��0 C
)
��C D
;
��D E
var
�� 
connectorList
�� 
=
�� 
new
��  #
List
��$ (
<
��( )
	Connector
��) 2
>
��2 3
(
��3 4
)
��4 5
;
��5 6
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
groupIdQuery
��% 1
)
��1 2
)
��2 3
return
�� 
connectorList
�� $
;
��$ %
var
�� 
query
�� 
=
�� 
$@"
�� n
`SELECT * FROM gf_smartcharging.connectors
                           WHERE ChargeStationId IN (
�� 5
{
��5 6
groupIdQuery
��6 B
}
��B C
);
��C E
"
��E F
;
��F G
var
�� 
connectionString
��  
=
��! "
_configuration
��# 1
[
��1 2
$str
��2 W
]
��W X
;
��X Y
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
new
��$ '
MySqlConnection
��( 7
(
��7 8
connectionString
��8 H
)
��H I
)
��I J
{
�� 
if
�� 
(
�� 

connection
�� 
.
�� 
State
�� $
!=
��% '
ConnectionState
��( 7
.
��7 8
Open
��8 <
)
��< =

connection
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
using
�� 
(
�� 
var
�� 
command
�� "
=
��# $
new
��% (
MySqlCommand
��) 5
(
��5 6
query
��6 ;
,
��; <

connection
��= G
)
��G H
)
��H I
{
�� 
var
�� 
reader
�� 
=
��  
command
��! (
.
��( )
ExecuteReader
��) 6
(
��6 7
)
��7 8
;
��8 9
while
�� 
(
�� 
reader
�� !
.
��! "
Read
��" &
(
��& '
)
��' (
)
��( )
{
�� 
var
�� 
	connector
�� %
=
��& '
new
��( +
	Connector
��, 5
(
��5 6
)
��6 7
;
��7 8
	connector
�� !
.
��! "
Id
��" $
=
��% &
Convert
��' .
.
��. /
ToInt64
��/ 6
(
��6 7
reader
��7 =
[
��= >
$str
��> B
]
��B C
)
��C D
;
��D E
	connector
�� !
.
��! "

MaxCurrent
��" ,
=
��- .
Convert
��/ 6
.
��6 7
	ToDecimal
��7 @
(
��@ A
reader
��A G
[
��G H
$str
��H T
]
��T U
)
��U V
;
��V W
	connector
�� !
.
��! "
ChargeStationId
��" 1
=
��2 3
Convert
��4 ;
.
��; <
ToInt64
��< C
(
��C D
reader
��D J
[
��J K
$str
��K \
]
��\ ]
)
��] ^
;
��^ _
connectorList
�� %
.
��% &
Add
��& )
(
��) *
	connector
��* 3
)
��3 4
;
��4 5
}
�� 
}
�� 
}
�� 
return
�� 
connectorList
��  
;
��  !
}
�� 	
public
�� 
void
�� 
DeleteConnector
�� #
(
��# $
	Connector
��$ -
	connector
��. 7
)
��7 8
{
�� 	
var
�� 
query
�� 
=
�� 
$@"
�� a
SDELETE FROM gf_smartcharging.connectors
                           WHERE Id = @Id;
�� *
"
��* +
;
��+ ,
var
�� 
connectionString
��  
=
��! "
_configuration
��# 1
[
��1 2
$str
��2 W
]
��W X
;
��X Y
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
new
��$ '
MySqlConnection
��( 7
(
��7 8
connectionString
��8 H
)
��H I
)
��I J
{
�� 
if
�� 
(
�� 

connection
�� 
.
�� 
State
�� $
!=
��% '
ConnectionState
��( 7
.
��7 8
Open
��8 <
)
��< =

connection
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
using
�� 
(
�� 
var
�� 
command
�� "
=
��# $
new
��% (
MySqlCommand
��) 5
(
��5 6
query
��6 ;
,
��; <

connection
��= G
)
��G H
)
��H I
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
AddWithValue
��' 3
(
��3 4
$str
��4 9
,
��9 :
	connector
��; D
.
��D E
Id
��E G
)
��G H
;
��H I
command
�� 
.
�� 
ExecuteNonQuery
�� +
(
��+ ,
)
��, -
;
��- .
}
�� 
}
�� 
}
�� 	
public
�� 
List
�� 
<
�� 
	Connector
�� 
>
�� 
GetAllConnectors
�� /
(
��/ 0
)
��0 1
{
�� 	
var
�� 
query
�� 
=
�� 
$@"
�� 8
*SELECT * FROM gf_smartcharging.connectors;
�� E
"
��E F
;
��F G
var
�� 
connectorList
�� 
=
�� 
new
��  #
List
��$ (
<
��( )
	Connector
��) 2
>
��2 3
(
��3 4
)
��4 5
;
��5 6
var
�� 
connectionString
��  
=
��! "
_configuration
��# 1
[
��1 2
$str
��2 W
]
��W X
;
��X Y
using
�� 
(
�� 
var
�� 

connection
�� !
=
��" #
new
��$ '
MySqlConnection
��( 7
(
��7 8
connectionString
��8 H
)
��H I
)
��I J
{
�� 
if
�� 
(
�� 

connection
�� 
.
�� 
State
�� $
!=
��% '
ConnectionState
��( 7
.
��7 8
Open
��8 <
)
��< =

connection
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
using
�� 
(
�� 
var
�� 
command
�� "
=
��# $
new
��% (
MySqlCommand
��) 5
(
��5 6
query
��6 ;
,
��; <

connection
��= G
)
��G H
)
��H I
{
�� 
var
�� 
reader
�� 
=
��  
command
��! (
.
��( )
ExecuteReader
��) 6
(
��6 7
)
��7 8
;
��8 9
while
�� 
(
�� 
reader
�� !
.
��! "
Read
��" &
(
��& '
)
��' (
)
��( )
{
�� 
var
�� 
	connector
�� %
=
��& '
new
��( +
	Connector
��, 5
(
��5 6
)
��6 7
;
��7 8
	connector
�� !
.
��! "
Id
��" $
=
��% &
Convert
��' .
.
��. /
ToInt64
��/ 6
(
��6 7
reader
��7 =
[
��= >
$str
��> B
]
��B C
)
��C D
;
��D E
	connector
�� !
.
��! "

MaxCurrent
��" ,
=
��- .
Convert
��/ 6
.
��6 7
	ToDecimal
��7 @
(
��@ A
reader
��A G
[
��G H
$str
��H T
]
��T U
)
��U V
;
��V W
	connector
�� !
.
��! "
ChargeStationId
��" 1
=
��2 3
Convert
��4 ;
.
��; <
ToInt64
��< C
(
��C D
reader
��D J
[
��J K
$str
��K \
]
��\ ]
)
��] ^
;
��^ _
connectorList
�� %
.
��% &
Add
��& )
(
��) *
	connector
��* 3
)
��3 4
;
��4 5
}
�� 
}
�� 
}
�� 
return
�� 
connectorList
��  
;
��  !
}
�� 	
}
�� 
}�� �_
�C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Infrastructure\Repositories\GroupRepository.cs
	namespace

 	
	GreenFlux


 
.

 
SmartCharging

 !
.

! "
Infrastructure

" 0
.

0 1
Repositories

1 =
{ 
public 

class 
GroupRepository  
:! "
IGroupRepository# 3
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
GroupRepository 
( 
IConfiguration -
configuration. ;
); <
{ 	
_configuration 
= 
configuration *
;* +
} 	
public 
void 
CreateGroup 
(  
Group  %
group& +
)+ ,
{ 	
var 
query 
= 
@$" �
�INSERT INTO gf_smartcharging.groups
                               (Name, CurrentCapacity)
                           VALUES
                                (@Name, @CurrentCapacity);
                           SELECT LAST_INSERT_ID() 2
"2 3
;3 4
var 
connectionString  
=! "
_configuration# 1
[1 2
$str2 W
]W X
;X Y
using 
( 
var 

connection !
=" #
new$ '
MySqlConnection( 7
(7 8
connectionString8 H
)H I
)I J
{   
if!! 
(!! 

connection!! 
.!! 
State!! $
!=!!% '
ConnectionState!!( 7
.!!7 8
Open!!8 <
)!!< =

connection"" 
."" 
Open"" #
(""# $
)""$ %
;""% &
using$$ 
($$ 
var$$ 
command$$ "
=$$# $
new$$% (
MySqlCommand$$) 5
($$5 6
query$$6 ;
,$$; <

connection$$= G
)$$G H
)$$H I
{%% 
command&& 
.&& 

Parameters&& &
.&&& '
AddWithValue&&' 3
(&&3 4
$str&&4 ;
,&&; <
group&&= B
.&&B C
Name&&C G
)&&G H
;&&H I
command'' 
.'' 

Parameters'' &
.''& '
AddWithValue''' 3
(''3 4
$str''4 F
,''F G
group''H M
.''M N
CurrentCapacity''N ]
)''] ^
;''^ _
group)) 
.)) 
Id)) 
=)) 
Convert)) &
.))& '
ToInt64))' .
()). /
command))/ 6
.))6 7
ExecuteScalar))7 D
())D E
)))E F
)))F G
;))G H
}** 
}++ 
},, 	
public.. 
void.. 
DeleteGroup.. 
(..  
Group..  %
group..& +
)..+ ,
{// 	
var00 
query00 
=00 
$@"00 [
ODELETE FROM gf_smartcharging.groups
                           WHERE Id = @Id;01 *
"11* +
;11+ ,
var33 
connectionString33  
=33! "
_configuration33# 1
[331 2
$str332 W
]33W X
;33X Y
using44 
(44 
var44 

connection44 !
=44" #
new44$ '
MySqlConnection44( 7
(447 8
connectionString448 H
)44H I
)44I J
{55 
if66 
(66 

connection66 
.66 
State66 $
!=66% '
ConnectionState66( 7
.667 8
Open668 <
)66< =

connection77 
.77 
Open77 #
(77# $
)77$ %
;77% &
using99 
(99 
var99 
command99 "
=99# $
new99% (
MySqlCommand99) 5
(995 6
query996 ;
,99; <

connection99= G
)99G H
)99H I
{:: 
command;; 
.;; 

Parameters;; &
.;;& '
AddWithValue;;' 3
(;;3 4
$str;;4 9
,;;9 :
group;;; @
.;;@ A
Id;;A C
);;C D
;;;D E
command== 
.== 
ExecuteNonQuery== +
(==+ ,
)==, -
;==- .
}>> 
}?? 
}@@ 	
publicBB 
GroupBB 
GetGroupByIdBB !
(BB! "
longBB" &
groupIdBB' .
)BB. /
{CC 	
varDD 
queryDD 
=DD 
$@"DD ]
QSELECT * FROM gf_smartcharging.groups
                           WHERE Id = @Id;DE *
"EE* +
;EE+ ,
varGG 
groupGG 
=GG 
newGG 
GroupGG !
(GG! "
)GG" #
;GG# $
varJJ 
connectionStringJJ  
=JJ! "
_configurationJJ# 1
[JJ1 2
$strJJ2 W
]JJW X
;JJX Y
usingKK 
(KK 
varKK 

connectionKK !
=KK" #
newKK$ '
MySqlConnectionKK( 7
(KK7 8
connectionStringKK8 H
)KKH I
)KKI J
{LL 
ifMM 
(MM 

connectionMM 
.MM 
StateMM $
!=MM% '
ConnectionStateMM( 7
.MM7 8
OpenMM8 <
)MM< =

connectionNN 
.NN 
OpenNN #
(NN# $
)NN$ %
;NN% &
usingPP 
(PP 
varPP 
commandPP "
=PP# $
newPP% (
MySqlCommandPP) 5
(PP5 6
queryPP6 ;
,PP; <

connectionPP= G
)PPG H
)PPH I
{QQ 
commandRR 
.RR 

ParametersRR &
.RR& '
AddWithValueRR' 3
(RR3 4
$strRR4 9
,RR9 :
groupIdRR; B
)RRB C
;RRC D
varTT 
readerTT 
=TT  
commandTT! (
.TT( )
ExecuteReaderTT) 6
(TT6 7
)TT7 8
;TT8 9
ifUU 
(UU 
readerUU 
.UU 
ReadUU #
(UU# $
)UU$ %
)UU% &
{VV 
groupWW 
.WW 
IdWW  
=WW! "
ConvertWW# *
.WW* +
ToInt64WW+ 2
(WW2 3
readerWW3 9
[WW9 :
$strWW: >
]WW> ?
)WW? @
;WW@ A
groupXX 
.XX 
NameXX "
=XX# $
(XX% &
stringXX& ,
)XX, -
readerXX- 3
[XX3 4
$strXX4 :
]XX: ;
;XX; <
groupYY 
.YY 
CurrentCapacityYY -
=YY. /
ConvertYY0 7
.YY7 8
	ToDecimalYY8 A
(YYA B
readerYYB H
[YYH I
$strYYI Z
]YYZ [
)YY[ \
;YY\ ]
}ZZ 
}[[ 
}\\ 
return^^ 
group^^ 
;^^ 
}__ 	
publicaa 
voidaa 
UpdateGroupaa 
(aa  
Groupaa  %
groupaa& +
)aa+ ,
{bb 	
varcc 
querycc 
=cc 
$@"cc �
�UPDATE gf_smartcharging.groups
                           SET Name = @Name,
                               CurrentCapacity = @CurrentCapacity;ce B
"eeB C
;eeC D
vargg 
connectionStringgg  
=gg! "
_configurationgg# 1
[gg1 2
$strgg2 W
]ggW X
;ggX Y
usinghh 
(hh 
varhh 

connectionhh !
=hh" #
newhh$ '
MySqlConnectionhh( 7
(hh7 8
connectionStringhh8 H
)hhH I
)hhI J
{ii 
ifjj 
(jj 

connectionjj 
.jj 
Statejj $
!=jj% '
ConnectionStatejj( 7
.jj7 8
Openjj8 <
)jj< =

connectionkk 
.kk 
Openkk #
(kk# $
)kk$ %
;kk% &
usingmm 
(mm 
varmm 
commandmm "
=mm# $
newmm% (
MySqlCommandmm) 5
(mm5 6
querymm6 ;
,mm; <

connectionmm= G
)mmG H
)mmH I
{nn 
commandoo 
.oo 

Parametersoo &
.oo& '
AddWithValueoo' 3
(oo3 4
$stroo4 ;
,oo; <
groupoo= B
.ooB C
NameooC G
)ooG H
;ooH I
commandpp 
.pp 

Parameterspp &
.pp& '
AddWithValuepp' 3
(pp3 4
$strpp4 F
,ppF G
groupppH M
.ppM N
CurrentCapacityppN ]
)pp] ^
;pp^ _
commandrr 
.rr 
ExecuteNonQueryrr +
(rr+ ,
)rr, -
;rr- .
}ss 
}tt 
}uu 	
publicww 
Listww 
<ww 
Groupww 
>ww 
GetAllGroupsww '
(ww' (
)ww( )
{xx 	
varyy 
queryyy 
=yy 
$@"yy 2
&SELECT * FROM gf_smartcharging.groups;yy A
"yyA B
;yyB C
var{{ 
	groupList{{ 
={{ 
new{{ 
List{{  $
<{{$ %
Group{{% *
>{{* +
({{+ ,
){{, -
;{{- .
var~~ 
connectionString~~  
=~~! "
_configuration~~# 1
[~~1 2
$str~~2 W
]~~W X
;~~X Y
using 
( 
var 

connection !
=" #
new$ '
MySqlConnection( 7
(7 8
connectionString8 H
)H I
)I J
{
�� 
if
�� 
(
�� 

connection
�� 
.
�� 
State
�� $
!=
��% '
ConnectionState
��( 7
.
��7 8
Open
��8 <
)
��< =

connection
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
using
�� 
(
�� 
var
�� 
command
�� "
=
��# $
new
��% (
MySqlCommand
��) 5
(
��5 6
query
��6 ;
,
��; <

connection
��= G
)
��G H
)
��H I
{
�� 
var
�� 
reader
�� 
=
��  
command
��! (
.
��( )
ExecuteReader
��) 6
(
��6 7
)
��7 8
;
��8 9
while
�� 
(
�� 
reader
�� !
.
��! "
Read
��" &
(
��& '
)
��' (
)
��( )
{
�� 
var
�� 
group
�� !
=
��" #
new
��$ '
Group
��( -
(
��- .
)
��. /
;
��/ 0
group
�� 
.
�� 
Id
��  
=
��! "
Convert
��# *
.
��* +
ToInt64
��+ 2
(
��2 3
reader
��3 9
[
��9 :
$str
��: >
]
��> ?
)
��? @
;
��@ A
group
�� 
.
�� 
Name
�� "
=
��# $
(
��% &
string
��& ,
)
��, -
reader
��- 3
[
��3 4
$str
��4 :
]
��: ;
;
��; <
group
�� 
.
�� 
CurrentCapacity
�� -
=
��. /
Convert
��0 7
.
��7 8
	ToDecimal
��8 A
(
��A B
reader
��B H
[
��H I
$str
��I Z
]
��Z [
)
��[ \
;
��\ ]
	groupList
�� !
.
��! "
Add
��" %
(
��% &
group
��& +
)
��+ ,
;
��, -
}
�� 
}
�� 
}
�� 
return
�� 
	groupList
�� 
;
�� 
}
�� 	
}
�� 
}�� 
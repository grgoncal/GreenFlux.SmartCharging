¿!
åC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Base\AbstractRequesHandler.cs
	namespace

 	
	GreenFlux


 
.

 
SmartChargin

  
.

  !
API

! $
.

$ %
Application

% 0
.

0 1
Mediator

1 9
.

9 :
Base

: >
{ 
public 

abstract 
class !
AbstractRequesHandler /
</ 0
T0 1
>1 2
:3 4
IRequestHandler5 D
<D E
TE F
,F G
ResponseH P
>P Q
where 
T 
: 
IRequest 
< 
Response #
># $
{ 
internal 
abstract 
HandleResponse (
HandleIt) 1
(1 2
T2 3
request4 ;
,; <
CancellationToken= N
cancellationTokenO `
)` a
;a b
public 
Task 
< 
Response 
> 
Handle $
($ %
T% &
request' .
,. /
CancellationToken0 A
cancellationTokenB S
)S T
{ 	
var 
response 
= 
new 
Response '
(' (
)( )
;) *
if 
( 
object 
. 
Equals 
( 
request %
,% &
default' .
(. /
T/ 0
)0 1
)1 2
)2 3
return 
Task 
. 

FromResult &
(& '
response' /
)/ 0
;0 1
try 
{ 
var 
result 
= 
HandleIt %
(% &
request& -
,- .
cancellationToken/ @
)@ A
;A B
ParseResult 
( 
response $
,$ %
result& ,
), -
;- .
} 
catch 
( 
RestException  
re! #
)# $
{ 
response 
. 
ErrorMessage %
=& '
re( *
.* +
Message+ 2
;2 3
}   
catch!! 
(!! 
	Exception!! 
ex!! 
)!!  
{"" 
Console## 
.## 
	WriteLine## !
(##! "
ex##" $
)##$ %
;##% &
}&& 
return(( 
Task(( 
.(( 

FromResult(( "
(((" #
response((# +
)((+ ,
;((, -
})) 	
private++ 
void++ 
ParseResult++  
(++  !
Response++! )
response++* 2
,++2 3
HandleResponse++4 B
result++C I
)++I J
{,, 	
if-- 
(-- 
result-- 
!=-- 
null-- 
&&-- !
result--" (
?--( )
.--) *
ErrorMessage--* 6
==--7 9
null--: >
)--> ?
response.. 
... 
Content..  
=..! "
result..# )
...) *
Content..* 1
;..1 2
else// 
if// 
(// 
result// 
!=// 
null// #
&&//$ &
result//' -
?//- .
.//. /
ErrorMessage/// ;
!=//< >
null//? C
)//C D
response00 
.00 
ErrorMessage00 %
=00& '
result00( .
.00. /
ErrorMessage00/ ;
;00; <
}11 	
}22 
internal44 
class44 
HandleResponse44 !
{55 
public66 
object66 
Content66 
{66 
get66  #
;66# $
set66% (
;66( )
}66* +
public77 
string77 
ErrorMessage77 "
{77# $
get77% (
;77( )
set77* -
;77- .
}77/ 0
}88 
}99 ¡
§C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\ChargeStations\CreateChargeStationCommand.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
ChargeStations		C Q
{

 
public 

class &
CreateChargeStationCommand +
:, -
IRequest. 6
<6 7
Response7 ?
>? @
{ 
public 
ChargeStation 
ChargeStation *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} ¨!
´C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\ChargeStations\CreateChargeStationCommandHandler.cs
	namespace 	
	GreenFlux
 
. 
SmartChargin  
.  !
API! $
.$ %
Application% 0
.0 1
Mediator1 9
.9 :
Commands: B
.B C
ChargeStationsC Q
{ 
public 

class -
!CreateChargeStationCommandHandler 2
:3 4!
AbstractRequesHandler5 J
<J K&
CreateChargeStationCommandK e
>e f
{ 
private 
readonly $
IChargeStationRepository 1$
_chargeStationRepository2 J
;J K
private 
readonly 
IGroupRepository )
_groupRepository* :
;: ;
public -
!CreateChargeStationCommandHandler 0
(0 1$
IChargeStationRepository1 I#
chargeStationRepositoryJ a
,a b
IGroupRepository 
groupRepository -
)- .
{ 	$
_chargeStationRepository $
=% &#
chargeStationRepository' >
;> ?
_groupRepository 
= 
groupRepository .
;. /
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2&
CreateChargeStationCommand2 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
chargeStation 
= 
request  '
.' (
ChargeStation( 5
;5 6
RunValidations 
( 
chargeStation (
)( )
;) *$
_chargeStationRepository $
.$ %
CreateChargeStation% 8
(8 9
chargeStation9 F
)F G
;G H
return!! 
new!! 
HandleResponse!! %
(!!% &
)!!& '
{!!( )
Content!!* 1
=!!2 3
chargeStation!!4 A
}!!B C
;!!C D
}"" 	
private$$ 
void$$ 
RunValidations$$ #
($$# $
ChargeStation$$$ 1
chargeStation$$2 ?
)$$? @
{%% 	%
VerifyChargeStationFields&& %
(&&% &
chargeStation&&& 3
)&&3 4
;&&4 5
VerifyParentGroupId'' 
(''  
chargeStation''  -
)''- .
;''. /
}(( 	
private** 
void** %
VerifyChargeStationFields** .
(**. /
ChargeStation**/ <
chargeStation**= J
)**J K
{++ 	
if,, 
(,, 
string,, 
.,, 
IsNullOrEmpty,, $
(,,$ %
chargeStation,,% 2
.,,2 3
Name,,3 7
),,7 8
),,8 9
throw-- 
new-- 
RestException-- '
(--' (
$str--( X
)--X Y
;--Y Z
if// 
(// 
chargeStation// 
.// 
GroupId// %
<//& '
$num//( )
)//) *
throw00 
new00 
RestException00 '
(00' (
$str00( X
)00X Y
;00Y Z
}11 	
private22 
void22 
VerifyParentGroupId22 (
(22( )
ChargeStation22) 6
chargeStation227 D
)22D E
{33 	
var44 
existentGroup44 
=44 
_groupRepository44  0
.440 1
GetGroupById441 =
(44= >
chargeStation44> K
.44K L
GroupId44L S
)44S T
;44T U
if55 
(55 
existentGroup55 
==55  
null55! %
||55& (
existentGroup55) 6
.556 7
Id557 9
==55: <
$num55= >
)55> ?
throw66 
new66 
RestException66 '
(66' (
$str66( @
)66@ A
;66A B
}77 	
}88 
}99 ¡
§C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\ChargeStations\DeleteChargeStationCommand.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
ChargeStations		C Q
{

 
public 

class &
DeleteChargeStationCommand +
:, -
IRequest. 6
<6 7
Response7 ?
>? @
{ 
public 
ChargeStation 
ChargeStation *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} ï
´C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\ChargeStations\DeleteChargeStationCommandHandler.cs
	namespace

 	
	GreenFlux


 
.

 
SmartChargin

  
.

  !
API

! $
.

$ %
Application

% 0
.

0 1
Mediator

1 9
.

9 :
Commands

: B
.

B C
ChargeStations

C Q
{ 
public 

class -
!DeleteChargeStationCommandHandler 2
:3 4!
AbstractRequesHandler5 J
<J K&
DeleteChargeStationCommandK e
>e f
{ 
private 
readonly $
IChargeStationRepository 1$
_chargeStationRepository2 J
;J K
public -
!DeleteChargeStationCommandHandler 0
(0 1$
IChargeStationRepository1 I#
chargeStationRepositoryJ a
)a b
{ 	$
_chargeStationRepository $
=% &#
chargeStationRepository' >
;> ?
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2&
DeleteChargeStationCommand2 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
chargeStation 
= 
request  '
.' (
ChargeStation( 5
;5 6$
_chargeStationRepository $
.$ %
DeleteChargeStation% 8
(8 9
chargeStation9 F
)F G
;G H
return 
new 
HandleResponse %
(% &
)& '
{( )
Content* 1
=2 3
chargeStation4 A
}B C
;C D
} 	
} 
} õ
•C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\ChargeStations\GetAllChargeStationsCommand.cs
	namespace 	
	GreenFlux
 
. 
SmartChargin  
.  !
API! $
.$ %
Application% 0
.0 1
Mediator1 9
.9 :
Commands: B
.B C
ChargeStationsC Q
{		 
public

 

class

 '
GetAllChargeStationsCommand

 ,
:

- .
IRequest

/ 7
<

7 8
Response

8 @
>

@ A
{ 
} 
} ∫
¨C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\ChargeStations\GetAllChargeStationsCommandHandler.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
ChargeStations		C Q
{

 
public 

class .
"GetAllChargeStationsCommandHandler 3
:4 5!
AbstractRequesHandler6 K
<K L'
GetAllChargeStationsCommandL g
>g h
{ 
private 
readonly $
IChargeStationRepository 1$
_chargeStationRepository2 J
;J K
public .
"GetAllChargeStationsCommandHandler 1
(1 2$
IChargeStationRepository2 J#
chargeStationRepositoryK b
)b c
{ 	$
_chargeStationRepository $
=% &#
chargeStationRepository' >
;> ?
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2'
GetAllChargeStationsCommand2 M
requestN U
,U V
CancellationTokenW h
cancellationTokeni z
)z {
{ 	
var 
chargeStationList !
=" #$
_chargeStationRepository$ <
.< = 
GetAllChargeStations= Q
(Q R
)R S
;S T
return 
new 
HandleResponse %
(% &
)& '
{( )
Content* 1
=2 3
chargeStationList4 E
}F G
;G H
} 	
} 
} ¡
§C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\ChargeStations\UpdateChargeStationCommand.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
ChargeStations		C Q
{

 
public 

class &
UpdateChargeStationCommand +
:, -
IRequest. 6
<6 7
Response7 ?
>? @
{ 
public 
ChargeStation 
ChargeStation *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} ï
´C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\ChargeStations\UpdateChargeStationCommandHandler.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
ChargeStations		C Q
{

 
public 

class -
!UpdateChargeStationCommandHandler 2
:3 4!
AbstractRequesHandler5 J
<J K&
UpdateChargeStationCommandK e
>e f
{ 
private 
readonly $
IChargeStationRepository 1$
_chargeStationRepository2 J
;J K
public -
!UpdateChargeStationCommandHandler 0
(0 1$
IChargeStationRepository1 I#
chargeStationRepositoryJ a
)a b
{ 	$
_chargeStationRepository $
=% &#
chargeStationRepository' >
;> ?
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2&
UpdateChargeStationCommand2 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
chargeStation 
= 
request  '
.' (
ChargeStation( 5
;5 6$
_chargeStationRepository $
.$ %
UpdateChargeStation% 8
(8 9
chargeStation9 F
)F G
;G H
return 
new 
HandleResponse %
(% &
)& '
{( )
Content* 1
=2 3
chargeStation4 A
}B C
;C D
} 	
} 
} π
§C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Connectors\CreateOrUpdateConnectorCommand.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C

Connectors		C M
{

 
public 

class *
CreateOrUpdateConnectorCommand /
:0 1
IRequest2 :
<: ;
Response; C
>C D
{ 
public 
	Connector 
	Connector "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} √E
´C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Connectors\CreateOrUpdateConnectorCommandHandler.cs
	namespace 	
	GreenFlux
 
. 
SmartChargin  
.  !
API! $
.$ %
Application% 0
.0 1
Mediator1 9
.9 :
Commands: B
.B C

ConnectorsC M
{ 
public 

class 1
%CreateOrUpdateConnectorCommandHandler 6
:7 8!
AbstractRequesHandler9 N
<N O*
CreateOrUpdateConnectorCommandO m
>m n
{ 
private 
readonly  
IConnectorRepository - 
_connectorRepository. B
;B C
private 
readonly $
IChargeStationRepository 1$
_chargeStationRepository2 J
;J K
private 
readonly 
IGroupRepository )
_groupRepository* :
;: ;
public 1
%CreateOrUpdateConnectorCommandHandler 4
(4 5 
IConnectorRepository5 I
connectorRepositoryJ ]
,] ^$
IChargeStationRepository $#
chargeStationRepository% <
,< =
IGroupRepository 
groupRepository ,
), -
{ 	 
_connectorRepository  
=! "
connectorRepository# 6
;6 7$
_chargeStationRepository $
=% &#
chargeStationRepository' >
;> ?
_groupRepository 
= 
groupRepository .
;. /
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2*
CreateOrUpdateConnectorCommand2 P
requestQ X
,X Y
CancellationTokenZ k
cancellationTokenl }
)} ~
{ 	
var   
	connector   
=   
request   #
.  # $
	Connector  $ -
;  - .
var"" 
existingConnector"" !
=""" # 
_connectorRepository""$ 8
.""8 9
GetConnectorById""9 I
(""I J
	connector""J S
.""S T
Id""T V
)""V W
;""W X
if$$ 
($$ 
existingConnector$$ !
.$$! "
Id$$" $
==$$% '
$num$$( )
)$$) *
{%% 
RunValidations&& 
(&& 
	connector&& (
)&&( )
;&&) * 
_connectorRepository'' $
.''$ %
CreateConnector''% 4
(''4 5
	connector''5 >
)''> ?
;''? @
}(( 
else)) 
{** 
RunValidations++ 
(++ 
	connector++ (
,++( )
true++* .
)++. /
;++/ 0 
_connectorRepository,, $
.,,$ %
UpdateConnector,,% 4
(,,4 5
	connector,,5 >
),,> ?
;,,? @
}-- 
return// 
new// 
HandleResponse// %
(//% &
)//& '
{//( )
Content//* 1
=//2 3
	connector//4 =
}//> ?
;//? @
}00 	
private22 
void22 
RunValidations22 #
(22# $
	Connector22$ -
	connector22. 7
,227 8
bool229 =
isUpdate22> F
=22G H
false22I N
)22N O
{33 	
var44 
chargeStation44 
=44 $
_chargeStationRepository44  8
.448 9 
GetChargeStationById449 M
(44M N
	connector44N W
.44W X
ChargeStationId44X g
)44g h
;44h i
var55 
chargeStationList55 !
=55" #$
_chargeStationRepository55$ <
.55< =)
GetChargeStationListByGroupId55= Z
(55Z [
chargeStation55[ h
.55h i
GroupId55i p
)55p q
;55q r
var66 
connectionList66 
=66   
_connectorRepository66! 5
.665 6+
GetConnectorsByChargeStationIds666 U
(66U V
chargeStationList66V g
)66g h
;66h i
var77 
group77 
=77 
_groupRepository77 (
.77( )
GetGroupById77) 5
(775 6
chargeStation776 C
.77C D
GroupId77D K
)77K L
;77L M
if99 
(99 
!99 
isUpdate99 
)99 )
ValidateChargeStationQuantity:: -
(::- .
connectionList::. <
,::< =
	connector::> G
)::G H
;::H I!
ValidateGroupCapacity<< !
(<<! "
group<<" '
,<<' (
connectionList<<) 7
,<<7 8
	connector<<9 B
)<<B C
;<<C D
}== 	
private?? 
void?? )
ValidateChargeStationQuantity?? 2
(??2 3
List??3 7
<??7 8
	Connector??8 A
>??A B
connectionList??C Q
,??Q R
	Connector??S \
newConnector??] i
)??i j
{@@ 	
varAA 
pairConnectorsAA 
=AA  
connectionListAA! /
.AA/ 0
WhereAA0 5
(AA5 6
cAA6 7
=>AA8 :
cAA; <
.AA< =
ChargeStationIdAA= L
==AAM O
newConnectorAAP \
.AA\ ]
ChargeStationIdAA] l
)AAl m
;AAm n
ifCC 
(CC 
pairConnectorsCC 
.CC 
CountCC $
(CC$ %
)CC% &
>=CC' )
$numCC* +
)CC+ ,
throwDD 
newDD 
RestExceptionDD '
(DD' (
$strDD( ^
)DD^ _
;DD_ `
}EE 	
privateGG 
voidGG !
ValidateGroupCapacityGG *
(GG* +
GroupGG+ 0
groupGG1 6
,GG6 7
ListGG8 <
<GG< =
	ConnectorGG= F
>GGF G
connectionListGGH V
,GGV W
	ConnectorGGX a
newConnectorGGb n
)GGn o
{HH 	
varII %
existingConnectorsCurrentII )
=II* +
connectionListII, :
.II: ;
WhereII; @
(II@ A
cIIA B
=>IIC E
cIIF G
.IIG H
IdIIH J
!=IIK M
newConnectorIIN Z
.IIZ [
IdII[ ]
)II] ^
.II^ _
SumII_ b
(IIb c
cIIc d
=>IIe g
cIIh i
.IIi j

MaxCurrentIIj t
)IIt u
;IIu v
ifKK 
(KK 
groupKK 
.KK 
CurrentCapacityKK %
<KK& '%
existingConnectorsCurrentKK( A
+KKB C
newConnectorKKD P
.KKP Q

MaxCurrentKKQ [
)KK[ \
{LL 
varMM 
freeCapacityMM  
=MM! "
groupMM# (
.MM( )
CurrentCapacityMM) 8
-MM9 :%
existingConnectorsCurrentMM; T
;MMT U
varNN 
requiredCapacityNN $
=NN% &
newConnectorNN' 3
.NN3 4

MaxCurrentNN4 >
-NN? @
freeCapacityNNA M
;NNM N
varPP 
freedCapacityPP !
=PP" #
$numPP$ &
;PP& '
varQQ 
possibleRemovalsQQ $
=QQ% &
connectionListQQ' 5
.QQ5 6
OrderByQQ6 =
(QQ= >
cQQ> ?
=>QQ@ B
cQQC D
.QQD E

MaxCurrentQQE O
)QQO P
.QQP Q
	TakeWhileQQQ Z
(QQZ [
cQQ[ \
=>QQ] _
(QQ` a
freedCapacityQQa n
=QQo p
freedCapacityQQq ~
+	QQ Ä
c
QQÅ Ç
.
QQÇ É

MaxCurrent
QQÉ ç
)
QQç é
<=
QQè ë
requiredCapacity
QQí ¢
)
QQ¢ £
.
QQ£ §
ToList
QQ§ ™
(
QQ™ ´
)
QQ´ ¨
;
QQ¨ ≠
varRR 
calculatedRemovalsRR &
=RR' (
possibleRemovalsRR) 9
.RR9 :
SelectRR: @
(RR@ A
cRRA B
=>RRC E
cRRF G
.RRG H
IdRRH J
)RRJ K
.RRK L
ToListRRL R
(RRR S
)RRS T
;RRT U
throwTT 
newTT 
RestExceptionTT '
(TT' (
$"TT( *J
>Group capacity exceeded. Suggested connectors to remove (id): TT* h
{TTh i
stringTTi o
.TTo p
JoinTTp t
(TTt u
$strTTu x
,TTx y
calculatedRemovals	TTz å
)
TTå ç
}
TTç é
"
TTé è
)
TTè ê
;
TTê ë
}UU 
}VV 	
}WW 
}XX ©
úC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Connectors\DeleteConnectorCommand.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C

Connectors		C M
{

 
public 

class "
DeleteConnectorCommand '
:( )
IRequest* 2
<2 3
Response3 ;
>; <
{ 
public 
	Connector 
	Connector "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} …
£C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Connectors\DeleteConnectorCommandHandler.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C

Connectors		C M
{

 
public 

class )
DeleteConnectorCommandHandler .
:/ 0!
AbstractRequesHandler1 F
<F G"
DeleteConnectorCommandG ]
>] ^
{ 
private 
readonly  
IConnectorRepository - 
_connectorRepository. B
;B C
public )
DeleteConnectorCommandHandler ,
(, - 
IConnectorRepository- A
connectorRepositoryB U
)U V
{ 	 
_connectorRepository  
=! "
connectorRepository# 6
;6 7
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2"
DeleteConnectorCommand2 H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
var 
	connector 
= 
request #
.# $
	Connector$ -
;- . 
_connectorRepository  
.  !
DeleteConnector! 0
(0 1
	connector1 :
): ;
;; <
return 
new 
HandleResponse %
(% &
)& '
{( )
Content* 1
=2 3
	connector4 =
}> ?
;? @
} 	
} 
} ã
ùC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Connectors\GetAllConnectorsCommand.cs
	namespace 	
	GreenFlux
 
. 
SmartChargin  
.  !
API! $
.$ %
Application% 0
.0 1
Mediator1 9
.9 :
Commands: B
.B C

ConnectorsC M
{		 
public

 

class

 #
GetAllConnectorsCommand

 (
:

) *
IRequest

+ 3
<

3 4
Response

4 <
>

< =
{ 
} 
} ˆ
§C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Connectors\GetAllConnectorsCommandHandler.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C

Connectors		C M
{

 
public 

class *
GetAllConnectorsCommandHandler /
:0 1!
AbstractRequesHandler2 G
<G H#
GetAllConnectorsCommandH _
>_ `
{ 
private 
readonly  
IConnectorRepository - 
_connectorRepository. B
;B C
public *
GetAllConnectorsCommandHandler -
(- . 
IConnectorRepository. B
connectorRepositoryC V
)V W
{ 	 
_connectorRepository  
=! "
connectorRepository# 6
;6 7
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2#
GetAllConnectorsCommand2 I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 	
var 
connectorList 
=  
_connectorRepository  4
.4 5
GetAllConnectors5 E
(E F
)F G
;G H
return 
new 
HandleResponse %
(% &
)& '
{( )
Content* 1
=2 3
connectorList4 A
}B C
;C D
} 	
} 
} ë
îC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Groups\CreateGroupCommand.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
Groups		C I
{

 
public 

class 
CreateGroupCommand #
:$ %
IRequest& .
<. /
Response/ 7
>7 8
{ 
public 
Group 
Group 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ˝
õC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Groups\CreateGroupCommandHandler.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
Groups		C I
{

 
public 

class %
CreateGroupCommandHandler *
:+ ,!
AbstractRequesHandler- B
<B C
CreateGroupCommandC U
>U V
{ 
private 
readonly 
IGroupRepository )
_groupRepository* :
;: ;
public %
CreateGroupCommandHandler (
(( )
IGroupRepository) 9
groupRepository: I
)I J
{ 	
_groupRepository 
= 
groupRepository .
;. /
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2
CreateGroupCommand2 D
requestE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
var 
group 
= 
request 
.  
Group  %
;% &
_groupRepository 
. 
CreateGroup (
(( )
group) .
). /
;/ 0
return 
new 
HandleResponse %
(% &
)& '
{( )
Content* 1
=2 3
group4 9
}: ;
;; <
} 	
} 
} ë
îC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Groups\DeleteGroupCommand.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
Groups		C I
{

 
public 

class 
DeleteGroupCommand #
:$ %
IRequest& .
<. /
Response/ 7
>7 8
{ 
public 
Group 
Group 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ˝
õC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Groups\DeleteGroupCommandHandler.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
Groups		C I
{

 
public 

class %
DeleteGroupCommandHandler *
:+ ,!
AbstractRequesHandler- B
<B C
DeleteGroupCommandC U
>U V
{ 
private 
readonly 
IGroupRepository )
_groupRepository* :
;: ;
public %
DeleteGroupCommandHandler (
(( )
IGroupRepository) 9
groupRepository: I
)I J
{ 	
_groupRepository 
= 
groupRepository .
;. /
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2
DeleteGroupCommand2 D
requestE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
var 
group 
= 
request 
.  
Group  %
;% &
_groupRepository 
. 
DeleteGroup (
(( )
group) .
). /
;/ 0
return 
new 
HandleResponse %
(% &
)& '
{( )
Content* 1
=2 3
group4 9
}: ;
;; <
} 	
} 
} ˚
ïC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Groups\GetAllGroupsCommand.cs
	namespace 	
	GreenFlux
 
. 
SmartChargin  
.  !
API! $
.$ %
Application% 0
.0 1
Mediator1 9
.9 :
Commands: B
.B C
GroupsC I
{		 
public

 

class

 
GetAllGroupsCommand

 $
:

% &
IRequest

' /
<

/ 0
Response

0 8
>

8 9
{ 
} 
} ≤
úC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Groups\GetAllGroupsCommandHandler.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
Groups		C I
{

 
public 

class &
GetAllGroupsCommandHandler +
:, -!
AbstractRequesHandler. C
<C D
GetAllGroupsCommandD W
>W X
{ 
private 
readonly 
IGroupRepository )
_groupRepository* :
;: ;
public &
GetAllGroupsCommandHandler )
() *
IGroupRepository* :
groupRepository; J
)J K
{ 	
_groupRepository 
= 
groupRepository .
;. /
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2
GetAllGroupsCommand2 E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
var 
	groupList 
= 
_groupRepository ,
., -
GetAllGroups- 9
(9 :
): ;
;; <
return 
new 
HandleResponse %
(% &
)& '
{( )
Content* 1
=2 3
	groupList4 =
}> ?
;? @
} 	
} 
} ë
îC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Groups\UpdateGroupCommand.cs
	namespace		 	
	GreenFlux		
 
.		 
SmartChargin		  
.		  !
API		! $
.		$ %
Application		% 0
.		0 1
Mediator		1 9
.		9 :
Commands		: B
.		B C
Groups		C I
{

 
public 

class 
UpdateGroupCommand #
:$ %
IRequest& .
<. /
Response/ 7
>7 8
{ 
public 
Group 
Group 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ‹
õC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Application\Mediator\Commands\Groups\UpdateGroupCommandHandler.cs
	namespace 	
	GreenFlux
 
. 
SmartChargin  
.  !
API! $
.$ %
Application% 0
.0 1
Mediator1 9
.9 :
Commands: B
.B C
GroupsC I
{ 
public 

class %
UpdateGroupCommandHandler *
:+ ,!
AbstractRequesHandler- B
<B C
UpdateGroupCommandC U
>U V
{ 
private 
readonly 
IGroupRepository )
_groupRepository* :
;: ;
private 
readonly $
IChargeStationRepository 1$
_chargeStationRepository2 J
;J K
private 
readonly  
IConnectorRepository - 
_connectorRepository. B
;B C
public %
UpdateGroupCommandHandler (
(( )
IGroupRepository) 9
groupRepository: I
,I J$
IChargeStationRepository $#
chargeStationRepository% <
,< = 
IConnectorRepository  
connectorRepository! 4
)4 5
{ 	
_groupRepository 
= 
groupRepository .
;. /$
_chargeStationRepository $
=% &#
chargeStationRepository' >
;> ? 
_connectorRepository  
=! "
connectorRepository# 6
;6 7
} 	
internal 
override 
HandleResponse (
HandleIt) 1
(1 2
UpdateGroupCommand2 D
requestE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
var 
group 
= 
request 
.  
Group  %
;% &
var   
existingGroup   
=   
_groupRepository    0
.  0 1
GetGroupById  1 =
(  = >
group  > C
.  C D
Id  D F
)  F G
;  G H
if"" 
("" 
existingGroup"" 
."" 
Id""  
==""! #
$num""$ %
)""% &
throw## 
new## 
RestException## '
(##' (
$str##( 9
)##9 :
;##: ;
var%% 
chargeStationList%% !
=%%" #$
_chargeStationRepository%%$ <
.%%< =)
GetChargeStationListByGroupId%%= Z
(%%Z [
group%%[ `
.%%` a
Id%%a c
)%%c d
;%%d e
var&& 
connectionList&& 
=&&   
_connectorRepository&&! 5
.&&5 6+
GetConnectorsByChargeStationIds&&6 U
(&&U V
chargeStationList&&V g
)&&g h
;&&h i
var(( 
currentConsumption(( "
=((# $
connectionList((% 3
.((3 4
Sum((4 7
(((7 8
c((8 9
=>((: <
c((= >
.((> ?

MaxCurrent((? I
)((I J
;((J K
if)) 
()) 
group)) 
.)) 
CurrentCapacity)) %
<))& '
currentConsumption))( :
))): ;
throw** 
new** 
RestException** '
(**' (
$str**( \
)**\ ]
;**] ^
_groupRepository,, 
.,, 
UpdateGroup,, (
(,,( )
group,,) .
),,. /
;,,/ 0
return.. 
new.. 
HandleResponse.. %
(..% &
)..& '
{..( )
Content..* 1
=..2 3
group..4 9
}..: ;
;..; <
}// 	
}00 
}11 ˇ2
ÄC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Controllers\ChargeStationController.cs
	namespace 	
	GreenFlux
 
. 
SmartChargin  
.  !
API! $
.$ %
Controllers% 0
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class #
ChargeStationController (
:) *

Controller+ 5
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
public #
ChargeStationController &
(& '
	IMediator' 0
mediator1 9
)9 :
{ 	
	_mediator 
= 
mediator  
;  !
} 	
[ 	
HttpGet	 
( 
$str '
)' (
]( )
public 
IActionResult  
GetAllChargeStations 1
(1 2
)2 3
{ 	
var '
getAllChargeStationsCommand +
=, -
new. 1'
GetAllChargeStationsCommand2 M
(M N
)N O
;O P
var 
result 
= 
	_mediator "
." #
Send# '
(' ('
getAllChargeStationsCommand( C
)C D
.D E
ResultE K
;K L
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
result& ,
., -
ErrorMessage- 9
)9 :
): ;
return 

StatusCode !
(! "
$num" %
,% &
result' -
)- .
;. /
return   
Ok   
(   
result   
)   
;   
}!! 	
[## 	
HttpPost##	 
(## 
$str## '
)##' (
]##( )
public$$ 
IActionResult$$ 
Create$$ #
($$# $
[$$$ %
FromBody$$% -
]$$- .&
CreateChargeStationCommand$$/ I
command$$J Q
)$$Q R
{%% 	
if&& 
(&& 
command&& 
==&& 
null&& 
)&&  
return'' 

BadRequest'' !
(''! "
)''" #
;''# $
var)) 
result)) 
=)) 
	_mediator)) "
.))" #
Send))# '
())' (
command))( /
)))/ 0
.))0 1
Result))1 7
;))7 8
if++ 
(++ 
!++ 
string++ 
.++ 
IsNullOrEmpty++ %
(++% &
result++& ,
.++, -
ErrorMessage++- 9
)++9 :
)++: ;
return,, 

StatusCode,, !
(,,! "
$num,," %
,,,% &
result,,' -
),,- .
;,,. /
var.. 
chargeStation.. 
=.. 
result..  &
...& '
Content..' .
as../ 1
ChargeStation..2 ?
;..? @
return00 
Created00 
(00 
$"00 
{00 
HttpContext00 )
.00) *
Request00* 1
.001 2
GetUri002 8
(008 9
)009 :
}00: ;
/00; <
{00< =
chargeStation00= J
.00J K
Id00K M
}00M N
"00N O
,00O P
result00Q W
)00W X
;00X Y
}11 	
[33 	

HttpDelete33	 
(33 
$str33 .
)33. /
]33/ 0
public44 
IActionResult44 
Delete44 #
(44# $
long44$ (
id44) +
)44+ ,
{55 	
if66 
(66 
id66 
<=66 
$num66 
)66 
return77 

BadRequest77 !
(77! "
)77" #
;77# $
var99 
chargeStation99 
=99 
new99  #
ChargeStation99$ 1
(991 2
id992 4
)994 5
;995 6
var:: &
deleteChargeStationCommand:: *
=::+ ,
new::- 0&
DeleteChargeStationCommand::1 K
(::K L
)::L M
{::N O
ChargeStation::P ]
=::^ _
chargeStation::` m
}::n o
;::o p
var<< 
result<< 
=<< 
	_mediator<< "
.<<" #
Send<<# '
(<<' (&
deleteChargeStationCommand<<( B
)<<B C
.<<C D
Result<<D J
;<<J K
if>> 
(>> 
!>> 
string>> 
.>> 
IsNullOrEmpty>> %
(>>% &
result>>& ,
.>>, -
ErrorMessage>>- 9
)>>9 :
)>>: ;
return?? 

StatusCode?? !
(??! "
$num??" %
,??% &
result??' -
)??- .
;??. /
returnAA 

StatusCodeAA 
(AA 
$numAA !
,AA! "
chargeStationAA# 0
)AA0 1
;AA1 2
}BB 	
[DD 	
HttpPutDD	 
(DD 
$strDD +
)DD+ ,
]DD, -
publicEE 
IActionResultEE 
UpdateEE #
(EE# $
longEE$ (
idEE) +
,EE+ ,
[EE- .
FromBodyEE. 6
]EE6 7&
UpdateChargeStationCommandEE8 R
commandEES Z
)EEZ [
{FF 	
ifGG 
(GG 
commandGG 
==GG 
nullGG 
)GG  
returnHH 

BadRequestHH !
(HH! "
)HH" #
;HH# $
varJJ 
resultJJ 
=JJ 
	_mediatorJJ "
.JJ" #
SendJJ# '
(JJ' (
commandJJ( /
)JJ/ 0
.JJ0 1
ResultJJ1 7
;JJ7 8
ifLL 
(LL 
!LL 
stringLL 
.LL 
IsNullOrEmptyLL %
(LL% &
resultLL& ,
.LL, -
ErrorMessageLL- 9
)LL9 :
)LL: ;
returnMM 

StatusCodeMM !
(MM! "
$numMM" %
,MM% &
resultMM' -
)MM- .
;MM. /
returnOO 
	NoContentOO 
(OO 
)OO 
;OO 
}PP 	
}QQ 
}RR ç2
|C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Controllers\ConnectorController.cs
	namespace 	
	GreenFlux
 
. 
SmartChargin  
.  !
API! $
.$ %
Controllers% 0
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
ConnectorController $
:% &

Controller' 1
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
public 
ConnectorController "
(" #
	IMediator# ,
mediator- 5
)5 6
{ 	
	_mediator 
= 
mediator  
;  !
} 	
[ 	
HttpGet	 
( 
$str #
)# $
]$ %
public 
IActionResult 
GetAllConnectors -
(- .
). /
{ 	
var #
getAllConnectorsCommand '
=( )
new* -#
GetAllConnectorsCommand. E
(E F
)F G
;G H
var 
result 
= 
	_mediator "
." #
Send# '
(' (#
getAllConnectorsCommand( ?
)? @
.@ A
ResultA G
;G H
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
result& ,
., -
ErrorMessage- 9
)9 :
): ;
return 

StatusCode !
(! "
$num" %
,% &
result' -
)- .
;. /
return   
Ok   
(   
result   
)   
;   
}!! 	
[## 	
HttpPost##	 
(## 
$str## #
)### $
]##$ %
public$$ 
IActionResult$$ 
Create$$ #
($$# $
[$$$ %
FromBody$$% -
]$$- .*
CreateOrUpdateConnectorCommand$$/ M
command$$N U
)$$U V
{%% 	
if&& 
(&& 
command&& 
==&& 
null&& 
)&&  
return'' 

BadRequest'' !
(''! "
)''" #
;''# $
var)) 
result)) 
=)) 
	_mediator)) "
.))" #
Send))# '
())' (
command))( /
)))/ 0
.))0 1
Result))1 7
;))7 8
if++ 
(++ 
!++ 
string++ 
.++ 
IsNullOrEmpty++ %
(++% &
result++& ,
.++, -
ErrorMessage++- 9
)++9 :
)++: ;
return,, 

StatusCode,, !
(,,! "
$num,," %
,,,% &
result,,' -
),,- .
;,,. /
var.. 
	connector.. 
=.. 
result.. "
..." #
Content..# *
as..+ -
	Connector... 7
;..7 8
return00 
Created00 
(00 
$"00 
{00 
HttpContext00 )
.00) *
Request00* 1
.001 2
GetUri002 8
(008 9
)009 :
}00: ;
/00; <
{00< =
	connector00= F
.00F G
Id00G I
}00I J
"00J K
,00K L
result00M S
)00S T
;00T U
}11 	
[33 	
HttpPut33	 
(33 
$str33 '
)33' (
]33( )
public44 
IActionResult44 
Update44 #
(44# $
[44$ %
FromBody44% -
]44- .*
CreateOrUpdateConnectorCommand44/ M
command44N U
)44U V
{55 	
if66 
(66 
command66 
==66 
null66 
)66  
return77 

BadRequest77 !
(77! "
)77" #
;77# $
var99 
result99 
=99 
	_mediator99 "
.99" #
Send99# '
(99' (
command99( /
)99/ 0
.990 1
Result991 7
;997 8
if;; 
(;; 
!;; 
string;; 
.;; 
IsNullOrEmpty;; %
(;;% &
result;;& ,
.;;, -
ErrorMessage;;- 9
);;9 :
);;: ;
return<< 

StatusCode<< !
(<<! "
$num<<" %
,<<% &
result<<' -
)<<- .
;<<. /
return>> 
	NoContent>> 
(>> 
)>> 
;>> 
}?? 	
[BB 	

HttpDeleteBB	 
(BB 
$strBB *
)BB* +
]BB+ ,
publicCC 
IActionResultCC 
DeleteCC #
(CC# $
longCC$ (
idCC) +
)CC+ ,
{DD 	
ifEE 
(EE 
idEE 
<=EE 
$numEE 
)EE 
returnFF 

BadRequestFF !
(FF! "
)FF" #
;FF# $
varHH 
	connectorHH 
=HH 
newHH 
	ConnectorHH  )
(HH) *
idHH* ,
)HH, -
;HH- .
varII "
deleteConnectorCommandII &
=II' (
newII) ,"
DeleteConnectorCommandII- C
(IIC D
)IID E
{IIF G
	ConnectorIIH Q
=IIR S
	connectorIIT ]
}II^ _
;II_ `
varKK 
resultKK 
=KK 
	_mediatorKK "
.KK" #
SendKK# '
(KK' ("
deleteConnectorCommandKK( >
)KK> ?
.KK? @
ResultKK@ F
;KKF G
ifMM 
(MM 
!MM 
stringMM 
.MM 
IsNullOrEmptyMM %
(MM% &
resultMM& ,
.MM, -
ErrorMessageMM- 9
)MM9 :
)MM: ;
returnNN 

StatusCodeNN !
(NN! "
$numNN" %
,NN% &
resultNN' -
)NN- .
;NN. /
returnPP 

StatusCodePP 
(PP 
$numPP !
,PP! "
	connectorPP# ,
)PP, -
;PP- .
}QQ 	
}RR 
}SS Ê1
xC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Controllers\GroupController.cs
	namespace 	
	GreenFlux
 
. 
SmartChargin  
.  !
API! $
.$ %
Controllers% 0
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
GroupController  
:! "

Controller# -
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
public 
GroupController 
( 
	IMediator (
mediator) 1
)1 2
{ 	
	_mediator 
= 
mediator  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
)  
]  !
public 
IActionResult 
GetAllGroups )
() *
)* +
{ 	
var 
getAllGroupsCommand #
=$ %
new& )
GetAllGroupsCommand* =
(= >
)> ?
;? @
var 
result 
= 
	_mediator "
." #
Send# '
(' (
getAllGroupsCommand( ;
); <
.< =
Result= C
;C D
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
result& ,
., -
ErrorMessage- 9
)9 :
): ;
return 

StatusCode !
(! "
$num" %
,% &
result' -
)- .
;. /
return   
Ok   
(   
result   
)   
;   
}!! 	
[## 	
HttpPost##	 
(## 
$str## 
)##  
]##  !
public$$ 
IActionResult$$ 
Create$$ #
($$# $
[$$$ %
FromBody$$% -
]$$- .
CreateGroupCommand$$/ A
command$$B I
)$$I J
{%% 	
if&& 
(&& 
command&& 
==&& 
null&& 
)&&  
return'' 

BadRequest'' !
(''! "
)''" #
;''# $
var)) 
result)) 
=)) 
	_mediator)) "
.))" #
Send))# '
())' (
command))( /
)))/ 0
.))0 1
Result))1 7
;))7 8
if++ 
(++ 
!++ 
string++ 
.++ 
IsNullOrEmpty++ %
(++% &
result++& ,
.++, -
ErrorMessage++- 9
)++9 :
)++: ;
return,, 

StatusCode,, !
(,,! "
$num,," %
,,,% &
result,,' -
),,- .
;,,. /
var.. 
group.. 
=.. 
result.. 
... 
Content.. &
as..' )
Group..* /
;../ 0
return00 
Created00 
(00 
$"00 
{00 
HttpContext00 )
.00) *
Request00* 1
.001 2
GetUri002 8
(008 9
)009 :
}00: ;
/00; <
{00< =
group00= B
.00B C
Id00C E
}00E F
"00F G
,00G H
result00I O
)00O P
;00P Q
}11 	
[33 	
HttpPut33	 
(33 
$str33 #
)33# $
]33$ %
public44 
IActionResult44 
Update44 #
(44# $
long44$ (
id44) +
,44+ ,
[44- .
FromBody44. 6
]446 7
UpdateGroupCommand447 I
command44J Q
)44Q R
{55 	
if66 
(66 
command66 
==66 
null66 
)66  
return77 

BadRequest77 !
(77! "
)77" #
;77# $
var99 
result99 
=99 
	_mediator99 "
.99" #
Send99# '
(99' (
command99( /
)99/ 0
.990 1
Result991 7
;997 8
if;; 
(;; 
!;; 
string;; 
.;; 
IsNullOrEmpty;; %
(;;% &
result;;& ,
.;;, -
ErrorMessage;;- 9
);;9 :
);;: ;
return<< 

StatusCode<< !
(<<! "
$num<<" %
,<<% &
result<<' -
)<<- .
;<<. /
return>> 
	NoContent>> 
(>> 
)>> 
;>> 
}?? 	
[AA 	

HttpDeleteAA	 
(AA 
$strAA &
)AA& '
]AA' (
publicBB 
IActionResultBB 
DeleteBB #
(BB# $
longBB$ (
idBB) +
)BB+ ,
{CC 	
ifDD 
(DD 
idDD 
<=DD 
$numDD 
)DD 
returnEE 

BadRequestEE !
(EE! "
)EE" #
;EE# $
varGG 
groupGG 
=GG 
newGG 
GroupGG !
(GG! "
idGG" $
)GG$ %
;GG% &
varHH "
deleteConnectorCommandHH &
=HH' (
newHH) ,
DeleteGroupCommandHH- ?
(HH? @
)HH@ A
{HHB C
GroupHHD I
=HHJ K
groupHHL Q
}HHR S
;HHS T
varJJ 
resultJJ 
=JJ 
	_mediatorJJ "
.JJ" #
SendJJ# '
(JJ' ("
deleteConnectorCommandJJ( >
)JJ> ?
.JJ? @
ResultJJ@ F
;JJF G
ifLL 
(LL 
!LL 
stringLL 
.LL 
IsNullOrEmptyLL %
(LL% &
resultLL& ,
.LL, -
ErrorMessageLL- 9
)LL9 :
)LL: ;
returnMM 

StatusCodeMM !
(MM! "
$numMM" %
,MM% &
resultMM' -
)MM- .
;MM. /
returnOO 

StatusCodeOO 
(OO 
$numOO !
,OO! "
groupOO# (
)OO( )
;OO) *
}PP 	
}QQ 
}RR œ&
ÉC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Extensions\ServiceCollectionExtensions.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "

Extensions" ,
{ 
public 

static 
class '
ServiceCollectionExtensions 3
{ 
public 
static 
IServiceCollection (
AddDependencies) 8
(8 9
this9 =
IServiceCollection> P
serviceCollectionQ b
)b c
{ 	
serviceCollection 
. 
AddMvc $
($ %
)% &
;& '
serviceCollection 
. 
AddControllers ,
(, -
)- .
;. /
serviceCollection 
. 
AddSwaggerGen +
(+ ,
swagger, 3
=>4 6
{ 
swagger 
. 

SwaggerDoc "
(" #
$str# '
,' (
new) ,
	Microsoft- 6
.6 7
OpenApi7 >
.> ?
Models? E
.E F
OpenApiInfoF Q
{R S
TitleT Y
=Z [
$str\ z
,z {
Version	| É
=
Ñ Ö
$str
Ü ä
}
ã å
)
å ç
;
ç é
} 
) 
; 
serviceCollection!! 
.!! 

AddMediatR!! (
(!!( )
typeof!!) /
(!!/ 0
Startup!!0 7
)!!7 8
)!!8 9
;!!9 :
serviceCollection"" 
."" 

AddMediatR"" (
(""( )
typeof"") /
(""/ 0
IRequestHandler""0 ?
<""? @
>""@ A
)""A B
)""B C
;""C D
serviceCollection## 
.## 

AddMediatR## (
(##( )
typeof##) /
(##/ 0
IRequestHandler##0 ?
<##? @
,##@ A
>##A B
)##B C
)##C D
;##D E
serviceCollection$$ 
.$$ 

AddMediatR$$ (
($$( )
typeof$$) /
($$/ 0 
INotificationHandler$$0 D
<$$D E
>$$E F
)$$F G
)$$G H
;$$H I
serviceCollection&& 
.&& 
TryAddSingleton&& -
<&&- . 
IHttpContextAccessor&&. B
,&&B C
HttpContextAccessor&&D W
>&&W X
(&&X Y
)&&Y Z
;&&Z [
serviceCollection'' 
.'' 
TryAddSingleton'' -
<''- ."
IActionContextAccessor''. D
,''D E!
ActionContextAccessor''F [
>''[ \
(''\ ]
)''] ^
;''^ _
serviceCollection)) 
.)) 
	AddScoped)) '
<))' (
IGroupRepository))( 8
,))8 9
GroupRepository)): I
>))I J
())J K
)))K L
;))L M
serviceCollection** 
.** 
	AddScoped** '
<**' ( 
IConnectorRepository**( <
,**< =
ConnectorRepository**> Q
>**Q R
(**R S
)**S T
;**T U
serviceCollection++ 
.++ 
	AddScoped++ '
<++' ($
IChargeStationRepository++( @
,++@ A#
ChargeStationRepository++B Y
>++Y Z
(++Z [
)++[ \
;++\ ]
return-- 
serviceCollection-- $
;--$ %
}.. 	
public00 
static00 
void00 
GetConfiguration00 +
(00+ ,
this00, 0
IConfiguration001 ?
configuration00@ M
,00M N
IWebHostEnvironment00O b
env00c f
)00f g
{11 	
var22 
buider22 
=22 
new22  
ConfigurationBuilder22 1
(221 2
)222 3
.223 4
SetBasePath224 ?
(22? @
env22@ C
.22C D
ContentRootPath22D S
)22S T
.333 4
AddJsonFile334 ?
(33? @
$str33@ R
,33R S
optional33T \
:33\ ]
false33^ c
,33c d
reloadOnChange33e s
:33s t
true33u y
)33y z
.443 4
AddJsonFile444 ?
(44? @
$"44@ B
appsettings.44B N
{44N O
env44O R
.44R S
EnvironmentName44S b
}44b c
.json44c h
"44h i
,44i j
optional44k s
:44s t
true44u y
)44y z
.553 4#
AddEnvironmentVariables554 K
(55K L
)55L M
;55M N
configuration77 
=77 
buider77 "
.77" #
Build77# (
(77( )
)77) *
;77* +
}88 	
}99 
}:: õ	
dC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Program.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
{ 
public		 

class		 
Program		 
{

 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
BuildWebHost 
( 
args 
) 
. 
Run "
(" #
)# $
;$ %
} 	
private 
static 
IWebHost 
BuildWebHost  ,
(, -
string- 3
[3 4
]4 5
args6 :
): ;
=>< >
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 

UseStartup 
< 
Startup &
>& '
(' (
)( )
. 
Build 
( 
) 
; 
} 
} ´
dC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.API\Startup.cs
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
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
_configuration ,
;, -
public 
Startup 
( 
IConfiguration %
configuration& 3
,3 4
IWebHostEnvironment5 H
envI L
)L M
{ 	
_configuration 
. 
GetConfiguration +
(+ ,
env, /
)/ 0
;0 1
} 	
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
serviceCollection9 J
)J K
{ 	
serviceCollection 
. 
AddDependencies -
(- .
). /
;/ 0
} 	
public 
void 
	Configure 
( 
IApplicationBuilder 1
app2 5
,5 6
IWebHostEnvironment7 J
envK N
)N O
{ 	
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
options $
=>% '
{ 
options 
. 
SwaggerEndpoint '
(' (
$str( B
,B C
$strD V
)V W
;W X
}   
)   
;   
if"" 
("" 
env"" 
."" 
IsDevelopment"" !
(""! "
)""" #
)""# $
app## 
.## %
UseDeveloperExceptionPage## -
(##- .
)##. /
;##/ 0
app%% 
.%% 

UseRouting%% 
(%% 
)%% 
;%% 
app&& 
.&& 
UseEndpoints&& 
(&& 
	endpoints&& &
=>&&' )
{'' 
	endpoints(( 
.(( 
MapControllers(( (
(((( )
)(() *
;((* +
})) 
))) 
;)) 
app++ 
.++ 
UseStatusCodePages++ "
(++" #
)++# $
;++$ %
},, 	
}-- 
}.. 
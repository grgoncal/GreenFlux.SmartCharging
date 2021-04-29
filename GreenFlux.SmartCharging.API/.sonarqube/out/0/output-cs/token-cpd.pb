ã	
vC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Entities\ChargeStation.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )
Entities) 1
{ 
public 

class 
ChargeStation 
{ 
public		 
ChargeStation		 
(		 
)		 
{

 	
} 	
public 
ChargeStation 
( 
long !
id" $
)$ %
{ 	
Id 
= 
id 
; 
} 	
public 
long 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
long 
GroupId 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ä	
rC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Entities\Connector.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )
Entities) 1
{ 
public 

class 
	Connector 
{ 
public		 
	Connector		 
(		 
)		 
{

 	
} 	
public 
	Connector 
( 
long 
id  
)  !
{ 	
Id 
= 
id 
; 
} 	
public 
long 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
decimal 

MaxCurrent !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
long 
ChargeStationId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ˆ
nC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Entities\Group.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )
Entities) 1
{ 
public 

class 
Group 
{ 
public		 
Group		 
(		 
)		 
{

 	
} 	
public 
Group 
( 
long 
id 
) 
{ 	
Id 
= 
id 
; 
} 	
public 
long 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
decimal 
CurrentCapacity &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ©
C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Entities\Mediator\Base\Response.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )
Entities) 1
.1 2
Mediator2 :
.: ;
Base; ?
{ 
public 

class 
Response 
{ 
public		 
long		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
object

 
Content

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
string 
ErrorMessage "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} Â
uC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Enums\ValidationLevel.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )
Enums) .
{ 
public 

enum 
ValidationLevel 
{ 
Info		 
,		 
Warning

 
,

 
Error 
} 
} á
pC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\GeneralConstants.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
{ 
public 

static 
class 
GeneralConstants (
{ 
public		 
const		 
long		  
MAX_CONNECTOR_NUMBER		 .
=		/ 0
$num		1 2
;		2 3
}

 
} Ú

ÖC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Repositories\IChargeStationRepository.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )
Repositories) 5
{ 
public 

	interface $
IChargeStationRepository -
{		 
void

 
CreateChargeStation

  
(

  !
ChargeStation

! .
chargeStation

/ <
)

< =
;

= >
ChargeStation  
GetChargeStationById *
(* +
long+ /
chargeStationId0 ?
)? @
;@ A
List 
< 
ChargeStation 
> )
GetChargeStationListByGroupId 9
(9 :
long: >
groupId? F
)F G
;G H
void 
DeleteChargeStation  
(  !
ChargeStation! .
chargeStation/ <
)< =
;= >
void 
UpdateChargeStation  
(  !
ChargeStation! .
chargeStation/ <
)< =
;= >
List 
< 
ChargeStation 
>  
GetAllChargeStations 0
(0 1
)1 2
;2 3
} 
} π
ÅC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Repositories\IConnectorRepository.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )
Repositories) 5
{ 
public 

	interface  
IConnectorRepository )
{		 
void

 
CreateConnector

 
(

 
	Connector

 &
	connector

' 0
)

0 1
;

1 2
void 
UpdateConnector 
( 
	Connector &
	connector' 0
)0 1
;1 2
	Connector 
GetConnectorById "
(" #
long# '
id( *
)* +
;+ ,
List 
< 
	Connector 
> *
GetConnectorsByChargeStationId 6
(6 7
long7 ;
chargeStationId< K
)K L
;L M
List 
< 
	Connector 
> +
GetConnectorsByChargeStationIds 7
(7 8
List8 <
<< =
ChargeStation= J
>J K
chargeStationListL ]
)] ^
;^ _
void 
DeleteConnector 
( 
	Connector &
	connector' 0
)0 1
;1 2
List 
< 
	Connector 
> 
GetAllConnectors (
(( )
)) *
;* +
} 
} ß
}C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Repositories\IGroupRepository.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )
Repositories) 5
{ 
public 

	interface 
IGroupRepository %
{		 
void

 
CreateGroup

 
(

 
Group

 
group

 $
)

$ %
;

% &
Group 
GetGroupById 
( 
long 
groupId  '
)' (
;( )
void 
DeleteGroup 
( 
Group 
group $
)$ %
;% &
void 
UpdateGroup 
( 
Group 
group $
)$ %
;% &
List 
< 
Group 
> 
GetAllGroups  
(  !
)! "
;" #
} 
} ˝
xC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Validation\RestException.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )

Validation) 3
{ 
public 

class 
RestException 
:  
	Exception! *
{ 
public		 
RestException		 
(		 
)		 
:		  
base		! %
(		% &
)		& '
{

 	
ValidationMessages 
=  
new! $
List% )
<) *
ValidationMessage* ;
>; <
(< =
)= >
;> ?
} 	
public 
RestException 
( 
string #
errorMessage$ 0
)0 1
:2 3
base4 8
(8 9
errorMessage9 E
)E F
{ 	
ValidationMessages 
=  
new! $
List% )
<) *
ValidationMessage* ;
>; <
(< =
)= >
;> ? 
AddValidationMessage  
(  !
errorMessage! -
)- .
;. /
} 	
private 
void  
AddValidationMessage )
() *
string* 0
errorMessage1 =
)= >
{ 	
var 
validationMessage !
=" #
new$ '
ValidationMessage( 9
(9 :
errorMessage: F
,F G
EnumsH M
.M N
ValidationLevelN ]
.] ^
Error^ c
)c d
;d e
ValidationMessages 
. 
Add "
(" #
validationMessage# 4
)4 5
;5 6
} 	
public 
List 
< 
ValidationMessage %
>% &
ValidationMessages' 9
{: ;
get< ?
;? @
setA D
;D E
}F G
} 
} º
|C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Validation\ValidationMessage.cs
	namespace 	
	GreenFlux
 
. 
SmartCharging !
.! "
Domain" (
.( )

Validation) 3
{ 
public 

class 
ValidationMessage "
{		 
public

 
ValidationMessage

  
(

  !
string

! '
message

( /
,

/ 0
ValidationLevel

1 @
level

A F
)

F G
{ 	
Message 
= 
message 
; 
Level 
= 
level 
; 
} 	
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
ValidationLevel 
Level $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} 
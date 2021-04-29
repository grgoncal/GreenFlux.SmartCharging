�	
vC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Entities\ChargeStation.cs
	namespace 	
	GreenFlux
 
. 

.! "
Domain" (
.( )
Entities) 1
{ 
public 

class 

{ 
public		 

(		 
)		 
{

 	
} 	
public

(
long
id
)
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
} �	
rC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Entities\Connector.cs
	namespace 	
	GreenFlux
 
. 

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
public
	Connector
(
long
id
)
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
} �
nC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Entities\Group.cs
	namespace 	
	GreenFlux
 
. 

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
public
Group
(
long
id
)
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
} �
C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Entities\Mediator\Base\Response.cs
	namespace 	
	GreenFlux
 
. 

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
}
uC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Enums\ValidationLevel.cs
	namespace 	
	GreenFlux
 
. 

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
,		 
Warning

 
,

 
Error 
} 
}
pC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\GeneralConstants.cs
	namespace 	
	GreenFlux
 
. 

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
} �

�C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Repositories\IChargeStationRepository.cs
	namespace 	
	GreenFlux
 
. 

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

(

  !


! .


/ <
)

< =
;

= >

GetChargeStationById *
(* +
long+ /
chargeStationId0 ?
)? @
;@ A
List 
< 

> )
GetChargeStationListByGroupId 9
(9 :
long: >
groupId? F
)F G
;G H
void
DeleteChargeStation
(


)
;
void 
UpdateChargeStation
(  !


)< =
;= >
List 
< 

>  
GetAllChargeStations 0
(0 1
)1 2
;2 3
} 
} �
�C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Repositories\IConnectorRepository.cs
	namespace 	
	GreenFlux
 
. 

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

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
UpdateConnector
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
List
<
	Connector
>
GetConnectorsByChargeStationId
(
long
chargeStationId
)
;
List 
< 
	Connector
> +
GetConnectorsByChargeStationIds 7
(7 8
List8 <
<< =

>J K
chargeStationListL ]
)] ^
;^ _
void 
DeleteConnector
( 
	Connector &
	connector' 0
)0 1
;1 2
List 
< 
	Connector
> 
GetAllConnectors (
(( )
)) *
;* +
} 
} �
}C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Repositories\IGroupRepository.cs
	namespace 	
	GreenFlux
 
. 

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

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
Group 
GetGroupById 
( 
long 
groupId  '
)' (
;( )
void 
DeleteGroup
( 
Group 
group $
)$ %
;% &
void
UpdateGroup
(
Group
group
)
;
List 
< 
Group
> 
GetAllGroups  
(  !
)! "
;" #
} 
} �
xC:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Validation\RestException.cs
	namespace 	
	GreenFlux
 
. 

.! "
Domain" (
.( )

Validation) 3
{ 
public 

class 

:  
	Exception! *
{ 
public		 

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
} �
|C:\Users\Guilherme Rocha\source\repos\GreenFlux.SmartCharging\GreenFlux.SmartCharging.Domain\Validation\ValidationMessage.cs
	namespace 	
	GreenFlux
 
. 

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
Level
=
level
;
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
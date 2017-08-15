#include <File.au3>
#include <Crypt.au3>
#include <Misc.au3>
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>


Global $PokemonList [1][3]

$Key1Flag=0
$Key2Flag=0
Global $calc=0
Global $Data="PokeOsu.txt"
Global $MonData="MonData.txt"
ConsoleWrite ($data)

Global $PokemonFR[802]=["Bulbizarre","Herbizarre","Florizarre","Salameche","Reptincel","Dracaufeu","Carapuce","Carabaffe","Tortank","Chenipan","Chrysacier","Papilusion","Aspicot","Coconfort","Dardargnan","Roucool","Roucoups","Roucarnage","Rattata","Rattatac","Piafabec","Rapasdepic","Abo","Arbok","Pikachu","Raichu","Sabelette","Sablaireau","NidoranF","Nidorina","Nidoqueen","NidoranM","Nidorino","Nidoking","Melofee","Melodelfe","Goupix","Feunard","Rondoudou","Grodoudou","Nosferapti","Nosferalto","Mystherbe","Ortide","Rafflesia","Paras","Parasect","Mimitoss","Aeromite","Taupiqueur","Triopikeur","Miaouss","Persian","Psykokwak","Akwakwak","Ferosinge","Colossinge","Caninos","Arcanin","Ptitard","Tetarte","Tartard","Abra","Kadabra","Alakazam","Machoc","Machopeur","Mackogneur","Chetiflor","Boustiflor","Empiflor","Tentacool","Tentacruel","Racaillou","Gravalanch","Grolem","Ponyta","Galopa","Ramoloss","Flagadoss","Magneti","Magneton","Canarticho","Doduo","Dodrio","Otaria","Lamantine","Tadmorv","Grotadmorv","Kokiyas","Crustabri","Fantominus","Spectrum","Ectoplasma","Onix","Soporifik","Hypnomade","Krabby","Krabboss","Voltorbe","Electrode","Noeunoeuf","Noadkoko","Osselait","Ossatueur","Kicklee","Tygnon","Excelangue","Smogo","Smogogo","Rhinocorne","Rhinoferos","Leveinard","Saquedeneu","Kangourex","Hypotrempe","Hypocean","Poissirene","Poissoroy","Stari","Staross","M. Mime","Insecateur","Lippoutou","Elektek","Magmar","Scarabrute","Tauros","Magicarpe","Leviator","Lokhlass","Metamorph","Evoli","Aquali","Voltali","Pyroli","Porygon","Amonita","Amonistar","Kabuto","Kabutops","Ptera","Ronflex","Artikodin","Electhor","Sulfura","Minidraco","Draco","Dracolosse","Mewtwo","Mew","Germignon","Macronium","Meganium","Hericendre","Feurisson","Typhlosion","Kaiminus","Crocrodil","Aligatueur","Fouinette","Fouinar","Hoothoot","Noarfang","Coxy","Coxyclaque","Mimigal","Migalos","Nostenfer","Loupio","Lanturn","Pichu","Melo","Toudoudou","Togepi","Togetic","Natu","Xatu","Wattouat","Lainergie","Pharamp","Joliflor","Marill","Azumarill","Simularbre","Tarpaud","Granivol","Floravol","Cotovol","Capumain","Tournegrin","Heliatronc","Yanma","Axoloto","Maraiste","Mentali","Noctali","Cornebre","Roigada","Feuforeve","Zarbi","Qulbutoke","Girafarig","Pomdepik","Foretress","Insolourdo","Scorplane","Steelix","Snubbull","Granbull","Qwilfish","Cizayox","Caratroc","Scarhino","Farfuret","Teddiursa","Ursaring","Limagma","Volcaropod","Marcacrin","Cochignon","Corayon","Remoraid","Octillery","Cadoizo","Demanta","Airmure","Malosse","Demolosse","Hyporoi","Phanpy","Donphan","Porygon2","Cerfrousse","Queulorior","Debugant","Kapoera","Lippouti","Elekid","Magby","Ecremeuh","Leuphorie","Raikou","Entei","Suicune","Embrylex","Ymphect","Tyranocif","Lugia","Ho-Oh","Celebi","Arcko","Massko","Jungko","Poussifeu","Galifeu","Brasegali","Gobou","Flobio","Laggron","Medhyena","Grahyena","Zigzaton","Lineon","Chenipotte","Armulys","Charmillon","Blindalys","Papinox","Nenupiot","Lombre","Ludicolo","Grainipiot","Pifeuil","Tengalice","Nirondelle","Heledelle","Goelise","Bekipan","Tarsal","Kirlia","Gardevoir","Arakdo","Maskadra","Balignon","Chapignon","Parecool","Vigoroth","Monaflemit","Ningale","Ninjask","Munja","Chuchmur","Ramboum","Brouhabam","Makuhita","Hariyama","Azurill","Tarinor","Skitty","Delcatty","Tenefix","Mysdibule","Galekid","Galegon","Galeking","Meditikka","Charmina","Dynavolt","Elecsprint","Posipi","Negapi","Muciole","Lumivole","Roselia","Gloupti","Avaltout","Carvanha","Sharpedo","Wailmer","Wailord","Chamallot","Camerupt","Chartor","Spoink","Groret","Spinda","Kraknoix","Vibraninf","Libegon","Cacnea","Cacturne","Tylton","Altaria","Mangriff","Seviper","Seleroc","Solaroc","Barloche","Barbicha","Ecrapince","Colhomard","Balbuto","Kaorine","Lilia","Vacilys","Anorith","Armaldo","Barpau","Milobellus","Morpheo","Kecleon","Polichombr","Branette","Skelenox","Teraclope","Tropius","Eoko","Absol","Okeoke","Stalgamin","Oniglali","Obalie","Phogleur","Kaimorse","Coquiperl","Serpang","Rosabyss","Relicanth","Lovdisc","Draby","Drackhaus","Drattak","Terhal","Metang","Metalosse","Regirock","Regice","Registeel", _
						"Latias","Latios","Kyogre","Groudon","Rayquaza","Jirachi","Deoxys","Tortipouss","Boskara","Torterra","Ouisticram","Chimpenfeu","Simiabraz","Tiplouf","Prinplouf","Pingoleon","Etourmi","Etourvol","Etouraptor","Keunotor","Castorno","Crikzik","Melokrik","Lixy","Luxio","Luxray","Rozbouton","Roserade","Kranidos","Charkos","Dinoclier","Bastiodon","Cheniti","Cheniselle","Papilord","Apitrini","Apireine","Pachirisu","Mustebouee","Musteflott","Ceribou","Ceriflor","Sancoki","Tritosor","Capidextre","Baudrive","Grodrive","Laporeille","Lockpin","Magireve","Corboss","Chaglam","Chaffreux","Korillon","Moufouette","Moufflair","Archeomire","Archeodong","Manzai","Mime Jr.","Ptiravi","Pijako","Spiritomb","Griknot","Carmache","Carchacrok","Goinfrex","Riolu","Lucario","Hippopotas","Hippodocus","Rapion","Drascore","Cradopaud","Coatox","Vortente","Ecayon","Lumineon","Babimanta","Blizzi","Blizzaroi","Dimoret","Magnezone","Coudlangue","Rhinastoc","Bouldeneu","Elekable","Maganon","Togekiss","Yanmega","Phyllali","Givrali","Scorvol","Mammochon","Porygon-Z","Gallame","Tarinorme","Noctunoir","Momartik","Motisma","Crehelf","Crefollet","Crefadet","Dialga","Palkia","Heatran","Regigigas","Giratina","Cresselia","Phione","Manaphy","Darkrai","Shaymin","Arceus","Victini","Vipelierre","Lianaja","Majaspic","Gruikui","Grotichon","Roitiflam","Moustillon","Mateloutre","Clamiral","Ratentif","Miradar","Ponchiot","Ponchien","Mastouffe","Chacripan","Leopardus","Feuillajou","Feuiloutan","Flamajou","Flamoutan","Flotajou","Flotoutan","Munna","Mushana","Poichigeon","Colombeau","Deflaisan","Zebibron","Zeblitz","Nodulithe","Geolithe","Gigalithe","Chovsourir","Rhinolove","Rototaupe","Minotaupe","Nanmeouie","Charpenti","Ouvrifier","Betochef","Tritonde","Batracne","Crapustule","Judokrak","Karaclee","Larveyette","Couverdure","Manternel","Venipatte","Scobolide","Brutapode","Doudouvet","Farfaduvet","Chlorobule","Fragilady","Bargantua","Mascaiman","Escroco","Crocorible","Darumarond","Darumacho","Maracachi","Crabicoque","Crabaraque","Baggiguane","Baggaid","Cryptero","Tutafeh","Tutankafer","Carapagos","Megapagos","Arkeapti","Aeropteryx","Miamiasme","Miasmax","Zorua","Zoroark","Chinchidou","Pashmilla","Scrutella","Mesmerella","Siderella","Nucleos","Meios","Symbios","Couaneton","Lakmecygne","Sorbebe","Sorboul","Sorbouboul","Vivaldaim","Haydaim","Emolga","Carabing","Lancargot","Trompignon","Gaulet","Viskuse","Moyade","Mamanbo","Statitik","Mygavolt","Grindur","Noacier","Tic","Clic","Cliticlic","Anchwatt","Lamperoie","Ohmassacre","Lewsor","Neitram","Funecire","Melancolux","Lugulabre","Coupenotte","Incisache","Tranchodon","Polarhume","Polagriffe","Hexagel","Escargaume","Limaspeed","Limonde","Kungfouine","Shaofouine","Drakkarmin","Gringolem","Golemastoc","Scalpion","Scalproie","Frison","Furaiglon","Gueriaigle","Vostourno","Vaututrice","Aflamanoir","Fermite","Solochi","Diamat","Trioxhydre","Pyronille","Pyrax","Cobaltium","Terrakium","Viridium","Boreas","Fulguris","Reshiram","Zekrom","Demeteros","Kyurem","Keldeo","Meloetta","Genesect","Marisson","Boguerisse","Blindepique","Feunnec","Roussil","Goupelin","Grenousse","Croaporal","Amphinobi","Sapereau","Excavarenne","Passerouge","Braisillon","Flambusard","Lepidonille","Peregrain","Prismillon","Helionceau","Nemelios","Flabebe","Floette","Florges","Cabriolaine","Chevroum","Pandespiegle","Pandarbare","Couafarel","Psystigri","Mistigrix","Monorpale","Dimocles","Exagide","Fluvetin","Cocotine","Sucroquin","Cupcanaille","Sepiatop","Sepiatroce","Opermine","Golgopathe","Venalgue","Kravarech","Flingouste","Gamblast","Galvaran","Iguolta","Ptyranidur","Rexillius","Amagara","Dragmara","Nymphali","Brutalibre","Dedenne","Strassie","Mucuscule","Colimucus","Muplodocus","Trousselin","Brocelome","Desseliande","Pitrouille","Banshitrouye","Grelacon","Seracrawl","Sonistrelle","Bruyverne","Xerneas","Yveltal","Zygarde","Diancie","Hoopa","Brindibou","Effleche","Archeduc","Flamiaou","Matoufeu","Felinferno","Otaquin","Otarlette","Oratoria","Picassaut","Piclairon","Bazoucan","Manglouton","Argouste","Larvibule","Chrysapile","Lucanon", _
						"Crabagarre","Crabominable","Plumeline","Bombydou","Rubombelle","Rocabot","Lougaroc","Froussardine","Vorasterie","Predasterie","Tiboudet","Bourrinos","Araqua","Tarenbulle","Mimantis","Floramantis","Spododo","Lampignon","Tritox","Malamandre","Nounourson","Chelours","Croquine","Candine","Sucreine","Guerilande","Gouroutan","Quartermac","Sovkipou","Sarmurai","Bacabouh","Trepassable","Concombaffe","Type:0","Silvallie","Meteno","Dodoala","Boumata","Togedemaru","Mimiqui","Denticrisse","Draieul","Sinistrail","Bebecaille","Ecaid","Ekaiser","Tokorico","Tokotoro","Tokopiyon","Tokopisco","Cosmog","Cosmovum","Solgaleo","Lunala","Zeroid","Mouscoto","Cancrelove","Cablifere","Bamboiselle","Katagami","Engloutyran","Necrozma","Magearna","Marshadow"]

$Exist=FileExists ($Data)

If $exist=0 Then
   _FileCreate ($Data)
   FileWrite ($data,"57"&@crlf&"58"&@CRLF&"0"&@CRLF&"0"&@CRLF&"0"&@CRLF&""&@CRLF&""&@CRLF&""&@CRLF&""&@CRLF&""&@CRLF&""&@CRLF&"")
EndIf

$Exist=FileExists ($MonData)

If $exist=0 Then
   _FileCreate ($MonData)
   FileWriteLine ($MonData, "Pokemon|Shiny|Obscur"&@CRLF)
EndIf


$K1=FileReadLine ($Data,1)
$K2=FileReadLine ($Data,2)

HotKeySet ("^q","Quit")
HotKeySet ("^!o","Options")
HotKeySet ("!p","Pokemon")
HotKeySet ("!a","Add")
;HotKeySet ($K1,"Encounter")
;HotKeySet ($K2,"Encounter")


MsgBox (1,"Osumon","- Ctrl+Alt+O pour ouvrir les options"&@CRLF&"- Ctrl+Q pour quitter"&@CRLF&"- Alt+P pour voir Pokémon capturés (elle apparaitra audessus de la boite des rencontres)"&@crlf&"- Alt+A pour ajouter le Pokémon selectionné a la liste des Pokémon capturés"&@crlf&"- Pour les touches dans les options utilisez Keys.txt)
;https://www.autoitscript.fr/autoit3/docs/libfunctions/_IsPressed.htm

Call ("Pokedex")

Global $EncounterLab=GUICtrlCreateLabel ("WAIT IT'S LOADING",5,450)
Global $ShinyLab=GUICtrlCreateLabel ("WAIT IT'S LOADING",110,450)
Global $DarkLab=GUICtrlCreateLabel ("WAIT IT'S LOADING",170,450)

GUICtrlSetData ($ShinyLab,FileReadLine ($data,4))
Global $calc2=FileReadLine ($data,3)
GUICtrlSetData ($EncounterLab,$calc2)
GUICtrlSetData ($DarkLab,FileReadLine ($data,5))
Global $isPokemon=0

While 1
   Sleep (10)
   if _IsPressed ($K1) Then
	  If $Key1Flag=0 Then
		 $Key1Flag=1
		 Call ("Encounter")
	  EndIf
   Else
	  $Key1Flag=0
   EndIf

   if _IsPressed ($K2) Then
	  If $Key2Flag=0 Then
		 $Key2Flag=1
		 Call ("Encounter")
	  EndIf
   Else
	  $Key2Flag=0
   EndIf
WEnd


Func Add ()
   ;$Chosen=GUICtrlRead ($Hlistview)
   ;ConsoleWrite ($chosen)
   $LigneASplit=_GUICtrlListView_GetItemTextArray ($hlistview,-1)
   FileWriteLine($MonData,$LigneASplit[1]&"|"&$LigneASplit[2]&"|"&$LigneASplit[3])

   If $IsPokemon=1 Then
	  GUICtrlCreateListViewItem ($LigneASplit[1]&"|"&$LigneASplit[2]&"|"&$LigneASplit[3],$hlistview2)

	  If $LigneASplit[2]="*" Then
		 GUICtrlSetBkColor(-1, 0xFFFF00)
	  EndIf

	  If $LigneASplit[3]="¤" Then
		 GUICtrlSetBkColor(-1, 0xAAAAAA)
	  EndIf

	  If $LigneASplit[2]="*" And $LigneASplit[3]="¤" Then GUICtrlSetBkColor(-1, 0x888800)
   EndIf


EndFunc

Func Pokemon ()
   Global $IsPokemon=1
   $Lines=_FileCountLines ($MonData)
   Global $PokemonCaught[1][3]
   _arraydisplay3 ($PokemonCaught)
   GUICtrlDelete ($hCopy)

   $i=1
   While $i<=$lines
	  $lul=FileReadLine ($mondata,$i)
	  Local $LigneASplit[4]


	  $LigneASplit=StringSplit ($lul,"|",1)

	  GUICtrlCreateListViewItem ($lul,$hlistview2)

	  If $LigneASplit[2]="*" Then
		 GUICtrlSetBkColor(-1, 0xFFFF00)
	  EndIf

	  If $LigneASplit[3]="¤" Then
		 GUICtrlSetBkColor(-1, 0xAAAAAA)
	  EndIf

	  If $LigneASplit[2]="*" And $LigneASplit[3]="¤" Then GUICtrlSetBkColor(-1, 0x888800)

	  $i=$i+1
   WEnd

   HotKeySet ("!p","ClosePokemon")

EndFunc

Func ClosePokemon ()
   $IsPokemon=0
   GUIDelete ($Hgui2)
   HotKeySet ("!p","Pokemon")
EndFunc

Func Pokedex ()
   _arraydisplay2 ($PokemonList)

   ;GUICreate ("Pokedex",200,400)
   ;Global $hlistview=GUICtrlCreateListView ("",0,0,200,400,$LVS_SHOWSELALWAYS)
   ;GUISetState (@sw_show)
   GUICtrlDelete ($hCopy)
   Global $ShinyLab=GUICtrlCreateLabel ("Shinies:",110,432)
   Global $EncounterLab=GUICtrlCreateLabel ("Rencontres :",5,432)
   Global $DarkLab=GUICtrlCreateLabel ("Obscurs :",170,432)
EndFunc

Func Encounter ()
   $Specie=Random (0,801)
   $Specie=$PokemonFR[$Specie]
   ;ConsoleWrite ($specie)

   $Shiny=Random (1,8192,1)
   If $Shiny<>1 Then
	  $Shiny=""
   Else
	  $Shiny="*"
   EndIf

   $Dark=Random (1,1000000,1)
   If $Dark<>1 Then
	  $Dark=""
   Else
	  $Dark="¤"
   EndIf


   $PokemonList[$calc][0]=$Specie
   $PokemonList[$calc][1]=$Shiny
   $PokemonList[$calc][2]=$Dark
   ReDim $PokemonList[$calc+2][3]

   ;TrayTip ("Pokemon!",$Specie&" "&$Shiny&" "&$dark,1000)

   $calc=$calc+1
   GUICtrlSetData ($EncounterLab,$calc2+$calc)
   GUICtrlCreateListViewItem ($Specie&"|"&$Shiny&"|"&$dark,$hListView)
   ;GUICtrlCreateListView
   If $shiny="*" and $dark<>"¤" Then
	  GUICtrlSetBkColor(-1, 0xFFFF00)
	  $Shiny=FileReadLine ($data,4)
	  _FileWriteToLine ($data,4,$Shiny+1,True)
	  GUICtrlSetData ($ShinyLab,$Shiny+1)
   EndIf

   If $dark="¤" and $shiny<>"*" Then
	  GUICtrlSetBkColor(-1, 0xAAAAAA)
	  FileReadLine ($data,5)
	  _FileWriteToLine ($data,5,FileReadLine ($data,5)+1,True)
	  GUICtrlSetData ($DarkLab,FileReadLine ($data,5))
   EndIf

   If $shiny="*" And $dark="¤" Then
	  GUICtrlSetBkColor(-1,0x888800)
   EndIf

   ;ConsoleWrite ($calc&@crlf)
   _GUICtrlListView_EnsureVisible ( $hlistview, $calc , True )
EndFunc

Func Options ()
   $GUIOption=GUICreate ("Options",400,400)
   GUISetState (@SW_SHOW,$GUIOption)
   GUICtrlCreateLabel ("Key 1:",10,20)
   $K1Box=GUICtrlCreateInput ($K1,42,17,20,20)
   GUICtrlCreateLabel ("Key 2:",10,50)
   $K2Box=GUICtrlCreateInput ($K2,42,47,20,20)
   $Confirm=GUICtrlCreateButton ("CONFIRMER",10,100,180,200)
   $Cancel=GUICtrlCreateButton ("ANNULER",200,100,180,200)
   While 1
	  $Msg=GUIGetMsg ()

	  Select
		 Case $Msg=$Confirm
			$K1=GUICtrlRead ($K1Box)
			$K2=GUICtrlRead ($K2Box)
			_FileWriteToLine ($Data,1,$K1,True)
			_FileWriteToLine ($Data,2,$K2,True)
			GUIDelete ($GUIOption)
			ExitLoop

		 Case $Msg=$Cancel
			GUIDelete ($GUIOption)
			ExitLoop

		 Case $Msg=$GUI_EVENT_CLOSE
			GUIDelete ($GUIOption)
			ExitLoop
		 EndSelect
	  WEnd

EndFunc

Func Quit ()
   _FileWriteToLine ($data,3,$calc2+$calc,True)

   Exit
EndFunc

Func _ArrayDisplay2(Const ByRef $avArray, $sTitle = "Rencontres", $iItemLimit = -1, $iTranspose = 0, $sSeparator = "", $sReplace = "|", $sHeader = "")
	If Not IsArray($avArray) Then Return SetError(1, 0, 0)
	; Dimension checking
	Local $iDimension = UBound($avArray, 0), $iUBound = UBound($avArray, 1) - 1, $iSubMax = UBound($avArray, 2) - 1
	If $iDimension > 2 Then Return SetError(2, 0, 0)

	; Separator handling
	If $sSeparator = "" Then $sSeparator = Chr(124)

	;  Check the separator to make sure it's not used literally in the array
	If _ArraySearch($avArray, $sSeparator, 0, 0, 0, 1) <> -1 Then
		For $x = 1 To 255
			If $x >= 32 And $x <= 127 Then ContinueLoop
			Local $sFind = _ArraySearch($avArray, Chr($x), 0, 0, 0, 1)
			If $sFind = -1 Then
				$sSeparator = Chr($x)
				ExitLoop
			EndIf
		Next
	EndIf

	; Declare variables
	Local $vTmp, $iBuffer = 4094 ; AutoIt max item size
	Local $iColLimit = 250
	Local $iOnEventMode = Opt("GUIOnEventMode", 0), $sDataSeparatorChar = Opt("GUIDataSeparatorChar", $sSeparator)

	; Swap dimensions if transposing
	If $iSubMax < 0 Then $iSubMax = 0
	If $iTranspose Then
		$vTmp = $iUBound
		$iUBound = $iSubMax
		$iSubMax = $vTmp
	EndIf

	; Set limits for dimensions
	If $iSubMax > $iColLimit Then $iSubMax = $iColLimit
	If $iItemLimit < 1 Then $iItemLimit = $iUBound
	If $iUBound > $iItemLimit Then $iUBound = $iItemLimit

	; Set header up
	If $sHeader = "" Then
		$sHeader = "Row  " ; blanks added to adjust column size for big number of rows
		For $i = 0 To $iSubMax
			$sHeader &= $sSeparator & "Col " & $i
		Next
	EndIf

	; Convert array into text for listview
	Local $avArrayText[$iUBound + 1]
	For $i = 0 To $iUBound
		$avArrayText[$i] = "[" & $i & "]"
		For $j = 0 To $iSubMax
			; Get current item
			If $iDimension = 1 Then
				If $iTranspose Then
					$vTmp = $avArray[$j]
				Else
					$vTmp = $avArray[$i]
				EndIf
			Else
				If $iTranspose Then
					$vTmp = $avArray[$j][$i]
				Else
					$vTmp = $avArray[$i][$j]
				EndIf
			EndIf

			; Add to text array
			$vTmp = StringReplace($vTmp, $sSeparator, $sReplace, 0, 1)

			; Set max buffer size
			If StringLen($vTmp) > $iBuffer Then $vTmp = StringLeft($vTmp, $iBuffer)

			$avArrayText[$i] &= $sSeparator & $vTmp
		Next
	Next

	; GUI Constants
	Local Const $_ARRAYCONSTANT_GUI_DOCKBORDERS = 0x66
	Local Const $_ARRAYCONSTANT_GUI_DOCKBOTTOM = 0x40
	Local Const $_ARRAYCONSTANT_GUI_DOCKHEIGHT = 0x0200
	Local Const $_ARRAYCONSTANT_GUI_DOCKLEFT = 0x2
	Local Const $_ARRAYCONSTANT_GUI_DOCKRIGHT = 0x4
	Local Const $_ARRAYCONSTANT_GUI_EVENT_CLOSE = -3
	Local Const $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH = (0x1000 + 29)
	Local Const $_ARRAYCONSTANT_LVM_GETITEMCOUNT = (0x1000 + 4)
	Local Const $_ARRAYCONSTANT_LVM_GETITEMSTATE = (0x1000 + 44)
	Local Const $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE = (0x1000 + 54)
	Local Const $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT = 0x20
	Local Const $_ARRAYCONSTANT_LVS_EX_GRIDLINES = 0x1
	Local Const $_ARRAYCONSTANT_LVS_SHOWSELALWAYS = 0x8
	Local Const $_ARRAYCONSTANT_WS_EX_CLIENTEDGE = 0x0200
	Local Const $_ARRAYCONSTANT_WS_MAXIMIZEBOX = 0x00010000
	Local Const $_ARRAYCONSTANT_WS_MINIMIZEBOX = 0x00020000
	Local Const $_ARRAYCONSTANT_WS_SIZEBOX = 0x00040000

	; Set interface up
	Global $iWidth = 640, $iHeight = 480
	Global $hGUI = GUICreate($sTitle, $iWidth, $iHeight+20, Default, Default, BitOR($_ARRAYCONSTANT_WS_SIZEBOX, $_ARRAYCONSTANT_WS_MINIMIZEBOX, $_ARRAYCONSTANT_WS_MAXIMIZEBOX))
	Global $aiGUISize = WinGetClientSize($hGUI)
	Global $hListView = GUICtrlCreateListView($sHeader, 0, 0, $aiGUISize[0], $aiGUISize[1] - 46, $_ARRAYCONSTANT_LVS_SHOWSELALWAYS)
	Global $hCopy = GUICtrlCreateButton("Copy Selected", 3, $aiGUISize[1] - 23, $aiGUISize[0] - 6, 20)
	GUICtrlSetResizing($hListView, $_ARRAYCONSTANT_GUI_DOCKBORDERS)
	GUICtrlSetResizing($hCopy, $_ARRAYCONSTANT_GUI_DOCKLEFT + $_ARRAYCONSTANT_GUI_DOCKRIGHT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT)
	GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_LVS_EX_GRIDLINES, $_ARRAYCONSTANT_LVS_EX_GRIDLINES)
	GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT, $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT)
	GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_WS_EX_CLIENTEDGE, $_ARRAYCONSTANT_WS_EX_CLIENTEDGE)

	; Fill listview
	For $i = 0 To $iUBound
		GUICtrlCreateListViewItem($avArrayText[$i], $hListView)
	Next

	; adjust window width
	$iWidth = 0
	For $i = 0 To $iSubMax + 1
		$iWidth += GUICtrlSendMsg($hListView, $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH, $i, 0)
	Next
	If $iWidth < 250 Then $iWidth = 230
	$iWidth += 20

	If $iWidth > @DesktopWidth Then $iWidth = @DesktopWidth - 100

	WinMove($hGUI, "", (@DesktopWidth - $iWidth) / 2, Default, $iWidth)

	; Show dialog
	GUISetState(@SW_SHOW, $hGUI)


	Opt("GUIOnEventMode", $iOnEventMode)
	Opt("GUIDataSeparatorChar", $sDataSeparatorChar)

	Return 1
EndFunc   ;==>_ArrayDisplay

Func _ArrayDisplay3(Const ByRef $avArray, $sTitle = "Vos Pokémon", $iItemLimit = -1, $iTranspose = 0, $sSeparator = "", $sReplace = "|", $sHeader = "")
	If Not IsArray($avArray) Then Return SetError(1, 0, 0)
	; Dimension checking
	Local $iDimension = UBound($avArray, 0), $iUBound = UBound($avArray, 1) - 1, $iSubMax = UBound($avArray, 2) - 1
	If $iDimension > 2 Then Return SetError(2, 0, 0)

	; Separator handling
	If $sSeparator = "" Then $sSeparator = Chr(124)

	;  Check the separator to make sure it's not used literally in the array
	If _ArraySearch($avArray, $sSeparator, 0, 0, 0, 1) <> -1 Then
		For $x = 1 To 255
			If $x >= 32 And $x <= 127 Then ContinueLoop
			Local $sFind = _ArraySearch($avArray, Chr($x), 0, 0, 0, 1)
			If $sFind = -1 Then
				$sSeparator = Chr($x)
				ExitLoop
			EndIf
		Next
	EndIf

	; Declare variables
	Local $vTmp, $iBuffer = 4094 ; AutoIt max item size
	Local $iColLimit = 250
	Local $iOnEventMode = Opt("GUIOnEventMode", 0), $sDataSeparatorChar = Opt("GUIDataSeparatorChar", $sSeparator)

	; Swap dimensions if transposing
	If $iSubMax < 0 Then $iSubMax = 0
	If $iTranspose Then
		$vTmp = $iUBound
		$iUBound = $iSubMax
		$iSubMax = $vTmp
	EndIf

	; Set limits for dimensions
	If $iSubMax > $iColLimit Then $iSubMax = $iColLimit
	If $iItemLimit < 1 Then $iItemLimit = $iUBound
	If $iUBound > $iItemLimit Then $iUBound = $iItemLimit

	; Set header up
	If $sHeader = "" Then
		$sHeader = "Row  " ; blanks added to adjust column size for big number of rows
		For $i = 0 To $iSubMax
			$sHeader &= $sSeparator & "Col " & $i
		Next
	EndIf

	; Convert array into text for listview
	Local $avArrayText[$iUBound + 1]
	For $i = 0 To $iUBound
		$avArrayText[$i] = "[" & $i & "]"
		For $j = 0 To $iSubMax
			; Get current item
			If $iDimension = 1 Then
				If $iTranspose Then
					$vTmp = $avArray[$j]
				Else
					$vTmp = $avArray[$i]
				EndIf
			Else
				If $iTranspose Then
					$vTmp = $avArray[$j][$i]
				Else
					$vTmp = $avArray[$i][$j]
				EndIf
			EndIf

			; Add to text array
			$vTmp = StringReplace($vTmp, $sSeparator, $sReplace, 0, 1)

			; Set max buffer size
			If StringLen($vTmp) > $iBuffer Then $vTmp = StringLeft($vTmp, $iBuffer)

			$avArrayText[$i] &= $sSeparator & $vTmp
		Next
	Next

	; GUI Constants
	Local Const $_ARRAYCONSTANT_GUI_DOCKBORDERS = 0x66
	Local Const $_ARRAYCONSTANT_GUI_DOCKBOTTOM = 0x40
	Local Const $_ARRAYCONSTANT_GUI_DOCKHEIGHT = 0x0200
	Local Const $_ARRAYCONSTANT_GUI_DOCKLEFT = 0x2
	Local Const $_ARRAYCONSTANT_GUI_DOCKRIGHT = 0x4
	Local Const $_ARRAYCONSTANT_GUI_EVENT_CLOSE = -3
	Local Const $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH = (0x1000 + 29)
	Local Const $_ARRAYCONSTANT_LVM_GETITEMCOUNT = (0x1000 + 4)
	Local Const $_ARRAYCONSTANT_LVM_GETITEMSTATE = (0x1000 + 44)
	Local Const $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE = (0x1000 + 54)
	Local Const $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT = 0x20
	Local Const $_ARRAYCONSTANT_LVS_EX_GRIDLINES = 0x1
	Local Const $_ARRAYCONSTANT_LVS_SHOWSELALWAYS = 0x8
	Local Const $_ARRAYCONSTANT_WS_EX_CLIENTEDGE = 0x0200
	Local Const $_ARRAYCONSTANT_WS_MAXIMIZEBOX = 0x00010000
	Local Const $_ARRAYCONSTANT_WS_MINIMIZEBOX = 0x00020000
	Local Const $_ARRAYCONSTANT_WS_SIZEBOX = 0x00040000

	; Set interface up
	Global $iWidth = 640, $iHeight = 480
	Global $hgui2 = GUICreate($sTitle, $iWidth, $iHeight+20, Default, Default, BitOR($_ARRAYCONSTANT_WS_SIZEBOX, $_ARRAYCONSTANT_WS_MINIMIZEBOX, $_ARRAYCONSTANT_WS_MAXIMIZEBOX))
	Global $aiGUISize = WinGetClientSize($hgui2)
	Global $hListView2 = GUICtrlCreateListView($sHeader, 0, 0, $aiGUISize[0], $aiGUISize[1] - 46, $_ARRAYCONSTANT_LVS_SHOWSELALWAYS)
	Global $hCopy = GUICtrlCreateButton("Copy Selected", 3, $aiGUISize[1] - 23, $aiGUISize[0] - 6, 20)
	GUICtrlSetResizing($hListView2, $_ARRAYCONSTANT_GUI_DOCKBORDERS)
	GUICtrlSetResizing($hCopy, $_ARRAYCONSTANT_GUI_DOCKLEFT + $_ARRAYCONSTANT_GUI_DOCKRIGHT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT)
	GUICtrlSendMsg($hListView2, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_LVS_EX_GRIDLINES, $_ARRAYCONSTANT_LVS_EX_GRIDLINES)
	GUICtrlSendMsg($hListView2, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT, $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT)
	GUICtrlSendMsg($hListView2, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_WS_EX_CLIENTEDGE, $_ARRAYCONSTANT_WS_EX_CLIENTEDGE)

	; Fill listview
	For $i = 0 To $iUBound
		GUICtrlCreateListViewItem($avArrayText[$i], $hListView2)
	Next

	; adjust window width
	$iWidth = 0
	For $i = 0 To $iSubMax + 1
		$iWidth += GUICtrlSendMsg($hListView2, $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH, $i, 0)
	Next
	If $iWidth < 250 Then $iWidth = 230
	$iWidth += 20

	If $iWidth > @DesktopWidth Then $iWidth = @DesktopWidth - 100

	WinMove($hgui2, "", (@DesktopWidth - $iWidth) / 2, Default, $iWidth)

	; Show dialog
	GUISetState(@SW_SHOW, $hgui2)


	Opt("GUIOnEventMode", $iOnEventMode)
	Opt("GUIDataSeparatorChar", $sDataSeparatorChar)

	Return 1
EndFunc   ;==>_ArrayDisplay



















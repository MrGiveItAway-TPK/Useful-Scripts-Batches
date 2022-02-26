Dim My_Input
My_Input = InputBox("Enter your Search Parameter :","Multi Search By Munes Bani Fawaz")

	If IsEmpty(My_Input) Then
	Else
    set x=createobject("wscript.shell")
	UP = x.ExpandEnvironmentStrings("%USERPROFILE%")
	x.exec(UP & "\AppData\Local\Programs\Opera GX\opera.exe  https://www.google.com/search?q="&My_Input)
	x.exec(UP & "\AppData\Local\Programs\Opera GX\opera.exe  https://duckduckgo.com/?q="&My_Input)
	x.exec(UP & "\AppData\Local\Programs\Opera GX\opera.exe  https://www.bing.com/search?q="&My_Input)
	x.exec(UP & "\AppData\Local\Programs\Opera GX\opera.exe  https://search.yahoo.com/search?q="&My_Input)
	End If
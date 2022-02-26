Dim My_Input
My_Input = InputBox("Enter your Search Parameter :","Multi Search By Munes Bani Fawaz")

	If IsEmpty(My_Input) Then
    'MsgBox "Canceled"
	Else
    set x=createobject("wscript.shell")
	x.exec("C:\Program Files\Google\Chrome\Application\chrome.exe  https://www.google.com/search?q="&My_Input)
	x.exec("C:\Program Files\Google\Chrome\Application\chrome.exe  https://duckduckgo.com/?q="&My_Input)
	x.exec("C:\Program Files\Google\Chrome\Application\chrome.exe  https://www.bing.com/search?q="&My_Input)
	x.exec("C:\Program Files\Google\Chrome\Application\chrome.exe  https://search.yahoo.com/search?q="&My_Input)
	End If
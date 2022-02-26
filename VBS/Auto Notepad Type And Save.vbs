set x=createobject("wscript.shell")
x.run "notepad.exe"
wscript.sleep 1000
x.sendkeys "Cool Right !{enter}{enter}{enter}By - Munes Bani Fawaz{enter}"
x.sendkeys "%fs"
wscript.sleep 500
x.sendkeys "AutoNotepad.txt"
wscript.sleep 300
x.sendkeys"{enter}"
x.run "taskkill /im notepad.exe", , True
Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
ScriptDir = fso.GetParentFolderName(WScript.ScriptFullName)
WshShell.CurrentDirectory = ScriptDir

' 0 代表完全隱藏視窗在背景執行，不留任何黑視窗
WshShell.Run "cmd /c python -m http.server 4000", 0, False
WScript.Sleep 500
WshShell.Run "cmd /c start http://localhost:4000", 0, False

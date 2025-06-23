#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

F13::
    SoundBeep, 750, 300                 ; 發出一個聲音 (頻率750Hz, 持續300毫秒)
    ToolTip, AHK: F13 (Muhenkan) signal received! ; 顯示提示訊息
    Send {vk1Dsc07B}                    ; 發送 "無変換" (Muhenkan)
    SetTimer, RemoveToolTip, -1500      ; 1.5秒後移除提示
    return

F14::
    SoundBeep, 1000, 300                ; 發出一個不同的聲音
    ToolTip, AHK: F14 (Henkan) signal received!   ; 顯示提示訊息
    Send {vk19sc079}                    ; 發送 "変換" (Henkan/Kanji)
    SetTimer, RemoveToolTip, -1500      ; 1.5秒後移除提示
    return

RemoveToolTip:
    ToolTip                             ; 清除 ToolTip
    return

; 可選：如果您想用鍵盤上的實體按鍵測試 AHK 是否能發送 F13/F14
; !1::Send {F13} ; Alt+1 發送 F13
; !2::Send {F14} ; Alt+2 發送 F14
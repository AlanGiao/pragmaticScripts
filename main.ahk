#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; #IfWinActive ahk_exe mobaxterm.exe
;;; MobaXterm 中, 单击右键复制
;; RButton::
;; {
;;     MouseGetPos, xpos, ypos
;;     Send, {Ctrl down}{RButton}{Ctrl up}
;;     Sleep, 100
;;     MouseMove, xpos + 23, ypos + 14  ; 你需要根据实际偏移调整这两个值
;;     MouseClick, left
;;     MouseMove, xpos, ypos  ; 回到原位置（可选）
;;     Return
;; }

;;; MobaXterm 中, 按下左 Alt 和 右键粘贴 (发送 Ctrl+Shift+V)
;; <!RButton::  ; < 表示左 Alt，! 是 Alt，RButton 是右键
;; Send, ^+v    ; ^ 是 Ctrl，+ 是 Shift，v 是字母 V
;; Return
;; #IfWinActive

; 在其他任意窗口, 按下左 Alt 和右键发送 Ctrl+V (粘贴).
<!RButton::  ; < 表示左 Alt，! 是 Alt，RButton 是右键
Send, ^v    ; ^ 是 Ctrl，+ 是 Shift，v 是字母 V
Return

; 按下Alt+左键发送 Ctrl+C
!LButton::
Send ^c
Return

#s:: ;; Windows+s
run https://scholar.google.com
tooltip, 站在巨人的肩膀上
sleep, 1500
tooltip,
return

!enter:: ;窗口置顶 (Alt+Enter)
WinGet ow, id, A
WinTopToggle(ow)
return
WinTopToggle(w) {

    WinGetTitle, oTitle, ahk_id %w%
    Winset, AlwaysOnTop, Toggle, ahk_id %w%
    WinGet, ExStyle, ExStyle, ahk_id %w%
    if (ExStyle & 0x8)  ; 0x8 为 WS_EX_TOPMOST.在WinGet的帮助中
        oTop = 置顶
        else
            oTop = 取消置顶
            tooltip %oTitle% %oTop%
            SetTimer, RemoveToolTip, 5000
            return

            RemoveToolTip:
            SetTimer, RemoveToolTip, Off
            ToolTip
            return
}


; 小写希腊字母（输入 \+字母英文缩写，如 \alpha → α）
:*:\alpha::α
:*:\beta::β
:*:\gamma::γ
:*:\delta::δ
:*:\epsilon::ε
:*:\zeta::ζ
:*:\eta::η
:*:\theta::θ
:*:\iota::ι
:*:\kappa::κ
:*:\lambda::λ
:*:\mu::μ
:*:\nu::ν
:*:\xi::ξ
:*:\pi::π
:*:\rho::ρ
:*:\sigma::σ
:*:\tau::τ
:*:\upsilon::υ
:*:\phi::φ
:*:\chi::χ
:*:\psi::ψ
:*:\omega::ω

; 大写希腊字母（输入 \+大写英文缩写，如 \Gamma → Γ）
:*:\Gamma::Γ
:*:\Delta::Δ
:*:\Theta::Θ
:*:\Lambda::Λ
:*:\Xi::Ξ
:*:\Pi::Π
:*:\Sigma::Σ
:*:\Upsilon::Υ
:*:\Phi::Φ
:*:\Psi::Ψ
:*:\Omega::Ω

; 输入 \sqrt 后按空格/回车/制表符，自动替换为 √（可根据需求调整触发键）
::\sqrt::√

; 可选：如果需要输入 \sqrt 后直接替换（无需按额外按键），用下面这行（二选一）
; ::\sqrt::
; SendInput √
; Return



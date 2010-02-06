if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif
 
" Options
syn keyword sshOption command
syn keyword sshOption environment
syn keyword sshOption from
syn keyword sshOption permitopen
syn keyword sshOption tunnel

syn match sshOption "no-agent-forwarding"
syn match sshOption "no-port-forwarding"
syn match sshOption "no-pty"
syn match sshOption "no-user-rc"
syn match sshOption "no-X11-forwarding"

" SSH1
"
syn match sshSSH1Bits     "\(^\| \)\d*" nextgroup=sshSSH1Exponent
syn match sshSSH1Exponent " \d*" contained nextgroup=sshSSH1Modulus
syn match sshSSH1Modulus  " \d*" contained nextgroup=sshSSH1Comment
syn match sshSSH1Comment  " .*" contained

" SSH2 key type
syn match sshSSH2KeyType "ssh-rsa"
syn match sshSSH2KeyType "ssh-dss"
 
" Strings
syn region sshString start=/"/ skip=/\\"/ end=/"/ oneline
 
" Comments
syn match sshComment /^#.*/

syn match sshSSH2Comment /= .*$/ms=s+1

if version >= 508
	command -nargs=+ HiLink hi link <args>
else
	command -nargs=+ HiLink hi def link <args>
endif
 
HiLink sshSSH1Bits     Type
HiLink sshSSH1Exponent Special
HiLink sshSSH1Comment  Comment

HiLink sshSSH2KeyType Type
HiLink sshSSH2Comment Comment

HiLink sshOption  Keyword
HiLink sshString  String
 
delcommand HiLink
 
let b:current_syntax = "sshauthkeys"
 

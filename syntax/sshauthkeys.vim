if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif
 
if !exists("main_syntax")
	let main_syntax = "sshauthkeys"
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

" Key type
syn match sshKeyType "ssh-rsa"
syn match sshKeyType "ssh-dss"
 
" Strings
syn region sshString start=/"/ skip=/\\"/ end=/"/ oneline
 
" Comments
syn match sshComment /^#.*/
syn match sshComment /=[ 	].*$/ms=s+1

if version >= 508
	command -nargs=+ HiLink hi link <args>
else
	command -nargs=+ HiLink hi def link <args>
endif
 
HiLink sshOption  Keyword
HiLink sshKeyType Type
HiLink sshString  String
HiLink sshComment Comment
 
delcommand HiLink
 
let b:current_syntax = "sshauthkeys"
 
if main_syntax == "sshauthkeys"
	unlet main_syntax
endif


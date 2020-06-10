thefuck --alias | source
set -gx PATH $HOME/.cargo/bin $PATH
function set_proxy
	set -xg ALL_PROXY socks5://127.0.0.1:7891
end

function unset_proxy
	set -u ALL_PROXY 
end

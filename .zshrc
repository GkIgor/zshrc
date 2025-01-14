# Configuração do prompt Zsh
autoload -Uz promptinit && promptinit
autoload -Uz compinit && compinit
#autoload -Uz compinstall && compinstall
. "$HOME/.asdf/asdf.sh"

# Cores para formatação
green="%F{green}"
red="%F{red}"
blue="%F{blue}"
yellow="%F{yellow}"
magenta="%F{magenta}"
white="%F{white}"
reset="%f"

# Formato da data
fdata="%D{%d-%m} %*"

#dados
usuario="gkIgor"
maquina="Debian"

# Função para obter o status do Git
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "%F{magenta}${ref#refs/heads/}%f"
}


# Formato do prompt
PROMPT="${green}${usuario}${reset}@${red}${maquina}${reset}:${white}[ ${reset}${blue}${fdata}${reset} ]:${yellow}%~${git_prompt_info}🌱${reset} "


# Alias
alias c=clear
alias dotnet='dotnet.exe'
alias g=git
alias idea='idea64.exe'
alias update-nvim-stable='asdf uninstall neovim stable && asdf install neovim stable'
alias update-nvim-nightly='asdf uninstall neovim nightly && asdf install neovim nightly'
alias update-nvim-master='asdf uninstall neovim ref:master && asdf install neovim ref:master'


#Scripts
. /home/gkigor/.asdf/asdf.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/asdf-vm/asdf.sh 2>>/dev/null
. ~/.asdf/plugins/golang/set-env.zsh

fpath=(${ASDF_DIR}/completions $fpath)

# PATH
PUB_CACHE="$HOME/.pub-cache/bin"

export PATH="$(go env GOPATH)/bin:/$PUB_CACHE:/$PATH"

# pnpm
export PNPM_HOME="/home/gkigor/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# commands

eval "$(ssh-agent)" >> /dev/null;
arr_ssh_keys=('github' 'bitbucket' 'bot-vm home-to-vm' 'ssh-key-2023-11-13' 'api-ofertas-vps' 'id_rsa' 'ssh-key-2023-12-04.key');
for key in "${arr_ssh_keys[@]}"
  do
    ssh-add "$HOME/.ssh/$key" >> /dev/null;
  done


alias v=nvim

# Created by `pipx` on 2024-12-28 20:48:52
export PATH="$PATH:/home/gkigor/.local/bin"
fpath+=(~/.zsh/zsh-completions/src)

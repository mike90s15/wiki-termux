#!/bin/bash
trap _exit EXIT
function _exit() {
  clear
  xdg-open https://instagram.com/mike90s15 &>/dev/null
  printf "\nMike90s15 say: Goodbye, see you!\n"
  exit 0
}
function _banner() {
  banner_var=("\n\n  \e[34m(\___/)    \e[1;34m@Mike90s15\e[m\n"
    " \e[34m(='.'=)    \e[1;34mWiki-Termux\e[m\n"
    "\e[32m.-\e[34m•(\")_(\")\e[32m--------------\n"
    "\e[32m| \e[1;32m(\e[1;36m01\e[1;32m)\e[1;33m Comandos-termux\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m02\e[1;32m)\e[1;33m Ferramentas\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m03\e[1;32m)\e[1;33m Scripts\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m04\e[1;32m)\e[1;33m Grupo\e[m\n"
    "\e[32m|\n"
    "\e[32m| \e[1;32m(\e[1;31m99\e[1;32m)\e[31m Sair\e[m\n"
    "\e[34m{\__/}\e[32m.-----------------\e[34m\n"
    "( •.•)\n"
    "/ >>>\e[1;36m ")

  clear
  IFS=""
  for i in ${banner_var[@]}; do
    printf " ${i}"
    sleep 0.01
  done
}
function _calculateAverage() {
  read -p "Quantos números você quer calcular a média? " count
  soma=0
  for ((i = 1; i <= count; i++)); do
    read -p "Digite o número $i: " num
    soma=$((soma + num))
  done
  media=$(echo "scale=2; $soma / $count" | bc)
  echo -e "\033[1;32mA média dos números é: $media\033[0m"
}
function _calculateFactorial() {
  read -p "Digite um número para calcular o fatorial: " num
  fatorial=1
  for ((i = 1; i <= num; i++)); do
    fatorial=$((fatorial * i))
  done
  echo -e "\033[1;32mO fatorial de $num é: $fatorial\033[0m"
}
function _calculateSum() {
  read -p "Quantos números você quer somar? " count
  soma=0
  for ((i = 1; i <= count; i++)); do
    read -p "Digite o número $i: " num
    soma=$((soma + num))
  done
  echo -e "\033[1;32mA soma dos números é: $soma\033[0m"
}
function _checkParity() {
  read -p "Digite um número: " num
  if ((num % 2 == 0)); then
    echo -e "\033[1;32mO número $num é Par.\033[0m"
  else
    echo -e "\033[1;31mO número $num é Ímpar.\033[0m"
  fi
}
function _checkPrime() {
  read -p "Digite um número: " num
  eh_primo=1
  for ((i = 2; i * i <= num; i++)); do
    if ((num % i == 0)); then
      eh_primo=0
      break
    fi
  done
  if ((eh_primo == 1 && num > 1)); then
    echo -e "\033[1;32mO número $num é primo.\033[0m"
  else
    echo -e "\033[1;31mO número $num não é primo.\033[0m"
  fi
}
function _commands() {
  commands_info=(
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mls"
    "\033[1;32mDescrição:\033[0m Lista as pastas e arquivos do diretório atual."
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mls"
    "\033[1;37mSaída:\033[0m"
    "pasta1  pasta2  pasta3"
    "arquivo1  arquivo2"
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mcd (nomedapasta)"
    "\033[1;32mDescrição:\033[0m Acessa a pasta especificada."
    "\033[1;31mObservação:\033[0m SOMENTE PASTAS"
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mcd minhaPasta"
    "\033[1;37mSaída após executar ls:\033[0m"
    "arquivo1  arquivo2"
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mpwd"
    "\033[1;32mDescrição:\033[0m Exibe o caminho completo do diretório atual."
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mpwd"
    "\033[1;37mSaída:\033[0m"
    "/data/data/com.termux/files/home/termux"
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mcat"
    "\033[1;32mDescrição:\033[0m Lê e exibe o conteúdo de um arquivo."
    "\033[1;31mObservação:\033[0m SOMENTE ARQUIVOS"
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mcat meuArquivo.txt"
    "\033[1;37mSaída:\033[0m"
    "Aqui será exibido o conteúdo do arquivo..."
    "\033[1;36mDica:\033[0m Use \033[1;33mcat --help\033[0m para mais opções."
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mapt update"
    "\033[1;32mDescrição:\033[0m Atualiza a lista de pacotes disponíveis."
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mapt upgrade"
    "\033[1;32mDescrição:\033[0m Atualiza pacotes desatualizados."
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mapt search (pacote)"
    "\033[1;32mDescrição:\033[0m Exibe pacotes disponíveis."
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mapt search nano"
    "\033[1;32m(nano é um pacote)"
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mapt install (pacote)"
    "\033[1;32mDescrição:\033[0m Instala o pacote especificado."
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mapt install nano"
    "\033[1;37mSaída:\033[0m"
    "Podemos instalar vários pacotes de uma vez: \033[1;33mapt install nano nmap python2 -y"
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mapt show (pacote)"
    "\033[1;32mDescrição:\033[0m Exibe informações detalhadas de um pacote."
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mapt show nano"
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mapt remove (pacote)"
    "\033[1;32mDescrição:\033[0m Remove o pacote especificado."
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mapt remove nano"
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mcd .."
    "\033[1;32mDescrição:\033[0m Volta para o diretório anterior."
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mmkdir (nome)"
    "\033[1;32mDescrição:\033[0m Cria um novo diretório."
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mmkdir minhaPasta"
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mmv (origem) (destino)"
    "\033[1;32mDescrição:\033[0m Move um arquivo ou pasta para um local especificado."
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mmv arquivo /destino"
    "\033[1;36mDica:\033[0m Use \033[1;33mmv --help\033[0m para mais opções."
    "\033[1;34m===================================================="
    "\033[1;33mCOMANDO: \033[1;37mcp (origem) (destino)"
    "\033[1;32mDescrição:\033[0m Copia arquivos ou pastas."
    "\033[1;32mExemplo:\033[0m"
    "\033[1;33mcp arquivo.txt /destino"
    "\033[1;36mDica:\033[0m Para copiar pastas use: \033[1;33mcp -r pasta /destino\033[1;37m"
    "\033[1;34m===================================================="
    "Precione enter para rertonar ao menu \c"
  )

  clear
  for i in "${commands_info[@]}"; do
    echo -e " ${i}"
    sleep 0.01
  done
  read
}
function _group() {
  read -p "Você gostaria de entrar no grupo do Telegram? (s/n): " answer
  if [[ "$answer" == "s" || "$answer" == "S" ]]; then
    xdg-open "https://t.me/addlist/qS0HPKMxnjsxZTVh"
    echo -e "\033[1;32mAbrindo o grupo do Telegram...\033[0m"
  else
    echo -e "\033[1;31mVocê optou por não entrar no grupo.\033[0m"
  fi
}
function _install_menu() {
  local banner_var=(
    " \e[34m(\___/)    \e[1;34m@Mike90s15\e[m\n"
    " \e[34m(='.'=)    \e[1;34mWiki-Termux\e[m\n"
    "\e[32m.-\e[34m•(\")_(\")\e[32m--------------\n"
    "\e[32m| \e[1;32m(\e[1;36m01\e[1;32m)\e[1;33m Tor\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m02\e[1;32m)\e[1;33m SSH\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m03\e[1;32m)\e[1;33m Git\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m04\e[1;32m)\e[1;33m Python\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m05\e[1;32m)\e[1;33m Curl\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m06\e[1;32m)\e[1;33m Wget\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m07\e[1;32m)\e[1;33m Nano\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m08\e[1;32m)\e[1;33m Vim\e[m\n"
    "\e[32m| \e[1;32m(\e[1;36m09\e[1;32m)\e[1;33m Instalar todas as ferramentas\e[m\n"
    "\e[32m|\n"
    "\e[32m| \e[1;32m(\e[1;31m99\e[1;32m)\e[31m Retornar\e[m\n"
    "\e[34m{\__/}\e[32m.-----------------\e[34m\n"
    "( •.•)\n"
    "/ >>>\e[1;36m ")

  echo "Atualizando pacotes..."
  pkg update -y &>/dev/null && pkg upgrade -y &>/dev/null

  while true; do
    clear
    IFS=""
    for i in "${banner_var[@]}"; do
      printf " ${i}"
      sleep 0.01
    done

    read -r input_user
    _readInput --empty "${input_user}" && continue
    [[ "$?" -eq 99 ]] && break
    _readInput --numeric "${input_user}" || continue
    install_tool() {
      if command -v $1 >/dev/null 2>&1; then
        echo "$1 já está instalado."
      else
        echo "Instalando $1..."
        pkg install -y $1 &>/dev/null
      fi
    }

    case $input_user in
    1) install_tool "tor" ;;
    2) install_tool "openssh" ;;
    3) install_tool "git" ;;
    4) install_tool "python" ;;
    5) install_tool "curl" ;;
    6) install_tool "wget" ;;
    7) install_tool "nano" ;;
    8) install_tool "vim" ;;
    9)
      tools=("tor" "openssh" "git" "python" "curl" "wget" "nano" "vim")
      for tool in "${tools[@]}"; do
        install_tool "$tool"
      done
      ;;
    99)
      echo "Saindo..."
      break
      ;;
    *)
      echo "Opção inválida!"
      ;;
    esac

    echo -n "Pressione Enter para continuar..."
    read -r
  done
  echo "Instalação finalizada."
}
function _readInput() {
  [[ "${2^^}" == "Q" ]] && return 99 # 99 to come back
  case "$1" in
  "--empty") [[ -z "$2" ]] && printf "\e[1;33m Digite algo!" && sleep 1 && return 0 ;;
  "--numeric") ! [[ "$2" =~ ^[0-9]+$ ]] && {
    printf "\e[1;33m Apenas números!" && sleep 1
  } || return 0 ;;
  "--alphabetical")
    [[ "${2}" =~ ^[A-Za-z]+$ ]] && return 0
    printf "\e[1;33m Apenas letras!" && sleep 1
    ;;
  "--alphanumeric") [[ "${2}" =~ ^[A-Za-z0-9]+$ ]] && return 0 ;;
  esac
  return 1
}
function _scripts() {
  while true; do
    banner=("\n\n   \e[34m(\___/)    \e[1;34m@Mike90s15\e[m"
      "  \e[34m(='.'=)    \e[1;34mWiki-Termux\e[m"
      "\e[32m.-\e[34m•(\")_(\")\e[32m--------------"
      "\e[32m| \e[1;32m(\e[1;36m01\e[1;32m)\e[1;33m Verificar Par ou Ímpar\e[m"
      "\e[32m| \e[1;32m(\e[1;36m02\e[1;32m)\e[1;33m Calcular Média\e[m"
      "\e[32m| \e[1;32m(\e[1;36m03\e[1;32m)\e[1;33m Calcular Fatorial\e[m"
      "\e[32m| \e[1;32m(\e[1;36m04\e[1;32m)\e[1;33m Verificar Número Primo\e[m"
      "\e[32m| \e[1;32m(\e[1;36m05\e[1;32m)\e[1;33m Calcular Soma\e[m"
      "\e[32m|"
      "\e[32m| \e[1;32m(\e[1;31m99\e[1;32m)\e[31m Sair\e[m"
      "\e[34m{\__/}\e[32m.-----------------\e[34m"
      "( •.•)"
      "/ >>>\e[1;36m \c")

    clear
    IFS=""
    for i in ${banner[@]}; do
      echo -e " ${i}"
      sleep 0.01
    done

    read input_user
    _readInput --empty "${input_user}" && continue
    [[ "$?" -eq 99 ]] && return 0
    _readInput --numeric "${input_user}" || continue

    case "${input_user}" in
    1) _showCode "$(declare -f _checkParity)" "_checkParity" ;;
    2) _showCode "$(declare -f _calculateAverage)" "_calculateAverage" ;;
    3) _showCode "$(declare -f _calculateFactorial)" "_calculateFactorial" ;;
    4) _showCode "$(declare -f _checkPrime)" "_checkPrime" ;;
    5) _showCode "$(declare -f _calculateSum)" "_calculateSum" ;;
    01) _showCode "$(declare -f _checkParity)" "_checkParity" ;;
    02) _showCode "$(declare -f _calculateAverage)" "_calculateAverage" ;;
    03) _showCode "$(declare -f _calculateFactorial)" "_calculateFactorial" ;;
    04) _showCode "$(declare -f _checkPrime)" "_checkPrime" ;;
    05) _showCode "$(declare -f _calculateSum)" "_calculateSum" ;;
    99) break ;;
    *) echo -e "\033[1;31mOpção inválida! Por favor, tente novamente.\033[0m" ;;
    esac
    echo -e "\033[1;34m---------------------------------------------------\033[0m"
  done
}
function _showCode() {
  local code="$1"
  local functionName="$2"

  echo -e "\033[1;34mCódigo do Script:\033[0m"
  echo -e "\033[1;37m$code\033[0m"

  read -p $'\e[1;34mDeseja executar este código? (s/n): ' response
  if [[ "$response" == "s" || "$response" == "S" ]]; then
    eval "$functionName"
  else
    echo -e "\033[1;31mOperação cancelada.\033[0m"
  fi
  printf "\e[1;34mPrecione enter para continuar "
  read
}
while :; do
  _banner
  read input_user
  _readInput --empty "${input_user}" && continue
  [[ "$?" -eq 99 ]] && exit 0
  _readInput --numeric "${input_user}" || continue

  case "${input_user}" in
  0) exit 0 ;;
  1) _commands ;;
  2) _install_menu ;;
  3) _scripts ;;
  4) _group ;;
  00) exit 0 ;;
  01) _commands ;;
  02) _install_menu ;;
  03) _scripts ;;
  04) _group ;;
  99) exit 0 ;;
  esac
done

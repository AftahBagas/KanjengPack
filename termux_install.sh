_get_repolink () {
    local regex
    regex='(https?)://github.com/.+/.+'
    if [[ $KANJENG_REPO == "KANJENG-USERBOT" ]]
    then
        echo "aHR0cHM6Ly9naXRodWIuY29tL0lsaGFtTWFuc2llei9USEUtUEVURVJDT1JEL2FyY2hpdmUvbWFzdGVyLnppcA=" | base64 -d
    elif [[ $KANJENG_REPO == "KANJENG-USERBOT" ]]
    then
        echo "aHR0cHM6Ly9naXRodWIuY29tL0lsaGFtTWFuc2llei9USEUtUEVURVJDT1JEL2FyY2hpdmUvbWFzdGVyLnppcA=" | base64 -d
    elif [[ $KANJENG_REPO =~ $regex ]]
    then
        if [[ $KANJENG_REPO_BRANCH ]]
        then
            echo "${KANJENG_REPO}/archive/${KANJENG_REPO_BRANCH}.zip"
        else
            echo "${KANJENG_REPO}/archive/master.zip"
        fi
    else
        echo "aHR0cHM6Ly9naXRodWIuY29tL0lsaGFtTWFuc2llei9USEUtUEVURVJDT1JEL2FyY2hpdmUvbWFzdGVyLnppcA=" | base64 -d
    fi
}


_set_bot () {
    local zippath
    zippath="KANJENG-USERBOT.zip"
    echo "  Downloading source code ..."
    wget -q $(_get_repolink) -O "$zippath"
    echo "  Unpacking Data ..."
    KANJENGPATH=$(zipinfo -1 "$zippath" | grep -v "/.");
    unzip -qq "$zippath"
    echo "Done"
    echo "  Cleaning ..."
    rm -rf "$zippath"
    sleep 5
    cd $KANJENGPATH
    echo "    Starting PETERCORDBOT   "
    echo "
                         ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ 
                            𝙆 𝘼 𝙉 𝙅 𝙀 𝙉 𝙂   𝙐 𝙎 𝙀 𝙍 𝘽 𝙊 𝙏
                         ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ 
    "

    python3 ../setup/updater.py ../requirements.txt requirements.txt
    python3 -m userbot
}

_set_bot

#!/bin/bash
set -o errexit

LOG_DIR="/usr/extension"
SCRIPT_DIR="/usr/extension"
DATA_DIR="/usr/extension"
LOG_INDENT=""

function now() {
    echo $(date +'%Y-%m-%d %H:%M:%S')
}

function toLittleCamel() {
    local strs=($1)
    local result
    local i
    for ((i = 0; i < ${#strs[@]}; i++)); do
        if [ "$i" = "0" ]; then
            result="$(echo ${strs[i]} | awk '{print tolower($0)}')"
        else
            result="$result$(echo ${strs[i]:0:1} | awk '{print toupper($0)}')$(echo ${strs[i]:1} | awk '{print tolower($0)}')"
        fi
    done
    echo "$result"
}

function createDir() {
    local dir="$1"
    set +o errexit
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
    fi
    set -o errexit
    if [ ! -d "$dir" ]; then
        echo "Fatal: create dir [$dir] failed"
        exit 1
    fi
}

function log() {
    if [ -n "$LOG_INDENT" ]; then
        echo "[`now`] [$1] $LOG_INDENT ${@:2}"
    else
        echo "[`now`] [$1] ${@:2}"
    fi
}

function info() {
    log "I" "$@"
}

function warn() {
    log "W" "$@"
}

function error() {
    log "E" "$@"
}

function echoCmd() {
    log "C" "$@"
}

function echoTask() {
    log "T" "$@"
}

function echoJob() {
    log "J" "$@"
}

function echoValues() {
    local value
    local maxLength="14"
    for value in "$@"; do
        local typesetResult
        set +o errexit
        typesetResult=$(typeset -p $value 2>/dev/null)
        set -o errexit

        if [ -n "$LOG_INDENT" ]; then
            local message="[`now`] [V] $LOG_INDENT %-${maxLength}s = %s\n"
        else
            local message="[`now`] [V] %-${maxLength}s = %s\n"
        fi
        if [[ "$typesetResult" =~ "declare -a" ]]; then
            local arrayValue="${value}[*]"
            printf "$message" "$value" "${!arrayValue}"
        else
            printf "$message" "$value" "${!value}"
        fi
    done
}

function checkValues() {
    local value
    for value in "$@"; do
        local typesetResult
        set +o errexit
        typesetResult=$(typeset -p $value 2>/dev/null)
        set -o errexit

        if [[ "$typesetResult" =~ "declare -a" ]]; then
            local arrayValue="${value}[@]"
            arrayValue=(${!arrayValue})
            if [ "${#arrayValue[@]}" = "0" ]; then
                error "$value is empty"
                return 1
            fi
        else
            if [ -z "${!value}" ]; then
                error "$value is empty"
                return 1
            fi
        fi
    done
}

function echoAndCheckValues() {
    echoValues "$@"
    checkValues "$@"
}

function execCmd() {
    local cmd="$1"
    echoCmd "$cmd"
    eval "$cmd"
}

function execTask() {
    local title="$1"
    local params=("${@:2}")

    local function="$(toLittleCamel "$title")"

    LOG_INDENT="$LOG_INDENT-"
    echoTask "$title start"

    $function "${params[@]}"

    echoTask "$title finished"
    if [ "${#LOG_INDENT}" -ge "1" ]; then
        LOG_INDENT="${LOG_INDENT:1}"
    fi
}

function execJob() {
    local extension="$1"
    if [ -z "$extension" ]; then
        echo "Fatal: extension is empty"
        exit 1
    fi

    local job="$2"
    if [ -z "$job" ]; then
        echo "Fatal: job is empty"
        exit 1
    fi

    local logDir="$LOG_DIR/$extension"
    local logFile="$logDir/$job.log"
    local scriptDir="$SCRIPT_DIR/$extension"
    local scriptFile="$scriptDir/$job.sh"
    local dataDir="$DATA_DIR/$extension"

    createDir "$logDir"
    rm -rf "$logFile"

    echoJob "$job start" >> "$logFile" 2>&1
    echoAndCheckValues "extension" "job" "logFile" "scriptFile" "dataDir" >> "$logFile" 2>&1

    if [ -f "$scriptFile" ]; then
        source "$scriptFile" >> "$logFile" 2>&1
        start >> "$logFile" 2>&1
        echoJob "$job finished" >> "$logFile" 2>&1
    else
        error "$job script not found" >> "$logFile" 2>&1
        return 1
    fi
}

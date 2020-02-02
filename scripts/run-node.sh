#!/bin/sh
if [[ -n "${HTTP_PORT_NUMBER}" ]]; then
    echo "Setting httpport:$HTTP_PORT_NUMBER"
    PARAMS="httpport:$HTTP_PORT_NUMBER"
fi

if [[ -n "${HTTP_PORT_PASSWORD}" ]]; then
    echo "Setting password:xxxxxxx"
    PARAMS="$PARAMS password:$HTTP_PORT_PASSWORD"
fi

if [[ -n "${DATA_PATH}" ]]; then
    echo "Setting path:$DATA_PATH"
    PARAMS="$PARAMS path:$DATA_PATH"
fi

if [[ -n "${START_PORT_NUMBER}" ]]; then
    echo "Setting port:$START_PORT_NUMBER"
    PARAMS="$PARAMS port:$START_PORT_NUMBER"
fi

if [[ -n "${START_IP}" ]]; then
    echo "Setting ip:$START_IP"
    PARAMS="$PARAMS ip:$START_IP"
fi

if [[ -n "${LISTEN_IP}" ]]; then
    echo "Setting listen:$LISTEN_IP"
    PARAMS="$PARAMS listen:$LISTEN_IP"
fi

if [[ -n "${HTTP_HOSTING_PORT}" ]]; then
    echo "Setting hosting:$HTTP_HOSTING_PORT"
    PARAMS="$PARAMS hosting:$HTTP_HOSTING_PORT"
fi

if [[ -n "${START_NETWORK_DATE}" ]]; then
    echo "Setting startnetwork:$START_NETWORK_DATE"
    PARAMS="$PARAMS startnetwork:$START_NETWORK_DATE"
fi

if [[ -n "${CREATE_ON_START}" ]]; then
    echo "Setting createonstart"
    PARAMS="$PARAMS createonstart"
fi

if [[ -n "${LOCALRUN}" ]]; then
    echo "Setting localrun"
    PARAMS="$PARAMS localrun"
fi

if [[ -n "${TESTRUN}" ]]; then
    echo "Setting testrun"
    PARAMS="$PARAMS testrun"
fi

if [[ -n "${NOLOCALRUN}" ]]; then
    echo "Setting nolocalrun"
    PARAMS="$PARAMS nolocalrun"
fi

if [[ -n "${NOAUTOUPDATE}" ]]; then
    echo "Setting noautoupdate"
    PARAMS="$PARAMS noautoupdate"
fi

if [[ -n "${NOPARAMJS}" ]]; then
    echo "Setting noparamjs"
    PARAMS="$PARAMS noparamjs"
fi

if [[ -n "${DEV_MODE}" ]]; then
    echo "Setting DEV_MODE"
    PARAMS="$PARAMS DEV_MODE"
fi

if [[ -n "${API_V2}" ]]; then
    echo "Setting api_v2"
    PARAMS="$PARAMS api_v2"
fi


node set $PARAMS
node run-node.js
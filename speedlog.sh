#!/bin/bash

TIMESTAMP="$(date '+%Y-%m-%d_%H:%M:%S')"

SPEEDTEST_OUTPUT="$(speedtest)"

HOSTER="$(echo "$SPEEDTEST_OUTPUT" | grep -Po 'Hosted by \K[^[]*')"
PING_TIME="$(echo "$SPEEDTEST_OUTPUT" | grep -Po '\]: \K.*')"
DOWNLOAD="$(echo "$SPEEDTEST_OUTPUT" | grep -Po 'Download: \K.*')"
UPLOAD="$(echo "$SPEEDTEST_OUTPUT" | grep -Po 'Upload: \K.*')"

printf "%-21s %-40s %10s %14s %14s\n" "$TIMESTAMP" "$HOSTER" "$PING_TIME" "$DOWNLOAD" "$UPLOAD" | tee -a speedlog.txt

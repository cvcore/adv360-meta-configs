#!/usr/bin/env bash

set -eu

TIMESTAMP="${TIMESTAMP:-$(date -u +"%Y%m%d%H%M%S")}"
WORKSPACE_DIR="/workspaces/adv360-meta-configs"

rm -rf ${WORKSPACE_DIR}/build/*

# West Build (left)
west build -s ${WORKSPACE_DIR}/zmk/app -d ${WORKSPACE_DIR}/build/left -b adv360_left -- -DZMK_CONFIG="${WORKSPACE_DIR}/adv360-pro-zmk/config"
# Adv360 Left Kconfig file
cat ${WORKSPACE_DIR}/build/left/zephyr/.config | grep -v "^#" | grep -v "^$"
# West Build (right)
west build -s ${WORKSPACE_DIR}/zmk/app -d ${WORKSPACE_DIR}/build/right -b adv360_right -- -DZMK_CONFIG="${WORKSPACE_DIR}/adv360-pro-zmk/config"
# Adv360 Right Kconfig file
cat ${WORKSPACE_DIR}/build/right/zephyr/.config | grep -v "^#" | grep -v "^$"
# Rename zmk.uf2
cp ${WORKSPACE_DIR}/build/left/zephyr/zmk.uf2 ${WORKSPACE_DIR}/firmware/${TIMESTAMP}-left.uf2
cp ${WORKSPACE_DIR}/build/right/zephyr/zmk.uf2 ${WORKSPACE_DIR}/firmware/${TIMESTAMP}-right.uf2

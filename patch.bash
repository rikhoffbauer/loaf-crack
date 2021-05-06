#!/usr/bin/env bash
TMP_DIR="${TMPDIR}loaf"
LOAF_APP_ASAR_PATH="/Applications/Loaf.app/Contents/Resources/app.asar"
LOAF_MAIN_JS="$TMP_DIR/main.prod.js"

rm -rf "$TMP_DIR"
mkdir "$TMP_DIR"

npx asar e "$LOAF_APP_ASAR_PATH" "$TMP_DIR"

sed -Ei 's/checkout\.getmotion\.io\//raw\.githubusercontent\.com\/rikhoffbauer\/loaf-crack\/master\/response\.json#/g' "$LOAF_MAIN_JS"

rm -f "${LOAF_APP_ASAR_PATH}.bak"
mv "$LOAF_APP_ASAR_PATH" "${LOAF_APP_ASAR_PATH}.bak"

npx asar p "$TMP_DIR" "$LOAF_APP_ASAR_PATH"

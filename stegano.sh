#!/bin/bash

echo "📂 Enter APK file path:"
read apk_path

if [ ! -f "$apk_path" ]; then
  echo "❌ APK file not found!"
  exit 1
fi

echo "🖼️ Enter PNG image path:"
read png_path

if [ ! -f "$png_path" ]; then
  echo "❌ PNG file not found!"
  exit 1
fi

echo "📦 Compressing APK..."
zip -j temp.zip "$apk_path" > /dev/null

echo "🔗 Merging into PNG..."
cat "$png_path" temp.zip > output.png

rm temp.zip

echo "✅ Done! File saved as output.png"

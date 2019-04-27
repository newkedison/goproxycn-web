rm -rf dist
cd js
rm *.min.js *.map
for f in * ; do
  min=$(echo ${f/js/min.js})
  uglifyjs $f --compress --mangle --source-map --output $min
done
cd ..

mkdir dist
cp -r css img index.html favicon.ico dist/
mkdir -p dist/{js,webfonts}
sed 's/\.js">/.min.js">/' index.html > dist/index.html
cp js/*.min.js dist/js/
cp webfonts/*.woff2 dist/webfonts/

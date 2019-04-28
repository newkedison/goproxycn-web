rm -rf dist
cd js
rm -f *.min.js *.map
for f in * ; do
  min=$(echo ${f/js/min.js})
  uglifyjs $f --compress --mangle --source-map --output $min
done
cd ..

mkdir dist
cp -r css img index.html favicon.ico dist/
mkdir -p dist/js
sed 's/\.js">/.min.js">/' index.html > dist/index.html
cp js/*.min.js dist/js/
cp -r fonts dist/

if [ -d .netlify ] ; then
  netlify deploy --prod -d dist
fi

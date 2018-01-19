#$RESULT=(( $1 * ($2 + $3) ))
R=(( ($3 + $2) * $1))

#echo project-$RESULT/{dest/{index.js,util.js},src/{index.js,util.js},test/{index.js,util.js}}
echo project-$R/{src,dest,test}/{index,util}.js

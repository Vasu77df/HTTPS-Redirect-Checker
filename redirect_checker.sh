function redirect_check {
    echo "Checking all types of redirects for $1"
    touch redirect_log.txt
    echo "Checking redirect for http://$1"
    echo "----"
    curl -ILs "http://$1" | grep -Pi "^HTTP+|Location|X-CDN|Connection"
    echo "--------------------------------------------------------------"
    echo "Checking redirect for http://www.$1"
    echo "----"
    curl -ILs "http://www.$1" | grep -Pi "^HTTP+|Location|X-CDN|Connection"
    echo "--------------------------------------------------------------"
    echo "Checking redirect for https://$1"
    echo "----"
    curl -ILs "http://$1" | grep -Pi "^HTTP+|Location|X-CDN|Connection"
    echo "--------------------------------------------------------------"
    echo "Checking redirect for http://www.$1"
    echo "----"
    curl -ILs "https://www.$1" | grep -Pi "^HTTP+|Location|X-CDN|Connection"
    echo "--------------------------------------------------------------"
    
}

echo "------------------------HTTP Redirect Checker---------------------"
for var in "$@"
do 
    redirect_check "$var" 

done
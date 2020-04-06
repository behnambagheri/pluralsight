#!/bin/bash 
##############
rm -rf //home/behnam/pluralsite/
##############

#Create Directory For Downloaded Course:
function MKDIR(){
if [ -z "$DEFAULT_DIR" ]
then
    mkdir $HOME/pluralsite
else
    mkdir $DEFAULT_DIR
fi
}


#Get Data From User Such as username, Password, Link:
function getData(){
unset USERNAME 
unset PASSWORD
unset LINK

echo -e -n "\nEnter Plural Username: "
read USERNAME  

echo -e "\nEnter Plural Password:"
prompt="password:"
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
         break
    fi
    prompt='*'
    PASSWORD+="$char"
done

echo -e "\n\nSelect Download Method:\n1)Download Via Link\n2)Download Via List Link"
read DOWNLOAD_METHOD

}

#Set Socks5 Proxy:
function PROXY(){
echo -e -n "\nDo You Want Set Proxy? (y/n):  "
read PROXY_METHOD
}

#Commands:
echo -e "\nInsert Download Directory or Press Enter To Continue as Default"
echo -e "Default Directory is: $HOME/pluralsite"
read DEFAULT_DIR
MKDIR
PROXY
getData


case $PROXY_METHOD in
    y) 
        echo -e -n "\nEnter Proxy Address: "
        read IP
        echo -e -n "\nEnter Proxy Port: "
        read PORT
        PROXY_ADDR=$IP:$PORT
        export HTTPS_PROXY=$PROXY_ADDR
        export HTTP_PROXY=$PROXY_ADDR
        export ALL_PROXY=$PROXY_ADDR
        curl ident.me
    ;;
    n)
        unset HTTPS_PROXY
        unset HTTP_PROXY
        unset ALL_PROXY
    ;;
esac



case $DOWNLOAD_METHOD in
    1) 
        echo -e "\nEnter Course Link:"
        read LINK
        youtube-dl --username "$USERNAME" --password "$PASSWORD" -o  "$DEFAULT_DIR/%(playlist)s/%(chapter_number)s - %(chapter)s/%(playlist_index)s - %(title)s.%(ext)s" --sleep-interval 120  --playlist-start 1 --all-subs "$LINK"
    ;;
    2) 
        echo -e "\nEnter Linki List Name:"
        read LINK
        youtube-dl --username "$USERNAME" --password "$PASSWORD" -o  "$DEFAULT_DIR/%(playlist)s/%(chapter_number)s - %(chapter)s/%(playlist_index)s - %(title)s.%(ext)s" --sleep-interval 120  --playlist-start 1 --all-subs -a "$LINK"
    ;;
esac




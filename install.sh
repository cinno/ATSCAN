#!/bin/bash
echo "[ ]====================================================================[ ]";
echo "[ ]                     ALISAM  TECHNOLOGY                             [ ]";
echo "[ ]                  Atscan Tool Install Script                        [ ]";
echo "[ ]====================================================================[ ]";
echo "";
if [ -d "/usr/bin/" ] ;
then
echo "[!] Install.sh install atscan tool in your system? [Y/n]: ";
read baba
if [ $baba == "y" ] ; 
  then
    echo " "
  else
    echo "[!] Installation canceled!";
    exit
fi
current=`pwd`
echo "[!] ATSCAN will be installed in $current Set other path OR press Enter to continue: ";
read refdir
echo "[!] Checking directories..."
if [ -d "$refdir/ATSCAN" ] ;
then
echo "[!] A directory named ATSCAN was found in $refdir/ATSCAN! Do you want to replace it? [Y/n]: ";
read mama
if [ $mama == "y" ] ; 
then
 rm -R "$refdir/ATSCAN"
else
 echo "[!] Installation canceled!";
 exit
fi
fi

 echo "[!] Installing ...";
 echo "";
 git clone https://github.com/AlisamTechnology/ATSCAN.git $refdir/ATSCAN;
 echo "#!/bin/bash 
 perl $refdir/ATSCAN/atscan.pl" '${1+"$@"}' > atscan;
 chmod +x atscan;
 sudo cp atscan /usr/bin/;
 rm atscan;

if [ -d "$refdir/ATSCAN" ] ;
then
echo "";
echo "Tool istalled with success!";
echo "";
  echo "[ ]====================================================================[ ]";
  echo "[ ]     All is done!! You can execute Atscan by typing atscan !        [ ]"; 
  echo "[ ]====================================================================[ ]";
  echo "";
else
  echo "[!] Installation faid!! ";
  exit
fi
else
echo "Tool can be installed only in linux os! Use it as portable!";
fi

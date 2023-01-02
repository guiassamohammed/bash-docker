if [ "$1" == "--create" ];then
   echo ""  
   echo "our option is create" 

   
   Container_number=1 
   [  "$2" != "" ] && Container_number=$2
     min=1
     max=0
     idmax=`docker ps -a --format '{{ .Names}}' | awk -F "-" -v user="$USER" '$0 ~ user"-alpine" {print $3}' | sort -r |head -1`
     min=$(($idmax + 1))
     max=$(($idmax + $Container_number))     

       for i in $(seq $min $max); do 
            docker run -tid --name $USER-alpine-$i alpine:latest
       done

         echo "The number of the created container are $Container_number"

elif  [ "$1" == "--drop" ];then 
      echo ""
      echo "Our option is to delete containers for our user "
      
       
      docker rm -f $(docker ps -a | grep $USER)
 
      sleep  2 
      echo "verify if the containers have been deleted ...."
      docker ps  
fi 

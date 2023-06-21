#!/bin/bash
let res_count=0
while read r; do
   echo "Scanning region $r ..." 
   while read p; do
      res=$(aws configservice list-discovered-resources --resource-type "$p" --region "$r" | grep "resourceType" | wc -l)
      echo "$p count =$res"
      let "res_count = $res_count + $res"
   done < resources.aws.list
done < regions.aws.list 
echo "total number of resources is $res_count"
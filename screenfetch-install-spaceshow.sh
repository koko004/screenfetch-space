apt-get install screenfetch
totaldisk=$(df -h -x aufs -x tmpfs -x overlay -x drvfs --total 2>/dev/null | tail -1)
echo $totaldisk
disktotal=$(awk '{print $2}' <<< "${totaldisk}")
diskused=$(awk '{print $3}' <<< "${totaldisk}")                                                                                
diskusedper=$(awk '{print $5}' <<< "${totaldisk}")                                                                          
diskusage="${diskused} / ${disktotal} (${diskusedper})"                                                                
diskusage_verbose=$(sed 's/%/%%/' <<< "$diskusage")
echo $diskused
echo $disktotal
echo $diskusedper
echo $diskusage_verbose
mydisk=$(echo -e "$labelcolor Disk:$textcolor $diskusage")
echo $mydisk
screenfetch -d '+disk'

echo "nano ~/.bashrc y anadir al final screenfetch -d '+disk'"

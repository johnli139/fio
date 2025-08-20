#!/bin/bash

TIME=300                                 # время замера одного профиля
SLEEP=10                                 # пауза между замерами
FILE=/data1/fio                          # имена файлов для тестирования - разделитель файлов ":"
SIZE=100g
#FILE=/data1/fio:/data2/fio
#FILE=/data1/fio:/data2/fio:/data3/fio
#FILE=/data1/fio:/data2/fio:/data3/fio:/data4/fio
NUMJOBS=32                               # кол-во параллельных задач (процессов) 
IODEPTH=128				# кол-во IO, посылаемых в ОС без подтверждения их получения от ОС

ID=$(date +%s)
OUT="./$ID-$(hostname).csv"
if [ -f "$OUT" ]; then
   rm -f $OUT
fi

echo Hostname,$(hostname) >> $OUT
echo Date,$(date +%d.%m.%Y" "%H:%M:%S) >> $OUT
echo Fio version,$(fio --version) >> $OUT
echo >> $OUT
echo lsblk output: >> $OUT
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,FSTYPE -i >> $OUT
echo >> $OUT
echo TESTED FILES,TEST TIME,BLOCK SIZE,PROFILE,IODEPTH,NUMJOBS,,IOPS,THROUGHPUT MiB/s,LATENCY >> $OUT

#---------------------32K-RANDWRITE-----------------------------------------------------------------------------#
BS=32k                                  # размер блока
RW=radnwrite                            # тип теста: randread/randwrite/read/write
NAME=$ID-$BS-$RW-$IODEPTH-$NUMJOBS      # имя выходного файла

  fio \
  --size=$SIZE \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=$FILE \
  --bs=$BS \
  --rw=$RW \
  --iodepth=$IODEPTH \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt

echo $FILE,$TIME,$BS,$RW,$IODEPTH,$NUMJOBS,,\
$(awk -F "=" '/IOPS=/  { print  $2 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F "=" '/IOPS=/  { print  $3 }' ./out/$NAME.txt | awk -F "M" ' { print $1 }'),\
$(awk -F "=" '/\slat.*avg/  { print  $4 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F"(" '/\slat.*avg/ { print $2}' ./out/$NAME.txt | awk -F")" ' { print $1 }') >> $OUT
sleep $SLEEP  

#---------------------32K-RANDREAD-----------------------------------------------------------------------------#
BS=32k                                  # размер блока
RW=randread                             # тип теста: randread/randwrite/read/write
NAME=$ID-$BS-$RW-$IODEPTH-$NUMJOBS      # имя выходного файла

  fio \
  --size=$SIZE \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=$FILE \
  --bs=$BS \
  --rw=$RW \
  --iodepth=$IODEPTH \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt

echo $FILE,$TIME,$BS,$RW,$IODEPTH,$NUMJOBS,,\
$(awk -F "=" '/IOPS=/  { print  $2 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F "=" '/IOPS=/  { print  $3 }' ./out/$NAME.txt | awk -F "M" ' { print $1 }'),\
$(awk -F "=" '/\slat.*avg/  { print  $4 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F"(" '/\slat.*avg/ { print $2}' ./out/$NAME.txt | awk -F")" ' { print $1 }') >> $OUT
sleep $SLEEP  

#---------------------4K-RANDWRITE-----------------------------------------------------------------------------#
BS=4k                                   # размер блока
RW=randwrite                            # тип теста: randread/randwrite/read/write
NAME=$ID-$BS-$RW-$IODEPTH-$NUMJOBS      # имя выходного файла

  fio \
  --size=$SIZE \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=$FILE \
  --bs=$BS \
  --rw=$RW \
  --iodepth=$IODEPTH \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt

echo $FILE,$TIME,$BS,$RW,$IODEPTH,$NUMJOBS,,\
$(awk -F "=" '/IOPS=/  { print  $2 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F "=" '/IOPS=/  { print  $3 }' ./out/$NAME.txt | awk -F "M" ' { print $1 }'),\
$(awk -F "=" '/\slat.*avg/  { print  $4 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F"(" '/\slat.*avg/ { print $2}' ./out/$NAME.txt | awk -F")" ' { print $1 }') >> $OUT
sleep $SLEEP  

#---------------------4K-RANDREAD-----------------------------------------------------------------------------#
BS=4k                                   # размер блока
RW=randread                             # тип теста: randread/randwrite/read/write
NAME=$ID-$BS-$RW-$IODEPTH-$NUMJOBS      # имя выходного файла

  fio \
  --size=$SIZE \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=$FILE \
  --bs=$BS \
  --rw=$RW \
  --iodepth=$IODEPTH \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt

echo $FILE,$TIME,$BS,$RW,$IODEPTH,$NUMJOBS,,\
$(awk -F "=" '/IOPS=/  { print  $2 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F "=" '/IOPS=/  { print  $3 }' ./out/$NAME.txt | awk -F "M" ' { print $1 }'),\
$(awk -F "=" '/\slat.*avg/  { print  $4 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F"(" '/\slat.*avg/ { print $2}' ./out/$NAME.txt | awk -F")" ' { print $1 }') >> $OUT
sleep $SLEEP  

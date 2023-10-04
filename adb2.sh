#!/bin/bash

TIME=10                                   # время замера одного профиля
SLEEP=1                                   # пауза между замерами
FILE=/data8/fio        # имена файлов для тестирования - разделитель ":", необходимо указывать файл для каждой mountpoint
IODEPTH=1                                # кол-во IO, посылаемых в ОС без подтверждения их получения от ОС
NUMJOBS=64                                # кол-во параллельных задач (процессов) 

OUT="./$(hostname).csv"
if [ -f "$OUT" ]; then
   rm -f $OUT
fi

echo Test date,$(date) >> $OUT
echo Test runtime,$TIME >> $OUT
echo Test file,$FILE >> $OUT
echo >> $OUT
echo BLOCK SIZE,PROFILE,IODEPTH,NUMJOBS,,IOPS,THROUGHPUT,LATENCY >> $OUT

#---------------------512K-read----------------------------------------------------------------------------#
  BS=512k                                    # размер блока
  RW=read                                  # тип теста: randread/randwrite/read/write
  NAME=$BS-$RW-$IODEPTH-$NUMJOBS          # имя выходного файла

  fio \
  --size=10g \
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

echo $BS,$RW,$IODEPTH,$NUMJOBS,,\
$(awk -F "=" '/IOPS=/  { print  $2 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F "=" '/IOPS=/  { print  $3 }' ./out/$NAME.txt | awk -F "M" ' { print $1 }'),\
$(awk -F "=" '/\slat.*avg/  { print  $4 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F"(" '/\slat.*avg/ { print $2}' ./out/$NAME.txt | awk -F")" ' { print $1 }') >> $OUT
sleep $SLEEP  

#---------------------512K-write----------------------------------------------------------------------------#
  BS=512k                                    # размер блока
  RW=write                                  # тип теста: randread/randwrite/read/write
  NAME=$BS-$RW-$IODEPTH-$NUMJOBS          # имя выходного файла

  fio \
  --size=10g \
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

echo $BS,$RW,$IODEPTH,$NUMJOBS,,\
$(awk -F "=" '/IOPS=/  { print  $2 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F "=" '/IOPS=/  { print  $3 }' ./out/$NAME.txt | awk -F "M" ' { print $1 }'),\
$(awk -F "=" '/\slat.*avg/  { print  $4 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F"(" '/\slat.*avg/ { print $2}' ./out/$NAME.txt | awk -F")" ' { print $1 }') >> $OUT
sleep $SLEEP  

#---------------------32K-read----------------------------------------------------------------------------#
  BS=32k                                    # размер блока
  RW=read                                  # тип теста: randread/randwrite/read/write
  NAME=$BS-$RW-$IODEPTH-$NUMJOBS          # имя выходного файла

  fio \
  --size=10g \
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

echo $BS,$RW,$IODEPTH,$NUMJOBS,,\
$(awk -F "=" '/IOPS=/  { print  $2 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F "=" '/IOPS=/  { print  $3 }' ./out/$NAME.txt | awk -F "M" ' { print $1 }'),\
$(awk -F "=" '/\slat.*avg/  { print  $4 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F"(" '/\slat.*avg/ { print $2}' ./out/$NAME.txt | awk -F")" ' { print $1 }') >> $OUT
sleep $SLEEP  

#---------------------32K-write----------------------------------------------------------------------------#
  BS=32k                                    # размер блока
  RW=write                                  # тип теста: randread/randwrite/read/write
  NAME=$BS-$RW-$IODEPTH-$NUMJOBS          # имя выходного файла

  fio \
  --size=10g \
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

echo $BS,$RW,$IODEPTH,$NUMJOBS,,\
$(awk -F "=" '/IOPS=/  { print  $2 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F "=" '/IOPS=/  { print  $3 }' ./out/$NAME.txt | awk -F "M" ' { print $1 }'),\
$(awk -F "=" '/\slat.*avg/  { print  $4 }' ./out/$NAME.txt | awk -F "," ' { print $1 }'),\
$(awk -F"(" '/\slat.*avg/ { print $2}' ./out/$NAME.txt | awk -F")" ' { print $1 }') >> $OUT
sleep $SLEEP  

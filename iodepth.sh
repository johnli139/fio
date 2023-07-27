#!/bin/bash
                                        # в качестве изменяемой переменной используется кол-во параллельных потоков (numjobs)
TIME=60                                 # время замера одного профиля
SLEEP=5                                 # пауза между замерами
DISK=/dev/vdb                           # имена дисков для тестирования - разделитель ":"
NUMJOBS=1                               # кол-во параллельных задач (процессов)
MAXIODEPTH=256                          # макс. кол-во IO, посылаемых в ОС без подтверждения их получения от ОС

# -------- №1 -- bloсk=4K -- 100% random read -----------------------
for ((p=1; p<=7; p++))
do
  NAME=4k-randread-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=4k \
  --rw=randread \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXIODEPTH`
do
  NAME=4k-randread-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=4k \
  --rw=randread \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# -------- №2 -- block=4K -- 100% random write -----------------------
for ((p=1; p<=7; p++))
do
  NAME=4k-randwrite-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=4k \
  --rw=randwrite \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXIODEPTH`
do
  NAME=4k-randwrite-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=4k \
  --rw=randwrite \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# -------- №3 -- block=64K -- 100% sequential read -----------------------
for ((p=1; p<=7; p++))
do
  NAME=64k-read-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=64k \
  --rw=read \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXIODEPTH`
do
  NAME=64k-read-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=64k \
  --rw=read \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# -------- №4 -- block=64K -- 100% sequential write -----------------------
for ((p=1; p<=7; p++))
do
  NAME=64k-write-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=64k \
  --rw=write \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXIODEPTH`
do
  NAME=64k-write-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=64k \
  --rw=write \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# -------- №5 -- block=32K -- 100% sequential read -----------------------
for ((p=1; p<=7; p++))
do
  NAME=32k-read-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=32k \
  --rw=read \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXIODEPTH`
do
  NAME=32k-read-$p-$NUMJOBS
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
  --filename=$DISK \
  --bs=32k \
  --rw=read \
  --iodepth=$p \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

#!/bin/bash
                                        # в качестве изменяемой переменной используется кол-во параллельных потоков (numjobs)
TIME=60                                 # время замера одного профиля
SLEEP=5                                 # пауза между замерами
DISK=/dev/vdb                           # имена дисков для тестирования - разделитель ":"
IODEPTH=1                               # кол-во IO, посылаемых в ОС без подтверждения их получения от ОС
MAXNUMJOBS=256                          # макс. кол-во параллельных задач (процессов), д.б. кратно 8, рекомендуемые значения от 32 до 256

# -------- №1 -- bloсk=4K -- 100% random read -----------------------
for ((p=1; p<=7; p++))
do
  NAME=4k-randread-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXNUMJOBS`
do
  NAME=4k-randread-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# -------- №2 -- block=4K -- 100% random write -----------------------
for ((p=1; p<=7; p++))
do
  NAME=4k-randwrite-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXNUMJOBS`
do
  NAME=4k-randwrite-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# -------- №3 -- block=64K -- 100% sequential read -----------------------
for ((p=1; p<=7; p++))
do
  NAME=64k-read-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXNUMJOBS`
do
  NAME=64k-read-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# -------- №4 -- block=64K -- 100% sequential write -----------------------
for ((p=1; p<=7; p++))
do
  NAME=64k-write-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXNUMJOBS`
do
  NAME=64k-write-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# -------- №5 -- block=32K -- 100% sequential read -----------------------
for ((p=1; p<=7; p++))
do
  NAME=32k-read-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXNUMJOBS`
do
  NAME=32k-read-$IODEPTH-$p
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
  --iodepth=$IODEPTH \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

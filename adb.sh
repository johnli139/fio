#!/bin/bash
                                        # в качестве изменяемой переменной используется кол-во параллельных потоков (numjobs)
TIME=60                                 # время замера одного профиля
SLEEP=5                                 # пауза между замерами
DISK=/dev/vdb                         # имена дисков для тестирования - разделитель ":"

BS=32k
RW=read
IODEPTH=32
NUMJOBS=32

  NAME=$BS-$RW-$IODEPTH-$NUMJOBS
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
  --bs=$BS \
  --rw=$RW \
  --iodepth=$IODEPTH \
  --numjobs=$NUMJOBS \
  --output=./out/$NAME.txt

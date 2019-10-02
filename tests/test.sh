#!/bin/bash

test() {

  vagrant up --provision

  vagrant ssh node2 -c "ping 192.168.100.12 -w 5"

  EXIT_VAL=$?

  vagrant destroy -f

  return $EXIT_VAL
}

test
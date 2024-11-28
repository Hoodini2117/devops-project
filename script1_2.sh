#!/bin/bash
echo "Top 10 CPU consuming processes:"
ps aux --sort=-%cpu | head -10
echo -e "\nTop 10 memory consuming processes:"
ps aux --sort=-%mem | head -10
echo -e "\nZombie processes:"
ps aux | awk '$8=="Z" {print}'

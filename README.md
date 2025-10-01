Для запуску скрипта необхідно виконати наступні кроки:

1) У файлі command.txt, в місцях пропусків, виділених символом "_" впишіть власні дані (--key-name, --security-group-ids, --iam-instance-profile)

У випадку з рядком "--user-data file://~/_ /user-data.sh", завантажте файл user-data.sh з репозиторію, а на місці пропуску (символа "_") вкажіть папку, куди розмістили завантажений user-data.sh

2) Скопіювати оновлений скрипт в Git Bash і виконати його

Далі, потрібно взяти Сonnection String з консолі AWS (EC2 > Instances > 'instance_name' > Connect > SSH Connection > ssh -i "key.pem" "ubuntu@your_instance_dns") і вписати в термінал

Пізля того, як опинитесь в терміналі AWS VM, використайте такі команди в терміналі:

1) sudo -i

2) vim /root/sysinfo.sh

3)
#!/bin/bash

{

  echo "===== System Info Report ====="
  
  date
  
  w
  
  free -m
  
  df -h
  
  ss -tulpn
  
  ping -c1 -w1 ukr.net && echo "OK" || echo "FAILED"
  
  find / -perm -4000 -type f 2>/dev/null
  
  echo "==============================="
  
  echo
  
} >> /var/log/sysinfo


:wq

4) chmod +x /root/sysinfo.sh

5) echo "* * * * 1-5 root /root/sysinfo.sh" >> /etc/crontab

6) /root/sysinfo.sh

7) tail -n 50 /var/log/sysinfo (або sudo tail -n 50 /var/log/sysinfo)

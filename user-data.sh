#!/bin/bash
apt update -y
apt install -y mc git vim apache2 cronie


systemctl enable crond
systemctl start crond
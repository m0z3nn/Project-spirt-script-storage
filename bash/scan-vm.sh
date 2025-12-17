echo "=== Скрипт для проверки доступности гипервизора ==="
#Ввод полного IP.
read -p "Введите IP адрес: " full_ip

#Разделение первых трех актетов от последенго.
ip="${full_ip%.*}"

#Назначение переменных.
for item in "10:IPMI " "11:SERVER " "13:DNS " "17:PXE " "19:REPO " "20:SHARE "; do
    octet="${item%:*}"
    name="${item#*:}"
    echo -n "Проверка доступности $ip.$octet $name"
    echo ""
#Пинг до хостов.
    if ping -c 1 -W 1 "$ip.$octet" &> /dev/null; then
        echo "$ip.$octet $name ✅ДОСТУПНА!"
        echo ""
    else 
        echo "$ip.$octet $name ❌НЕ ДОСТУПНА!"
        echo ""
    fi 
done
echo "=== Проверка доступности сервера завершена ==="

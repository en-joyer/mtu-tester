read -p "Baslangic MTU degeri: " baslangic_mtu
bitis_mtu=1420
for ((mtu = baslangic_mtu; mtu <= bitis_mtu; mtu++)); do
    echo "MTU degerini $mtu olarak degistiriliyor"
    sed -i "s/MTU = .*/MTU = $mtu/" wg0.conf
    sudo wg-quick down wg0
    sudo wg-quick up wg0
    sleep 30
    echo "MTU $mtu icin internet hizi:"
    speedtest
    echo "MTU $mtu, $(speedtest)" >> mtu.log
done
echo "Islem tamam."

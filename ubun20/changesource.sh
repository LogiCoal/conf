echo "deb https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list
echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse" >> /etc/apt/sources.list

apt-get update
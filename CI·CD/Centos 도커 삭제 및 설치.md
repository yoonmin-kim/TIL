```
(삭제)
$ sudo yum remove docker docker-common docker-selinux docker-engine 
$ sudo yum remove -y docker-ce docker-ce-cli

(도커 폴더삭제)
$ rm -rf /var/lib/docker

(yum-utils 업데이트)
$ yum install -y yum-utils

(docker-ce 레포 추가)
$ yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

(도커 설치)
$ yum install docker-ce docker-ce-cli containerd.io -y

(도커 시작 및 서비스 등록)
$ systemctl start docker
$ systemctl enable docker
$ systemctl status docker
```
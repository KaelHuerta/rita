# Instalaciones

## Ruby

~~~{bash}
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
~~~

Instalando el manejador `rbenv`.

~~~{bash}
cd ~/Downloads/bin
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/Downloads/bin/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/Downloads/bin/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/Downloads/bin/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

rbenv install 2.0.0-p451
rbenv global 2.0.0-p451
ruby -v
gem install bundler
~~~


## Java

Al ejecutar

~~~{bash}
sudo apt-get install openjdk-7-jdk
~~~

Lanzó el aviso de que `Java` está ya instalado y actualizado. Aún así, se siguió con las demás líneas de código.

~~~{bash}
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-7-openjdk-amd64/bin/java" 2
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/java-7-openjdk-amd64/bin/javac" 2
sudo update-alternatives --config java
cd /usr/lib/jvm
sudo rm default-java
sudo ln -s java-7-openjdk-amd64 default-java
~~~

Y parece no hubo problema alguno.

## VirtualBox

Instalando sobre la versión gráfica. Ojalá no truene algo.

~~~{bash}
sudo apt-get install virtualbox virtualbox-dkms virtualbox-guest-additions-iso virtualbox-guest-dkms virtualbox-guest-utils virtualbox-qt virtualbox-guest-x11
~~~

Desinstaló `virtualbox 4.3` y dejó la versión 4.2.16.
Probando usar las máquinas virtuales previamente creadas se congeló completamente la máquina.
Tras congelarse y dos reinicios que dijo la interfaz gráfica estaba corrupta, parece todo regresó a la normalidad.

## Vagrant

~~~{bash}
cd Downloads/bin/
wget -c https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.2_x86_64.deb
~~~

No funcionó con `-C`, debía ser minúscula para poder continuar una descarga fallida. Usado de esta forma es innecesario. Si se interrumpe la descarga, entonces es cuando debe agregarse para retomar la parte ya utilizada.

~~~{bash}
vagrant box add saucy64 http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box
mkdir vagrant-test
cd vagrant-test
vagrant init saucy64
vagrant up

vagrant status
vagrant ssh

vagrant suspend
vagrant status

vagrant destroy
~~~

Todas las pruebas fueron satisfactorias.


## Chef

Se creó el archivo `Gemfile`

~~~{bash}
cd ~/Downloads/bin/
mkdir hadoop-itam-2014/
touch Gemfile
~~~

Y se escribió en el...

~~~{bash}
source 'https://rubygems.org'

gem 'knife-solo', '0.3.0'
gem "chef", "~> 11.10.0"
gem 'chef-zero', '1.7.2'
gem "berkshelf", "~> 2.0.14"
~~~

## Arrancando una máquina virtual

En el directorio de `hadoop-itam-2014`

~~~{bash}
vagrant init saucy64
~~~

Tras crear y modificar el archivo `Vagrantfile`

~~~{bash}
vagrant up
vagrant ssh

# Dentro de la máquina virtual...
sudo locale-gen es_MX.UTF-8
sudo apt-get update
sudo apt-get install emacs24 zsh tmux
~~~

Después de que corriera sin errores...

~~~{bash}
sudo apt-get install -y cmake git-core git-svn subversion checkinstall build-essential dh-make debhelper ant ant-optional autoconf automake liblzo2-dev libzip-dev sharutils libfuse-dev reprepro libtool libssl-dev asciidoc xmlto ssh curl
sudo apt-get install -y devscripts
sudo apt-get build-dep pkg-config
~~~

Por último, se instalaron `Ruby` y `Java` en la máquina virtual siguiendo los pasos anteriores.


## Hadoop

Se realizó únicamente la descarga de

| ------- | ------- | --- |
| Archivo | Versión | URL |
| ------- | ------- | --- |
| Hadoop            | =2.2.0=  | [[http://hadoop.apache.org]]    |
| Pig               | =0.12.0= | [[http://pig.apache.org]]       |
| Hive and HCatalog | =0.12.0= | [[http://hive.apache.org]]      |
| HBase             | =0.96.1= | [[http://hbase.apache.org]]     |
| zookeeper         | =3.4.5=  | [[http://zookeeper.apache.org]] |
| Oozie             | =4.0.0=  | [[http://oozie.apache.org]]     |
| Sqoop             | =1.4.4=  | [[http://sqoop.apache.org]]     |
| Mahout            | =0.8.0=  | [[http://mahout.apache.org]]    |




| Left-Aligned  | Center Aligned  | Right Aligned |
| :------------ |:---------------:| -----:|
| col 3 is      | some wordy text | $1600 |
| col 2 is      | centered        |   $12 |
| zebra stripes | are neat        |    $1 |
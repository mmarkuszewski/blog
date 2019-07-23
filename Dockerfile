FROM ubuntu:18.04
RUN apt-get update && apt-get install -y vim nodejs g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev curl sudo gawk libpq-dev
#tworzenie użytkownika
RUN useradd -ms /bin/bash hosting &&  echo hosting:passwordhosting | chpasswd --crypt-method=SHA512 && adduser hosting sudo
USER hosting
WORKDIR /home/hosting
SHELL ["/bin/bash", "-cl"]
#rvm & ruby
RUN mkdir ~/.gnupg
RUN echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN source $HOME/.rvm/scripts/rvm
RUN $HOME/.rvm/bin/rvm install 2.6.3 --autolibs=read-only
RUN rvm use 2.6.3 && gem install bundler
#projekt
RUN mkdir /home/hosting/blog


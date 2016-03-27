FROM andrewdotnich/buildkite_agent_deis_client

MAINTAINER Andy Nicholson <andrew@anicholson.net>

RUN mkdir -p /opt

RUN apt-get update
RUN apt-get install -yy autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

WORKDIR /opt

RUN git clone https://github.com/rbenv/ruby-build.git

WORKDIR /opt/ruby-build
RUN ./install.sh
RUN ruby-build 2.2.4 /opt/ruby
RUN ln -s /opt/ruby/bin/* /usr/bin/
RUN gem install bundler foreman 

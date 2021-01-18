# frozen_string_literal: true

apt_repository 'emacs' do
  uri 'https://emacs.ganneff.de'
  distribution 'buster'
  components ['main']
  keyserver 'https://emacs.ganneff.de'
  key 'https://emacs.ganneff.de/lapt.key'
  deb_src true
end

apt_repository 'php' do
  uri 'https://packages.sury.org/php/'
  distribution 'buster'
  components ['main']
  keyserver 'https://packages.sury.org'
  key 'https://packages.sury.org/php/apt.gpg'
  deb_src true
end

%w[emacs-snapshot emacs-snapshot-el].each do |item|
  package item do
    action :install
  end
end

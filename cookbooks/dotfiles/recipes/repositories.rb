# frozen_string_literal: true

apt_repository 'php' do
  uri 'https://packages.sury.org/php/'
  distribution 'buster'
  components ['main']
  keyserver 'https://packages.sury.org'
  key 'https://packages.sury.org/php/apt.gpg'
  deb_src true
end

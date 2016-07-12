#
# Cookbook Name:: ssh
# Recipe:: client
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
control 'basic-3' do
  impact 0.5
  title '/etc/ssh should have limited access to 0755'
  desc '
    The OpenSSH configuration folder should have restricted
    access permissions. It is an important step towards making
    sure, that configuration files are only changed by
    priviledged users, while leaving them readable for the
    SSH client.
  '
  describe file('/etc/ssh') do
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('others') }
    it { should_not be_readable.by('others') }
  end
end

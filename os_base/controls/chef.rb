control 'chef-client-service' do
  title 'Check Chef-Client Service'
  desc	'Tests for Chef-Client Service'

  describe package('chef') do
    it { should be_installed }
    its('version') { should cmp >= '12.9.40' }
    its('version') { should cmp <= '12.9.42' }
  end

  describe file('/etc/chef/client.rb') do
    it { should exist }
    its('mode')	    { should cmp '0644' }
    its('owner')    { should eq 'root' }
  end

  describe file('/etc/chef/client.pem') do
    it { should exist }
    its('mode')	    { should cmp '0600' }
    its('owner')    { should eq 'root' }
  end
end

control 'nginx-package' do
  describe package('nginx') do
    it { should be_installed }
  end
end

control 'nginx-config' do
  describe file('/etc/nginx/nginx.conf') do
    it { should exist }
    its('owner') { should eq 'root' }
    its('mode') { should cmp '420' }
  end
end

control 'nginx-tls' do
  describe nginx do
    its('support_info') { should match /TLS/ }
  end
end

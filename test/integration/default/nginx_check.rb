control 'nginx-package' do
  describe package('nginx') do
    it { should be_installed }
  end
end

control 'nginx-service' do
  describe service('nginx') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

control 'nginx-config' do
  describe file('/etc/nginx/nginx.conf') do
    it { should exist }
    its('owner') { should eq 'root' }
    its('mode') { should cmp '420' }
  end
end

control 'nginx-port-listening' do
  describe port(80) do
    it { should be_listening }
    its('processes') {should include 'nginx'}
    its('protocols') { should include('tcp') }
    its('protocols') { should_not include('udp') }
  end
end

control 'nginx-tls' do
  describe nginx do
    its('support_info') { should match /TLS/ }
  end
end

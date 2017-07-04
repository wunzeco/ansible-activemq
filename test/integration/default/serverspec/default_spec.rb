require 'spec_helper'

describe package('activemq') do
  it { should be_installed }
end

%w(
  /opt/activemq
  /opt/activemq/conf
  /var/lib/activemq/data
  /opt/activemq/tmp
).each do |f|
  describe file(f) do
    it { should be_directory }
    it { should be_owned_by 'activemq' }
    it { should be_mode 775 }
  end
end

describe file("/var/log/activemq") do
  it { should be_directory }
  it { should be_owned_by 'activemq' }
  it { should be_mode 755 }
end

describe file("/etc/default/activemq") do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
end

describe file("/etc/init.d/activemq") do
  it { should be_symlink }
end

describe service('activemq') do
  it { should be_running }
end

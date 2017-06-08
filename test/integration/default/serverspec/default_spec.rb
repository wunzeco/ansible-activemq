require 'spec_helper'

describe package('activemq') do
  it { should be_installed }
end

%w(
  /etc/activemq/instances-available/main/activemq.xml
  /etc/activemq/instances-available/main/log4j.properties
).each do |f|
  describe file(f) do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_mode 644 }
  end
end

describe file("/etc/activemq/instances-enabled/main") do
  it { should be_symlink }
end

describe service('activemq') do
  it { should be_running }
end

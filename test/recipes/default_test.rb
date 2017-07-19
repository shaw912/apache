# # encoding: utf-8

# Inspec test for recipe apache::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

#unless os.windows?
#  describe user('root') do
#    it { should exist }
#    skip 'This is an example test, replace with your own test.'
#  end
#end

describe port(80) do
  it { should be_listening }
  its ('protocols') {should include 'tcp6'}
end

describe command('curl localhost')do
  its(:stdout) {should match(/Hello,NEW World!/)}
end

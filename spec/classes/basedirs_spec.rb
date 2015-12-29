	require 'spec_helper'

describe 'basedirs', :type => 'class' do
    
  context "Should create directory /opt" do
  
    it do
      should contain_file('/opt').with(
        'ensure'  => 'directory',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => 755,)
    end
    
  end

  context "Should create custom directories" do
    let(:params) {{ 
        "directories" => {
          "/opt/test" => {
            'ensure' => 'directory',
            'owner'  => 'root',
            'group'  => 'root',
            'mode'   => '755',
          },
          "/tmp/hosting" => {
            'ensure' => 'directory',
            'owner'  => 'hosting',
            'group'  => 'hosting',
            'mode'   => '755',
          }
        }

      }}
    it do
      should_not contain_file('/opt')
      should contain_file('/opt/test').with(
        'ensure'  => 'directory',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => 755,)
      should contain_file('/tmp/hosting').with(
        'ensure'  => 'directory',
        'owner'  => 'hosting',
        'group'  => 'hosting',
        'mode'   => 755,)
    end
    
  end
end

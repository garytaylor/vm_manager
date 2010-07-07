require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/../../../lib/v_m_manager/v_m/parallels_desktop'
describe VMManager::VM::ParallelsDesktop do
  it "Should find a VM using its uid" do
    vm.adapter.should_receive(:find_by_uid).and_return(VMManager::VM::ParallelsDesktop.new(:uid=>'df431147-1643-4959-9c28-c21b63c0f690',:status=>'running',:name=>'Test VM'))
    vm=VMManager::VM::ParallelsDesktop.find_by_uid('df431147-1643-4959-9c28-c21b63c0f690')
    vm.should be_an_instance_of VMManager::VM::ParallelsDesktop
    vm.uid.should eql('df431147-1643-4959-9c28-c21b63c0f690')
  end
  it "Should start a VM using its uid" do
    vm.adapter.should_receive(:find_by_uid).and_return(VMManager::VM::ParallelsDesktop.new(:uid=>'df431147-1643-4959-9c28-c21b63c0f690',:status=>'not started',:name=>'Test VM'))
    vm.adapter.should_receive(:start_vm).with('df431147-1643-4959-9c28-c21b63c0f690').and_return true
    vm=VMManager::VM::ParallelsDesktop.find_by_uid('df431147-1643-4959-9c28-c21b63c0f690')
    vm.should be_an_instance_of VMManager::VM::ParallelsDesktop
    vm.uid.should eql('df431147-1643-4959-9c28-c21b63c0f690')
    vm.start.should be true
  end
  it "Should stop a VM using its uid" do
    vm.adapter.should_receive(:find_by_uid).and_return(VMManager::VM::ParallelsDesktop.new(:uid=>'df431147-1643-4959-9c28-c21b63c0f690',:status=>'not started',:name=>'Test VM'))
    vm.adapter.should_receive(:start_vm).with('df431147-1643-4959-9c28-c21b63c0f690').and_return true
    vm=VMManager::VM::ParallelsDesktop.find_by_uid('df431147-1643-4959-9c28-c21b63c0f690')
    vm.should be_an_instance_of VMManager::VM::ParallelsDesktop
    vm.uid.should eql('df431147-1643-4959-9c28-c21b63c0f690')
    vm.stop.should be true
  end

end
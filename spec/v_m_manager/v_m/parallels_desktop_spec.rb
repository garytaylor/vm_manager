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
  it "Should get a list of snapshots using its uid" do
    vm.adapter.should_receive(:find_by_uid).and_return(VMManager::VM::ParallelsDesktop.new(:uid=>'df431147-1643-4959-9c28-c21b63c0f690',:status=>'not started',:name=>'Test VM'))
    vm.adapter.should_receive(:vm_snapshots).with('df431147-1643-4959-9c28-c21b63c0f690').and_return snapshots
    vm=VMManager::VM::ParallelsDesktop.find_by_uid('df431147-1643-4959-9c28-c21b63c0f690')
    vm.should be_an_instance_of VMManager::VM::ParallelsDesktop
    vm.uid.should eql('df431147-1643-4959-9c28-c21b63c0f690')
    vm.vm_snapshots.should have(snapshot.length).items
  end
  it "Should switch to a snapshot using the snapshot_switch method" do
    vm.adapter.should_receive(:find_by_uid).and_return(VMManager::VM::ParallelsDesktop.new(:uid=>'df431147-1643-4959-9c28-c21b63c0f690',:status=>'running',:name=>'Test VM'))
    vm.adapter.should_receive(:vm_snapshots).with('df431147-1643-4959-9c28-c21b63c0f690').and_return snapshots
    vm.adapter.should_receive(:vm_snapshot_switch).with('df431147-1643-4959-9c28-c21b63c0f690','27bf6c66-3210-43c1-99ea-5188a8338f1c')
    vm=VMManager::VM::ParallelsDesktop.find_by_uid('df431147-1643-4959-9c28-c21b63c0f690')
    vm.should be_an_instance_of VMManager::VM::ParallelsDesktop
    vm.uid.should eql('df431147-1643-4959-9c28-c21b63c0f690')
    vm.vm_snapshots.should have(snapshot.length).items

  end


  private
  def snapshots
    [{:virtual_machine_uid=>'df431147-1643-4959-9c28-c21b63c0f690',:uid=>'27bf6c66-3210-43c1-99ea-5188a8338f1c',:parent_uid=>nil}]
  end

end
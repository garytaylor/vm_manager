class VMManager::VM::ParallelsDesktop < VMManager::VM::Base
  self.adapter=VMManager::Adapter::ParallelsDesktop.new
  def self.remote(options={},&block)
    raise "Block is required" unless block_given?
    adapter=VMManager::Adapter::ParallelsDesktop.new(options)
    yield adapter
  end
  def self.local(options={},&block)
    raise "Block is required" unless block_given?
    adapter=VMManager::Adapter::ParallelsDesktop.new(options)
    yield adapter
  end
  def self.find_by_uid(uid,options)
    local_adapter = options[:adapter] || adapter
    result=local_adapter.find_by_uid(uid)
    result.nil? ? nil : new(result.merge(:adapter=>local_adapter))
  end
  def initialize(options={})
    self.uid=options[:uid]
    self.name=options[:name]
    self.ip=options[:ip]
    self.status=options[:status]
    self.adapter=options[:adapter]
  end
  def start
    adapter.start_vm(uid)
  end
  def stop
    adapter.stop_vm(uid)
  end
  def snapshots
    adapter.vm_snapshots(uid)
  end
  def snapshot_switch(snapshot_uid)
    adapter.vm_snapshot_switch(uid,snapshot_uid)
  end
 
end
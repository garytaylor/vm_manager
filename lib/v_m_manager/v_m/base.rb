class VMManager::VM::Base
  class_inheritable_accessor :adapter
  attr_accessor :uid,:name,:ip,:status, :adapter
  def self.find
    raise "The subclass must provide its own find method on the class"
  end
  def self.find_by_uid(uid)
    find(:first,:conditions=>{:uid=>uid})
  end
end
require File.dirname(__FILE__) + "/base.rb"
require 'net/ssh'
module VMManager
  module Adapter
    class ParallelsDesktop
      attr_accessor :remote, :url, :password
      def initialize(options={})
        super()
        if options.key?(:url)
          self.url=options[:url]
          self.password=options[:password] if options.key?(:password)
          self.remote=true
        else
         self.remote=false
        end
        self
      end
      def find_by_uid(uid)
        result=send_command('prlctl list -a')
        vms=[]
        result.scan(/\{#{uid}\}\s*(\w*)\s*(\-)\s*(.*?)$/im) do |status,ip,name|
          vms<<{:uid=>uid,:status=>status,:ip=>ip,:name=>name}
        end
        vms.empty? ? nil : vms.first
      end
      def start_vm(uid)
        vm=find_by_uid(uid)
        if vm.nil?
          return false
        else
          return true if vm[:status]=~/running/im
        end
        result=send_command("prlctl start #{uid}")
        result=~/The VM has been successfully started/im ? true : false
      end
      def stop_vm(uid)
        vm=find_by_uid(uid)
        if vm.nil?
          return false
        else
          return true unless vm[:status]=~/running/im
        end
        result=send_command("prlctl stop #{uid}")
        result=~/The VM has been successfully stopped/im ? true : false
      end
      def vm_snapshots(uid)
        vm=find_by_uid(uid)
        if vm.nil?
          return false
        else
          return false unless vm[:status]=~/running/im
        end
        result=send_command("prlctl snapshot-list #{uid}")
        results=[]
        r.scan(/(?:\{([^}]*)\})*\s*\*?\{([^}]*)\}/im) do |parent_uid,snap_uid|
          results<<{:uid=>snap_uid,:parent_uid=>parent_uid,:virtual_machine_uid=>vm_uid}
        end
        return results
      end
      def vm_snapshot_switch(uid,snapshot_uid)
        result=send_command("prlctl snapshot-switch #{uid} --id #{snapshot_uid}")
        result=~/successful/im ? true : false
      end


      private
      def send_command(cmd)
        if remote
          connection.exec!(cmd)
        else
          `#{cmd}`
        end
      end
      def connection
        if @_connection.nil?
          if(url=~/ssh:\/\/(.*?)@(.*)/)
            user=$1
            host=$2
            @_connection=Net::SSH.start(host,user,:password=>password)
          else
            raise "Invalid url #{url} given"
          end

        end
        @_connection

      end

    end
  end
end
require 'wXf/wXfui'

module WXf
module WXfassists
module Auxiliary
module MultiHosts   
  
  #
  # Global Options are created
  #
  def initialize(hash_info={})    
    super
      init_opts([
        WXf::WXfmod_Factory::OptString.new('RURLS', [true, 'Target addresses file', 'host_list.txt']),
      ])
      
      # Important to delete the RURL option
      delete_opts('RURL')
end
    
  
  #
  # This will very soon be able to do IP ranges but 
  # ...for now can only return the value of RURLS which is
  # ...essentially a file location
  #    
  def rurls
    line_array = []
    file = datahash['RURLS']
    if File.file?(file) and File.exist?(file)
      IO.foreach(file) do |line|
       line.chomp!
       if not line.empty?
        line_array.push(line)
       end
      end   
    end 
     return line_array
  end
  
  
  #
  # We want to null-ify rurl
  #
  def rurl
    nil
  end
 
  
     
end end end end 
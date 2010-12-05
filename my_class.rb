require 'rubygems'
require 'happymapper'
require 'field_management'
require 'ap'
require 'set'

class MyClass
  # include Client
  include FieldManagement
  
  def self.find(security = '')
    xml = <<-XML
    <security>
      <BDSA>1</BDSA>
      <BDSB>2</BDSB>
      <BDSC>3</BDSC>
      <EDSA>4</EDSA>
      <EDSB>5</EDSB>
      <EDSC>6</EDSC>
    </security>
    XML

    MyClass::Mapper.parse(xml)
  end
  
end

# Common
class MyClass
  add_fields(:common, 
    ['BDSA', Float, :low],
    ['BDSB', Float, :high],
    ['BDSC', Float, :vol]
  )
end

# Industry: Energy
class MyClass
  add_fields(:a, 
    ['EDSA', Float, :elow],
    ['EDSB', Float, :ehigh],
    ['EDSC', Float, :evol]
  )
end


class MyClass
  class Mapper
    include HappyMapper
    tag 'security'
    
    MyClass.fields(:common).each do |tuple|
      element tuple[2], tuple[1], :tag => tuple[0]
    end
  end
end

class MyClass
  class Mapper
    #include HappyMapper
    #tag 'security'
    
    MyClass.fields(:energy).each do |tuple|
      element tuple[2], tuple[1], :tag => tuple[0]
    end
  end
end
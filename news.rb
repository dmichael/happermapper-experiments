class News
  # include Client
  include FieldManagement
  
  def self.find(security = '')
    xml = <<-XML
    <news>
      <ABC>1</ABC>
      <XYZ>2</XYZ>
    </news>
    XML

    News::Mapper.parse(xml)
  end
end

# Common
class News
  add_fields(:common, 
    ['ABC', Float, :title]
  )
end

# Industry: Energy
class News
  add_fields(:a, 
    ['XYZ', Float, :body]
  )
end


class News
  class Mapper
    include HappyMapper
    tag 'news'
    
    News.fields.each do |tuple|
      element tuple[2], tuple[1], :tag => tuple[0]
    end
  end
end

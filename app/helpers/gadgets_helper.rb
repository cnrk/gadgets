module GadgetsHelper
  def covers(gadgets)
    covers = []
    gadgets.each do |gadget|
      image =  gadget.images.first ? gadget.images.first.file.large.url : ''
      covers << {"title" => gadget.name, "description" => gadget.description, "image" =>  image }
    end
    covers.to_json.html_safe
  end
end

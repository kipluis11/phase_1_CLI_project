#set up like a class
#responsible for talking with my api 
require 'pry'
class Api

    def self.summon_spells
        url = "https://www.dnd5eapi.co/api/spells"
        uri = URI(url)
        response = Net::HTTP.get(uri)
       data = JSON.parse(response)
        
        array_of_spells = data["results"][0..26]
        
        array_of_spells.each do |hash|
            Spell.new(hash["index"], hash["name"], hash["url"])  
            
        end
            
    end


    def self.spell_description(spell_instance)
        url = "https://www.dnd5eapi.co" + spell_instance.url
         #do steps 8-10, then test binding pry, then figure out how to access this info
         uri = URI(url)
         res = Net::HTTP.get(uri)
        dt = JSON.parse(res)
        
        description = dt["desc"]
        

    end
   
end

 
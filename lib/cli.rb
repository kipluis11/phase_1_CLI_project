#command line interface
#this is where the user interacts and also connects files together
class Cli

    def start
        puts "Hi Harry, you're a Wizard!"       #this is where the app starts and calls my API into the interface
        Api.summon_spells                       #also, starts the spell book method.
        self.spell_book
    end

    def spell_book
        puts "Would you like to practice some magic?"   #this starts the interaction with the user and gives them a choice 
        user_input = gets.strip.downcase                #continue or exit the app.  It also calls on the spell data needed to present choices.
        if user_input.downcase == "yes" || user_input.downcase == "y"
            sleep(1)
            puts "Summon the spell book!"
            display_spell_book_content
            ask_user_for_spell_choice
            
        else
            
            puts "BE GONE WITH YOU THEN!"
        end

    end

    def display_spell_book_content
        Spell.all.each.with_index do |spell, index|  #this method pulls the data from my @@all array and puts out the number and spell name. 
            
           puts "#{index + 1}. #{spell.name}"

        end
    end

    def ask_user_for_spell_choice
        index = gets.strip.to_i - 1
        max_limit = Spell.all.length        #this method set the limit of spells presented and also makes sure the user is selecting from the proper list. 
       
        until index.between?(0,max_limit)
            puts "Do you have the right book?  Please try your selection again."
            index = gets.strip.to_i - 1 
        end
        spell_instance = Spell.all[index]
        show_spell_details(spell_instance)
    end


    def show_spell_details(spell_instance)
        puts Api.spell_description(spell_instance)  #this method calls to the method in the API that gets the "description" data of each individual spell.
        sleep(2)                                    #it can do this by adding the specific url to the end of the original url to the API. 
        spell_book
    end
    
 
end
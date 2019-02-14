require 'rspec'

describe "Caesar cipher" do 
    it "can cipher a string with an arbitrary length" do 
        expect(Caesar.cipher("A",1)).to eq "B"
        expect(Caesar.cipher("AA",1)).to eq "BB"
        expect(Caesar.cipher("AAA",1)).to eq "BBB"
    end

    it "can cipher a string with an arbitrary offset" do 
        expect(Caesar.cipher("A",1)).to eq "B"
        expect(Caesar.cipher("A",2)).to eq "C"
        expect(Caesar.cipher("A",3)).to eq "D"
    end

    it "cipher is made with a ring" do 
        expect(Caesar.cipher("Z",1)).to eq "A"
    end

    it "passes the FreeCodeCamp tests" do
        expect(Caesar.cipher('FREE CODE CAMP',13)).to eq 'SERR PBQR PNZC'
        expect(Caesar.cipher('FREE PIZZA!',13)).to eq 'SERR CVMMN!'

    end

end

class Caesar   

    RING="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    def self.cipher(target, offset) 
        result= ''
        target.split('').each do |character|
            result += encrypt(character,offset)
        end
        result
    end

    def self.encrypt(character,offset) 
        character_position = RING.index(character)
        return character unless character_position/[A-Z]
#        return character if character_position == nil
        proposed_position = (character_position + offset)
        position = (proposed_position % RING.length)
        RING[position]
    end

end
require 'spec_helper'

RSpec.describe Ship do
    before(:each) do
        @cruiser = Ship.new("Cruiser", 3)
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@cruiser).to be_an_instance_of(Ship)
        end

        it 'has a name' do
            expect(@cruiser.name).to eq("Cruiser")
        end

        it 'has a length' do
            expect(@cruiser.length).to eq(3)
        end

        it 'has health' do
            expect(@cruiser.health).to eq(3)
        end
    end

    describe "#hit" do
        it 'hits the ship and takes a health point away' do
            @cruiser.hit
            expect(@cruiser.health).to eq(2)
            @cruiser.hit
            expect(@cruiser.health).to eq(1)
        end
    end

    describe '#sunk?' do
        it 'gives false if the ship has not been sunk' do
            expect(@cruiser.sunk?).to eq(false)
        end

        it 'gives true if the ship has been sunk' do
            @cruiser.hit
            @cruiser.hit
            @cruiser.hit
            expect(@cruiser.sunk?).to eq(true)
        end
    end
end

require 'spec_helper'

RSpec.describe Cell do
    before(:each) do
        @cell = Cell.new("B4")
        @cell_1 = Cell.new("B4")
        @cell_2 = Cell.new("C3")
        @cruiser = Ship.new("Cruiser", 3)
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@cell).to be_an_instance_of(Cell)
        end

        it 'has a coodinate' do
            expect(@cell.coordinate).to eq("B4")
        end

        it 'has a ship' do
            expect(@cell.ship).to eq(nil)
        end
    end

    describe '#empty?' do
        it 'has no ship' do
            expect(@cell.empty?).to eq(true)
        end

        it 'has a ship' do
            @cell.place_ship(@cruiser)
            expect(@cell.empty?).to eq(false)
        end
    end

    describe '#place_ship' do
        it 'places the ship in the cell' do
            expect(@cell.empty?).to eq(true)
            @cell.place_ship(@cruiser)
            expect(@cell.empty?).to eq(false)
            expect(@cell.ship).to eq(@cruiser)
        end
    end

    describe '#fire_upon' do
        it 'fires upon the ship and takes away a health point' do
            @cell.place_ship(@cruiser)
            expect(@cell.ship.health).to eq(3)
            @cell.fire_upon
            expect(@cell.ship.health).to eq(2)
        end
    end

    describe '#fired_upon?' do
        it 'returns true or false for if it has been hit' do
            @cell.place_ship(@cruiser)
            expect(@cell.fired_upon?).to eq(false)
            @cell.fire_upon
            expect(@cell.fired_upon?).to eq(true)
        end
    end

    describe '#render' do
        it 'show a hit' do
            @cell_1.place_ship(@cruiser)
            expect(@cell_1.render).to eq(".")
            @cell_1.fire_upon
            expect(@cell_1.render).to eq("H")
        end

        it 'show that the ship is in that cell' do
            @cell_2.place_ship(@cruiser)
            expect(@cell_2.render).to eq(".")
            expect(@cell_2.render(true)).to eq("S")
        end

        it 'show that the ship is hit' do
            @cell_2.place_ship(@cruiser)
            @cell_2.fire_upon
            expect(@cell_2.render).to eq("H")
        end

        it 'hit and sink the ship' do
            @cell_2.place_ship(@cruiser)
            @cruiser.hit
            @cruiser.hit
            @cell_2.fire_upon
            expect(@cruiser.sunk?).to eq(true)
            expect(@cell_2.render).to eq("X")
        end
    end

    describe '#sunk?' do
        it 'check if the ship is sunk' do
            @cell_2.fire_upon
            expect(@cruiser.sunk?).to eq(false)
        end
    end
end

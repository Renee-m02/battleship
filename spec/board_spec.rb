require 'spec_helper'

RSpec.describe Board do
    before(:each) do
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@board.cells).to be_a(Hash)
            expect(@board.cells.count).to eq(16)
        end
    end

    describe '#valid_coordinate?' do
        it 'can tell us if it is a valid coordinate' do
            expect(@board.valid_coordinate?("A1")).to eq(true)
            expect(@board.valid_coordinate?("A5")).to eq(false)
            expect(@board.valid_coordinate?("D4")).to eq(true)
            expect(@board.valid_coordinate?("E1")).to eq(false)
        end
    end

    describe '#valid_placement?' do
        it 'it returns false if number coordinates does not match length' do
            expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
            expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
            expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
        end
        it 'returns false if the coordinates are not consecutive' do
            expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
            expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
            expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
            expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
            expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
        end

        it 'cannot be placed on the diagonal' do
            expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
            expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
        end

        it 'is a valid placement' do
            expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
            expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be(true)
        end

    describe '#place a ship' do
        it 'can place a cruiser on the board' do
            cell_1 = @board.cells["A1"]
            cell_2 = @board.cells["A2"]
            cell_3 = @board.cells["A3"]

            @board.place(@cruiser, ["A1", "A2", "A3"])

            expect(cell_1.ship).to be (cruiser)
            expect(cell_2.ship).to be (cruiser)
            expect(cell_3.ship).to be (cruiser)
        end

        it 'can place a submarine on the board' do
            cell_4 = @board.cells["C1"]
            cell_5 = @board.cells["D1"]

            @board.place(@submarine, ["C1", "D1"])

            expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
        end
    end

    describe '#overlapping ships' do
        it 'checks ship placements to not overlap' do
            expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
        end
    end

    describe '#rendering the board' do
        it 'renders' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            @board.render

            expect(@board.render).to eq("1234 \nA... . \nB... . \nC... . \nD... = \n" )
        end 
                
        it 'renders true' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            @board.render(true)

            expect(@board.render(true)).to eq(" 1234 \nAS SS. \nB.... \nC.... \nD... - \n") 
            end
        end
    end

    #As we continue to add functionality to the game we will fire on Cells and amage their Ships. 
    #As we do this we need to add new tests for the render method so that it can render with hits, 
    #misses and sunken ships. 
require 'tdd'
require 'byebug'

describe "#dups" do
  it "returns [] for an empty array" do
    expect(dups([])).to eq([])
  end

  it "returns argument for array with only one element" do
    expect(dups([1])).to eq([1])
  end

  it "returns array of unique elements" do
    expect(dups([1, 2, 1, 3, 3]).sort).to eq([1, 2, 1, 3, 3].uniq.sort)
  end
 end

 describe "#two_sum" do
   it "returns [] for an empty array or array of length 1" do
     expect(two_sum([])).to eq([])
   end
   it "returns [] if no pairs exist" do
     expect(two_sum([1, 1, 2, 2])).to eq([])
   end
   it "returns pairs correctly ordered" do
     expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
   end
 end

 describe "#my_transpose" do
   it "returns arr if array either empty or contains one element" do
     expect(my_transpose([])).to eq([])
     expect(my_transpose([2])).to eq([2])
   end
   it "returns correctly transposed array" do
     expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7],[2, 5, 8]])
   end
   it "raise error if an array is not square" do
     expect{ my_transpose([[1, 2], [1]])}.to raise_error("Not a square")
   end
 end

describe "#stock_picker" do
  it "return nil if array length is less than two" do
    expect(stock_picker([])).to eq(nil)
    expect(stock_picker([3])).to eq(nil)
  end
  it "return nil if no profitable solution exists" do
    expect(stock_picker([15, 1])).to eq(nil)
  end
  it "returns days and prices in the correct order" do
    expect(stock_picker([15, 20, 10, 35])).to eq([2, 3])
    expect(stock_picker([100, 90, 13, 25])).to eq([2, 3])
    check = stock_picker([15, 20, 10, 35])
    expect([15, 20, 10, 35][check[0]]).to be < [15, 20, 10, 35][check[1]]
  end
  it "returns best possible solution" do
    expect(stock_picker([45, 60, 10, 35, 47])).to eq([2, 4])
  end
end

describe "Towers#initialize" do
  subject {Towers.new}
  it "create an array of decks of length 3" do
    expect(subject.towers.length).to eq(3)
  end
  it "fills first deck with disks" do
    expect(subject.towers[0].length).to eq(3)
  end
  it "left other decks empty" do
    check = subject.towers[1..2].all? {|el| el.empty?}
    expect(check).to be true
  end
end

describe "Towers#move" do
  subject {Towers.new}
  let(:user) {double('user')}

  it "Receive next move successfully from user" do
    allow('user').to receive(:get_input).and_return([0, 1])
  end
  context "#valid_move?" do
    it "Checks if move is valid for invalid move" do
      expect(subject.valid_move?(2, 1)).to be false
    end
    it "Check if move is valid for valid move" do
      expect(subject.valid_move?(0, 1)).to be true
    end
  end
  it "Moves element correctly" do
    allow('user').to receive(:get_input).and_return('0,1')
    subject.move(0,1)
    expect(subject.towers).to eq([[3,2],[1],[]])
  end
end

describe "Towers#won?" do
  subject {Towers.new}

  it "checks if game is won" do
    win_towers = [[], [], [3, 2, 1]]
    subject.towers = win_towers
    expect(subject.won?).to be true
  end
  it "check if game is not won" do
    loos_towers = [[3, 2], [], [1]]
    subject.towers = loos_towers
    expect(subject.won?).to be false
  end
end

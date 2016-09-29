require './lib/node'

describe Node do

  def all_identical?(array)
    array.all?{ |r| r == array.first }
  end

  context 'with an initial seed' do
    it 'behaves deterministically' do
      results = 10.times.map { Node.new(seed: 123).split.inspect(true) }
      expect(all_identical?(results)).to be true
    end
  end

  context 'without an initial seed' do
    it 'behaves randomly' do
      results = 10.times.map { Node.new().split.inspect(true) }
      expect(all_identical?(results)).to be false
    end
  end

  context 'with a preset divisor' do
    it 'always generates the correct splits' do
      node = Node.new(width: 100, height: 100, divisor: 2).split
      expect(node.children.all?{ |c| c.width == 50 || c.width == 100 }).to be true
    end
  end

  context 'with child nodes' do
    xit 'still behaves deterministically' do
      # right now, we reset the seed every time a node is initialized.
      # we shouldn't do that...
    end

    it 'should inherit a preset divisor from its parent'
  end
end
